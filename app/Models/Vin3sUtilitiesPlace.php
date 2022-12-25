<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vin3sUtilitiesPlace extends Model {
    use HasFactory;

    protected $keyType = 'string';
    public $incrementing = false;
    protected $table = 'vin3s_utilities_place';
    protected $fillable = [
        'id',
        'vin3s_utilities_id',
        'name',
        'place_utility_id'
    ];
    public $timestamps = false;
}
