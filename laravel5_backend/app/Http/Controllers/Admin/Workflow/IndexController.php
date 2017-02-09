<?php namespace App\Http\Controllers\Admin\Workflow;

use App\Http\Controllers\Admin\Controller;
use App\Services\Admin\Workflow\Process;
use App\Libraries\Js;
use Request, Lang;

/**
 * 工作流
 *
 * @author jiang <mylampblog@163.com>
 */
class IndexController extends Controller
{
    /**
     * 工作流管理
     */
    public function index()
    {
    	$list = with(new Process())->workflowInfos();
    	$page = $list->setPath('')->appends(Request::all())->render();
        return view('admin.workflow.index', compact('list', 'page'));
    }

    /**
     * 增加新的工作流
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->saveDatasToDatabase();
        $formUrl = R('common', 'workflow.index.add');
        return view('admin.workflow.add', compact('formUrl'));
    }

    /**
     * 增加工作流入库处理
     *
     * @access private
     */
    private function saveDatasToDatabase()
    {
        $data = (array) Request::input('data');
        $data['addtime'] = time();

        $params = new \App\Services\Admin\Workflow\Param\WorkflowSave();
        $params->setAttributes($data);

        $manager = new Process();
        if($manager->addWorkflow($params) !== false) {
            $this->setActionLog();
            return Js::locate(R('common', 'workflow.index.index'), 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }

    /**
     * 编辑工作流
     *
     * @access public
     */
    public function edit()
    {
        if(Request::method() == 'POST') return $this->updateDatasToDatabase();
        $id = (int) Request::input('id');
        $info = with(new Process())->workflowInfo(['id' => $id]);
        if(empty($info)) return Js::error(Lang::get('workflow.workflow_not_found'));
        $formUrl = R('common', 'workflow.index.edit');
        return view('admin.workflow.add', compact('info', 'formUrl', 'id'));
    }
    
    /**
     * 编辑工作流入库处理
     *
     * @access private
     */
    private function updateDatasToDatabase()
    {
        $data = (array) Request::input('data');
        $params = new \App\Services\Admin\Workflow\Param\WorkflowSave();
        $params->setAttributes($data);
        $manager = new Process();
        if($manager->editWorkflow($params)) {
            $this->setActionLog();
            return Js::locate(R('common', 'workflow.index.index'), 'parent');
        }
        return Js::error($manager->getErrorMessage());
    }

    /**
     * 删除工作流
     *
     * @access public
     */
    public function delete()
    {
        $id = array_map('intval', (array) Request::input('id'));
        $manager = new Process();
        $info = $manager->workflowInfos(['ids' => $id]);
        if($manager->deleteWorkflow(['ids' => $id])) {
            $this->setActionLog(['workflowInfo' => $info]);
            return responseJson(Lang::get('common.action_success'), true);
        }
        return responseJson($manager->getErrorMessage());
    }


}