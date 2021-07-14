-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 03:52 PM
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
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `name`, `type_id`) VALUES
('F0001', 'Atlet Olahraga', 'T0001'),
('F0002', 'Model / Aktor', 'T0001'),
('F0003', 'Penari', 'T0001'),
('F0004', 'Penulis', 'T0002'),
('F0005', 'Wartawan', 'T0002'),
('F0006', 'Motivator', 'T0003'),
('F0007', 'Pelatih / Trainer', 'T0003'),
('F0008', 'Psikolog', 'T0004'),
('F0009', 'Pengusaha', 'T0004'),
('F0010', 'Desain Grafis', 'T0005'),
('F0011', 'Arsitek', 'T0005'),
('F0012', 'Pelukis', 'T0005'),
('F0013', 'Musisi Musik', 'T0006'),
('F0014', 'Budayawan', 'T0006'),
('F0015', 'Programmer', 'T0007'),
('F0016', 'Guru Matematika', 'T0007'),
('F0017', 'Teknisi', 'T0007'),
('F0018', 'Antropolog', 'T0008'),
('F0019', 'Arkeolog', 'T0008'),
('F0020', 'Meteorolog', 'T0008'),
('F0021', 'Aktifis alam', 'T0008');

-- --------------------------------------------------------

--
-- Table structure for table `illustrations`
--

CREATE TABLE `illustrations` (
  `id` int(11) NOT NULL,
  `type_id` varchar(5) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `illustrations`
--

INSERT INTO `illustrations` (`id`, `type_id`, `file_name`) VALUES
(1, 'T0001', 'kinesketik-1.svg'),
(2, 'T0001', 'kinesketik-3.svg'),
(3, 'T0001', 'kinesketik-2.svg'),
(4, 'T0002', 'linguistik-1.svg'),
(5, 'T0002', 'linguistik-2.svg'),
(6, 'T0002', 'linguistik-3.svg'),
(7, 'T0003', 'intra-personal-1.svg'),
(8, 'T0003', 'intra-personal-2.svg'),
(9, 'T0004', 'inter-personal-1.svg'),
(10, 'T0004', 'inter-personal-2.svg'),
(11, 'T0004', 'inter-personal-3.svg'),
(12, 'T0005', 'visual-spasial-1.svg'),
(13, 'T0005', 'visual-spasial-2.svg'),
(14, 'T0005', 'visual-spasial-3.svg'),
(15, 'T0005', 'visual-spasial-4.svg'),
(16, 'T0006', 'musikal-1.svg'),
(17, 'T0006', 'musikal-2.svg'),
(18, 'T0007', 'matematika-logika-1.svg'),
(19, 'T0007', 'matematika-logika-2.svg'),
(20, 'T0007', 'matematika-logika-3.svg'),
(21, 'T0008', 'naturalis-1.svg'),
(22, 'T0008', 'naturalis-2.svg'),
(23, 'T0008', 'naturalis-3.svg'),
(24, 'T0008', 'naturalis-4.svg');

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
('T0001', 'Kinestetik', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Atlet Olahraga, Model, Aktor, Penari'),
('T0002', 'Linguistik', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Penulis, Wartawan'),
('T0003', 'Intra-personal', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Motivator, Pelatih'),
('T0004', 'Inter-personal', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Psikolog, Pengusaha'),
('T0005', 'Visual Spasial', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisuGummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet roll. Toffee sugar plum sugar plum jelly-o jujubes bonbon dessert carrot cake. Sweet pie candy jelly. ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Desain Grafis, Arsitek, Pelukis'),
('T0006', 'Musikal', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu\nGummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet roll. Toffee sugar plum sugar plum jelly-o jujubes bonbon dessert carrot cake. Sweet pie candy jelly. ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Musisi Musik, Budayawan'),
('T0007', 'Matematika-Logika', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu\nGummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet roll. Toffee sugar plum sugar plum jelly-o jujubes bonbon dessert carrot cake. Sweet pie candy jelly. ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Programmer, Guru Matematika, Teknisi'),
('T0008', 'Naturalis', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes tiramisu\nGummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet roll. Toffee sugar plum sugar plum jelly-o jujubes bonbon dessert carrot cake. Sweet pie candy jelly. ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit', 'Antropolog, Arkeolog, Meteorolog, Aktifis Alam'),
('T0009', 'sdfsdf', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `privilege` enum('User','Admin') NOT NULL DEFAULT 'User',
  `avatar_id` int(11) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `privilege`, `avatar_id`, `last_login`) VALUES
('U0001', 'yusuf', '$2y$10$yS28JUyLyPQqBHPWdLFmMOdeS2pc1g0mj.ttjYAJv.p04se.tGt5q', 'Yusuf Effendi', 'Admin', 2, '2021-07-14 01:36:29'),
('U0002', 'aldikurw', '$2y$10$poD7TkNcO1WcDJTKmk.mbOz05BQeM.98An3yHJKE3k5aLg1kbbMne', 'Aldi Kurniawan', 'User', 1, '2021-07-11 03:00:27'),
('U0003', 'edit', '$2y$10$T7tFgUt18x1/GDyh7dchxuOGA.BBzfAKIdznDqzefXBQe6HBMGesC', 'hhhbk', 'User', 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `illustrations`
--
ALTER TABLE `illustrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `illustrations`
--
ALTER TABLE `illustrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `illustrations`
--
ALTER TABLE `illustrations`
  ADD CONSTRAINT `illustrations_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

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
  ADD CONSTRAINT `results_details_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_details_ibfk_3` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rules`
--
ALTER TABLE `rules`
  ADD CONSTRAINT `rules_ibfk_1` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`),
  ADD CONSTRAINT `rules_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
