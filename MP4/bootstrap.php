<?php
use Quanshi\MP4Convert\ConvertService;
use Quanshi\MP4Convert\TaskQueue;
use Silex\Application;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\MonologServiceProvider;

require_once __DIR__.'/vendor/autoload.php';
date_default_timezone_set('Asia/Shanghai');

define('APP_ROOT', __DIR__);

$dotenv = new Dotenv\Dotenv(APP_ROOT);
$dotenv->load();

\Symfony\Component\Debug\ErrorHandler::register();

$app = new Silex\Application();

$app['debug'] = getenv('DEBUG') == '1';

$app->register(new DoctrineServiceProvider(), [
    'db.options' => [
        'driver' => 'pdo_mysql',
        'host' => getenv('DB_HOST'),
        'port' => getenv('DB_PORT'),
        'dbname' => getenv('DB_NAME'),
        'user' => getenv('DB_USERNAME'),
        'password' => getenv('DB_PASSWORD'),
        'charset' => 'utf8',
    ]
]);

$app->register(new MonologServiceProvider(), array(
    'monolog.logfile' => __DIR__.'/development.log',
));

$app['task_queue'] = $app->share(function(Application $app) {
    return new TaskQueue($app['db'], $app['monolog']);
});

$app['convert_service'] = $app->share(function(Application $app) {
    $moyea_exe = trim(getenv('MOYEA_EXE'), ' \'"');
    $ffmpeg_exe = trim(getenv('FFMPEG_EXE'), ' \'"');
    $local_path = trim(getenv('LOCAL_RESOURCE'), ' \'"');
    $remote_path = [
        'B' => trim(getenv('REMOTE_RESOURCE_B')),
        'C' => trim(getenv('REMOTE_RESOURCE_C')),
        'D' => trim(getenv('REMOTE_RESOURCE_D')),
        'E' => trim(getenv('REMOTE_RESOURCE_E')),
        'MAX' => trim(getenv('REMOTE_RESOURCE_MAX')),
    ];
    return new ConvertService($moyea_exe, $ffmpeg_exe, $local_path, $remote_path, $app['logger']);
});

$app['local_path'] = function($env, $conference_id) {
    return getenv('LOCAL_RESOURCE') . "/mpsdir_{$env}_{$conference_id}";
};


return $app;
