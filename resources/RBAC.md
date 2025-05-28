

---

# **Dokumentasi Role-Based Access Control (RBAC) - Point of Sales (POS)**
### **Daftar Role dan Permission (RBAC)**

#### **Super Admin (root)**

* `manage_roles` *(Kelola seluruh peran/role dalam sistem)*
* `logout` *(Keluar dari sistem)*

#### **Guest**

* `access_homepage` *(Akses halaman utama)*
* `login` *(Masuk ke sistem)*

#### **Owner**

* `access_dashboard` *(Akses dashboard)*
* `read_sales` *(Lihat data penjualan)*
* `read_products` *(Lihat daftar produk)*
* `read_report` *(Lihat laporan)*

#### **Manager**

* `access_dashboard`
* `read_sales`
* `read_products`
* `read_transactions`
* `read_report`
* `manage_products` *(CRUD produk)*
* `manage_karyawan` *(CRUD karyawan, shift etc)*

#### **Admin**

* `access_dashboard`
* `manage_products` *(CRUD products)*
* `manage_transactions` *(CRUD transaksi)*

#### **Kasir**

* `access_dashboard`
* `read_sales`
* `read_products`
* `read_transactions`
* `manage_transactions` *(CRUD transaksi)*

#### **Karyawan**

* `read_shift` *(CRUD jadwal shift)*

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
