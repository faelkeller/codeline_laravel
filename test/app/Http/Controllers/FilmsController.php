<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Validator;

class FilmsController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $films = \App\Films::get();
        return view('films.list', ['films' => $films]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view("films.form");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'description' => 'required',
            'release_date' => 'date|required',
            'ticket_price' => 'required|numeric',
            'rating' => 'required|max:5|min:1',
            'country_id' => 'required',
            'genre_id' => 'required',
            'photo' => 'required|file|image',
            
        ]);

        if ($validator->fails()) {
            return json_encode(array("msg"=>$validator->messages()));
        }
        
        $image = $request->file('photo');
        $name = time().'.'.$image->getClientOriginalExtension();
        $destinationPath = public_path('/avatars');
        $image->move($destinationPath, $name);
        
        $inputs = $request->all();
        $inputs['photo'] = $name;
        

        return \App\Films::create($inputs);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $film = \App\Films::findOrFail($id);
        return view("films.form", ['film' => $film]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $film = \App\Films::findOrFail($id);
        return view("films.form", ['film' => $film]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $film = \App\Films::findOrFail($id);
        if ($film->update($request->all()))
            return $film->toJson();

        return json_encode(array());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $film = \App\Films::findOrFail($id);
        if ($film->delete())
            return json_encode(array("id"=>$id));
        
        return json_encode(array());
        
        
    }

}
