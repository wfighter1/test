<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function max()
	{
		$all = file_get_contents('./file/all.txt');
		$all = explode(',',$all);
		$result3 = file_get_contents('./file/result3.txt');
		$result3 = explode(',',$result3);
		$result6 = file_get_contents('./file/result6.txt');
		$result6 = explode(',',$result6);

		$result3_diff = array_diff($all, $result3);
		$result6_diff = array_diff($all, $result6);
//echo 'all:'.count($all).',result3:'.count($result3).',result6:'.count($result6).',result3_diff:'.count($result3_diff).',result6_diff:'.count($result6_diff);
		//var_dump($result3_diff);
		//var_dump($result6_diff);
		file_put_contents('./file/2016-09-29.txt', implode(',',$result3_diff));
		file_put_contents('./file/2016-06-29.txt', implode(',',$result6_diff));
	}

}
