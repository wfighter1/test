<?php namespace App\Services\Admin\Login;

use App\Models\Admin\User as UserModel;
use App\Models\Admin\Permission as PermissionModel;
use App\Services\Admin\SC;
use App\Services\Admin\Login\AbstractProcess;
use App\Events\Admin\ActionLog;
use Validator, Lang;
use Request, Session;

/**
 * 登录处理
 *
 * @author jiang <mylampblog@163.com>
 */
class ProcessDefault extends AbstractProcess
{
    /**
     * 用户模型
     * 
     * @var object
     */
    private $userModel;

    /**
     * 权限模型
     * 
     * @var object
     */
    private $permissionModel;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->userModel) $this->userModel = new UserModel();
        if( ! $this->permissionModel) $this->permissionModel = new PermissionModel();
    }

    /**
     * 登录验证，验证成功后会设置一些待用的session
     *
     * @param string $username 用户名
     * @param string $password 密码
     * @return boolean false | 用户的信息
     * @access public
     */
    public function check($username, $password)
    {
        $userInfo = $this->userModel->InfoByName($username);

        $sign = md5($userInfo['password'] . $this->getPublicKey());
        if($sign != strtolower($password)) return false;

        $data['last_login_time'] = time();
        $data['last_login_ip'] = Request::ip();
        $this->userModel->updateLastLoginInfo($userInfo->id, $data);

        SC::setLoginSession($userInfo);
        SC::setUserCurrentTime();
        SC::setAllPermissionSession($this->permissionModel->getAllAccessPermission());

        $log = new ActionLog(Lang::get('login.login_sys'), ['userInfo' => $userInfo]);
        event($log);

        return $userInfo;
    }

    /**
     * 检测post过来的数据是否满足需求
     * 
     * @param string $username 用户名
     * @param string $password 密码
     * @return false|string
     * @access public
     */
    public function validate($username, $password)
    {
        $this->checkCsrfToken();

        $data = array( 'username' => $username, 'password' => $password );
        $rules = array( 'username' => 'required|min:1', 'password' => 'required|min:1' );

        $messages = array(
            'username.required' => Lang::get('login.please_input_username'),
            'username.min' => Lang::get('login.please_input_username'),
            'password.required' => Lang::get('login.please_input_password'),
            'password.min' => Lang::get('login.please_input_password')
        );

        $validator = Validator::make($data, $rules, $messages);
        if ($validator->fails()) {
            return $validator->messages()->first();
        }

        return false;
    }

    /**
     * 判断是否已经登录
     *
     * @return boolean true|false
     * @access public
     */
    public function hasLogin()
    {
        $hasLogin = SC::getLoginSession();
        return $hasLogin && $this->checkLeftTime();
    }

    /**
     * 判断用户多久没有操作了，是否需要退出
     * 
     * @return boolean
     * @access private
     */
    private function checkLeftTime()
    {
        $userTime = SC::getUserCurrentTime();
        if(time() - $userTime > config('sys.sys_session_lefttime')) {
            return false;
        }
        return true;
    }

    /**
     * 手动的验证csrftoken
     *
     * @access private
     */
    private function checkCsrfToken()
    {
        $csrf = new \App\Services\CsrfValidate();
        $csrf->tokensMatch();
    }

    /**
     * 设置并返回加密密钥
     *
     * @return string 密钥
     * @access public
     */
    public function setPublicKey()
    {
        return SC::setPublicKey();
    }

    /**
     * 取得刚才设置的加密密钥
     * 
     * @return string 密钥
     * @access public
     */
    public function getPublicKey()
    {
        $key = SC::getPublicKey();
        $this->delPublicKey();
        return $key;
    }

    /**
     * 删除密钥
     * 
     * @return void
     * @access public
     */
    public function delPublicKey()
    {
        return SC::delPublicKey();
    }

    /**
     * 登录退出
     *
     * @return void
     * @access public
     */
    public function logout()
    {
        return SC::delLoginSession();
    }

}