<?php

use Faker\Factory as Faker;
use App\Models\taskb;
use App\Repositories\taskbRepository;

trait MaketaskbTrait
{
    /**
     * Create fake instance of taskb and save it in database
     *
     * @param array $taskbFields
     * @return taskb
     */
    public function maketaskb($taskbFields = [])
    {
        /** @var taskbRepository $taskbRepo */
        $taskbRepo = App::make(taskbRepository::class);
        $theme = $this->faketaskbData($taskbFields);
        return $taskbRepo->create($theme);
    }

    /**
     * Get fake instance of taskb
     *
     * @param array $taskbFields
     * @return taskb
     */
    public function faketaskb($taskbFields = [])
    {
        return new taskb($this->faketaskbData($taskbFields));
    }

    /**
     * Get fake data of taskb
     *
     * @param array $postFields
     * @return array
     */
    public function faketaskbData($taskbFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            
        ], $taskbFields);
    }
}
