<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center w-100">
        <div class="d-inline-block">
            <div class="input-group input-group-navbar">
                <button class="btn btn-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        style="width: 1.2rem;height: 1.2rem;" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </button>
                <input id="fm-search-products" class="form-control form-control-lg" type="text"
                    placeholder="Search Products..." />
            </div>
        </div>
        <button class="btn btn-primary" onclick="alert('Belum di Implement')">
            Filter
        </button>
    </div>
    <div class="card-body">
        <table class="table table-hover table-striped table-responsive">
            <thead>
                <tr>
                    <th class="d-xl-table-cell">Barcode</th>
                    <th class="d-xl-table-cell">Name</th>
                    <th class="d-xl-table-cell">Category</th>
                    <th class="d-xl-table-cell">Price</th>
                    <th class="d-xl-table-cell">Tax</th>
                    <th class="d-xl-table-cell">Discount</th>
                    <th class="d-xl-table-cell">Stock</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="table-product">
                {foreach from=$products item=item}
                    <tr class="odd product-item" data-id="{$item['id']}">
                        <td class="d-xl-table-cell">{$item['barcode']}</td>
                        <td class="d-xl-table-cell">{$item['name']}</td>
                        <td class="d-xl-table-cell">{$item['category']}</td>

                        <td class="d-xl-table-cell">Rp {number_format($item['price'], 0, ',', '.')}</td>

                        <td class="d-xl-table-cell">{$item['tax_rate'] * 100}%</td>

                        <td class="d-xl-table-cell {if $item.discount > 0}text-success fw-bold{else}text-muted{/if}">
                            {$item.discount}%
                        </td>
                        <td class="d-xl-table-cell {if $item.stock_qty < 5}text-danger fw-bold{else}text-body{/if}">
                            {number_format($item.stock_qty, 0, ',', '.')}
                        </td>
                        <td class="d-xl-table-cell table-action">
                            <button class="btn btn-secondary update-product">
                                <i class="align-middle" data-feather="edit-2"></i>
                            </button>
                            <button class="btn btn-secondary delete-product">
                                <i class="align-middle" data-feather="trash-2"></i>
                            </button>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>