<?php

namespace App\Repositories;

use App\Models\task;
use InfyOm\Generator\Common\BaseRepository;

class taskRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return task::class;
    }
}
