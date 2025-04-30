<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class DashboardController extends BaseController {
    public function index() {
        LoggerConfig::getInstance()->debug('Get Dashboard Page');
        $this->smarty->assign('url', '/point-of-sales/');
        $this->smarty->display('pages/index.tpl');
    }

    public function dashboard() {
        LoggerConfig::getInstance()->debug('Get Dashboard Page');
        $this->smarty->assign('url', '/point-of-sales/dashboard');
        $this->smarty->assign('page', 'Dashboard Page');
        $this->smarty->display('pages/dashboard.tpl');
    }
};
