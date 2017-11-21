<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Films extends Model
{
    protected $fillable = [
        'name', 'description', 'release_date', 'rating', 'ticket_price', 'country_id', 'genre_id', 'photo'
    ];
}
