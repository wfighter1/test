<?php

use App\Models\taska;
use App\Repositories\taskaRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskaRepositoryTest extends TestCase
{
    use MaketaskaTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var taskaRepository
     */
    protected $taskaRepo;

    public function setUp()
    {
        parent::setUp();
        $this->taskaRepo = App::make(taskaRepository::class);
    }

    /**
     * @test create
     */
    public function testCreatetaska()
    {
        $taska = $this->faketaskaData();
        $createdtaska = $this->taskaRepo->create($taska);
        $createdtaska = $createdtaska->toArray();
        $this->assertArrayHasKey('id', $createdtaska);
        $this->assertNotNull($createdtaska['id'], 'Created taska must have id specified');
        $this->assertNotNull(taska::find($createdtaska['id']), 'taska with given id must be in DB');
        $this->assertModelData($taska, $createdtaska);
    }

    /**
     * @test read
     */
    public function testReadtaska()
    {
        $taska = $this->maketaska();
        $dbtaska = $this->taskaRepo->find($taska->id);
        $dbtaska = $dbtaska->toArray();
        $this->assertModelData($taska->toArray(), $dbtaska);
    }

    /**
     * @test update
     */
    public function testUpdatetaska()
    {
        $taska = $this->maketaska();
        $faketaska = $this->faketaskaData();
        $updatedtaska = $this->taskaRepo->update($faketaska, $taska->id);
        $this->assertModelData($faketaska, $updatedtaska->toArray());
        $dbtaska = $this->taskaRepo->find($taska->id);
        $this->assertModelData($faketaska, $dbtaska->toArray());
    }

    /**
     * @test delete
     */
    public function testDeletetaska()
    {
        $taska = $this->maketaska();
        $resp = $this->taskaRepo->delete($taska->id);
        $this->assertTrue($resp);
        $this->assertNull(taska::find($taska->id), 'taska should not exist in DB');
    }
}
