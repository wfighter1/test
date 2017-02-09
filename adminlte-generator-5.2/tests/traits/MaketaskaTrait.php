<?php

use Faker\Factory as Faker;
use App\Models\taska;
use App\Repositories\taskaRepository;

trait MaketaskaTrait
{
    /**
     * Create fake instance of taska and save it in database
     *
     * @param array $taskaFields
     * @return taska
     */
    public function maketaska($taskaFields = [])
    {
        /** @var taskaRepository $taskaRepo */
        $taskaRepo = App::make(taskaRepository::class);
        $theme = $this->faketaskaData($taskaFields);
        return $taskaRepo->create($theme);
    }

    /**
     * Get fake instance of taska
     *
     * @param array $taskaFields
     * @return taska
     */
    public function faketaska($taskaFields = [])
    {
        return new taska($this->faketaskaData($taskaFields));
    }

    /**
     * Get fake data of taska
     *
     * @param array $postFields
     * @return array
     */
    public function faketaskaData($taskaFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            
        ], $taskaFields);
    }
}
