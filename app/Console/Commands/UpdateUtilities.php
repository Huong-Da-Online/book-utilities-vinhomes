<?php

namespace App\Console\Commands;

use App\Models\Vin3sAccount;
use App\Models\Vin3sUtilities;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class UpdateUtilities extends Command {
    protected $signature = 'command:update-utilities';

    protected $description = 'Update utilities';

    public function handle() {
        try {
            $account = Vin3sAccount::select('token')
                ->where('status', true)
                ->whereNotNull('token')
                ->first();

            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/Utilities/ActionGetUtilities',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => '{
                "versionInfo": {
                    "moduleVersion": "R2PaZs9y1n6Y9cweeXmSng",
                    "apiVersion": "C0LXT28Kaj9QdI3RQPfgyA"
                },
                "viewName": "MainFlow.Utilities",
                "inputParameters": {
                    "AccessToken": "' . $account->token . '"
                }
            }',
                CURLOPT_HTTPHEADER => array(
                    'X-CSRFToken: T6C+9iB49TLra4jEsMeSckDMNhQ=',
                    'Content-Type: application/json'
                ),
            ));
            $response = curl_exec($curl);
            curl_close($curl);
            $parseData = json_decode($response);
            DB::transaction(function () use ($parseData) {
                Vin3sUtilities::where('id', '<>', '')->delete();
                foreach ($parseData->data->UtilityList->List as $utility) {
                    Vin3sUtilities::create([
                        'id' => $utility->UtilityAndType->UtilityType->Id,
                        'name' => $utility->UtilityAndType->UtilityType->Name,
                        'img' => $utility->UtilityAndType->UtilityType->ImageUrl
                    ]);
                }
            });
            return Command::SUCCESS;
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return Command::FAILURE;
        }
    }
}
