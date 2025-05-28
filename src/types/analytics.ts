export interface ReportSales {
    total_sales: number;
    total_profit: number;
    total_revenue: number;
}

export interface SalesByCategory {
    category: string;
    total_revenue: number;
    total_sales: number;
    total_profit: number;
    total_qty: number;
}