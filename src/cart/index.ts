import CartManager from "./core"
import CartUI from "./ui"

document.addEventListener('DOMContentLoaded', () => {
    const cartManager = new CartManager()
    new CartUI(cartManager)
})