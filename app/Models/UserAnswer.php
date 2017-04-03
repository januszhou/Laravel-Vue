<?php
/**
 * Created by PhpStorm.
 * User: zhou
 * Date: 3/30/17
 * Time: 2:49 PM
 */

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UserAnswer extends Model
{
    use SoftDeletes;

    protected $table = 'user_question_answer';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id', 'question_id', 'answer_id'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    protected $appends = ['question', 'answer'];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * Start relationships section
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }

    public function question()
    {
        return $this->belongsTo('App\Models\Question', 'question_id', 'id');
    }

    public function answer()
    {
        return $this->belongsTo('App\Models\Answer', 'answer_id', 'id');
    }

    public function getQuestionAttribute()
    {
        return $this->question()->first();
    }

    public function getAnswerAttribute()
    {
        return $this->answer()->first();
    }

    /**
     * Auto rollback if one answer creation failed
     * @param array $payload
     * @param User $user
     * @return array
     */
    public static function createAnswers(array $payload, User $user)
    {
        $answers = [];
        try {
            DB::transaction(function () use (&$answers, $payload, $user) {
                foreach($payload as $data){
                    if($userAnswer = UserAnswer::createAnswer(array_merge($data, ['user_id' => $user->id]))){
                        $answers[] = $userAnswer;
                    } else {
                        throw new \Exception('Creation error');
                    }
                }
            });
        } catch (\Exception $e){
            $answers = [];
        }

        return $answers;
    }
    
    public static function createAnswer(array $data)
    {
        if(Validator::make($data, [
            'question_id' => 'required',
            'answer_id' => 'required',
            'user_id' => 'required'
        ])->fails()){
            return false;
        }

        $answer = Answer::find($data['answer_id']);

        // If answer is not belong to question
        if(!$answer || $answer->question_id != $data['question_id']){
            return false;
        }

        return self::create([
            'user_id' => $data['user_id'],
            'question_id' => $data['question_id'],
            'answer_id' => $data['answer_id']
        ]);
    }
}