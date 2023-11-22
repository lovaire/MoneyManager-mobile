
Tugas 7

1. Stateless Widget:

Stateless widget adalah widget yang tidak memiliki keadaan internal yang dapat berubah setelah dibuat. Ini berarti widget ini tidak dapat mengubah tampilannya setelah pertama kali digambar.
Stateless widget biasanya digunakan untuk bagian-bagian antarmuka pengguna yang statis, yang tidak memerlukan perubahan berdasarkan keadaan atau input.
Stateless widget lebih efisien karena tidak perlu melacak perubahan keadaan dan tidak memicu pembaruan ulang tampilan saat ada perubahan.
Stateful Widget:

Stateful widget adalah widget yang memiliki keadaan internal yang dapat berubah selama masa hidupnya. Ini berarti widget ini dapat memperbarui tampilannya berdasarkan perubahan keadaan atau input.
Stateful widget digunakan ketika Anda perlu membuat elemen antarmuka pengguna yang membutuhkan perubahan dinamis, seperti daftar item yang dapat ditambahkan, dihapus, atau diperbarui.
Stateful widget lebih kompleks daripada stateless widget karena Anda harus mengelola keadaan internalnya dan memastikan pembaruan tampilan yang tepat saat ada perubahan keadaan.

2. Seluruh widget yang saya gunakan dalam tugas ini dan fungsinya masing-masing:

- MyApp (StatefulWidget): Ini adalah widget utama yang mewakili aplikasi Flutter. Ini mengatur seluruh tampilan dan logika aplikasi.

- KeuanganItem (Kelas Model): Ini adalah kelas model yang digunakan untuk menggambarkan entitas item keuangan. Ini memiliki properti seperti nama, kategori, jumlah, dan tanggal.

- TextFormField: Widget ini digunakan untuk membuat kotak teks input untuk nama item.

- DropdownButton: Ini adalah widget dropdown yang digunakan untuk memilih kategori (Masuk atau Keluar).

- ElevatedButton: Digunakan untuk tombol "Simpan Catatan," "Lihat Item," dan "Logout."

- Text: Digunakan untuk menampilkan teks, seperti "Saldo Anda: $totalAmount."

- ListView.builder: Digunakan untuk menampilkan daftar item keuangan dalam bentuk daftar bergulir.

- Card dan ListTile: Digunakan untuk mengatur tampilan item keuangan dalam daftar.

- IconButton: Digunakan untuk menambahkan ikon hapus pada setiap item keuangan untuk menghapusnya.

3. Bagaimana cara saya mengimplementasikan checklist di atas secara step-by-step:

a. Saya mulai dengan membuat proyek Flutter baru dan menambahkan kode di atas ke dalam main.dart sebagai titik awal.

b. Saya mendefinisikan kelas KeuanganItem sebagai model data untuk item keuangan.

c. Saya membuat StatefulWidget utama, MyApp, yang mengatur tampilan dan logika aplikasi.

d. Saya menambahkan widget TextFormField, DropdownButton, dan ElevatedButton untuk memungkinkan pengguna memasukkan nama, kategori, jumlah, dan tanggal item keuangan.

e. Saya mengelola keadaan aplikasi dengan mengubah tampilan setiap kali item baru ditambahkan atau dihapus dari daftar.

f. Saya menggunakan ListView.builder untuk menampilkan daftar item keuangan dengan cara yang efisien.

g. Saya menambahkan tombol hapus untuk setiap item keuangan dengan IconButton.

h. Saya menambahkan SnackBar saat tombol "Tambah Item," "Lihat Item," atau "Logout" ditekan.

Tugas 8

1. - Navigator.push(): Metode ini digunakan untuk menambahkan rute baru ke atas rute saat ini, sehingga halaman baru ditampilkan di atas halaman sebelumnya. 

- Navigator.pushReplacement(): Metode ini menghapus rute saat ini dan menggantinya dengan rute baru. 

2. - Row dan Column: Digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column).
   - Container: Widget yang menggabungkan penempatan, dan widget ukuran.
   - Padding: Widget yang memberikan batasan pada child-nya.

3. - TextFormField: Digunakan untuk menerima input teks dari pengguna.
   - Checkbox: Digunakan untuk menerima input boolean (benar atau salah) dari pengguna.
   - RadioButton: Digunakan untuk menerima pilihan dari sekelompok pilihan.
   - Slider: Digunakan untuk menerima input berupa nilai dalam rentang tertentu.
   - Button: Digunakan untuk menerima aksi dari pengguna, seperti mengirim form.


Tugas 9

1. Kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, dengan membuat model akan lebih memudahkan untuk dibaca dan identifikasi bug. 

2. Fungsi CookieRequest: ookie  digunakan untuk menyimpan informasi sesi pengguna. Misalnya, setelah pengguna berhasil login, ID sesi dapat disimpan dalam cookie dan dikirim kembali ke server dalam setiap request berikutnya, sehingga server dapat mengenali pengguna tersebut.

3.Mekanisme Pengambilan Data dari JSON: Untuk mengambil data dari JSON dan menampilkannya di Flutter, kita biasanya melakukan beberapa langkah berikut:
    - Melakukan HTTP request untuk mendapatkan data JSON dari server.
    - Mengurai (parsing) data JSON menjadi struktur data yang dapat digunakan oleh Flutter, seperti `Map` 
    - Mengubah data ini menjadi model (jika model telah dibuat).
    - Menampilkan data ini di widget Flutter.

4. Mekanisme Autentikasi dari Flutter ke Django: Proses autentikasi biasanya melibatkan langkah-langkah berikut:
    - Pengguna memasukkan data akun (misalnya, username dan password) di aplikasi Flutter.
    - Aplikasi Flutter mengirimkan data ini ke server Django melalui HTTP request.
    - Server Django memverifikasi data ini. Jika data valid, server akan membuat sesi untuk pengguna dan mengirimkan ID sesi ini kembali ke aplikasi dalam bentuk cookie atau token.
    - Aplikasi Flutter menyimpan ID sesi ini dan menggunakannya untuk setiap request berikutnya, sehingga server dapat mengenali pengguna.
    - Setelah pengguna berhasil login, menu atau fitur tertentu dapat ditampilkan di aplikasi Flutter.

