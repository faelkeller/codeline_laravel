<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Validator;
use Auth;

class CommentsController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'commentary' => 'required',
            'film_id'=> 'required'
        ]);

        if ($validator->fails()) {
            return json_encode(array("msg"=>$validator->messages()));
        }
        
        $inputs = $request->all();
        $inputs["user_id"] = Auth::user()->id;

        return \App\Comment::create($inputs);
    }
}
