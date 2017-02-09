<?php
use Silex\Application;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

$app = require(__DIR__  . '/../bootstrap.php');

$app->get('/', function() {
    return "It Works!";
});

/*
 * 提交转码任务接口
 * tempConferenceId=&conferenceId=&startTime=1423123421&endTime=1453214321&env=D&callback=
 */
$app->match('/convert', function (Request $req, Application $app) {
    $tempConferenceId = $req->request->get('tempConferenceId', 0);
    $conferenceId = $req->request->get('conferenceId', 0);
    $startTime = $req->request->get('startTime', 0);
    $endTime = $req->request->get('endTime', 0);
    $env = $req->request->get('env', '');
    $callback = $req->request->get('callback', '');

    if ($conferenceId && $tempConferenceId && $startTime && !empty($callback) && !empty($env)) {
        $task_id = $app['task_queue']->addTask($conferenceId, $tempConferenceId, $startTime, $endTime, $env, $callback);
        return new JsonResponse(['status' => 0, 'result' => $task_id]);
    } else {
        return new JsonResponse(['status' => 1, 'error' => 'Missing Parameters']);
    }
});

/*
 * 处理一个转码任务
 */
$app->get('/runTask', function (Application $app) {
	set_time_limit(0);
    $task = $app['task_queue']->getTask();
    if ($task) {
        try {
            $app['convert_service']->runTask($task);
            $app['task_queue']->doneTask($task['id']);
            $app['task_queue']->notifyUniform($app['convert_service']->getLocalPath());
            return new JsonResponse(['status' => 0]);
        } catch (\Exception $ex) {
            $app['task_queue']->failTask($task['id']);
            $app['task_queue']->notifyUniform($app['convert_service']->getLocalPath());
            return new JsonResponse(['status' => 2, 'error' => $ex->getMessage()]);
        }
    } else {
        return new JsonResponse(['status' => 1]);
    }
});

/*
 * 查询转码任务状态接口
 * conferenceId=&env=
 */
$app->get('/job_status.json', function(Request $req, Application $app) {
    $conferenceId = $req->get('conferenceId', 0);
    $env = $req->get('env', '');
    $task = $app['task_queue']->findTask($env, $conferenceId);
    if ($task) {
        return new JsonResponse(['task' => $task]);
    } else {
        return new JsonResponse(['task' => null, 'error' => 'Not Found']);
    }
});


$app->run();
