<?php

namespace App\Console\Commands;

use App\Models\BookingUtility;
use Illuminate\Console\Command;

class Booking extends Command {
    protected $signature = 'command:booking';
    protected $description = 'Booking slot';
    private $key = '5468617473206D79204B756E67204675';
    private $IV = '1601011111001101';

    public function handle() {
        $timeBooking = BookingUtility::join('vin3s_utilities_place', 'vin3s_utilities_place.id', '=', 'booking_utility.vin3s_utilities_place')
            ->get();
        foreach ($timeBooking as $booking) {
            try {
                // UtilityId: 113 // from vin3s_utilities
                // PlaceId: 113 // from nhà tập, sau khi chọn giờ
                // PlaceUtilityId: 951 // from nhà tập, sau khi chọn giờ
                // UtilityTimeConstraintId: 113 // ID giờ:phút
                // CustomerVinHomeId: 113 // Lúc confirm

                // TransId: 113
                // ApartmentId: 113

                $data = '{"PlaceId":' . $booking->id . ',"UtilityId":' . $booking->vin3s_utilities . ',"UtilityTimeConstraintId":' . $booking->vin3s_utilities_time . ',"DateOfUse":"2022-12-29","TransId":2338180,"NumberJoinIn":1,"CustomerVinHomeId":145927,"ApartmentId":30823,"PlaceUtilityId":' . $booking->place_utility_id . ',"ParentOrderId":0,"UtilityExtraTimeSpan":0,"CountExtraTimeSpan":0,"ChargePersonCount":0,"PersonPrice":0,"TimeSpanPrice":0,"CurrentPersonJoin":0,"NumberOfResidentTickets":1,"NumberOfGuestTickets":0,"OptionalInfo":"Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/108.0.0.0"}';
                dd($this->encrypt($data));
            } catch (e) {

            }
        }
        return Command::SUCCESS;
    }

    private function GetTimeByID($id, $token) {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/ConfirmBooking/ActionInsertOrderRequestEncrypt',
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

    private function encrypt($data) {
        return openssl_encrypt($data, 'AES-256-CBC', $this->key, 0, $this->IV);
    }
}
