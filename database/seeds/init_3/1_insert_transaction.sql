-- Transaction Entity
-- Transaction 1
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax,
        total_profit  -- ini baru di tambahkan, nilainya belum di update
    )
VALUES
    (1, 3, 'TRX202504001', 'completed', 'debit', NULL, 78000.0, 82610.0, 2900.0, 85378.0, 2768.0, 7510.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (1, 3, '8999999998888', 'Sabun Cuci Piring Sunlight 755ml', 14500.0, 0.1, 0.1, 2, 11000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (1, 3, '8992222056700', 'GATSBY Powder Clay Unbrekable smooth 20g', 49000.0, 0.0, 0.1, 1, 45000.0);

-- Transaction 2
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (2, 2, 'TRX202504002', 'completed', 'debit', NULL, 97500.0, 103477.5, 225.0, 104540.0, 1062.5, 6202.5);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (2, 2, '8998866201234', 'Chitato BBQ 68g', 9500.0, 0.05, 0.1, 1, 7000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (2, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 3, 2500.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (2, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 2, 22000.0);

-- Transaction 3
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (3, 1, 'TRX202504003', 'completed', 'cash', NULL, 90500.0, 96535.0, 1140.0, 100210.0, 4675.0, 6175.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (3, 1, '8991001101234', 'Biskuit Roma Kelapa 300g', 12000.0, 0.0, 0.1, 2, 8500.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (3, 4, '8992711234567', 'Teh Botol Sosro 450ml', 5000.0, 0.0, 0.1, 2, 3200.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (3, 7, '8999991122334', 'Shampoo Pantene 180ml', 23000.0, 0.13, 0.1, 2, 17000.0);

-- Transaction 4
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (4, 1, 'TRX202504004', 'completed', 'qris', NULL, 135000.0, 143295.0, 1200.0, 145473.0, 2178.0, 7495.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (4, 5, '8999999998888', 'Sabun Cuci Piring Sunlight 755ml', 14500.0, 0.1, 0.1, 3, 11000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (4, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 3, 22000.0);

-- Transaction 5
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (5, 1, 'TRX202504005', 'completed', 'cash', NULL, 61000.0, 65770.0, 0.0, 69429.0, 3659.0, 4770.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (5, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 2, 22000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (5, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 3, 2500.0);

-- Transaction 6
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (6, 1, 'TRX202504006', 'completed', 'cash', NULL, 60500.0, 65335.0, 0.0, 69707.0, 4372.0, 4835.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (6, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 2, 22000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (6, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 3, 2500.0);

-- Transaction 7
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (7, 2, 'TRX202504007', 'completed', 'qris', NULL, 71000.0, 75890.0, 0.0, 78930.0, 3040.0, 4890.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (7, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 2, 22000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (7, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 3, 2500.0);

-- Transaction 8
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (8, 2, 'TRX202504008', 'completed', 'cash', NULL, 38000.0, 40940.0, 0.0, 43423.0, 2483.0, 2940.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (8, 4, '8992711234567', 'Teh Botol Sosro 450ml', 5000.0, 0.0, 0.1, 2, 3200.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (8, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 2, 2500.0);

-- Transaction 9
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (9, 3, 'TRX202504009', 'completed', 'debit', NULL, 53000.0, 57170.0, 0.0, 60236.0, 3066.0, 4170.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (9, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 2, 2500.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (9, 6, '8998765987654', 'Lampu LED Philips 10W', 29000.0, 0.0, 0.1, 1, 22000.0);

-- Transaction 10
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        notes,
        subtotal,
        total,
        total_discount,
        pay_received,
        pay_change,
        tax
    )
VALUES
    (10, 1, 'TRX202504010', 'completed', 'cash', NULL, 32000.0, 34960.0, 0.0, 36480.0, 1520.0, 2960.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (10, 3, '8998765432101', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 2, 2500.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (10, 4, '8992711234567', 'Teh Botol Sosro 450ml', 5000.0, 0.0, 0.1, 2, 3200.0);