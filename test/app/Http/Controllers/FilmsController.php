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
        $films = \App\Film::get();        
        return view('front.films.list', ['films' => $films]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        $countries = \App\Country::lists("name", "id");
        $genres = \App\Genre::lists("name", "id");
        return view("films.form", ['countries' => $countries, 'genres'=>$genres]);
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
            'slug'=> 'required',
            'description' => 'required',
            'release_date' => 'date|required',
            'ticket_price' => 'required|numeric',
            'rating' => 'required|max:5|min:1',
            'country_id' => 'required',
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
        
        $film = \App\Film::create($inputs);
        
        $film->genres()->sync($inputs['genres']);

        return $film;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $film = \App\Film::findOrFail($id);
        $countries = \App\Country::lists("name", "id");
        $genres = \App\Genre::lists("name", "id");
        return view("films.form", ['film' => $film, 'countries' => $countries, 'genres'=>$genres]);
    }

    

    

    
}
