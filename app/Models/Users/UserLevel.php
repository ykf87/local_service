<?php

namespace App\Models\Users;

use App\Models\Users\Model;

class UserLevel extends Model{
	public static function level($score){
		return self::select('level')->where('status', '>', 0)->where('min', '<', $score)->where('max', '>=', $score)->first()->level;
	}
}
