-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 10:42 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelang`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete` (IN `id_user1` INT)  BEGIN
DECLARE id_user2 integer;
SET id_user2=id_user1;
DELETE FROM tb_masyarakat WHERE id_user=id_user2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete1` (IN `id_user` INT)  BEGIN
DELETE FROM tb_masyarakat WHERE id_user=id_user;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `tgl` date NOT NULL,
  `harga_awal` int(20) NOT NULL,
  `deskripsi_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tgl`, `harga_awal`, `deskripsi_barang`) VALUES
(1, 'Laptop Asus', '2025-01-14', 5000000, 'Laptop gaming'),
(2, 'Kursi Kantor', '2025-01-15', 7500000, 'Kursi untuk bekerja'),
(3, 'Meja Belajar', '2025-01-16', 12000000, 'Meja kayu jait'),
(4, 'Sepeda Gunung', '2025-01-17', 3000000, 'Sepeda untuk olahraga'),
(5, 'Kamera DSLR', '2025-01-18', 7000000, 'Kamera untuk fotografi profesional'),
(6, 'stik ps', '2025-01-19', 50000, 'stik buan main game'),
(7, 'dompet', '2025-01-20', 70000, 'dompet kulit oray'),
(8, 'hp', '2025-01-20', 200000, 'hp infinix seken'),
(9, 'tas', '2025-01-20', 80000, 'tas gunung'),
(10, 'gitar', '2025-01-20', 100000, 'gitar cort'),
(12, 'piano', '2025-01-22', 2000000, 'piano bekas saya'),
(13, 'mouse', '2025-01-22', 50000, 'mouse lucitik');

-- --------------------------------------------------------

--
-- Table structure for table `tb_history_lelang`
--

CREATE TABLE `tb_history_lelang` (
  `id_history` int(11) NOT NULL,
  `id_lelang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `penawaran_harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_history_lelang`
--

INSERT INTO `tb_history_lelang` (`id_history`, `id_lelang`, `id_barang`, `id_user`, `penawaran_harga`) VALUES
(1, 1, 1, 1, 5200000),
(2, 1, 1, 2, 5300000),
(3, 2, 2, 3, 760000),
(4, 2, 2, 4, 770000),
(5, 3, 3, 5, 5200000),
(7, 4, 3, 1, 13000000),
(8, 6, 6, 1, 60000),
(9, 6, 6, 1, 7000),
(10, 6, 6, 2, 80000),
(11, 6, 6, 2, 10000),
(12, 6, 6, 2, 10000),
(13, 6, 6, 2, 10000),
(14, 6, 6, 2, 11000),
(15, 6, 6, 2, 60000),
(16, 6, 6, 2, 60000),
(17, 6, 6, 1, 70000),
(18, 6, 6, 1, 70000),
(19, 7, 7, 1, 80000),
(20, 7, 7, 1, 80000),
(21, 7, 7, 2, 90000),
(22, 8, 8, 2, 300000),
(23, 9, 9, 2, 90000),
(24, 9, 9, 1, 1000000),
(25, 10, 10, 1, 200000),
(26, 11, 13, 1, 80000),
(27, 11, 13, 1, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lelang`
--

CREATE TABLE `tb_lelang` (
  `id_lelang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_lelang` date NOT NULL,
  `harga_akhir` int(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `status` enum('dibuka','ditutup') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_lelang`
--

INSERT INTO `tb_lelang` (`id_lelang`, `id_barang`, `tgl_lelang`, `harga_akhir`, `id_user`, `id_petugas`, `status`) VALUES
(1, 1, '2025-01-19', 5500000, 1, 1, 'ditutup'),
(2, 2, '2025-01-20', 800000, 2, 1, 'ditutup'),
(3, 3, '2025-01-21', 1200000, 3, 2, 'dibuka'),
(4, 4, '2025-01-22', 3200000, 4, 2, 'dibuka'),
(5, 5, '2025-01-23', 7500000, 5, 3, 'dibuka'),
(6, 6, '2025-01-19', 70000, 1, 1, 'ditutup'),
(7, 7, '2025-01-20', 90000, 2, 1, 'ditutup'),
(8, 8, '2025-01-20', 300000, 2, 3, 'ditutup'),
(9, 9, '2025-01-20', 1000000, 1, 1, 'ditutup'),
(10, 10, '2025-01-20', 200000, 1, 1, 'ditutup'),
(11, 13, '2025-01-22', 80000, 1, 3, 'ditutup');

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `level` enum('administrator','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `level`) VALUES
(1, 'administrator'),
(2, 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id_user`, `nama_lengkap`, `username`, `password`, `telp`) VALUES
(1, 'lala', 'lala', 'lala123', '88823667735'),
(2, 'lambo', 'lambo', 'lambo123', '88847563321'),
(3, 'rohis', 'rohis', 'rohis123', '88837102293'),
(4, 'cou', 'cou', 'cou123', '889431957748'),
(5, 'frank', 'frank', 'frank123', '88892742281');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `id_level`) VALUES
(1, 'irfan', 'admin1', 'admin123', 1),
(2, 'rohim', 'rohim', 'petugas123', 2),
(3, 'albert', 'albert', 'albert123', 2),
(4, 'cynthia', 'cynthia', 'cynthia123', 2),
(5, 'clara', 'clara', 'clara123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_history_lelang`
--
ALTER TABLE `tb_history_lelang`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_lelang` (`id_lelang`,`id_barang`,`id_user`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  ADD PRIMARY KEY (`id_lelang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`,`id_petugas`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_history_lelang`
--
ALTER TABLE `tb_history_lelang`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  MODIFY `id_lelang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_history_lelang`
--
ALTER TABLE `tb_history_lelang`
  ADD CONSTRAINT `tb_history_lelang_ibfk_1` FOREIGN KEY (`id_lelang`) REFERENCES `tb_lelang` (`id_lelang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_history_lelang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_history_lelang_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  ADD CONSTRAINT `tb_lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lelang_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
