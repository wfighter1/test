<?php namespace App\Services\Admin\Acl;

use Lang;
use App\Services\Admin\Acl\Validate\Acl as AclValidate;
use App\Services\Admin\Acl\Acl as AclManager;
use App\Models\Admin\Permission as PermissionModel;
use App\Models\Admin\Access as AccessModel;
use App\Services\BaseProcess;
use App\Services\Admin\SC;

/**
 * 权限菜单处理
 *
 * @author jiang <mylampblog@163.com>
 */
class Process extends BaseProcess
{
    /**
     * 权限菜单模型
     * 
     * @var object
     */
    private $permissionModel;

    /**
     * 权限菜单表单验证对象
     * 
     * @var object
     */
    private $aclValidate;

    /**
     * 权限处理对象
     *
     * @var object
     */
    private $acl;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->permissionModel) $this->permissionModel = new PermissionModel();
        if( ! $this->aclValidate) $this->aclValidate = new AclValidate();
        if( ! $this->acl) $this->acl = new AclManager();
    }

    /**
     * 增加新的权限菜单
     *
     * @param object $data
     * @return boolean true|false
     * @access public
     */
    public function addAcl(\App\Services\Admin\Acl\Param\AclSave $data)
    {
        if( ! $this->aclValidate->add($data)) {
            return $this->setErrorMsg($this->aclValidate->getErrorMessage());
        }

        if($this->permissionModel->checkIfIsExists($data->module, $data->class, $data->action)) {
            return $this->setErrorMsg(Lang::get('acl.acl_exists'));
        }

        $info = $this->permissionModel->getOnePermissionById(intval($data->pid));

        $data = $data->toArray();
        $data['level'] = $info['level'] + 1;

        if($this->permissionModel->addPermission($data) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * 删除权限菜单
     * 
     * @param array $permissionId
     * @return boolean true|false
     * @access public
     */
    public function detele(array $permissionId)
    {
        if( ! ($permissionId = $this->decodePermissionIds($permissionId)) ) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        if($this->permissionModel->getSon($permissionId)) {
            return $this->setErrorMsg(Lang::get('acl.acl_has_son'));
        }

        if($this->permissionModel->deletePermission($permissionId) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * decode permissioin ids
     *
     * @access private
     */
    private function decodePermissionIds(array $permissionId)
    {
        foreach ($permissionId as $key => $value) {
            if( ! ($permissionId[$key] = url_param_decode($value)) ) {
                return false;
            }
        }
        $permissionId = array_map('intval', $permissionId);
        return $permissionId;
    }

    /**
     * 编辑权限菜单
     *
     * @param object $data
     * @return boolean true|false
     * @access public
     */
    public function editAcl(\App\Services\Admin\Acl\Param\AclSave $data)
    {
        $id = intval(url_param_decode($data->id)); unset($data->id);
        if( ! $id) return $this->setErrorMsg(Lang::get('common.illegal_operation'));

        if( ! $this->aclValidate->edit($data)) {
            return $this->setErrorMsg($this->aclValidate->getErrorMessage());
        }

        if($this->permissionModel->checkIfIsExists($data->module, $data->class, $data->action, false, $id)) {
            return $this->setErrorMsg(Lang::get('acl.acl_exists'));
        }

        $info = $this->permissionModel->getOnePermissionById(intval($data->pid));
        $data = $data->toArray();
        $data['level'] = $info['level'] + 1;

        if($this->permissionModel->editPermission($data, intval($id)) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * 设置用户(组)的权限
     *
     * @param object $data
     * @param int $type
     * @return boolean
     * @access private
     */
    private function setAcl(\App\Services\Admin\Acl\Param\AclSet $data, $type)
    {
        if( ! with(new Acl())->checkGroupLevelPermission($data->id, Acl::GROUP_LEVEL_TYPE_USER)) {
            return $this->setErrorMsg(Lang::get('common.account_level_deny'));
        }

        $allArr = array_map('intval', explode(',', $data->all));
        $permission = array_unique($data->permission);

        $ret = with(new AccessModel())->setPermission($permission, intval($data->id), $allArr, $type);
        if( ! $ret) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

    /**
     * 设置用户的权限
     *
     * @see self::setAcl
     */
    public function setUserAcl(\App\Services\Admin\Acl\Param\AclSet $data)
    {
        return $this->setAcl($data, AccessModel::AP_USER);
    }

    /**
     * 设置用户组的权限
     *
     * @see self::setAcl
     */
    public function setGroupAcl(\App\Services\Admin\Acl\Param\AclSet $data)
    {
        return $this->setAcl($data, AccessModel::AP_GROUP);
    }

    /**
     * 取得当前用户的所拥有的权限id
     *
     * @param int $userId 用户的id
     * @return array
     */
    public function getUserAccessPermissionIds($userId)
    {
        $hasPermissions = [];
        $userAcl = with(new AccessModel())->getUserAccessPermission(intval($userId));
        foreach($userAcl as $key => $value) {
            $hasPermissions[] = $value['permission_id'];
        }
        return $hasPermissions;
    }

    /**
     * 为权限赋予页面准备ztree插件需要的数据
     *
     * @param array $permissionIds 所拥有的权限ID
     * @return array
     */
    public function prepareDataForZtree($permissionIds)
    {
        $list = SC::getUserPermissionSession();
        $zTree = [];
        foreach($list as $key => $value) {
            $arr = ['id' => $value['id'], 'pId' => $value['pid'], 'name' => $value['name'], 'open' => true];
            if(in_array($value['id'], $permissionIds)) {
                $arr['checked'] = true;
            }
            $zTree[] = $arr;
        }
        return $zTree;
    }

    /**
     * 为权限赋予页面准备ztree插件需要的数据
     * 
     * @return array
     */
    public function prepareUserPermissionIds()
    {
        $list = SC::getUserPermissionSession();
        $all = [];
        foreach($list as $key => $value) {
            $all[] = $value['id'];
        }
        return $all;
    }

    /**
     * 取得当前用户组的所拥有的权限id
     *
     * @param int $groupId 用户的id
     * @return array
     */
    public function getGroupAccessPermissionIds($groupId)
    {
        $hasPermissions = [];
        $groupAcl = with(new AccessModel())->getGroupAccessPermission(intval($groupId));
        foreach($groupAcl as $key => $value) {
            $hasPermissions[] = $value['permission_id'];
        }
        return $hasPermissions;
    }

}