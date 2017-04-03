<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;

class Api
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');
        $user = User::where('token', $token)->first();
        if(!$token || !$user){
            $errors = [
                'status' => 401,
                'title' => 'Unauthorized',
                'detail' => 'The request is unauthorized'
            ];
            return response()->json($errors, 401);
        } else {
            $request->attributes->add(['user' => $user]);
            return $next($request);
        }


    }
}
