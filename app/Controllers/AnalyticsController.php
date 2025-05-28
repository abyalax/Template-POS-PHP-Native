<?php

namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;
use Abya\PointOfSales\Models\Analytics;
use Abya\PointOfSales\Config\StatusResponse;
use Respect\Validation\Exceptions\NestedValidationException;
use Abya\PointOfSales\Config\Helper;
use Throwable;

class AnalyticsController extends BaseController {

    public function dashboard() {
        $this->smarty->assign('page', 'Dashboard Analytics Page');
        $this->smarty->display('pages/transaction/dashboard.tpl');
    }

    public function index() {
        $this->smarty->assign('page', 'Analytics Page');
        $this->smarty->display('pages/analytics.tpl');
    }

    public function getReportSalesByMonth() {
        try {
            $model = new Analytics();
            $find = $model->agregateSalesByMonth();
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                LoggerConfig::getInstance()->debug('Found getReportSales: ', $find);
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error getReportSales ', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getReportSales', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getReportSalesByYear() {
        try {
            $model = new Analytics();
            $find = $model->agregateSalesByYear();
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                LoggerConfig::getInstance()->debug('Found getReportSales: ', $find);
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error getReportSales ', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getReportSales', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }
    
    public function getReportSalesByCategory() {
        try {
            $model = new Analytics();
            $find = $model->agregateSalesByCategory();
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                LoggerConfig::getInstance()->debug('Found getReportSalesByCategory: ', $find);
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error getReportSalesByCategory ', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getReportSalesByCategory', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }
};
