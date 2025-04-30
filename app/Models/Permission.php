<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDOException;
use PDO;

class Permission {
    public static function getRolePermissions($roleName) {
        try {
            $db = Database::getConnection();
            $stmt = $db->prepare("
                SELECT p.name 
                FROM role_permissions rp
                JOIN roles r ON rp.id_role = r.id_role
                JOIN permissions p ON rp.id_permission = p.id
                WHERE r.name_role = ?
            ");
            $stmt->execute([$roleName]);
            return $stmt->fetchAll(PDO::FETCH_COLUMN);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query getUserRoles', compact('e'));
            throw $e;
        }
    }
}
