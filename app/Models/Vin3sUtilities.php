<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vin3sUtilities extends Model {
    use HasFactory;

    protected $keyType = 'string';
    public $incrementing = false;
    protected $table = 'vin3s_utilities';
    protected $fillable = [
        'id',
        'img',
        'name'
    ];
    public $timestamps = false;
}
