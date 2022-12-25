<?php

namespace App\Console\Commands;

use App\Models\Vin3sAccount;
use App\Models\Vin3sUtilities;
use App\Models\Vin3sUtilitiesPlace;
use App\Models\Vin3sUtilitiesTime;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class UpdatePlace extends Command {
    protected $signature = 'command:update-place';
    protected $description = 'update-place';

    public function handle() {
        $account = Vin3sAccount::select('token')
            ->where('status', true)
            ->whereNotNull('token')
            ->first();
        $utilitiesTime = Vin3sUtilitiesTime::groupBy('vin3s_utilities_id')
            ->get();
        foreach ($utilitiesTime as $utility) {
            $dataUtility = $this->getUtility($utility->id, $account->token);
            DB::transaction(function () use ($utility, $dataUtility) {
                Vin3sUtilitiesPlace::where('vin3s_utilities_id', $utility->id)->delete();
                foreach ($dataUtility->data->Response->ListPlaceIsAvailable->List as $_utility) {
                    Vin3sUtilitiesPlace::create([
                        'id' => $_utility->Place->Id,
                        'vin3s_utilities_id' => $utility->id,
                        'name' => $_utility->Place->Name,
                        'place_utility_id' => $_utility->PlaceUtilityId,
                    ]);
                }
            });
        }
        return Command::SUCCESS;
    }

    private function getUtility($id, $token) {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/Places/ActionGetPlaceByTime2',
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
                    "apiVersion": "KCpAt9jGsHnT2dXpI6aciA"
                },
                "viewName": "MainFlow.Places",
                "inputParameters": {
                    "AccessToken": "' . $token . '",
                    "UtilityTimeConstraintId": "' . $id . '",
                    "DateOfUse": "' . Carbon::now()->addDay()->format('Y-m-d') . '",
                    "UtilityClassifyId": "0",
                    "AdditionalInfo": {
                        "NumberOfResidentTickets": 0
                    },
                    "Lang": "vi-VN"
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
