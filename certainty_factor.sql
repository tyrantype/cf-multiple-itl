-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2022 at 06:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

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
  `id_basis_pakar` varchar(5) NOT NULL,
  `indikator` varchar(200) NOT NULL,
  `id_tipe` varchar(5) NOT NULL,
  `mb` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basis_pakar`
--

INSERT INTO `basis_pakar` (`id_basis_pakar`, `indikator`, `id_tipe`, `mb`) VALUES
('I0001', 'Saya suka membaca buku', 'T0002', 0.3),
('I0002', 'Suka menulis', 'T0002', 0.2),
('I0003', 'Suka bercerita / berbicara', 'T0002', 0.7),
('I0004', 'Suka membuat atau mengarang cerita', 'T0002', 0.5),
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
('I0022', 'Saya suka pelajaran matematika', 'T0007', 0.5),
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
('I0049', 'Saya lebih mudah mengingat wajah dibandingkan mengingat nama', 'T0005', 0.5),
('I0050', 'Saya suka mata pelajaran olahraga', 'T0001', 0.6),
('I0051', 'Saya suka mengetukkan jari, memainkan alat tulis atau menggoyangkan kaki saat belajar atau berpikir', 'T0001', 0.7),
('I0052', 'Saya lebih suka bergerak ketika mempelajari sesuatu untuk lebih membantu saya mengingat', 'T0001', 0.7),
('I0053', 'Saya suka bermain sandiwara (acting) atau menari', 'T0001', 0.5),
('I0054', 'Saya suka melakukan aktivitas di alam terbuka atau diluar ruangan', 'T0001', 0.7),
('I0055', 'Saya lebih suka praktek langsung ketika mempelajari sesuatu', 'T0001', 0.7),
('I0056', 'Saya suka bergerak dan cepat bosan ketika duduk dalam waktu yang lama', 'T0001', 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `isi_feedback` varchar(1000) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `id_user`, `isi_feedback`, `tanggal`) VALUES
(4, 'U0001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2021-08-30 14:25:11'),
(5, 'U0003', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2021-08-31 14:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` varchar(5) NOT NULL,
  `id_user` varchar(5) DEFAULT NULL,
  `id_tipe` varchar(5) DEFAULT NULL,
  `hasil_cf` float DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_user`, `id_tipe`, `hasil_cf`, `tanggal`) VALUES
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
('R0027', 'U0003', 'T0003', 0.9, '2021-09-23 16:59:32'),
('R0028', 'U0001', 'T0004', 0.7, '2021-09-23 17:00:16'),
('R0029', 'U0003', 'T0006', 0.5, '2021-09-23 17:03:47'),
('R0030', 'U0003', 'T0008', 0.9, '2021-09-23 17:07:27'),
('R0031', 'U0003', 'T0004', 0.42, '2021-09-23 17:12:33'),
('R0032', 'U0003', 'T0003', 0.3, '2021-09-26 00:37:29'),
('R0033', 'U0003', 'T0006', 0.2, '2021-09-26 00:37:55'),
('R0034', 'U0003', 'T0002', 0.9, '2021-09-26 00:38:08'),
('R0035', 'U0003', 'T0004', 0.6, '2021-09-26 00:38:42'),
('R0036', 'U0003', 'T0007', 0.7, '2021-09-26 00:41:51'),
('R0037', 'U0001', 'T0004', 0.999, '2021-11-13 11:28:20'),
('R0038', 'U0004', 'T0003', 1, '2021-12-15 09:40:49'),
('R0039', 'U0004', 'T0005', 0.992, '2021-12-15 09:47:37'),
('R0040', 'U0004', 'T0004', 0.991, '2021-12-15 10:27:52'),
('R0041', 'U0004', 'T0008', 0.806, '2021-12-15 10:28:53'),
('R0042', 'U0004', 'T0003', 0.993, '2021-12-15 11:01:23'),
('R0043', 'U0001', 'T0007', 0.991, '2021-12-16 00:37:29'),
('R0044', 'U0001', 'T0003', 0.988, '2021-12-20 14:26:40'),
('R0045', 'U0001', 'T0008', 0.988, '2021-12-22 04:15:12'),
('R0046', 'U0001', 'T0004', 1, '2021-12-22 05:02:37'),
('R0047', 'U0001', 'T0002', 0.954, '2021-12-22 05:43:08'),
('R0048', 'U0001', 'T0008', 0.559, '2021-12-26 13:35:51'),
('R0049', 'U0001', 'T0007', 0.5, '2021-12-26 13:59:14'),
('R0050', 'U0003', 'T0004', 0.957, '2021-12-26 14:11:03'),
('R0051', 'U0003', 'T0005', 0.998, '2021-12-31 18:48:59');

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
('R0031', 'I0042', 1),
('R0032', 'I0018', 1),
('R0033', 'I0042', 1),
('R0034', 'I0005', 1),
('R0035', 'I0034', 1),
('R0036', 'I0026', 1),
('R0037', 'I0001', 0.8),
('R0037', 'I0002', 0.6),
('R0037', 'I0003', 0.8),
('R0037', 'I0004', 1),
('R0037', 'I0005', 1),
('R0037', 'I0006', 0.8),
('R0037', 'I0007', 0.6),
('R0037', 'I0008', 0.4),
('R0037', 'I0009', 0.8),
('R0037', 'I0010', 0.8),
('R0037', 'I0011', 0.8),
('R0037', 'I0012', 0.8),
('R0037', 'I0013', 1),
('R0037', 'I0014', 1),
('R0037', 'I0015', 0.6),
('R0037', 'I0016', 0.8),
('R0037', 'I0017', 0.8),
('R0037', 'I0018', 1),
('R0037', 'I0019', 0.6),
('R0037', 'I0020', 0.8),
('R0037', 'I0021', 0.8),
('R0037', 'I0022', 0.6),
('R0037', 'I0023', 0.8),
('R0037', 'I0024', 0.8),
('R0037', 'I0025', 1),
('R0037', 'I0026', 1),
('R0037', 'I0027', 0.6),
('R0037', 'I0028', 1),
('R0037', 'I0029', 0.6),
('R0037', 'I0030', 0.8),
('R0037', 'I0031', 1),
('R0037', 'I0032', 1),
('R0037', 'I0033', 1),
('R0037', 'I0034', 0.8),
('R0037', 'I0035', 0.8),
('R0037', 'I0036', 0.6),
('R0037', 'I0037', 0.8),
('R0037', 'I0038', 0.6),
('R0037', 'I0039', 0.8),
('R0037', 'I0040', 0.8),
('R0037', 'I0041', 0.6),
('R0037', 'I0042', 1),
('R0037', 'I0043', 1),
('R0037', 'I0044', 0.8),
('R0037', 'I0045', 1),
('R0037', 'I0046', 0.8),
('R0037', 'I0047', 0.8),
('R0037', 'I0048', 0.8),
('R0037', 'I0049', 0.8),
('R0037', 'I0050', 0.6),
('R0037', 'I0051', 0.8),
('R0037', 'I0052', 0.8),
('R0037', 'I0053', 0.6),
('R0037', 'I0054', 0.8),
('R0037', 'I0055', 0.8),
('R0037', 'I0056', 1),
('R0038', 'I0001', 0.2),
('R0038', 'I0002', 0.4),
('R0038', 'I0003', 0.2),
('R0038', 'I0004', 0.2),
('R0038', 'I0005', 0.6),
('R0038', 'I0006', 0.6),
('R0038', 'I0007', 0.6),
('R0038', 'I0008', 0.6),
('R0038', 'I0009', 0.6),
('R0038', 'I0010', 0.6),
('R0038', 'I0011', 0.8),
('R0038', 'I0012', 0.6),
('R0038', 'I0013', 0.4),
('R0038', 'I0014', 0.2),
('R0038', 'I0015', 1),
('R0038', 'I0016', 1),
('R0038', 'I0017', 1),
('R0038', 'I0018', 1),
('R0038', 'I0019', 1),
('R0038', 'I0020', 0.4),
('R0038', 'I0021', 1),
('R0038', 'I0022', 0.2),
('R0038', 'I0023', 1),
('R0038', 'I0024', 1),
('R0038', 'I0025', 0.8),
('R0038', 'I0026', 1),
('R0038', 'I0027', 0.6),
('R0038', 'I0028', 0.2),
('R0038', 'I0029', 0.2),
('R0038', 'I0030', 0.2),
('R0038', 'I0031', 0.2),
('R0038', 'I0032', 0.8),
('R0038', 'I0033', 0.4),
('R0038', 'I0034', 1),
('R0038', 'I0035', 1),
('R0038', 'I0036', 0.2),
('R0038', 'I0037', 0.4),
('R0038', 'I0038', 0.6),
('R0038', 'I0039', 1),
('R0038', 'I0040', 1),
('R0038', 'I0041', 0.6),
('R0038', 'I0042', 0.2),
('R0038', 'I0043', 0.6),
('R0038', 'I0044', 1),
('R0038', 'I0045', 1),
('R0038', 'I0046', 0.4),
('R0038', 'I0047', 1),
('R0038', 'I0048', 1),
('R0038', 'I0049', 1),
('R0038', 'I0050', 0.6),
('R0038', 'I0051', 1),
('R0038', 'I0052', 1),
('R0038', 'I0053', 0.2),
('R0038', 'I0054', 0.8),
('R0038', 'I0055', 1),
('R0038', 'I0056', 1),
('R0039', 'I0001', 0.4),
('R0039', 'I0002', 0.4),
('R0039', 'I0003', 1),
('R0039', 'I0004', 0.2),
('R0039', 'I0005', 0.2),
('R0039', 'I0006', 1),
('R0039', 'I0007', 0.2),
('R0039', 'I0008', 0.2),
('R0039', 'I0009', 0.4),
('R0039', 'I0010', 0.6),
('R0039', 'I0011', 0.2),
('R0039', 'I0012', 1),
('R0039', 'I0013', 1),
('R0039', 'I0014', 1),
('R0039', 'I0015', 0.4),
('R0039', 'I0016', 1),
('R0039', 'I0017', 0.4),
('R0039', 'I0018', 1),
('R0039', 'I0019', 0.2),
('R0039', 'I0020', 0.2),
('R0039', 'I0021', 0.2),
('R0039', 'I0022', 0.2),
('R0039', 'I0023', 0.2),
('R0039', 'I0024', 0.2),
('R0039', 'I0025', 0.4),
('R0039', 'I0026', 1),
('R0039', 'I0027', 0.2),
('R0039', 'I0028', 0.8),
('R0039', 'I0029', 0.8),
('R0039', 'I0030', 0.2),
('R0039', 'I0031', 1),
('R0039', 'I0032', 0.2),
('R0039', 'I0033', 0.2),
('R0039', 'I0034', 1),
('R0039', 'I0035', 0.4),
('R0039', 'I0036', 0.2),
('R0039', 'I0037', 1),
('R0039', 'I0038', 1),
('R0039', 'I0039', 0.4),
('R0039', 'I0040', 0.2),
('R0039', 'I0041', 1),
('R0039', 'I0042', 0.8),
('R0039', 'I0043', 0.2),
('R0039', 'I0044', 1),
('R0039', 'I0045', 1),
('R0039', 'I0046', 1),
('R0039', 'I0047', 0.6),
('R0039', 'I0048', 0.8),
('R0039', 'I0049', 0.2),
('R0039', 'I0050', 0.4),
('R0039', 'I0051', 0.2),
('R0039', 'I0052', 0.2),
('R0039', 'I0053', 0.8),
('R0039', 'I0054', 0.4),
('R0039', 'I0055', 0.2),
('R0039', 'I0056', 0.4),
('R0040', 'I0001', 0.2),
('R0040', 'I0002', 0.2),
('R0040', 'I0003', 1),
('R0040', 'I0004', 0.2),
('R0040', 'I0005', 0.2),
('R0040', 'I0006', 0.2),
('R0040', 'I0007', 0.2),
('R0040', 'I0008', 0.4),
('R0040', 'I0009', 0.4),
('R0040', 'I0010', 0.2),
('R0040', 'I0011', 0.2),
('R0040', 'I0012', 0.4),
('R0040', 'I0013', 0.2),
('R0040', 'I0014', 0.2),
('R0040', 'I0015', 0.8),
('R0040', 'I0016', 0.4),
('R0040', 'I0017', 0.8),
('R0040', 'I0018', 0.6),
('R0040', 'I0019', 0.2),
('R0040', 'I0020', 0.8),
('R0040', 'I0021', 0.2),
('R0040', 'I0022', 0.2),
('R0040', 'I0023', 1),
('R0040', 'I0024', 0.4),
('R0040', 'I0025', 0.2),
('R0040', 'I0026', 0.2),
('R0040', 'I0027', 0.4),
('R0040', 'I0028', 0.4),
('R0040', 'I0029', 1),
('R0040', 'I0030', 0.8),
('R0040', 'I0031', 1),
('R0040', 'I0032', 0.6),
('R0040', 'I0033', 0.2),
('R0040', 'I0034', 0.2),
('R0040', 'I0035', 0.2),
('R0040', 'I0036', 0.8),
('R0040', 'I0037', 0.6),
('R0040', 'I0038', 0.6),
('R0040', 'I0039', 0.6),
('R0040', 'I0040', 1),
('R0040', 'I0041', 1),
('R0040', 'I0042', 0.2),
('R0040', 'I0043', 0.6),
('R0040', 'I0044', 0.2),
('R0040', 'I0045', 0.2),
('R0040', 'I0046', 0.2),
('R0040', 'I0047', 0.2),
('R0040', 'I0048', 0.6),
('R0040', 'I0049', 0.2),
('R0040', 'I0050', 1),
('R0040', 'I0051', 0.2),
('R0040', 'I0052', 0.8),
('R0040', 'I0053', 0.8),
('R0040', 'I0054', 0.2),
('R0040', 'I0055', 1),
('R0040', 'I0056', 1),
('R0041', 'I0005', 0.4),
('R0041', 'I0009', 0.8),
('R0041', 'I0010', 0.8),
('R0041', 'I0018', 0.2),
('R0041', 'I0027', 0.6),
('R0041', 'I0044', 0.6),
('R0041', 'I0053', 1),
('R0042', 'I0001', 0.2),
('R0042', 'I0002', 0.2),
('R0042', 'I0003', 0.4),
('R0042', 'I0004', 0.2),
('R0042', 'I0005', 0.6),
('R0042', 'I0006', 0.2),
('R0042', 'I0007', 0.2),
('R0042', 'I0008', 0.4),
('R0042', 'I0009', 0.2),
('R0042', 'I0010', 0.4),
('R0042', 'I0011', 0.4),
('R0042', 'I0012', 0.4),
('R0042', 'I0013', 0.2),
('R0042', 'I0014', 0.2),
('R0042', 'I0015', 0.6),
('R0042', 'I0016', 1),
('R0042', 'I0017', 1),
('R0042', 'I0018', 1),
('R0042', 'I0019', 0.4),
('R0042', 'I0020', 0.2),
('R0042', 'I0021', 0.4),
('R0042', 'I0022', 0.2),
('R0042', 'I0023', 0.8),
('R0042', 'I0024', 0.4),
('R0042', 'I0025', 0.2),
('R0042', 'I0026', 0.6),
('R0042', 'I0027', 0.6),
('R0042', 'I0028', 0.2),
('R0042', 'I0029', 0.4),
('R0042', 'I0030', 0.2),
('R0042', 'I0031', 0.6),
('R0042', 'I0032', 0.8),
('R0042', 'I0033', 0.2),
('R0042', 'I0034', 0.2),
('R0042', 'I0035', 0.4),
('R0042', 'I0036', 0.2),
('R0042', 'I0037', 0.2),
('R0042', 'I0038', 0.4),
('R0042', 'I0039', 0.4),
('R0042', 'I0040', 0.2),
('R0042', 'I0041', 0.2),
('R0042', 'I0042', 0.2),
('R0042', 'I0043', 0.8),
('R0042', 'I0044', 0.8),
('R0042', 'I0045', 0.8),
('R0042', 'I0046', 0.2),
('R0042', 'I0047', 1),
('R0042', 'I0048', 1),
('R0042', 'I0049', 1),
('R0042', 'I0050', 0.2),
('R0042', 'I0051', 0.2),
('R0042', 'I0052', 0.2),
('R0042', 'I0053', 0.6),
('R0042', 'I0054', 0.4),
('R0042', 'I0055', 0.8),
('R0042', 'I0056', 0.2),
('R0043', 'I0001', 0.8),
('R0043', 'I0002', 0),
('R0043', 'I0003', 0),
('R0043', 'I0004', 0),
('R0043', 'I0005', 0),
('R0043', 'I0006', 0.8),
('R0043', 'I0007', 0.4),
('R0043', 'I0008', 0.4),
('R0043', 'I0009', 0),
('R0043', 'I0010', 0.6),
('R0043', 'I0011', 0),
('R0043', 'I0012', 0.4),
('R0043', 'I0013', 0),
('R0043', 'I0014', 0),
('R0043', 'I0015', 0.4),
('R0043', 'I0016', 0.8),
('R0043', 'I0017', 1),
('R0043', 'I0018', 0.8),
('R0043', 'I0019', 0.6),
('R0043', 'I0020', 0.4),
('R0043', 'I0021', 0.4),
('R0043', 'I0022', 0.6),
('R0043', 'I0023', 0.8),
('R0043', 'I0024', 1),
('R0043', 'I0025', 0.8),
('R0043', 'I0026', 1),
('R0043', 'I0027', 0.8),
('R0043', 'I0028', 0.6),
('R0043', 'I0029', 0),
('R0043', 'I0030', 0),
('R0043', 'I0031', 0.4),
('R0043', 'I0032', 0),
('R0043', 'I0033', 0),
('R0043', 'I0034', 0.4),
('R0043', 'I0035', 0.6),
('R0043', 'I0036', 0),
('R0043', 'I0037', 0),
('R0043', 'I0038', 0),
('R0043', 'I0039', 0.4),
('R0043', 'I0040', 0),
('R0043', 'I0041', 0),
('R0043', 'I0042', 0),
('R0043', 'I0043', 0.8),
('R0043', 'I0044', 0.4),
('R0043', 'I0045', 0.4),
('R0043', 'I0046', 0),
('R0043', 'I0047', 1),
('R0043', 'I0048', 0),
('R0043', 'I0049', 1),
('R0043', 'I0050', 0),
('R0043', 'I0051', 0),
('R0043', 'I0052', 0),
('R0043', 'I0053', 0.6),
('R0043', 'I0054', 0),
('R0043', 'I0055', 0.6),
('R0043', 'I0056', 0),
('R0044', 'I0001', 0.8),
('R0044', 'I0002', 0),
('R0044', 'I0003', 1),
('R0044', 'I0004', 0.4),
('R0044', 'I0005', 0.8),
('R0044', 'I0006', 0),
('R0044', 'I0007', 1),
('R0044', 'I0008', 0),
('R0044', 'I0009', 0.4),
('R0044', 'I0010', 0),
('R0044', 'I0011', 0.4),
('R0044', 'I0012', 0),
('R0044', 'I0013', 0.6),
('R0044', 'I0014', 1),
('R0044', 'I0015', 0),
('R0044', 'I0017', 0),
('R0044', 'I0018', 0.4),
('R0044', 'I0019', 0.6),
('R0044', 'I0020', 1),
('R0044', 'I0021', 1),
('R0044', 'I0022', 0.4),
('R0044', 'I0023', 0),
('R0044', 'I0024', 0.4),
('R0044', 'I0025', 0.8),
('R0044', 'I0026', 0),
('R0044', 'I0027', 0),
('R0044', 'I0028', 0),
('R0044', 'I0029', 0.8),
('R0044', 'I0030', 0),
('R0044', 'I0031', 0),
('R0044', 'I0032', 1),
('R0044', 'I0033', 0.6),
('R0044', 'I0034', 0.6),
('R0044', 'I0035', 0.4),
('R0044', 'I0036', 0.6),
('R0044', 'I0037', 0.8),
('R0044', 'I0038', 0),
('R0044', 'I0039', 0),
('R0044', 'I0040', 1),
('R0044', 'I0041', 0.4),
('R0044', 'I0042', 0.4),
('R0044', 'I0043', 0.4),
('R0044', 'I0044', 0),
('R0044', 'I0045', 0.8),
('R0044', 'I0046', 1),
('R0044', 'I0047', 0),
('R0044', 'I0048', 0.4),
('R0044', 'I0049', 0.6),
('R0044', 'I0050', 0.4),
('R0044', 'I0051', 0),
('R0044', 'I0052', 0.8),
('R0044', 'I0053', 1),
('R0044', 'I0054', 1),
('R0044', 'I0055', 0.6),
('R0044', 'I0056', 1),
('R0045', 'I0001', 0.4),
('R0045', 'I0002', 0),
('R0045', 'I0003', 0),
('R0045', 'I0004', 0),
('R0045', 'I0005', 0),
('R0045', 'I0006', 0.8),
('R0045', 'I0007', 1),
('R0045', 'I0008', 1),
('R0045', 'I0009', 1),
('R0045', 'I0010', 1),
('R0045', 'I0011', 0.4),
('R0045', 'I0012', 1),
('R0045', 'I0013', 1),
('R0045', 'I0014', 1),
('R0045', 'I0015', 0),
('R0045', 'I0016', 0),
('R0045', 'I0017', 0),
('R0045', 'I0018', 0),
('R0045', 'I0019', 0),
('R0045', 'I0020', 0),
('R0045', 'I0021', 0),
('R0045', 'I0022', 1),
('R0045', 'I0023', 1),
('R0045', 'I0024', 0.8),
('R0045', 'I0025', 0),
('R0045', 'I0026', 0.4),
('R0045', 'I0027', 0.6),
('R0045', 'I0028', 1),
('R0045', 'I0029', 0.4),
('R0045', 'I0030', 0),
('R0045', 'I0031', 0.4),
('R0045', 'I0032', 0.4),
('R0045', 'I0033', 0),
('R0045', 'I0034', 0),
('R0045', 'I0035', 0.4),
('R0045', 'I0036', 0),
('R0045', 'I0037', 0.4),
('R0045', 'I0038', 0),
('R0045', 'I0039', 0.4),
('R0045', 'I0040', 0),
('R0045', 'I0041', 0),
('R0045', 'I0042', 0.6),
('R0045', 'I0043', 0.6),
('R0045', 'I0044', 0.8),
('R0045', 'I0045', 1),
('R0045', 'I0046', 1),
('R0045', 'I0047', 0.6),
('R0045', 'I0048', 0),
('R0045', 'I0049', 0.8),
('R0045', 'I0050', 0),
('R0045', 'I0051', 0),
('R0045', 'I0052', 1),
('R0045', 'I0053', 0),
('R0045', 'I0054', 1),
('R0045', 'I0055', 0),
('R0045', 'I0056', 0),
('R0046', 'I0001', 1),
('R0046', 'I0002', 1),
('R0046', 'I0003', 1),
('R0046', 'I0004', 1),
('R0046', 'I0005', 1),
('R0046', 'I0006', 1),
('R0046', 'I0007', 1),
('R0046', 'I0008', 1),
('R0046', 'I0009', 0.4),
('R0046', 'I0010', 0.6),
('R0046', 'I0011', 0.4),
('R0046', 'I0012', 0.4),
('R0046', 'I0013', 0),
('R0046', 'I0014', 0),
('R0046', 'I0015', 0.4),
('R0046', 'I0016', 0.4),
('R0046', 'I0017', 0.4),
('R0046', 'I0018', 0.4),
('R0046', 'I0019', 0),
('R0046', 'I0020', 1),
('R0046', 'I0021', 0),
('R0046', 'I0022', 0.4),
('R0046', 'I0023', 0.8),
('R0046', 'I0024', 0.8),
('R0046', 'I0025', 0),
('R0046', 'I0026', 0),
('R0046', 'I0027', 1),
('R0046', 'I0028', 0.4),
('R0046', 'I0029', 1),
('R0046', 'I0030', 1),
('R0046', 'I0031', 0.8),
('R0046', 'I0032', 1),
('R0046', 'I0033', 1),
('R0046', 'I0034', 1),
('R0046', 'I0035', 0.8),
('R0046', 'I0036', 0),
('R0046', 'I0037', 0.4),
('R0046', 'I0038', 0.4),
('R0046', 'I0039', 0.4),
('R0046', 'I0040', 0),
('R0046', 'I0041', 0.4),
('R0046', 'I0042', 1),
('R0046', 'I0043', 0.4),
('R0046', 'I0044', 0),
('R0046', 'I0045', 0.4),
('R0046', 'I0046', 0.4),
('R0046', 'I0047', 1),
('R0046', 'I0048', 0.4),
('R0046', 'I0049', 0.4),
('R0046', 'I0050', 0),
('R0046', 'I0051', 0),
('R0046', 'I0052', 0),
('R0046', 'I0053', 0),
('R0046', 'I0054', 0.4),
('R0046', 'I0055', 0),
('R0046', 'I0056', 0),
('R0047', 'I0001', 1),
('R0047', 'I0002', 1),
('R0047', 'I0003', 1),
('R0047', 'I0004', 1),
('R0047', 'I0005', 0),
('R0047', 'I0006', 1),
('R0047', 'I0007', 1),
('R0047', 'I0008', 0.4),
('R0047', 'I0009', 0.4),
('R0047', 'I0010', 0.6),
('R0047', 'I0011', 0),
('R0047', 'I0012', 0.8),
('R0047', 'I0013', 0.8),
('R0047', 'I0014', 0.4),
('R0047', 'I0015', 0),
('R0047', 'I0016', 0),
('R0047', 'I0017', 0),
('R0047', 'I0018', 0),
('R0047', 'I0019', 0),
('R0047', 'I0020', 0.4),
('R0047', 'I0021', 0),
('R0047', 'I0022', 0),
('R0047', 'I0023', 0),
('R0047', 'I0024', 0),
('R0047', 'I0025', 0),
('R0047', 'I0026', 0),
('R0047', 'I0027', 0),
('R0047', 'I0028', 0),
('R0047', 'I0029', 0.4),
('R0047', 'I0030', 0),
('R0047', 'I0031', 0.4),
('R0047', 'I0032', 0),
('R0047', 'I0033', 0),
('R0047', 'I0034', 0),
('R0047', 'I0035', 0),
('R0047', 'I0036', 0),
('R0047', 'I0037', 0),
('R0047', 'I0038', 0),
('R0047', 'I0039', 0),
('R0047', 'I0040', 1),
('R0047', 'I0041', 0),
('R0047', 'I0042', 0.4),
('R0047', 'I0043', 0),
('R0047', 'I0044', 0),
('R0047', 'I0045', 0.4),
('R0047', 'I0046', 0),
('R0047', 'I0047', 0.8),
('R0047', 'I0048', 0),
('R0047', 'I0049', 0.4),
('R0047', 'I0050', 0.8),
('R0047', 'I0051', 0),
('R0047', 'I0052', 0),
('R0047', 'I0053', 0),
('R0047', 'I0054', 0.6),
('R0047', 'I0055', 0),
('R0047', 'I0056', 0),
('R0048', 'I0010', 0.6),
('R0048', 'I0012', 0.6),
('R0048', 'I0022', 0),
('R0048', 'I0034', 0.8),
('R0048', 'I0040', 0.8),
('R0048', 'I0046', 0.8),
('R0048', 'I0055', 0.6),
('R0049', 'I0022', 1),
('R0050', 'I0025', 1),
('R0050', 'I0030', 0.6),
('R0050', 'I0032', 0.8),
('R0050', 'I0034', 1),
('R0050', 'I0035', 0.8),
('R0050', 'I0042', 0.8),
('R0050', 'I0056', 0.6),
('R0051', 'I0001', 0.8),
('R0051', 'I0002', 0.6),
('R0051', 'I0003', 0.4),
('R0051', 'I0004', 0.4),
('R0051', 'I0005', 0.4),
('R0051', 'I0006', 0.8),
('R0051', 'I0007', 0),
('R0051', 'I0008', 1),
('R0051', 'I0009', 0.6),
('R0051', 'I0010', 0.8),
('R0051', 'I0011', 0.8),
('R0051', 'I0012', 0.8),
('R0051', 'I0013', 0.6),
('R0051', 'I0014', 0),
('R0051', 'I0015', 0),
('R0051', 'I0016', 1),
('R0051', 'I0017', 1),
('R0051', 'I0018', 0.4),
('R0051', 'I0019', 0.4),
('R0051', 'I0020', 0.4),
('R0051', 'I0022', 0.4),
('R0051', 'I0023', 0.6),
('R0051', 'I0024', 1),
('R0051', 'I0025', 0),
('R0051', 'I0026', 0.6),
('R0051', 'I0027', 1),
('R0051', 'I0028', 0.6),
('R0051', 'I0029', 0.4),
('R0051', 'I0030', 0.6),
('R0051', 'I0031', 0),
('R0051', 'I0032', 0.8),
('R0051', 'I0033', 0.4),
('R0051', 'I0034', 0.8),
('R0051', 'I0035', 0.4),
('R0051', 'I0036', 0),
('R0051', 'I0037', 0.4),
('R0051', 'I0038', 0.4),
('R0051', 'I0039', 0),
('R0051', 'I0040', 0),
('R0051', 'I0041', 0.4),
('R0051', 'I0042', 0),
('R0051', 'I0043', 0.8),
('R0051', 'I0044', 1),
('R0051', 'I0045', 0.8),
('R0051', 'I0046', 1),
('R0051', 'I0047', 1),
('R0051', 'I0048', 0.8),
('R0051', 'I0049', 1),
('R0051', 'I0050', 1),
('R0051', 'I0051', 0.4),
('R0051', 'I0052', 0.6),
('R0051', 'I0053', 0),
('R0051', 'I0054', 0.4),
('R0051', 'I0055', 0.8),
('R0051', 'I0056', 0.8);

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
  `id_pengaturan` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`id_pengaturan`, `nama_sekolah`, `alamat`) VALUES
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
-- Stand-in structure for view `results_details`
-- (See below for the actual view)
--
CREATE TABLE `results_details` (
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
  `id_tipe` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `info` varchar(1000) NOT NULL,
  `saran` varchar(1000) DEFAULT NULL,
  `bidang_pekerjaan` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_minat_bakat`
--

INSERT INTO `tipe_minat_bakat` (`id_tipe`, `name`, `info`, `saran`, `bidang_pekerjaan`) VALUES
('T0001', 'Kinestetik', 'Kecerdasan Kinestetik merupakan salah satu jenis kecerdasan majemuk. Kecerdasan ini merupakan kemampuan seseorang untuk menggunakan seluruh tubuh atau fisiknya untuk mengekspresikan ide dan perasaan, serta keterampilan menggunakan tangan untuk mengubah atau menciptakan sesuatu.', 'Memperbanyak latihan olahraga fisik, memperbanyak referensi film/aktor untuk menambah ilmu akting', 'Atlet Olahraga, Model, Aktor, Penari'),
('T0002', 'Linguistik', 'Kecerdasan Linguistik atau kecerdasan berbahasa adalah kemampuan seseorang untuk mengungkapkan pendapat atau pikirannya melalui bahasa verbal maupun non verbal secara jelas dan lugas dengan tatanan bahasa', 'Memperbanyak membaca buku referensi dan melatih pelafalan kata', 'Penulis, Wartawan'),
('T0003', 'Intra-personal', 'Kecerdasan Intrapersonal adalah kemampuan memahami diri sendiri dan bertindak berdasarkan pemahaman tersebut. Komponen inti dari Kecerdasan Intrapersonal kemampuan memahami diri yang akurat meliputi kekuatan dan keterbatasan diri, kecerdasan akan suasana hati, maksud, motivasi, temperamen dan keinginan, serta kemampuan berdisiplin diri, memahami dan menghargai diri', 'Mempelejari lebih banyak bidang kepelatihan atau memimpin yang sesuai dengan minat anak\nMemberikan atau menyediakan \ntempat yang nyaman untuk bermain sendiri, boneka, atau mainan untuk main peragaan. Mengajak dia berbicara tentang perasaanya dan menanyakan pendapat mereka tentang berbagai hal.', 'Motivator, Pelatih'),
('T0004', 'Inter-personal', 'Komunikasi interpersonal adalah kemampuan untuk memahami serta peka terhadap kondisi intensif, motivasi, watak, dan sifat orang lain, kepekaan akan ekspresi wajar,suara,serta isyarat orang lain.', 'Mengajak interakis seperti bermain\nbermain drama dengan kostum atau bermain dengan boneka, mengikutsertakan anak untuk bermain bersama di luar rumah atau sering mengajak dia datang ke acara \nkeluarga untuk bersosialisasi dengan sekitar.', 'Psikolog, Pengusaha'),
('T0005', 'Visual Spasial', 'Kecerdasan spasial - visual salah satu jenis kecerdasan majemuk yang merupakan kemampuan seseorang untuk memahami, memproses dan berfikir ke dalam bentuk visual. Seseorang yang memiliki kecerdasan ini mampu menerjemahkan gambaran dalam pikirannya sendiri ke dalam bentuk dua dimensi atau tiga dimensi', 'Memberikan perlengkapan buku gambar, perlengkapan untuk mewarnai seprti, cat air, atau mengajak berofoto dengan kamera hp. Dan seringlah melakukan kegiatan menggambar bersama', 'Desain Grafis, Arsitek, Pelukis'),
('T0006', 'Musikal', 'Kecerdasan musikal adalah kemampuan untuk menikmati, mengamati, membedakan, mengarang, membentuk, dan mengekspresikan bentuk-bentuk musik. Kecerdasan ini meliputi kepekaan terhadap ritme, melodi dan timbre dari musik yang didengar', 'Mengembangkan kemampuan musikalitas dengan cara mengikuti les musik', 'Musisi Musik, Budayawan'),
('T0007', 'Matematika-Logika', 'Kecerdasan matematis logis ini adalah kemampuan untuk menangani bilangan dan perhitungan, pola berpikir logis dan ilmiah. Biasanya, kecerdasan ini dimiliki oleh para ilmuwan, filsuf, dan sebagainya', 'Mengajak bermain catur, teka teki dan sebagainya atau merencanakan dan melakukan suatu eksperimen yang dilakukan bersama\n\nserta Mengembangkan kemampuan dengan cara mengikuti pelatihan pemrograman atau les matematika', 'Programmer, Guru Matematika, Teknisi'),
('T0008', 'Naturalis', 'Kecerdasan Naturalis didefinisikan Howard Gardner sebagai kemampuan mengenali, melihat perbedaan, menggolongkan, dan mengkategorikan apa yang dilihat atau jumpai di alam atau di lingkungannya', 'Memberikan mereka binatang peliharaan, akuarium, \nsediakan kebun dan tanaman, hingga alat teropong untuk melihat burung-burung atau mengajak dan temani sang anak untuk melakukan ekplorasi ke alam bebas (camping atau mendaki)', 'Antropolog, Arkeolog, Meteorolog, Aktifis Alam');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_minat_bakat_gambar`
--

CREATE TABLE `tipe_minat_bakat_gambar` (
  `id_gambar` int(11) NOT NULL,
  `id_tipe` varchar(5) NOT NULL,
  `nama_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_minat_bakat_gambar`
--

INSERT INTO `tipe_minat_bakat_gambar` (`id_gambar`, `id_tipe`, `nama_file`) VALUES
(52, 'T0001', 'T0001-52.svg'),
(53, 'T0001', 'T0001-53.svg'),
(54, 'T0001', 'T0001-54.svg'),
(55, 'T0002', 'T0002-55.svg'),
(56, 'T0002', 'T0002-56.svg'),
(57, 'T0002', 'T0002-57.svg'),
(60, 'T0004', 'T0004-60.svg'),
(61, 'T0004', 'T0004-61.svg'),
(62, 'T0004', 'T0004-62.svg'),
(63, 'T0003', 'T0003-63.svg'),
(64, 'T0003', 'T0003-64.svg'),
(65, 'T0005', 'T0005-65.svg'),
(66, 'T0005', 'T0005-66.svg'),
(67, 'T0005', 'T0005-67.svg'),
(68, 'T0005', 'T0005-68.svg'),
(69, 'T0006', 'T0006-69.svg'),
(70, 'T0006', 'T0006-70.svg'),
(74, 'T0007', 'T0007-74.svg'),
(75, 'T0007', 'T0007-75.svg'),
(76, 'T0007', 'T0007-76.svg'),
(77, 'T0008', 'T0008-77.svg'),
(78, 'T0008', 'T0008-78.svg'),
(79, 'T0008', 'T0008-79.svg'),
(80, 'T0008', 'T0008-80.svg');

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
  `id_user` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT current_timestamp(),
  `alamat` varchar(100) DEFAULT NULL,
  `hak_akses` enum('User','Admin') NOT NULL DEFAULT 'User',
  `id_avatar` int(11) NOT NULL DEFAULT 1,
  `terakhir_login` datetime DEFAULT NULL,
  `terverifikasi` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `hak_akses`, `id_avatar`, `terakhir_login`, `terverifikasi`) VALUES
('U0001', '123', '$2y$10$VGc95toSMcptJuSZTXB08.ZZEyPmGucVbsBxM1nyDv4efCg2Akx3O', 'Yusuf Effendi', 'Laki-Laki', '2010-01-01', 'Diwek', 'Admin', 2, '2022-01-02 22:48:27', 'Ya'),
('U0002', '456', '$2y$10$p/pGtFz4mY8cGotJwRvLtuKMsybyPOhXhZjnFaEOE4VftOBxMqQsa', 'Aldi Kurniawan', 'Laki-Laki', '2021-08-31', 'Ngoro', 'User', 5, '2021-08-31 20:41:24', 'Ya'),
('U0003', '222', '$2y$10$F1C/qXy8aX5FwRzGTCgVBOa8Pumwl5TogVc9OKGROD4EpZfIn7/Wu', 'Bunga', 'Perempuan', '2021-08-31', 'Jombang', 'User', 3, '2021-12-31 18:49:52', 'Ya'),
('U0004', '666', '$2y$10$jljvzrWjnxfPDxufQMpSb.Rov5PqC7Bo97pi1vNClLt8y6Il2wSQ.', 'Yusuf', 'Laki-Laki', '2001-02-04', 'a', 'User', 6, '2021-12-15 09:29:26', 'Ya'),
('U0005', 'sugiono', '$2y$10$YdOzb7sJUr9L0u/UtkcyMubZzAtckxdgQza0DRXZ2/JclMEzyL/iG', 'Sugiono', 'Laki-Laki', '2022-01-18', 'Jepang', 'User', 1, NULL, 'Ya'),
('U0007', 'sasuke', '$2y$10$9KgDUmY4L9buOm83fNy6A.q6Bg7UJCThA37.vDErDNvV63LipzWcC', 'sasuke', 'Laki-Laki', '2022-01-05', '1', 'User', 3, '2022-01-02 22:48:51', 'Ya');

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
,`terverifikasi` enum('Ya','Tidak')
);

-- --------------------------------------------------------

--
-- Structure for view `interests_v2`
--
DROP TABLE IF EXISTS `interests_v2`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `interests_v2`  AS  select `basis_pakar`.`id_basis_pakar` AS `id`,`basis_pakar`.`indikator` AS `name`,`basis_pakar`.`id_tipe` AS `type_id`,`basis_pakar`.`mb` AS `mb` from `basis_pakar` ;

-- --------------------------------------------------------

--
-- Structure for view `results`
--
DROP TABLE IF EXISTS `results`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `results`  AS  select `hasil`.`id_hasil` AS `id`,`hasil`.`id_user` AS `user_id`,`hasil`.`id_tipe` AS `type_id`,`hasil`.`hasil_cf` AS `cf_value`,`hasil`.`tanggal` AS `datetime` from `hasil` ;

-- --------------------------------------------------------

--
-- Structure for view `results_details`
--
DROP TABLE IF EXISTS `results_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `results_details`  AS  select `hasil_detail`.`id_hasil` AS `result_id`,`hasil_detail`.`id_basis_pakar` AS `interest_id`,`hasil_detail`.`nilai` AS `value` from `hasil_detail` ;

-- --------------------------------------------------------

--
-- Structure for view `setting`
--
DROP TABLE IF EXISTS `setting`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `setting`  AS  select `pengaturan`.`id_pengaturan` AS `id`,`pengaturan`.`nama_sekolah` AS `school_name`,`pengaturan`.`alamat` AS `address` from `pengaturan` where 1 ;

-- --------------------------------------------------------

--
-- Structure for view `superuser`
--
DROP TABLE IF EXISTS `superuser`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `superuser`  AS  select `admin`.`username` AS `username`,`admin`.`password` AS `password`,`admin`.`nama_lengkap` AS `name` from `admin` ;

-- --------------------------------------------------------

--
-- Structure for view `types`
--
DROP TABLE IF EXISTS `types`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `types`  AS  select `tipe_minat_bakat`.`id_tipe` AS `id`,`tipe_minat_bakat`.`name` AS `name`,`tipe_minat_bakat`.`info` AS `detail`,`tipe_minat_bakat`.`saran` AS `advice`,`tipe_minat_bakat`.`bidang_pekerjaan` AS `fields` from `tipe_minat_bakat` ;

-- --------------------------------------------------------

--
-- Structure for view `types_pictures`
--
DROP TABLE IF EXISTS `types_pictures`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `types_pictures`  AS  select `tipe_minat_bakat_gambar`.`id_gambar` AS `id`,`tipe_minat_bakat_gambar`.`id_tipe` AS `type_id`,`tipe_minat_bakat_gambar`.`nama_file` AS `file_name` from `tipe_minat_bakat_gambar` ;

-- --------------------------------------------------------

--
-- Structure for view `users`
--
DROP TABLE IF EXISTS `users`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `users`  AS  select `user`.`id_user` AS `id`,`user`.`username` AS `username`,`user`.`password` AS `password`,`user`.`nama_lengkap` AS `full_name`,`user`.`jenis_kelamin` AS `gender`,`user`.`tanggal_lahir` AS `date_of_birth`,`user`.`alamat` AS `address`,`user`.`hak_akses` AS `privilege`,`user`.`id_avatar` AS `avatar_id`,`user`.`terakhir_login` AS `last_login`,`user`.`terverifikasi` AS `terverifikasi` from `user` where 1 ;

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
  ADD PRIMARY KEY (`id_basis_pakar`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `feedback_ibfk_1` (`id_user`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
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
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indexes for table `tipe_minat_bakat`
--
ALTER TABLE `tipe_minat_bakat`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indexes for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `type_id` (`id_tipe`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `id_pengaturan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_minat_bakat` (`id_tipe`);

--
-- Constraints for table `hasil_detail`
--
ALTER TABLE `hasil_detail`
  ADD CONSTRAINT `hasil_detail_ibfk_2` FOREIGN KEY (`id_basis_pakar`) REFERENCES `basis_pakar` (`id_basis_pakar`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_detail_ibfk_3` FOREIGN KEY (`id_hasil`) REFERENCES `hasil` (`id_hasil`) ON DELETE CASCADE;

--
-- Constraints for table `tipe_minat_bakat_gambar`
--
ALTER TABLE `tipe_minat_bakat_gambar`
  ADD CONSTRAINT `tipe_minat_bakat_gambar_ibfk_1` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_minat_bakat` (`id_tipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
