<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    protected $fillable = [
        'name', 'slug', 'description', 'release_date', 'rating', 'ticket_price', 'country_id', 'photo'
    ];
    
    public function comments()
    {
        return $this->hasMany('App\Comment');
    }
    
    public function country()
    {
        return $this->belongsTo('App\Country');
    }
    
    public function genres()
    {
        return $this->belongsToMany('App\Genre', 'films_genres');
    }
    
    static function ratings(){
        return [
            '1'=>'Poor',
            '2'=>'Fair',
            '3'=>'Good',
            '4'=>'Very Good',
            '5'=>'Excellent',
        ];
    }
}
