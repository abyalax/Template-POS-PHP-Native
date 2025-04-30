<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDO;
use PDOException;

class Transaction {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function insert($data) {
        try {
            $this->db->beginTransaction();

            $stmt = $this->db->prepare("
                INSERT INTO
                    transactions (id, user_id, transaction_id, status, payment_method, subtotal, total, total_discount, pay_received, pay_change, tax, total_profit)
                VALUES
                    (:id, :user_id, :transaction_id, :status, :payment_method, :subtotal, :total, :total_discount, :pay_received, :pay_change, :tax, :total_profit );
            ");

            // TODO
            // $totalProfit

            $stmt->bindParam(':id', $data['id']);
            $stmt->bindParam(':user_id', $data['user_id']);
            $stmt->bindParam(':transaction_id', $data['transaction_id']);
            $stmt->bindParam(':status', $data['status']);
            $stmt->bindParam(':payment_method', $data['payment_method']);
            $stmt->bindParam(':subtotal', $data['subtotal']);
            $stmt->bindParam(':total', $data['total']);
            $stmt->bindParam(':total_discount', $data['total_discount']);
            $stmt->bindParam(':pay_received', $data['pay_received']);
            $stmt->bindParam(':pay_change', $data['pay_change']);
            $stmt->bindParam(':tax', $data['tax']);
            $stmt->bindParam(':total_profit', $data['total_profit']);

            $stmt->execute();

            $this->db->commit();
            return $stmt->rowCount();
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query insert product ', compact('e'));
            $this->db->rollBack();
            throw $e;
        }
    }

    public function findAll() {
        try {
            $stmt = $this->db->prepare("SELECT * FROM transactions LIMIT 25");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query findAll transactions', compact('e'));
            throw $e;
        }
    }
}