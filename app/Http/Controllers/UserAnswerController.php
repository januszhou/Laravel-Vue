<?php

namespace App\Http\Controllers;

use App\Models\UserAnswer;
use Illuminate\Http\Request;

class UserAnswerController extends BaseController
{
    /**
     * POST user question answers
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = $request->attributes->get('user');
        $payload = $request->get('data');

        if(!$payload){
            return $this->errorResponse('empty_payload');
        }

        $answers = UserAnswer::createAnswers($payload, $user);

        return $answers ?response()->json($answers, 201):$this->errorResponse('default');
    }
}
