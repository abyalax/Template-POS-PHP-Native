<?php

namespace Abya\PointOfSales\Routes;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Controllers\AuthController;
use Abya\PointOfSales\Controllers\ConfigController;
use Abya\PointOfSales\Controllers\UserController;
use Abya\PointOfSales\Controllers\ProductController;
use Abya\PointOfSales\Controllers\TransactionController;
use Abya\PointOfSales\Middlewares\AuthMiddleware;

class ApiRoutes {
    public static function get() {
        return [
            'GET' => [
                'api/config' => [
                    [ConfigController::class, 'config'],
                ],
                'api/session' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [AuthController::class, 'getUserSession'],
                ],
                'api/users' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [UserController::class, 'getAllUsers'],
                ],
                'api/products' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'getProducts'],
                ],
                'api/product/categories' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'getCategories'],
                ],
                'api/product/category/(\d+)' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'getCategoryByID'],
                ],
            ],
            'POST' => [
                'api/login' => [
                    [AuthController::class, 'login'],
                ],
                'api/logout' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [AuthController::class, 'logout'],
                ],
                'api/products' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'search'],
                ],
                'api/product/create' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'createProduct'],
                ],
                'api/transaction/create' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [TransactionController::class, 'createTransaction'],
                ],
                'api/product/name' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'getProductByName'],
                ],
                'api/product/id' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'getProductByID'],
                ],
                'api/product/category/create' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'addCategoryProducts'],
                ],
            ],
            'PUT' => [
                'api/product/update/(\d+)' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'updateProduct'],
                ],
            ]
        ];
    }
}
