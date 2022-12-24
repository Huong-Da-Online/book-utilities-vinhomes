<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('vin3s_utilities', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->string('img')
                ->nullable()
                ->default(null);
            $table->string('name');
        });
    }

    public function down() {
        Schema::dropIfExists('vin3s_utilities');
    }
};
