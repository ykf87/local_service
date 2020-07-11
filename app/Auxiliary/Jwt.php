<?php
namespace App\Auxiliary;

// use Illuminate\Http\Request;
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Parser;
use App\Models\Users\User;

class Jwt{
	public static $_instance = null;
	public static function init(){
		if(!(self::$_instance instanceof Jwt)){
			self::$_instance = new Jwt();
		}
		return self::$_instance;
	}


	public $parse = null;
	private $secret = null;
	private $builder = null;
	private $signer = null;
	public $token = null;
	public $_key = 'bearer';
	public function __construct(){
		$this->secret = env('APP_KEY', 'paopaorender');
		$this->signer = new Sha256();
		$this->builder = new Builder();
	}

	/**
	 * make 生成新的 token
	 */
	public function make(Array $data, $ttl = 2592000, $afterCanUse = 0){
		$name = env('APP_NAME');
		$this->builder->setIssuer($name) //发布者
	        ->setAudience($name) //接收者
	        ->setId("abc", true) //对当前token设置的标识
	        ->setIssuedAt(time()) //token创建时间
	        ->setExpiration(time() + $ttl) //过期时间
	        ->setNotBefore(time() + $afterCanUse); //当前时间在这个时间前，token不能使用
	    foreach($data as $k => $v){
	    	$this->builder->set($k, $v);
	    }

        //设置签名
		$this->builder->sign($this->signer, $this->secret);
		//获取加密后的token，转为字符串
		$this->token = (string)$this->builder->getToken();
		return $this->token;
	}

	/**
	 * parses 解析 token
	 */
	public function parses($token = null){
		if(!$token){
			$token = trim(\Request::header($this->_key));
		}
		if(!$token){
			return __('请先登录');
		}

		try {
            //解析token
            $this->parse = (new Parser())->parse($token);
            //验证token合法性
            if (!$this->parse->verify($this->signer, $this->secret)) {
                return __('token不合法');
            }

            //验证是否已经过期
            if ($this->parse->isExpired()) {
                return __('token过期');
            }
            return $this;

        } catch (Exception $e) {
            return $e->getMessage();
        }
	}

	/**
	 * get 获取 token 信息
	 */
	public function get(string $key, $default = null){
		return $this->parse->getClaim($key, $default);
		// $arr = $this->parse->getClaims();
		// return $arr[$key] ?? $default;
	}

	/**
	 * 获取所有 token 信息
	 */
	public function all(){
		$break = ['iss', 'aud', 'jti', 'iat', 'exp', 'nbf'];
		$arr = [];
		foreach($this->parse->getClaims() as $key => $item){
			if(in_array($key, $break)) continue;
			$arr[$item->getName()] = $item->getValue();
		}
		return $arr;
	}
}
