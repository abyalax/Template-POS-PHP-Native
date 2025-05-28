import test, { expect } from "@playwright/test";
import { kasir, admin, owner, karyawan, manager } from "../data/user"

const domain = process.env.DOMAIN;

test.describe('Authorization Testing', () => {
    test('login as a kasir', async ({ page }) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(kasir.email);
        await page.getByTestId('login-password').fill(kasir.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/transaction`);
        await expect(page.getByTestId('page-transaction')).toBeVisible();
    });

    test('login as a admin', async ({ page}) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(admin.email);
        await page.getByTestId('login-password').fill(admin.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/products`);
        await expect(page.getByTestId('page-products')).toBeVisible();
    });
    
    test('login as a owner', async ({ page}) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(owner.email);
        await page.getByTestId('login-password').fill(owner.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/dashboard`);
        await expect(page.getByTestId('page-dashboard')).toBeVisible();
    });

    test('login as a manager', async ({ page}) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(manager.email);
        await page.getByTestId('login-password').fill(manager.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/product`);
        await expect(page.getByTestId('page-product')).toBeVisible();
    });

    test('login as a karyawan', async ({ page}) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(karyawan.email);
        await page.getByTestId('login-password').fill(karyawan.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/karyawans`);
        await expect(page.getByTestId('page-karyawans')).toBeVisible();
    });

});