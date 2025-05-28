Dalam analisis **produk** untuk dashboard Point of Sales (POS), kamu bisa menampilkan metrik dan visualisasi yang menjawab pertanyaan berikut:

> **"Produk mana yang paling laku, paling menguntungkan, atau justru tidak bergerak?"**

Berikut adalah **komponen dashboard analisis produk** yang umum dan berguna:

---

## 🔍 **Metrik Per Produk**

Dihitung dari data transaksi historis (berdasarkan `ItemTransaction`):

| Metrik                         | Keterangan                                                                 |
| ------------------------------ | -------------------------------------------------------------------------- |
| **Total Terjual (Qty)**        | Total unit yang terjual. Indikator popularitas produk.                     |
| **Total Transaksi**            | Berapa kali produk ini muncul di transaksi.                                |
| **Total Penjualan (Sales)**    | `Σ sub_total`. Total nilai penjualan kotor.                                |
| **Total Revenue**              | `Σ last_price`. Total pendapatan setelah pajak dan diskon.                 |
| **Total Profit**               | `Σ total_profit`. Laba bersih produk.                                      |
| **Rata-rata Terjual per Hari** | Total unit / jumlah hari aktif penjualan.                                  |
| **Rata-rata Margin (%)**       | `(profit / sales) × 100`. Untuk tahu margin keuntungan per produk.         |
| **Stok Tersisa (jika ada)**    | Jika POS kamu juga mengelola inventori.                                    |
| **Status Produk**              | Contoh: Best Seller, Low Performer, Slow Moving (bisa pakai label dinamis) |

---

## 📊 **Visualisasi Produk**

| Tipe Chart                         | Fungsi                                       |
| ---------------------------------- | -------------------------------------------- |
| **Bar Chart**: Produk vs Qty       | Menampilkan produk terlaris.                 |
| **Bar Chart**: Produk vs Profit    | Menampilkan produk paling menguntungkan.     |
| **Pie Chart**: Produk per Kategori | Distribusi produk berdasarkan kategori.      |
| **Heatmap Waktu** (opsional)       | Produk mana yang laris di jam/hari tertentu. |
| **Top 5 / Bottom 5 Produk**        | Produk paling laku dan paling tidak laku.    |

---

## 🧮 **Contoh Struktur Data Agregasi per Produk**

```ts
interface ProductAnalytics {
  product_id: number;
  name: string;
  category: string;
  total_qty: number;
  total_sales: number;
  total_revenue: number;
  total_profit: number;
  total_transactions: number;
  avg_profit_margin: number;
}
```

---

## 💡 Rekomendasi Insight Otomatis

Jika ingin lebih canggih:

* 🚀 **Produk Best Seller:** qty tertinggi
* 💰 **Produk Paling Untung:** total\_profit tertinggi
* 🐢 **Produk Slow Moving:** penjualan sangat sedikit dalam rentang waktu tertentu
* 📉 **Produk Rugi:** total\_profit negatif
* 📦 **Produk Tidak Bergerak:** qty = 0 selama X hari

---
