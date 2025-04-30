<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\SmartyConfig;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class SettingController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Settings Page');
        $this->smarty->assign('page', 'Settings Page');
        $this->smarty->display('pages/setting.tpl');
    }

};
