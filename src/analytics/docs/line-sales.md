
---

## 📘 **Dokumentasi Perhitungan Transaksi POS**

### 🔢 **Perhitungan Per Item (`ItemSummary`)**

Diberikan `CartItem`:

```ts
{
  price: number,        // Harga jual per unit
  cost_price: number,   // Harga modal per unit
  discount: number,     // Diskon dalam desimal, misal 0.1 untuk 10%
  tax_rate: number,     // Pajak dalam desimal, misal 0.1 untuk 10%
  quantity: number      // Jumlah unit terjual
}
```

Rumus yang digunakan:

| Field            | Rumus                                              | Keterangan                                             |
| ---------------- | -------------------------------------------------- | ------------------------------------------------------ |
| `sub_total`      | `price * quantity`                                 | Nilai penjualan kotor (belum diskon & pajak)           |
| `total_discount` | `price * discount * quantity`                      | Total diskon untuk item tersebut                       |
| `total_price`    | `sub_total - total_discount`                       | Harga setelah diskon, belum termasuk pajak             |
| `unit_profit`    | `price - cost_price - (total_discount / quantity)` | Laba bersih per unit                                   |
| `total_profit`   | `unit_profit * quantity`                           | Total laba untuk item tersebut                         |
| `total_tax`      | `price * tax_rate * quantity`                      | Pajak dihitung dari harga jual kotor                   |
| `last_price`     | `total_price + total_tax`                          | Total akhir yang dibayar pelanggan untuk item tersebut |

---

### 🧾 **Perhitungan Total Transaksi (`TransactionState`)**

Total dari semua item:

| Field            | Rumus              | Keterangan                                 |
| ---------------- | ------------------ | ------------------------------------------ |
| `subtotal`       | `Σ sub_total`      | Total penjualan kotor                      |
| `total_discount` | `Σ total_discount` | Total diskon dari semua item               |
| `total_price`    | `Σ total_price`    | Total setelah diskon                       |
| `total_tax`      | `Σ total_tax`      | Total pajak dari semua item                |
| `total_profit`   | `Σ total_profit`   | Total laba bersih                          |
| `last_price`     | `Σ last_price`     | Total akhir (harga setelah diskon + pajak) |

---

## 📊 **Definisi untuk Dashboard**

| Metrik                    | Rumus / Sumber Data                                | Keterangan                                                                         |
| ------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------------------- |
| **Sales**                 | `subtotal`                                         | Nilai penjualan kotor, belum termasuk diskon dan pajak                             |
| **Revenue**               | `last_price`                                       | Total uang yang diterima dari transaksi                                            |
| **Profit**                | `total_profit`                                     | Laba bersih setelah dikurangi modal dan diskon                                     |
| **Total Sales**           | `Σ subtotal dari semua transaksi`                  | Total penjualan kotor dari seluruh transaksi                                       |
| **Total Revenue**         | `Σ last_price dari semua transaksi`                | Total uang masuk dari seluruh transaksi                                            |
| **Total Profit**          | `Σ total_profit dari semua transaksi`              | Total laba bersih dari seluruh transaksi                                           |
| **Pie Chart by Category** | Hitung `qty` atau `last_price` per kategori produk | Untuk visualisasi distribusi penjualan atau pendapatan berdasarkan kategori produk |

---
