import { expect, test } from "../fixtures";
import { cart, payloadTransaction, productCart } from "../data/product";

const domain = process.env.DOMAIN;

// test.describe.configure({ mode: 'serial' });

test.describe('Point of Sales Kasir Testing', () => {
    test.use({ withLogin: true });
    test('should can do transaction at cashier', async ({ page }) => {
        await page.goto(`${domain}/transaction`);
        await test.step('insert product to cart', async () => {
            await page.getByTestId('input-search-product').fill(productCart.name);
            await page.getByTestId('btn-insert-cart').click();
        })

        await test.step('data muncul di table', async () => {
            const cartRow = page.locator(`[data-id="${productCart.id}"]`);
            await expect(cartRow).toBeVisible();
        })

        await test.step('realtime summary', async () => {
            await expect(page.getByTestId('cart-total-item')).toHaveText(cart.total_item);
            await expect(page.getByTestId('cart-sub-total')).toHaveText(cart.subtotal);
            await expect(page.getByTestId('cart-total-tax')).toHaveText(cart.total_tax);
            await expect(page.getByTestId('cart-total-discount')).toHaveText(cart.total_discount);
            await expect(page.getByTestId('cart-total')).toHaveText(cart.total);
        })

        await test.step('realtime payment', async () => {
            await page.getByTestId('pay-transaction').fill(cart.pay_received);
            await expect(page.getByTestId('return-transaction')).toHaveValue(cart.pay_return);
            await page.getByTestId('btn-preview-struct').click();
        })

        await test.step('save transaction with correct data calculation', async () => {
            await page.route('**/api/transaction/insert', async (route, request) => {
                const postData = request.postDataJSON();
                expect(postData).toMatchObject(payloadTransaction);
                await route.fulfill({
                    status: 201,
                    contentType: 'application/json',
                    body: JSON.stringify({ data: { transaction_id: 'trx-00001' } }),
                });
            });
            await page.getByTestId('btn-save-transaction').click();
            await expect(page.locator('.native-toast-success')).toBeVisible();
        })

    });
});