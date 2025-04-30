<?php

namespace Abya\PointOfSales\Services;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Models\User;
use Abya\PointOfSales\Models\Role;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;

class AuthService {
    public static function login($email, $password) {
        LoggerConfig::getInstance()->debug('Masuk Login Service', ['email' => $email, 'password' => $password]);
        $model = new User();
        $user = $model->findByEmail($email);

        LoggerConfig::getInstance()->debug('User Data', ['data' => $user]);

        if (!$user) {
            Helper::sendResponse(404, 'error', 'Email tidak ditemukan');
            return false;
        }

        $isValid = Helper::verifySha256Password($password, $user['password']);

        if ($isValid) {
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
