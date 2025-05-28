-- Transaction Entity
CREATE TABLE
    transactions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        cashier VARCHAR(100) NOT NULL,
        transaction_id VARCHAR(50) NOT NULL UNIQUE,
        status VARCHAR(50) NOT NULL,
        payment_method VARCHAR(50) NOT NULL,
        subtotal DECIMAL(10, 2) NOT NULL,
        total_discount DECIMAL(10, 2) NOT NULL DEFAULT 0,
        total_price DECIMAL(10, 2) NOT NULL,
        total_profit DECIMAL(10, 2) NOT NULL DEFAULT 0,
        total_tax DECIMAL(10, 2) NOT NULL DEFAULT 0,
        last_price DECIMAL(10, 2) NOT NULL,
        pay_received DECIMAL(10, 2) NOT NULL,
        pay_return DECIMAL(10, 2) NOT NULL DEFAULT 0,
        notes VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Transaction Items Entity
CREATE TABLE
    transaction_items (
        id INT AUTO_INCREMENT PRIMARY KEY,
        transaction_id INT NOT NULL,
        product_id INT NOT NULL,
        barcode VARCHAR(50) NOT NULL,
        name VARCHAR(100) NOT NULL,
        category VARCHAR(100) NOT NULL,
        quantity INT NOT NULL DEFAULT 1,
        cost_price DECIMAL(10, 2) NOT NULL,
        sell_price DECIMAL(10, 2) NOT NULL DEFAULT 0,
        discount DECIMAL(10, 2) NOT NULL DEFAULT 0,
        tax_rate DECIMAL(5, 2) NOT NULL DEFAULT 0,
        final_price DECIMAL(10, 2) NOT NULL DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT fk_transaction_items_transaction FOREIGN KEY (transaction_id) REFERENCES transactions (id) ON DELETE CASCADE
    );