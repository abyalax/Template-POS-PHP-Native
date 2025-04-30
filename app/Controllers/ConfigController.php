<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\Config;
use Abya\PointOfSales\Config\StatusResponse;

class ConfigController {
    
    public function config() {
        Helper::sendResponse(200, StatusResponse::success, [
            ['base_url' => Config::getBaseUrl()]
        ]);
    }
}