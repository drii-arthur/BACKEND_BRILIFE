-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2020 at 12:31 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbbril_agen`
--

-- --------------------------------------------------------

--
-- Table structure for table `dbo.agen`
--

CREATE TABLE `dbo.agen` (
  `id` int(11) NOT NULL,
  `no_lisensi` int(11) NOT NULL,
  `nama_agen` varchar(255) NOT NULL,
  `id_agen_level` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `status_tgl` date NOT NULL,
  `wilayah_kerja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dbo.agen`
--

INSERT INTO `dbo.agen` (`id`, `no_lisensi`, `nama_agen`, `id_agen_level`, `status`, `status_tgl`, `wilayah_kerja`) VALUES
(1, 1001, 'SITI', 1, 1, '2020-01-01', 'JAKARTA'),
(2, 1003, 'SARIOH', 3, 1, '2020-01-03', 'JAKARTA'),
(3, 1004, 'TIKNO', 4, 1, '2020-01-04', 'JAKARTA');

-- --------------------------------------------------------

--
-- Table structure for table `dbo.agen_level`
--

CREATE TABLE `dbo.agen_level` (
  `id` int(11) NOT NULL,
  `level` varchar(4) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dbo.agen_level`
--

INSERT INTO `dbo.agen_level` (`id`, `level`, `keterangan`, `urutan`) VALUES
(1, 'FU', 'Field Underwriter', 4),
(2, 'UM', 'Unit Manajer', 3),
(3, 'SM', 'Sales Manajer', 2),
(4, 'RM', 'Regional Manajer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbo.agen_struktur`
--

CREATE TABLE `dbo.agen_struktur` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `id_agen` int(11) NOT NULL,
  `berlaku_mulai` date NOT NULL,
  `berlaku_akhir` date NOT NULL,
  `status` char(1) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dbo.agen_struktur`
--

INSERT INTO `dbo.agen_struktur` (`id`, `parent_id`, `id_agen`, `berlaku_mulai`, `berlaku_akhir`, `status`, `keterangan`) VALUES
(1, NULL, 1, '2020-08-01', '2020-08-01', 'A', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dbo.agen`
--
ALTER TABLE `dbo.agen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agen_level` (`id_agen_level`);

--
-- Indexes for table `dbo.agen_level`
--
ALTER TABLE `dbo.agen_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbo.agen_struktur`
--
ALTER TABLE `dbo.agen_struktur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `id_agen` (`id_agen`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dbo.agen`
--
ALTER TABLE `dbo.agen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dbo.agen_level`
--
ALTER TABLE `dbo.agen_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dbo.agen_struktur`
--
ALTER TABLE `dbo.agen_struktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dbo.agen`
--
ALTER TABLE `dbo.agen`
  ADD CONSTRAINT `dbo.agen_ibfk_1` FOREIGN KEY (`id_agen_level`) REFERENCES `dbo.agen_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dbo.agen_struktur`
--
ALTER TABLE `dbo.agen_struktur`
  ADD CONSTRAINT `dbo.agen_struktur_ibfk_1` FOREIGN KEY (`id_agen`) REFERENCES `dbo.agen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
