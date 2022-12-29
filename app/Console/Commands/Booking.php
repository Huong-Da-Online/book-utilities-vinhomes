<?php

namespace App\Console\Commands;

use App\Models\BookingUtility;
use App\Models\Vin3sAccount;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class Booking extends Command {
    protected $signature = 'command:booking';
    protected $description = 'Booking slot';
    private $key = '5468617473206D79204B756E67204675';
    private $IV = '1601011111001101';

    public function handle() {
        $timeBooking = BookingUtility::join('vin3s_utilities_place', 'vin3s_utilities_place.id', '=', 'booking_utility.vin3s_utilities_place')
            ->get()
            ->toArray();
        $account = Vin3sAccount::select([
            'token',
            'account_id',
            'apartment'
        ])
            ->where('status', true)
            ->whereNotNull('token')
            ->first();
        $dateTomorrow = Carbon::now()->addDay()->format('Y-m-d');
        $booked = false;
        while (count($timeBooking) > 0) {
            for ($i = 0; $i < count($timeBooking); $i++) {
                $time = Carbon::now()->format('s');
                if ($time > 56) {
                    $attack = $this->attackVin3s($timeBooking[$i], $account, $dateTomorrow);
                    Log::debug($attack);
                    $booked = true;
                } elseif ($time > 1 && $booked) {
                    return null;
                }
                usleep(500000);
            }
        }
        return Command::SUCCESS;
    }

    private function attackVin3s($booking, $account, $dateTomorrow) {
        try {
            $data = '{"PlaceId":' . $booking['id'] . ',"UtilityId":' . $booking['vin3s_utilities'] . ',"UtilityTimeConstraintId":' . $booking['vin3s_utilities_time'] . ',"DateOfUse":"' . $dateTomorrow . '","TransId":' . $this->getTrans($account->token, $booking['place_utility_id'], $account->account_id) . ',"NumberJoinIn":1,"CustomerVinHomeId":' . $account->account_id . ',"ApartmentId":' . $account->apartment . ',"PlaceUtilityId":' . $booking['place_utility_id'] . ',"ParentOrderId":0,"UtilityExtraTimeSpan":0,"CountExtraTimeSpan":0,"ChargePersonCount":0,"PersonPrice":0,"TimeSpanPrice":0,"CurrentPersonJoin":0,"NumberOfResidentTickets":1,"NumberOfGuestTickets":0,"OptionalInfo":"Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/108.0.0.0"}';
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
                            "apiVersion": "eelGzTXkFAJdL_NCAUHueg"
                        },
                        "viewName": "MainFlow.ConfirmBooking",
                        "inputParameters": {
                            "AccessToken": "' . $account->token . '",
                            "OrderParamsEncrypt": "' . bin2hex(base64_decode($this->encrypt(($data)))) . '",
                            "PaymentMethodId": 1,
                            "locale": "vn",
                            "PlaceUtilityTicketId": "0",
                            "reCAPTCHAv3_Token": ""
                        }
                    }',
                CURLOPT_HTTPHEADER => array(
                    'X-CSRFToken: ' . config('app.vin3s.CSRFToken'),
                    'Content-Type: application/json',
                )
            ));
            $response = curl_exec($curl);
            curl_close($curl);
            return $response;
        } catch (\ErrorException $e) {
            Log::error($e->getMessage());
        }
    }

    private function encrypt($data) {
        return openssl_encrypt($data, 'AES-256-CBC', $this->key, 0, $this->IV) . "\n";
    }

    private function getTrans($token, $PlaceUtilityId, $CustomerVinhomeId) {
        try {
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/ConfirmBooking/ActionInsertTransactionRequest',
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
                        "apiVersion": "xpNp+Pd4m9hkWXypx4R07Q"
                    },
                    "viewName": "MainFlow.ConfirmBooking",
                    "inputParameters": {
                        "AccessToken": "' . $token . '",
                        "PlaceUtilityId": "' . $PlaceUtilityId . '",
                        "CustomerVinhomeId": "' . $CustomerVinhomeId . '",
                        "NumberOfGuestTickets": 0
                    }
                }',
                CURLOPT_HTTPHEADER => array(
                    'X-CSRFToken: ' . config('app.vin3s.CSRFToken'),
                    'Content-Type: application/json',
                )
            ));
            $response = curl_exec($curl);
            curl_close($curl);
            $parseData = json_decode($response);
            return $parseData->data->Transaction->Id;
        } catch (\ErrorException $e) {
            Log::error($e->getMessage());
        }
        return null;
    }
}
