# Tabungan

Aplikasi tabungan pribadi berbasis web, responsif untuk desktop dan ponsel. Dibuat dengan HTML, CSS, dan JavaScript tanpa proses build.

## Fitur
- Dashboard ringkasan saldo utama, target, total terkumpul, dan target tercapai.
- Saldo tabungan utama yang terpisah dari saldo setiap target barang.
- Target independen: nama, nominal, saldo awal, link produk, gambar, deadline, dan catatan.
- Wishlist barang dengan harga dan link produk; bisa dijadikan target tabungan.
- Transaksi pemasukan dan pengeluaran berulang.
- Transfer antar saldo utama dan target.
- Riwayat transaksi dengan edit dan arsip (soft delete), serta pemulihan dari arsip.
- Statistik pemasukan, pengeluaran, jumlah transaksi, dan progres target.
- PIN lokal 4–6 digit. PIN disimpan sebagai hash di browser.
- Penyimpanan lokal otomatis dan ekspor backup JSON manual.
- Mata uang Rupiah (IDR).

## Menjalankan dengan GitHub Pages
1. Buka repository **Settings → Pages**.
2. Pada **Build and deployment**, pilih **GitHub Actions**.
3. Workflow `.github/workflows/static.yml` akan menerbitkan file statis dari root repository setiap ada push ke branch `main`.
4. Setelah deployment berhasil, buka alamat Pages yang ditampilkan di halaman **Settings → Pages**.

## Penyimpanan dan keamanan saat ini
Versi ini menyimpan data di `localStorage` browser/perangkat yang digunakan. Data tetap bisa dicatat saat offline pada browser tersebut. Backup JSON bisa diunduh dari tombol **Ekspor**. Data browser tidak otomatis ikut pindah ke perangkat lain.

PIN mengunci tampilan aplikasi di browser ini, tetapi bukan pengganti enkripsi database atau autentikasi cloud. Jika browser storage dihapus, data lokal dan PIN dapat hilang. Simpan backup secara berkala.

## Supabase (tahap integrasi berikutnya)
Keputusan proyek adalah menggunakan Supabase untuk cloud database, tanpa layar login. File `supabase/schema.sql` sudah disiapkan untuk tabel backup privat berbasis Supabase Anonymous Auth dan Row Level Security (RLS).

**Cloud sync belum aktif di versi ini.** Repository tidak menggunakan project Supabase NoteTogether; buat project Supabase terpisah khusus Tabungan sebelum mengaktifkan cloud sync. Aktifkan **Authentication → Providers → Anonymous Sign-Ins**, jalankan SQL schema, lalu integrasikan project URL dan publishable key ke aplikasi. Jangan pernah menaruh service-role/secret key di frontend.

Anonymous Auth tidak menampilkan form login, tetapi identitas anonymous terikat ke browser/perangkat. Menghapus data browser atau pindah perangkat dapat membuat identitas anonymous lama tidak bisa dipulihkan, jadi backup JSON tetap penting.

## Catatan
- GitHub menyimpan kode aplikasi, bukan data tabungan pengguna.
- Notifikasi browser dan pengingat deadline terjadwal belum diaktifkan.
- Seluruh nominal ditampilkan dalam Rupiah (IDR).
