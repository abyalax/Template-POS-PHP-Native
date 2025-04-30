-- Hapus semua data sebelum seeding (gunakan dengan hati-hati)
SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE user_roles;

TRUNCATE TABLE role_permissions;

TRUNCATE TABLE users;

TRUNCATE TABLE roles;

TRUNCATE TABLE permissions;

SET
    FOREIGN_KEY_CHECKS = 1;

-- Users Entity
-- Insert Roles (Hak Akses)
INSERT INTO
    roles (name_role)
VALUES
    ('Super Admin'),
    ('Owner'),
    ('Admin'),
    ('Manager'),
    ('Kasir'),
    ('Karyawan');

-- Insert Permissions (Hak Akses yang Bisa Dilakukan)
INSERT INTO
    permissions (name)
VALUES
    -- Transactions
    ('manage_transactions'),
    ('process_transactions'),
    ('create_transactions'),
    ('read_transactions'),
    -- Inventaris
    ('manage_inventory'),
    ('read_inventory'),
    -- Analytics
    ('manage_analytics'),
    ('process_analytics'),
    ('read_analytics'),
    -- Suppliers
    ('manage_suppliers'),
    ('read_suppliers'),
    -- Members
    ('manage_members'),
    ('read_members'),
    ('update_members'),
    -- Karyawan
    ('manage_employees'),
    ('read_employees'),
    -- Products
    ('manage_products'),
    ('read_products'),
    -- Payments
    ('manage_payments'),
    ('process_payments'),
    ('read_payments'),
    -- Settings
    ('manage_settings'),
    ('read_settings');

-- Insert Users (6 users sesuai data)
INSERT INTO
    users (name, email, nip, phone, password)
VALUES
    -- Super Admin
    (
        'root',
        'root@gmail.com',
        '00000000001',
        '087765290290',
        SHA2 ('root', 256)
    ),
    -- Owner
    (
        'abya owner',
        'abyaowner@gmail.com',
        '00000000002',
        '087765290291',
        SHA2 ('abya-owner', 256)
    ),
    -- Admin
    (
        'abya admin',
        'abyaadmin@gmail.com',
        '00000000003',
        '087765290292',
        SHA2 ('abya-admin', 256)
    ),
    -- Manager
    (
        'abya manager',
        'abyamanager@gmail.com',
        '00000000004',
        '087765290293',
        SHA2 ('abya-manager', 256)
    ),
    -- Kasir
    (
        'abya kasir',
        'abyakasir@gmail.com',
        '00000000005',
        '087765290294',
        SHA2 ('abya-kasir', 256)
    ),
    -- Karyawan
    (
        'abya karyawan',
        'abyakaryawan@gmail.com',
        '00000000006',
        '087765290295',
        SHA2 ('abya-karyawan', 256)
    );

-- Hubungkan User ke Role
INSERT INTO
    user_roles (id_user, id_role)
VALUES
    (1, 1), -- root → Super Admin
    (2, 2), -- abya owner → Owner
    (3, 3), -- abya admin → Admin
    (4, 4), -- abya manager → Manager
    (5, 5), -- abya kasir → Kasir
    (6, 6);

-- abya karyawan → Karyawan
-- Hubungkan Role ke Permission (Sesuai dengan spesifikasi akses)
-- Super Admin
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4), -- Transactions
    (1, 5),
    (1, 6), -- Inventaris
    (1, 7),
    (1, 8),
    (1, 9), -- Analytics
    (1, 10),
    (1, 11), -- Suppliers
    (1, 12),
    (1, 13),
    (1, 14), -- Members
    (1, 15),
    (1, 16), -- Karyawan
    (1, 17),
    (1, 18), -- Products
    (1, 19),
    (1, 20),
    (1, 21), -- Payments
    (1, 22),
    (1, 23);

-- Settings
-- Owner
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (2, 1),
    (2, 4), -- Transactions
    (2, 5),
    (2, 6), -- Inventaris
    (2, 7),
    (2, 9), -- Analytics
    (2, 10),
    (2, 11), -- Suppliers
    (2, 12),
    (2, 13), -- Members
    (2, 15),
    (2, 16), -- Karyawan
    (2, 17),
    (2, 18), -- Products
    (2, 19),
    (2, 21), -- Payments
    (2, 22),
    (2, 23);

-- Settings
-- Admin
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (3, 1),
    (3, 4), -- Transactions
    (3, 5),
    (3, 6), -- Inventaris
    (3, 8),
    (3, 9), -- Analytics
    (3, 10),
    (3, 11), -- Suppliers
    (3, 12),
    (3, 13),
    (3, 14), -- Members
    (3, 15),
    (3, 16), -- Karyawan
    (3, 17),
    (3, 18), -- Products
    (3, 21), -- Payments
    (3, 23);

-- Settings
-- Manager
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (4, 4), -- Transactions (read)
    (4, 6), -- Inventaris (read)
    (4, 8),
    (4, 9), -- Analytics (process + read)
    (4, 11), -- Suppliers (read)
    (4, 13),
    (4, 14), -- Members (read + update)
    (4, 16), -- Karyawan (read)
    (4, 18), -- Products (read)
    (4, 21), -- Payments (read)
    (4, 23);

-- Settings (read)
-- Kasir
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (5, 2), -- Transactions (process + create + read)
    (5, 3), -- Transactions (process + create + read)
    (5, 4), -- Transactions (process + create + read)
    (5, 6), -- Inventaris (read)
    (5, 9), -- Analytics (read)
    (5, 11), -- Suppliers (read)
    (5, 13),
    (5, 14), -- Members (read + update)
    (5, 16), -- Karyawan (read)
    (5, 18), -- Products (read)
    (5, 20),
    (5, 21), -- Payments (process + read)
    (5, 23);

-- Settings (read)
-- Karyawan
INSERT INTO
    role_permissions (id_role, id_permission)
VALUES
    (6, 4), -- Transactions (read)
    (6, 6), -- Inventaris (read)
    (6, 9), -- Analytics (read)
    (6, 11), -- Suppliers (read)
    (6, 13), -- Members (read)
    (6, 16), -- Karyawan (read)
    (6, 18), -- Products (read)
    (6, 21), -- Payments (read)
    (6, 23); -- Settings (read)

-- Products Entity
INSERT INTO products (name, price) VALUES 
    ('Product 1', 10000.00),
    ('Product 2', 1900.00),
    ('Product 3', 50000.00),
    ('Product 4', 12500.00),
    ('Product 5', 86000.00),
    ('Product A', 10000.00),
    ('Product B', 1900.00),
    ('Product C', 50000.00),
    ('Product D', 12500.00),
    ('Product E', 86000.00);