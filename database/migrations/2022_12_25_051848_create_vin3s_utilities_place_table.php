<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('vin3s_utilities_place', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->string('vin3s_utilities_id');
            $table->string('name');
            $table->string('place_utility_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('vin3s_utilities_place');
    }
};
