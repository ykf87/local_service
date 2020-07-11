<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use EasyWeChat\Factory;
use App\Models\Users\User;
use App\Auxiliary\Jwt;

class WxController extends Controller{
	public function getuser(Request $request){
		$code = $request->input('code');
	}
	public function login(){
		// $config = [
		//     'app_id' => 'wx154709c5326ecd89',
		//     'secret' => 'a679bb2158fba388bd334ebe12d7b06e',
		//     'token' => 'Vbi09wv4KpdG9FI5pBTvf7IGMcGO4Ff3',
		//     'response_type' => 'array',
		//     //...
		// ];
		// $app = Factory::officialAccount($config);
		// return $app->server->serve();
		// return ['sss' => 'ddzzz'];
		// return $this->s(Jwt::init()->make(User::find(1)->toArray()));
	}
}
