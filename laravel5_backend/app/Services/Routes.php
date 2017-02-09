<?php

namespace App\Services;

use Route;

/**
 * 系统路由
 * 
 * 注：大部分的路由及控制器所执行的动作来说，
 * 
 * 你需要返回完整的 Illuminate\Http\Response 实例或是一个视图
 *
 * @author jiang <mylampblog@163.com>
 */
class Routes
{
    private $adminDomain;

    /**
     * 初始化，取得配置
     *
     * @access public
     */
    public function __construct()
    {
        $this->adminDomain = config('sys.sys_admin_domain');
    }

    /**
     * 后台的通用路由
     * 
     * 覆盖通用的路由一定要带上别名，且別名的值为module.class.action
     * 
     * 即我们使用别名传入了当前请求所属的module,controller和action
     *
     * <code>
     *     Route::get('index-index.html', ['as' => 'module.class.action', 'uses' => 'Admin\IndexController@index']);
     * </code>
     *
     * @access public
     */
    public function admin()
    {
        Route::group(['domain' => $this->adminDomain], function()
        {
            $this->adminSigin();
            $this->adminCommon();
        });
        return $this;
    }

    /**
     * 后台登陆相关
     * 
     * @access private
     */
    private function adminSigin()
    {
        Route::group(['middleware' => ['csrf']], function()
        {
            Route::get('/', 'Admin\Foundation\LoginController@index');
            Route::controller('login', 'Admin\Foundation\LoginController', ['getOut' => 'foundation.login.out']);
        });
    }

    /**
     * 后台通用路由
     * 
     * @access private
     */
    private function adminCommon()
    {
        Route::group(['middleware' => ['auth', 'acl', 'alog']], function()
        {
            Route::any('{module}-{class}-{action}.html', ['as' => 'common', function($module, $class, $action)
            {
                $touchClass = 'App\\Http\\Controllers\\Admin\\'.ucfirst(strtolower($module)).'\\'.ucfirst(strtolower($class)).'Controller';
                if(class_exists($touchClass))
                {
                    $classObject = new $touchClass();
                    if(method_exists($classObject, $action)) return call_user_func(array($classObject, $action));
                }
                return abort(404);
            }])->where(['module' => '[0-9a-z]+', 'class' => '[0-9a-z]+', 'action' => '[0-9a-z]+']);
        });
    }

}
