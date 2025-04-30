# 📌 Documentation

## 💻 Install Laragon

Untuk menginstall **Laragon v6**, ikuti langkah-langkah berikut:

### 1️⃣ Download Laragon
Buka halaman [GitHub Laragon v6](https://github.com/leokhoa/laragon/releases/tag/6.0.0) dan pilih salah satu versi berikut:

- **Rekomendasi**: `laragon-wamp.exe` (sudah built in Apache, MySQL, PHP, dll. Cocok untuk pemula yang minim set up )
- **Alternatif**: `laragon.exe` ( Lite version, harus install Apache & MySQL sendiri. Ini lebih flexible jika harus menentukan versi php dan mysql )


**📌 Note**
```
Setting path environtment mysql dan php milik laragon agar bisa dijalankan via terminal, karena laragon tidak menyediakan GUI untuk manajemen database.
php nanti akan dipakai untuk install dan pakai composer (manajemen dependency)
```

### 2️⃣ Instalasi Laragon
1. Jalankan **installer** (`laragon-wamp.exe` atau `laragon.exe`).
2. Pilih direktori instalasi (contoh: `C:\Software\Laragon`).
3. Ikuti proses instalasi hingga selesai.

### 3️⃣ Menjalankan Laragon
1. Buka **Laragon**.
2. Klik **Start All** untuk menjalankan Apache dan MySQL.
3. Pastikan semua service berjalan dengan baik.

### 4️⃣ Menguji Instalasi
1. Buka browser dan akses `http://localhost`.
2. Jika halaman Laragon muncul, maka instalasi berhasil!

> **Catatan:** Jika menggunakan `laragon.exe` (Lite version), kita harus menambahkan Apache dan MySQL secara manual melalui **Menu > Tools > Quick Add**.

## 🌐 Konfigurasi Web Server

Menggunakan Laragon dengan engine Apache dan fitur auto-create virtual host. Root folder diatur ke path proyek.

### Konfigurasi `httpd-vhosts.conf`
Jika menggunakan runner web server selain Laragon, tambahkan konfigurasi berikut secara manual:

```apache
<VirtualHost *:80>
    ServerName point-of-sales
    DocumentRoot "C:/Users/abya/Desktop/PHP/point-of-sales"
    <Directory "C:/Users/abya/Desktop/PHP/point-of-sales">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

### Konfigurasi `.htaccess`

#### `.htaccess` di root proyek
```apache
RewriteEngine On

# Redirect semua request ke public/index.php
RewriteCond %{REQUEST_URI} !^/public/
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /public/index.php [L,QSA]
```

#### `.htaccess` di folder `public`
```apache
RewriteEngine On

# Redirect semua request ke index.php
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php [QSA,L]
```

### Pengujian Setup
Akses proyek di browser dengan URL: 

http://localhost/point-of-sales/

Untuk memastikan setup berhasil, buat file `index.php` dalam folder `public` dengan isi:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <h1>Success setup web server</h1>
</body>
</html>
```

Jika konfigurasi benar, halaman akan menampilkan:
```
Success setup web server
```

## 📂 Struktur Folder
```
└── 📁point-of-sales
    └── 📁app
        └── 📁Config
            └── SmartyConfig.php
        └── 📁Controllers
            └── HomeController.php
        └── 📁Routes
            └── Routes.php
    └── 📁docs
    └── 📁public
        └── .htaccess
        └── index.php
    └── 📁templates
    └── .gitignore
    └── .htaccess
    └── composer.json
    └── composer.lock
    └── README.md
```

## ⚡ Install dan Initialize Composer Management Dependency
Klik [Download Composer](https://getcomposer.org/Composer-Setup.exe) ini, kemudian install.

📌 Note
```
Restart IDE dan terminal setelah install composer, karena environment baru saja diubah, mungkin IDE dan terminal belum membacanya. ini contoh jika composer sudah dikenali

PS C:\Users\abya\Desktop\PHP\point-of-sales> composer --version
Composer version 2.8.5 2025-01-21 15:23:40
PHP version 8.1.10 (C:\Application\laragon\bin\php\php-8.1.10-Win32-vs16-x64\php.exe)
Run the "diagnose" command to get more detailed diagnostics output.
PS C:\Users\abya\Desktop\PHP\point-of-sales> 


```
Buka terminal integrated di IDE, kemudian jalankan perintah ini
```sh
composer init
```
Maka akan muncul prompt interaktif, ikuti contoh jawaban berikut :
```sh
  Welcome to the Composer config generator

This command will guide you through creating your composer.json config.

Package name (<vendor>/<name>) [abya/point-of-sales]:
Description []: Projects Point Of Sales
Author [abyalax <abyalaxx@gmail.com>, n to skip]:
Minimum Stability []:
Package Type (e.g. library, project, metapackage, composer-plugin) []:
License []:

Define your dependencies.

Would you like to define your dependencies (require) interactively [yes]?
Search for a package:
Would you like to define your dev dependencies (require-dev) interactively [yes]?
Search for a package:
Add PSR-4 autoload mapping? Maps namespace "Abya\Dummy" to the entered relative path. [src/, n to skip]: app/

{
    "name": "abya/point-of-sales",
    "description": "Projects Point Of Sales",
    "autoload": {
        "psr-4": {
            "Abya\\PointOfSales\\": "app/",
        }
    },
    "authors": [
        {
            "name": "abyalax",
            "email": "abyalaxx@gmail.com"
        }
    ],
    "require": {}
}

Do you confirm generation [yes]?
Composer could not detect the root package (abya/dummy) version, defaulting to '1.0.0'. See https://getcomposer.org/root-version
Generating autoload files
Generated autoload files
PSR-4 autoloading configured. Use "namespace Abya\PointOfSales;" in app/
Include the Composer autoloader with: require 'vendor/autoload.php';

```

Install dependency smarty dengan menjalankan perintah berikut
```sh
composer require smarty/smarty
```

---

## 🚀 Konfigurasi Autoloading PSR-4 
pastikan di `composer.json` ada baris ini, jika tidak ada tambahakan :
```json
"autoload": {
    "psr-4": {
        "Abya\\PointOfSales\\": "app/"
    }
}
```

Lalu jalankan:
```sh
composer dump-autoload -o
```

Disini pastikan tidak ada pesan warning di terminal, jika sukses maka hanya akan muncul pesan berikut
```sh
Generating optimized autoload files
Generated optimized autoload files containing 168 classes
```
AutoLoading digunakan untuk konsep namespace sehingga bisa mempermudah import dependency antar file.

---

## ⚙️ Konfigurasi Smarty (app/Config/SmartyConfig.php)
```php
<?php
namespace Abya\PointOfSales\Config;

require_once __DIR__ . '/../../vendor/autoload.php';

use Smarty\Smarty;

class SmartyConfig {
    public static function getInstance(): Smarty {
        $smarty = new Smarty();
        $smarty->setTemplateDir(__DIR__ . '/../../templates');
        $smarty->setCompileDir(__DIR__ . '/../../templates_c');
        $smarty->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $smarty->setCacheDir(__DIR__ . '/../../cache');
        $smarty->setConfigDir(__DIR__ . '/../../config');

        return $smarty;
    }
}

```

---

## 📍 Konfigurasi Routes (app/Routes/Routes.php)
```php
<?php
namespace Abya\PointOfSales\Routes;

use Abya\PointOfSales\Controller;

class Routes {
    public static function getRoutes(): array {
        return [
            "point-of-sales" => Controller::class . "@index",
        ];
    }
}

```

---

## 📌 Controller untuk Menampilkan View (app/Controllers/HomeController.php)
```php
<?php
namespace Abya\PointOfSales\Controllers;

use Abya\PointOfSales\Config\SmartyConfig;

require_once __DIR__ . '/../../vendor/autoload.php';

class HomeController extends BaseController {
    public function index() {
        $smarty = SmartyConfig::getInstance();

        $smarty->assign('title', 'Halaman Utama');
        $smarty->assign('message', 'Selamat datang di sistem POS! from new controller');

        // Render template
        $smarty->display('index.tpl');
    }
}

```

Pada bagian ini 
```php
$smarty->assign('title', 'Halaman Utama');
$smarty->assign('message', 'Selamat datang di sistem POS! from new controller');
```
adalah contoh dummy data untuk testing pengiriman data ke smarty php

---

## 📄 Template View (templates/index.tpl)
```tpl
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$title}</title>
</head>

<body>
    <h1>{$message}</h1>
</body>
</html>
```

---

## 🚀 Entry Point (public/index.php)
```php
<?php
require_once __DIR__ . '/../vendor/autoload.php';

use Abya\PointOfSales\Routes\Routes;

$routes = Routes::getRoutes();

$request = trim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');

if (isset($routes[$request])) {
    list($controllerName, $method) = explode('@', $routes[$request]);

    if (class_exists($controllerName)) {
        $controller = new $controllerName();
        
        if (method_exists($controller, $method)) {
            echo $controller->$method();
        } else {
            http_response_code(500);
            echo "Method '$method' not found in controller '$controllerName'";
        }
    } else {
        http_response_code(500);
        echo "Controller '$controllerName' not found";
    }
} else {
    http_response_code(404);
    echo "404 Not Found";
}
```
---

## Check Progress
**✅Project berhasil berjalan di web server**

**✅Smarty berhasil diintegrasikan.**

**✅View (`.tpl`) bisa menerima data dari controller.**

**✅Konsep autoloading PSR-4 diterapkan dengan benar.**

## 📑 Integrasi Database mysql dengan PDO
Install vlucas phpdotenv untuk membaca file .env dengan peirntah berikut
```sh
composer require vlucas/phpdotenv
```
Tambahkan kode ini di public/index.php
```php
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();
```

Kemudian buat file app/Config/Database.php, isikan code berikut
```php
<?php
namespace Abya\PointOfSales\Config;

use PDO;
use PDOException;

class Database {
    private static ?PDO $connection = null;

    public static function getConnection(): PDO {
        if (self::$connection === null) {
            try {
                $dsn = "mysql:host=" . $_ENV['DB_HOST'] . ";dbname=" . $_ENV['DB_DATABASE'] . ";port=" . $_ENV['DB_PORT'];
                self::$connection = new PDO($dsn, $_ENV['DB_USERNAME'], $_ENV['DB_PASSWORD']);
                self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                die("Database connection failed: " . $e->getMessage());
            }
        }
        return self::$connection;
    }
}
```

## 📑 Buat Model Class User
Buat file User.php di lokasi berikut

```
└── 📁app
    └── 📁Config
    └── 📁Controllers
    └── 📁Models
        └── User.php
    └── 📁Routes
```

Tulis kode berikut 
```php
<?php
namespace Abya\PointOfSales\Models;
use PDO;

class User {
    private $db;

    public function __construct($pdo) {
        $this->db = $pdo;
    }

    public function find($id) {
        $stmt = $this->db->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_OBJ);
    }
}
```

## 💻 Tampilkan data dari database ke smarty PHP
Buka file HomeController.php, dan tambahkan kode berikut untuk mengirim data user ke smarty PHP
```php
use Abya\PointOfSales\Config\Database;
use Abya\PointOfSales\Models\User;

$data = new User(Database::getConnection());
$findUser = $data->find(1);
$user = [
    'id' => $findUser->id,
    'name' => $findUser->name,
    'email' => $findUser->email,
    'phone' => $findUser->phone,
    'nip' => $findUser->nip,
];
$smarty->assign('user', $user);
```

Kemudian di file templates/index.tpl, tambahkan kode ini 
```html
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>: {$user.id}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>: {$user.name}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>: {$user.email}</td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>: {$user.phone}</td>
        </tr>
    </tbody>
</table>
```
Buka browser, maka seharusnya sekarang jika direfresh akan muncul data berikut
```
ID	    : 1
Name	: Admin POS
Email	: admin@gmail.com
Phone:	: 081234567890
```

## 📳 Integrasi JQuery
Main JQuery

Install libary jquery dengan composer menggunakan perintah berikut 
```sh
composer require components/jquery
```
Setelah terinstal, buka file template/index.tpl, tambahkan script jquery pada bagian head
```html
<script src="../vendor/components/jquery/jquery.min.js"></script>
```
kemudian didalam body, dibawah tag table
```html
<button id="btn-click">Klik Saya</button>
<p id="result">Belum diklik.</p>
<script>
    $(document).ready(function() {
        $("#btn-click").click(function() {
            $("#result").text("Tombol telah diklik!");
        });
    });
</script>
```
Buka browser lagi, coba klik button. jika text berubah dengan dinamis, berarti jquery berhasil dijalankan.

JQuery UI

JQuery UI dibutuhkan untuk menjalankan fitur auto complete dengan JQuery.
Install libary jquery UI dengan composer menggunakan perintah berikut
```sh
composer require components/jqueryui
```


## ℹ️ Install Logger Monolog
Install Logger dengan perintah berikut
```sh
composer require monolog/monolog
```
Kemudian buat file config di sini
```
└── 📁app
    └── 📁Config
        └── Logger.php
```
Tulis code berikut
```php
<?php
require_once __DIR__ . '/../../vendor/autoload.php';
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
$log = new Logger('app_logger');
$log->pushHandler(new StreamHandler(__DIR__ . '../../../logs/app.log', Logger::DEBUG));
return $log;
```


## 🔎 Install Data Validator 
Install respect validation dengan perintah berikut
```sh
composer require respect/validation
```
