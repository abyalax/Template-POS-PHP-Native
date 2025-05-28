CREATE TABLE
    users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        nip VARCHAR(11) NOT NULL UNIQUE,
        phone VARCHAR(20) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    roles (id_role INT AUTO_INCREMENT PRIMARY KEY, name_role VARCHAR(50) NOT NULL);

CREATE TABLE
    user_roles (
        id_user INT NOT NULL,
        id_role INT NOT NULL,
        PRIMARY KEY (id_user, id_role),
        FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE,
        FOREIGN KEY (id_role) REFERENCES roles (id_role) ON DELETE CASCADE
    );

CREATE TABLE
    permissions (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL UNIQUE);

CREATE TABLE
    role_permissions (
        id_role INT NOT NULL,
        id_permission INT NOT NULL,
        PRIMARY KEY (id_role, id_permission),
        FOREIGN KEY (id_role) REFERENCES roles (id_role) ON DELETE CASCADE,
        FOREIGN KEY (id_permission) REFERENCES permissions (id) ON DELETE CASCADE
    );