# Menu Masakan - Website Resep Masakan

Website resep masakan Indonesia yang responsif dan menarik dengan fitur lengkap untuk berbagi dan menemukan resep.

## Fitur Utama

### 🏠 **Halaman Beranda**
- Tampilan hero dengan pencarian resep
- Kategori masakan yang menarik
- Resep populer dengan rating
- Desain responsif untuk semua perangkat

### 🍳 **Halaman Resep**
- Pencarian dan filter lengkap (kategori, tingkat kesulitan, waktu memasak)
- Tampilan grid dan list
- Rating dan ulasan pengguna
- Sortir berdasarkan popularitas, rating, waktu

### 📖 **Detail Resep**
- Informasi lengkap resep (waktu, porsi, kalori, tingkat kesulitan)
- Video tutorial YouTube
- Daftar bahan dengan takaran
- Langkah memasak yang detail
- Sistem rating dan komentar
- Tombol share ke media sosial
- Fitur cetak resep

### 👤 **Sistem Pengguna**
- Registrasi dan login
- Upload resep sendiri
- Simpan resep favorit
- Penjadwalan menu mingguan
- Profil pengguna

### ℹ️ **Halaman Informasi**
- Halaman Tentang Kami dengan informasi platform
- Halaman Kontak dengan form dan FAQ
- Tim dan misi perusahaan
- Statistik platform

### 📱 **Fitur Tambahan**
- Design responsif (mobile-first)
- Social media sharing
- Print-friendly layout
- Loading animations
- Custom scrollbar

## Struktur Database

### Tabel Utama:
- `users` - Data pengguna
- `kategori` - Kategori masakan
- `resep` - Data resep
- `bahan` - Bahan-bahan resep
- `langkah_memasak` - Langkah memasak
- `rating` - Rating resep
- `komentar` - Komentar pengguna
- `favorit` - Resep favorit
- `menu_mingguan` - Penjadwalan menu
- `tag` - Tag resep
- `resep_tag` - Relasi resep dan tag

## Instalasi

1. **Clone atau extract project**
   ```bash
   cd c:/xampp/htdocs/
   ```

2. **Import Database**
   - Buka phpMyAdmin
   - Buat database baru bernama `menumasakan`
   - Import file `db_schema.sql`

3. **Konfigurasi Database**
   Edit file `app/Config/Database.php`:
   ```php
   'hostname' => 'localhost',
   'username' => 'root',
   'password' => '',
   'database' => 'menumasakan',
   ```

4. **Akses Website**
   Buka browser dan akses: `http://localhost/menumasakan/`

## Demo Login

### Admin:
- Username: `admin`
- Password: `admin`

### User:
- Username: `user`
- Password: `user`

## Struktur File

```
menumasakan/
├── app/
│   ├── Controllers/
│   │   ├── Home.php          # Controller halaman utama
│   │   ├── Resep.php         # Controller resep
│   │   ├── Auth.php          # Controller autentikasi
│   │   └── Favorit.php       # Controller favorit
│   ├── Views/
│   │   ├── home.php          # Halaman beranda
│   │   ├── menu.php          # Halaman daftar resep
│   │   ├── resep_detail.php  # Detail resep
│   │   ├── upload_resep.php  # Upload resep
│   │   ├── login.php         # Halaman login
│   │   ├── register.php      # Halaman registrasi
│   │   └── favorit.php       # Halaman favorit
│   └── Config/
│       └── Routes.php        # Konfigurasi routing
├── public/
│   └── css/
│       └── style.css         # Custom CSS
├── db_schema.sql             # Schema database
└── README.md                 # Dokumentasi
```

## Teknologi yang Digunakan

- **Backend**: CodeIgniter 4
- **Frontend**: Bootstrap 5, Font Awesome 6
- **Database**: MySQL
- **JavaScript**: Vanilla JS dengan Ajax
- **CSS**: Custom CSS dengan animasi

## Fitur Responsif

### Mobile (< 768px):
- Navigation collapse menu
- Stacked layout untuk form
- Touch-friendly buttons
- Optimized image sizes

### Tablet (768px - 1024px):
- 2-column grid untuk resep
- Sidebar collapse

### Desktop (> 1024px):
- 3-column grid untuk resep
- Full sidebar
- Fixed social share buttons

## Browser Support

- Chrome 60+
- Firefox 60+
- Safari 12+
- Edge 79+

## Kontribusi

Untuk berkontribusi pada project ini:

1. Fork repository
2. Buat branch feature (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## Lisensi

Project ini menggunakan lisensi MIT. Lihat file `LICENSE` untuk detail.

## Kontak

Untuk pertanyaan atau saran, silakan hubungi:
- Email: admin@menumasakan.com
- Website: http://localhost/menumasakan/

---
**Menu Masakan** - Platform terbaik untuk berbagi dan menemukan resep masakan Indonesia 🇮🇩

CodeIgniter is a PHP full-stack web framework that is light, fast, flexible and secure.
More information can be found at the [official site](https://codeigniter.com).

This repository holds a composer-installable app starter.
It has been built from the
[development repository](https://github.com/codeigniter4/CodeIgniter4).

More information about the plans for version 4 can be found in [CodeIgniter 4](https://forum.codeigniter.com/forumdisplay.php?fid=28) on the forums.

You can read the [user guide](https://codeigniter.com/user_guide/)
corresponding to the latest version of the framework.

## Installation & updates

`composer create-project codeigniter4/appstarter` then `composer update` whenever
there is a new release of the framework.

When updating, check the release notes to see if there are any changes you might need to apply
to your `app` folder. The affected files can be copied or merged from
`vendor/codeigniter4/framework/app`.

## Setup

Copy `env` to `.env` and tailor for your app, specifically the baseURL
and any database settings.

## Important Change with index.php

`index.php` is no longer in the root of the project! It has been moved inside the *public* folder,
for better security and separation of components.

This means that you should configure your web server to "point" to your project's *public* folder, and
not to the project root. A better practice would be to configure a virtual host to point there. A poor practice would be to point your web server to the project root and expect to enter *public/...*, as the rest of your logic and the
framework are exposed.

**Please** read the user guide for a better explanation of how CI4 works!

## Repository Management

We use GitHub issues, in our main repository, to track **BUGS** and to track approved **DEVELOPMENT** work packages.
We use our [forum](http://forum.codeigniter.com) to provide SUPPORT and to discuss
FEATURE REQUESTS.

This repository is a "distribution" one, built by our release preparation script.
Problems with it can be raised on our forum, or as issues in the main repository.

## Server Requirements

PHP version 8.1 or higher is required, with the following extensions installed:

- [intl](http://php.net/manual/en/intl.requirements.php)
- [mbstring](http://php.net/manual/en/mbstring.installation.php)

> [!WARNING]
> - The end of life date for PHP 7.4 was November 28, 2022.
> - The end of life date for PHP 8.0 was November 26, 2023.
> - If you are still using PHP 7.4 or 8.0, you should upgrade immediately.
> - The end of life date for PHP 8.1 will be December 31, 2025.

Additionally, make sure that the following extensions are enabled in your PHP:

- json (enabled by default - don't turn it off)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php) if you plan to use MySQL
- [libcurl](http://php.net/manual/en/curl.requirements.php) if you plan to use the HTTP\CURLRequest library
