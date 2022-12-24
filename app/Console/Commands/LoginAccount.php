<?php

namespace App\Console\Commands;

use App\Models\Vin3sAccount;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class LoginAccount extends Command {
    protected $signature = 'command:login-vin3s';
    protected $description = 'Login account vin3s';

    public function handle() {
        $vin3sAccounts = Vin3sAccount::where('status', true)->get();
        foreach ($vin3sAccounts as $account) {
            try {
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://otsprod.vin3s.vn/VinHomeMobileApp/screenservices/VinHomeMobileApp/MainFlow/SignIn/ActionDoLoginv2',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '{
                        "versionInfo": {
                            "moduleVersion": "' . config('app.vin3s.moduleVersion') .'",
                            "apiVersion": "' . config('app.vin3s.apiVersion') .'"
                        },
                        "viewName": "MainFlow.SignIn",
                        "inputParameters": {
                            "Username": "' . $account->username . '",
                            "Password": "' . $account->password . '",
                            "FromIP": "",
                            "IsForRegister": false
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
                $updateVin3sAccount = [];
                if ($parseData->data->Response->IsSuccess) {
                    $updateVin3sAccount['token'] = $parseData->data->ResUserToken->Access_token;
                    $updateVin3sAccount['login_at'] = Carbon::now();
                    $updateVin3sAccount['other_data'] = json_encode($parseData->data);
                } else {
                    $updateVin3sAccount['status'] = false;
                }
                Vin3sAccount::where('id', $account->id)->update($updateVin3sAccount);

                return Command::SUCCESS;
            } catch (\ErrorException $e) {
                Log::log($e->getMessage());
                return Command::FAILURE;
            }
        }
    }
}
