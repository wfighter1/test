<?php
// web/index.php
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
require_once __DIR__.'/../vendor/autoload.php';




$app = new Silex\Application();

// ... definitions
$app['debug'] = true;

$blogPosts = array(
    1 => array(
        'date'      => '2011-03-29',
        'author'    => 'igorw',
        'title'     => 'Using Silex',
        'body'      => '...',
    ),
);



$app->get('/blog/{id}', function (Silex\Application $app, $id) use ($blogPosts) {
    if (!isset($blogPosts[$id])) {
        $app->abort(404, "Post $id does not exist.");
    }

    $post = $blogPosts[$id];

    return  "<h1>{$post['title']}</h1>".
            "<p>{$post['body']}</p>";
});


$app->get('/feedback', function (Request $request) {
    $message = $request->get('message');
    //mail('feedback@yoursite.com', '[YourSite] Feedback', $message);

    return new Response($message, 201);
});

$app->run();