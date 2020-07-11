<?php
/**
* 用户登录 验证器
* by yekongfei
* 2020-07-08
*/
namespace App\Http\Middleware;

use Closure;
use App\Auxiliary\Jwt;
use App\Auxiliary\R;


class Jwtverify{
	use R;
    public function handle($request, Closure $next){
        $jwt = Jwt::init()->parses();
        if(!($jwt instanceof Jwt)){
        	return $this->e($jwt, 401);
        }

        return $next($request);
    }
}
