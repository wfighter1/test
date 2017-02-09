<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreatetaskbRequest;
use App\Http\Requests\UpdatetaskbRequest;
use App\Repositories\taskbRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class taskbController extends AppBaseController
{
    /** @var  taskbRepository */
    private $taskbRepository;

    public function __construct(taskbRepository $taskbRepo)
    {
        $this->taskbRepository = $taskbRepo;
    }

    /**
     * Display a listing of the taskb.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->taskbRepository->pushCriteria(new RequestCriteria($request));
        $taskbs = $this->taskbRepository->all();

        return view('taskbs.index')
            ->with('taskbs', $taskbs);
    }

    /**
     * Show the form for creating a new taskb.
     *
     * @return Response
     */
    public function create()
    {
        return view('taskbs.create');
    }

    /**
     * Store a newly created taskb in storage.
     *
     * @param CreatetaskbRequest $request
     *
     * @return Response
     */
    public function store(CreatetaskbRequest $request)
    {
        $input = $request->all();

        $taskb = $this->taskbRepository->create($input);

        Flash::success('Taskb saved successfully.');

        return redirect(route('taskbs.index'));
    }

    /**
     * Display the specified taskb.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            Flash::error('Taskb not found');

            return redirect(route('taskbs.index'));
        }

        return view('taskbs.show')->with('taskb', $taskb);
    }

    /**
     * Show the form for editing the specified taskb.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            Flash::error('Taskb not found');

            return redirect(route('taskbs.index'));
        }

        return view('taskbs.edit')->with('taskb', $taskb);
    }

    /**
     * Update the specified taskb in storage.
     *
     * @param  int              $id
     * @param UpdatetaskbRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatetaskbRequest $request)
    {
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            Flash::error('Taskb not found');

            return redirect(route('taskbs.index'));
        }

        $taskb = $this->taskbRepository->update($request->all(), $id);

        Flash::success('Taskb updated successfully.');

        return redirect(route('taskbs.index'));
    }

    /**
     * Remove the specified taskb from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $taskb = $this->taskbRepository->findWithoutFail($id);

        if (empty($taskb)) {
            Flash::error('Taskb not found');

            return redirect(route('taskbs.index'));
        }

        $this->taskbRepository->delete($id);

        Flash::success('Taskb deleted successfully.');

        return redirect(route('taskbs.index'));
    }
}
