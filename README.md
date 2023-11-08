
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