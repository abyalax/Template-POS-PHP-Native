import { toast } from "../helper/config";
import { ReportSales, SalesByCategory } from "../types/analytics";

export default class AnalyticsCore {
    public static async getReportSalesByMonth(): Promise<ReportSales[]> {
        const res = await fetch('api/analytics/report/month', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        })
        if (res.status === 200) {
            const response = await res.json();
            return response.data
        } else {
            toast({
                message: 'Gagal mendapatkan laporan penjualan',
                type: 'error'
            })
            return []
        }
    }

    public static async getReportSalesByYear(): Promise<ReportSales> {
        const res = await fetch('api/analytics/report/year', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        })
        if (res.status === 200) {
            const response = await res.json();
            return response.data[0]
        } else {
            toast({
                message: 'Gagal mendapatkan laporan penjualan tahunan',
                type: 'error'
            })
            return {
                total_profit: 0,
                total_sales: 0,
                total_revenue: 0,
            }
        }
    }

    public static async getReportSalesByCategory(): Promise<SalesByCategory[]> {
        const res = await fetch('api/analytics/report/category', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        })
        if (res.status === 200) {
            const response = await res.json();
            console.log(response.data);
            return response.data
        } else {
            toast({
                message: 'Gagal mendapatkan laporan penjualan per katergory',
                type: 'error'
            })
            return []
        }
    }
}