<?php
require_once '../vendor/autoload.php';

use Abya\PointOfSales\Config\Config;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Routes\Routes;

Config::initApplication();

$method = $_SERVER['REQUEST_METHOD'];
$url = $_SERVER['REQUEST_URI'];
$parsed = parse_url($url);
$path = $parsed['path'] ?? '/';

$queryParams = []; 

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

if (str_starts_with($path, 'api/')) {
    header('Content-Type: application/json');
    Routes::apiRoutes($method, $path, $queryParams);
} else {
    Routes::webRoutes($method, $path, $queryParams);
}