{extends file="../../components/layouts/product.tpl"}

{block name="product-content"}
    <div data-testid="page-products">
        {include file="../../components/table/products.tpl" products=$products}
    </div>
{/block}