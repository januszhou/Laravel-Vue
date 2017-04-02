<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends BaseController
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

    public function register(Request $request)
    {
        $validator = $this->validator($request->all());

        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        $user = $this->create($request->all());

        return $user;
    }

    private function create(array $data)
    {
        return User::create([
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'token' => sha1(time())
        ]);
    }

    private function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ]);
    }
}
