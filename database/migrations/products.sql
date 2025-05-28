-- Kategori Produk
CREATE TABLE
    product_categories (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- Products Entity
CREATE TABLE
    products (
        category_id INT,
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        price DECIMAL(10, 2) NOT NULL,
        discount DECIMAL(10, 2) NOT NULL DEFAULT 0,
        barcode VARCHAR(50) NOT NULL UNIQUE,
        stock_qty INT NOT NULL DEFAULT 0,
        is_active BOOLEAN DEFAULT TRUE,
        cost_price DECIMAL(10, 2),
        tax_rate DECIMAL(5, 2) DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );