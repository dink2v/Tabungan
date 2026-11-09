# Tabungan — ProjectHub

Aplikasi pencatat tabungan pribadi berbasis web, dibuat dengan HTML, CSS, dan JavaScript tanpa proses build.

## Fitur
- Dashboard ringkasan tabungan utama dan target barang.
- Tabungan utama dengan target saldo mandiri.
- Target barang independen, masing-masing memiliki saldo dan progres sendiri.
- Transaksi pemasukan dan pengeluaran untuk tabungan utama maupun target.
- Wishlist dengan judul, harga, URL produk, dan URL gambar.
- Riwayat transaksi.
- Ekspor data JSON untuk backup.
- Tampilan responsif untuk desktop dan ponsel.

## Menjalankan
Buka `index.html` di browser, atau aktifkan GitHub Pages:
1. Buka **Settings → Pages**.
2. Pada **Build and deployment**, pilih **Deploy from a branch**.
3. Pilih branch **main** dan folder **/(root)**.
4. Simpan, lalu tunggu GitHub Pages menerbitkan situs.

## Penyimpanan data
Versi awal ini menyimpan data di `localStorage` browser/perangkat yang digunakan. Data tidak otomatis tersinkron ke perangkat lain atau ke GitHub. Gunakan tombol **Ekspor** untuk mengunduh backup JSON secara berkala. Jangan masukkan data keuangan sensitif ke perangkat bersama.

## Mata uang
Seluruh nominal menggunakan Rupiah (IDR).
