<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends BaseController
{
    public function __construct()
    {
//        $this->middleware('permission');
    }

    public function show(User $user)
    {
        return $user;
    }
}
