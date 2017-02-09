<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskbApiTest extends TestCase
{
    use MaketaskbTrait, ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function testCreatetaskb()
    {
        $taskb = $this->faketaskbData();
        $this->json('POST', '/api/v1/taskbs', $taskb);

        $this->assertApiResponse($taskb);
    }

    /**
     * @test
     */
    public function testReadtaskb()
    {
        $taskb = $this->maketaskb();
        $this->json('GET', '/api/v1/taskbs/'.$taskb->id);

        $this->assertApiResponse($taskb->toArray());
    }

    /**
     * @test
     */
    public function testUpdatetaskb()
    {
        $taskb = $this->maketaskb();
        $editedtaskb = $this->faketaskbData();

        $this->json('PUT', '/api/v1/taskbs/'.$taskb->id, $editedtaskb);

        $this->assertApiResponse($editedtaskb);
    }

    /**
     * @test
     */
    public function testDeletetaskb()
    {
        $taskb = $this->maketaskb();
        $this->json('DELETE', '/api/v1/taskbs/'.$taskb->iidd);

        $this->assertApiSuccess();
        $this->json('GET', '/api/v1/taskbs/'.$taskb->id);

        $this->assertResponseStatus(404);
    }
}
