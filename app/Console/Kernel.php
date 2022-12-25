<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel {
    protected function schedule(Schedule $schedule) {
        $schedule->command('command:login-vin3s')->everyTenMinutes();
        $schedule->command('command:update-utilities')->daily();
        $schedule->command('command:update-time')->daily();
        $schedule->command('command:update-place')->daily();
    }

    protected function commands() {
        $this->load(__DIR__ . '/Commands');
        require base_path('routes/console.php');
    }
}
