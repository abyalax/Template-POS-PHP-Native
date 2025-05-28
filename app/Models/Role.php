<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDOException;
use PDO;

class Role {
    public static function getUserRoles($userId) {
        try {
            $db = Database::getConnection();
            $stmt = $db->prepare("
                SELECT r.name_role 
                FROM user_roles ur
                JOIN roles r ON ur.id_role = r.id_role
                WHERE ur.id_user = ?
            ");
            $stmt->execute([$userId]);
            return $stmt->fetchAll(PDO::FETCH_COLUMN)[0];
        }  catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query getUserRoles', compact('e'));
            throw $e;
        }
    }
}

