{extends file="../../components/layouts/transaction.tpl"}

{block name="transaction-content"}
    <div data-testid="page-transactions">
        <p>{$transaction['transaction_id']}</p>
        <p>{$transaction['cashier']}</p>
        <p>{$transaction['status']}</p>
        <p>{$transaction['payment_method']}</p>
        <p>{$transaction['total_profit']}</p>
    </div>
{/block}