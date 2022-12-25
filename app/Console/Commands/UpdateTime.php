<?php

namespace App\Console\Commands;

use App\Models\Vin3sAccount;
use App\Models\Vin3sUtilities;
use App\Models\Vin3sUtilitiesTime;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class UpdateTime extends Command {
    protected $signature = 'command:update-time';
    protected $description = 'Update time';

    public function handle() {
        $account = Vin3sAccount::select('token')
            ->where('status', true)
            ->whereNotNull('token')
            ->first();
        $utilities = Vin3sUtilities::get();
        foreach ($utilities as $utility) {
            $dataUtility = $this->getUtility($utility->id, $account->token);
            DB::transaction(function () use ($utility, $dataUtility) {
                Vin3sUtilitiesTime::where('vin3s_utilities_id', $utility->id)->delete();
                foreach ($dataUtility->data->WorkingTime->List[count($dataUtility->data->WorkingTime->List) - 1]->Times->List as $_utility) {
                    Vin3sUtilitiesTime::create([
                        'id' => $_utility->id,
                        'vin3s_utilities_id' => $utility->id,
                        'name' => $_utility->FromTime . ' - ' . $_utility->ToTime
                    ]);
                }
            });
        }
        return Command::SUCCESS;
    }

    private function getUtility($id, $token) {
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
                    "apiVersion": "Z+2nC8vCgm5BBMHQqGA8Tw"
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
        return json_decode($response);
    }
}
