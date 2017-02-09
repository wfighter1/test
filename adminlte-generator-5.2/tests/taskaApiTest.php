<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskaApiTest extends TestCase
{
    use MaketaskaTrait, ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function testCreatetaska()
    {
        $taska = $this->faketaskaData();
        $this->json('POST', '/api/v1/taskas', $taska);

        $this->assertApiResponse($taska);
    }

    /**
     * @test
     */
    public function testReadtaska()
    {
        $taska = $this->maketaska();
        $this->json('GET', '/api/v1/taskas/'.$taska->id);

        $this->assertApiResponse($taska->toArray());
    }

    /**
     * @test
     */
    public function testUpdatetaska()
    {
        $taska = $this->maketaska();
        $editedtaska = $this->faketaskaData();

        $this->json('PUT', '/api/v1/taskas/'.$taska->id, $editedtaska);

        $this->assertApiResponse($editedtaska);
    }

    /**
     * @test
     */
    public function testDeletetaska()
    {
        $taska = $this->maketaska();
        $this->json('DELETE', '/api/v1/taskas/'.$taska->iidd);

        $this->assertApiSuccess();
        $this->json('GET', '/api/v1/taskas/'.$taska->id);

        $this->assertResponseStatus(404);
    }
}
