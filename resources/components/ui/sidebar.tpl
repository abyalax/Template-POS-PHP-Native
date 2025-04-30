{literal}
    <script>
        let base_url = 'template-native';

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
            const fechData = await fetch(`/${base_url}/api/config`)
            const res = await fechData.json()
            base_url = res.data[0].base_url
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

                if (currentPath === href || (currentPath.startsWith(href) )) {
                    item.classList.add('active');
                    link.classList.add('active');
                }
            });

        });
    </script>
{/literal}

<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="{$base_url}/">
            <span class="align-middle">Abya's POS</span>
        </a>

        <ul class="sidebar-nav">
            <li class="sidebar-header">
                Pages
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#sales" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="bar-chart-2"></i>
                    <span class="align-middle">Sales</span>
                </a>
                <ul id="sales" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/transaction">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Point Of Sales
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/transactions">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            History Transactions
                            <span class="sidebar-badge badge bg-primary">Pro</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a data-bs-target="#products" data-bs-toggle="collapse" class="sidebar-link collapsed"
                    aria-expanded="false">
                    <i class="align-middle" data-feather="box"></i>
                    <span class="align-middle">Products</span>
                </a>
                <ul id="products" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/product">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Overview
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/products">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Products lists
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/product/create">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Add New Products
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                            Categories
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                        <a class="sidebar-link" href="{$base_url}/inventaris">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Inventory
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/suppliers">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Suppliers
                            <span class="sidebar-badge badge bg-primary">Pro</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link"  >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Stock
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                        <a class="sidebar-link"  >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Daily Sales
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link"  >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Monthly Summary
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                            <span class="sidebar-badge badge bg-primary">Pro</span>
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/analytics">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Analytics
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                        <a class="sidebar-link" href="{$base_url}/members">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Member Management
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/member/create">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Add New Member
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                        <a class="sidebar-link" href="{$base_url}/karyawans">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Karyawan
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
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                            <span class="sidebar-badge badge bg-primary">Pro</span>
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
                        <a class="sidebar-link"   onclick="alert('belum diimplement')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Profile
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/login">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Login
                            <span class="sidebar-badge badge bg-primary">Pro</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="{$base_url}/settings" data-bs-target="#settings" data-bs-toggle="collapse"
                    class="sidebar-link collapsed" aria-expanded="false">
                    <i class="align-middle" data-feather="settings"></i>
                    <span class="align-middle">Settings</span>
                </a>
                <ul id="settings" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/payments">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Payments
                        </a>
                    </li>
                    <li class="sidebar-item ps-3">
                        <a class="sidebar-link" href="{$base_url}/settings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                style="width: .8rem;height: .8rem;" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-arrow-right">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                            Configuration
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
                    <button type="button" onclick="handleLogout()"
                        class="btn btn-primary px-5 d-flex gap-2 justify-content-center align-items-center">
                        Logout
                        <i class="align-middle" data-feather="log-out"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</nav>