<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vin3sAccount extends Model {
    use HasFactory;

    protected $table = 'vin3s_account';
    protected $fillable = [
        'username',
        'password',
        'token',
        'login_at',
        'status',
        'other_data'
    ];
    protected $casts = [
        'login_at' => 'datetime',
    ];
}
