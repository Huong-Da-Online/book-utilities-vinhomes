<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('vin3s_account', function (Blueprint $table) {
            $table->id();
            $table->string('username');
            $table->string('password');
            $table->text('token')
                ->nullable()
                ->default(null);
            $table->dateTimeTz('login_at')
                ->nullable()
                ->default(null);
            $table->boolean('status')
                ->default(true);
            $table->text('other_data')
                ->nullable()
                ->default(null);
            $table->timestamps();
        });
    }

    public function down() {
        Schema::dropIfExists('vin3s_account');
    }
};
