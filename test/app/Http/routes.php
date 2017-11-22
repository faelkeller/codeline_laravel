<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an application.
  | It's a breeze. Simply tell Laravel the URIs it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::auth();

Route::get('/', function () {
    return redirect('films');
});

Route::get('films', 'FilmsController@index');
Route::get('films/create', 'FilmsController@create');
Route::get('films/{id}/edit', 'FilmsController@edit');
Route::get('films/{id}', 'FilmsController@show');
Route::post('films', 'FilmsController@store');
Route::patch('films/{id}', 'FilmsController@update');

Route::group(['middleware' => 'App\Http\Middleware\Admin'], function() {
    Route::group(['prefix' => 'admin'], function () {
        Route::resource('films', 'FilmsController');
        Route::resource('countries', 'CountriesController');
    });
});
