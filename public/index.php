<?php
require_once '../vendor/autoload.php';

use Abya\PointOfSales\Config\Config;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Routes\Routes;

$method = $_SERVER['REQUEST_METHOD'];
$url = $_SERVER['REQUEST_URI'];
$parsed = parse_url($url);
$path = $parsed['path'] ?? '/';

$queryParams = []; 
// $queryParams = []; 
// example http://localhost/point-of-sales/products/?id=2
// path endpoint tetap clean

// kalau pake param gini
// example http://localhost/point-of-sales/products/2
// endpoint harus di atur dengan regex misal 
// // Dynamic route /number
// 'products/(\d+)' => [
//     [AuthMiddleware::class, 'checkSession'],
//     [ProductController::class, 'manageProducts'] // data param bisa diakses di argument fungsi controller
// ],
// // Dynamic route /word
// 'products/(\w+)' => [
//     [AuthMiddleware::class, 'checkSession'],
//     [ProductController::class, 'manageProducts']
// ],

if (!empty($parsed['query'])) {
    parse_str($parsed['query'], $queryParams);
}

$prefix = Config::getBaseUrl();
$path = trim(substr($path, strlen($prefix)), '/');

LoggerConfig::getInstance()->debug('Request Entry Point: ', [
    'method' => $method,
    'path' => $path,
    'query' => $queryParams
]);

$method = $_SERVER['REQUEST_METHOD'];
$path = trim(substr($parsed['path'], strlen($prefix)), '/');

// Pisahkan route SSR dan API
if (str_starts_with($path, 'api/')) {
    // Handle API request
    header('Content-Type: application/json');
    Routes::apiRoutes($method, $path, $queryParams);
} else {
    // Handle SSR request
    Routes::webRoutes($method, $path, $queryParams);
}
