
import { CartItem } from "../../src/types/cart"
import { formatPrice, parsePrice } from "../../src/helper/index"

interface MockCartState {
    total_item: string,
    subtotal: string,
    total_tax: string,
    total_discount: string,
    total: string,
    pay_received: '20000',
    pay_return: string
}

export const productCart: CartItem = {
    id: 5,
    name: "Sabun Cuci Piring Sunlight 755ml",
    category: "Perlengkapan Rumah",
    barcode: 8999999998888,
    quantity: 1,
    cost_price: 11000,
    price: 14500,
    discount: 0.10,
    tax_rate: 0.10
}

export const cart: MockCartState = {
    total_item: '1',
    subtotal: formatPrice(14500),
    total_tax: formatPrice(1450),
    total_discount: formatPrice(1450),
    total: formatPrice(14500),
    pay_received: '20000',
    pay_return: formatPrice(5500)
}

export const payloadTransaction = {
    status: "pending",
    item: [
        {
            name: productCart.name,
            category: productCart.category,
            product_id: productCart.id,
            barcode: productCart.barcode.toString(),
            qty: productCart.quantity,
            price: productCart.price,
            cost_price: productCart.cost_price,
            discount: productCart.discount,
            tax_rate: productCart.tax_rate,
            summary: {
                name: productCart.name,
                sub_total: productCart.price * productCart.quantity,
                total_discount: productCart.price * productCart.discount * productCart.quantity,
                total_price: productCart.price * (1 - productCart.discount) * productCart.quantity,
                unit_profit: productCart.price - productCart.cost_price - (productCart.price * productCart.discount) / productCart.quantity,
                total_profit: (productCart.price - productCart.cost_price - (productCart.price * productCart.discount) / productCart.quantity) * productCart.quantity,
                total_tax: productCart.price * productCart.tax_rate * productCart.quantity,
                last_price:
                    productCart.price * (1 - productCart.discount) * productCart.quantity +
                    productCart.price * productCart.tax_rate * productCart.quantity,
            },
        },
    ],
    // Root-level summary properties
    subtotal: productCart.price * productCart.quantity,
    total_discount: productCart.price * productCart.discount * productCart.quantity,
    total_price: productCart.price * (1 - productCart.discount) * productCart.quantity,
    total_profit: (productCart.price - productCart.cost_price - (productCart.price * productCart.discount) / productCart.quantity) * productCart.quantity,
    total_tax: productCart.price * productCart.tax_rate * productCart.quantity,
    // Misal pembayaran dan kembalian disesuaikan contoh, bisa kamu sesuaikan lagi
    pay_received: Number(cart.pay_received),
    pay_return: parsePrice(cart.pay_return),
    payment_method: "cash",
    last_price: productCart.price * (1 - productCart.discount) * productCart.quantity + productCart.price * productCart.tax_rate * productCart.quantity,
    notes: "",
};