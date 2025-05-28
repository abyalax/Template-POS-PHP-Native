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
                <input id="fm-search-transactions" class="form-control form-control-lg" type="text"
                    placeholder="Search Transactions..." />
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
                    <th class="d-xl-table-cell">ID Transactions</th>
                    <th class="d-xl-table-cell">Cashier</th>
                    <th class="d-xl-table-cell">Subtotal Price</th>
                    <th class="d-xl-table-cell">Total Price</th>
                    <th class="d-xl-table-cell">Tax</th>
                    <th class="d-xl-table-cell">Discount</th>
                    <th class="d-xl-table-cell">Final Price</th>
                    <th class="d-xl-table-cell">Profit</th>
                    <th class="d-xl-table-cell">Status</th>
                    <th class="d-xl-table-cell">Payment</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="table-transactions">
                {foreach from=$transactions item=item}
                    <tr class="odd transaction-item" data-id="{$item['id']}">
                        <td class="d-xl-table-cell">{$item['transaction_id']}</td>
                        <td class="d-xl-table-cell">{$item['cashier']}</td>

                        <td class="d-xl-table-cell">Rp {number_format($item['subtotal'], 0, ',', '.')}</td>
                        <td class="d-xl-table-cell">Rp {number_format($item['total_price'], 0, ',', '.')}</td>
                        <td class="d-xl-table-cell">Rp {number_format($item['total_tax'], 0, ',', '.')}</td>
                        <td class="d-xl-table-cell">Rp {number_format($item['total_discount'], 0, ',', '.')}</td>
                        <td class="d-xl-table-cell">Rp {number_format($item['last_price'], 0, ',', '.')}</td>
                        <td class="d-xl-table-cell">Rp {number_format($item['total_profit'], 0, ',', '.')}</td>

                        <td class="d-xl-table-cell">{$item['status']}</td>
                        <td class="d-xl-table-cell">{$item['payment_method']}</td>
                        
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