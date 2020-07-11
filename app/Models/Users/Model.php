<?php
namespace App\Models\Users;

use Illuminate\Database\Eloquent\Model as M;

class Model extends M{
	protected $connection = 'local_user';
}
