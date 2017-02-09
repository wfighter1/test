<?php

namespace App\Repositories;

use App\Models\taska;
use InfyOm\Generator\Common\BaseRepository;

class taskaRepository extends BaseRepository
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
        return taska::class;
    }
}
