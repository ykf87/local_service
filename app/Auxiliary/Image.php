<?php
namespace App\Auxiliary;
use Illuminate\Support\Facades\Storage;

class Image{
	public static function save($res, $path = null, $name = null, $index = null){
		if(!$res) return '';
		if(is_array($res)){
			$datas = [];
			foreach($res as $key => $item){
				$datas[] = self::save($item, $path, $name, $key);
			}
			$datas = implode(',', $datas);
			return $datas;
		}elseif(preg_match('`^data:image\/(.+?);.+?,([\w\W]+)$`', $res, $match)){
			$name 		= $name ? $name . ($index ? '_' . $index : '') : date('Ym') . '/' . time() . rand(10,99) . rand(100, 999);
			$filename = 'images/' . rtrim($path, '/') . '/' . $name . '.' . $match[1];
			$datas = Storage::put($filename, base64_decode($match[2]));
			return $filename;
		}else{
			return $res;
		}
	}

	public static function delete($file){
		if(is_array($file)){
			foreach($file as $f){
				self::delete($file);
			}
		}else{
			return Storage::delete($file);
		}
		return true;
	}


	public static function deleteDirectory($dir){
		return Storage::deleteDirectory($dir);
	}
}
