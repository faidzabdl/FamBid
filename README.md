# 🏆 FamBid - Web Lelang Sederhana

FamBid adalah aplikasi web lelang sederhana berbasis PHP Native. Aplikasi ini dirancang sebagai platform pembelajaran untuk memahami konsep lelang online dengan berbagai peran pengguna.

## ✨ Fitur Utama

- **Manajemen Pengguna**
  - Login dan logout
  - Tiga level akses: Admin, Worker, dan User
- **Lelang**
  - Tambah, edit, dan hapus barang lelang (Admin & Worker)
  - Melihat daftar barang yang sedang dilelang (Semua pengguna)
  - Menawar barang dengan harga tertentu (User)
  - Menentukan pemenang lelang (Admin & Worker)
- **Dashboard**
  - Statistik lelang dan pengguna (Admin)
  - Riwayat penawaran pengguna (User)
- **Keamanan**
  - Validasi input pengguna
  - Proteksi akses berdasarkan level pengguna

## 🛠️ Teknologi yang Digunakan

- **Backend**: PHP Native
- **Database**: MySQL
- **Frontend**: HTML, CSS, JavaScript
- **Libraries**: Bootstrap

## 📥 Instalasi

1. Clone repository ini:
   ```bash
   git clone https://github.com/faidzabdl/FamBid.git
   ```
2. Pindahkan folder ke direktori server lokal (misalnya `htdocs` jika menggunakan XAMPP).
3. Import database dari file `fambid.sql` ke MySQL.
4. Konfigurasi koneksi database di file `config.php`:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_USER', 'root');
   define('DB_PASS', '');
   define('DB_NAME', 'fambid');
   ```
5. Jalankan aplikasi melalui browser:
   ```
   http://localhost/FamBid
   ```

## 📝 Akun Default
| Role  | Username | Password |
|--------|------------|------------|
| Admin  | admin     | admin123   |
| Worker | worker    | worker123  |
| User   | user      | user123    |

## 📌 Penggunaan
- **Admin** dapat mengelola semua data, menambah/menghapus lelang, dan menentukan pemenang.
- **Worker** dapat menambahkan barang lelang tetapi tidak bisa menghapusnya.
- **User** hanya dapat melihat lelang dan memberikan penawaran.


---
🚀 **FamBid - Web Lelang Sederhana**
