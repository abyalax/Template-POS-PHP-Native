import { PaymentMethod } from "./payment";

export interface CartItem {
    id: number;
    barcode: number;
    name: string;
    price: number;
    cost_price: number;
    tax_rate: number;
    discount: number;
    quantity: number;
}

export interface CartState {
    items: CartItem[];
    subtotal: number;
    total: number;
    total_item: number;
    total_discount: number;
    payment_method: PaymentMethod;
    pay_received: number;
    pay_change: number;
    tax: number;
}