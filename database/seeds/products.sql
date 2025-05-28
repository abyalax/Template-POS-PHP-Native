-- Hapus semua data sebelum seeding (gunakan dengan hati-hati)
SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE product_categories;

TRUNCATE TABLE products;

SET
    FOREIGN_KEY_CHECKS = 1;

-- Products Entity
INSERT INTO
    product_categories (name)
VALUES
    ('Makanan'),
    ('Minuman'),
    ('Perlengkapan Rumah'),
    ('Elektronik'),
    ('Perawatan Pribadi'),
    ('Hair Styling');

INSERT INTO
    products (name, price, discount, barcode, category_id, stock_qty, is_active, cost_price, tax_rate)
VALUES
    -- Makanan
    ('Biskuit Roma Kelapa 300g', 12000.00, 0.00, '8991001101234', 1, 50, true, 8500.00, 0.10),
    ('Chitato BBQ 68g', 9500.00, 0.05, '8998866201234', 1, 30, true, 7000.00, 0.10),
    -- Minuman
    ('Aqua Botol 600ml', 4000.00, 0.00, '8998765432101', 2, 100, true, 2500.00, 0.10),
    ('Teh Botol Sosro 450ml', 5000.00, 0.00, '8992711234567', 2, 70, true, 3200.00, 0.10),
    -- Perlengkapan Rumah
    ('Sabun Cuci Piring Sunlight 755ml', 14500.00, 0.10, '8999999998888', 3, 40, true, 11000.00, 0.10),
    -- Elektronik
    ('Lampu LED Philips 10W', 29000.00, 0.00, '8998765987654', 4, 20, true, 22000.00, 0.10),
    -- Perawatan Pribadi
    ('Shampoo Pantene 180ml', 23000.00, 0.13, '8999991122334', 5, 25, true, 17000.00, 0.10),
    ('NIVEA MEN Extra Bright 50ml', 25000.00, 0.08, '8999777888350', 5, 53, true, 15000.00, 0.10),
    -- Hair Styling
    ('GATSBY Powder Clay Unbrekable smooth 20g', 49000.00, 0.00, '8992222056700', 6, 75, true, 45000.00, 0.10);