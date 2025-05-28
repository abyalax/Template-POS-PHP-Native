{extends file="./dashboard.tpl"}

{block name="head"}
    <!-- Block Import Script JS -->
{/block}

{block name="content"}
    <main class="pt-0">
        <h3>{$page|default:'Transaction (default)'}</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <style>
                    .breadcrumb-item:hover {
                        text-decoration: underline !important;
                        color: black !important;
                    }
                    .breadcrum-active {
                        font-weight: bold;
                        color: black !important;
                        text-decoration: underline;
                    }
                </style>
                <a class="breadcrumb-item {$url == "{$base_url}dashboard" ? " breadcrum-active" : "" }"
                    style="text-decoration:none;color:gray;" href="{$base_url}dashboard">Home</a>
                <a class="breadcrumb-item {$url == "{$base_url}transactions" ? " breadcrum-active" : "" }"
                    style="text-decoration:none;color:gray;" href="{$base_url}transactions">Transaction</a>
            </ol>

        </nav>
        {block name="transaction-content"}{/block}
    </main>
{/block}