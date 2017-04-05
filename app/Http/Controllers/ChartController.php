<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChartController extends BaseController
{
    /**
     * Show all questions.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [];

        /**
         * select questions.title, answers.title, count(*) from user_question_answer
        join questions on questions.id = user_question_answer.question_id
        join answers on answers.id = user_question_answer.answer_id
        group by user_question_answer.question_id, user_question_answer.answer_id
         */
        $questionAnswers = DB::table('user_question_answer')
            ->join('questions', 'questions.id', '=', 'user_question_answer.question_id')
            ->join('answers', 'answers.id', '=', 'user_question_answer.answer_id')
            ->groupBy('user_question_answer.question_id')->groupBy('user_question_answer.answer_id')
            ->select('questions.title as question', 'answers.title as answer', DB::raw('count(*) as times'))
            ->get();

        $data['by_question'] = $questionAnswers;

        /**
         * Unique user answer questions by date
         * TODO: Change to Laravel ORM later
         */
        $uniqueUser = DB::select('select a.date as date, count(*) as times from (select DATE(created_at) as date, user_id from user_question_answer group by user_id, DATE(created_at)) as a group by a.date ORDER BY date DESC');
        $data['unique_user'] = $uniqueUser;

        /**
         * How many answers by date
         * select DATE(created_at) , count(*) from user_question_answer group by DATE(created_at);
         */
        $answerTimes = DB::table('user_question_answer')
            ->groupBy(DB::raw('DATE(created_at)'))
            ->select(DB::raw('DATE(created_at) as date'), DB::raw('count(*) as times'))
            ->get();
        $data['by_answers'] = $answerTimes;

        return response()->json($data);
    }
}
