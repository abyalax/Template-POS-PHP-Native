-- Hapus semua data sebelum seeding (gunakan dengan hati-hati)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE user_roles;
TRUNCATE TABLE role_permissions;
TRUNCATE TABLE users;
TRUNCATE TABLE roles;
TRUNCATE TABLE permissions;
SET FOREIGN_KEY_CHECKS = 1;

-- Users Entity

-- Insert Roles (Hak Akses)
INSERT INTO roles (name_role) VALUES 
    ('Admin'),
    ('Kasir'),
    ('Supervisor');

-- Insert Permissions (Hak Akses yang Bisa Dilakukan)
INSERT INTO permissions (name) VALUES 
    ('create_user'),
    ('edit_user'),
    ('delete_user'),
    ('view_sales'),
    ('manage_inventory');

-- Insert Users (Dummy User untuk Testing)
INSERT INTO users (name, email, nip, phone, password, created_userid, updated_userid) VALUES 
    ('Admin POS', 'admin@gmail.com', '1001', '081234567890', SHA2('adminPass', 256), NULL, NULL),
    ('Kasir POS', 'kasir@gmail.com', '2002', '081234567891', SHA2('kasirPass', 256), NULL, NULL),
    ('Supervisor POS', 'supervisor@gmail.com', '3003', '081234567892', SHA2('supervisorPass', 256), NULL, NULL);

-- Hubungkan User ke Role
INSERT INTO user_roles (id_user, id_role) VALUES 
    (1, 1),  -- Admin POS → Admin
    (2, 2),  -- Kasir POS → Kasir
    (3, 3);  -- Supervisor POS → Supervisor

-- Hubungkan Role ke Permission
INSERT INTO role_permissions (id_role, id_permission) VALUES 
    (1, 1),  -- Admin bisa create_user
    (1, 2),  -- Admin bisa edit_user
    (1, 3),  -- Admin bisa delete_user
    (2, 4),  -- Kasir bisa read_sales
    (3, 5);  -- Supervisor bisa manage_inventory

-- Products Entity
INSERT INTO products (name, price) VALUES 
    ('Product 1', 10000.00),
    ('Product 2', 1900.00),
    ('Product 3', 50000.00),
    ('Product 4', 12500.00),
    ('Product 5', 86000.00);
