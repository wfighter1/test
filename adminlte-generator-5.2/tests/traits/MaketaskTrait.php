<?php

use Faker\Factory as Faker;
use App\Models\task;
use App\Repositories\taskRepository;

trait MaketaskTrait
{
    /**
     * Create fake instance of task and save it in database
     *
     * @param array $taskFields
     * @return task
     */
    public function maketask($taskFields = [])
    {
        /** @var taskRepository $taskRepo */
        $taskRepo = App::make(taskRepository::class);
        $theme = $this->faketaskData($taskFields);
        return $taskRepo->create($theme);
    }

    /**
     * Get fake instance of task
     *
     * @param array $taskFields
     * @return task
     */
    public function faketask($taskFields = [])
    {
        return new task($this->faketaskData($taskFields));
    }

    /**
     * Get fake data of task
     *
     * @param array $postFields
     * @return array
     */
    public function faketaskData($taskFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            
        ], $taskFields);
    }
}
