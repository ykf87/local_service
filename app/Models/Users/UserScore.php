<?php

namespace App\Models\Users;

use App\Models\Users\Model;
use App\Models\Users\User;
use App\Models\Users\UserSign;
use App\Models\Users\UserLevel;

class UserScore extends Model{
	/**
	 * 用户增加积分
	 */
	public static function addScore(int $score, $userInfo, $remark = null){
		if(is_numeric($userInfo)){
			$userInfo = User::find($userInfo);
		}

		if(!$userInfo || !($userInfo instanceof User)){
			return false;
		}

		$newTotalScore = $userInfo->score + $score;

		$scoreObj = new UserScore;
		$scoreObj->uid = $userInfo->id;
		$scoreObj->group = 1;
		$scoreObj->score = $score;
		$scoreObj->score_before = $userInfo->score;
		$scoreObj->score_after = $newTotalScore;
		$scoreObj->remark = $remark;
		if($scoreObj->save()){// 更新得分明细表
			// 分数更新完后，检查是否提升等级
			$userInfo->level = UserLevel::level($newTotalScore);

			$userInfo->score = $newTotalScore;
			$userInfo->save();// 更新用户信息表


		}
		return ['user' => $userInfo, 'score' => $score];
	}
}
