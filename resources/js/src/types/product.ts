export interface Product {
    id?: number;
    name: string;
    price: number;
    discount: number;
    barcode: number;
    stock_qty: number;
    category?: string;
    is_active: boolean;
    cost_price: number;
    tax_rate: number;
    category_id?: number;
    created_at?: string;
    updated_at?: string;
}

export interface Category {
    id: number;
    name: string
}