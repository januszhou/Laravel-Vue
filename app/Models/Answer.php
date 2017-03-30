<?php
/**
 * Created by PhpStorm.
 * User: zhou
 * Date: 3/30/17
 * Time: 2:48 PM
 */

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    use SoftDeletes;

    protected $table = 'answers';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['title'];

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
    public function question()
    {
        return $this->belongsTo('App\Models\Question', 'id', 'question_id');
    }
}