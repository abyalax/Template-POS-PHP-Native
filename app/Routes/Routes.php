<?php

namespace Abya\PointOfSales\Routes;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\StatusResponse;
use Abya\PointOfSales\Routes\WebRoutes;
use Abya\PointOfSales\Routes\ApiRoutes;

class Routes {
    public static function webRoutes($method, $path, $query) {
        $routes = WebRoutes::get();
        LoggerConfig::getInstance()->debug('WebRoutes: ', ['method' => $method, 'path' => $path, 'query' => $query]);
        self::handleRoutes($routes, $method, $path, $query);
    }

    public static function apiRoutes($method, $path, $query) {
        $routes = ApiRoutes::get();
        LoggerConfig::getInstance()->debug('ApiRoutes: ', ['method' => $method, 'path' => $path, 'query' => $query]);
        self::handleRoutes($routes, $method, $path, $query);
    }
    
    private static function handleRoutes($routes, $method, $path, $query) {
        LoggerConfig::getInstance()->debug('handleRoutes with : ', ['method' => $method, 'path' => $path, 'query' => $query]);
        foreach ($routes[$method] ?? [] as $routePattern => $handlers) {
            if (Helper::handleMatchQuery($routePattern, $handlers, $path, $query)) {
                return;
            }
        }
        Helper::sendResponse(404, StatusResponse::notfound, ['request' => $path]);
    }
}
