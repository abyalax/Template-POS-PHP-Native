
---

### **Daftar Role dan Permission (RBAC)**

#### **Transactions**
- manage: [super_admin, owner]
- process: [ kasir ]
- create: [ kasir ]
- read: [kasir, manager, admin, karyawan]
- update: [ ]
- delete: [ ]

#### **Inventaris**
- manage: [super_admin, admin, owner]
- process: 
- create: [ ] 
- read: [ kasir, manager, karyawan ] 
- update: [ ]
- delete: [ ]

#### **Analytics**
- manage: [super_admin, owner]
- process: [manager, admin]
- create: [ ]
- read: [ kasir, manager, admin, karyawan ]
- update: [ ]
- delete: [ ]

#### **Suppliers**
- manage: [super_admin, admin, owner]
- create: [ ]
- read: [kasir, manager, karyawan ] 
- update: [ ]
- delete: [ ]

#### **Members**
- manage: [super_admin, admin, owner]
- create: [ ]
- read: [ kasir, manager, karyawan ] 
- update: [ kasir ]
- delete: [ ]

#### **Karyawan**
- manage: [super_admin, admin, owner]
- create: [ ]
- read: [ kasir, manager, karyawan ] 
- update: [ ]
- delete: [ ]

#### **Products**
- manage: [super_admin, admin, owner]
- read: [kasir, manager, karyawan ] 
- update: [ ]
- delete: [ ]

#### **Payments**
- manage: [super_admin, owner]
- process: [ kasir ]
- read: [kasir, manager, admin, karyawan ] 
- update: [ ]
- delete: [ ]

#### **Settings**
- manage: [super_admin, owner]
- read: [ kasir, manager, admin, karyawan ]
- update: [ ]
- delete: [ ]

---

### Non Tecnical

### **Format Permission**  
Setiap permission mengikuti pola:  
- **`manage_[fitur]`** = Full CRUD (Create, Read, Update, Delete)  
- **`read_[fitur]`** = Hanya lihat  
- **`update_[fitur]`** = Hanya update  
- **`create_[fitur]`** = Hanya tambah data  
- **`delete_[fitur]`** = Hanya hapus data  
- **Hierarki Permission:**
   - `manage_` = Full CRUD (Create, Read, Update, Delete)
   - `read_` = Hanya view
   - `create_` = Hanya tambah data
   - `update_` = Hanya edit
   - `delete_` = Hanya hapus
   - `process_` = Aksi spesifik


### Seed awal 6 user 
1. super_admin
   ```json
   {
      "name": "root",
      "email": "root@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"root",
   }
   ```
2. owner
   ```json
   {
      "name": "abya owner",
      "email": "abyalaxx@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"abya-owner",
   }
   ```
3. admin
   ```json
   {
      "name": "abya admin",
      "email": "abyalaxx@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"abya-admin",
   }
   ```
4. manager
   ```json
   {
      "name": "abya manager",
      "email": "abyalaxx@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"abya-manager",
   }
   ```
5. kasir
   ```json
   {
      "name": "abya kasir",
      "email": "abyalaxx@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"abya-kasir",
   }
   ```
6. karyawan 
   ```json
   {
      "name": "abya karyawan",
      "email": "abyalaxx@gmail.com",
      "nip":"00000000000",
      "phone":"087765290292",
      "password":"abya-karyawan",
   }