<?php

namespace Abya\PointOfSales\Services;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Models\Permission;
use Laminas\Permissions\Rbac\Rbac;
use PDO;

class RBACService {
    private static $rbac;

    public static function init() {
        if (!self::$rbac) {
            self::$rbac = new Rbac();
            
            $db = Database::getConnection();
            $roles = $db->query("SELECT name_role FROM roles")->fetchAll(PDO::FETCH_COLUMN);
            
            foreach ($roles as $role) {
                self::$rbac->addRole($role);
                $permissions = Permission::getRolePermissions($role);
                foreach ($permissions as $perm) {
                    self::$rbac->getRole($role)->addPermission($perm);
                }
            }
        }
        return self::$rbac;
    }

    public static function check($roles, $permission) {
        $rbac = self::init();
        foreach ($roles as $role) {
            if ($rbac->isGranted($role, $permission)) {
                return true;
            }
        }
        return false;
    }
}