<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Permission as PermissionModel;
use App\Models\Admin\Access as AccessModel;
use App\Models\Admin\User as UserModel;
use App\Models\Admin\Group as GroupModel;
use Request, Lang, Session;
use App\Services\Admin\Acl\Process as AclProcess;
use App\Libraries\Js;
use App\Services\Admin\Acl\Acl;
use App\Services\Admin\Tree;
use App\Services\Admin\SC;

/**
 * 权限菜单相关
 *
 * @author jiang <mylampblog@163.com>
 */
class AclController extends Controller
{
    /**
     * 显示权限列表
     *
     * @access public
     */
    public function index()
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $pid = (int) Request::input('pid', 'all');
        $list = with(new PermissionModel())->getAllAccessPermission();
        $list = Tree::genTree($list);
        return view('admin.acl.index', compact('list', 'pid'));
    }

    /**
     * 增加权限功能
     *
     * @access public
     */
    public function add()
    {
        if(Request::method() == 'POST') {
            return $this->savePermissionToDatabase();
        }

        $formUrl = R('common', 'foundation.acl.add');
        $list = with(new PermissionModel())->getAllAccessPermission();
        $select = Tree::dropDownSelect(Tree::genTree($list));

        return view('admin.acl.add', compact('select', 'formUrl'));
    }

    /**
     * 增加功能权限入库处理
     *
     * @access private
     */
    private function savePermissionToDatabase()
    {
        $data = (array) Request::input('data');
        $data['add_time'] = time();

        $params = new \App\Services\Admin\Acl\Param\AclSave();
        $params->setAttributes($data);

        $manager = new AclProcess();
        if($manager->addAcl($params) !== false) {
            return Js::locate(R('common', 'foundation.acl.index'), 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }
    
    /**
     * 删除权限功能
     *
     * @access public
     */
    public function delete()
    {
        $permissionId = (array) Request::input('id');

        $manager = new AclProcess();
        if($manager->detele($permissionId) !== false) {
            return responseJson(Lang::get('common.action_success'), true);
        }

        return responseJson($manager->getErrorMessage());
    }

    /**
     * 排序权限功能
     *
     * @access public
     */
    public function sort()
    {
        $sort = (array) Request::input('sort');

        foreach($sort as $key => $value) {
            if(with(new PermissionModel())->sortPermission($key, $value) === false) $err = true;
        }

        if(isset($err)) return Js::error(Lang::get('common.action_error'));

        return Js::locate(R('common', 'foundation.acl.index'), 'parent');
    }
    
    /**
     * 编辑权限功能
     *
     * @access public
     */
    public function edit()
    {
        if(Request::method() == 'POST') {
            return $this->updatePermissionToDatabase();
        }
        
        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');
        $permissionId = url_param_decode($id);

        if( ! $permissionId or ! is_numeric($permissionId)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $permissionModel = new PermissionModel();
        $list = (array) Tree::genTree($permissionModel->getAllAccessPermission());

        $permissionInfo = $permissionModel->getOnePermissionById(intval($permissionId));
        if(empty($permissionInfo)) {
            return Js::error(Lang::get('common.acl_not_found'), true);
        }

        $select = Tree::dropDownSelect($list, $permissionInfo['pid']);
        $formUrl = R('common', 'foundation.acl.edit');

        return view('admin.acl.add',
            compact('select', 'permissionInfo', 'formUrl', 'id')
        );
    }
    
    /**
     * 编辑功能权限入库
     *
     * @access private
     */
    private function updatePermissionToDatabase()
    {
        $httpReferer = Session::getOldInput('http_referer');
        $data = (array) Request::input('data');
        $params = new \App\Services\Admin\Acl\Param\AclSave();
        $params->setAttributes($data);

        $manager = new AclProcess();
        if($manager->editAcl($params) !== false) {
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : R('common', 'foundation.acl.index'); 
            return Js::locate($backUrl, 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }
    
    /**
     * 对用户进行权限设置
     * 
     * @access public
     */
    public function user()
    {
        if(Request::method() == 'POST') {
            return $this->saveUserPermissionToDatabase();
        }

        $id = url_param_decode(Request::input('id'));
        if( ! $id or ! is_numeric($id)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = with(new UserModel())->getOneUserById(intval($id));
        if(empty($info)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_USER)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $process = new AclProcess();

        $zTree = $process->prepareDataForZtree($process->getUserAccessPermissionIds($id));
        $all = $process->prepareUserPermissionIds();

        $router = 'user';

        return view('admin.acl.setpermission',
            compact('zTree', 'id', 'info', 'router', 'all')
        );
    }

    /**
     * 用户权限入库
     * 
     * @return boolean true|false
     */
    private function saveUserPermissionToDatabase()
    {
        $this->checkFormHash();

        $permissions = (array) Request::input('permission');
        $id = (int) Request::input('id');
        $all = Request::input('all');

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_USER)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $params = new \App\Services\Admin\Acl\Param\AclSet();
        $params->setPermission($permissions)->setAll($all)->setId($id);

        $manager = new AclProcess();
        if($manager->setUserAcl($params)) {
            $this->setActionLog();
            return responseJson(Lang::get('common.action_success'));
        }

        return responseJson($manager->getErrorMessage());
    }
    
    /**
     * 对用户组进行权限设置
     * 
     * @access public
     */
    public function group()
    {
        if(Request::method() == 'POST') {
            return $this->saveGroupPermissionToDatabase();
        }

        $id = url_param_decode(Request::input('id'));
        if( ! $id or ! is_numeric($id)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = with(new GroupModel())->getOneGroupById(intval($id));
        if(empty($info)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_GROUP)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $process = new AclProcess();

        $zTree = $process->prepareDataForZtree($process->getGroupAccessPermissionIds($id));
        $all = $process->prepareUserPermissionIds();

        $router = 'group';
        return view('admin.acl.setpermission',
            compact('zTree', 'id', 'info', 'router', 'all')
        );
    }

    /**
     * 用户组权限入库
     * 
     * @return boolean true|false
     */
    private function saveGroupPermissionToDatabase()
    {
        $this->checkFormHash();

        $permissions = (array) Request::input('permission');
        $id = (int) Request::input('id');
        $all = Request::input('all');

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_GROUP)) {
            return responseJson(Lang::get('common.account_level_deny'));
        }

        $params = new \App\Services\Admin\Acl\Param\AclSet();
        $params->setPermission($permissions)->setAll($all)->setId($id);

        $manager = new AclProcess();
        if($manager->setGroupAcl($params)) {
            $this->setActionLog();
            return responseJson(Lang::get('common.action_success'));
        }
        
        return responseJson($manager->getErrorMessage());
    }

}