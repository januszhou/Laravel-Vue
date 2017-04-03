<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/v1/login', 'AuthController@login');
Route::post('/v1/register', 'AuthController@register');

Route::group(['middleware' => ['myapi'], 'prefix' => 'v1'], function () {

    Route::resource('users', 'UserController');
    Route::resource('questions', 'QuestionController', ['only' => ['index']]);
    Route::resource('user_answers', 'UserAnswerController');
});

