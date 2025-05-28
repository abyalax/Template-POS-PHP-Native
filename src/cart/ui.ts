import CartManager from "./core";
import { CartItem, CartState } from "../types/cart";
import { getUserSession } from "../auth";
import { getProductByID, getProducts } from "../product/core";
import { calculateTransaction } from "../calculation/transaction";
import { formatPrice } from "../helper";
import TransactionManager from "../transaction/core";
import { toast } from "../helper/config";

export default class CartUI {
    private debounceTimer: number = 0;
    private cartManager: CartManager

    constructor(cartManager: CartManager) {
        this.cartManager = cartManager
        this.bindEvents();
    }

    private bindEvents(): void {
        console.log('Bind Events...');
        this.renderInterface();
        this.handleDate();
        document.addEventListener('cartUpdated', this.renderInterface)

        const formSearchInput = document.getElementById('form-search-products') as HTMLFormElement
        formSearchInput.addEventListener('submit', this.hanldeAddToCartForm)

        const payInput = document.getElementById('pay-transaction') as HTMLInputElement;
        payInput.addEventListener('input', this.handleInputPay);

        const noteTextArea = document.getElementById('cart-notes') as HTMLTextAreaElement;
        noteTextArea.addEventListener('input', this.handleAddNotes);

        const boxFormSearchInput = document.getElementById('box-search-products') as HTMLFormElement;
        boxFormSearchInput.addEventListener('submit', this.hanldeAddToCartBox);

        const printStructBtn = document.getElementById('print-struct-btn') as HTMLButtonElement;
        printStructBtn.addEventListener('click', this.handlePrintStruct);

        const saveTransactionBtn = document.getElementById('btn-save-transaction') as HTMLButtonElement;
        saveTransactionBtn.addEventListener('click', this.handleSaveTransaction);

        const selectProductBtn = document.getElementById('select-product-btn') as HTMLButtonElement;
        selectProductBtn.addEventListener('click', async () => {
            const table = document.getElementById('bx-table-search-product') as HTMLTableSectionElement;
            const products = await getProducts();
            if (table) {
                table.innerHTML = products.map(product =>
                    `
                <tr class="" data-id="${product.id}">
                    <td class="d-xl-table-cell">${product.barcode}</td>
                    <td class="d-xl-table-cell">${product.name}</td>
                    <td class="d-xl-table-cell">
                    <button class="btn btn-secondary box-search-products-addcart">
                        +
                    </button>
                    </td>
                </tr>
            `).join('')
            }
            setTimeout(() => {
                this.bindAddToCartBtn()
            }, 900);
        });

        const resetCartBtn = document.getElementById('reset-cart-btn') as HTMLButtonElement;
        resetCartBtn.addEventListener('click', this.handleClearCart);
    }

    private handleDate = () => {
        const dates = document.querySelectorAll('.date-time');
        if (!dates.length) return;
        const today = new Date().toISOString().split("T")[0];
        dates.forEach(el => el.textContent = today);
    };

    private bindAddToCartBtn = () => {
        const buttons = document.querySelectorAll('.box-search-products-addcart') as NodeListOf<HTMLButtonElement>;
        console.log('Bind Add To Cart Button...');
        buttons.forEach((btn) => {
            btn.addEventListener('click', async (e) => {
                e.preventDefault();
                console.log('Add Cart clicked...');
                const row = btn.closest('tr') as HTMLTableRowElement;
                const productId = row.dataset.id;
                console.log('Add Cart clicked, ID:', productId);
                await getProductByID(Number(productId)).then((product) => {
                    this.cartManager.addItem(product);
                    this.renderInterface();
                })
            })
        });
    };

    private renderInterface = () => {
        console.log('Update Cart Display...');

        const rowCart = document.getElementById('cart-items') as HTMLTableSectionElement;
        const subTotalPriceEl = document.getElementById('cart-sub-total') as HTMLParagraphElement;
        const totalPriceEl = document.getElementById('cart-total') as HTMLParagraphElement;
        const totalDiscountEl = document.getElementById('cart-total-discount') as HTMLParagraphElement;
        const totalTaxEl = document.getElementById('cart-total-tax') as HTMLParagraphElement;
        const totalItemEl = document.getElementById('cart-total-item') as HTMLParagraphElement;

        const carts = this.cartManager.getCart()
        console.log('Carts : ', carts);

        if (carts.items.length === 0) {
            rowCart.innerHTML = '<p style="width:100%;text-align:center">Keranjang kosong</p>'
            totalPriceEl.textContent = 'Rp0';
            totalDiscountEl.textContent = 'Rp0';
            subTotalPriceEl.textContent = 'Rp0';
            totalTaxEl.textContent = 'Rp0';
            totalItemEl.textContent = '0';
            return;
        }

        if (!rowCart) return;

        rowCart.innerHTML = carts.items.map(item => `
            <tr class="cart-item" data-id="${item.id}">
                <td class="d-xl-table-cell">${item.barcode}</td>
                <td class="item-name">${item.name}</td>

                <td class="item-quantity  d-xl-table-cell">
                    <div class="d-flex gap-2">
                        <button type="button" class="qty-minus btn btn-secondary px-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-minus">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                        </button>
                        <input class="input-qty" type="number"
                            style="background-color:transparent;border:none;outline:none;font-size:1.2rem;width:20px;"
                            value="${item.quantity}"></input>
                        <button type="button" class="qty-plus btn btn-secondary px-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-plus">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                        </button>
                    </div>
                </td>
                <td class="item-price  d-xl-table-cell">${formatPrice(item.price)}</td>
                <td class=" d-md-table-cell">${item.discount * 100}%</td>
                <td class="item-price  d-xl-table-cell">${formatPrice((item.price - (item.price * item.discount)) * item.quantity)}</td>
                <td class="table-action d-xl-table-cell d-flex flex-wrap gap-2 justify-content-center align-items-center">
                    <button type="button" class="item-remove btn btn-secondary my-1" style="text-decoration: none;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" style="width:1rem;height:1rem;"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-trash-2">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
                    </button>
                </td>
            </tr>
        `).join('');

        totalPriceEl.textContent = formatPrice(carts.total);
        totalDiscountEl.textContent = formatPrice(carts.total_discount)
        subTotalPriceEl.textContent = formatPrice(carts.subtotal)
        totalTaxEl.textContent = formatPrice(carts.tax)
        totalItemEl.textContent = carts.total_item.toString();

        document.querySelectorAll<HTMLButtonElement>('.qty-minus').forEach(btn => {
            btn.removeEventListener('click', this.handleDecreaseQty);
            btn.addEventListener('click', this.handleDecreaseQty);
        });

        document.querySelectorAll<HTMLButtonElement>('.qty-plus').forEach(btn => {
            btn.removeEventListener('click', this.handleIncreaseQty);
            btn.addEventListener('click', this.handleIncreaseQty);
        });

        document.querySelectorAll<HTMLButtonElement>('.item-remove').forEach(btn => {
            btn.removeEventListener('click', this.handleRemoveItem);
            btn.addEventListener('click', this.handleRemoveItem);
        });

        document.querySelectorAll<HTMLInputElement>('.input-qty').forEach(input => {
            input.removeEventListener('change', this.handleQuantityChange);
            input.addEventListener('change', this.handleQuantityChange);
        })
    }

    private addToCart = async (e: Event, id: string) => {
        e.preventDefault()
        console.log('Add To Cart...');
        const searchInput = document.getElementById(id) as HTMLInputElement
        try {
            const response = await this.cartManager.fetchByName(searchInput.value)
            const product = response.data
            console.log('Found Product by Name : ', product);

            const parsedProduct: CartItem = {
                ...product,
                cost_price: Number(product.cost_price),
                price: Number(product.price),
                discount: Number(product.discount),
                tax_rate: Number(product.tax_rate),
                quantity: 1
            }

            searchInput.value = '';
            this.cartManager.addItem(parsedProduct);
            this.renderInterface();
            toast({
                message: `${product.name} ditambahkan ke keranjang`,
                type: 'success',
            })
        } catch (error) {
            console.log('addToCart error: ', error);
            toast({
                message: 'Something Wrong',
                type: 'error',
            })
        }
    }

    private printStruct = async (carts: CartState): Promise<void> => {
        console.log('Print Struct : ', { carts });

        const receiptDiv = document.createElement("div");
        receiptDiv.id = "receipt";
        receiptDiv.style.display = "none";

        // Format tanggal
        const now = new Date();
        const dateStr = now.toISOString().split("T")[0];
        const timeStr = now.toTimeString().split(" ")[0];
        const cashier = await getUserSession();
        console.log('Cashier : ', cashier);

        // Header struk
        let html = `
            <div style="font-family: monospace; font-size: 20px; padding: 10px;">
                <div style="text-align: center;">
                    <strong>Abya's DevStore</strong><br>
                    Jl. Kartini Mojokerep, Plemahan<br>
                    Kabupaten Kediri<br>
                    No. Telp 0812345678<br>
                    16413520230802084636
                </div>
                <hr>
                <div style="display: flex; justify-content: space-between;">
                    <div>${dateStr}<br>${timeStr}</div>
                    <div style="text-align: end;">
                        Kasir<br>
                        ${cashier.name}<br>
                    </div>
                </div>
                <br>Products<br>
                <hr>
            `;

        let itemIndex = 1;
        let totalQty = 0;

        html += carts.items.map(item => {
            const qty = item.quantity;
            const total = item.price * qty;
            totalQty += qty;

            return `
                <div style="margin-bottom: 15px;">
                    <strong>${itemIndex++}. ${item.name}</strong>
                    <div style="display:flex;justify-content:space-between;">
                        <div style="margin-left: 30px;">${qty} x Rp ${item.price.toLocaleString("id-ID")}</div>
                        <div>Rp ${total.toLocaleString("id-ID")}</div>
                    </div>
                </div>
            `;
        }).join("<br>");

        // Total Qty, Total, dan pembayaran
        html += `
            <hr>
            <div>Total QTY : ${totalQty}</div>
            <br>
            <div style="display: flex; justify-content: space-between;">
                <span>Sub Total</span>
                <span>${carts.subtotal.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Total Tax</span>
                <span>${carts.tax.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Total Discount</span>
                <span>${carts.total_discount.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <strong>Total</strong>
                <strong>${carts.total.toLocaleString("id-ID")}</strong>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Bayar (Cash)</span>
                <span>${carts.pay_received.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Kembali</span>
                <span>${carts.pay_return.toLocaleString("id-ID")}</span>
            </div>
            <br>
            <div style="text-align: center;">Terimakasih Telah Berbelanja</div>
            <br>
            <div style="font-size: 10px; text-align: center;">
                Link Kritik dan Saran:<br>
                com/e-receipt/S-00D39U-07G344G
            </div>
            </div>
        `;

        receiptDiv.innerHTML = html;
        document.body.appendChild(receiptDiv);

        // CSS print override
        const style = document.createElement("style");
        style.textContent = `
            @media print {
                body * {
                    visibility: hidden !important;
                }
                #receipt, #receipt * {
                    visibility: visible !important;
                }
                #receipt {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 100%;
                    padding: 10px;
                }
            }
        `;
        document.head.appendChild(style);

        // Tampilkan lalu print
        receiptDiv.style.display = "block";
        setTimeout(() => {
            console.log('Start Print...');
            window.print();
            receiptDiv.remove();
            style.remove();
        }, 200);
    }

    private handleAddNotes = (e: Event) => {
        const input = e.target as HTMLTextAreaElement;
        this.cartManager.setNotes(input.value);
    }

    private handleSaveTransaction = async (e: Event) => {
        e.preventDefault();
        console.log('Masuk handleSaveTransaction...');
        const cart = this.cartManager.getCart();
        console.log('Transaksi at state ', cart);
        const payInput = document.getElementById('pay-transaction') as HTMLInputElement;
        const received = parseInt(payInput.value);
        if (this.cartManager.isEmptyCart()) {
            toast({
                message: 'Keranjang masih kosong',
                type: 'warning',
                position: 'center'
            })
        } else if (!received) {
            toast({
                message: 'Jumlah pembayaran tidak boleh kosong.',
                type: 'warning'
            })
            return
        } else if (received < cart.total) {
            toast({
                message: 'Jumlah Pembayaran kurang.',
                type: 'warning'
            });
            return
        } else {
            const transaction = calculateTransaction(cart);
            console.log('Result of calculation transaction ', transaction);
            const result = await TransactionManager.insert(transaction);
            if (result?.data?.transaction_id) {
                toast({
                    message: 'Transaksi berhasil disimpan',
                    type: 'success'
                })
                payInput.value = '';
                this.cartManager.clearCart();
                this.renderInterface();
            } else {
                toast({
                    message: 'Transaksi gagal disimpan',
                    type: 'error'
                })
            }
        }
    }

    private handleQuantityChange = (e: Event) => {
        const input = e.target as HTMLInputElement;
        const newQty = parseInt(input.value);
        const itemElement = input.closest<HTMLTableRowElement>('.cart-item');
        if (!itemElement) console.error('Item element not found.');

        const itemId = parseInt(itemElement?.dataset.id || '0');
        console.log('Finding cart with id', itemId);

        const carts = this.cartManager.getCart()
        const item = carts.items.find(item => item.id === itemId);
        console.log('Found item', item);
        if (isNaN(newQty) || newQty < 1) {
            toast({
                message: 'Jumlah tidak boleh kosong atau kurang dari 1',
                type: 'warning'
            })
            input.value = "1"; return;
        } this.cartManager.updateQuantity(itemId, newQty);
        this.renderInterface();
    }

    private handlePrintStruct = (e: Event): void => {
        e.preventDefault();
        console.log('Masuk handlePrintStruct...');
        const carts = this.cartManager.getCart();
        this.printStruct(carts);
    }

    private hanldeAddToCartBox = (e: Event) => {
        this.addToCart(e, 'bx-search-products')
    }

    private hanldeAddToCartForm = (e: Event) => {
        this.addToCart(e, 'fm-search-products')
    }

    private handleInputPay = (e: Event) => {
        console.log('Handle Input Pay...');
        const target = e.target as HTMLInputElement;
        const returnInput = document.getElementById('return-transaction') as HTMLInputElement;
        clearTimeout(this.debounceTimer);
        const cart = this.cartManager.getCart()
        this.debounceTimer = window.setTimeout(() => {
            const bayar = parseFloat(target.value) || 0;
            const kembali = bayar - cart.total;
            const kembalian = kembali > 0 ? kembali : 0
            returnInput.value = formatPrice(kembalian);
            this.cartManager.setPayReceived(bayar);
            this.cartManager.setPayChange(kembali);
        }, 300);
    }

    private handleDecreaseQty = (e: Event) => {
        const target = e.target as HTMLButtonElement;
        const itemElement = target.closest<HTMLTableRowElement>('.cart-item');
        if (!itemElement) return;

        const itemId = parseInt(itemElement.dataset.id || '0');
        const carts = this.cartManager.getCart()
        const item = carts.items.find(item => item.id === itemId);

        if (item && item.quantity > 1) {
            this.cartManager.updateQuantity(itemId, item.quantity - 1);
            this.renderInterface();
        } else {
            toast({
                message: 'Product dihapus dari keranjang',
                type: 'info'
            })
            this.cartManager.removeItem(itemId);
            this.renderInterface();
        }
    }

    private handleIncreaseQty = (e: Event) => {
        const target = e.target as HTMLButtonElement;
        const itemElement = target.closest<HTMLTableRowElement>('.cart-item');
        if (!itemElement) return;

        const itemId = parseInt(itemElement.dataset.id || '0');
        console.log('Finding cart with id', itemId);
        const carts = this.cartManager.getCart()
        const item = carts.items.find(item => item.id === itemId);
        console.log('Found item', item);
        if (item) {
            this.cartManager.updateQuantity(itemId, item.quantity + 1);
            this.renderInterface();
        }
    }

    private handleRemoveItem = (e: Event) => {
        const target = e.target as HTMLButtonElement;
        const itemElement = target.closest<HTMLTableRowElement>('.cart-item');
        if (!itemElement) return;

        const itemId = parseInt(itemElement.dataset.id || '0');
        this.cartManager.removeItem(itemId);
        this.renderInterface();
    }

    private handleClearCart = (e: Event) => {
        e.preventDefault()
        this.cartManager.clearCart();
        this.renderInterface();
    }

}