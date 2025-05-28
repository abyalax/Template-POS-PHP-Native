import { defineConfig, devices } from '@playwright/test';

/**
 * Read environment variables from file.
 * https://github.com/motdotla/dotenv
 */
import dotenv from 'dotenv';
dotenv.config({path: '.env'});

/**
 * See https://playwright.dev/docs/test-configuration.
 */
// export default defineConfig({
//   testDir: './.',
//   fullyParallel: false,
//   workers: 1,
//   reporter: 'list',
//   use: {
//     headless: false,
//     serviceWorkers: 'block',
//     launchOptions: {
//       headless: false,
//       slowMo: 2000,
//       args: ['--start-maximized'],
//     },
//     baseURL: process.env.BASE_URL,
//     trace: 'on-first-retry',
//   },
//   projects: [
//     {
//       name: 'chromium',
//       use: {
//         ...devices['Desktop Chrome'],
//         viewport: { width: 1920, height: 1080 },
//         deviceScaleFactor: 1.25,
//       },
//     },
//   ],
// });

// Headless

export default defineConfig({
  testDir: './.',
  fullyParallel: true,
  reporter: 'list',
  use: {
    headless: true,
    viewport: { width: 1280, height: 720 },
    launchOptions: {
      headless: true,
      slowMo: 500,
      args: ['--start-maximized'],
    },
    baseURL: process.env.BASE_URL,
    trace: 'on-first-retry',
  },
  projects: [
    {
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
      },
    },
  ],
});