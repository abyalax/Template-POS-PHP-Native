<?php

namespace Abya\PointOfSales\Services;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Models\User;
use Abya\PointOfSales\Models\Role;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\StatusResponse;

class AuthService {
    public static function login($email, $password) {
        LoggerConfig::getInstance()->debug('Masuk Login Service', ['email' => $email, 'password' => $password]);
        $model = new User();
        $user = $model->findByEmail($email);

        LoggerConfig::getInstance()->debug('User Data', ['data' => $user]);

        if (!$user) {
            LoggerConfig::getInstance()->debug('Email tidak ditemukan');
            Helper::sendResponse(404, StatusResponse::notfound);
            return false;
        }

        $isValid = Helper::verifySha256Password($password, $user['password']);

        if ($isValid) {
            ini_set('session.cookie_httponly', 1);
            // ini_set('session.cookie_secure', 1); // Hanya kalau sudah HTTPS
            ini_set('session.use_only_cookies', 1);
            session_set_cookie_params([
                'lifetime' => 86400, // 24 jam
                'path' => '/',
                // 'secure' => true,   // HTTPS only
                'httponly' => true, // JS tidak bisa baca cookie
                'samesite' => 'Strict'
            ]);
            session_start();
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['roles'] = Role::getUserRoles($user['id']);
            session_regenerate_id(true);
            LoggerConfig::getInstance()->debug('Services: Login berhasil');
            return true;
        }
        return false;
    }

    public static function logout() {
        session_start();
        session_destroy();
    }
}
