-- Hapus semua data sebelum seeding (gunakan dengan hati-hati)
SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE transactions;

TRUNCATE TABLE transaction_items;

SET
    FOREIGN_KEY_CHECKS = 1;

-- Dummy data transaksi untuk tahun 2024 (2 transaksi per bulan)
-- Januari 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX240105001', 'completed', 'cash', 35000.00, 1500.00, 33500.00, 1200.00, 3.35, 36853.50, 40000.00, 3146.50, 'Pembelian kebutuhan sehari-hari', '2024-01-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX240118002', 'completed', 'debit', 78000.00, 5000.00, 73000.00, 2500.00, 7.30, 80307.30, 80000.00, -307.30, 'Pembelian beberapa item elektronik kecil', '2024-01-30 14:30:00');

-- Februari 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (5, 'abya kasir', 'TRX240202003', 'completed', 'cash', 22500.00, 250.00, 22250.00, 800.00, 2.23, 24482.25, 25000.00, 517.75, 'Beli minuman dan snack', '2024-02-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX240215004', 'completed', 'credit', 120000.00, 12000.00, 108000.00, 4000.00, 10.80, 118810.80, 120000.00, 1189.20, 'Pembelian perlengkapan rumah tangga', '2024-02-29 14:30:00');

-- Maret 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX240309005', 'completed', 'e-wallet', 45000.00, 0.00, 45000.00, 1500.00, 4.50, 49504.50, 50000.00, 495.50, 'Beli beberapa produk perawatan pribadi', '2024-03-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX240322006', 'completed', 'cash', 60000.00, 3000.00, 57000.00, 2000.00, 5.70, 62705.70, 65000.00, 2294.30, 'Pembelian makanan dan minuman untuk acara', '2024-03-30 14:30:00');

-- April 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (3, 'abya kasir', 'TRX240403007', 'completed', 'debit', 30000.00, 500.00, 29500.00, 1000.00, 2.95, 32452.95, 35000.00, 2547.05, 'Beli snack dan perlengkapan mandi', '2024-04-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX240419008', 'completed', 'credit', 95000.00, 9500.00, 85500.00, 3200.00, 8.55, 94058.55, 95000.00, 941.45, 'Pembelian produk hair styling', '2024-04-30 14:30:00');

-- Mei 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX240511009', 'completed', 'e-wallet', 55000.00, 2000.00, 53000.00, 1800.00, 5.30, 58305.30, 60000.00, 1694.70, 'Beli minuman dan beberapa makanan ringan', '2024-05-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX240525010', 'completed', 'cash', 110000.00, 5500.00, 104500.00, 3800.00, 10.45, 114960.45, 115000.00, 39.55, 'Pembelian perlengkapan rumah tangga dan makanan', '2024-05-30 14:30:00');

-- Juni 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (1, 'abya kasir', 'TRX240607011', 'completed', 'debit', 40000.00, 1000.00, 39000.00, 1300.00, 3.90, 42903.90, 45000.00, 2096.10, 'Beli beberapa jenis minuman', '2024-06-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX240621012', 'completed', 'credit', 70000.00, 7000.00, 63000.00, 2200.00, 6.30, 69306.30, 70000.00, 693.70, 'Pembelian produk perawatan pribadi dan hair styling', '2024-06-30 14:30:00');

-- Juli 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX240704013', 'completed', 'e-wallet', 28000.00, 0.00, 28000.00, 900.00, 2.80, 30802.80, 30000.00, -802.80, 'Beli snack untuk perjalanan', '2024-07-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX240719014', 'completed', 'cash', 150000.00, 15000.00, 135000.00, 5000.00, 13.50, 148513.50, 150000.00, 1486.50, 'Pembelian beberapa item elektronik', '2024-07-30 14:30:00');

-- Agustus 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (4, 'abya kasir', 'TRX240810015', 'completed', 'debit', 32000.00, 320.00, 31680.00, 1100.00, 3.17, 34853.17, 35000.00, 146.83, 'Beli minuman dan makanan ringan untuk di rumah', '2024-08-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX240823016', 'completed', 'credit', 85000.00, 4250.00, 80750.00, 2800.00, 8.08, 88828.08, 90000.00, 1171.92, 'Pembelian perlengkapan mandi dan perawatan tubuh', '2024-08-30 14:30:00');

-- September 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX240906017', 'completed', 'e-wallet', 62000.00, 1800.00, 60200.00, 2100.00, 6.02, 66226.02, 65000.00, -1226.02, 'Beli beberapa produk makanan dan minuman', '2024-09-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX240920018', 'completed', 'cash', 130000.00, 6500.00, 123500.00, 4500.00, 12.35, 135862.35, 140000.00, 4137.65, 'Pembelian perlengkapan rumah dan beberapa snack', '2024-09-30 14:30:00');

-- Oktober 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (2, 'abya kasir', 'TRX241008019', 'completed', 'debit', 38000.00, 0.00, 38000.00, 1400.00, 3.80, 41803.80, 40000.00, 196.20, 'Beli minuman dan perlengkapan mandi', '2024-10-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX241026020', 'completed', 'credit', 90000.00, 9000.00, 81000.00, 3000.00, 8.10, 89108.10, 90000.00, 891.90, 'Pembelian produk hair styling dan perawatan pribadi', '2024-10-30 14:30:00');

-- November 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (7, 'andi kasir', 'TRX241103021', 'completed', 'e-wallet', 50000.00, 2500.00, 47500.00, 1700.00, 4.75, 52254.75, 55000.00, 2745.25, 'Beli beberapa makanan ringan dan minuman', '2024-11-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (8, 'dewi kasir', 'TRX241117022', 'completed', 'cash', 115000.00, 5750.00, 109250.00, 4000.00, 10.93, 120180.93, 120000.00, -180.93, 'Pembelian perlengkapan rumah dan beberapa snack', '2024-11-30 14:30:00');

-- Desember 2024
INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (2, 'abya kasir', 'TRX241201023', 'completed', 'debit', 42000.00, 0.00, 42000.00, 1500.00, 4.20, 46204.20, 50000.00, 3795.80, 'Beli minuman dan perlengkapan mandi', '2024-12-15 14:30:00');

INSERT INTO
    transactions (user_id, cashier, transaction_id, status, payment_method, subtotal, total_discount, total_price, total_profit, total_tax, last_price, pay_received, pay_return, notes, created_at)
VALUES
    (9, 'rini kasir', 'TRX241215024', 'completed', 'credit', 98000.00, 9800.00, 88200.00, 3300.00, 8.82, 97028.82, 100000.00, 2971.18, 'Pembelian produk hair styling dan perawatan pribadi untuk hadiah', '2024-12-30 14:30:00');