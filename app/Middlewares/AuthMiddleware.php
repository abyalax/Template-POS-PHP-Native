<?php

namespace Abya\PointOfSales\Middlewares;

use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\StatusResponse;

class AuthMiddleware {
    public function checkSession() {
        session_start();
        if (!isset($_SESSION['user_id'])) {
            LoggerConfig::getInstance()->debug('Block from auth middleware');
            Helper::sendResponse(303, StatusResponse::redirect, null, '/point-of-sales/login');
            return false; // Blok eksekusi handler berikutnya
        }
        LoggerConfig::getInstance()->debug('Pass auth middleware');
        return true; // Lanjutkan eksekusi handler berikutnya
    }
}