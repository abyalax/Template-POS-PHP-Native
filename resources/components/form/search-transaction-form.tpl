<div id="box-cart-form" style="display:none;" class="card">
    <div class="card-header">
        <h5 class="card-title mb-0">Search Products</h5>
        <form id="box-search-products" class="d-flex gap-2 mx-auto">
            <div class="d-inline-block">
                <div id="parent-box-search-products" class="input-group input-group-navbar">
                    <button class="btn btn-secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                            style="width: 1.2rem;height: 1.2rem;" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </button>
                    <input id="bx-search-products" class="form-control form-control-lg" type="text"
                        placeholder="Search Products..." />
                </div>
            </div>
            <button type="submit" class="btn btn-lg btn-secondary d-flex gap-1 flex-nowrap align-items-center">
                Insert
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                    style="width: 1.2rem;height: 1.2rem;" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-down">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <polyline points="19 12 12 19 5 12"></polyline>
                </svg>
            </button>
        </form>
    </div>
    <div class="card-body d-flex flex-column justify-content-between w-100">
        <div style="max-height: 60vh;overflow-y: scroll;">
            <table class="table table-hover table-striped table-responsive">
                <thead class="sticky-top bg-white">
                    <tr>
                        <th class="d-md-table-cell">Barcode</th>
                        <th class="d-md-table-cell">
                            Product
                        </th>
                        <th class="d-xl-table-cell">Add</th>
                    </tr>
                </thead>
                <tbody id="bx-table-search-product" style="max-height:60vh;overflow-y: scroll;">
                </tbody>
            </table>
        </div>
    </div>
</div>