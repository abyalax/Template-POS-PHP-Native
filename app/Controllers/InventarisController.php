<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\SmartyConfig;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class InventarisController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Inventaris Page');
        $this->smarty->assign('page', 'Inventaris Page');
        $this->smarty->display('pages/inventaris.tpl');
    }

};
