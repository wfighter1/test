<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskApiTest extends TestCase
{
    use MaketaskTrait, ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function testCreatetask()
    {
        $task = $this->faketaskData();
        $this->json('POST', '/api/v1/tasks', $task);

        $this->assertApiResponse($task);
    }

    /**
     * @test
     */
    public function testReadtask()
    {
        $task = $this->maketask();
        $this->json('GET', '/api/v1/tasks/'.$task->id);

        $this->assertApiResponse($task->toArray());
    }

    /**
     * @test
     */
    public function testUpdatetask()
    {
        $task = $this->maketask();
        $editedtask = $this->faketaskData();

        $this->json('PUT', '/api/v1/tasks/'.$task->id, $editedtask);

        $this->assertApiResponse($editedtask);
    }

    /**
     * @test
     */
    public function testDeletetask()
    {
        $task = $this->maketask();
        $this->json('DELETE', '/api/v1/tasks/'.$task->iidd);

        $this->assertApiSuccess();
        $this->json('GET', '/api/v1/tasks/'.$task->id);

        $this->assertResponseStatus(404);
    }
}
