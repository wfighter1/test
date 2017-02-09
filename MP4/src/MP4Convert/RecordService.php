<?php
namespace Quanshi\MP4Convert;


class RecordService
{

    public function __construct()
    {

    }

	
	
    /**
     *
     * @param $local_base
     * @param $env
     * @param $conference_id
     * @return string
     */
    public static function getLocalPath($local_base, $env, $conference_id)
    {
        return $local_base . "/mpsdir_{$env}_{$conference_id}";
    }


    /**
     * 从时间轴XML文件中获取视频时长
     * @param string $xml_path
     * @return int
     */
    public static function getTimeTotal($xml_path)
    {
        $doc = new \DOMDocument();
        $doc->load($xml_path); //读取xml文件
        $humans = $doc->getElementsByTagName( "timeline" );
        if (!$humans->item(0)) {
            return 0;
        }
        $time_total = $humans->item(0)->getAttribute('timeTotal');
        $time = intval($time_total);
        if ($time > 3600 * 24) {
            return 0;
        } else {
            return $time;
        }
    }

    /**
     * 生成录像播放时间轴文件
     *
     * @param string $resource
     * @param string $layout
     * @return array  [int $total_time, array $timeline]
     */
    public function buildTimeline($tempConferenceId, $resource, $layout)
    {
        $timeline = self::getResources($resource, $tempConferenceId);
        $events = self::getLayout($layout);
        list($record_start, $record_end) = self::getRecordTime($resource);
        foreach ($events as $t => $e) {
            if (isset($timeline[$t])) {
                $timeline[$t]['event'] = $e;
            } else {
                $timeline[$t] = ['event' => $e];
            }
        }
        ksort($timeline);

        $result = [];
        $status = [
            'view' => 0,
            'record_begin' => 0,
            'pause' => $record_start,
            'pause_time' => 0,
            'speaker' => 0,
            'sayer' => 0,
            'pattern' => 0,
            'mm_file' => '',
            'mm_playtime' => '',
            'mm_status' => '',
        ];
        $last_line = [];
        foreach ($timeline as $time => $line) {
            if (isset($line['event'])) { // alter status
                $e = $line['event'];
                switch($e['type']) {
                    case 'start':
                        if ($status['pause'] !== false) {
                            $pause_time = ($time / 1000.0) - $status['pause'];
                            $status['pause_time'] += max($pause_time, 0);
                            $status['pause'] = false;
                        }

                        $status['speaker'] = $e['speaker'];
                        $status['sayer'] = $e['curSayer'];
                        $status['pattern'] = $e['patten'];
                        $status['group_id'] = $e['curInst'];
                        $status['page_id'] = $e['curPage'];
                        $status['view'] = $e['curView'];

                        if(!empty($e['multiPlayStatus'])){
                            if($e['multiPlayStatus'] == 'play_normal' || $e['multiPlayStatus'] == 'play_from_stop'){
                                $status['mm_status'] = 1;
                            }else{
                                $status['mm_status'] = 2;
                            }
                            $status['mm_file'] = $e['multiFileName'];
                            $status['mm_playtime'] = $e['multiPlayTime'];
                        }
                        if(isset($e['commentId'])){
                            $status['comment_id'] = $e['commentId'];
                        }
                        break;
                    case 'pause':
                        $status['pause'] = $time / 1000.0;
                        break;
                    case 'data_show':
                        if($e['tabType'] == 0){//white board
                            $status['view'] = 4;
                            $status['group_id'] = $e['instId'];
                            $status['page_id'] = $e['curPg'];
                        }else if($e['tabType'] == 1){//doc
                            $status['view'] = 5;
                            $status['group_id'] = $e['instId'];
                            $status['page_id'] = $e['curPg'];
                        }
                        break;
                    case 'speaker_added':
                        $status['speaker'] = $e['userId'];
                        break;
                    case 'doc_turnpage':
                        $status['view'] = 5;
                        $status['group_id'] = $e['ID'];
                        $status['page_id'] = $e['currentPageID'];
                        break;
                    case 'whiteboard_turnpage':
                        $status['view'] = 4;
                        $status['group_id'] = $e['ID'];
                        $status['page_id'] = $e['currentPageID'];
                        break;
                    case 'sayer_added':
                        $status['sayer'] = $e['userId'];
                        break;
                    case 'sayer_removed':
                        $status['sayer'] = $e['curSayer'];
                        break;
                    case 'desktop_show':
                        $status['view'] = 3;
                        $status['group_id'] = $e['ID'];
                        break;
                    case 'none':
                        $status['view'] = 0;
                        break;
                    case 'patten_change':
                        $status['pattern'] = $e['patten'];
                        break;
                    case 'desktop_comment_show':
                        $status['view'] = 3;
                        $status['comment_id'] = $e['wbId'];
                        break;
                    case 'desktop_comment_close':
                        $status['comment_id'] = 0;
                        break;
                    case 'multi_media_inst_change':
                        $status['view'] = 6;
                        $status['mm_file'] = "wowza_record/{$tempConferenceId}/"  . $e['fileName'];
                        break;
                    case 'multimedia_show':
                        $status['view'] = 6;
                        break;
                    case 'multi_media_status_changed':
                        $status['view'] = 6;
                        if($e['state'] == 'play_normal' || $e['state'] == 'play_from_stop'){
                            $status['mm_status'] = 1;
                        }else{
                            $status['mm_status'] = 2;
                        }
                        $status['mm_playtime'] = floatval($e['playedTime']);
                        break;
                    case 'video_show':
                    case 'video_instance_added':
                    case 'role23_added':
                    case 'role23_removed':
                    default:
                        continue;
                }
            }
            unset($line['event']);


            // add timeline
            $row = ['l' => 0, 'ls' => []];
            if (empty($line)) {
                $line = $last_line;
            }
            foreach ($line as $item) {
                switch ($item['type']) {
                    case 258: // audio
                        $row['a'] = $item['movie_file'];
                        $row['s'] = round($time / 1000.0 - $item['movie_start'], 3);
                        break;
                    case 259: // video
                        $video = [
                            'u' => $item['movie_file'],
                            's' => round($time / 1000.0 - $item['movie_start'], 3),
                            't' => 259,
                            'w' => '',
                            'n' => $item['movie_name'],
                            'r' => 6,
                        ];
                        if ($status['speaker'] != 0 && $status['speaker'] == $item['user_id']){
                            $video['r'] = 5;
                        } else if($status['sayer'] != 0 && $status['sayer'] == $item['user_id']){
                            $video['r'] = 21;
                        }
                        $row['ls'][] = $video;
                        break;
                    case 775: // white board
                        if ($status['view'] == 4 && $status['group_id'] == $item['group_id'] && $status['page_id'] == $item['page_id']) {
                            $board = [
                                'u' => $item['movie_file'],
                                's' => round($time / 1000.0 - $item['movie_start'], 3),
                                't' => 775,
                                'w' => '',
                                'ws' => 0,
                            ];
                            if (isset($item['comment_file'])) {
                                $board['w'] = $item['comment_file'];
                                $board['ws'] = round($time / 1000.0 - $item['comment_start'], 3);
                            }
                            $row['ls'][] = $board;
                        }
                        break;
                    case 776: // document share
                        if ($status['view'] == 5 && $status['group_id'] == $item['group_id'] && $status['page_id'] == $item['page_id']) {
                            $doc = [
                                'u' => $item['movie_file'],
                                's' => round($time / 1000.0 - $item['movie_start'], 3),
                                't' => 776,
                                'w' => '',
                                'ws' => 0,
                            ];
                            if (isset($item['comment_file'])) {
                                $doc['w'] = $item['comment_file'];
                                $doc['ws'] = round($time / 1000.0 - $item['comment_start'], 3);
                            }
                            $row['ls'][] = $doc;
                        }
                        break;
                    case 777: // desktop
                        if ($status['view'] != 0) {
                            $desktop = [
                                'u' => $item['movie_file'],
                                's' => round($time / 1000.0 - $item['movie_start'], 3),
                                't' => 777,
                                'w' => '',
                                'ws' => 0,
                            ];
                            if (isset($item['comment_file'])) {
                                $desktop['w'] = $item['comment_file'];
                                $desktop['ws'] = round($time / 1000.0 - $item['comment_start'], 3);
                            }
                            $row['ls'][] = $desktop;
                        }
                        break;
                    default:
                        break;
                }
            }
            if ($status['view'] == 6) { // multimedia
                $row['ls'][] = [
                    'u' => $status['mm_file'],
                    's' => $status['mm_playtime'],
                    't' => 8199,
                    'w' => '',
                    'st' => $status['mm_status'],
                ];
            }
            if (isset($row['a']) && $status['pause'] === false) {
                $offset = $time - intval($status['pause_time'] * 1000);
                $result[$offset] = $row;
            }
            $last_line = $line;
        }

        $total_time = round($record_end - $record_start - $status['pause_time'], 3);
        return [$total_time, $result];
    }


    public function writeXml($path, $timeline, $total_time)
    {
        $x = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        $x .= "<root>\n";
        $x .= "<timeline timeTotal=\"{$total_time}\">\n";

        $begin = 0;
        ksort($timeline);
        foreach ($timeline as $time => $r) {
            if ($begin == 0) $begin = $time;
            $stime = round(($time - $begin) / 1000.0, 1);
            $data = json_encode($r);
            $x .= "<point time=\"{$stime}\" data='{$data}' />\n";
        }

        $x .= "</timeline>\n";
        $x .= "</root>\n";
        file_put_contents($path, $x);
    }

    /**
     * 根据录像资源config.xml文件，生成录像资源时间轴
     *
     * @param string $resource
     * @param int $tempConferenceId
     * @return array
     */
    private function getResources($resource, $tempConferenceId)
    {
        $xml = simplexml_load_file($resource);
        $film = $xml->Film;

        $timeline = array();
        foreach($film->Service as $service) {
            $type = intval($service['type']);
            if(!isset($service->Movie)) {
                continue;
            }

            foreach($service->Movie as $movie) {
                foreach ($movie->Display->DisplayItem as $d) {
                    $start = self::ms($d['startTime']);
                    $end = self::ms($d['endTime']);
                    if ($start < self::ms((string)$movie['startTime'])) {
                        $start = self::ms((string)$movie['startTime']);
                    }
                    $line = [
                        'type' => $type,
                        'user_id' => (string)$movie['userID'],
                        'movie_start' => self::ms((string)$movie['startTime']),
                        'movie_end' => self::ms((string)$movie['endTime']),
                        'movie_file' => $tempConferenceId . '/1/' . (string)$movie['src'],
                        'movie_name' => self::getMovieName($movie),
                        'group_id' => (string)$movie['groupID'],
                        'page_id' => (string)$movie['pageID'],
                        'start' => $start,
                        'end' => $end,
                        'file' => isset($d['fileName']) ? $tempConferenceId . '/1/' . (string)$d['fileName'] : '',
                    ];

                    if (isset($movie->CommentDisplay) && isset($movie->CommentDisplay->DisplayItem)) {
                        $added = false;
                        foreach ($movie->CommentDisplay->DisplayItem as $c) {
                            $comment_start = self::ms((string)$c['startTime']);
                            $comment_end = self::ms((string)$c['endTime']);
                            if ($comment_start < $end && $comment_end > $start) {
                                if ($comment_start > $start) {
                                    $line['start'] = $comment_start;
                                }
                                $added = true;
                                $line['comment_start'] = $comment_start;
                                $line['comment_end'] = $comment_end;
                                $line['comment_file'] = $tempConferenceId . '/1/' . (string)$c['fileName'];
                                $timeline[] = $line;
                            } else {
                                continue;
                            }
                        }
                        if (!$added) {
                            $timeline[] = $line;
                        }
                    } else {
                        $timeline[] = $line;
                    }
                }
            }
        }

        usort($timeline, function($a, $b) {
            return $a['start'] > $b['start'] ? 1 : -1;
        });

        $result = [];
        $prev_line = [];
        foreach ($timeline as $line) {
            $current_time = $line['start'];
            foreach ($prev_line as $k => $pl) {
                if ($pl['end'] < $current_time || $pl['movie_end'] < $current_time ||
                        (isset($pl['comment_end']) && $pl['comment_end'] < $current_time)) {
                    unset($prev_line[$k]);
                }
            }
            $prev_line = array_merge($prev_line, [$line]);
            $prev_line = array_values($prev_line);
            $time = intval($line['start'] * 1000);
            $result[$time] = $prev_line;
        }
        return $result;
    }


    /**
     * @param $resource
     * @return array
     */
    private function getRecordTime($resource)
    {
        $xml = simplexml_load_file($resource);
        $record = $xml->Film->Record->RecordingItem;

        $start_time = self::ms((string)$record['startTime']);
        $end_time = self::ms((string)$record['endTime']);
        return [$start_time, $end_time];
    }

    /**
     *
     * @param $layout
     * @return array
     */
    private function getLayout($layout)
    {
        $fh = fopen($layout, "r");
        $prev="";
        $result = [];
        while (!feof($fh)) {
            $line = trim(fgets($fh));
            if ($line != $prev && $line !='') {
                $prev = $line;

                list($ts, $xml) = explode(":", $line);
                $time = intval(self::ms($ts) * 1000);
                $event = self::xml2array($xml);
                if(empty($event['layout']) || empty($event['layout']['type'])) {
                    continue;
                } else {
                    $result[$time] = $event['layout'];
                }
            }
        }
        fclose($fh);
        return $result;
    }

    /**
     *
     * @param string $microtime
     * @return string
     */
    private function ms($microtime) {
        return substr($microtime, 0, strlen($microtime) - 3) / 1000.0;
    }

    /**
     * @param $xml
     * @return array
     */
    private function xml2array($xml){
        $reg = "/<(\\w+)[^>]*?>([\\x00-\\xFF]*?)<\\/\\1>/";
        if (preg_match_all($reg, $xml, $matches)) {
            $count = count($matches[0]);
            $arr = array();
            for ($i = 0; $i < $count; $i++) {
                $key = $matches[1][$i];
                $val = $this->xml2array( $matches[2][$i] );  // 递归
                if (array_key_exists($key, $arr)) {
                    if (is_array($arr[$key])) {
                        if (!array_key_exists(0,$arr[$key])) {
                            $arr[$key] = array($arr[$key]);
                        }
                    } else {
                        $arr[$key] = array($arr[$key]);
                    }
                    $arr[$key][] = $val;
                } else {
                    $arr[$key] = $val;
                }
            }
            return $arr;
        } else {
            return $xml;
        }
    }

    /**
     * 视频名称存储在数据库中，因为录像中不现实，这里返回一个假的
     * @param $movie
     * @return string
     */
    private function getMovieName($movie)
    {
        return (string)$movie['name'];
    }


}