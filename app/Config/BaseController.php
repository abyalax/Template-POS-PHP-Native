<?php
namespace Abya\PointOfSales\Config;

use Abya\PointOfSales\Config\SmartyConfig;
use Abya\PointOfSales\Models\User;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Models\Role;
use Smarty\Smarty;
use Abya\PointOfSales\Config\Config;

class BaseController {
    protected Smarty $smarty;
    protected string $base_url;

    public function __construct() {

        $this->smarty = SmartyConfig::getInstance();
        $this->base_url = Config::getBaseUrl();

        if (isset($_SESSION['user_id'])) {
            $userModel = new User();
            $roleModel = new Role();

            $user = $userModel->findById($_SESSION['user_id']);
            $role = $roleModel->getUserRoles($user['id']);
            $data = [
                'id' => $user['id'],
                'name' => $user['name'],
                'email' => $user['email'],
                'phone' => $user['phone'],
                'nip' => $user['nip'],
                'role' => $role[0],
            ];
            LoggerConfig::getInstance()->debug('User Authenticated : ', ['data' => $data]);
            $this->smarty->assign('auth_user', $data);
            $this->smarty->assign('base_url', $this->base_url);
        }
    }
}
