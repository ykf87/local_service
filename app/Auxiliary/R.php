<?php
namespace App\Auxiliary;

use Illuminate\Http\Response;

trait R{
	public function s($data, $msg = null, int $code = 200){
		return $this->rt($data, $msg, $code);
	}
	public function e($msg, int $code = 400, $data = null){
		return $this->rt($data, $msg, $code);
	}
	public function rt($data = null, $msg = '', int $code = 200){
		$arr = ['code' => $code, 'msg' => $msg];
		if($data !== null) $arr['data'] = $data;
		return (new Response)->setContent($arr);
	}
}