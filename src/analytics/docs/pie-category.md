
---

## 📊 **Pie Chart Penjualan per Kategori Produk**

### 🎯 **Tujuan**

Menampilkan distribusi **penjualan (sales)** berdasarkan **kategori produk**, digunakan dalam pie chart untuk memberi insight:

> *Kategori mana yang paling banyak berkontribusi terhadap total penjualan?*

---

### 📘 **Definisi**

* **Kategori Produk** → diambil dari field `CartItem.category`
* **Sales per Item** → `price × quantity`
  (Tanpa memperhitungkan diskon atau pajak – ini adalah *penjualan kotor*)
* **Sales per Kategori** → `Σ sales` dari seluruh item dalam transaksi yang memiliki kategori yang sama.

---

### 🔣 **Rumus**

| Field            | Rumus                              | Keterangan                                        |
| ---------------- | ---------------------------------- | ------------------------------------------------- |
| `item_sales`     | `price × quantity`                 | Nilai penjualan kotor per item                    |
| `category_sales` | `Σ item_sales untuk tiap kategori` | Total sales untuk kategori tertentu               |
| `category_qty`   | `Σ quantity untuk tiap kategori`   | Total jumlah unit terjual untuk kategori tertentu |

---

### 📦 **Struktur Data Output (Pie Chart Data)**

```ts
interface PieChartCategorySales {
  category: string;
  total_sales: number; // Σ price * qty per kategori
  total_qty: number;   // Σ quantity per kategori
}
```

---

### ✅ **Implementasi Function**

```ts
export function getSalesPerCategory(transactions: TransactionState[]): PieChartCategorySales[] {
  const map = new Map<string, PieChartCategorySales>();

  for (const transaction of transactions) {
    for (const item of transaction.item) {
      const sales = item.price * item.qty;
      const existing = map.get(item.category);

      if (existing) {
        existing.total_sales += sales;
        existing.total_qty += item.qty;
      } else {
        map.set(item.category, {
          category: item.category,
          total_sales: sales,
          total_qty: item.qty,
        });
      }
    }
  }

  return Array.from(map.values());
}
```

---

### 📊 **Contoh Output**

```ts
[
  { category: "Minuman", total_sales: 150000, total_qty: 60 },
  { category: "Makanan", total_sales: 230000, total_qty: 90 },
  { category: "Snack", total_sales: 80000, total_qty: 30 }
]
```

---

### 📈 **Penggunaan di Pie Chart**

* Gunakan `category` sebagai label (slice name)
* Gunakan `total_sales` sebagai nilai untuk menentukan ukuran slice
* Bisa diganti `total_qty` jika ingin menampilkan jumlah unit terjual per kategori

Contoh `dataKey` untuk Recharts:

```tsx
<Pie data={data} dataKey="total_sales" nameKey="category" />
```

---
