import CartManager from "./module/cart-manager"
import CartUI from "./module/cart-ui"

document.addEventListener('DOMContentLoaded', () => {
    const cartManager = new CartManager()
    new CartUI(cartManager)
})