{extends file="../../components/layouts/transaction.tpl"}

{block name="transaction-content"}
<div data-testid="page-dashboard" class="bg-[#f0f0f8]">
    <!-- Mode Development -->
    {* <script src="http://localhost:5173/src/analytics/index" type="module"></script> *}
    <!-- Mode Production -->
    <script src="/dist/analytics.js" type="module"></script>
    
    <div style="display: grid;grid-template-columns: 2fr 1fr;grid-gap: 15px;">
        <div class="card">
            <div class="card-header">
                <div class="d-flex justify-content-between">
                    <h1 class="fw-bold fs-4">Business Overview</h1>
                    <div class="dropdown">
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-lg" type="button">
                                Yearly
                            </button>
                            <button type="button" class="btn btn-lg btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="card-body d-flex bg-white">
                <div class="col">
                    <p class="text-[#727272]">Total Profit</p>
                    <h2 class="fw-semibold" id="total-profit">Rp. 25.500.400,00</h2>
                    <a href="#" class="fw-bold fs-4">View All</a>
                </div>
                <div class="col">
                    <p class="text-[#727272]">Total Revenue</p>
                    <h2 class="fw-semibold" id="total-revenue">Rp. 25.500.400,00</h2>
                    <a href="#" class="fw-bold fs-4">View All</a>
                </div>
                <div class="col">
                    <p class="text-[#727272]">Total Sales</p>
                    <h2 class="fw-semibold" id="total-sales">Rp. 25.500.400,00</h2>
                    <a href="#" class="fw-bold fs-4">View All</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card">
                <div class="card-header">
                    <h1 class="fw-bold fs-4">Report Analytics</h1>
                </div>
                <div class="card-body p-3">
                    <div class="bg-white">
                        Tahun 2024
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="d-grid gap-2 d-md-flex">
        <div class="card col-8">
            <div class="card-header">
                <p class="fw-bold fs-4">Revenue Statistic</p>
            </div>
            <div class="card-body p-3">
                <div class="bg-white">
                    <canvas id="revenue-chart"></canvas>
                </div>
            </div>
        </div>
        <div class="card col-4">
            <div class="card-header">
                <p class="fw-bold fs-4">Sales By Category</p>
            </div>
            <div class="card-body p-3">
                <div class="bg-white">
                    <canvas id="category-chart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}