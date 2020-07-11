<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Users\User;
use App\Models\Users\UserSign;
use App\Models\Users\UserScore;
use App\Auxiliary\Jwt;


class IndexController extends Controller{
	/**
	 * 获取用户基本信息
	 */
	public function info(Request $request){
		return $this->s(Jwt::init()->all());
	}

	/**
	 * 用户签到
	 */
	public function sign(){
		$id = Jwt::init()->get('id');
		$user = UserSign::sign($id);
		if(is_array($user)){
			$arr = User::infoToken($user['user']);
			// $u = User::tokenCols($user['user']);
			// $arr = [
			// 	'tokenKey' => Jwt::init()->_key,
			// 	'newToken' => Jwt::init()->make($u),
			// 	'score' => $user['score'],
			// 	'user' => $u,
			// ];
			return $this->s($arr);
		}elseif(is_string($user)){
			return $this->e($user);
		}
		return $this->e(__('签到失败'));
	}

	/**
	 * 获取团队列表
	 */
	public function team(){
		return $this->s(User::list(['id', 'nickname', 'avatar', 'telphone'], [['parent', '=', Jwt::init()->get('id')], ['status', '>', 0]]));
	}

	/**
	 * 获取签到明细
	 */
	public function signs(Request $request){
		return $this->s(UserSign::list(['id', 'score', 'created_at'], ['uid' => Jwt::init()->get('id')]));
	}

	/**
	 * 获取得分明细
	 */
	public function scores(Request $request){
		return $this->s(UserScore::list(['id', 'score', 'created_at', 'remark'], ['uid' => Jwt::init()->get('id')]));
	}

	/**
	 * 修改用户信息
	 */
	public function editer(Request $request){
		$cols = $request->all();
		$cols = array_intersect_key($cols, User::$editCol);

		if(empty($cols)){
			return $this->e(__('没有任何修改'));
		}

		$user = User::find(Jwt::init()->get('id'));

		foreach($cols as $col => $value){
			if(method_exists(User::class, User::$editCol[$col])){
				$value = call_user_func_array([User::class, User::$editCol[$col]], [$value]);
			}
			$user->{$col} = $value;
		}

		if($user->save()){
			return $this->s(User::infoToken($user), __('修改成功'));
		}
		return $this->e(__('修改失败'));
	}
}
