<?php

namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\BaseController;
use Abya\PointOfSales\Config\StatusResponse;
use Abya\PointOfSales\Models\Transaction;
use Respect\Validation\Exceptions\NestedValidationException;
use Respect\Validation\Validator as V;
use Throwable;

class TransactionController extends BaseController {

    public function home() {
        LoggerConfig::getInstance()->debug('Get View Home Page');
        $this->smarty->assign('page', 'Home Page');
        $this->smarty->display('pages/index.tpl');
    }

    public function index() {
        LoggerConfig::getInstance()->debug('Get View Transaction Page');
        $this->smarty->assign('page', 'Transaction Page');
        $model = new Transaction();
        $data = $model->findAll();
        $this->smarty->assign('transactions', [$data]);
        $this->smarty->display('pages/transaction/index.tpl');
    }

    public function getView() {
        LoggerConfig::getInstance()->debug('Get View Transaction List Page');
        $transaction = new Transaction();
        $data = $transaction->findAll();
        $this->smarty->assign('transactions', $data);
        $this->smarty->assign('page', 'Transaction List Page');
        $this->smarty->display('pages/transaction/get.tpl');
    }

    public function getViewByID($paramID) {
        LoggerConfig::getInstance()->debug('Get View Transaction By ID Page');
        $transaction = new Transaction();
        $data = $transaction->findByID($paramID);
        $this->smarty->assign('transaction', $data);
        $this->smarty->assign('page', 'Transaction Page');
        $this->smarty->display('pages/transaction/detail.tpl');
    }

    public function getTransactions() {
        try {
            $model = new Transaction();
            $find = $model->findAll();

            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error getTransactions', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getTransactions', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getTransactionByID($paramID): void {
        try {
            LoggerConfig::getInstance()->debug('Find Transaction By ID', compact('id'));
            $model = new Transaction();
            $find = $model->findByID($paramID);
            LoggerConfig::getInstance()->debug('Found Transaction by ID: ', $find);
            
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error getTransaction  By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getTransaction ByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function createTransaction() {
        try {
            $json = file_get_contents('php://input');
            $data = json_decode($json, true);
            if (!$data) {
                Helper::sendResponse(400, StatusResponse::badrequest);
            }

            V::stringType()->notEmpty()->assert($data['status']);
            V::numericVal()->assert($data['subtotal']);
            V::numericVal()->assert($data['total_discount']);
            V::numericVal()->assert($data['total_price']);
            V::numericVal()->assert($data['total_profit']);
            V::numericVal()->assert($data['total_tax']);
            V::numericVal()->assert($data['last_price']);
            V::numericVal()->assert($data['pay_received']);
            V::numericVal()->assert($data['pay_return']);
            V::stringType()->notEmpty()->assert($data['payment_method']);
            V::arrayType()->notEmpty()->assert($data['item']);

            foreach ($data['item'] as $i => $item) {
                try {
                    V::stringType()->length(2, 255)->assert($item['name']);
                    V::numericVal()->min(1)->assert($item['qty']);
                    V::numericVal()->assert($item['price']);
                    V::numericVal()->assert($item['cost_price']);
                    V::numericVal()->assert($item['tax_rate']);
                    V::numericVal()->assert($item['discount']);
                    V::arrayType()->assert($item['summary']);

                    V::keySet(
                        V::key('name', V::stringType()->notEmpty()),
                        V::key('sub_total', V::numericVal()),
                        V::key('total_discount', V::numericVal()),
                        V::key('total_price', V::numericVal()),
                        V::key('unit_profit', V::numericVal()),
                        V::key('total_profit', V::numericVal()),
                        V::key('total_tax', V::numericVal()),
                        V::key('last_price', V::numericVal())
                    )->assert($item['summary']);
                } catch (NestedValidationException $e) {
                    $errors = $e->getMessages();
                    if (!is_array($errors)) {
                        $errors = [$errors];
                    }
                    LoggerConfig::getInstance()->error('Error Creating Transaction', $errors);
                    Helper::sendResponse(400, StatusResponse::badrequest);
                }
            }

            LoggerConfig::getInstance()->debug('Creating Transaction', compact('data'));

            $model = new Transaction();
            $query = $model->insert($data);
            if ($query) {
                Helper::sendResponse(201, StatusResponse::created, $query);
            } else {
                Helper::sendResponse(400, StatusResponse::badrequest);
            }
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->error('Error Creating Transaction', compact('errors'));
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error Transaction', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }
};
