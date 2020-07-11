<?php
namespace App\Http\Controllers\Service;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class IndexController extends Controller{
	public function index(){
		$data['swiper'] = [
			['src' => '','url' => '',],
			['src' => '','url' => '',],
		];
		$data['banner'] = [
			['ico' => '', 'url' => '', 'text' => '', 'sub' => ''],
		];
		return $this->s($data);
	}
}
