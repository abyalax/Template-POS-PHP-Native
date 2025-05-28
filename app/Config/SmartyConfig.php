<?php
namespace Abya\PointOfSales\Config;

require_once __DIR__ . '/../../vendor/autoload.php';

use Smarty\Smarty;

class SmartyConfig {
    private static ?Smarty $smarty = null;

    public static function getInstance() {
        if (self::$smarty === null) {
            try {
                $smarty = new Smarty();
                $smarty->setTemplateDir(__DIR__ . '/../Views');
                $smarty->setCompileDir(__DIR__ . '/../../.compiled');
                $smarty->setEscapeHtml(true);
                // $smarty->caching = Smarty::CACHING_LIFETIME_CURRENT;
                $smarty->setCacheDir(__DIR__ . '/../../cache');
                $smarty->setConfigDir(__DIR__ . '/../../config');
                return $smarty;
            } catch (\Throwable $th) {
                LoggerConfig::getInstance()->debug('Error Smarty Config: ', [$th->getMessage()]);
            }
        } else {
            return self::$smarty;
        }
    }
}
