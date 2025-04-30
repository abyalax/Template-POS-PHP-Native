<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class SupplierController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Supplier Page');
        $this->smarty->assign('page', 'Supplier Page');
        $this->smarty->display('pages/supplier.tpl');
    }

};
