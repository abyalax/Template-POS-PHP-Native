
export interface ItemSummary {
    name: string;
    sub_total: number;
    total_discount: number;
    total_price: number;
    unit_profit: number;
    total_profit: number;
    total_tax: number;
    last_price: number;
}

export interface ItemTransaction {
    name: string;
    category: string;
    qty: number;
    price: number;
    cost_price: number;
    discount: number; // 0.08 misalnya
    tax_rate: number; // 0.1 misalnya
    summary: ItemSummary
}

export interface TransactionState {
    transaction_id?: string;
    status: 'draft' | 'pending' | 'completed' | 'cancelled' | 'refunded';
    cashier?: string;
    user_id?: number;
    item: ItemTransaction[];
    subtotal: number;
    total_discount: number;
    total_price: number;
    total_profit: number;
    total_tax: number;
    last_price: number;
    payment_method: string;
    pay_received: number;
    pay_return: number;
    createdAt?: string;
    notes?: string;
}