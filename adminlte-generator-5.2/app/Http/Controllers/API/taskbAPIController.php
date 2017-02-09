<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreatetaskbAPIRequest;
use App\Http\Requests\API\UpdatetaskbAPIRequest;
use App\Models\taskb;
use App\Repositories\taskbRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

/**
 * Class taskbController
 * @package App\Http\Controllers\API
 */

class taskbAPIController extends AppBaseController
{
    /** @var  taskbRepository */
    private $taskbRepository;

    public function __construct(taskbRepository $taskbRepo)
    {
        $this->taskbRepository = $taskbRepo;
    }

    /**
     * @param Request $request
     * @return Response
     *
     * @SWG\Get(
     *      path="/taskbs",
     *      summary="Get a listing of the taskbs.",
     *      tags={"taskb"},
     *      description="Get all taskbs",
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
     *                  @SWG\Items(ref="#/definitions/taskb")
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
        $this->taskbRepository->pushCriteria(new RequestCriteria($request));
        $this->taskbRepository->pushCriteria(new LimitOffsetCriteria($request));
        $taskbs = $this->taskbRepository->all();

        return $this->sendResponse($taskbs->toArray(), 'Taskbs retrieved successfully');
    }

    /**
     * @param CreatetaskbAPIRequest $request
     * @return Response
     *
     * @SWG\Post(
     *      path="/taskbs",
     *      summary="Store a newly created taskb in storage",
     *      tags={"taskb"},
     *      description="Store taskb",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="taskb that should be stored",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/taskb")
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
     *                  ref="#/definitions/taskb"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function store(CreatetaskbAPIRequest $request)
    {
        $input = $request->all();

        $taskbs = $this->taskbRepository->create($input);

        return $this->sendResponse($taskbs->toArray(), 'Taskb saved successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Get(
     *      path="/taskbs/{id}",
     *      summary="Display the specified taskb",
     *      tags={"taskb"},
     *      description="Get taskb",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taskb",
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
     *                  ref="#/definitions/taskb"
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
        /** @var taskb $taskb */
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            return $this->sendError('Taskb not found');
        }

        return $this->sendResponse($taskb->toArray(), 'Taskb retrieved successfully');
    }

    /**
     * @param int $id
     * @param UpdatetaskbAPIRequest $request
     * @return Response
     *
     * @SWG\Put(
     *      path="/taskbs/{id}",
     *      summary="Update the specified taskb in storage",
     *      tags={"taskb"},
     *      description="Update taskb",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taskb",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="taskb that should be updated",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/taskb")
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
     *                  ref="#/definitions/taskb"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function update($id, UpdatetaskbAPIRequest $request)
    {
        $input = $request->all();

        /** @var taskb $taskb */
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            return $this->sendError('Taskb not found');
        }

        $taskb = $this->taskbRepository->update($input, $id);

        return $this->sendResponse($taskb->toArray(), 'taskb updated successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Delete(
     *      path="/taskbs/{id}",
     *      summary="Remove the specified taskb from storage",
     *      tags={"taskb"},
     *      description="Delete taskb",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of taskb",
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
        /** @var taskb $taskb */
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            return $this->sendError('Taskb not found');
        }

        $taskb->delete();

        return $this->sendResponse($id, 'Taskb deleted successfully');
    }
}
