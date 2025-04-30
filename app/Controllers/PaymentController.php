<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class PaymentController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Payments Page');
        $this->smarty->assign('page', 'Payments Page');
        $this->smarty->display('pages/payment.tpl');
    }

};
