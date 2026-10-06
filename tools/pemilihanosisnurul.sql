-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2026 at 01:02 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemilihanosisnurul`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpemilihan`
--

CREATE TABLE `detailpemilihan` (
  `iddetailpemilihan` int NOT NULL,
  `idpemilihan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detailpemilihan`
--

INSERT INTO `detailpemilihan` (`iddetailpemilihan`, `idpemilihan`) VALUES
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `idguru` int NOT NULL,
  `namaguru` varchar(50) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `statuspemilih` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`idguru`, `namaguru`, `nip`, `statuspemilih`) VALUES
(1, 'Rizky Pratama', 'nipguru', 'sudah'),
(2, 'Shifa Aulia', 'nipguru', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `idkandidat` int NOT NULL,
  `idkategori` int NOT NULL,
  `nomorurut` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `visi` varchar(500) NOT NULL,
  `misi` varchar(500) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`idkandidat`, `idkategori`, `nomorurut`, `nama`, `visi`, `misi`, `foto`) VALUES
(1, 1, 1, 'Nurul Aini', 'Visi kandidat ketua 1', 'Misi kandidat ketua 1', 'nurul1.jpg'),
(2, 1, 2, 'Siti Aulia', 'Visi kandidat ketua 2', 'Misi kandidat ketua 2', 'siti2.jpg'),
(3, 2, 1, 'Rizky Pratama', 'Visi kandidat wakil 1', 'Misi kandidat wakil 1', 'rizky3.jpg'),
(4, 2, 2, 'Shifa Aulia', 'Visi kandidat wakil 2', 'Misi kandidat wakil 2', 'shifa4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int NOT NULL,
  `namakategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`) VALUES
(1, 'Ketua'),
(2, 'Wakil Ketua');

-- --------------------------------------------------------

--
-- Table structure for table `pemilihan`
--

CREATE TABLE `pemilihan` (
  `idpemilihan` int NOT NULL,
  `iduser` int NOT NULL,
  `idsiswa` int DEFAULT NULL,
  `idguru` int DEFAULT NULL,
  `idkandidat` int NOT NULL,
  `tanggalpemilihan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemilihan`
--

INSERT INTO `pemilihan` (`idpemilihan`, `iduser`, `idsiswa`, `idguru`, `idkandidat`, `tanggalpemilihan`) VALUES
(7, 1, 1, NULL, 1, '2026-09-23 20:00:00'),
(8, 1, 1, NULL, 2, '2026-09-23 20:00:00'),
(9, 2, 2, NULL, 1, '2026-09-23 20:05:00'),
(10, 2, 2, NULL, 2, '2026-09-23 20:05:00'),
(11, 3, NULL, 1, 1, '2026-09-23 20:10:00'),
(12, 3, NULL, 1, 2, '2026-09-23 20:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int NOT NULL,
  `namasiswa` varchar(50) NOT NULL,
  `nisn` varchar(14) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `statuspemilih` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `namasiswa`, `nisn`, `kelas`, `statuspemilih`) VALUES
(1, 'Nurul Aini', '12345678901234', 'XI RPL 2', 'sudah'),
(2, 'Siti Aulia', '12345678901235', 'XI RPL 2', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `namauser` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nohp` char(15) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `username`, `password`, `role`, `alamat`, `nohp`, `foto`) VALUES
(1, 'Nurul Aini', 'nurulaini1', '123', 'admin', 'Karang Baru', '082398182739', 'nurul1.jpg'),
(2, 'Siti Aulia', 'sitiaulia2', '123', 'petugas', 'Karang Baru', '082398182739', 'siti2.jpg'),
(3, 'Rizky Pratama', 'rizkypratama3', '123', 'petugas', 'Karang Baru', '082398182739', 'rizky3.jpg'),
(4, 'Shifa Aulia', 'shifaaulia4', '123', 'petugas', 'Karang Baru', '082398182739', 'shifa4.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpemilihan`
--
ALTER TABLE `detailpemilihan`
  ADD PRIMARY KEY (`iddetailpemilihan`),
  ADD KEY `idpemilihan` (`idpemilihan`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`idkandidat`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `pemilihan`
--
ALTER TABLE `pemilihan`
  ADD PRIMARY KEY (`idpemilihan`),
  ADD KEY `idkandidat` (`idkandidat`),
  ADD KEY `fk_pemilihan_user` (`iduser`),
  ADD KEY `fk_pemilihan_siswa` (`idsiswa`),
  ADD KEY `fk_pemilihan_guru` (`idguru`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpemilihan`
--
ALTER TABLE `detailpemilihan`
  MODIFY `iddetailpemilihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `idkandidat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pemilihan`
--
ALTER TABLE `pemilihan`
  MODIFY `idpemilihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpemilihan`
--
ALTER TABLE `detailpemilihan`
  ADD CONSTRAINT `idpemilihan` FOREIGN KEY (`idpemilihan`) REFERENCES `pemilihan` (`idpemilihan`);

--
-- Constraints for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`);

--
-- Constraints for table `pemilihan`
--
ALTER TABLE `pemilihan`
  ADD CONSTRAINT `fk_pemilihan_guru` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`),
  ADD CONSTRAINT `fk_pemilihan_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`),
  ADD CONSTRAINT `fk_pemilihan_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `idkandidat` FOREIGN KEY (`idkandidat`) REFERENCES `kandidat` (`idkandidat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
