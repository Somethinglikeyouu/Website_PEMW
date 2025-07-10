CREATE DATABASE IF NOT EXISTS menumasakan;
USE menumasakan;

-- Tabel Kategori
CREATE TABLE kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    gambar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    nama_lengkap VARCHAR(100),
    foto_profil VARCHAR(255),
    role ENUM('user', 'admin') DEFAULT 'user',
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Resep
CREATE TABLE resep (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(200) NOT NULL,
    deskripsi TEXT,
    gambar VARCHAR(255),
    video_url VARCHAR(500),
    kategori_id INT,
    user_id INT,
    tingkat_kesulitan ENUM('mudah', 'sedang', 'sulit') DEFAULT 'mudah',
    waktu_memasak INT, -- dalam menit
    porsi INT DEFAULT 1,
    kalori INT,
    is_popular TINYINT(1) DEFAULT 0,
    is_featured TINYINT(1) DEFAULT 0,
    status ENUM('draft', 'published', 'rejected') DEFAULT 'draft',
    views INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (kategori_id) REFERENCES kategori(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabel Bahan
CREATE TABLE bahan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resep_id INT,
    nama_bahan VARCHAR(100) NOT NULL,
    jumlah VARCHAR(50),
    satuan VARCHAR(20),
    urutan INT DEFAULT 0,
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE
);

-- Tabel Langkah Memasak
CREATE TABLE langkah_memasak (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resep_id INT,
    urutan INT NOT NULL,
    deskripsi TEXT NOT NULL,
    gambar VARCHAR(255),
    waktu_estimasi INT, -- dalam menit
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE
);

-- Tabel Rating
CREATE TABLE rating (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resep_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    UNIQUE KEY unique_rating (resep_id, user_id)
);

-- Tabel Komentar
CREATE TABLE komentar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resep_id INT,
    user_id INT,
    komentar TEXT NOT NULL,
    is_approved TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabel Favorit
CREATE TABLE favorit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    resep_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE,
    UNIQUE KEY unique_favorit (user_id, resep_id)
);

-- Tabel Menu Mingguan
CREATE TABLE menu_mingguan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    resep_id INT,
    tanggal DATE,
    waktu_makan ENUM('sarapan', 'makan_siang', 'makan_malam', 'snack'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE
);

-- Tabel Tag
CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Resep Tag (Many-to-Many)
CREATE TABLE resep_tag (
    resep_id INT,
    tag_id INT,
    PRIMARY KEY (resep_id, tag_id),
    FOREIGN KEY (resep_id) REFERENCES resep(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);

-- Insert data kategori contoh
INSERT INTO kategori (nama, deskripsi) VALUES 
('Makanan Utama', 'Hidangan utama untuk makan siang dan malam'),
('Makanan Pembuka', 'Hidangan pembuka atau appetizer'),
('Makanan Penutup', 'Dessert dan makanan manis'),
('Minuman', 'Berbagai jenis minuman segar'),
('Camilan', 'Snack dan makanan ringan'),
('Makanan Tradisional', 'Masakan tradisional Indonesia');

-- Insert data admin default
INSERT INTO users (username, email, password, nama_lengkap, role) VALUES 
('admin', 'admin@menumasakan.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin');
