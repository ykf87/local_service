<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::namespace('Service')->prefix('service')->group(function($route){
	$route->get('', 'IndexController@index');
	$route->post('/release', 'HouseController@release')->middleware('local_user');
	$route->post('/demand', 'HouseController@demand')->middleware('local_user');
});



Route::namespace('Users')->prefix('wx')->group(function($route){
	$route->get('/login', 'WxController@login');
});

Route::namespace('Users')->prefix('u')->middleware('local_user')->group(function($route){
	$route->get('/', 'IndexController@info');
	$route->get('/team', 'IndexController@team');
	$route->get('/signs', 'IndexController@signs');
	$route->get('/scores', 'IndexController@scores');
	$route->post('/sign', 'IndexController@sign');
	$route->post('/editer', 'IndexController@editer');
});
