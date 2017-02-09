<?php

use App\Models\task;
use App\Repositories\taskRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class taskRepositoryTest extends TestCase
{
    use MaketaskTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var taskRepository
     */
    protected $taskRepo;

    public function setUp()
    {
        parent::setUp();
        $this->taskRepo = App::make(taskRepository::class);
    }

    /**
     * @test create
     */
    public function testCreatetask()
    {
        $task = $this->faketaskData();
        $createdtask = $this->taskRepo->create($task);
        $createdtask = $createdtask->toArray();
        $this->assertArrayHasKey('id', $createdtask);
        $this->assertNotNull($createdtask['id'], 'Created task must have id specified');
        $this->assertNotNull(task::find($createdtask['id']), 'task with given id must be in DB');
        $this->assertModelData($task, $createdtask);
    }

    /**
     * @test read
     */
    public function testReadtask()
    {
        $task = $this->maketask();
        $dbtask = $this->taskRepo->find($task->id);
        $dbtask = $dbtask->toArray();
        $this->assertModelData($task->toArray(), $dbtask);
    }

    /**
     * @test update
     */
    public function testUpdatetask()
    {
        $task = $this->maketask();
        $faketask = $this->faketaskData();
        $updatedtask = $this->taskRepo->update($faketask, $task->id);
        $this->assertModelData($faketask, $updatedtask->toArray());
        $dbtask = $this->taskRepo->find($task->id);
        $this->assertModelData($faketask, $dbtask->toArray());
    }

    /**
     * @test delete
     */
    public function testDeletetask()
    {
        $task = $this->maketask();
        $resp = $this->taskRepo->delete($task->id);
        $this->assertTrue($resp);
        $this->assertNull(task::find($task->id), 'task should not exist in DB');
    }
}
