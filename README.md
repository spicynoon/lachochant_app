Lachochant App - On Develop
# Lachochant App - Task Manager Flutter Application

Lachochant App adalah sebuah aplikasi task manager yang revolusioner, dibangun menggunakan Flutter, sebuah framework open-source yang populer untuk pengembangan aplikasi mobile lintas platform. Aplikasi ini memiliki tujuan utama untuk membantu pengguna dalam mengatur dan mengelola tugas-tugas sehari-hari dengan mudah dan efisien. Dengan tampilan yang menarik dan antarmuka yang sederhana, Lachochant App menjadi solusi yang ideal untuk mengatur aktivitas sehari-hari dan menjaga produktivitas pengguna.

## Tujuan Aplikasi

Tujuan utama dari Lachochant App adalah memberikan pengalaman pengguna yang luar biasa dalam mengelola tugas-tugas mereka dengan mudah, tanpa hambatan, dan dengan fitur-fitur yang relevan. Aplikasi ini bertujuan untuk menyediakan solusi terintegrasi untuk mengelola tugas-tugas, memastikan bahwa pengguna dapat dengan cepat menambahkan, mengedit, dan menyelesaikan tugas-tugas mereka dengan baik. Beberapa tujuan lainnya termasuk:

- **Efisiensi Tugas**: Lachochant App membantu pengguna mengatur tugas-tugas mereka secara efisien, sehingga mereka dapat mengoptimalkan waktu dan meningkatkan produktivitas.

- **Kemudahan Akses**: Aplikasi ini menyediakan kemudahan akses dengan dukungan Firebase login, memungkinkan pengguna untuk masuk dan mendaftar dengan akun Google mereka untuk pengalaman pengguna yang lebih aman dan lebih cepat.

## Fitur Unggulan

### 1. State-of-the-Art State Management

Lachochant App menggunakan Riverpod 2.0 sebagai alat manajemen state yang canggih dan efisien. Dengan Riverpod 2.0, aplikasi ini menawarkan performa yang lebih baik dan responsif, memastikan pengalaman pengguna yang mulus tanpa gangguan.

### 2. Penyimpanan Data Lokal yang Handal

Sqlite menjadi pilihan sempurna untuk penyimpanan data secara lokal di perangkat pengguna. Dengan fitur ini, Lachochant App memungkinkan pengguna untuk tetap mengakses tugas-tugas mereka bahkan tanpa koneksi internet, serta meningkatkan kecepatan dan efisiensi dalam penggunaan aplikasi.

### 3. Pengingat Tugas yang Terintegrasi

Local Notification memungkinkan Lachochant App untuk mengirimkan pengingat yang pribadi dan sesuai kebutuhan bagi pengguna. Dengan notifikasi lokal ini, pengguna tidak akan pernah melewatkan tenggat waktu penting dan selalu tetap berada di atas tugas-tugas mereka.



## Use Case dan Class Diagram
Dapat diakses pada link [berikut](https://s.id/PRAKPBO_UTSUAS)

## Penerapan SOLID Design Principle
Dalam pengembangan aplikasi Flutter Lachochant, saya menerapkan prinsip SOLID untuk mencapai desain yang modular, fleksibel, dan mudah dipelihara. Prinsip ini membantu memastikan bahwa setiap kelas memiliki tanggung jawab yang jelas dan terfokus, memungkinkan penambahan fitur baru tanpa mengubah kode yang ada, dan menghindari ketergantungan yang erat antara kelas-kelas.

### Single Responsibility Principle (SRP)

Setiap kelas dalam Lachochant App memiliki tanggung jawab tunggal yang jelas. Contohnya adalah kelas `TaskManager` yang bertanggung jawab untuk mengelola tugas-tugas, dan kelas `NotificationsHelper` yang bertanggung jawab untuk mengelola notifikasi. Dengan penerapan SRP, perubahan dalam salah satu tanggung jawab hanya akan memengaruhi satu aspek sistem tanpa merusak fungsionalitas lainnya.

### Open-Closed Principle (OCP)

Kode dalam Lachochant App dapat diperluas untuk menambahkan fitur baru tanpa mengubah kode yang ada. Misalnya, dengan menggunakan Riverpod untuk manajemen state, dapat menambahkan fitur baru seperti pengelolaan tugas oleh admin dengan menambahkan provider baru tanpa harus memodifikasi kode yang ada. Prinsip OCP memungkinkan aplikasi beradaptasi dengan kebutuhan yang berubah tanpa mempengaruhi kode yang sudah stabil.

### Liskov Substitution Principle (LSP)

Subkelas dalam Lachochant App dapat digunakan sebagai pengganti kelas induk tanpa mengubah semantik aplikasi. Contohnya adalah kelas `GeneralTask`, yang merupakan subkelas dari kelas `Task`. Kode yang mengharapkan objek tipe `Task` dapat digantikan oleh objek tipe `GeneralTask` tanpa mengganggu fungsionalitas yang diharapkan.

### Interface Segregation Principle (ISP)

Memastikan bahwa antarmuka tidak memaksa klien untuk bergantung pada metode yang tidak mereka gunakan. Contohnya adalah antarmuka `DBHelper` yang khusus digunakan untuk operasi CRUD pada database. Antarmuka ini hanya menyediakan metode yang relevan untuk operasi yang dibutuhkan, sehingga klien tidak perlu bergantung pada metode yang tidak mereka gunakan.

### Dependency Inversion Principle (DIP)

Menerapkan prinsip DIP dengan mengandalkan abstraksi daripada implementasi kelas lain. Misalnya, kami menggunakan abstraksi `Task` sebagai kontrak untuk semua jenis tugas dalam `TaskManager`. Dengan bergantung pada abstraksi, kode menjadi lebih fleksibel dan terisolasi dari detail implementasi konkrit.

Dengan keseluruhan penerapan prinsip SOLID, Lachochant App menjadi aplikasi yang kokoh, mudah diperluas, dan mudah dipelihara. Setiap prinsip memberikan panduan yang jelas dalam desain dan struktur kode untuk mencapai kualitas perangkat lunak yang lebih tinggi.

## Design Patterns dalam Lachochant App

Dalam pengembangan Lachochant App, saya menerapkan beberapa design pattern yang berguna untuk mengatur state aplikasi, mengelola sumber data, memudahkan pembuatan objek, serta memantau dan menambahkan fitur tambahan pada objek tanpa mengubah struktur internalnya. Berikut adalah design pattern yang kami terapkan:

### Provider Pattern

Provider pattern digunakan untuk mengelola state dalam aplikasi Flutter. Dalam Lachochant App, mengimplementasikan Provider pattern menggunakan Riverpod, sebuah package state management berbasis provider pattern. Dengan Riverpod, state aplikasi seperti daftar tugas dan informasi pengguna dapat diakses dan diperbarui dengan mudah di berbagai bagian aplikasi. Provider pattern membantu kami memisahkan logika bisnis dari tampilan, sehingga kode menjadi lebih modular dan mudah diuji.

### Repository Pattern

Repository pattern digunakan untuk mengelola akses ke sumber data, seperti database atau API. Dalam Lachochant App, menerapkan repository pattern dengan membuat repository yang bertanggung jawab untuk mengelola operasi-operasi CRUD pada DBHelper atau Firebase. Repository menyediakan antarmuka terpisah antara logika bisnis dengan sumber data, sehingga memungkinkan fleksibilitas dalam memilih sumber data tanpa mengganggu logika bisnis.

## Factory Pattern

Factory pattern digunakan untuk membuat objek tanpa harus secara langsung menentukan kelas konkretnya. Dalam Lachochant App, menerapkan factory pattern untuk membuat objek tugas berdasarkan jenis atau kategori tugas. Dengan factory pattern, kami dapat dengan mudah menambahkan jenis tugas baru di masa depan tanpa harus mengubah kode yang ada secara luas.

## Observer Pattern

Observer pattern digunakan untuk membangun hubungan one-to-many antara objek-objek, di mana perubahan pada satu objek dapat mempengaruhi objek-objek lain yang mengamatinya. Dalam Lachochant App, mengimplementasikan observer pattern untuk memantau perubahan pada daftar tugas. Ketika ada perubahan pada daftar tugas, objek-objek yang mengamatinya (seperti UI) akan diberi tahu dan diperbarui secara otomatis.

## Decorator Pattern

Decorator pattern digunakan untuk menambahkan perilaku atau fitur tambahan pada objek tanpa mengubah struktur internalnya. Dalam Lachochant App, menerapkan decorator pattern untuk menambahkan fitur-fitur tambahan pada tugas, seperti pengingat atau status prioritas. Dengan menggunakan decorator pattern, fitur-fitur tambahan dapat diterapkan secara dinamis pada tugas tanpa mempengaruhi logika utama tugas tersebut.

Dengan penerapan berbagai design pattern di atas, Lachochant App menjadi lebih terstruktur, fleksibel, dan mudah dikembangkan. Setiap pattern memberikan kontribusi penting dalam mengatasi tantangan khusus dalam pengembangan aplikasi dan memastikan kode kami mematuhi prinsip desain yang baik.

## Konektivitas ke Database
### Konektivitas ke Firebase untuk Authentication User:
Firebase menyediakan berbagai metode otentikasi pengguna, termasuk otentikasi melalui email dan OTP (One-Time Password) yang dapat dikirimkan melalui email.
Untuk mengelola autentikasi pengguna dengan Firebase, Saya menggunakan Firebase Authentication SDK yang tersedia untuk Flutter.
Dalam aplikasi Task Manager, Saya mengimplementasikan fitur login dan registrasi pengguna menggunakan otentikasi email dan OTP dari Firebase.
Firebase akan menangani proses autentikasi, termasuk verifikasi email dan manajemen status login pengguna.

### Konektivitas ke DBHelper sebagai Database Pembantu:
DBHelper adalah kelas yang bertanggung jawab untuk mengelola operasi-operasi CRUD pada database lokal, seperti SQLite.
DBHelper menyediakan metode untuk membuat, membaca, memperbarui, dan menghapus tugas dari database lokal.
Dalam Lachochant App, DBHelper dapat digunakan untuk menyimpan dan memanipulasi data tugas, seperti nama tugas, deadline, deskripsi, dan status tugas.
DBHelper menggunakan SQLite sebagai database lokal untuk menyimpan data tugas secara persisten di perangkat pengguna.
Dalam Flutter, Anda dapat menggunakan package sqflite untuk menghubungkan aplikasi dengan SQLite dan mengelola operasi-operasi database.
