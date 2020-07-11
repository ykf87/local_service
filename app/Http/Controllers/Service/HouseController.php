<?php
/**
 * 规则：
 *	用户可发布 家政，求租，出租，出售，求购房，二手旧货出售，求购二手
 *	每个频道有各自的发布限制和用户发布规则
 */

namespace App\Http\Controllers\Service;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Services\Release;
use App\Models\Services\Demand;
use App\Http\Requests\ServiceRelease;
use App\Http\Requests\ServiceDemand;

class HouseController extends Controller{
	public function release(ServiceRelease $request, $id = null){
		$validateData = $request->validated();
		$rs = Release::add(array_intersect_key($request->all(), Release::$cols));
		if(is_string($rs)){
			return $this->e($rs);
		}elseif(isset($rs['obj']) && $rs['obj'] instanceof Release){
			return $this->s($rs['obj'], $rs['score'] ? __('积分增加') . $rs['score'] : ($rs['obj']->status == 0 ? __('发布成功,等待审核中') : null));
		}
		return $this->e(__('发布失败'));
	}

	public function demand(ServiceDemand $request, $id = null){
		$validateData = $request->validated();
		$rs = Demand::add(array_intersect_key($request->all(), Demand::$cols));
		if(is_string($rs)){
			return $this->e($rs);
		}elseif(isset($rs['obj']) && $rs['obj'] instanceof Demand){
			return $this->s($rs['obj'], $rs['score'] ? __('积分增加') . $rs['score'] : ($rs['obj']->status == 0 ? __('发布成功,等待审核中') : null));
		}
		return $this->e(__('发布失败'));
	}
}
