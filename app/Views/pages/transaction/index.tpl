{extends file="../../components/layouts/dashboard.tpl"}

{block name="head"}
    <!-- Mode Development -->
    {* <script type="module" src="http://localhost:5173/src/cart/index.ts"></script> *}
    <!-- Mode Production -->
    <script src="/dist/cart.js" type="module"></script> 
{/block}

{block name="content"}
    <main style="z-index: 0;" data-testid='page-transaction'>
        <h3>{$page|default:'Transactions'}</h3>
        <div class="row">
            <div class="col-12 col-lg-8 col-xxl-9 d-flex">
                <div class="card flex-fill">

                    {include file="../../components/form/transaction-form.tpl"}

                    <div class="card-header d-flex justify-content-between align-items-center">
                        <form id="form-search-products" class="d-flex gap-2">
                            <div class="d-inline-block">
                                <div class="input-group input-group-navbar">
                                    <button class="btn btn-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                            fill="none" style="width: 1.2rem;height: 1.2rem;" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class="feather feather-search">
                                            <circle cx="11" cy="11" r="8"></circle>
                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                        </svg>
                                    </button>
                                    <input id="fm-search-products" data-testid="input-search-product"
                                        class="form-control form-control-lg" type="text" placeholder="Search Products..." />
                                </div>
                            </div>
                            <button type="submit" data-testid="btn-insert-cart" data-bs-toggle="tooltip"
                                data-bs-placement="bottom" data-bs-title="Insert this product to cart"
                                class="btn btn-lg btn-secondary d-flex gap-1 flex-nowrap align-items-center">
                                Insert
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    style="width: 1.2rem;height: 1.2rem;" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-down">
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <polyline points="19 12 12 19 5 12"></polyline>
                                </svg>
                            </button>
                        </form>
                        {include file="../../components/form/search-transaction-form.tpl"}
                        <button data-fancybox data-src="#box-cart-form" id="select-product-btn" data-bs-toggle="tooltip"
                            data-bs-placement="bottom" data-bs-title="Preview many products"
                            class="btn btn-lg btn-primary d-flex gap-1 flex-nowrap align-items-center">
                            Select
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                style="width: 1.2rem;height: 1.2rem;" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-external-link">
                                <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                                <polyline points="15 3 21 3 21 9"></polyline>
                                <line x1="10" y1="14" x2="21" y2="3"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="card-body">
                        {include file="../../components/table/transaction.tpl"}
                    </div>
                    <div class="card-footer">
                        <div class="d-flex w-100 justify-content-between align-items-start p-4">
                            <div class="w-100">
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="cart-notes" placeholder="Catatan Transaksi ( jika ada )"
                                        rows="3"></textarea>
                                </div>
                                <div class="row mt-3">
                                    <p class="fw-bold fs-5 my-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-command mb-1">
                                            <path
                                                d="M18 3a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3H6a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3V6a3 3 0 0 0-3-3 3 3 0 0 0-3 3 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 3 3 0 0 0-3-3z">
                                            </path>
                                        </svg>
                                        Shortcut Keyboard
                                    </p>
                                    <div class="col-sm-6 d-flex flex-column">
                                        <p class="my-0 fs-6">F7 = Tambah Baris Baru</p>
                                        <p class="my-0 fs-6">F8 = Fokus ke field bayar</p>
                                    </div>
                                    <div class="col-sm-6 d-flex flex-column">
                                        <p class="my-0 fs-6">F9 = Cetak Struct</p>
                                        <p class="my-0 fs-6">F10 = Simpan Transaksi</p>
                                    </div>
                                </div>
                            </div>
                            <div class="w-75">
                                <form class="d-flex flex-column justify-content-end gap-2">
                                    <div class="mb-3 row d-flex justify-content-start">
                                        <label class="col-form-label col-sm-4 text-sm-end">Bayar</label>
                                        <div class="col-sm-8">
                                            <input id="pay-transaction" data-testid="pay-transaction"
                                                class="form-control form-control-lg" type="number"
                                                placeholder="Jumlah Pembayaran..." />
                                        </div>
                                    </div>
                                    <div class="mb-3 row d-flex justify-content-start">
                                        <label class="col-form-label col-sm-4 text-sm-end">Kembali</label>
                                        <div class="col-sm-8">
                                            <input id="return-transaction" data-testid="return-transaction"
                                                class="form-control form-control-lg" type="text" disabled
                                                placeholder="Kembalian.." />
                                        </div>
                                    </div>
                                    <div class="d-flex gap-3 justify-content-end">
                                        <button data-bs-toggle="tooltip" data-bs-placement="bottom"
                                            data-bs-title="Print Struct to printer"
                                            class="btn btn-primary btn-lg d-flex gap-1 flex-nowrap align-items-center">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-printer">
                                                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                                <path
                                                    d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2">
                                                </path>
                                                <rect x="6" y="14" width="12" height="8"></rect>
                                            </svg>
                                            Cetak
                                        </button>
                                        <button id="btn-save-transaction" data-testid="btn-save-transaction" data-bs-toggle="tooltip"
                                            data-bs-placement="bottom" data-bs-title="Save & Finish Transaction"
                                            class="btn btn-secondary btn-lg d-flex gap-1 flex-nowrap align-items-center">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-save">
                                                <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z">
                                                </path>
                                                <polyline points="17 21 17 13 7 13 7 21"></polyline>
                                                <polyline points="7 3 7 8 15 8"></polyline>
                                            </svg>
                                            Simpan
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 col-xxl-3 d-flex">
                <div class="card w-100" style="height:fit-content;">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Overview</h5>
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between w-100">
                        <div class="d-flex w-100">
                            <div class="align-self-center w-100">
                                <div class="d-flex justify-content-between">
                                    <p>Tanggal</p>
                                    <p class="date-time">0</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Total Items</p>
                                    <p id="cart-total-item" data-testid="cart-total-item">0</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Subtotal Price</p>
                                    <p id="cart-sub-total" data-testid="cart-sub-total"></p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Total Tax Products</p>
                                    <p id="cart-total-tax" data-testid="cart-total-tax"></p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Total Discount</p>
                                    <p id="cart-total-discount" data-testid="cart-total-discount"></p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Total Price</p>
                                    <p id="cart-total" data-testid="cart-total"></p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Payment Method</p>
                                    <p>Cash</p>
                                </div>
                                <div class="d-flex flex-wrap justify-content-center align-items-center gap-3">
                                    <button class="btn btn-secondary" data-testid="btn-preview-struct" id="print-struct-btn"
                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                        data-bs-title="View Struct before print">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-eye">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                        Preview Struct
                                    </button>
                                    <button class="btn btn-secondary" id="reset-cart-btn" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" data-bs-title="Reset and remove all item">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
{/block}
{block name="scripts"}
    <script>
        document.addEventListener("DOMContentLoaded", function() {
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
            $("#fm-search-products").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "api/products",
                        type: "POST",
                        data: {
                            keyword: request.term
                        },
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            response(data.data);
                        },
                        error: function(xhr, status, error) {
                            console.log(xhr);
                            console.error("AJAX Error:", status, error);
                        }
                    });
                },
                minLength: 2
            });
            $("#bx-search-products").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "api/products",
                        type: "POST",
                        data: {
                            keyword: request.term
                        },
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            response(data.data);
                        },
                        error: function(xhr, status, error) {
                            console.log(xhr);
                            console.error("AJAX Error:", status, error);
                        }
                    });
                },
                minLength: 2,
                appendTo: '#parent-box-search-products'
            });
        })
    </script>
{/block}