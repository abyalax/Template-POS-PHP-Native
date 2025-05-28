<?php

namespace Abya\PointOfSales\Middlewares;

use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\StatusResponse;
use Abya\PointOfSales\Config\Config;

class AuthMiddleware {
    public function checkSession() {
        $base_url = Config::getBaseUrl();
        session_start();
        if (!isset($_SESSION['user_id'])) {
            LoggerConfig::getInstance()->debug('Block from auth middleware');
            Helper::sendResponse(303, StatusResponse::redirect, null, "{$base_url}login");
            return false; // Blok eksekusi handler berikutnya
        }
        LoggerConfig::getInstance()->debug('Pass auth middleware');
        return true; // Lanjutkan eksekusi handler berikutnya
    }
}