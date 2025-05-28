import { CartItem, CartState } from "../types/cart";
import { PaymentMethod } from "../types/payment";

export default class CartManager {
    private _stateCart: CartState;

    constructor() {
        this._stateCart = {
            subtotal: 0,
            tax: 0,
            total: 0,
            total_item: 0,
            total_discount: 0,
            payment_method: PaymentMethod.Cash,
            pay_return: 0,
            pay_received: 0,
            notes: '',
            items: [],
        }
        this.loadFromStorage();
    }

    public fetchByName(name: string) {
        const fetchData = fetch("api/product/name", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `name=${encodeURIComponent(name)}`
        })
        const response = fetchData.then(response => response.json())
        return response
    }

    public addItem(product: CartItem): void {
        console.log('Adding item:', product);
        const existingItem = this._stateCart.items.find(item => item.id === product.id);
        if (existingItem) {
            existingItem.quantity += product.quantity ?? 1;
        } else {
            this._stateCart.items.push({
                ...product,
                quantity: product.quantity || 1
            });
        }
        this.calculateTotals();
        this.save();
    }

    public removeItem(productId: number): void {
        this._stateCart.items = this._stateCart.items.filter(item => item.id !== productId);
        this.calculateTotals();
        this.save();
    }

    public updateQuantity(productId: number, newQuantity: number): void {
        console.log('Updating item with:', 'productId: ', productId, 'newQuantity: ', newQuantity);
        const item = this._stateCart.items.find(item => item.id === productId);
        console.log('Updating quantity for item:', item);
        if (item) {
            item.quantity = newQuantity;
            this.calculateTotals();
            this.save();
            console.log('Cart after update:', this._stateCart);
        }
    }

    private calculateTotals(): void {
        console.log('Calculating totals...');

        const cart = this._stateCart;
        const items = cart.items;

        let subtotal = 0;
        let total_discount = 0;
        let tax = 0;
        let total_item = 0;

        for (const item of items) {
            const itemTotal = item.price * item.quantity;
            const itemDiscount = item.price * (item.discount || 0) * item.quantity;
            const itemTax = (item.tax_rate || 0) * item.price * item.quantity;

            subtotal += itemTotal;
            total_discount += itemDiscount;
            tax += itemTax;
            total_item += item.quantity;
        }

        cart.subtotal = subtotal;
        cart.total_discount = total_discount;
        cart.tax = tax;
        cart.total = subtotal - total_discount + tax;
        cart.total_item = total_item;

        console.log('Cart calculated:', {
            subtotal,
            total_discount,
            tax,
            total: cart.total,
            total_item
        });
    }

    private save(): void {
        console.log('Save To Storage...');
        localStorage.setItem('pos_cart', JSON.stringify(this._stateCart));
    }

    public loadFromStorage() {
        console.log('Load from storage...');
        const savedCart = localStorage.getItem('pos_cart');
        if (savedCart) {
            this._stateCart = JSON.parse(savedCart);
            console.log('stateCart : ', this._stateCart);
        }
    }

    public isEmptyCart(): boolean {
        return this._stateCart.items.length === 0
    }

    public clearCart(): void {
        this._stateCart = {
            items: [],
            subtotal: 0,
            tax: 0,
            total: 0,
            total_item: 0,
            total_discount: 0,
            payment_method: PaymentMethod.Cash,
            pay_return: 0,
            pay_received: 0,
            notes: '',
        };
        this.save();
        console.log('Cart cleared...');
    }

    public getCart(): CartState {
        return this._stateCart;
    }

    public setPaymentMethod(paymentMethod: PaymentMethod) {
        this._stateCart.payment_method = paymentMethod
    }

    public setPayReceived(pay: number) {
        this._stateCart.pay_received = pay
    }

    public setPayChange(pay: number) {
        this._stateCart.pay_return = pay
    }

    public setNotes(notes: string) {
        this._stateCart.notes = notes
    }
}