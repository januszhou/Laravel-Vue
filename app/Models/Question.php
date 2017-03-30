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

class Question extends Model
{
    use SoftDeletes;

    protected $table = 'questions';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'is_multiple'];

    protected $appends = ['title'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['deleted_at'];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * Start relationships section
     */
    public function answers()
    {
        return $this->hasMany('App\Models\Answers', 'question_id', 'id');
    }
}