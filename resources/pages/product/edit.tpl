{extends file="../../components/layouts/product.tpl"}
{extends file="../../components/form/category-form.tpl"}

{block name="product-content"}
    <main style="padding: 1rem;">
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                console.log('Script dijalankan');
                Fancybox.bind("[data-fancybox]", {
                    padding: 20,
                    transition: "elastic",
                    Toolbar: {
                        display: {
                            left: [],
                            middle: ["title"],
                            right: ["close"],
                        },
                    },
                });
            })
        </script>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Product form</h5>
                <h6 class="card-subtitle text-muted">Update data product</h6>
            </div>
            <div class="card-body">
                <form id="form-update-product">
                    <span id="product-id" class="d-none">{$product['id']}</span>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Barcode</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="barcode" value={$product['barcode']}
                                placeholder="Example : 8986892639798">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" value="{$product['name']|escape:'html'}"
                                placeholder="Example : Nivea MEN Extra Bright 50ml">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Price</label>
                        <div class="col-sm-10">
                            <input type="number" step="0.01" name="price" class="form-control"
                                value="{number_format($product['price'], 2, '.', '')}"
                                placeholder="Example : 10000 for Rp, 10.000">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Cost</label>
                        <div class="col-sm-10">
                            <input type="number" step="0.01" name="cost_price" class="form-control"
                                value="{number_format($product['cost_price'], 2, '.', '')}"
                                placeholder="Example : 10000 for Rp, 10.000">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Tax</label>
                        <div class="col-sm-10">
                            <input type="number" step="0.01" name="tax_rate" class="form-control"
                                value="{$product['tax_rate']|number_format:2:'.':''}" placeholder="Example : 0.10 for 10%">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Discount</label>
                        <div class="col-sm-10">
                            <input type="number" step="0.01" name="discount" class="form-control"
                                value={$product['discount']|number_format:2:'.':''} placeholder="Example : 0.05 for 5%">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Product Stock</label>
                        <div class="col-sm-10">
                            <input type="number" name="stock_qty" class="form-control" value={$product['stock_qty']}
                                placeholder="Stock Product">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end">Category Product</label>
                        <div class="col-sm-10">
                            <div class="d-flex flex-row gap-3">
                                <select class="form-control form-control-sm w-25" id="select-categories">
                                    <option value={$product['category_id']}>{$product['category']}</option>
                                </select>
                                <a data-fancybox data-src="#box-category-form">
                                    <button type="button" id="add-category-btn" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" data-bs-title="Create new Category"
                                        class="btn btn-sm btn-secondary text-nowrap" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" data-bs-title="Adding new Category">
                                        New
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-form-label col-sm-2 text-sm-end pt-sm-0">Ready For Sale</label>
                        <div class="col-sm-10">
                            <label class="form-check m-0">
                                <input type="checkbox" name="is_active" class="form-check-input" {$product['is_active']==1
                                    ? 'checked' : '' }>
                                <span class="form-check-label">cheklist</span>
                            </label>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-10 ms-sm-auto">
                            <button type="submit" class="btn btn-secondary">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
{/block}