-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 03:50 AM
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
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `username` varchar(5) NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `name`) VALUES
('I0001', 'Suka membaca buku'),
('I0002', 'Suka menulis'),
('I0003', 'Suka bercerita / berbicara'),
('I0004', 'Suka membuat atau mengarang cerita'),
('I0005', 'Saya suka membahas ide-ide yang saya punya dengan teman'),
('I0006', 'Saya suka teka teki huruf'),
('I0007', 'Saya suka belajar Bahasa Indonesia atau Bahasa Asing'),
('I0008', 'Saya menyukai flora dan fauna serta alam semesta'),
('I0009', 'Saya suka tentang alam'),
('I0010', 'Saya peduli dengan alam dan lingkungan sekitar'),
('I0011', 'Saya suka mengunjungi taman atau berjalan jalan di alam bebas'),
('I0012', 'Suka camping atau menjelajahi alam'),
('I0013', 'Suka mengumpulkan serangga, batu, daun atau koleksi alam lainnya di dalam botol / suatu wadah'),
('I0014', 'Saya menikmati ketika kegiatan memancing ikan'),
('I0015', 'Saya suka memikirkan masa depan dan tujuan-tujuan yang ingin dicapai'),
('I0016', 'Saya lebih senang di rumah dan menghabiskan waktu sendiri'),
('I0017', 'Saya lebih suka bekerja atau belajar sendiri daripada bersama teman'),
('I0018', 'Saya suka melamun atau berpikir tentang kehidupan dan diri saya'),
('I0019', 'Saya mengetahui kelebihan dan kekurangan diri saya'),
('I0020', 'Saya suka menulis catatan harian untuk menuangkan ide-ide, kenangan, perasaan, peristiwa yang terjadi, dll\r\n'),
('I0021', 'Saya suka berpikir atau mempertimbangkan sisi positif atau negatif ketika menemui masalah atau mengambil keputusan'),
('I0022', 'Saya suka pelajaran matematika'),
('I0023', 'Saya suka permainan yang menggunakan strategi atau mengasah otak, seperti catur, permainan misteri, teka-teki logika'),
('I0024', 'Saya suka menanyakan tentang bagaimana suatu benda bekerja'),
('I0025', 'Saya suka mengerjakan atau menyelesaikan perhitungan matematika dalam pikiran saya'),
('I0026', 'Saya suka mengatur berbagai hal dengan teratur, kategoris dan hieraekis (berurutan)'),
('I0027', 'Saya mudah mengingat berkaitan dengan angka atau statistik, seperti skor sepak bola, tinggi gedung tertinggi di dunia, dll'),
('I0028', 'Saya dapat berhitung dengan cepat'),
('I0029', 'Saya suka bergaul dan berkumpul dengan orang lain'),
('I0030', 'Saya mudah berteman dan berbicara dengan orang yang baru dikenal'),
('I0031', 'Saya lebih suka belajar bersama dengan teman dibanding belajar sendiri'),
('I0032', 'Saya suka menawarkan bantuan ketika orang lain membutuhkannya'),
('I0033', 'Saya mudah menebak perasaan teman hanya dengan melihat ekspresinya'),
('I0034', 'Saya tahu bagaimana cara membuat teman bersemangat'),
('I0035', 'Teman saya sering datang  untuk curhat, mencari dukungan emosi atau meminta saran'),
('I0036', 'Saya suka memainkan alat musik'),
('I0037', 'Saya senang bernyanyi'),
('I0038', 'Saya dapat mengingat melodi atau nada dari lagu'),
('I0039', 'Saya mudah mengenali banyak lagu yang berbeda beda'),
('I0040', 'Saya suka seperti bertepuk tangan, menjentikkan jari, menghentakkan kaki, memukul meja seperti drum, dll'),
('I0041', 'Saya sering bernyanyi ketika sedang melakukan aktifitas'),
('I0042', 'Saya suka mengarang atau menulis lagu'),
('I0043', 'Saya suka merangkai puzzle atau lego'),
('I0044', 'Saya suka aktifitas fotografi'),
('I0045', 'Saya suka menggambar atau melukis'),
('I0046', 'Saya suka belajar dengan mengamati orang sekitar mengerjakan sesuatu'),
('I0047', 'Saya lebih cepat memahami sesuatu dalam bentuk gambar, grafik atau ilustrasi'),
('I0048', 'Saya mudah mengenali atau mengingat tempat atau jalan, walaupun baru pertama kali mengunjunginya'),
('I0049', 'Saya lebih mudah mengingat wajahnya dibandingkan mengingat namanya'),
('I0050', 'Saya suka mata pelajaran olahraga'),
('I0051', 'Saya suka mengetukkan jari, memainkan alat tulis atau menggoyangkan kaki saat belajar atau berpikir'),
('I0052', 'Saya lebih suka bergerak ketika mempelajari sesuatu untuk lebih membantu saya mengingat'),
('I0053', 'Saya suka bermain sandiwara (acting) atau menari'),
('I0054', 'Saya suka melakukan aktivitas di alam terbuka atau diluar ruangan'),
('I0055', 'Saya lebih suka praktek langsung ketika mempelajari sesuatu'),
('I0056', 'Saya suka bergerak dan cepat bosan ketika disuruh duduk dalam waktu yang lama');

-- --------------------------------------------------------

--
-- Table structure for table `interests_v2`
--

CREATE TABLE `interests_v2` (
  `id` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type_id` varchar(5) NOT NULL,
  `mb` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interests_v2`
--

INSERT INTO `interests_v2` (`id`, `name`, `type_id`, `mb`) VALUES
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
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` varchar(5) NOT NULL,
  `user_id` varchar(5) DEFAULT NULL,
  `type_id` varchar(5) DEFAULT NULL,
  `cf_value` float DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `results_details`
--

CREATE TABLE `results_details` (
  `result_id` varchar(5) NOT NULL,
  `interest_id` varchar(5) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` varchar(10) NOT NULL,
  `type_id` varchar(5) NOT NULL,
  `interest_id` varchar(5) NOT NULL,
  `mb` float NOT NULL,
  `md` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `type_id`, `interest_id`, `mb`, `md`) VALUES
('RL0001', 'T0001', 'I0050', 0.6, NULL),
('RL0002', 'T0001', 'I0051', 0.4, NULL),
('RL0003', 'T0001', 'I0052', 1, NULL),
('RL0004', 'T0001', 'I0053', 0.6, NULL),
('RL0005', 'T0001', 'I0054', 0.8, NULL),
('RL0006', 'T0001', 'I0055', 0.4, NULL),
('RL0007', 'T0001', 'I0056', 0.4, NULL),
('RL0008', 'T0002', 'I0001', 0.6, NULL),
('RL0009', 'T0002', 'I0002', 0.4, NULL),
('RL0010', 'T0002', 'I0003', 1, NULL),
('RL0011', 'T0002', 'I0004', 0.6, NULL),
('RL0012', 'T0002', 'I0005', 0.8, NULL),
('RL0013', 'T0002', 'I0006', 0.4, NULL),
('RL0014', 'T0002', 'I0007', 0.4, NULL),
('RL0015', 'T0008', 'I0008', 0.6, NULL),
('RL0016', 'T0008', 'I0009', 0.4, NULL),
('RL0017', 'T0008', 'I0010', 1, NULL),
('RL0018', 'T0008', 'I0011', 0.6, NULL),
('RL0019', 'T0008', 'I0012', 0.8, NULL),
('RL0020', 'T0008', 'I0013', 0.4, NULL),
('RL0021', 'T0008', 'I0014', 0.4, NULL),
('RL0022', 'T0003', 'I0015', 0.6, NULL),
('RL0023', 'T0003', 'I0016', 0.4, NULL),
('RL0024', 'T0003', 'I0017', 1, NULL),
('RL0025', 'T0003', 'I0018', 0.6, NULL),
('RL0026', 'T0003', 'I0019', 0.8, NULL),
('RL0027', 'T0003', 'I0020', 0.4, NULL),
('RL0028', 'T0003', 'I0021', 0.4, NULL),
('RL0029', 'T0007', 'I0022', 0.6, NULL),
('RL0030', 'T0007', 'I0023', 0.4, NULL),
('RL0031', 'T0007', 'I0024', 1, NULL),
('RL0032', 'T0007', 'I0025', 0.6, NULL),
('RL0033', 'T0007', 'I0026', 0.8, NULL),
('RL0034', 'T0007', 'I0027', 0.4, NULL),
('RL0035', 'T0007', 'I0028', 0.4, NULL),
('RL0036', 'T0004', 'I0029', 0.6, NULL),
('RL0037', 'T0004', 'I0030', 0.4, NULL),
('RL0038', 'T0004', 'I0031', 1, NULL),
('RL0039', 'T0004', 'I0032', 0.6, NULL),
('RL0040', 'T0004', 'I0033', 0.8, NULL),
('RL0041', 'T0004', 'I0034', 0.4, NULL),
('RL0042', 'T0004', 'I0035', 0.4, NULL),
('RL0043', 'T0006', 'I0036', 0.6, NULL),
('RL0044', 'T0006', 'I0037', 0.4, NULL),
('RL0045', 'T0006', 'I0038', 1, NULL),
('RL0046', 'T0006', 'I0039', 0.6, NULL),
('RL0047', 'T0006', 'I0040', 0.8, NULL),
('RL0048', 'T0006', 'I0041', 0.4, NULL),
('RL0049', 'T0006', 'I0042', 0.4, NULL),
('RL0050', 'T0005', 'I0036', 0.6, NULL),
('RL0051', 'T0005', 'I0037', 0.4, NULL),
('RL0052', 'T0005', 'I0038', 1, NULL),
('RL0053', 'T0005', 'I0039', 0.6, NULL),
('RL0054', 'T0005', 'I0040', 0.8, NULL),
('RL0055', 'T0005', 'I0041', 0.4, NULL),
('RL0056', 'T0005', 'I0042', 0.4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `school_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`school_name`, `address`) VALUES
('SDN Kwaron I', 'Diwek, Jombang');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `detail` varchar(1000) NOT NULL,
  `advice` varchar(1000) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `detail`, `advice`, `fields`) VALUES
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
-- Table structure for table `types_pictures`
--

CREATE TABLE `types_pictures` (
  `id` int(11) NOT NULL,
  `type_id` varchar(5) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `types_pictures`
--

INSERT INTO `types_pictures` (`id`, `type_id`, `file_name`) VALUES
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `date_of_birth` date DEFAULT current_timestamp(),
  `address` varchar(100) DEFAULT NULL,
  `privilege` enum('User','Admin') NOT NULL DEFAULT 'User',
  `avatar_id` int(11) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `gender`, `date_of_birth`, `address`, `privilege`, `avatar_id`, `last_login`) VALUES
('U0001', '1001', '$2y$10$DYwZUHvSBPjCfQD.st7DhuzEMMd6/Andqb8BZ1r0TQ/uWobiYATuK', 'Yusuf Effendi', 'Laki-Laki', '1999-08-22', 'Diwek', 'Admin', 2, '2021-07-14 01:36:29'),
('U0002', '2001', '$2y$10$poD7TkNcO1WcDJTKmk.mbOz05BQeM.98An3yHJKE3k5aLg1kbbMne', 'Aldi Kurniawan', 'Laki-Laki', '1999-08-22', 'Sugihwaras', 'User', 1, '2021-07-11 03:00:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests_v2`
--
ALTER TABLE `interests_v2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `results_details`
--
ALTER TABLE `results_details`
  ADD PRIMARY KEY (`result_id`,`interest_id`),
  ADD KEY `interests_id` (`interest_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interest_id` (`interest_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types_pictures`
--
ALTER TABLE `types_pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types_pictures`
--
ALTER TABLE `types_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `results_details`
--
ALTER TABLE `results_details`
  ADD CONSTRAINT `results_details_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interests_v2` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_details_ibfk_3` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rules`
--
ALTER TABLE `rules`
  ADD CONSTRAINT `rules_ibfk_1` FOREIGN KEY (`interest_id`) REFERENCES `interests_v2` (`id`),
  ADD CONSTRAINT `rules_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `types_pictures`
--
ALTER TABLE `types_pictures`
  ADD CONSTRAINT `types_pictures_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
