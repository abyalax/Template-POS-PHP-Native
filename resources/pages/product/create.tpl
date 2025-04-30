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
            <h6 class="card-subtitle text-muted">Create new product for your store</h6>
        </div>
        <div class="card-body">
            <form id="form-add-product">
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Barcode</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="barcode" placeholder="Example : 8986892639798">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name"
                            placeholder="Example : Nivea MEN Extra Bright 50ml">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Price</label>
                    <div class="col-sm-10">
                        <input type="number" step="0.01" class="form-control" name="price"
                            placeholder="Example : 10000 for Rp, 10.000">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Cost</label>
                    <div class="col-sm-10">
                        <input type="number" step="0.01" class="form-control" name="cost_price"
                            placeholder="Example : 10000 for Rp, 10.000">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Tax</label>
                    <div class="col-sm-10">
                        <input type="number" step="0.01" class="form-control" name="tax_rate"
                            placeholder="Example : 0.10 for 10%">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Discount</label>
                    <div class="col-sm-10">
                        <input type="number" step="0.01" class="form-control" name="discount"
                            placeholder="Example : 0.05 for 5%">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Product Stock</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="stock_qty" placeholder="Stock Product">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-form-label col-sm-2 text-sm-end">Category Product</label>
                    <div class="col-sm-10">
                        <div class="d-flex flex-row gap-3">
                            <select class="form-control form-control-sm w-25" id="select-categories"></select>
                            <a data-fancybox data-src="#box-category-form">
                                <button id="add-category-btn" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                    data-bs-title="Create new Category" class="btn btn-sm btn-secondary text-nowrap"
                                    data-bs-toggle="tooltip" data-bs-placement="bottom"
                                    data-bs-title="Adding new Category">
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
                            <input type="checkbox" name="is_active" class="form-check-input" checked>
                            <span class="form-check-label">cheklist</span>
                        </label>
                    </div>
                </div>
                <div class="mb-3 row">
                    <div class="col-sm-10 ms-sm-auto">
                        <button type="submit" class="btn btn-secondary"
                            onclick="alert('belum diimplement')">Create</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
{/block}