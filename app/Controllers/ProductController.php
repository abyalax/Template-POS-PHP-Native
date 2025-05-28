<?php

namespace Abya\PointOfSales\Controllers;

require_once __DIR__ . '/../../vendor/autoload.php';

use Abya\PointOfSales\Config\LoggerConfig;
use Abya\PointOfSales\Config\Helper;
use Abya\PointOfSales\Models\Product;
use Abya\PointOfSales\Config\BaseController;
use Abya\PointOfSales\Config\StatusResponse;
use Respect\Validation\Validator as V;
use Respect\Validation\Exceptions\NestedValidationException;
use Throwable;

class ProductController extends BaseController {

    public function index() {
        $data = new Product();
        $find = $data->findAll();
        LoggerConfig::getInstance()->debug('Index Products Page', compact('find'));
        $this->smarty->assign('products', $find);
        $this->smarty->assign('page', 'Products Page');
        $this->smarty->assign('url', "{$this->base_url}product");
        $this->smarty->display('pages/product/index.tpl');
    }

    public function get() {
        $data = new Product();
        $find = $data->findAll();
        LoggerConfig::getInstance()->debug('Get Products Page', compact('find'));
        $this->smarty->assign('products', $find);
        $this->smarty->assign('page', 'Products Page');
        $this->smarty->assign('url', "{$this->base_url}products");
        $this->smarty->display('pages/product/get.tpl');
    }

    public function create() {
        LoggerConfig::getInstance()->debug('Create Products Page');
        $this->smarty->assign('page', 'Create Products Page');
        $this->smarty->assign('url', "{$this->base_url}products/create");
        $this->smarty->display('pages/product/create.tpl');
    }

    public function edit($paramID) {
        LoggerConfig::getInstance()->debug('Edit Products Page', ['param ID' => $paramID]);
        $product = new Product();
        $data = $product->findById($paramID);
        LoggerConfig::getInstance()->debug('Found Product by ID', $data);
        $this->smarty->assign('product', $data);
        $this->smarty->assign('page', 'Update Products Page');
        $this->smarty->assign('url', "{$this->base_url}products/edit/" . $paramID);
        $this->smarty->display('pages/product/edit.tpl');
    }

    public function getProducts() {
        try {
            $model = new Product();
            $find = $model->findAll();
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error Get Category By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getCategoryByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getProductByID() {
        
        try {
            $id = $_POST['id'];
            LoggerConfig::getInstance()->debug('Get Product By ID', compact('id'));
            $product = new Product();
            $find = $product->findById($id);

            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                LoggerConfig::getInstance()->debug('Found Product by ID', $find);
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error Get Category By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getCategoryByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getProductByName() {
        try {
            $name = $_POST['name'];
            LoggerConfig::getInstance()->debug('Get Product By Name', compact('name'));
            $model = new Product();
            $find = $model->findByName($name);
            
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                LoggerConfig::getInstance()->debug('Found Product by Name', $find);
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error Get Category By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getCategoryByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getCategories() {
        try {
            $model = new Product();
            $find = $model->findAllCategories();

            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error Get Category By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getCategoryByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function getCategoryByID($paramID) {
        try {
            LoggerConfig::getInstance()->debug('Get Category By ID', compact('paramID'));
            V::numericVal()->assert($paramID);
            $product = new Product();
            $find = $product->findCategoryById($paramID);
            if ($find == false) {
                Helper::sendResponse(404, StatusResponse::notfound);
            } else {
                Helper::sendResponse(200, StatusResponse::success, $find);
            }
        } catch (NestedValidationException $exception) {
            LoggerConfig::getInstance()->debug('Error Get Category By ID', ['errors' => $exception->getMessages()]);
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (Throwable $th) {
            LoggerConfig::getInstance()->error('Error getCategoryByID', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function addCategoryProducts() {
        try {
            $json = file_get_contents('php://input');
            $data = json_decode($json, true);
            LoggerConfig::getInstance()->debug('POST Add Category Products Page', $data);
            if (!$data) {
                Helper::sendResponse(400, StatusResponse::badrequest);
                return;
            }
            LoggerConfig::getInstance()->debug('Creating Category', compact('data'));
            $product = new Product();
            $data = $product->insertCategory($data['name']);
            if ($data) {
                Helper::sendResponse(200, StatusResponse::success, compact('data'));
            } else {
                Helper::sendResponse(400, StatusResponse::badrequest);
            }
        } catch (\Throwable $th) {
            LoggerConfig::getInstance()->debug('Error insertCategory', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function search() {
        header('Content-Type: application/json');
        try {
            $keyword = $_POST['keyword'];
            LoggerConfig::getInstance()->debug('Search data with keyword', compact('keyword'));
            V::stringType()->length(2, 50)->assert($keyword);
            $data = new Product();
            $result = $data->search($keyword);
            LoggerConfig::getInstance()->debug('Result Searching Data', compact('result'));
            Helper::sendResponse(200, StatusResponse::success, $result);
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Error Searching Data', compact('errors'));
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (\Exception $exception) {
            $errors = $exception->getMessage();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Error Searching Data', compact('errors'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function updateProduct($paramID) {
        try {
            $json = file_get_contents('php://input');
            $data = json_decode($json, true);
            if (!$data) {
                Helper::sendResponse(400, StatusResponse::badrequest);
                return;
            }

            V::digit()->assert($data['barcode']);
            V::stringType()->length(2, 50)->assert($data['name']);
            V::numericVal()->assert($data['category_id']);
            V::numericVal()->assert($data['price']);
            V::numericVal()->assert($data['cost_price']);
            V::decimal(2)->assert($data['tax_rate']);
            V::decimal(2)->assert($data['discount']);
            V::numericVal()->assert($data['stock_qty']);

            LoggerConfig::getInstance()->debug('Updating Product', compact('data'));
            $product = new Product();
            $updt = $product->update($paramID, $data);
            if ($updt) {
                Helper::sendResponse(200, StatusResponse::success);
            } else {
                Helper::sendResponse(400, StatusResponse::badrequest);
            }
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Error Creating Product', compact('errors'));
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (\Throwable $th) {
            LoggerConfig::getInstance()->debug('Error updateProduct', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function createProduct() {
        try {
            $json = file_get_contents('php://input');
            $data = json_decode($json, true);

            LoggerConfig::getInstance()->debug('Init Creating Product', compact('data'));

            if (!$data) {
                Helper::sendResponse(400, StatusResponse::badrequest);
                return;
            }

            V::digit()->assert($data['barcode']);
            V::stringType()->length(2, 50)->assert($data['name']);
            V::numericVal()->assert($data['category_id']);
            V::numericVal()->assert($data['price']);
            V::numericVal()->assert($data['cost_price']);
            V::decimal(2)->assert($data['tax_rate']);
            V::decimal(2)->assert($data['discount']);
            V::numericVal()->assert($data['stock_qty']);

            LoggerConfig::getInstance()->debug('Pass Validation, Creating Product', compact('data'));
            $product = new Product();
            $add = $product->insert($data);
            if ($add) {
                Helper::sendResponse(200, StatusResponse::success);
            } else {
                Helper::sendResponse(400, StatusResponse::badrequest);
            }
        } catch (NestedValidationException $exception) {
            $errors = $exception->getMessages();
            if (!is_array($errors)) {
                $errors = [$errors];
            }
            LoggerConfig::getInstance()->debug('Error Creating Product', compact('errors'));
            Helper::sendResponse(400, StatusResponse::badrequest);
        } catch (\Throwable $th) {
            LoggerConfig::getInstance()->debug('Error addProducts', compact('th'));
            Helper::sendResponse(500, StatusResponse::error);
        }
    }

    public function manageProducts($first, $second) {
        LoggerConfig::getInstance()->debug('Get Manage Products Page ( just for testing )', compact('first', 'second'));
        Helper::sendResponse(200, StatusResponse::success, ['fisrt' => $first, 'second' => $second]);
    }
}
