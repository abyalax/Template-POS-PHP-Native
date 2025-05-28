<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDO;
use PDOException;

class Analytics {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function agregateSalesByMonth() {
        try {
            $stmt = $this->db->prepare("
                SELECT
                    SUM(subtotal) AS total_sales,       -- penjualan kotor (belum diskon, pajak, dll)
                    SUM(total_profit) AS total_profit,  -- keuntungan total
                    SUM(last_price) AS total_revenue    -- pendapatan bersih (setelah diskon dan pajak)
                FROM
                    transactions
                WHERE
                    status = 'completed' -- atau sesuaikan dengan status transaksi valid
                GROUP BY
                    DATE_FORMAT(created_at, '%Y-%m')
                ORDER BY
                    DATE_FORMAT(created_at, '%Y-%m') 
                    ASC
                ;
            ");

            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query getReportSales transactions', compact('e'));
            throw $e;
        }
    }

    public function agregateSalesByYear() {
        try {
            $stmt = $this->db->prepare("
                SELECT
                    SUM(subtotal) AS total_sales, -- penjualan kotor (belum diskon dan pajak)
                    SUM(total_profit) AS total_profit, -- keuntungan total
                    SUM(last_price) AS total_revenue -- pendapatan bersih (setelah diskon dan pajak)
                FROM
                    transactions
                WHERE
                    status = 'completed' -- atau sesuaikan dengan status transaksi valid
                GROUP BY
                    DATE_FORMAT (created_at, '%Y')
                ;
            ");

            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query getReportSales transactions', compact('e'));
            throw $e;
        }
    }

    public function agregateSalesByCategory() {
        try {
            $stmt = $this->db->prepare(" 
                SELECT
                    category,
                    SUM(final_price) as total_revenue,
                    SUM(sell_price) as total_sales,
                    SUM(sell_price - cost_price - discount) as total_profit,
                    SUM(quantity) as total_qty
                FROM
                    transaction_items
                GROUP BY
                    category;
            ");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query getReportSales transactions', compact('e'));
            throw $e;
        }
    }
}
