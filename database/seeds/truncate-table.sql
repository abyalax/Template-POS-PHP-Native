-- Hapus semua data sebelum seeding (gunakan dengan hati-hati)
SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE user_roles;

TRUNCATE TABLE role_permissions;

TRUNCATE TABLE users;

TRUNCATE TABLE roles;

TRUNCATE TABLE permissions;

TRUNCATE TABLE product_categories;

TRUNCATE TABLE products;

SET
    FOREIGN_KEY_CHECKS = 1;
