<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class FilmsController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $films = \App\Film::get();
        return view('admin.films.list', ['films' => $films]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        $countries = \App\Country::lists("name", "id");
        $genres = \App\Genre::lists("name", "id");
        return view("admin.films.form", ['countries' => $countries, 'genres' => $genres]);
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
                    'slug' => 'required',
                    'description' => 'required',
                    'release_date' => 'date|required',
                    'ticket_price' => 'required|numeric',
                    'rating' => 'required|max:5|min:1',
                    'country_id' => 'required',
                    'photo' => 'required|file|image',
        ]);

        if ($validator->fails()) {
            return json_encode(array("msg" => $validator->messages()));
        }

        $image = $request->file('photo');
        $name = time() . '.' . $image->getClientOriginalExtension();
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
        return view("admin.films.form", ['film' => $film, 'countries' => $countries, 'genres' => $genres]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $film = \App\Film::findOrFail($id);
        $countries = \App\Country::lists("name", "id");
        $genres = \App\Genre::lists("name", "id");
        return view("admin.films.form", ['film' => $film, 'countries' => $countries, 'genres' => $genres]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $film = \App\Film::findOrFail($id);
        
        $inputs = $request->all();
        
        if ($request->file('photo')){
            $image = $request->file('photo');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/avatars');
            $image->move($destinationPath, $name);
            $inputs['photo'] = $name;
        }

        if ($film->update($inputs)) {
            if (isset($inputs['genres']))
                $film->genres()->sync($inputs['genres']);
            
            return $film->toJson();
        }


        return json_encode(array());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $film = \App\Film::findOrFail($id);
        if ($film->delete())
            return json_encode(array("id" => $id));

        return json_encode(array());
    }

}
