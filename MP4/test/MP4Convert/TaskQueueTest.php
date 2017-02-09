<?php


class TaskQueueTest extends \Silex\WebTestCase
{

    /**
     * Creates the application.
     *
     * @return \Symfony\Component\HttpKernel\HttpKernelInterface
     */
    public function createApplication()
    {
        $app = require __DIR__ . '/../../bootstrap.php';
        $app['debug'] = true;
        unset($app['exception_handler']);
        return $app;
    }


    public function testTaskQueue() {
        $this->app['db']->delete('task_queue', ['1' => '1']);

        $task_queue = $this->app['task_queue'];
        $task_queue->addTask(1, 1234, 'abcd');
        $task_queue->addTask(1, 2345, 'jkl;');

        $task = $task_queue->getTask();
        $this->assertEquals($task['id'], 1);
        $this->assertEquals($task['callback_url'], 'abcd');

        $task = $task_queue->findTask(1);
        $this->assertEquals($task['status'], 0);
        $this->assertEquals($task['end_at'], 0);
        $this->assertEquals($task['attempt'], 1);
        $this->assertTrue(intval($task['available_at']) > time());

        $task_queue->doneTask(1);
        $task = $task_queue->findTask(1);
        $this->assertNotEquals($task['end_at'], 0);
        $this->assertEquals($task['status'], 1);
    }

}