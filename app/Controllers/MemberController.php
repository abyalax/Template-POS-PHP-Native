<?php
namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\BaseController;

class MemberController extends BaseController {

    public function index() {
        LoggerConfig::getInstance()->debug('Get Member Page');
        $this->smarty->assign('page', 'Member Page');
        $this->smarty->display('pages/member.tpl');
    }

};
