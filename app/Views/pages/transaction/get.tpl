{extends file="../../components/layouts/transaction.tpl"}

{block name="transaction-content"}
    <div data-testid="page-transactions">
        {include file="../../components/table/transactions.tpl" transactions=$transactions}
    </div>
{/block}