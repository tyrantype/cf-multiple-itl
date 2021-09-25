-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2021 at 04:50 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `certainty_factor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama_lengkap`) VALUES
('superuser', '$2y$10$i/acvAwJT0QbmstOfuOm/.S5REbSZvdP5Wy2FWlFg5hkzLltZtyzy', 'Superuser');

-- --------------------------------------------------------

--
-- Table structure for table `basis_pakar`
--

CREATE TABLE `basis_pakar` (
  `id` varchar(5) NOT NULL,
  `indikator` varchar(200) NOT NULL,
  `id_tipe` varchar(5) NOT NULL,
  `mb` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basis_pakar`
--

INSERT INTO `basis_pakar` (`id`, `indikator`, `id_tipe`, `mb`) VALUES
('I0001', 'Saya suka membaca buku', 'T0002', 0.3),
('I0002', 'Suka menulis', 'T0002', 0.2),
('I0003', 'Suka bercerita / berbicara', 'T0002', 0.7),
('I0004', 'Suka membuat atau mengarang cerita', 'T0002', 0.3),
('I0005', 'Saya suka membahas ide-ide yang saya punya dengan teman', 'T0002', 0.9),
('I0006', 'Saya suka teka teki huruf', 'T0002', 0.3),
('I0007', 'Saya suka belajar Bahasa Indonesia atau Bahasa Asing', 'T0002', 0.2),
('I0008', 'Saya menyukai flora dan fauna', 'T0008', 0.6),
('I0009', 'Saya suka tentang alam', 'T0008', 0.7),
('I0010', 'Saya peduli dengan alam dan lingkungan sekitar', 'T0008', 0.7),
('I0011', 'Saya suka mengunjungi taman atau berjalan jalan di alam bebas', 'T0008', 0.9),
('I0012', 'Suka camping atau menjelajahi alam', 'T0008', 0.4),
('I0013', 'Suka mengumpulkan serangga, batu, daun atau koleksi alam lainnya di dalam botol / suatu wadah', 'T0008', 0.1),
('I0014', 'Saya menikmati ketika kegiatan memancing ikan', 'T0008', 0.1),
('I0015', 'Saya suka memikirkan masa depan dan tujuan-tujuan yang ingin dicapai', 'T0003', 0.9),
('I0016', 'Saya lebih senang di rumah dan menghabiskan waktu sendiri', 'T0003', 0.8),
('I0017', 'Saya lebih suka bekerja atau belajar sendiri daripada bersama teman', 'T0003', 0.7),
('I0018', 'Saya suka melamun atau berpikir tentang kehidupan dan diri saya', 'T0003', 0.3),
('I0019', 'Saya mengetahui kelebihan dan kekurangan diri saya', 'T0003', 0.9),
('I0020', 'Saya suka menulis catatan harian untuk menuangkan ide-ide, kenangan, perasaan, peristiwa yang terjadi, dll', 'T0003', 0.7),
('I0021', 'Saya suka berpikir atau mempertimbangkan sisi positif atau negatif ketika menemui masalah atau mengambil keputusan', 'T0003', 0.9),
('I0022', 'Saya suka pelajaran matematika', 'T0007', 0.3),
('I0023', 'Saya suka permainan yang menggunakan strategi atau mengasah otak, seperti catur, permainan misteri, teka-teki logika', 'T0007', 0.4),
('I0024', 'Saya suka menanyakan tentang bagaimana suatu benda bekerja', 'T0007', 0.7),
('I0025', 'Saya suka mengerjakan atau menyelesaikan perhitungan matematika dalam pikiran saya', 'T0007', 0.7),
('I0026', 'Saya suka mengatur berbagai hal dengan teratur, kategoris dan hieraekis (berurutan)', 'T0007', 0.7),
('I0027', 'Saya mudah mengingat berkaitan dengan angka atau statistik, seperti skor sepak bola, tinggi gedung tertinggi di dunia, dll', 'T0007', 0.5),
('I0028', 'Saya dapat berhitung dengan cepat', 'T0007', 0.3),
('I0029', 'Saya suka bergaul dan berkumpul dengan orang lain', 'T0004', 0.8),
('I0030', 'Saya mudah berteman dan berbicara dengan orang yang baru dikenal', 'T0004', 0.7),
('I0031', 'Saya lebih suka belajar bersama dengan teman dibanding belajar sendiri', 'T0004', 0.7),
('I0032', 'Saya suka menawarkan bantuan ketika orang lain membutuhkannya', 'T0004', 0.8),
('I0033', 'Saya mudah menebak perasaan teman hanya dengan melihat ekspresinya', 'T0004', 0.7),
('I0034', 'Saya tahu bagaimana cara membuat teman bersemangat', 'T0004', 0.6),
('I0035', 'Teman saya sering datang  untuk curhat, mencari dukungan emosi atau meminta saran', 'T0004', 0.6),
('I0036', 'Saya suka memainkan alat musik', 'T0006', 0.3),
('I0037', 'Saya senang bernyanyi', 'T0006', 0.7),
('I0038', 'Saya dapat mengingat melodi atau nada dari lagu', 'T0006', 0.2),
('I0039', 'Saya mudah mengenali banyak lagu yang berbeda beda', 'T0006', 0.4),
('I0040', 'Saya suka seperti bertepuk tangan, menjentikkan jari, menghentakkan kaki, memukul meja seperti drum, dll', 'T0006', 0.2),
('I0041', 'Saya sering bernyanyi ketika sedang melakukan aktifitas', 'T0006', 0.5),
('I0042', 'Saya suka mengarang atau menulis lagu', 'T0006', 0.2),
('I0043', 'Saya suka merangkai puzzle atau lego', 'T0005', 0.4),
('I0044', 'Saya suka aktifitas fotografi', 'T0005', 0.9),
('I0045', 'Saya suka menggambar atau melukis', 'T0005', 0.5),
('I0046', 'Saya suka belajar dengan mengamati orang sekitar mengerjakan sesuatu', 'T0005', 0.6),
('I0047', 'Saya lebih cepat memahami sesuatu dalam bentuk gambar, grafik atau ilustrasi', 'T0005', 0.7),
('I0048', 'Saya mudah mengenali atau mengingat tempat atau jalan, walaupun baru pertama kali mengunjunginya', 'T0005', 0.2),
('I0049', 'Saya lebih mudah mengingat wajahnya dibandingkan mengingat namanya', 'T0005', 0.5),
('I0050', 'Saya suka mata pelajaran olahraga', 'T0001', 0.6),
('I0051', 'Saya suka mengetukkan jari, memainkan alat tulis atau menggoyangkan kaki saat belajar atau berpikir', 'T0001', 0.7),
('I0052', 'Saya lebih suka bergerak ketika mempelajari sesuatu untuk lebih membantu saya mengingat', 'T0001', 0.7),
('I0053', 'Saya suka bermain sandiwara (acting) atau menari', 'T0001', 0.5),
('I0054', 'Saya suka melakukan aktivitas di alam terbuka atau diluar ruangan', 'T0001', 0.7),
('I0055', 'Saya lebih suka praktek langsung ketika mempelajari sesuatu', 'T0001', 0.7),
('I0056', 'Saya suka bergerak dan cepat bosan ketika disuruh duduk dalam waktu yang lama', 'T0001', 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` varchar(5) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `content`, `datetime`) VALUES
(4, 'U0001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2021-08-30 14:25:11'),
(5, 'U0003', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2021-08-31 14:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id` varchar(5) NOT NULL,
  `id_user` varchar(5) DEFAULT NULL,
  `id_tipe` varchar(5) DEFAULT NULL,
  `hasil_cf` float DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id`, `id_user`, `id_tipe`, `hasil_cf`, `tanggal`) VALUES
('R0002', 'U0001', 'T0004', 0.7, '2021-08-31 13:10:37'),
('R0003', 'U0001', 'T0001', 0.8, '2021-08-31 13:16:02'),
('R0005', 'U0003', 'T0003', 0.72, '2021-08-31 13:30:26'),
('R0008', 'U0003', 'T0007', 0.857, '2021-08-31 13:30:48'),
('R0009', 'U0001', 'T0002', 0.79, '2021-08-31 14:30:14'),
('R0010', 'U0001', 'T0001', 0.7, '2021-08-31 14:30:25'),
('R0011', 'U0002', 'T0004', 0.844, '2021-08-31 20:56:28'),
('R0012', 'U0003', 'T0002', 0.2, '2021-09-22 09:20:11'),
('R0013', 'U0001', 'T0007', 0.58, '2021-09-23 16:31:22'),
('R0014', 'U0001', 'T0007', 0.58, '2021-09-23 16:31:42'),
('R0015', 'U0001', 'T0006', 0.76, '2021-09-23 16:38:25'),
('R0016', 'U0001', 'T0007', 0.42, '2021-09-23 16:39:03'),
('R0017', 'U0001', 'T0008', 0.72, '2021-09-23 16:40:18'),
('R0018', 'U0001', 'T0008', 0.72, '2021-09-23 16:40:43'),
('R0019', 'U0001', 'T0003', 0.9, '2021-09-23 16:41:59'),
('R0020', 'U0001', 'T0003', 0.9, '2021-09-23 16:42:06'),
('R0021', 'U0001', 'T0006', 0.748, '2021-09-23 16:50:33'),
('R0022', 'U0001', 'T0006', 0.748, '2021-09-23 16:50:48'),
('R0023', 'U0001', 'T0004', 0.7, '2021-09-23 16:52:08'),
('R0024', 'U0003', 'T0003', 0.9, '2021-09-23 16:54:08'),
('R0025', 'U0003', 'T0003', 0.9, '2021-09-23 16:54:11'),
('R0026', 'U0003', 'T0007', 0.56, '2021-09-23 16:59:22'),
('R0027', 'U0003', 'T0003', 0.9, '2021-09-23 16:59:32'),
('R0028', 'U0001', 'T0004', 0.7, '2021-09-23 17:00:16'),
('R0029', 'U0003', 'T0006', 0.5, '2021-09-23 17:03:47'),
('R0030', 'U0003', 'T0008', 0.9, '2021-09-23 17:07:27'),
('R0031', 'U0003', 'T0004', 0.42, '2021-09-23 17:12:33'),
('R0032', 'U0001', 'T0005', 0.85, '2021-09-25 20:23:51'),
('R0033', 'U0001', 'T0001', 0.7, '2021-09-25 21:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_detail`
--

CREATE TABLE `hasil_detail` (
  `id_hasil` varchar(5) NOT NULL,
  `id_basis_pakar` varchar(5) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_detail`
--

INSERT INTO `hasil_detail` (`id_hasil`, `id_basis_pakar`, `nilai`) VALUES
('R0002', 'I0021', 0.6),
('R0002', 'I0033', 1),
('R0002', 'I0038', 0.8),
('R0002', 'I0041', 0.4),
('R0002', 'I0049', 0.2),
('R0003', 'I0005', 0.4),
('R0003', 'I0026', 1),
('R0003', 'I0028', 0.2),
('R0003', 'I0050', 1),
('R0003', 'I0053', 1),
('R0005', 'I0012', 0.2),
('R0005', 'I0021', 0.8),
('R0005', 'I0022', 1),
('R0005', 'I0023', 0.6),
('R0005', 'I0030', 0.8),
('R0008', 'I0012', 0.2),
('R0008', 'I0013', 1),
('R0008', 'I0019', 0.2),
('R0008', 'I0021', 0.8),
('R0008', 'I0022', 1),
('R0008', 'I0023', 0.8),
('R0008', 'I0024', 1),
('R0008', 'I0030', 0.8),
('R0008', 'I0052', 1),
('R0009', 'I0003', 1),
('R0009', 'I0006', 1),
('R0009', 'I0041', 1),
('R0010', 'I0014', 0.6),
('R0010', 'I0028', 0.8),
('R0010', 'I0051', 1),
('R0011', 'I0003', 0.2),
('R0011', 'I0031', 1),
('R0011', 'I0032', 0.6),
('R0011', 'I0038', 0.8),
('R0011', 'I0052', 1),
('R0012', 'I0007', 1),
('R0013', 'I0022', 1),
('R0013', 'I0023', 1),
('R0014', 'I0022', 1),
('R0014', 'I0023', 1),
('R0015', 'I0037', 1),
('R0015', 'I0040', 1),
('R0015', 'I0043', 0.8),
('R0016', 'I0004', 1),
('R0016', 'I0025', 0.6),
('R0017', 'I0011', 0.8),
('R0017', 'I0034', 1),
('R0018', 'I0011', 0.8),
('R0018', 'I0034', 1),
('R0019', 'I0015', 1),
('R0020', 'I0015', 1),
('R0020', 'I0023', 0.8),
('R0021', 'I0037', 1),
('R0021', 'I0038', 0.8),
('R0022', 'I0037', 1),
('R0022', 'I0038', 0.8),
('R0023', 'I0031', 1),
('R0023', 'I0051', 0.8),
('R0024', 'I0015', 1),
('R0024', 'I0055', 0.8),
('R0025', 'I0015', 1),
('R0025', 'I0055', 0.8),
('R0026', 'I0017', 0.8),
('R0026', 'I0024', 0.8),
('R0026', 'I0048', 1),
('R0027', 'I0015', 1),
('R0027', 'I0044', 0.8),
('R0028', 'I0017', 0.8),
('R0028', 'I0030', 1),
('R0029', 'I0013', 0.6),
('R0029', 'I0041', 1),
('R0029', 'I0049', 0.8),
('R0030', 'I0011', 1),
('R0031', 'I0024', 0.2),
('R0031', 'I0031', 0.6),
('R0031', 'I0042', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `interests_v2`
-- (See below for the actual view)
--
CREATE TABLE `interests_v2` (
`id` varchar(5)
,`name` varchar(200)
,`type_id` varchar(5)
,`mb` float
);

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE `pengaturan` (
  `id` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`id`, `nama_sekolah`, `alamat`) VALUES
(1, 'SDN Kwaron I', 'Jombang');

-- --------------------------------------------------------

--
-- Stand-in structure for view `results`
-- (See below for the actual view)
--
CREATE TABLE `results` (
`id` varchar(5)
,`user_id` varchar(5)
,`type_id` varchar(5)
,`cf_value` float
,`datetime` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `results_detail`
-- (See below for the actual view)
--
CREATE TABLE `results_detail` (
`result_id` varchar(5)
,`interest_id` varchar(5)
,`value` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `setting`
-- (See below for the actual view)
--
CREATE TABLE `setting` (
`id` int(11)
,`school_name` varchar(100)
,`address` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `superuser`
-- (See below for the actual view)
--
CREATE TABLE `superuser` (
`username` varchar(50)
,`password` varchar(200)
,`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_minat_bakat`
--

CREATE TABLE `tipe_minat_bakat` (
  `id` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `info` varchar(1000) NOT NULL,
  `saran` varchar(1000) DEFAULT NULL,
  `bidang_pekerjaan` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_minat_bakat`
--

INSERT INTO `tipe_minat_bakat` (`id`, `name`, `info`, `saran`, `bidang_pekerjaan`) VALUES
('T0001', 'Kinestetik', 'Kecerdasan Kinestetik merupakan salah satu jenis kecerdasan majemuk. Kecerdasan ini merupakan kemampuan seseorang untuk menggunakan seluruh tubuh atau fisiknya untuk mengekspresikan ide dan perasaan, serta keterampilan menggunakan tangan untuk mengubah atau menciptakan sesuatu.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Atlet Olahraga, Model, Aktor, Penari'),
('T0002', 'Linguistik', 'Kecerdasan Linguistik atau kecerdasan berbahasa adalah kemampuan seseorang untuk mengungkapkan pendapat atau pikirannya melalui bahasa verbal maupun non verbal secara jelas dan lugas dengan tatanan bahasa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Penulis, Wartawan'),
('T0003', 'Intra-personal', 'Kecerdasan Intrapersonal adalah kemampuan memahami diri sendiri dan bertindak berdasarkan pemahaman tersebut. Komponen inti dari Kecerdasan Intrapersonal kemampuan memahami diri yang akurat meliputi kekuatan dan keterbatasan diri, kecerdasan akan suasana hati, maksud, motivasi, temperamen dan keinginan, serta kemampuan berdisiplin diri, memahami dan menghargai diri', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Motivator, Pelatih'),
('T0004', 'Inter-personal', 'Komunikasi interpersonal adalah komunikasi yang terjadi antara dua orang atau lebih, yang biasanya tidak diatur secara formal. Dalam komunikasi interpersonal, setiap partisipan menggunakan semua elemen dari proses komunikasi.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Psikolog, Pengusaha'),
('T0005', 'Visual Spasial', 'Kecerdasan spasial - visual merupakan kemampuan seseorang untuk memahami, memproses dan berfikir ke dalam bentuk visual. Kecerdasan spasial - visual juga merupakan salah satu jenis kecerdasan majemuk. Seseorang yang memiliki kecerdasan ini mampu menerjemahkan gambaran dalam pikirannya sendiri ke dalam bentuk dua dimensi atau tiga dimensi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Desain Grafis, Arsitek, Pelukis'),
('T0006', 'Musikal', 'Kecerdasan musikal adalah kemampuan untuk menikmati, mengamati, membedakan, mengarang, membentuk, dan mengekspresikan bentuk-bentuk musik. Kecerdasan ini meliputi kepekaan terhadap ritme, melodi dan timbre dari musik yang didengar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Musisi Musik, Budayawan'),
('T0007', 'Matematika-Logika', 'Kecerdasan matematis logis ini adalah kemampuan untuk menangani bilangan dan perhitungan, pola berpikir logis dan ilmiah. Biasanya, kecerdasan ini dimiliki oleh para ilmuwan, filsuf, dan sebagainya', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Programmer, Guru Matematika, Teknisi'),
('T0008', 'Naturalis', 'Kecerdasan naturalis didefinisikan Howard Gardner sebagai kemampuan mengenali, melihat perbedaan, menggolongkan, dan mengkategorikan apa yang dilihat atau jumpai di alam atau di lingkungannya', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'Antropolog, Arkeolog, Meteorolog, Aktifis Alam');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_minat_bakat_gambar`
--

CREATE TABLE `tipe_minat_bakat_gambar` (
  `id` int(11) NOT NULL,
  `type_id` varchar(5) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_minat_bakat_gambar`
--

INSERT INTO `tipe_minat_bakat_gambar` (`id`, `type_id`, `file_name`) VALUES
(1, 'T0001', 'T0001-1.svg'),
(2, 'T0001', 'T0001-3.svg'),
(3, 'T0001', 'T0001-2.svg'),
(4, 'T0002', 'T0002-1.svg'),
(5, 'T0002', 'T0002-2.svg'),
(6, 'T0002', 'T0002-3.svg'),
(7, 'T0003', 'T0003-1.svg'),
(8, 'T0003', 'T0003-2.svg'),
(9, 'T0004', 'T0004-1.svg'),
(10, 'T0004', 'T0004-2.svg'),
(11, 'T0004', 'T0004-3.svg'),
(12, 'T0005', 'T0005-1.svg'),
(13, 'T0005', 'T0005-2.svg'),
(14, 'T0005', 'T0005-3.svg'),
(15, 'T0005', 'T0005-4.svg'),
(16, 'T0006', 'T0006-1.svg'),
(17, 'T0006', 'T0006-2.svg'),
(18, 'T0007', 'T0007-1.svg'),
(19, 'T0007', 'T0007-2.svg'),
(20, 'T0007', 'T0007-3.svg'),
(21, 'T0008', 'T0008-1.svg'),
(22, 'T0008', 'T0008-2.svg'),
(23, 'T0008', 'T0008-3.svg'),
(24, 'T0008', 'T0008-4.svg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `types`
-- (See below for the actual view)
--
CREATE TABLE `types` (
`id` varchar(5)
,`name` varchar(50)
,`detail` varchar(1000)
,`advice` varchar(1000)
,`fields` varchar(1000)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `types_pictures`
-- (See below for the actual view)
--
CREATE TABLE `types_pictures` (
`id` int(11)
,`type_id` varchar(5)
,`file_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT current_timestamp(),
  `alamat` varchar(100) DEFAULT NULL,
  `hak_akses` enum('User','Admin') NOT NULL DEFAULT 'User',
  `id_avatar` int(11) NOT NULL DEFAULT 1,
  `terakhir_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `hak_akses`, `id_avatar`, `terakhir_login`) VALUES
('U0001', '123', '$2y$10$o/K/1WJlDFvZL8iufI6pXOaDqb/zLugFJFBl5nZvTzmL.RG0qrcbS', 'Yusuf Effendi', 'Laki-Laki', '2010-01-01', 'Diwek', 'Admin', 2, '2021-09-25 21:36:50'),
('U0002', '456', '$2y$10$cm2RBAGbLD4HMsKXA3KkD.YMhlvNDWjW5oSSX6hrPd72BL8i.oHdy', 'Aldi Kurniawan', 'Laki-Laki', '2021-08-31', 'Ngoro', 'User', 5, '2021-08-31 20:41:24'),
('U0003', '222', '$2y$10$yPEt1ZJZRCUe5KZS6kiIOeJ.r/IpR17NpVe3R9jx1MDYZlYhRXSny', 'Bunga', 'Perempuan', '2021-08-31', 'Jombang', 'User', 3, '2021-09-25 20:13:38');

-- --------------------------------------------------------

--
-- Stand-in structure for view `users`
-- (See below for the actual view)
--
CREATE TABLE `users` (
`id` varchar(5)
,`username` varchar(50)
,`password` varchar(100)
,`full_name` varchar(100)
,`gender` enum('Laki-Laki','Perempuan')
,`date_of_birth` date
,`address` varchar(100)
,`privilege` enum('User','Admin')
,`avatar_id` int(11)
,`last_login` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `interests_v2`
--
DROP TABLE IF EXISTS `interests_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `interests_v2`  AS SELECT `basis_pakar`.`id` AS `id`, `basis_pakar`.`indikator` AS `name`, `basis_pakar`.`id_tipe` AS `type_id`, `basis_pakar`.`mb` AS `mb` FROM `basis_pakar` ;

-- --------------------------------------------------------

--
-- Structure for view `results`
--
DROP TABLE IF EXISTS `results`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `results`  AS SELECT `hasil`.`id` AS `id`, `hasil`.`id_user` AS `user_id`, `hasil`.`id_tipe` AS `type_id`, `hasil`.`hasil_cf` AS `cf_value`, `hasil`.`tanggal` AS `datetime` FROM `hasil` ;

-- --------------------------------------------------------

--
-- Structure for view `results_detail`
--
DROP TABLE IF EXISTS `results_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `results_detail`  AS SELECT `hasil_detail`.`id_hasil` AS `result_id`, `hasil_detail`.`id_basis_pakar` AS `interest_id`, `hasil_detail`.`nilai` AS `value` FROM `hasil_detail` ;

-- --------------------------------------------------------

--
-- Structure for view `setting`
--
DROP TABLE IF EXISTS `setting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `setting`  AS SELECT `pengaturan`.`id` AS `id`, `pengaturan`.`nama_sekolah` AS `school_name`, `pengaturan`.`alamat` AS `address` FROM `pengaturan` WHERE 1 ;

-- --------------------------------------------------------

--
-- Structure for view `superuser`
--
DROP TABLE IF EXISTS `superuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `superuser`  AS SELECT `admin`.`username` AS `username`, `admin`.`password` AS `password`, `admin`.`nama_lengkap` AS `name` FROM `admin` ;

-- --------------------------------------------------------

--
-- Structure for view `types`
--
DROP TABLE IF EXISTS `types`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `types`  AS SELECT `tipe_minat_bakat`.`id` AS `id`, `tipe_minat_bakat`.`name` AS `name`, `tipe_minat_bakat`.`info` AS `detail`, `tipe_minat_bakat`.`saran` AS `advice`, `tipe_minat_bakat`.`bidang_pekerjaan` AS `fields` FROM `tipe_minat_bakat` ;

-- --------------------------------------------------------

--
-- Structure for view `types_pictures`
--
DROP TABLE IF EXISTS `types_pictures`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `types_pictures`  AS SELECT `tipe_minat_bakat_gambar`.`id` AS `id`, `tipe_minat_bakat_gambar`.`type_id` AS `type_id`, `tipe_minat_bakat_gambar`.`file_name` AS `file_name` FROM `tipe_minat_bakat_gambar` ;

-- --------------------------------------------------------

--
-- Structure for view `users`
--
DROP TABLE IF EXISTS `users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users`  AS SELECT `user`.`id` AS `id`, `user`.`username` AS `username`, `user`.`password` AS `password`, `user`.`nama_lengkap` AS `full_name`, `user`.`jenis_kelamin` AS `gender`, `user`.`tanggal_lahir` AS `date_of_birth`, `user`.`alamat` AS `address`, `user`.`hak_akses` AS `privilege`, `user`.`id_avatar` AS `avatar_id`, `user`.`terakhir_login` AS `last_login` FROM `user` WHERE 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `basis_pakar`
--
ALTER TABLE `basis_pakar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_ibfk_1` (`user_id`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`id_user`),
  ADD KEY `type_id` (`id_tipe`);

--
-- Indexes for table `hasil_detail`
--
ALTER TABLE `hasil_detail`
  ADD PRIMARY KEY (`id_hasil`,`id_basis_pakar`),
  ADD KEY `interests_id` (`id_basis_pakar`);

--
-- Indexes for table `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_minat_bakat`
--
ALTER TABLE `tipe_minat_bakat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_minat_bakat` (`id`);

--
-- Constraints for table `hasil_detail`
--
ALTER TABLE `hasil_detail`
  ADD CONSTRAINT `hasil_detail_ibfk_2` FOREIGN KEY (`id_basis_pakar`) REFERENCES `basis_pakar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_detail_ibfk_3` FOREIGN KEY (`id_hasil`) REFERENCES `hasil` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  ADD CONSTRAINT `tipe_minat_bakat_gambar_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tipe_minat_bakat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
