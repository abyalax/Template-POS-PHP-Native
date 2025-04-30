-- Transaction 1
INSERT INTO
    transactions (
        id,
        user_id,
        transaction_id,
        status,
        payment_method,
        subtotal, -- 36000.0
        total, -- 36800.0
        total_discount, -- 0.0
        pay_received, -- 40000.0
        pay_change, -- 3200.0
        tax, -- 800.0
        total_profit -- 6000.0
    )
VALUES
    (1, 3, 'TRX202504001', 'completed', 'cash', 36000.0, 36800.0, 0.0, 40000.0, 3200.0, 800.0, 6000.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (1, 3, '8999999998888', 'Aqua Botol 600ml', 4000.0, 0.0, 0.1, 2, 2500.0);

INSERT INTO
    transaction_items (transaction_id, product_id, barcode, name, price, discount, tax_rate, quantity, cost_price)
VALUES
    (1, 10, '8992222056700', 'Nourishing Pomade 40g', 28000.0, 0.0, 0.1, 1, 25000.0);