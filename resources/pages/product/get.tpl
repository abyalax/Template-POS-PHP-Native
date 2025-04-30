{extends file="../../components/layouts/product.tpl"}

{block name="product-content"}
    {include file="../../components/table/products.tpl" products=$products}
{/block}