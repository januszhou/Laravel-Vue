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
        return $this->belongsTo('App\Models\User', 'id', 'user_id');
    }

    public function question()
    {
        return $this->belongsTo('App\Models\Question', 'id', 'question_id');
    }

    public function answer()
    {
        return $this->belongsTo('App\Models\Answer', 'id', 'answer_id');
    }
}