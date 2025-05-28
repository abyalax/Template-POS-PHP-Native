import test, { expect } from "@playwright/test";
import { kasir } from '../data/user';
import { domain } from "../config";

test.describe('Authentication Testing', () => {
    test('should allow me to login and redirect to /transaction', async ({ page }) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(kasir.email);
        await page.getByTestId('login-password').fill(kasir.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/transaction`);
        await expect(page.getByTestId('page-transaction')).toBeVisible();
        await expect(page).toHaveURL(/\/transaction$/);
        await expect(page.getByTestId('page-transaction')).toBeVisible();
    });

    test('should deny access without login', async ({ page }) => {
        await page.goto(`${domain}/transaction`);
        await expect(page).toHaveURL(/\/login$/);
    });

    test('should allow me to logout', async ({ page }) => {
        await page.goto(`${domain}/login`);
        await page.getByTestId('login-email').fill(kasir.email);
        await page.getByTestId('login-password').fill(kasir.password);
        await page.getByTestId('btn-login').click();
        await page.waitForURL(`${domain}/transaction`);
        await expect(page.getByTestId('page-transaction')).toBeVisible();
        await page.getByTestId('btn-logout').click();
        await page.waitForURL(`${domain}/login`);
        await expect(page).toHaveURL(/\/login$/);
    });
});