<?php

namespace Abya\PointOfSales\Routes;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Controllers\AnalyticsController;
use Abya\PointOfSales\Controllers\HomeController;
use Abya\PointOfSales\Controllers\DashboardController;
use Abya\PointOfSales\Controllers\InventarisController;
use Abya\PointOfSales\Controllers\KaryawanController;
use Abya\PointOfSales\Controllers\MemberController;
use Abya\PointOfSales\Controllers\PaymentController;
use Abya\PointOfSales\Controllers\ProductController;
use Abya\PointOfSales\Controllers\SettingController;
use Abya\PointOfSales\Controllers\SupplierController;
use Abya\PointOfSales\Controllers\TransactionController;
use Abya\PointOfSales\Controllers\AuthController;
use Abya\PointOfSales\Middlewares\AuthMiddleware;
use Abya\PointOfSales\Middlewares\RBACMiddleware;

class WebRoutes {
    public static function get() {
        return [
            'GET' => [
                // Tanpa middleware
                '' => [
                    [DashboardController::class, 'index']
                ],
                'dashboard' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [DashboardController::class, 'dashboard']
                ],
                // // Dynamic route /number
                // 'products/(\d+)' => [
                //     [AuthMiddleware::class, 'checkSession'],
                //     [ProductController::class, 'manageProducts'] // example http://localhost/point-of-sales/products/2
                // ],
                // // Dynamic route /word
                // 'products/(\w+)' => [
                //     [AuthMiddleware::class, 'checkSession'],
                //     [ProductController::class, 'manageProducts']
                // ],
                'login' => [
                    [AuthController::class, 'loginView']
                ],
                'register' => [
                    [AuthController::class, 'registerView']
                ],
                'transaction' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [TransactionController::class, 'index']
                ],
                'transactions' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [TransactionController::class, 'get']
                ],
                'inventaris' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [InventarisController::class, 'index']
                ],
                'analytics' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [AnalyticsController::class, 'index']
                ],
                'suppliers' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [SupplierController::class, 'index']
                ],
                'members' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [MemberController::class, 'index']
                ],
                'karyawans' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [KaryawanController::class, 'index']
                ],
                'product' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'index']
                ],
                'products' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'get']
                ],
                'products/create' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'create']
                ],
                'products/edit/(\d+)' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [ProductController::class, 'edit']
                ],
                'payments' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [RBACMiddleware::class, 'handle:read_payments'],
                    [PaymentController::class, 'index']
                ],
                'payments/manage' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [RBACMiddleware::class, 'handle:manage_payments'],
                    [PaymentController::class, 'index']
                ],
                'settings' => [
                    [AuthMiddleware::class, 'checkSession'],
                    [SettingController::class, 'index']
                ],
            ],
            'POST' => [
                'login' => [
                    [AuthController::class, 'login']
                ]
            ]
        ];
    }
}
