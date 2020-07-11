<?php
/**
 * 服务方发布
 */
namespace App\Models\Services;

use Illuminate\Database\Eloquent\Model;
use App\Models\Users\User;
use App\Models\Users\UserScore;
use App\Models\Services\Cate;

class Release extends Model{
	public static $cols = [
		'title' => 'required|max:200',
		'cate' => 'required',
		'images' => 'nullable',
		'phone' => 'max:15',
		'keyword' => 'max:20',
		'price' => 'required',
		'unit' => 'required|max:8',
	];
	public static $consTips = [
		'title.required' => '必须填写标题',
		'title.max' => '标题长度不能大于200个字',
		'cate.required' => '请选择分类',
		'phone.max' => '请填写正确手机号码',
		'phone.numeric' => '请填写正确手机号',
		'price.required' => '请填写价格',
		'unit.required' => '请填写发布单位',
		'unit.max' => '单位不能超过8个字',
		'keyword.max' => '标签不能太长',
	];
	/**
	 * 发布家政
	 */
	public static function add($cols){
		// 发布之前先检查用户是否有资格发布
		$user = User::canRelease();
		if(!($user instanceof User)){
			return __('您暂时不能发布');
		}

		// 检查用户发布分类，并且是否允许继续发布该分类
		$releaseCate = \Request::input('cate');
		$cate = Cate::find($releaseCate);
		if(!$cate){
			return __('分类不存在');
		}


		$obj = new Release;
		$obj->uid = $user->id;
		$obj->status = 1;
		$releaseScore = 0;
		if($cate->rules){
			$rules = json_decode($cate->rules, true);
			$releaseScore = $rules['score'] ?? 0;
		}

		// 一天内发布的内容大于10个，并且一个分类下发布内容大于2个，则需要审核
		$todayTime = date('Y-m-d 00:00:00');
		$todayRelease = Release::where('uid', $user->id)->where('created_at', '>=', $todayTime)->where('status', '>=', 0)->get();
		if(count($todayRelease) > 10){
			$obj->status = 0;
		}
		$i = 0;
		foreach($todayRelease as $item){
			if($item->cate == $releaseCate){
				$i++;
			}
			if($i > 2){
				$obj->status = 0;
				$releaseScore = 0;
				break;
			}
		}

		foreach($cols as $col => $value){
			$obj->{$col} = $value;
		}

		// 保存成功后需要执行一些逻辑，如加积分
		if($obj->save()){
			if($releaseScore > 0){
				UserScore::addScore($releaseScore, $user, __('发布家政服务'));
			}
			return ['obj' => $obj, 'score' => $releaseScore];
		}
		return __('发布失败');
	}
}
