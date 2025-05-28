<?php

namespace Abya\PointOfSales\Config;

use Monolog\Logger;
use Monolog\Level;
use Monolog\Handler\StreamHandler;
use Monolog\Formatter\LineFormatter;

class LoggerConfig {
    private static ?Logger $instance = null;

    private function __construct() {
    }

    public static function getInstance(): Logger {
        if (self::$instance === null) {
            self::$instance = new Logger('app_logger');

            $formatter = new LineFormatter('%message% %context%' . PHP_EOL, null, false, true);

            // $handler = new StreamHandler(__DIR__ . '../../../logs/debug.log', Level::Debug);
            $handler = new StreamHandler(__DIR__ . '../../../logs/debug.log', Level::Error);
            $handler->setFormatter($formatter);

            self::$instance->pushHandler($handler);
        }
        return self::$instance;
    }
}
