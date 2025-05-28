<?php

namespace Abya\PointOfSales\Models;

use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Config\LoggerConfig;
use PDO;
use PDOException;

class Product {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function findAll() {
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    p.id, p.name, p.price, p.discount, p.barcode, p.category_id, c.name AS category, p.stock_qty, p.is_active, p.cost_price, p.tax_rate
                FROM 
                    products p
                JOIN 
                    product_categories c ON p.category_id = c.id;
            ");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query findAll product', compact('e'));
            throw $e;
        }
    }

    public function findAllCategories() {
        try {
            $this->db = Database::getConnection();
            $stmt = $this->db->prepare("SELECT * FROM product_categories LIMIT 50;");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query findAll categories', compact('e'));
            throw $e;
        }
    }

    public function findAllActive() {
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    p.id, p.name, p.price, p.discount, p.barcode, p.category_id, c.name AS category, p.stock_qty, p.is_active, p.cost_price, p.tax_rate
                FROM 
                    products p
                JOIN 
                    product_categories c ON p.category_id = c.id
                WHERE 
                    p.is_active = 1;
            ");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findAll product active', compact('e'));
            throw $e;
        }
    }

    public function findById($id) {
        try {
            $stmt = $this->db->prepare("
            SELECT 
                p.id,
                p.barcode,
                p.category_id,
                p.name,
                p.price,
                p.discount,
                p.cost_price,
                p.tax_rate,
                p.stock_qty,
                p.is_active,
                pc.name AS category
            FROM products p
            JOIN product_categories pc ON p.category_id = pc.id
            WHERE p.id = :id;
            ");
            $stmt->execute(['id' => $id]);
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
            return $data;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findById product', compact('e'));
            throw $e;
        }
    }

    public function findByName($name) {
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    p.id, 
                    p.barcode, 
                    p.name, 
                    p.price, 
                    p.cost_price, 
                    p.tax_rate, 
                    p.discount,
                    pc.name as category 
                FROM 
                    products p 
                JOIN 
                    product_categories pc ON p.category_id = pc.id
                WHERE p.name LIKE :name;
            ");
            $stmt->execute(['name' => "%$name%"]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findByName product', compact('e'));
            throw $e;
        }
    }

    public function findCategoryById($id) {
        try {
            $stmt = $this->db->prepare("
                SELECT 
                    pc.id,
                    pc.name
                FROM 
                    products p
                JOIN 
                    product_categories pc ON p.category_id = pc.id
                WHERE 
                    p.id = :product_id;
            ");
            $stmt->execute(['product_id' => $id]);
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
            return $data;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findCategoryById', compact('e'));
            throw $e;
        }
    }

    public function search($keyword) {
        try {
            $stmt = $this->db->prepare("
                SELECT name FROM products
                WHERE name LIKE :keyword
                    AND stock_qty > 0 
                    AND is_active = true
                LIMIT 30;
            ");
            $stmt->execute(['keyword' => "%$keyword%"]);
            $result = $stmt->fetchAll(PDO::FETCH_COLUMN);
            return $result;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->error('Error Query findAll product', compact('e'));
            throw $e;
        }
    }

    public function insert($data) {
        try {
            $this->db->beginTransaction();

            $stmt = $this->db->prepare("
                INSERT INTO products (name, price, discount, barcode, category_id, stock_qty, is_active, cost_price, tax_rate)
                VALUES (:name, :price, :discount, :barcode, :category_id, :stock_qty, :is_active, :cost_price, :tax_rate);
            ");
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':discount', $data['discount']);
            $stmt->bindParam(':barcode', $data['barcode']);
            $stmt->bindParam(':category_id', $data['category_id']);
            $stmt->bindParam(':stock_qty', $data['stock_qty']);
            $stmt->bindParam(':is_active', $data['is_active']);
            $stmt->bindParam(':cost_price', $data['cost_price']);
            $stmt->bindParam(':tax_rate', $data['tax_rate']);

            $stmt->execute();

            $this->db->commit();
            return $stmt->rowCount();
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query insert product ', compact('e'));
            $this->db->rollBack();
            throw $e;
        }
    }

    public function insertCategory($name) {
        try {
            $this->db->beginTransaction();
            $stmt = $this->db->prepare("INSERT INTO product_categories (name) VALUES (:name)");
            $stmt->execute(['name' => $name]);
            $newId = $this->db->lastInsertId();
            $stmt = $this->db->prepare("SELECT * FROM product_categories WHERE id = :id LIMIT 50");
            $stmt->execute(['id' => $newId]);
            $newCategory = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->db->commit();
            return $newCategory;
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query insert category product ', compact('e'));
            $this->db->rollBack();
            throw $e;
        }
    }

    public function update($id, $data) {
        LoggerConfig::getInstance()->debug('Query Update Product', compact('id', 'data'));
        try {
            $this->db->beginTransaction();

            $stmt = $this->db->prepare("
                 UPDATE products SET
                    name = :name,
                    price = :price,
                    discount = :discount,
                    barcode = :barcode,
                    category_id = :category_id,
                    stock_qty = :stock_qty,
                    is_active = :is_active,
                    cost_price = :cost_price,
                    tax_rate = :tax_rate
                WHERE id = :id;
            ");
            $stmt->bindParam(':id', $id);
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':discount', $data['discount']);
            $stmt->bindParam(':barcode', $data['barcode']);
            $stmt->bindParam(':category_id', $data['category_id']);
            $stmt->bindParam(':stock_qty', $data['stock_qty']);
            $stmt->bindParam(':is_active', $data['is_active']);
            $stmt->bindParam(':cost_price', $data['cost_price']);
            $stmt->bindParam(':tax_rate', $data['tax_rate']);

            $stmt->execute();

            $this->db->commit();
            return $stmt->rowCount();
        } catch (PDOException $e) {
            LoggerConfig::getInstance()->debug('Error Query update product ', compact('e'));
            $this->db->rollBack();
            throw $e;
        }
    }
}
