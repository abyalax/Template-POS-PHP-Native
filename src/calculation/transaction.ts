import { ItemSummary, ItemTransaction, TransactionState } from "../types/transaction";
import { CartState } from "../types/cart";

export function calculateTransaction(
        cartState: CartState
    ): TransactionState {

    const items = cartState.items;

    let subtotal_transaction = 0;
    let total_discount_transaction = 0;
    let total_price_transaction = 0;
    let total_profit_transaction = 0;
    let total_tax_transaction = 0;
    let last_price_transaction = 0;

    const item_summaries: ItemSummary[] = [];

    for (const unit of items) {
        const sub_total =
            unit.price * unit.quantity;
        const total_discount =
            unit.price *
            unit.discount *
            unit.quantity;
        const total_price = sub_total - total_discount;

        const unit_profit =
            unit.price - unit.cost_price -
            (total_discount / unit.quantity);
        const total_profit = unit_profit * unit.quantity;

        const total_tax =
            unit.price *
            unit.tax_rate *
            unit.quantity;
        const last_price = total_price + total_tax;

        subtotal_transaction += sub_total;
        total_discount_transaction += total_discount;
        total_price_transaction += total_price;
        total_profit_transaction += total_profit;
        total_tax_transaction += total_tax;
        last_price_transaction += last_price;

        const item: ItemSummary = {
            name: unit.name,
            sub_total,
            total_discount,
            total_price,
            unit_profit,
            total_profit,
            total_tax,
            last_price,
        }

        item_summaries.push(item);
    }

    const item_transaction: ItemTransaction[] =
        items.map((item, i) => ({
            name: item.name,
            category: item.category,
            product_id: item.id,
            barcode: item.barcode,
            qty: item.quantity,
            price: item.price,
            cost_price: item.cost_price,
            discount: item.discount,
            tax_rate: item.tax_rate,
            summary: item_summaries[i]
        }))
    const transaction: TransactionState = {
        status: 'pending',
        item: item_transaction,
        subtotal: subtotal_transaction,
        total_discount: total_discount_transaction,
        total_price: total_price_transaction,
        total_profit: total_profit_transaction,
        total_tax: total_tax_transaction,
        pay_return: cartState.pay_return,
        pay_received: cartState.pay_received,
        payment_method: cartState.payment_method,
        last_price: last_price_transaction,
        notes: cartState.notes,
    }

    return transaction;
}
