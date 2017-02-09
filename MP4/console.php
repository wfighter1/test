<?php
$app = require('bootstrap.php');

use Symfony\Component\Console\Application;

$console = new Application();

$console->add(new \Quanshi\MP4Convert\ConvertCommand($app));

$console->run();