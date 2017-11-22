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

Route::auth();

Route::get('/', function () {
    return redirect('films');
});

Route::get('films', 'FilmsController@index');
Route::get('films/create', 'FilmsController@create');
Route::get('films/{id}', 'FilmsController@show');
Route::post('films', 'FilmsController@store');

Route::post('comments', 'CommentsController@store');

$router->group(['middleware' => ['App\Http\Middleware\Admin'], 'namespace' => 'Admin', 'prefix' => 'admin'], function($router)
{
    $router->resource('films', 'FilmsController');
    $router->resource('countries', 'CountriesController');
    $router->resource('genres', 'GenresController');
});



