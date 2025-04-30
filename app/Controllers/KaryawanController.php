<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class KaryawanController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Karyawan Page');
        $this->smarty->assign('page', 'Karyawan Page');
        $this->smarty->display('pages/karyawan.tpl');
    }

};
