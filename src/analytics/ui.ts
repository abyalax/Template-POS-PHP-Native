import { formatPrice } from "../helper";
import AnalyticsCore from "./core";
import { Chart } from "chart.js";
import { ReportSales, SalesByCategory } from "../types/analytics";

interface ChartElements {
    revenue?: Chart,
    category?: Chart
}

export default class AnalyticsUI {

    private charts: ChartElements;

    constructor() {
        this.charts = {}
        this.bindEvents()
    }

    private async bindEvents() {
        const revenue = document.getElementById('revenue-chart') as HTMLCanvasElement
        const category = document.getElementById('category-chart') as HTMLCanvasElement
        this.handleReportSalesByYear()
        this.createRevenueChart(revenue)
        this.createSalesByCategoryChart(category)
        this.handleReportSalesByYear();
    }

    private handleReportSalesByYear = async () => {
        const data = await AnalyticsCore.getReportSalesByYear()
        const total_profit = document.getElementById('total-profit') as HTMLHeadingElement
        const total_revenue = document.getElementById('total-revenue') as HTMLHeadingElement
        const total_sales = document.getElementById('total-sales') as HTMLHeadingElement

        total_profit.innerText = formatPrice(data.total_profit)
        total_revenue.innerText = formatPrice(data.total_revenue)
        total_sales.innerText = formatPrice(data.total_sales)
        console.log(data);
    }

    private createRevenueChart = async (canvas: HTMLCanvasElement) => {
        const fetchData = await AnalyticsCore.getReportSalesByMonth();
        this.destroyChartFromCanvas(canvas)

        if (fetchData) {
            this.charts.revenue = new Chart(canvas, {
                type: "line",
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [
                        {
                            label: "Sales",
                            fill: true,
                            tension: 0.4,
                            borderCapStyle: "round",
                            pointRadius: 0.2,
                            backgroundColor: "transparent",
                            borderColor: "#30b4e1",
                            data: fetchData.map((item: ReportSales) => item.total_sales)
                        },
                        {
                            label: "Revenue",
                            fill: true,
                            tension: 0.4,
                            borderCapStyle: "round",
                            pointRadius: 0.2,
                            backgroundColor: "transparent",
                            borderColor: "#3b7ddd",
                            data: fetchData.map((item: ReportSales) => item.total_revenue)
                        },
                        {
                            label: "Profit",
                            fill: true,
                            tension: 0.4,
                            borderCapStyle: "round",
                            pointRadius: 0.2,
                            backgroundColor: "transparent",
                            borderColor: "#23bf93",
                            borderDash: [4, 4],
                            data: fetchData.map((item: ReportSales) => item.total_profit)
                        }
                    ]
                },
                options: {
                    aspectRatio: 4 / 2,
                    interaction: {
                        intersect: false,
                        mode: 'index',
                    },
                    plugins: {
                        tooltip: {
                            enabled: true,
                            mode: 'index',
                            callbacks: {
                                label: (tooltipItems) => {
                                    return `${tooltipItems.dataset.label} : Rp ${tooltipItems.formattedValue}`;
                                }
                            }
                        },
                        legend: {
                            display: true,
                            align: 'center',
                        }
                    },
                }
            })
        }
    }

    private createSalesByCategoryChart = async (canvas: HTMLCanvasElement) => {
        this.destroyChartFromCanvas(canvas);
        const fetchData = await AnalyticsCore.getReportSalesByCategory()

        if (fetchData) {
            this.charts.category = new Chart(canvas, {
                type: "pie",
                data: {
                    labels: fetchData.map((item: SalesByCategory) => item.category),
                    datasets: [
                        {
                            label: "Total Sales",
                            data: fetchData.map((item: SalesByCategory) => item.total_sales),
                            borderWidth: 1,
                            backgroundColor: [
                                "#30b4e1",
                                "#3b7ddd",
                                "#23bf93",
                                "#ff6b6b",
                                "#ff9f43",
                                "#e9c46a"
                            ],
                            hoverBackgroundColor: [
                                "#1e8fb7",  // Darker version of #30b4e1
                                "#2662b0",  // Darker version of #3b7ddd
                                "#178068",  // Darker version of #23bf93
                                "#cc5252",  // Darker version of #ff6b6b
                                "#cc7c26",  // Darker version of #ff9f43
                                "#b89a4f"   // Darker version of #e9c46a
                            ]
                        }
                    ]
                },
                options: {
                    aspectRatio: 1,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            enabled: true,
                            mode: 'nearest',
                            callbacks: {
                                title(tooltipItems) {
                                    return fetchData[tooltipItems[0].dataIndex].category
                                },
                                afterTitle(tooltipItems) {
                                    return `${fetchData[tooltipItems[0].dataIndex].total_qty} items sold`
                                },
                                beforeBody(tooltipItem) {
                                  return `Total Revenue: ${formatPrice(fetchData[tooltipItem[0].dataIndex].total_revenue)}`
                                },
                                afterBody(tooltipItem) {
                                    return `Total Profit: ${formatPrice(fetchData[tooltipItem[0].dataIndex].total_profit)}`
                                },
                                label(tooltipItem) {
                                    return `Total Sales: ${formatPrice(fetchData[tooltipItem.dataIndex].total_sales)}`
                                },
                            },
                            displayColors: false
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'index',
                    }
                }
            });
        }

    }

    private destroyChartFromCanvas(canvas: HTMLCanvasElement) {
        const existingChart = Chart.getChart(canvas);
        if (existingChart) {
            existingChart.destroy();
        }
    }
}