<?php

namespace App\Repositories;

use App\Models\taskb;
use InfyOm\Generator\Common\BaseRepository;

class taskbRepository extends BaseRepository
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
        return taskb::class;
    }
}
