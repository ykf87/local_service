<?php
namespace App\Models\Users;

use App\Models\Users\Model;
use App\Auxiliary\Jwt;
use App\Auxiliary\Image;

class User extends Model{
	public static $editCol = ['name' => 'nomal', 'nickname' => 'nomal', 'password' => 'password', 'avatar' => 'avatar', 'sex' => 'nomal', 'telphone' => 'nomal'];
    /**
     * 返回标准的用户信息
     */
    public static function infoToken($user){
    	if($user instanceof User){
    		$user = $user->toArray();
    	}
		unset($user['password']);
		unset($user['created_at']);
		unset($user['updated_at']);
		$arr = [
			'tokenKey' => Jwt::init()->_key,
			'newToken' => Jwt::init()->make($user),
			// 'score' => $user['score'],
			'user' => $user,
		];
		return $arr;
    }

    /**
     * 密码生成
     */
    public static function password($val){
    	return password_hash($val, PASSWORD_DEFAULT);
    }

    /**
     * 头像
     */
    public static function avatar($val){
    	// return Image::save($val);
    	return $val;
    }

    /**
     * 检查用户是否可发布
     */
    public static function canRelease(){
    	$user = User::find(Jwt::init()->get('id'));
    	if($user->status < 1){
    		return false;
    	}

    	if($user->norelease){
    		$dtime = strtotime($user->norelease) - time();
    		if($dtime > 0){
    			return $dtime;
    		}
    	}
    	return $user;
    }
}
