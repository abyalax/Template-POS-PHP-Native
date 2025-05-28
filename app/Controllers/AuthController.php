<?php

namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Services\AuthService;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;
use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\StatusResponse;
use Abya\PointOfSales\Models\Role;
use Abya\PointOfSales\Models\User;
use Respect\Validation\Validator as V;
use Respect\Validation\Exceptions\NestedValidationException;


class AuthController extends BaseController {
    
    public function getUserSession() {
        $id = $_SESSION['user_id'];
        $user = new User(Database::getConnection());
        $data = $user->findById($id);
        LoggerConfig::getInstance()->debug('Get User Session', compact('data'));
        Helper::sendResponse(200, StatusResponse::success, $data);
    }
    
    public function loginView() {
        $this->smarty->display('pages/auth/login.tpl');
    }
    
    public function registerView() {
        $this->smarty->display('pages/auth/register.tpl');
    }
    
    public function login() {
        try {
            LoggerConfig::getInstance()->debug('Masuk Login Controller');
            
            $email = $_POST['email'] ?? null;
            $password = $_POST['password'] ?? null;

            V::stringType()->length(6, 30)->assert($password);
            V::email()->assert($email);

            if (AuthService::login($email, $password)) {
                $role = Role::getUserRoles($_SESSION['user_id']);
                LoggerConfig::getInstance()->debug('Controller: Login berhasil as ', ['role' => $role]);

                switch ($role) {
                    case 'Super Admin':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}dashboard");
                        break;
                    case 'Owner':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}dashboard");
                        break;
                    case 'Admin':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}products");
                        break;
                    case 'Manager':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}product");
                        break;
                    case 'Kasir':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}transaction");
                        break;
                    case 'Karyawan':
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}karyawans");
                        break;
                    default:
                        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}transaction");
                        break;
                }

            } else {
                Helper::sendResponse(403, StatusResponse::unauthorized);
            }
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Validation error', $exception->getMessages());
            Helper::sendResponse(400, StatusResponse::badrequest, $errors);
        } catch (\Exception $exception) {
            $errors = $exception->getMessage();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Validation error', $errors);
            Helper::sendResponse(400, StatusResponse::badrequest, $errors);
        }
    }

    public function logout() {
        AuthService::logout();
        Helper::sendResponse(303, StatusResponse::redirect, null, "{$this->base_url}login");
    }
}
