<?php

namespace Abya\PointOfSales\Config;

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class Config {
    public static function initApplication() {
        // Secara default, sembunyikan semua error dari browser
        ini_set('display_errors', '0');
        ini_set('display_startup_errors', '0');
        error_reporting(E_ALL);

        // Tangani warning, notice, dsb. agar tidak tampil di browser
        set_error_handler(function ($errno, $errstr, $errfile, $errline) {
            if (in_array($errno, [
                E_WARNING,
                E_NOTICE,
                E_USER_WARNING,
                E_USER_NOTICE,
                E_DEPRECATED,
                E_USER_DEPRECATED,
                E_STRICT
            ])) {
                // Log error saja
                LoggerConfig::getInstance()->error('Non-fatal error', compact('errno', 'errstr', 'errfile', 'errline'));
                return true; // jangan tampilkan ke browser
            }
            // Untuk error lainnya, biarkan default handler (bisa error fatal)
            return false;
        });

        // Tangani fatal error di akhir eksekusi
        register_shutdown_function(function () {
            $error = error_get_last();
            if ($error && in_array($error['type'], [E_ERROR, E_PARSE, E_CORE_ERROR, E_COMPILE_ERROR])) {
                // Fatal error terdeteksi, aktifkan display agar terlihat
                ini_set('display_errors', '1');

                // Bisa langsung echo manual juga jika mau kontrol penuh
                echo "<pre style='color:red'>";
                echo "Fatal Error: {$error['message']} in {$error['file']} on line {$error['line']}";
                echo "</pre>";
            }
        });
    }
    public static function getBaseUrl(): string {
        return $_ENV['BASE_URL'];
    }
    public static function getDomain(): string {
        return $_ENV['DOMAIN'];
    }
}
