{extends file="../components/layouts/dashboard.tpl"}

{block name="head"}
<script>
    document.addEventListener('DOMContentLoaded', () => {
        var sidebar = document.getElementById('sidebar')
        sidebar.classList.add('collapsed')
    })
</script>
{/block}

{block name="content"}
<main>
    <div class="container-fluid p-0">

        <h1 class="mb-5 fw-semibold"><strong class="fw-bolder">Welcome to</strong> Point Of Sales</h1>

        <div class="row row-cols-md-4 row-cols-sm-3 row-cols-1 justify-content-center gap-4">

            {include file="../components/ui/card.tpl"
            link="transactions"
            title="Create Transaction"
            menu="Menu Transaction"
            role="Cashier"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-dollar-sign">
                <line x1="12" y1="1" x2="12" y2="23"></line>
                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
            </svg>'
            message="Go To Transaction page"
            button="Transaction" }

            {include file="../components/ui/card.tpl"
            link="inventaris"
            title="Create and Manage Inventaris"
            menu="Menu Inventaris"
            role="Admin"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-file-text">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                <polyline points="14 2 14 8 20 8"></polyline>
                <line x1="16" y1="13" x2="8" y2="13"></line>
                <line x1="16" y1="17" x2="8" y2="17"></line>
                <polyline points="10 9 9 9 8 9"></polyline>
            </svg>'
            message="Go To Inventaris page"
            button="Inventaris" }

            {include file="../components/ui/card.tpl"
            link="analytics"
            title="Analyze Your Data"
            menu="Analytics & report"
            role="Manager"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-pie-chart">
                <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
            </svg>'
            message="Go To Analytics page"
            button="Analytics" }

            {include file="../components/ui/card.tpl"
            link="suppliers"
            title="Manage Suppliers"
            menu="Menu Supliers"
            role="Admin"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-truck">
                <rect x="1" y="3" width="15" height="13"></rect>
                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
                <circle cx="5.5" cy="18.5" r="2.5"></circle>
                <circle cx="18.5" cy="18.5" r="2.5"></circle>
            </svg>'
            message="Go To Suppliers page"
            button="Suppliers" }

            {include file="../components/ui/card.tpl"
            link="members"
            title="Create and Manage Members"
            menu="Menu Members"
            role="Owner"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-user-plus">
                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                <circle cx="8.5" cy="7" r="4"></circle>
                <line x1="20" y1="8" x2="20" y2="14"></line>
                <line x1="23" y1="11" x2="17" y2="11"></line>
            </svg>'
            message="Go To Members page"
            button="Members" }

            {include file="../components/ui/card.tpl"
            link="karyawans"
            title="Manage Karyawan"
            menu="Menu Karyawan"
            role="Human Resource Development"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-users">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                <circle cx="9" cy="7" r="4"></circle>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>'
            message="Go To Karyawan page"
            button="Karyawan" }

            {include file="../components/ui/card.tpl"
            link="products"
            title="Manage Products"
            menu="Menu Products"
            role="Admin"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-box">
                <path
                    d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z">
                </path>
                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                <line x1="12" y1="22.08" x2="12" y2="12"></line>
            </svg>'
            message="Go To Products page"
            button="Products" }

            {include file="../components/ui/card.tpl"
            link="payments"
            title="Manage Payments"
            menu="Menu Payments"
            role="Owner"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-dollar-sign">
                <line x1="12" y1="1" x2="12" y2="23"></line>
                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
            </svg>'
            message="Go To Payments page"
            button="Payments" }

            {include file="../components/ui/card.tpl"
            link="settings"
            title="Manage Configuration"
            menu="Settings"
            role="Admin"
            icon='<svg xmlns="http://www.w3.org/2000/svg" style="height:2rem;width:2rem;" width="24" height="24"
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" class="feather feather-settings">
                <circle cx="12" cy="12" r="3"></circle>
                <path
                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z">
                </path>
            </svg>'
            message="Go To Settings page"
            button="Settings" }

        </div>
    </div>
</main>
{/block}