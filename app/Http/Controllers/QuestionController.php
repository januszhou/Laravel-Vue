<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    /**
     * Show all questions.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Question::all();
    }
}
