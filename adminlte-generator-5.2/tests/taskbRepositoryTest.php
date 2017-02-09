<?php

use App\Models\taskb;
use App\Repositories\taskbRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskbRepositoryTest extends TestCase
{
    use MaketaskbTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var taskbRepository
     */
    protected $taskbRepo;

    public function setUp()
    {
        parent::setUp();
        $this->taskbRepo = App::make(taskbRepository::class);
    }

    /**
     * @test create
     */
    public function testCreatetaskb()
    {
        $taskb = $this->faketaskbData();
        $createdtaskb = $this->taskbRepo->create($taskb);
        $createdtaskb = $createdtaskb->toArray();
        $this->assertArrayHasKey('id', $createdtaskb);
        $this->assertNotNull($createdtaskb['id'], 'Created taskb must have id specified');
        $this->assertNotNull(taskb::find($createdtaskb['id']), 'taskb with given id must be in DB');
        $this->assertModelData($taskb, $createdtaskb);
    }

    /**
     * @test read
     */
    public function testReadtaskb()
    {
        $taskb = $this->maketaskb();
        $dbtaskb = $this->taskbRepo->find($taskb->id);
        $dbtaskb = $dbtaskb->toArray();
        $this->assertModelData($taskb->toArray(), $dbtaskb);
    }

    /**
     * @test update
     */
    public function testUpdatetaskb()
    {
        $taskb = $this->maketaskb();
        $faketaskb = $this->faketaskbData();
        $updatedtaskb = $this->taskbRepo->update($faketaskb, $taskb->id);
        $this->assertModelData($faketaskb, $updatedtaskb->toArray());
        $dbtaskb = $this->taskbRepo->find($taskb->id);
        $this->assertModelData($faketaskb, $dbtaskb->toArray());
    }

    /**
     * @test delete
     */
    public function testDeletetaskb()
    {
        $taskb = $this->maketaskb();
        $resp = $this->taskbRepo->delete($taskb->id);
        $this->assertTrue($resp);
        $this->assertNull(taskb::find($taskb->id), 'taskb should not exist in DB');
    }
}
