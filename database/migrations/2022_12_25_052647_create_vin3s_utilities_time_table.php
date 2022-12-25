<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('vin3s_utilities_time', function (Blueprint $table) {
            $table->string('id');
            $table->string('vin3s_utilities_id');
            $table->string('name');
            $table->primary([
                'id',
                'vin3s_utilities_id'
            ]);
        });
    }

    public function down() {
        Schema::dropIfExists('vin3s_utilities_time');
    }
};
