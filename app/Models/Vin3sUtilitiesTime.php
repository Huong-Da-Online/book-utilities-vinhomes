<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vin3sUtilitiesTime extends Model {
    use HasFactory;

    protected $keyType = 'string';
    public $incrementing = false;
    protected $table = 'vin3s_utilities_time';
    protected $fillable = [
        'id',
        'vin3s_utilities_id',
        'name'
    ];
    public $timestamps = false;
}
