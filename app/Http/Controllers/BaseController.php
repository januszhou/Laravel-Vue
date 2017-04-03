<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BaseController extends Controller
{
    //
    public function errorResponse($type)
    {
        switch($type){
            case 'empty_payload':
                return response()->json([
                    'status' => 400,
                    'title' => 'Bad Request',
                    'detail' => 'Request payload is empty'
                ], 400);
            default: return response()->json([
                'status' => 400,
                'title' => 'Bad Request',
                'detail' => 'Bad Request'
            ], 400);
        }
    }
}
