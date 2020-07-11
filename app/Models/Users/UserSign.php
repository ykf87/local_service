<?php

namespace App\Models\Users;

use App\Models\Users\Model;
use App\Models\Users\UserScore;

class UserSign extends Model{
	private static $signRule = [10,20,30,40,50,60,100];

	/**
	 * 签到逻辑实现
	 */
	public static function sign(int $uid){
		$rs = self::signTimes($uid);
		$signs = $rs['signs'];
		$today = $rs['today'];
		if($today == true){
			return __('今日已签到');
		}
		$signTimes = count($signs);


		$score = self::$signRule[$signTimes] ?? self::$signRule[0];


		$singObj = new UserSign;
		$singObj->uid = $uid;
		$singObj->score = $score;
		if($signTimes == 6){
			$singObj->end = 1;
		}
		if($singObj->save()){// 签到成功,需要更新用户总分数和得分明细
			return UserScore::addScore($score, $uid, __('签到积分', ['score' => $score]));
		}
		return false;
	}

	/**
	 * 计算连续签到天数
	 */
	public static function signTimes($uid){
		$sevenDaysBefore = date('Y-m-d 00:00:00', strtotime('-6 days'));
		$signs = UserSign::select('id', 'score', 'created_at')->where('uid', $uid)->where('created_at', '>=', $sevenDaysBefore)->where('end', 0)->orderBy('created_at', 'DESC')->get();
		$signTimes = count($signs);// 7天内签到次数
		if($signTimes == 0){
			return ['signs' => [], 'today' => false];
		}

		// 7天内如果出现断签，则删除
		$ymd = $break = null;
		foreach($signs as $k => $val){
			if($break === true){
				unset($signs[$k]);
				continue;
			}
			$newYmd = strtotime(explode(' ', $val->created_at)[0]);
			if(!$ymd){
				$ymd = $newYmd;
				continue;
			}
			if(($ymd - $newYmd) > 86400){
				$break = true;
				unset($signs[$k]);
			}else{
				$ymd = $newYmd;
			}
		}

		$last = $signs[0];
		$lastTimeArr = explode(' ', $last->created_at);

		if($lastTimeArr[0] == date('Y-m-d')){// 今日已签到
			$last = $signs[1] ?? null;
			if($last){
				$lastTimeArr = explode(' ', $last->created_at);
				if($lastTimeArr[0] != date('Y-m-d', strtotime('-1 day'))){// 检查昨天是否签到，断签从新计算
					return ['signs' => [], 'today' => true];
				}
			}
			return ['signs' => $signs->toArray(), 'today' => true];
		}elseif($lastTimeArr[0] != date('Y-m-d', strtotime('-1 day'))){// 检查昨天是否签到，断签从新计算
			return ['signs' => [], 'today' => false];
		}
		return ['signs' => $signs->toArray(), 'today' => false];
	}
}
