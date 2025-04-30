<?php

namespace Abya\PointOfSales\Config;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class Config {
    public static function getBaseUrl(): string {
        return $_ENV['BASE_URL'];
    }
}