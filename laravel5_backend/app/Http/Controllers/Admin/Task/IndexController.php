<?php namespace App\Http\Controllers\Admin\Task;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\ActionLog as ActionLogModel;
use Request, Lang;



class IndexController extends Controller
{
    /**
     * 工作流管理
     */
    public function index()
    {
        $data['username'] = strip_tags(Request::input('username'));
        $data['realname'] = strip_tags(Request::input('realname'));
        $data['timeFrom'] = strip_tags(Request::input('time_from'));
        $data['timeTo'] = strip_tags(Request::input('time_to'));

        $model = new ActionLogModel();
        $list = $model->getAllByPage($data);
        $page = $list->setPath('')->appends(Request::all())->render();
        return view('admin.log.index', compact('list', 'page', 'data'));
    }
}
