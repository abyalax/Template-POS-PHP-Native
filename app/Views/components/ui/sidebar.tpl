{literal}
    <script>
        let domain = '';

        function handleLogout() {
            fetch('api/logout', {
                    method: 'POST', // Lebih aman pakai POST untuk aksi perubahan state
                    credentials: 'include' // Penting untuk mengirim session cookie
                })
                .then(response => {
                    if (response.redirected) {
                        window.location.href = response.url; // Redirect jika dari backend
                    } else {
                        return response.json().then(data => {
                            if (data.redirect) {
                                window.location.href = data.redirect; // Redirect dari JSON
                            }
                            localStorage.clear();
                        });
                    }
                })
                .catch(error => {
                    console.error('Logout error:', error);
                    alert('Logout failed');
                });
        }

        async function getConfig() {
            const fechData = await fetch('{$base_url}api/config')
            const res = await fechData.json()
            domain = res.data[0].domain
        }


        document.addEventListener('DOMContentLoaded', function(e) {
            getConfig()
            const currentPath = window.location.pathname;
            const sidebarItems = document.querySelectorAll('.sidebar-item');

            sidebarItems.forEach(item => {
                const link = item.querySelector('.sidebar-link');
                const href = link.getAttribute('href');

                item.classList.remove('active');
                link.classList.remove('active');

                if (currentPath === href) {
                    item.classList.add('active');
                    link.classList.add('active');
                }
            });

        });
    </script>
{/literal}

<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="{$base_url}">
            <span class="align-middle">Abya's POS</span>
        </a>

        <ul class="sidebar-nav">
            <li class="sidebar-header">
                Pages
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#sales" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-graph-up-arrow" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M0 0h1v15h15v1H0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5" />
                    </svg>
                    <span class="align-middle">Sales</span>
                </a>
                <ul id="sales" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-ui-checks-grid" viewBox="0 0 16 16">
                                <path
                                    d="M2 10h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1m9-9h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-3a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1m0 9a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1zm0-10a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM2 9a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2zm7 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-3a2 2 0 0 1-2-2zM0 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm5.354.854a.5.5 0 1 0-.708-.708L3 3.793l-.646-.647a.5.5 0 1 0-.708.708l1 1a.5.5 0 0 0 .708 0z" />
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}transaction">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-currency-dollar" viewBox="0 0 16 16">
                                <path
                                    d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73z" />
                            </svg>
                            Point Of Sales
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}transactions">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-clock-history" viewBox="0 0 16 16">
                                <path
                                    d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022zm2.004.45a7 7 0 0 0-.985-.299l.219-.976q.576.129 1.126.342zm1.37.71a7 7 0 0 0-.439-.27l.493-.87a8 8 0 0 1 .979.654l-.615.789a7 7 0 0 0-.418-.302zm1.834 1.79a7 7 0 0 0-.653-.796l.724-.69q.406.429.747.91zm.744 1.352a7 7 0 0 0-.214-.468l.893-.45a8 8 0 0 1 .45 1.088l-.95.313a7 7 0 0 0-.179-.483m.53 2.507a7 7 0 0 0-.1-1.025l.985-.17q.1.58.116 1.17zm-.131 1.538q.05-.254.081-.51l.993.123a8 8 0 0 1-.23 1.155l-.964-.267q.069-.247.12-.501m-.952 2.379q.276-.436.486-.908l.914.405q-.24.54-.555 1.038zm-.964 1.205q.183-.183.35-.378l.758.653a8 8 0 0 1-.401.432z" />
                                <path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0z" />
                                <path
                                    d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5" />
                            </svg>
                            History Transactions
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#products" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-boxes" viewBox="0 0 16 16">
                        <path
                            d="M7.752.066a.5.5 0 0 1 .496 0l3.75 2.143a.5.5 0 0 1 .252.434v3.995l3.498 2A.5.5 0 0 1 16 9.07v4.286a.5.5 0 0 1-.252.434l-3.75 2.143a.5.5 0 0 1-.496 0l-3.502-2-3.502 2.001a.5.5 0 0 1-.496 0l-3.75-2.143A.5.5 0 0 1 0 13.357V9.071a.5.5 0 0 1 .252-.434L3.75 6.638V2.643a.5.5 0 0 1 .252-.434zM4.25 7.504 1.508 9.071l2.742 1.567 2.742-1.567zM7.5 9.933l-2.75 1.571v3.134l2.75-1.571zm1 3.134 2.75 1.571v-3.134L8.5 9.933zm.508-3.996 2.742 1.567 2.742-1.567-2.742-1.567zm2.242-2.433V3.504L8.5 5.076V8.21zM7.5 8.21V5.076L4.75 3.504v3.134zM5.258 2.643 8 4.21l2.742-1.567L8 1.076zM15 9.933l-2.75 1.571v3.134L15 13.067zM3.75 14.638v-3.134L1 9.933v3.134z" />
                    </svg>
                    <span class="align-middle">Products</span>
                </a>
                <ul id="products" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}product">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                            </svg>
                            Overview
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}products">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-ui-checks" viewBox="0 0 16 16">
                                <path
                                    d="M7 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zM2 1a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm0 8a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm.854-3.646a.5.5 0 0 1-.708 0l-1-1a.5.5 0 1 1 .708-.708l.646.647 1.646-1.647a.5.5 0 1 1 .708.708zm0 8a.5.5 0 0 1-.708 0l-1-1a.5.5 0 0 1 .708-.708l.646.647 1.646-1.647a.5.5 0 0 1 .708.708zM7 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0-5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
                            </svg>
                            Products lists
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}products/create">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
                                <path
                                    d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5" />
                                <path
                                    d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z" />
                            </svg>
                            Add New Products
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" onclick="alert('Belum diimplement')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-ui-checks" viewBox="0 0 16 16">
                                <path
                                    d="M7 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zM2 1a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm0 8a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2zm.854-3.646a.5.5 0 0 1-.708 0l-1-1a.5.5 0 1 1 .708-.708l.646.647 1.646-1.647a.5.5 0 1 1 .708.708zm0 8a.5.5 0 0 1-.708 0l-1-1a.5.5 0 0 1 .708-.708l.646.647 1.646-1.647a.5.5 0 0 1 .708.708zM7 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0-5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
                            </svg>
                            Categories
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#inventories" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="file-text"></i>
                    <span class="align-middle">Inventories</span>
                </a>
                <ul id="inventories" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}inventaris">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Inventory
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}suppliers">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Suppliers
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Stock
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#report" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="clipboard"></i>
                    <span class="align-middle">Report</span>
                </a>
                <ul id="report" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Daily Sales
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Monthly Summary
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Sales Performance
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}analytics">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Analytics
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#customers" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="users"></i>
                    <span class="align-middle">Customers</span>
                </a>
                <ul id="customers" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}members">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Member Management
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}member/create">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Add New Member
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#staff" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="user-check"></i>
                    <span class="align-middle">Staff</span>
                </a>
                <ul id="staff" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}karyawans">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Karyawan
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" onclick="alert('Belum diimplement')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Account
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" onclick="alert('Belum diimplement')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Roles
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#auth" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="key"></i>
                    <span class="align-middle">Auth</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}settings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Profile
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}login">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Login
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="{$base_url}settings" data-bs-target="#settings" data-bs-toggle="collapse"
                    class="sidebar-link collapsed" aria-expanded="false">
                    <i class="align-middle" data-feather="settings"></i>
                    <span class="align-middle">Settings</span>
                </a>
                <ul id="settings" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}payments">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Payments
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}settings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Configuration
                            <span class="sidebar-badge badge bg-primary">Soon</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="sidebar-cta">
            <div class="sidebar-cta-content">
                <strong class="d-inline-block mb-2">Logout</strong>
                <div class="mb-3 text-sm">
                    Are you sure for logout ?
                </div>
                <div class="d-grid">
                    <button type="button" data-testid="btn-logout" onclick="handleLogout()"
                        class="btn btn-primary px-5 d-flex gap-2 justify-content-center align-items-center">
                        Logout
                        <i class="align-middle" data-feather="log-out"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</nav>