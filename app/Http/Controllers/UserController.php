<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends BaseController
{
    public function __construct()
    {
        // TODO: Later add permission middleware to prevent access other users profile
        //$this->middleware('permission');
    }

    public function show(Request $request)
    {
        return $request->attributes->get('user');
    }
}
