<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends BaseController
{
    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->get('email'), 'password' => $request->get('password')])) {
            // Authentication passed...
            return Auth::user();
        } else {
            $errors = [
                'status' => 401,
                'title' => 'Unauthorized',
                'detail' => 'Email and password isn\'t match our records, please try again'
            ];
            return response()->json($errors, 401);
        }
    }
}
