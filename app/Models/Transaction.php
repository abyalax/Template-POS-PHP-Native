<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDO;
use PDOException;
use Throwable;

class Transaction {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function findAll() {
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, 
                    total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes
                FROM transactions 
                LIMIT 50;
            ");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query findAll transactions', compact('e'));
            throw $e;
        }
    }

    public function findByID($id) {
        LoggerConfig::getInstance()->debug('Find Transaction by ID', [$id]);
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, 
                    total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes
                FROM transactions 
                WHERE id = :id;
            ");
            $stmt->execute(['id' => $id]);
            $find = $stmt->fetch(PDO::FETCH_ASSOC);
            LoggerConfig::getInstance()->debug('Found Transaction by ID', [$find]);
            return $find;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query findAll transactions', compact('e'));
            throw $e;
        }
    }

    public function insert($data) {
        try {
            $modelUser = new User();
            $user = $modelUser->findById($_SESSION['user_id']);
            $cashier = $user['name'];

            $this->db->beginTransaction();
            $generatedTransactionId = self::generateIdTransaction();

            $stmt = $this->db->prepare("
                INSERT INTO
                    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, 
                    total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes)
                VALUES
                    (:user_id, :cashier, :transaction_id, :status, :payment_method, :subtotal, :total_discount, 
                    :total_price, :total_profit, :total_tax, :last_price, :pay_received, :pay_return, :notes);
            ");

            $stmt->execute([
                'user_id'         => $_SESSION['user_id'],
                'cashier'         => $cashier,
                'transaction_id'  => $generatedTransactionId,
                'status'          => 'completed',
                'payment_method'  => $data['payment_method'],
                'subtotal'        => $data['subtotal'],
                'total_discount'  => $data['total_discount'],
                'total_price'     => $data['total_price'],
                'total_profit'    => $data['total_profit'],
                'total_tax'       => $data['total_tax'],
                'last_price'      => $data['last_price'],
                'pay_received'    => $data['pay_received'],
                'pay_return'      => $data['pay_return'],
                'notes'           => $data['notes'] ?? null,
            ]);

            $transactionId = $this->db->lastInsertId();

            $stmtItems = $this->db->prepare("
                INSERT INTO transaction_items (
                    transaction_id, product_id, barcode, name, category,
                    quantity, cost_price, sell_price, discount, tax_rate, final_price
                ) VALUES (
                    :transaction_id, :product_id, :barcode, :name, :category,
                    :quantity, :cost_price, :sell_price, :discount, :tax_rate, :final_price
                )   
            ");

            $updateStock = $this->db->prepare("
                UPDATE products
                SET stock_qty = stock_qty - :quantity
                WHERE id = :id
            ");

            foreach ($data['item'] as $item) {
                $stmtItems->execute([
                    'transaction_id' => $transactionId,
                    'product_id'     => $item['product_id'],
                    'barcode'        => $item['barcode'],
                    'name'           => $item['name'],
                    'category'       => $item['category'],
                    'quantity'       => $item['qty'],
                    'cost_price'     => $item['cost_price'],
                    'sell_price'     => $item['price'],
                    'discount'       => $item['discount'] * $item['qty'],
                    'tax_rate'       => $item['tax_rate'],
                    'final_price'    => $item['summary']['last_price'],
                ]);

                $updateStock->execute([
                    'quantity' => $item['qty'],
                    'id'       => $item['product_id'],
                ]);

            }

            $query = $this->db->commit();

            if ($query) {
                return ['transaction_id' => $generatedTransactionId];
            } else {
                return false;
            }
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query insert product ', compact('e'));
            $this->db->rollBack();
            throw $e;
            return false;
        } catch (Throwable $e) {
            LoggerConfig::getInstance()->debug('Error Data Query insert product', compact('e'));
            $this->db->rollBack();
            throw $e;
            return false;
        }
    }

    private function generateIdTransaction() {
        $lastIdStmt = $this->db->query("SELECT MAX(id) as last_id FROM transactions");
        $lastId = $lastIdStmt->fetch(PDO::FETCH_ASSOC)['last_id'] ?? 0;
        $year = substr(date('Y'), -2);
        $month = date('m');
        $date = date('d');
        $result = "TRX" . $date . $month . $year . str_pad($lastId + 1, 3, '0', STR_PAD_LEFT);
        return $result;
    }
}
