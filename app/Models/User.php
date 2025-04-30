<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use PDOException;
use Abya\PointOfSales\Config\LoggerConfig;
use PDO;

class User {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function findByEmail($email): array {
        try {
            $stmt = $this->db->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            return $stmt->fetch(PDO::FETCH_ASSOC) ?: [];
        }  catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query getUserRoles', compact('e'));
            throw $e;
        }
    }

    public function findById($id) {
        try {
            $stmt = $this->db->prepare("SELECT * FROM users WHERE id = ?");
            $stmt->execute([$id]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findById user', compact('e'));
            throw $e;
        }
    }
    
    public function findAll(): array {
        try {
            $stmt = $this->db->prepare("SELECT * FROM users;");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findById user', compact('e'));
            throw $e;
        }
    }
    
}
