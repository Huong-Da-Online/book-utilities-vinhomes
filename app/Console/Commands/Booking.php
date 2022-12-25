<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class Booking extends Command {
    protected $signature = 'command:booking';
    protected $description = 'Booking slot';

    public function handle() {
        // UtilityId: 113 // from vin3s_utilities
        // PlaceId: 113 // from nhà tập, sau khi chọn giờ
        // PlaceUtilityId: 951 // from nhà tập, sau khi chọn giờ
        // UtilityTimeConstraintId: 113 // ID giờ:phút
        // CustomerVinHomeId: 113 // Lúc confirm



        // TransId: 113
        // ApartmentId: 113


        return Command::SUCCESS;
    }

    private function GetTimeByID($id, $token) {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/Booking/ActionGetUtilityWorkTimeFromCache',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
                "versionInfo": {
                    "moduleVersion": "' . config('app.vin3s.moduleVersion') . '",
                    "apiVersion": "' . config('app.vin3s.apiVersion') . '"
                },
                "viewName": "MainFlow.Booking",
                "inputParameters": {
                    "AccessToken": "' . $token . '",
                    "UtilityId": "' . $id . '",
                    "ExpirationTimeMinutes": 10,
                    "ExpirationTimeHours": 0,
                    "ExpirationTimeSeconds": 0,
                    "CheckPlaceId": "0"
                }
            }',
            CURLOPT_HTTPHEADER => array(
                'X-CSRFToken: ' . config('app.vin3s.CSRFToken'),
                'Content-Type: application/json',
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        echo $response;
    }
}
