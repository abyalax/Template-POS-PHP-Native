# Projects Point Of Sales

---

# **Dokumentasi Role-Based Access Control (RBAC) - Point of Sales (POS)**
### **Daftar Role dan Permission (RBAC)**
#### **Super Admin**
- `manage_system`  _(Full akses ke semua fitur sistem)_
- `manage_users`  _(Kelola semua user dan role)_
#### **Admin**
- `manage_inventaris`  _(CRUD inventaris)_
- `manage_suppliers`  _(CRUD supplier)_
- `manage_produk`  _(CRUD produk)_
- `manage_categories`  _(Kelola kategori produk)_
- `read_analytics`  _(Lihat laporan)_
- `export_reports`  _(Ekspor data laporan)_
#### **Owner/Pemilik Bisnis**
- `read_analytics`  _(Lihat semua laporan)_
- `financial_reports`  _(Akses laporan keuangan)_
- `manage_payments`  _(Kelola metode pembayaran)_
- `manage_settings`  _(Ubah pengaturan sistem)_
- `read_dashboard`  _(Akses dashboard lengkap)_
#### **Manager**
- `read_transactions`  _(Bacatransaksi)_
- `update_inventaris`  _(Update stok manual)_
- `read_reports`  _(Buat laporan harian/mingguan)_
- `manage_members`  _(Kelola member VIP)_
- `manage_products`  _(Kelola produk)_
- `manage_discounts`  _(Kelola promo dan diskon)_
#### **Cashier/Kasir**
- `create_transactions`  _(Buat transaksi baru)_
- `read_products`  _(Lihat daftar produk)_
- `process_payments`  _(Proses pembayaran)_
#### **Inventory Staff/Staf Gudang**
- `manage_inventory`  _(CRUD stok gudang)_
- `manage_products`  _(CRUD data produk)_
#### **Reporting Analyst**
- `read_dashboard`  _(Lihat dashboard)_
- `read_analytics`  _(Lihat laporan analitik)_
---

### **Format Permission**
Setiap permission mengikuti pola: 

- `**manage_[fitur]**`  = Full CRUD (Create, Read, Update, Delete) 
- `**read_[fitur]**`  = Hanya lihat 
- `**update_[fitur]**`  = Hanya update 
- `**create_[fitur]**`  = Hanya tambah data 
- `**delete_[fitur]**`  = Hanya hapus data
---

### **Catatan**
- Permission `**manage_***`  otomatis mencakup `read|create|update|delete` . 
- **Hierarki Permission:**
    - `manage_`  = Full CRUD (Create, Read, Update, Delete)
    - `read_`  = Hanya view
    - `create_`  = Hanya tambah data
    - `update_`  = Hanya edit
    - `delete_`  = Hanya hapus
    - `process_`  = Aksi spesifik


