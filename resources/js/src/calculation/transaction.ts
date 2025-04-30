import { ItemSummary, ItemTransaction, TransactionState } from "../types/transaction";
import { CartState } from "../types/cart";
// import { CartItem } from "../types/cart";
// import { PaymentMethod } from "../types/payment";

export function calculateTransaction(cartState: CartState): TransactionState {

    const items = cartState.items;

    let subtotal_transaction = 0;
    let total_discount_transaction = 0;
    let total_price_transaction = 0;
    let total_profit_transaction = 0;
    let total_tax_transaction = 0;
    let last_price_transaction = 0;

    const item_summaries: ItemSummary[] = [];

    for (const unit of items) {
        const sub_total = unit.price * unit.quantity;
        const total_discount = unit.price * unit.discount * unit.quantity;
        const total_price = sub_total - total_discount;

        const unit_profit = unit.price - unit.cost_price - (total_discount / unit.quantity);
        const total_profit = unit_profit * unit.quantity;

        const total_tax = unit.price * unit.tax_rate * unit.quantity;
        const last_price = total_price + total_tax;

        // Accumulate transaction totals
        subtotal_transaction += sub_total;
        total_discount_transaction += total_discount;
        total_price_transaction += total_price;
        total_profit_transaction += total_profit;
        total_tax_transaction += total_tax;
        last_price_transaction += last_price;

        const item = {
            name: unit.name,
            sub_total,
            total_discount,
            total_price,
            unit_profit,
            total_profit,
            total_tax,
            last_price,
        } as ItemSummary

        item_summaries.push(item);
    }

    const item_transaction: ItemTransaction[] = cartState.items.map((item, i) => ({
        name: item.name,
        qty: item.quantity,
        price: item.price,
        cost_price: item.cost_price,
        discount: item.discount,
        tax_rate: item.tax_rate,
        summary: item_summaries[i]
    }))

    const transaction: TransactionState = {
        cashier: { id: 3, name: 'Admin' },
        transactionId: 'TRX-001',
        item: item_transaction,
        subtotal: subtotal_transaction,
        total_discount: total_discount_transaction,
        total_price: total_price_transaction,
        total_profit: total_profit_transaction,
        total_tax: total_tax_transaction,
        pay_change: cartState.pay_change,
        pay_received: cartState.pay_received,
        payment_method: cartState.payment_method,
        last_price: last_price_transaction,
    }

    return transaction;
}


// contoh data
// const cart = [
//     {
//         name: "NIVEA MEN Extra Bright 50ml",
//         quantity: 2,
//         price: 25000,
//         cost_price: 15000,
//         discount: 0.08, // 8%
//         tax_rate: 0.10, // 10%
//     } as CartItem,
//     {
//         name: "Product Else 50ml",
//         quantity: 1,
//         price: 28000,
//         cost_price: 25000,
//         discount: 0.05, // 5%
//         tax_rate: 0.10, // 10%
//     } as CartItem
// ] as CartItem[];

// const cartState = {
//     items: cart,
//     subtotal: 0,
//     total: 0,
//     total_item: 0,
//     total_discount: 0,
//     payment_method: PaymentMethod.Cash,
//     pay_received: 100000,
//     pay_change: 19600,
//     tax: 0
// } as CartState;

// const result = calculateTransaction(cartState);
// console.log(JSON.stringify(result, null, 2));
