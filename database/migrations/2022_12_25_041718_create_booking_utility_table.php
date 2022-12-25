<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('booking_utility', function (Blueprint $table) {
            $table->string('vin3s_utilities');
            $table->string('vin3s_utilities_place');
            $table->string('vin3s_utilities_time');
            $table->primary([
                'vin3s_utilities',
                'vin3s_utilities_place',
                'vin3s_utilities_time'
            ], 'booking_utility');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('booking_utility');
    }
};
