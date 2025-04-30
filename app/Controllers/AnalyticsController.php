<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class AnalyticsController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Analytics Page');
        $this->smarty->assign('page', 'Analytics Page');
        $this->smarty->display('pages/analytics.tpl');
    }

};
