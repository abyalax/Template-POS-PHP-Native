<?php

namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Respect\Validation\Exceptions\NestedValidationException;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Models\User;
use Abya\PointOfSales\Config\BaseController;
use Abya\PointOfSales\Config\StatusResponse;

class UserController extends BaseController {
    public function index() { }

    public function getAllUsers() {
        LoggerConfig::getInstance()->debug('Masuk Controller Get All Users');
        header('Content-Type: application/json');
        try {
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {

                $data = new User();
                $result = $data->findAll();

                LoggerConfig::getInstance()->debug('Result Searching Data Users', compact('result'));
                Helper::sendResponse(200, StatusResponse::success, $result);
            } else {
                Helper::sendResponse(405, StatusResponse::notallowed);
            }
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (\Exception $exception) {
            $errors = $exception->getMessage();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            Helper::sendResponse(500, StatusResponse::error);
        }
    }
}
