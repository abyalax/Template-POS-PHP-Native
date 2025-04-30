<table class="container-cart table table-hover table-striped table-responsive">
    <thead>
        <tr class="text-nowrap">
            <th class="d-xl-table-cell">ID</th>
            <th class="d-xl-table-cell">sub_total</th>
            <th class="d-xl-table-cell">total</th>
            <th class="d-xl-table-cell">discount</th>
            <th class="d-xl-table-cell">pay_received</th>
            <th class="d-xl-table-cell">pay_change</th>
            <th class="d-xl-table-cell">tax</th>
            <th class="d-xl-table-cell">action</th>
        </tr>
    </thead>
    <tbody id="cart-items">
        {foreach from=$transactions item=item}
            <tr class="odd product-item" data-id="{$item['id']}">
                <td class="d-xl-table-cell">{$item['transaction_id']}</td>
                <td class="d-xl-table-cell">{$item['sub_total']}</td>
                <td class="d-xl-table-cell">{$item['total']}</td>
                <td class="d-xl-table-cell">{$item['discount']}</td>
                <td class="d-xl-table-cell">{$item['pay_received']}</td>
                <td class="d-xl-table-cell">{$item['pay_change']}</td>
                <td class="d-xl-table-cell">{$item['tax']}</td>

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