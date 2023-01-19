-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 01:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aa`
--
CREATE DATABASE IF NOT EXISTS `aa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aa`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_detail`
--

CREATE TABLE `tb_transaksi_detail` (
  `no_transaksi_detail` char(4) NOT NULL,
  `no_transaksi` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD PRIMARY KEY (`no_transaksi_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`,`id_barang`),
  ADD KEY `no_transaksi_2` (`no_transaksi`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);
--
-- Database: `ci-login`
--
CREATE DATABASE IF NOT EXISTS `ci-login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ci-login`;

-- --------------------------------------------------------

--
-- Table structure for table `pembing`
--

CREATE TABLE `pembing` (
  `pembing_id` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `dosen` int(11) NOT NULL,
  `tanggapan` text DEFAULT NULL,
  `kesediaan` varchar(30) NOT NULL DEFAULT 'new',
  `jenis` int(11) NOT NULL,
  `status_bimbingan` enum('selesai','proses','new') NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembing`
--

INSERT INTO `pembing` (`pembing_id`, `periode`, `id_mhs`, `pengajuan_id`, `create_at`, `dosen`, `tanggapan`, `kesediaan`, `jenis`, `status_bimbingan`) VALUES
(3, 3, 1, 1, '2022-04-01 16:53:57', 2, NULL, 'Y', 2, 'proses'),
(5, 3, 3, 3, '2022-08-30 16:11:45', 3, NULL, 'Y', 1, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `pengajuan_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `tgl_pengajuan` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `revisi_judul` varchar(255) DEFAULT NULL,
  `stt_revisi` varchar(30) DEFAULT NULL,
  `masalah` text NOT NULL,
  `rekomendasi_pa` varchar(30) DEFAULT 'new',
  `tgl_rekomendasi` datetime DEFAULT NULL,
  `disetujui_kajur` varchar(30) DEFAULT 'new',
  `tgl_acc` datetime DEFAULT NULL,
  `tgl_pengajuan_sk` date DEFAULT NULL,
  `alasan_perpanjangan_sk` text DEFAULT NULL,
  `status_bimbingan` varchar(60) DEFAULT NULL,
  `status_perpanjangan_sk` varchar(30) DEFAULT NULL,
  `status_sk` varchar(30) DEFAULT 'old'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`pengajuan_id`, `periode_id`, `id_mhs`, `tgl_pengajuan`, `judul`, `jenis`, `revisi_judul`, `stt_revisi`, `masalah`, `rekomendasi_pa`, `tgl_rekomendasi`, `disetujui_kajur`, `tgl_acc`, `tgl_pengajuan_sk`, `alasan_perpanjangan_sk`, `status_bimbingan`, `status_perpanjangan_sk`, `status_sk`) VALUES
(1, 3, 1, '2022-04-01 16:52:32', 'Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web', 'Hardware/ dan Software', '', 'N', '<p>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br></p>', 'Y', '2022-04-01 16:54:24', 'Y', '2022-04-01 16:52:47', NULL, NULL, NULL, NULL, 'old'),
(2, 3, 2, '2022-08-23 15:21:02', 'Sistem 1', 'Hardware/ dan Software', NULL, NULL, '<p>Aakak</p>', 'N', '2022-08-23 15:22:15', 'Y', '2022-08-30 15:51:04', NULL, NULL, NULL, NULL, 'old'),
(3, 3, 3, '2022-08-30 15:35:42', '', 'Studi Literatur/ Pengkajian / Analisa', 'Water Availability Analysis Of Walanae River', 'Y', '<p>Lorem ipsum</p>', 'new', NULL, 'Y', '2022-08-30 15:43:01', '2022-08-30', '', 'BAB IV', 'Y', 'New'),
(4, 3, 5, '2022-08-30 17:13:18', 'Uji Kualitas Tanah', 'Studi Literatur/ Pengkajian / Analisa', NULL, NULL, '<p>Ada deh</p>', 'Y', '2022-08-30 17:43:29', 'Y', '2022-08-30 17:15:09', NULL, NULL, NULL, NULL, 'old');

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL,
  `id_pesan` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_tipe` enum('mhs','dsn') DEFAULT NULL,
  `tipe_pesan` enum('R','S') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_admin` varchar(40) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `username`, `password`, `nama_admin`, `img`, `status`) VALUES
(1, 'admin@bimta', '4ec41ba09f61c69df5655095987c8246b237cde3', 'Fahad Abdul Aziz', 'user.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dsn`
--

CREATE TABLE `tb_dsn` (
  `id_dsn` int(11) NOT NULL,
  `nip` varchar(21) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `foto` varchar(225) NOT NULL DEFAULT 'user.png',
  `stt_akun` varchar(12) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_dsn`
--

INSERT INTO `tb_dsn` (`id_dsn`, `nip`, `nama_dosen`, `jabatan`, `password`, `foto`, `stt_akun`) VALUES
(1, '123', 'Dr. Poppy Yendriani, M.Pd', 'Dosen', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'user.png', 'Y'),
(2, '456', 'Prof, Dr. Adam El-Fathan, M.Sc', 'Rektor', '51eac6b471a284d3341d8c0c63d0f1a286262a18', '456_1648821591.png', 'Y'),
(3, '0011128502', 'Nurfitriana, S.Pd', 'Lektor', '4983cb3bc94f219c4984224371387ad029ede47d', 'user.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fileskripsi`
--

CREATE TABLE `tb_fileskripsi` (
  `id_file` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `nama_file` varchar(225) NOT NULL,
  `tgl_upload` datetime NOT NULL,
  `tipe_file` varchar(10) NOT NULL,
  `ukuran_file` varchar(20) NOT NULL,
  `file` varchar(255) NOT NULL,
  `doc` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_fileskripsi`
--

INSERT INTO `tb_fileskripsi` (`id_file`, `id_mhs`, `pengajuan_id`, `nama_file`, `tgl_upload`, `tipe_file`, `ukuran_file`, `file`, `doc`) VALUES
(1, 1, 1, 'SK DOSEN', '2022-04-01 16:57:35', 'doc', '0', 'nofile', 'https://docs.google.com/document/d/1hDZRSOr8B5X7FPvf5teM-NGYl7ucQJuE6rS5bhegaOc/edit?usp=sharing');

-- --------------------------------------------------------

--
-- Table structure for table `tb_forum`
--

CREATE TABLE `tb_forum` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_id_to` int(11) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL COMMENT 'mhs,dsn',
  `pesan` longtext DEFAULT NULL,
  `reply_to` varchar(11) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `wkt` datetime DEFAULT current_timestamp(),
  `pesan_status` varchar(30) DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_forum`
--

INSERT INTO `tb_forum` (`id`, `kode`, `user_id`, `user_id_to`, `user_type`, `pesan`, `reply_to`, `document`, `wkt`, `pesan_status`) VALUES
(1, 'DSN-1648806536', 2, 1, 'dsn', '&lt;p&gt;Hai &lt;b&gt;Hamiatul&lt;/b&gt; ?&lt;/p&gt;', '', 'nofile', '2022-04-01 16:49:13', 'Y'),
(2, 'DSN-1648806536', 1, 2, 'mhs', '&lt;p&gt;Halo pak, selamat siang ?&lt;/p&gt;', '1', 'nofile', '2022-04-01 16:49:50', 'Y'),
(3, 'DSN-1648806536', 2, 1, 'dsn', '&lt;p&gt;Siang&lt;/p&gt;', '2', 'nofile', '2022-04-01 16:51:09', 'Y'),
(4, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Cek&lt;/p&gt;', '', 'nofile', '2022-08-30 06:18:40', 'Y'),
(5, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Hai&lt;br&gt;&lt;/p&gt;', '', 'nofile', '2022-09-01 02:59:56', 'Y'),
(6, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Cek&lt;/p&gt;', '', 'nofile', '2022-12-26 08:00:21', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `tb_info`
--

CREATE TABLE `tb_info` (
  `info_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_info`
--

INSERT INTO `tb_info` (`info_id`, `judul`, `isi`) VALUES
(1, 'Jumlah SKS', 'Minimal 140 SKS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mhs`
--

CREATE TABLE `tb_mhs` (
  `id_mhs` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tmp_lahir` varchar(60) DEFAULT NULL,
  `tg_lahir` date DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `fotomhs` varchar(225) NOT NULL DEFAULT 'user.png',
  `tahun_angkatan` int(30) NOT NULL,
  `prodi_id` int(11) NOT NULL,
  `dosen_pa` int(11) NOT NULL DEFAULT 0,
  `status_akun` varchar(12) NOT NULL DEFAULT 'new',
  `status_skripsi` varchar(30) NOT NULL DEFAULT 'N',
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_mhs`
--

INSERT INTO `tb_mhs` (`id_mhs`, `nim`, `nama`, `tmp_lahir`, `tg_lahir`, `password`, `fotomhs`, `tahun_angkatan`, `prodi_id`, `dosen_pa`, `status_akun`, `status_skripsi`, `create_at`) VALUES
(1, '001', 'Hamiatul Asmawati', NULL, NULL, 'e193a01ecf8d30ad0affefd332ce934e32ffce72', 'user.png', 2013, 2, 2, 'Y', 'N', '2022-04-01 16:46:36'),
(2, '009', 'hufgweyg', NULL, NULL, '19b3f0ed02e60c8bae808b496b3cce99dc8f9e69', 'user.png', 2013, 1, 1, 'Y', 'N', '2022-06-13 17:57:35'),
(3, '123', 'ITS', 'Wotu', '1970-01-01', '7c222fb2927d828af22f592134e8932480637c0d', 'user.png', 2017, 2, 2, 'Y', 'N', '2022-08-30 15:19:32'),
(4, '12345', 'Andi', NULL, NULL, '8cb2237d0679ca88db6464eac60da96345513964', 'user.png', 2018, 2, 0, 'N', 'N', '2022-08-30 17:04:08'),
(5, '123456', 'Asis', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user.png', 2018, 2, 3, 'Y', 'N', '2022-08-30 17:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `pengirim_id` int(11) NOT NULL,
  `user_pengirim` enum('mhs','dsn') NOT NULL,
  `penerima_id` int(11) NOT NULL,
  `user_penerima` enum('mhs','dsn') NOT NULL,
  `topik` varchar(255) NOT NULL,
  `subyek` text NOT NULL,
  `isi_pesan` longtext DEFAULT NULL,
  `document` varchar(255) NOT NULL DEFAULT 'nofile',
  `pembing_id` int(11) DEFAULT NULL,
  `jenis_pemb` int(11) DEFAULT NULL,
  `wkt` datetime DEFAULT NULL,
  `status_pesan` varchar(15) NOT NULL DEFAULT 'new',
  `reply_to` int(11) DEFAULT NULL COMMENT 'Untuk menampung id pesan yg dibalas, jika ada',
  `tahun_bimbingan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `pengajuan_id`, `pengirim_id`, `user_pengirim`, `penerima_id`, `user_penerima`, `topik`, `subyek`, `isi_pesan`, `document`, `pembing_id`, `jenis_pemb`, `wkt`, `status_pesan`, `reply_to`, `tahun_bimbingan`) VALUES
(1, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648806979', 'Bimbingan 1', '&lt;p&gt;Harap Lampirkan Dokumen pendukung&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 16:56:19', 'Y', NULL, 3),
(2, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648821173', 'BIMBINGAN 2', '&lt;p&gt;BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:52:53', 'Y', NULL, 3),
(3, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648821188', 'BIMBINGAN 3', '&lt;p&gt;BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:53:08', 'Y', NULL, 3),
(4, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648806979', 'Bimbingan 1', '&lt;p&gt;Baik Prof&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:11', 'new', 1, 3),
(5, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648821173', 'BIMBINGAN 2', '&lt;p&gt;Oke&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:24', 'new', 2, 3),
(6, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648821188', 'BIMBINGAN 3', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.5);&quot;&gt;BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:37', 'new', 3, 3),
(7, 3, 3, 'dsn', 3, 'mhs', 'DSN-TOPIK-1661850941', 'Revisi', '&lt;p&gt;Latar belakang masih belum menggambarkan masalahnutama yang ingin diteliti.&lt;/p&gt;', 'nofile', 5, 1, '2022-08-30 16:15:41', 'Y', NULL, 3),
(8, 3, 3, 'dsn', 3, 'mhs', 'DSN-TOPIK-1661850941', 'Revisi', '&lt;p&gt;Kok blm direvisi jg?&lt;/p&gt;', 'nofile', 5, 1, '2022-08-30 16:38:28', 'new', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tm_doc`
--

CREATE TABLE `tm_doc` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_doc`
--

INSERT INTO `tm_doc` (`id`, `file_name`) VALUES
(1, 'Tess'),
(2, 'tmuhdywq');

-- --------------------------------------------------------

--
-- Table structure for table `tm_fakultas`
--

CREATE TABLE `tm_fakultas` (
  `fakultas_id` int(11) NOT NULL,
  `fakultas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_fakultas`
--

INSERT INTO `tm_fakultas` (`fakultas_id`, `fakultas`) VALUES
(1, 'ILMU KOMPUTER'),
(2, 'ILMU PENDIDIKAN');

-- --------------------------------------------------------

--
-- Table structure for table `tm_jenis`
--

CREATE TABLE `tm_jenis` (
  `id` int(11) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_jenis`
--

INSERT INTO `tm_jenis` (`id`, `jenis`) VALUES
(1, 'Hardware/ dan Software'),
(2, 'Studi Literatur/ Pengkajian / Analisa');

-- --------------------------------------------------------

--
-- Table structure for table `tm_periode`
--

CREATE TABLE `tm_periode` (
  `periode_id` int(11) NOT NULL,
  `th_periode` varchar(20) DEFAULT NULL,
  `stt_periode` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_periode`
--

INSERT INTO `tm_periode` (`periode_id`, `th_periode`, `stt_periode`) VALUES
(3, '2021/2022', 'on'),
(4, '2022/2023', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tm_prodi`
--

CREATE TABLE `tm_prodi` (
  `prodi_id` int(11) NOT NULL,
  `fakultas_id` int(11) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `konsen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_prodi`
--

INSERT INTO `tm_prodi` (`prodi_id`, `fakultas_id`, `prodi`, `konsen`) VALUES
(1, 1, 'Teknik Informatika', 'Webprogramming'),
(2, 1, 'Teknik Lingkungan Hidup', 'Teknik Lingkungan Hidup');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembing`
--
ALTER TABLE `pembing`
  ADD PRIMARY KEY (`pembing_id`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`pengajuan_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_dsn`
--
ALTER TABLE `tb_dsn`
  ADD PRIMARY KEY (`id_dsn`);

--
-- Indexes for table `tb_fileskripsi`
--
ALTER TABLE `tb_fileskripsi`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `tb_forum`
--
ALTER TABLE `tb_forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_info`
--
ALTER TABLE `tb_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tm_doc`
--
ALTER TABLE `tm_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tm_fakultas`
--
ALTER TABLE `tm_fakultas`
  ADD PRIMARY KEY (`fakultas_id`);

--
-- Indexes for table `tm_jenis`
--
ALTER TABLE `tm_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tm_periode`
--
ALTER TABLE `tm_periode`
  ADD PRIMARY KEY (`periode_id`);

--
-- Indexes for table `tm_prodi`
--
ALTER TABLE `tm_prodi`
  ADD PRIMARY KEY (`prodi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembing`
--
ALTER TABLE `pembing`
  MODIFY `pembing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `pengajuan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_dsn`
--
ALTER TABLE `tb_dsn`
  MODIFY `id_dsn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_fileskripsi`
--
ALTER TABLE `tb_fileskripsi`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_forum`
--
ALTER TABLE `tb_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_info`
--
ALTER TABLE `tb_info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tm_doc`
--
ALTER TABLE `tm_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_fakultas`
--
ALTER TABLE `tm_fakultas`
  MODIFY `fakultas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_jenis`
--
ALTER TABLE `tm_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_periode`
--
ALTER TABLE `tm_periode`
  MODIFY `periode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tm_prodi`
--
ALTER TABLE `tm_prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `data_scientist`
--
CREATE DATABASE IF NOT EXISTS `data_scientist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `data_scientist`;

-- --------------------------------------------------------

--
-- Table structure for table `mytable`
--

CREATE TABLE `mytable` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `numberrange` mediumint(9) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mytable`
--

INSERT INTO `mytable` (`id`, `name`, `phone`, `email`, `currency`, `numberrange`, `region`, `country`) VALUES
(1, 'Salvador Dickson', '(534) 423-5196', 'quis.lectus@hotmail.net', '$80.45', 1, 'Vienna', 'Austria'),
(2, 'Oscar Blair', '1-654-215-7514', 'euismod.ac@aol.edu', '$50.04', 9, 'West-Vlaanderen', 'Canada'),
(3, 'Dante Mclaughlin', '1-847-791-8234', 'vel.vulputate@outlook.com', '$96.95', 9, 'Xīnán', 'Netherlands'),
(4, 'Carter Bullock', '1-358-131-8575', 'nulla.ante.iaculis@outlook.edu', '$32.08', 8, 'Sikkim', 'Pakistan'),
(5, 'Philip Harris', '1-212-651-7788', 'ac.metus@outlook.ca', '$6.15', 6, 'Ulster', 'Peru');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mytable`
--
ALTER TABLE `mytable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mytable`
--
ALTER TABLE `mytable`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `laravel_db`
--
CREATE DATABASE IF NOT EXISTS `laravel_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_db`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembing`
--

CREATE TABLE `pembing` (
  `pembing_id` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `dosen` int(11) NOT NULL,
  `tanggapan` text DEFAULT NULL,
  `kesediaan` varchar(30) NOT NULL DEFAULT 'new',
  `jenis` int(11) NOT NULL,
  `status_bimbingan` enum('selesai','proses','new') NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembing`
--

INSERT INTO `pembing` (`pembing_id`, `periode`, `id_mhs`, `pengajuan_id`, `create_at`, `dosen`, `tanggapan`, `kesediaan`, `jenis`, `status_bimbingan`) VALUES
(3, 3, 1, 1, '2022-04-01 16:53:57', 2, NULL, 'Y', 2, 'proses'),
(5, 3, 3, 3, '2022-08-30 16:11:45', 3, NULL, 'Y', 1, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `pengajuan_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `tgl_pengajuan` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `revisi_judul` varchar(255) DEFAULT NULL,
  `stt_revisi` varchar(30) DEFAULT NULL,
  `masalah` text NOT NULL,
  `rekomendasi_pa` varchar(30) DEFAULT 'new',
  `tgl_rekomendasi` datetime DEFAULT NULL,
  `disetujui_kajur` varchar(30) DEFAULT 'new',
  `tgl_acc` datetime DEFAULT NULL,
  `tgl_pengajuan_sk` date DEFAULT NULL,
  `alasan_perpanjangan_sk` text DEFAULT NULL,
  `status_bimbingan` varchar(60) DEFAULT NULL,
  `status_perpanjangan_sk` varchar(30) DEFAULT NULL,
  `status_sk` varchar(30) DEFAULT 'old'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`pengajuan_id`, `periode_id`, `id_mhs`, `tgl_pengajuan`, `judul`, `jenis`, `revisi_judul`, `stt_revisi`, `masalah`, `rekomendasi_pa`, `tgl_rekomendasi`, `disetujui_kajur`, `tgl_acc`, `tgl_pengajuan_sk`, `alasan_perpanjangan_sk`, `status_bimbingan`, `status_perpanjangan_sk`, `status_sk`) VALUES
(1, 3, 1, '2022-04-01 16:52:32', 'Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web', 'Hardware/ dan Software', '', 'N', '<p>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br>Perancangan Aplikasi Bimbingan Skripsi Online Berbasis Web<br></p>', 'Y', '2022-04-01 16:54:24', 'Y', '2022-04-01 16:52:47', NULL, NULL, NULL, NULL, 'old'),
(2, 3, 2, '2022-08-23 15:21:02', 'Sistem 1', 'Hardware/ dan Software', NULL, NULL, '<p>Aakak</p>', 'N', '2022-08-23 15:22:15', 'Y', '2022-08-30 15:51:04', NULL, NULL, NULL, NULL, 'old'),
(3, 3, 3, '2022-08-30 15:35:42', '', 'Studi Literatur/ Pengkajian / Analisa', 'Water Availability Analysis Of Walanae River', 'Y', '<p>Lorem ipsum</p>', 'new', NULL, 'Y', '2022-08-30 15:43:01', '2022-08-30', '', 'BAB IV', 'Y', 'New'),
(4, 3, 5, '2022-08-30 17:13:18', 'Uji Kualitas Tanah', 'Studi Literatur/ Pengkajian / Analisa', NULL, NULL, '<p>Ada deh</p>', 'Y', '2022-08-30 17:43:29', 'Y', '2022-08-30 17:15:09', NULL, NULL, NULL, NULL, 'old');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL,
  `id_pesan` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_tipe` enum('mhs','dsn') DEFAULT NULL,
  `tipe_pesan` enum('R','S') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_admin` varchar(40) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `username`, `password`, `nama_admin`, `img`, `status`) VALUES
(1, 'admin@bimta', '4ec41ba09f61c69df5655095987c8246b237cde3', 'Fahad Abdul Aziz', 'user.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dsn`
--

CREATE TABLE `tb_dsn` (
  `id_dsn` int(11) NOT NULL,
  `nip` varchar(21) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `foto` varchar(225) NOT NULL DEFAULT 'user.png',
  `stt_akun` varchar(12) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_dsn`
--

INSERT INTO `tb_dsn` (`id_dsn`, `nip`, `nama_dosen`, `jabatan`, `password`, `foto`, `stt_akun`) VALUES
(1, '123', 'Dr. Poppy Yendriani, M.Pd', 'Dosen', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'user.png', 'Y'),
(2, '456', 'Prof, Dr. Adam El-Fathan, M.Sc', 'Rektor', '51eac6b471a284d3341d8c0c63d0f1a286262a18', '456_1648821591.png', 'Y'),
(3, '0011128502', 'Nurfitriana, S.Pd', 'Lektor', '4983cb3bc94f219c4984224371387ad029ede47d', 'user.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fileskripsi`
--

CREATE TABLE `tb_fileskripsi` (
  `id_file` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `nama_file` varchar(225) NOT NULL,
  `tgl_upload` datetime NOT NULL,
  `tipe_file` varchar(10) NOT NULL,
  `ukuran_file` varchar(20) NOT NULL,
  `file` varchar(255) NOT NULL,
  `doc` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_fileskripsi`
--

INSERT INTO `tb_fileskripsi` (`id_file`, `id_mhs`, `pengajuan_id`, `nama_file`, `tgl_upload`, `tipe_file`, `ukuran_file`, `file`, `doc`) VALUES
(1, 1, 1, 'SK DOSEN', '2022-04-01 16:57:35', 'doc', '0', 'nofile', 'https://docs.google.com/document/d/1hDZRSOr8B5X7FPvf5teM-NGYl7ucQJuE6rS5bhegaOc/edit?usp=sharing');

-- --------------------------------------------------------

--
-- Table structure for table `tb_forum`
--

CREATE TABLE `tb_forum` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_id_to` int(11) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL COMMENT 'mhs,dsn',
  `pesan` longtext DEFAULT NULL,
  `reply_to` varchar(11) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `wkt` datetime DEFAULT current_timestamp(),
  `pesan_status` varchar(30) DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_forum`
--

INSERT INTO `tb_forum` (`id`, `kode`, `user_id`, `user_id_to`, `user_type`, `pesan`, `reply_to`, `document`, `wkt`, `pesan_status`) VALUES
(1, 'DSN-1648806536', 2, 1, 'dsn', '&lt;p&gt;Hai &lt;b&gt;Hamiatul&lt;/b&gt; ?&lt;/p&gt;', '', 'nofile', '2022-04-01 16:49:13', 'Y'),
(2, 'DSN-1648806536', 1, 2, 'mhs', '&lt;p&gt;Halo pak, selamat siang ?&lt;/p&gt;', '1', 'nofile', '2022-04-01 16:49:50', 'Y'),
(3, 'DSN-1648806536', 2, 1, 'dsn', '&lt;p&gt;Siang&lt;/p&gt;', '2', 'nofile', '2022-04-01 16:51:09', 'Y'),
(4, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Cek&lt;/p&gt;', '', 'nofile', '2022-08-30 06:18:40', 'Y'),
(5, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Hai&lt;br&gt;&lt;/p&gt;', '', 'nofile', '2022-09-01 02:59:56', 'Y'),
(6, 'DSN-1661854626', 3, 5, 'dsn', '&lt;p&gt;Cek&lt;/p&gt;', '', 'nofile', '2022-12-26 08:00:21', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `tb_info`
--

CREATE TABLE `tb_info` (
  `info_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_info`
--

INSERT INTO `tb_info` (`info_id`, `judul`, `isi`) VALUES
(1, 'Jumlah SKS', 'Minimal 140 SKS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mhs`
--

CREATE TABLE `tb_mhs` (
  `id_mhs` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tmp_lahir` varchar(60) DEFAULT NULL,
  `tg_lahir` date DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `fotomhs` varchar(225) NOT NULL DEFAULT 'user.png',
  `tahun_angkatan` int(30) NOT NULL,
  `prodi_id` int(11) NOT NULL,
  `dosen_pa` int(11) NOT NULL DEFAULT 0,
  `status_akun` varchar(12) NOT NULL DEFAULT 'new',
  `status_skripsi` varchar(30) NOT NULL DEFAULT 'N',
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_mhs`
--

INSERT INTO `tb_mhs` (`id_mhs`, `nim`, `nama`, `tmp_lahir`, `tg_lahir`, `password`, `fotomhs`, `tahun_angkatan`, `prodi_id`, `dosen_pa`, `status_akun`, `status_skripsi`, `create_at`) VALUES
(1, '001', 'Hamiatul Asmawati', NULL, NULL, 'e193a01ecf8d30ad0affefd332ce934e32ffce72', 'user.png', 2013, 2, 2, 'Y', 'N', '2022-04-01 16:46:36'),
(2, '009', 'hufgweyg', NULL, NULL, '19b3f0ed02e60c8bae808b496b3cce99dc8f9e69', 'user.png', 2013, 1, 1, 'Y', 'N', '2022-06-13 17:57:35'),
(3, '123', 'ITS', 'Wotu', '1970-01-01', '7c222fb2927d828af22f592134e8932480637c0d', 'user.png', 2017, 2, 2, 'Y', 'N', '2022-08-30 15:19:32'),
(4, '12345', 'Andi', NULL, NULL, '8cb2237d0679ca88db6464eac60da96345513964', 'user.png', 2018, 2, 0, 'N', 'N', '2022-08-30 17:04:08'),
(5, '123456', 'Asis', NULL, NULL, '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user.png', 2018, 2, 3, 'Y', 'N', '2022-08-30 17:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `pengirim_id` int(11) NOT NULL,
  `user_pengirim` enum('mhs','dsn') NOT NULL,
  `penerima_id` int(11) NOT NULL,
  `user_penerima` enum('mhs','dsn') NOT NULL,
  `topik` varchar(255) NOT NULL,
  `subyek` text NOT NULL,
  `isi_pesan` longtext DEFAULT NULL,
  `document` varchar(255) NOT NULL DEFAULT 'nofile',
  `pembing_id` int(11) DEFAULT NULL,
  `jenis_pemb` int(11) DEFAULT NULL,
  `wkt` datetime DEFAULT NULL,
  `status_pesan` varchar(15) NOT NULL DEFAULT 'new',
  `reply_to` int(11) DEFAULT NULL COMMENT 'Untuk menampung id pesan yg dibalas, jika ada',
  `tahun_bimbingan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `pengajuan_id`, `pengirim_id`, `user_pengirim`, `penerima_id`, `user_penerima`, `topik`, `subyek`, `isi_pesan`, `document`, `pembing_id`, `jenis_pemb`, `wkt`, `status_pesan`, `reply_to`, `tahun_bimbingan`) VALUES
(1, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648806979', 'Bimbingan 1', '&lt;p&gt;Harap Lampirkan Dokumen pendukung&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 16:56:19', 'Y', NULL, 3),
(2, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648821173', 'BIMBINGAN 2', '&lt;p&gt;BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2BIMBINGAN 2&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:52:53', 'Y', NULL, 3),
(3, 1, 2, 'dsn', 1, 'mhs', 'DSN-TOPIK-1648821188', 'BIMBINGAN 3', '&lt;p&gt;BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:53:08', 'Y', NULL, 3),
(4, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648806979', 'Bimbingan 1', '&lt;p&gt;Baik Prof&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:11', 'new', 1, 3),
(5, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648821173', 'BIMBINGAN 2', '&lt;p&gt;Oke&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:24', 'new', 2, 3),
(6, 1, 1, 'mhs', 1, 'dsn', 'DSN-TOPIK-1648821188', 'BIMBINGAN 3', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.5);&quot;&gt;BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3BIMBINGAN 3&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'nofile', 3, 2, '2022-04-01 20:55:37', 'new', 3, 3),
(7, 3, 3, 'dsn', 3, 'mhs', 'DSN-TOPIK-1661850941', 'Revisi', '&lt;p&gt;Latar belakang masih belum menggambarkan masalahnutama yang ingin diteliti.&lt;/p&gt;', 'nofile', 5, 1, '2022-08-30 16:15:41', 'Y', NULL, 3),
(8, 3, 3, 'dsn', 3, 'mhs', 'DSN-TOPIK-1661850941', 'Revisi', '&lt;p&gt;Kok blm direvisi jg?&lt;/p&gt;', 'nofile', 5, 1, '2022-08-30 16:38:28', 'new', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tm_doc`
--

CREATE TABLE `tm_doc` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_doc`
--

INSERT INTO `tm_doc` (`id`, `file_name`) VALUES
(1, 'Tess'),
(2, 'tmuhdywq');

-- --------------------------------------------------------

--
-- Table structure for table `tm_fakultas`
--

CREATE TABLE `tm_fakultas` (
  `fakultas_id` int(11) NOT NULL,
  `fakultas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_fakultas`
--

INSERT INTO `tm_fakultas` (`fakultas_id`, `fakultas`) VALUES
(1, 'ILMU KOMPUTER'),
(2, 'ILMU PENDIDIKAN');

-- --------------------------------------------------------

--
-- Table structure for table `tm_jenis`
--

CREATE TABLE `tm_jenis` (
  `id` int(11) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_jenis`
--

INSERT INTO `tm_jenis` (`id`, `jenis`) VALUES
(1, 'Hardware/ dan Software'),
(2, 'Studi Literatur/ Pengkajian / Analisa');

-- --------------------------------------------------------

--
-- Table structure for table `tm_periode`
--

CREATE TABLE `tm_periode` (
  `periode_id` int(11) NOT NULL,
  `th_periode` varchar(20) DEFAULT NULL,
  `stt_periode` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_periode`
--

INSERT INTO `tm_periode` (`periode_id`, `th_periode`, `stt_periode`) VALUES
(3, '2021/2022', 'on'),
(4, '2022/2023', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tm_prodi`
--

CREATE TABLE `tm_prodi` (
  `prodi_id` int(11) NOT NULL,
  `fakultas_id` int(11) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `konsen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tm_prodi`
--

INSERT INTO `tm_prodi` (`prodi_id`, `fakultas_id`, `prodi`, `konsen`) VALUES
(1, 1, 'Teknik Informatika', 'Webprogramming'),
(2, 1, 'Teknik Lingkungan Hidup', 'Teknik Lingkungan Hidup');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembing`
--
ALTER TABLE `pembing`
  ADD PRIMARY KEY (`pembing_id`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`pengajuan_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_dsn`
--
ALTER TABLE `tb_dsn`
  ADD PRIMARY KEY (`id_dsn`);

--
-- Indexes for table `tb_fileskripsi`
--
ALTER TABLE `tb_fileskripsi`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `tb_forum`
--
ALTER TABLE `tb_forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_info`
--
ALTER TABLE `tb_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tm_doc`
--
ALTER TABLE `tm_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tm_fakultas`
--
ALTER TABLE `tm_fakultas`
  ADD PRIMARY KEY (`fakultas_id`);

--
-- Indexes for table `tm_jenis`
--
ALTER TABLE `tm_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tm_periode`
--
ALTER TABLE `tm_periode`
  ADD PRIMARY KEY (`periode_id`);

--
-- Indexes for table `tm_prodi`
--
ALTER TABLE `tm_prodi`
  ADD PRIMARY KEY (`prodi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembing`
--
ALTER TABLE `pembing`
  MODIFY `pembing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `pengajuan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_dsn`
--
ALTER TABLE `tb_dsn`
  MODIFY `id_dsn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_fileskripsi`
--
ALTER TABLE `tb_fileskripsi`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_forum`
--
ALTER TABLE `tb_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_info`
--
ALTER TABLE `tb_info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tm_doc`
--
ALTER TABLE `tm_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_fakultas`
--
ALTER TABLE `tm_fakultas`
  MODIFY `fakultas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_jenis`
--
ALTER TABLE `tm_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tm_periode`
--
ALTER TABLE `tm_periode`
  MODIFY `periode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tm_prodi`
--
ALTER TABLE `tm_prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `malasngodig`
--
CREATE DATABASE IF NOT EXISTS `malasngodig` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `malasngodig`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `pass` varchar(70) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `pass`, `foto`) VALUES
(8, 'wakandaforever', 'ac8e716318dac31f847866a5cb0aa38f', 'text.png');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `jenis` text NOT NULL,
  `suplier` text NOT NULL,
  `modal` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `jenis`, `suplier`, `modal`, `harga`, `jumlah`, `sisa`) VALUES
(14, 'roti unibis', 'makanan', 'pt.makamur jayaa', 5000, 6500, 350, 20),
(17, 'tim tam', 'makanan ringan', 'pt surga', 2000, 6000, 792, 10),
(19, 'tic tac', 'makanan ringan', 'pt sido multp', 2000, 4000, 2, 24),
(20, 'aqua sedang', 'minuman ringan', 'pt jamaika', 1000, 3000, 990, 1000),
(21, 'makkkanan', 'makanan ringan', 'pt surya', 2000, 4000, 894, 900),
(22, 'makkkanan', 'makanan ringan', 'pt surya', 2000, 4000, 894, 900),
(23, 'magnum', 'rokok', 'pt surga', 12000, 13000, 997, 1000),
(24, 'santri mie', 'makanan ringan', 'pt sido mulyo', 2000, 4000, 784, 800),
(25, 'rambut palsu', 'accesories', 'pt ptan', 3000, 5000, 496, 500),
(26, 'rambut palsu', 'accesories', 'pt ptan', 3000, 5000, 496, 500),
(27, 'sea foog', 'makanan ringan', 'pt surga', 4000, 60000, 598, 600),
(28, 'mild', 'rokok', 'pt sampoerna', 15000, 17000, 192, 200),
(29, 'dji sam soe', 'rokok', 'pt ptan', 14000, 15000, 145, 150),
(30, 'nu mild', 'rokok', 'pt ptan', 14000, 15000, 144, 150),
(31, 'nu mild', 'rokok', 'pt ptan', 14000, 15000, 144, 150),
(32, 'roti', 'makanan', 'hdhnhnhh', 2000, 5000, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `barang_laku`
--

CREATE TABLE `barang_laku` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total_harga` int(20) NOT NULL,
  `laba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang_laku`
--

INSERT INTO `barang_laku` (`id`, `tanggal`, `nama`, `jumlah`, `harga`, `total_harga`, `laba`) VALUES
(46, '2015-02-01', 'roti unibis', 2, 6000, 12000, 2000),
(47, '2015-02-02', 'makkkanan', 7, 12000, 84000, 70000),
(48, '2015-02-02', 'dji sam soe', 2, 15000, 30000, 2000),
(49, '2015-02-03', 'makkkanan', 1, 12000, 12000, 10000),
(50, '2015-02-01', 'tim tam', 2, 4000, 8000, 4000),
(51, '2015-02-02', 'mild', 2, 17000, 34000, 4000),
(52, '2015-02-03', 'magnum', 1, 18000, 18000, 6000),
(53, '2015-02-06', 'dji sam soe', 2, 19000, 38000, 10000),
(54, '2015-02-15', 'nu mild', 2, 19100, 38200, 10200),
(55, '2015-02-27', 'roti unibis', 2, 8000, 16000, 6000),
(56, '2015-02-19', 'roti unibis', 1, 7000, 7000, 2000),
(57, '2015-01-14', 'roti unibis', 1, 7000, 7000, 2000),
(58, '2015-02-01', 'pulpen', 1, 3000, 3000, 2000),
(59, '2015-02-02', 'roti', 2, 3000, 6000, 2000),
(63, '2016-01-22', 'tic tac', 8, 4000, 32000, 16000);

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keperluan` text NOT NULL,
  `nama` text NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `tanggal`, `keperluan`, `nama`, `jumlah`) VALUES
(1, '2015-02-06', 'de', 'diki', 1234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_laku`
--
ALTER TABLE `barang_laku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `barang_laku`
--
ALTER TABLE `barang_laku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `p`
--
CREATE DATABASE IF NOT EXISTS `p` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `p`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `pass`) VALUES
(1, 'wakanda', 'ac8e716318dac31f847866a5cb0aa38f');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` char(3) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `desc_barang` longtext NOT NULL,
  `image_barang` varchar(1000) NOT NULL,
  `harga` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `desc_barang`, `image_barang`, `harga`) VALUES
('001', 'montor', '0000', '001wakanda.png', '2000000.00'),
('002', 'HONDA', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '002Screenshot (33).png', '12000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kasir`
--

CREATE TABLE `tb_kasir` (
  `id_kasir` char(3) NOT NULL,
  `nama_kasir` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `no_transaksi` char(4) NOT NULL,
  `id_kasir` char(4) NOT NULL,
  `sub_total` decimal(19,2) NOT NULL,
  `diskon` decimal(19,2) NOT NULL,
  `grand_total` decimal(19,2) NOT NULL,
  `bayar` decimal(19,2) NOT NULL,
  `kembali` decimal(19,2) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_detail`
--

CREATE TABLE `tb_transaksi_detail` (
  `no_transaksi_detail` char(4) NOT NULL,
  `no_transaksi` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_kasir`
--
ALTER TABLE `tb_kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_kasir_2` (`id_kasir`);

--
-- Indexes for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD PRIMARY KEY (`no_transaksi_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`,`id_barang`),
  ADD KEY `no_transaksi_2` (`no_transaksi`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_kasir`) REFERENCES `tb_kasir` (`id_kasir`) ON DELETE CASCADE;

--
-- Constraints for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD CONSTRAINT `tb_transaksi_detail_ibfk_1` FOREIGN KEY (`no_transaksi`) REFERENCES `tb_transaksi` (`no_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_transaksi_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tugasakhir\",\"table\":\"tb_mahasiswa\"},{\"db\":\"tugasakhir\",\"table\":\"tb_dosen\"},{\"db\":\"tugasakhir\",\"table\":\"user\"},{\"db\":\"data_scientist\",\"table\":\"mytable\"},{\"db\":\"aa\",\"table\":\"tb_transaksi_detail\"},{\"db\":\"wakanda\",\"table\":\"tb_transaksi_detail\"},{\"db\":\"wakanda\",\"table\":\"tb_transaksi\"},{\"db\":\"wakanda\",\"table\":\"tb_kasir\"},{\"db\":\"wakanda\",\"table\":\"tb_barang\"},{\"db\":\"wakanda\",\"table\":\"admin\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-01-19 12:07:23', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `product`
--
CREATE DATABASE IF NOT EXISTS `product` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `product`;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`) VALUES
(1, 'Rug', 'A cool rug'),
(2, 'Cup', 'A coffee cup');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_detail_id` int(11) NOT NULL,
  `product_Variants_id` int(11) DEFAULT NULL,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_detail_id`, `product_Variants_id`, `value_id`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 1),
(4, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `product_Variants_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `productVariantName` varchar(50) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`product_Variants_id`, `product_id`, `productVariantName`, `sku`, `price`) VALUES
(1, 1, 'red-wool', 'a121', 50),
(2, 1, 'red-polyester', 'a122', 50);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `variant_id` int(11) NOT NULL,
  `variant` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`variant_id`, `variant`) VALUES
(1, 'color'),
(2, 'material'),
(3, 'size');

-- --------------------------------------------------------

--
-- Table structure for table `variant_value`
--

CREATE TABLE `variant_value` (
  `value_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variant_value`
--

INSERT INTO `variant_value` (`value_id`, `variant_id`, `value`) VALUES
(1, 1, 'red'),
(2, 1, 'blue'),
(3, 1, 'green'),
(4, 2, 'wool'),
(5, 2, 'polyester'),
(6, 3, 'small'),
(7, 3, 'medium'),
(8, 3, 'large');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_detail_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`product_Variants_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `variant_value`
--
ALTER TABLE `variant_value`
  ADD PRIMARY KEY (`value_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `product_Variants_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variant_value`
--
ALTER TABLE `variant_value`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tugasakhir`
--
CREATE DATABASE IF NOT EXISTS `tugasakhir` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tugasakhir`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(2) NOT NULL,
  `semester` varchar(5) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `waktu` datetime NOT NULL,
  `namadosen` varchar(50) NOT NULL,
  `catatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'dosen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `wakanda`
--
CREATE DATABASE IF NOT EXISTS `wakanda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wakanda`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `pass`) VALUES
(1, 'wakanda', 'ac8e716318dac31f847866a5cb0aa38f');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` char(3) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `desc_barang` longtext NOT NULL,
  `image_barang` varchar(1000) NOT NULL,
  `harga` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `desc_barang`, `image_barang`, `harga`) VALUES
('001', 'montor', '0000', '001wakanda.png', '2000000.00'),
('002', 'HONDA', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '002Screenshot (33).png', '12000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kasir`
--

CREATE TABLE `tb_kasir` (
  `id_kasir` char(3) NOT NULL,
  `nama_kasir` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `no_transaksi` char(4) NOT NULL,
  `id_kasir` char(4) NOT NULL,
  `sub_total` decimal(19,2) NOT NULL,
  `diskon` decimal(19,2) NOT NULL,
  `grand_total` decimal(19,2) NOT NULL,
  `bayar` decimal(19,2) NOT NULL,
  `kembali` decimal(19,2) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_detail`
--

CREATE TABLE `tb_transaksi_detail` (
  `no_transaksi_detail` char(4) NOT NULL,
  `no_transaksi` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_kasir`
--
ALTER TABLE `tb_kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_kasir_2` (`id_kasir`);

--
-- Indexes for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD PRIMARY KEY (`no_transaksi_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`,`id_barang`),
  ADD KEY `no_transaksi_2` (`no_transaksi`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_kasir`) REFERENCES `tb_kasir` (`id_kasir`) ON DELETE CASCADE;

--
-- Constraints for table `tb_transaksi_detail`
--
ALTER TABLE `tb_transaksi_detail`
  ADD CONSTRAINT `tb_transaksi_detail_ibfk_1` FOREIGN KEY (`no_transaksi`) REFERENCES `tb_transaksi` (`no_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_transaksi_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
