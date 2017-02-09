<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreatetaskaAPIRequest;
use App\Http\Requests\API\UpdatetaskaAPIRequest;
use App\Models\taska;
use App\Repositories\taskaRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

/**
 * Class taskaController
 * @package App\Http\Controllers\API
 */

class taskaAPIController extends AppBaseController
{
    /** @var  taskaRepository */
    private $taskaRepository;

    public function __construct(taskaRepository $taskaRepo)
    {
        $this->taskaRepository = $taskaRepo;
    }

    /**
     * @param Request $request
     * @return Response
     *
     * @SWG\Get(
     *      path="/taskas",
     *      summary="Get a listing of the taskas.",
     *      tags={"taska"},
     *      description="Get all taskas",
     *      produces={"application/json"},
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  type="array",
     *                  @SWG\Items(ref="#/definitions/taska")
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function index(Request $request)
    {
        $this->taskaRepository->pushCriteria(new RequestCriteria($request));
        $this->taskaRepository->pushCriteria(new LimitOffsetCriteria($request));
        $taskas = $this->taskaRepository->all();

        return $this->sendResponse($taskas->toArray(), 'Taskas retrieved successfully');
    }

    /**
     * @param CreatetaskaAPIRequest $request
     * @return Response
     *
     * @SWG\Post(
     *      path="/taskas",
     *      summary="Store a newly created taska in storage",
     *      tags={"taska"},
     *      description="Store taska",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="taska that should be stored",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/taska")
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/taska"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function store(CreatetaskaAPIRequest $request)
    {
        $input = $request->all();

        $taskas = $this->taskaRepository->create($input);

        return $this->sendResponse($taskas->toArray(), 'Taska saved successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Get(
     *      path="/taskas/{id}",
     *      summary="Display the specified taska",
     *      tags={"taska"},
     *      description="Get taska",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taska",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/taska"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function show($id)
    {
        /** @var taska $taska */
        $taska = $this->taskaRepository->findWithoutFail($id);

        if (empty($taska)) {
            return $this->sendError('Taska not found');
        }

        return $this->sendResponse($taska->toArray(), 'Taska retrieved successfully');
    }

    /**
     * @param int $id
     * @param UpdatetaskaAPIRequest $request
     * @return Response
     *
     * @SWG\Put(
     *      path="/taskas/{id}",
     *      summary="Update the specified taska in storage",
     *      tags={"taska"},
     *      description="Update taska",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taska",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="taska that should be updated",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/taska")
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/taska"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function update($id, UpdatetaskaAPIRequest $request)
    {
        $input = $request->all();

        /** @var taska $taska */
        $taska = $this->taskaRepository->findWithoutFail($id);

        if (empty($taska)) {
            return $this->sendError('Taska not found');
        }

        $taska = $this->taskaRepository->update($input, $id);

        return $this->sendResponse($taska->toArray(), 'taska updated successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Delete(
     *      path="/taskas/{id}",
     *      summary="Remove the specified taska from storage",
     *      tags={"taska"},
     *      description="Delete taska",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taska",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  type="string"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function destroy($id)
    {
        /** @var taska $taska */
        $taska = $this->taskaRepository->findWithoutFail($id);

        if (empty($taska)) {
            return $this->sendError('Taska not found');
        }

        $taska->delete();

        return $this->sendResponse($id, 'Taska deleted successfully');
    }
}
