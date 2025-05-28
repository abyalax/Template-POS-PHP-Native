{extends file="./dashboard.tpl"}

{block name="head"}
    <!-- Mode Development -->
    {* <script type="module" src="http://localhost:5173/src/product/index.ts"></script> *}
    <!-- Mode Production -->
    <script src="/dist/product.js" type="module"></script>
{/block}

{block name="content"}
    <main class="pt-0">
        <h3>{$page|default:'Products (default)'}</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <style>
                    .breadcrumb-item:hover {
                        text-decoration: underline !important;
                        color: black !important;
                    }

                    .breadcrum-active {
                        font-weight: bold;
                        color: black !important;
                        text-decoration: underline;
                    }
                </style>
                <a class="breadcrumb-item {$url == "{$base_url}product" ? " breadcrum-active" : "" }"
                    style="text-decoration:none;color:gray;" href="{$base_url}product">Home</a>
                <a class="breadcrumb-item {$url == '{$base_url}products' ? " breadcrum-active" : "" }"
                    style="text-decoration:none;color:gray;" href="{$base_url}products">Product</a>
                <a class="breadcrumb-item  {$url == '{$base_url}products/create' ? " breadcrum-active" : "" }"
                    style="text-decoration:none;color:gray;" href="{$base_url}products/create">Create</a>
                <a class="breadcrumb-item  {substr($url, 0, strlen("{$base_url}products/edit")) == "{$base_url}products/edit" ? " breadcrum-active" : "d-none" }"
                    style="text-decoration:none;color:gray;" href="{$url}">Update</a>
            </ol>

        </nav>
        {block name="product-content"}{/block}
    </main>
{/block}