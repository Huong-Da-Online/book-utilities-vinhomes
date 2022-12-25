<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingUtility extends Model {
    use HasFactory;

    protected $table = 'booking_utility';
    protected $fillable = [
        'vin3s_utilities',
        'vin3s_utilities_place',
        'vin3s_utilities_time'
    ];

    public $timestamps = false;
}
