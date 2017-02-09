<?php
namespace Quanshi\MP4Convert;


use Psr\Log\LoggerInterface;
use Symfony\Component\Filesystem\Filesystem;

class ConvertService
{
    /**
     * @var string
     */
    private $local_path;

    /**
     * @var array
     */
    private $remote_path;

    /**
     * @var string
     */
    private $moyea_exe;

    /**
     * @var string
     */
    private $ffmpeg_exe;

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * ConvertService constructor.
     * @param string $moyea_exe
     * @param string $ffmpeg_exe
     * @param string $local_path
     * @param array $remote_path
     * @param LoggerInterface $logger
     */
    public function __construct($moyea_exe, $ffmpeg_exe, $local_path, $remote_path, LoggerInterface $logger)
    {
        $this->local_path = $local_path;
        $this->remote_path = $remote_path;
        $this->moyea_exe = $moyea_exe;
        $this->ffmpeg_exe = $ffmpeg_exe;
        $this->logger = $logger;
    }


    public function runTask($task)
    {
        $local_path = $this->copyResources($task);
        $this->convert($task, $local_path);
        $this->generateThumb($task, $local_path);
        $this->generateM3u8($task, $local_path);
        return true;
    }


    /**
     *
     * @return string
     */
    public function getLocalPath()
    {
        return $this->local_path;
    }

    private function  remove($local_path,$fs,$count){
        if($count>5){
            return;
        }else{
            $count++;
        }
        try {
            $fs->remove($local_path);
        } catch (\Exception $ex) {
            $this->remove($local_path,$fs,$count);
        }

    }
public function testTask()
    {
        $fs = new Filesystem();
        $local_path = $this->local_path.'\mpsdir_B_494191760';
        $this->logger->info("Local path: $local_path");
        if (file_exists($local_path)) {
            $this->logger->info("Local path exists");

            $this->remove($local_path,$fs,1);//$fs->remove($local_path);

        }else{
            mkdir($local_path, 0777, true);
        }
        
        //$fs->copy("d:/146677339612201.log", $local_path."/146677339612201.log");
        $fs->symlink("d:/235960064/1", $local_path.'/235960064/1', true);
    }


    /**
     * 准备本地视频资源文件目录，准备完成后可以直接打开RecordPlay.swf在播放器中正常播放会议录像
     *
     * @param array $task
     * @return bool
     */
    private function copyResources($task)
    {
        $fs = new Filesystem();
        $local_path = RecordService::getLocalPath($this->local_path, $task['environment'], $task['conference_id']);
        $this->logger->info("Local path: $local_path");
        if (file_exists($local_path)) {
            //$fs->remove($local_path);
            //删除目录会报错，先注释，修改其他$fs->copy第三个参数为true，覆盖原文件
        }else{
            mkdir($local_path, 0777, true);
        }

        $xml = <<<EOS
<?xml version="1.0" encoding="UTF-8"?>
<data>
    <mpsdir>{$local_path}/</mpsdir>
    <confid>{$task['temp_conference_id']}</confid>
</data>
EOS;
        file_put_contents($local_path . '/data.xml', $xml);
        $fs->copy(APP_ROOT. "/web/RecordPlay.swf", $local_path."/RecordPlay.swf");
        $fs->copy(APP_ROOT . "/web/framework_3.6.0.16995.swf", $local_path."/framework_3.6.0.16995.swf");

        // 复制视频文件
        $resource_path = $this->getResourcePath($task['environment'], $task['temp_conference_id'], $task['create_at']);
        $this->logger->debug("Copying to local path: $resource_path => $local_path ");
        $fs->symlink($resource_path.'/1', $local_path.'/'.$task['temp_conference_id'].'/1', true);

        $timeline_file = "{$local_path}/{$task['temp_conference_id']}/1/config.xml";
        $resource_file = "{$local_path}/{$task['temp_conference_id']}/1/resource.xml";
        $layout_file = "{$local_path}/{$task['temp_conference_id']}/1/layout.data";
        $fs->copy($timeline_file, $resource_file, true);
        $fs->chmod($local_path, 0777, 0000, true);

        // 生成时间轴文件
        $record = new RecordService();
        list($total_time, $timeline) = $record->buildTimeline($task['temp_conference_id'], $resource_file, $layout_file);
        $record->writeXml($timeline_file . '.test', $timeline, $total_time);
        // 复制时间轴文件
        $flash_xml = $this->getFlashXmlPath($task['environment'], $task['temp_conference_id'], $task['create_at']);
        $fs->copy($flash_xml, $timeline_file, true);

        //如果共享了多媒体文件，则还需要copy共享的多媒体文件
        $multimedia = $this->remote_path[$task['environment']] . "wowza_record/" . $task['temp_conference_id'];
        if (file_exists($multimedia)) {
            $local_multimedia = $local_path . "wowza_record/" . $task['temp_conference_id'];
            if (!mkdir($local_multimedia, 0777, true)) {
                return false;
            }
            $fs->symlink($multimedia, $local_multimedia, true);
        }
        $fs->chmod($local_path, 0777, 0000, true);
        return $local_path;
    }

    /**
     * 执行视频转换操作
     * @param array $task
     * @param string $local_path 本地视频资源目录路径
     * @return bool
     */
    private function convert($task, $local_path)
    {
        $video_length = RecordService::getTimeTotal($local_path . '/' . $task['temp_conference_id'] . '/1/config.xml');
        $env = $task['environment'];
        $fs = new Filesystem();
        $swf_pos = $local_path . '/RecordPlay.swf';
        $mp4_pos = $local_path . '/record.mp4';

        // 调用moyea 命令行模式  参数dt表示视频持续时间，该字段必填  $status=0 表示 转换成功，其他的值参考文档。
        $cmd = "\"{$this->moyea_exe}\" \"{$swf_pos}\" -out \"{$mp4_pos}\" -f mp4 -dt {$video_length} -nosoundcard";
        $this->logger->info($cmd);
        exec($cmd, $out, $status);

        if ($status == 0) {
            $date = date('Ymd', $task['create_at']);
            $remote_mp4 = $this->remote_path[$env] . "/wwwmps/mp4/{$date}/{$task['temp_conference_id']}.mp4";
            if (!file_exists($this->remote_path[$env] . "/wwwmps/mp4/{$date}")) {
                mkdir($this->remote_path[$env] . "/wwwmps/mp4/{$date}", 0777, true);
            }
            $fs->copy($mp4_pos, $remote_mp4,true);
            return true;
        } else {
            $this->logger->error("MP4 generation: " . implode("\t", $out));
            throw new \DomainException("Convert Failed: {$task['environment']}:{$task['conference_id']} " . implode("\t", $out));
        }
    }

    /**
     * @param array $task
     * @param string $local_path
     * @return bool
     */
    private function generateM3u8($task, $local_path)
    {
        $env = $task['environment'];
        $mp4_path = $local_path . '/record.mp4';
        $hls_path = $local_path . '/hls';
        mkdir($hls_path);

        if (!file_exists($mp4_path)) {
            throw new \DomainException("MP4 file not found: " . json_encode($task));
        }

        $cmd = "\"{$this->ffmpeg_exe}\" -i $mp4_path -c:v libx264 -c:a aac -hls_time 15 -hls_list_size 0 -strict -2 -f hls $hls_path/index.m3u8";
        $this->logger->info($cmd);
        exec($cmd, $out, $status);

        if ($status == 0) {
            $fs = new Filesystem();
            $date = date('Ymd', $task['create_at']);
            $remote_path = $this->remote_path[$env] . "/wwwmps/hls/{$date}/{$task['temp_conference_id']}";
            if (!file_exists($this->remote_path[$env] . "/wwwmps/hls/{$date}")) {
                mkdir($this->remote_path[$env] . "/wwwmps/hls/{$date}", 0777, true);
            }
            $fs->symlink($hls_path, $remote_path, true);
            return true;
        } else {
            $this->logger->error("M4U8 generation: " . implode("\t", $out));
            throw new \DomainException("Generate M3U8 Index Failed: {$task['environment']}:{$task['conference_id']} " . implode("\t", $out));
        }
    }

    /**
     * @param $task
     * @param $local_path
     * @return bool
     */
    private function generateThumb($task, $local_path)
    {
        $env = $task['environment'];
        $time_total = RecordService::getTimeTotal($local_path . '/' . $task['temp_conference_id'] . '/1/config.xml');
        $mp4_path = $local_path . '/record.mp4';
        $thumb_path = $local_path . '/thumb-%d.jpg';
        $pic_path = $local_path . '/thumb-1.jpg';
        $offset = $time_total < 20 ? intval($time_total / 2) : 10;

        if (!file_exists($mp4_path)) {
            throw new \DomainException("MP4 file not found: " . json_encode($task));
        }

        $cmd = "\"{$this->ffmpeg_exe}\" -ss $offset -i $mp4_path -frames 1 -f image2 -y $thumb_path";
        $this->logger->info($cmd);
        exec($cmd, $out, $status);

        if ($status == 0) {
            $fs = new Filesystem();
            $date = date('Ymd', $task['create_at']);
            $remote_thumb = $this->remote_path[$env] . "/wwwmps/mp4/{$date}/{$task['temp_conference_id']}.jpg";
            if (!file_exists($this->remote_path[$env] . "/wwwmps/mp4/{$date}")) {
                mkdir($this->remote_path[$env] . "/wwwmps/mp4/{$date}", 0777, true);
            }
            $fs->copy($pic_path, $remote_thumb,true);
            return true;
        } else {
            $this->logger->error("Thumbnail: " . implode("\t", $out));
            throw new \DomainException("Generate Thumbnail Failed: {$task['environment']}:{$task['conference_id']} " . implode("\t", $out));
        }
    }


    /**
     *
     * @param string $env
     * @param int $temp_conference_id
     * @param int $create_at
     * @return string
     * @throws \Exception
     */
    private function getResourcePath($env, $temp_conference_id, $create_at)
    {
        if (isset($this->remote_path[$env])) {
            $date = date('Ymd', $create_at);
            $path = $this->remote_path[$env] . "/wwwmps/{$date}/{$temp_conference_id}";
            if (file_exists($path)) {
                return $path;
            }
            $path = $this->remote_path[$env] . "/wwwmps/{$temp_conference_id}";
            if (file_exists($path)) {
                return $path;
            }
        }
        throw new \Exception("MPS Resource directory not found: ENV:$env, ID:$temp_conference_id, TIME:$create_at");
    }

    /**
     * @param $env
     * @param $temp_conference_id
     * @param $create_at
     * @return string
     * @throws \Exception
     */
    private function getFlashXmlPath($env, $temp_conference_id, $create_at)
    {
        if (isset($this->remote_path[$env])) {
            $date = date('Ymd', $create_at);
            $path = $this->remote_path[$env] . "/flash/xml/{$date}/{$temp_conference_id}.xml";
            if (file_exists($path)) {
                return $path;
            }
            $path = $this->remote_path[$env] . "/flash/xml/{$temp_conference_id}.xml";
            if (file_exists($path)) {
                return $path;
            }
        }
        throw new \Exception("Flash timeline XML not found: ENV:$env, ID:$temp_conference_id, TIME:$create_at");
    }
}