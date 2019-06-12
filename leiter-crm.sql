-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2019 at 03:37 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leiter-crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_person`
--

CREATE TABLE `contact_person` (
  `id_cp` int(11) NOT NULL,
  `nama_cp` varchar(100) NOT NULL DEFAULT '-',
  `jk_cp` varchar(2) NOT NULL DEFAULT '-',
  `email_cp` varchar(100) NOT NULL DEFAULT '-',
  `nohp_cp` varchar(15) NOT NULL DEFAULT '-',
  `jabatan_cp` varchar(100) NOT NULL DEFAULT '-',
  `status_cp` int(11) NOT NULL DEFAULT '0',
  `id_perusahaan` int(11) DEFAULT NULL,
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_cp_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_cp_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_cp_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_person`
--

INSERT INTO `contact_person` (`id_cp`, `nama_cp`, `jk_cp`, `email_cp`, `nohp_cp`, `jabatan_cp`, `status_cp`, `id_perusahaan`, `id_user_add`, `date_cp_add`, `id_user_edit`, `date_cp_edit`, `id_user_delete`, `date_cp_delete`) VALUES
(30, 'Anthony', 'Mr', 'anthony_jasman@hotmail.com', '0811 855 818', 'Marketing', 0, 18, 11, '2019-06-11 23:33:10', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(31, 'Suwandi', 'Mr', 'suwandi@gmail.com', '0877648947488', 'Marketing', 0, 19, 11, '2019-06-11 23:56:55', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(32, 'Liu', 'Mr', 'Liu@gmail.com', '', 'Marketing', 0, 18, 11, '2019-06-12 00:00:19', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(33, 'Celine Kow', 'Ms', 'celine@sefar.com', '', '', 0, 20, 11, '2019-06-12 09:41:26', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(34, 'Selahattin Sahin', 'Mr', 'ssahin@ugurgrubu.com', '089677898878', 'Marketing', 1, 20, 11, '2019-06-12 09:45:04', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00'),
(35, 'Vivian Beh', 'Ms', 'vivian.beh@cargo-partner.com', '0808089988', 'CEO', 0, 21, 11, '2019-06-12 13:56:46', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(36, 'Emily', 'Ms', 'emily@penanshin.com.sg', '0808080808', 'CEO', 1, 21, 11, '2019-06-12 14:01:29', 0, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `finance_usage_type`
--

CREATE TABLE `finance_usage_type` (
  `id_type` int(11) NOT NULL,
  `variable_type` varchar(200) NOT NULL DEFAULT '-',
  `usage_type` varchar(200) NOT NULL DEFAULT '-',
  `name_type` varchar(200) NOT NULL DEFAULT '-',
  `status_type` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_type_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_type_edit` datetime DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_type_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `finance_usage_type`
--

INSERT INTO `finance_usage_type` (`id_type`, `variable_type`, `usage_type`, `name_type`, `status_type`, `id_user_add`, `date_type_add`, `id_user_edit`, `date_type_edit`, `id_user_delete`, `date_type_delete`) VALUES
(1, 'EXPANSE', 'BANK', 'Reimburse', 1, 11, '2019-06-12 01:36:45', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(2, 'INCOME', 'BANK', 'Bunga Bank', 1, 11, '2019-06-12 01:48:34', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `harga_vendor`
--

CREATE TABLE `harga_vendor` (
  `id_harga_vendor` int(11) NOT NULL,
  `id_request_item` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL COMMENT 'nahan value harganya pake ini aja karena 1 item 1 perusahaan sama',
  `id_cp` int(11) NOT NULL COMMENT 'merujuk pada vendor mana yang ditanya terkait barang tersebut',
  `harga_produk` int(11) NOT NULL,
  `satuan_harga_produk` int(11) NOT NULL DEFAULT '1',
  `vendor_price_rate` int(11) NOT NULL DEFAULT '1',
  `mata_uang` varchar(100) NOT NULL DEFAULT 'USD',
  `status_harga_vendor` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL,
  `date_harga_vendor_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_harga_vendor_edit` datetime DEFAULT NULL,
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_harga_vendor_delete` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga_vendor`
--

INSERT INTO `harga_vendor` (`id_harga_vendor`, `id_request_item`, `id_perusahaan`, `id_cp`, `harga_produk`, `satuan_harga_produk`, `vendor_price_rate`, `mata_uang`, `status_harga_vendor`, `id_user_add`, `date_harga_vendor_add`, `id_user_edit`, `date_harga_vendor_edit`, `id_user_delete`, `date_harga_vendor_delete`) VALUES
(5, 16, 0, 2, 1000000, 1010, 100, 'USD', 0, 11, '2019-05-15 03:21:23', 0, NULL, 0, NULL),
(10, 43, 0, 2, 20000, 1, 1500, 'USD', 0, 11, '2019-05-19 18:12:00', 0, NULL, 0, NULL),
(12, 43, 0, 9, 123000, 1, 12000, 'USD', 0, 11, '2019-05-19 19:10:26', 0, NULL, 0, NULL),
(13, 43, 0, 3, 111111, 1, 22223, 'USD', 0, 11, '2019-05-19 19:34:58', 0, NULL, 0, NULL),
(15, 42, 0, 3, 15400, 1, 21000, 'USD', 0, 11, '2019-05-19 19:35:24', 0, NULL, 0, NULL),
(16, 42, 0, 9, 14000, 1, 11000, 'USD', 0, 11, '2019-05-19 19:35:25', 0, NULL, 0, NULL),
(17, 42, 0, 2, 10000, 2, 12000, 'USD', 0, 11, '2019-05-26 21:43:39', 0, NULL, 0, NULL),
(21, 47, 4, 17, 13000000, 1, 120, 'USD', 10, 11, '2019-06-03 01:24:58', 0, NULL, 0, NULL),
(24, 47, 3, 16, 12000, 2, 10000, 'USD', 0, 11, '2019-06-03 02:22:33', 0, NULL, 0, NULL),
(25, 48, 15, 25, 15000, 1, 10000, 'USD', 0, 11, '2019-06-03 02:28:49', 0, NULL, 0, NULL),
(26, 42, 3, 14, 120000, 1, 10000, 'USD', 0, 11, '2019-06-03 02:49:56', 0, NULL, 0, NULL),
(27, 42, 4, 3, 16000, 1, 1200, 'USD', 0, 11, '2019-06-03 02:50:53', 0, NULL, 0, NULL),
(28, 43, 3, 14, 15000, 1, 100, 'USD', 0, 11, '2019-06-03 02:51:23', 0, NULL, 0, NULL),
(29, 43, 4, 3, 16000, 1, 1400, 'USD', 0, 11, '2019-06-03 02:51:30', 0, NULL, 0, NULL),
(34, 50, 3, 14, 12000, 1, 10000, 'IDR', 0, 11, '2019-06-06 22:41:43', 0, NULL, 0, NULL),
(36, 50, 4, 3, 159000, 1, 100, 'EUR', 0, 11, '2019-06-06 22:46:55', 0, NULL, 0, NULL),
(38, 44, 15, 25, 12000, 1, 1000, 'IDR', 0, 11, '2019-06-07 00:43:16', 0, NULL, 0, NULL),
(39, 51, 3, 14, 12000, 1, 1, 'IDR', 0, 11, '2019-06-08 08:02:43', 0, NULL, 0, NULL),
(40, 51, 4, 3, 16000, 5, 14000, 'USD', 0, 11, '2019-06-08 08:03:01', 0, NULL, 0, NULL),
(41, 53, 3, 14, 120000, 1, 1000, 'USD', 0, 11, '2019-06-11 10:24:26', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_core`
--

CREATE TABLE `invoice_core` (
  `id_invoice` int(11) NOT NULL,
  `no_invoice` varchar(100) NOT NULL,
  `id_oc` int(11) NOT NULL,
  `use_od` int(11) NOT NULL COMMENT '1: ga pake od, 0 pake od',
  `id_od` int(11) NOT NULL DEFAULT '0' COMMENT '0 kalau ga pake od',
  `persen_pembayaran` int(11) NOT NULL,
  `nominal_pembayaran` int(11) NOT NULL,
  `kurs_pembayaran` int(11) NOT NULL DEFAULT '1',
  `mata_uang` int(10) NOT NULL,
  `status_lunas` int(11) NOT NULL DEFAULT '1' COMMENT '1: blum lunas, 0 lunas',
  `status_aktif_invoice` int(11) NOT NULL DEFAULT '1' COMMENT '1: blum aktif, 0 aktif',
  `id_user_add` int(11) NOT NULL,
  `tgl_invoice_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `tgl_invoice_edit` datetime DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `tgl_user_delete` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_privilage`
--

CREATE TABLE `log_privilage` (
  `id_log_privilage` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `status_privilage` int(11) NOT NULL,
  `id_user_edit` int(11) NOT NULL,
  `date_user_edit` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_privilage`
--

INSERT INTO `log_privilage` (`id_log_privilage`, `id_user`, `id_menu`, `status_privilage`, `id_user_edit`, `date_user_edit`) VALUES
(1, 11, 2, 1, 0, '2019-05-12 22:07:53'),
(2, 11, 3, 1, 0, '2019-05-12 22:07:53'),
(3, 12, 1, 1, 0, '2019-05-12 22:14:49'),
(4, 12, 2, 1, 0, '2019-05-12 22:14:49'),
(5, 12, 3, 1, 0, '2019-05-12 22:14:49'),
(6, 12, 1, 0, 0, '2019-05-12 22:15:27'),
(7, 11, 4, 1, 0, '2019-05-13 13:15:50'),
(8, 12, 4, 1, 0, '2019-05-13 13:15:50'),
(9, 11, 5, 1, 0, '2019-05-13 13:15:50'),
(10, 12, 5, 1, 0, '2019-05-13 13:15:50'),
(11, 11, 6, 1, 0, '2019-05-13 13:15:50'),
(12, 12, 6, 1, 0, '2019-05-13 13:15:50'),
(13, 11, 7, 1, 0, '2019-05-13 13:15:50'),
(14, 12, 7, 1, 0, '2019-05-13 13:15:50'),
(15, 11, 8, 1, 0, '2019-05-13 13:15:50'),
(16, 12, 8, 1, 0, '2019-05-13 13:15:50'),
(17, 11, 9, 1, 0, '2019-05-13 13:15:50'),
(18, 12, 9, 1, 0, '2019-05-13 13:15:50'),
(19, 11, 10, 1, 0, '2019-05-13 13:15:50'),
(20, 12, 10, 1, 0, '2019-05-13 13:15:50'),
(21, 11, 11, 1, 0, '2019-05-13 13:15:50'),
(22, 12, 11, 1, 0, '2019-05-13 13:15:50'),
(23, 13, 1, 1, 0, '2019-05-13 14:37:41'),
(24, 13, 2, 1, 0, '2019-05-13 14:37:41'),
(25, 13, 3, 1, 0, '2019-05-13 14:37:41'),
(26, 13, 4, 1, 0, '2019-05-13 14:37:41'),
(27, 13, 5, 1, 0, '2019-05-13 14:37:41'),
(28, 13, 6, 1, 0, '2019-05-13 14:37:41'),
(29, 13, 7, 1, 0, '2019-05-13 14:37:41'),
(30, 13, 8, 1, 0, '2019-05-13 14:37:41'),
(31, 13, 9, 1, 0, '2019-05-13 14:37:41'),
(32, 13, 10, 1, 0, '2019-05-13 14:37:41'),
(33, 13, 11, 1, 0, '2019-05-13 14:37:41'),
(34, 14, 1, 1, 0, '2019-05-13 14:49:13'),
(35, 14, 2, 1, 0, '2019-05-13 14:49:13'),
(36, 14, 3, 1, 0, '2019-05-13 14:49:13'),
(37, 14, 4, 1, 0, '2019-05-13 14:49:13'),
(38, 14, 5, 1, 0, '2019-05-13 14:49:13'),
(39, 14, 6, 1, 0, '2019-05-13 14:49:13'),
(40, 14, 7, 1, 0, '2019-05-13 14:49:13'),
(41, 14, 8, 1, 0, '2019-05-13 14:49:13'),
(42, 14, 9, 1, 0, '2019-05-13 14:49:13'),
(43, 14, 10, 1, 0, '2019-05-13 14:49:13'),
(44, 14, 11, 1, 0, '2019-05-13 14:49:13'),
(45, 15, 1, 1, 0, '2019-05-13 14:50:06'),
(46, 15, 2, 1, 0, '2019-05-13 14:50:06'),
(47, 15, 3, 1, 0, '2019-05-13 14:50:06'),
(48, 15, 4, 1, 0, '2019-05-13 14:50:06'),
(49, 15, 5, 1, 0, '2019-05-13 14:50:06'),
(50, 15, 6, 1, 0, '2019-05-13 14:50:06'),
(51, 15, 7, 1, 0, '2019-05-13 14:50:06'),
(52, 15, 8, 1, 0, '2019-05-13 14:50:06'),
(53, 15, 9, 1, 0, '2019-05-13 14:50:06'),
(54, 15, 10, 1, 0, '2019-05-13 14:50:06'),
(55, 15, 11, 1, 0, '2019-05-13 14:50:06'),
(56, 16, 1, 1, 0, '2019-05-13 14:50:40'),
(57, 16, 2, 1, 0, '2019-05-13 14:50:40'),
(58, 16, 3, 1, 0, '2019-05-13 14:50:40'),
(59, 16, 4, 1, 0, '2019-05-13 14:50:40'),
(60, 16, 5, 1, 0, '2019-05-13 14:50:40'),
(61, 16, 6, 1, 0, '2019-05-13 14:50:40'),
(62, 16, 7, 1, 0, '2019-05-13 14:50:40'),
(63, 16, 8, 1, 0, '2019-05-13 14:50:40'),
(64, 16, 9, 1, 0, '2019-05-13 14:50:40'),
(65, 16, 10, 1, 0, '2019-05-13 14:50:40'),
(66, 16, 11, 1, 0, '2019-05-13 14:50:40'),
(67, 17, 1, 1, 0, '2019-05-13 14:50:48'),
(68, 17, 2, 1, 0, '2019-05-13 14:50:48'),
(69, 17, 3, 1, 0, '2019-05-13 14:50:48'),
(70, 17, 4, 1, 0, '2019-05-13 14:50:48'),
(71, 17, 5, 1, 0, '2019-05-13 14:50:48'),
(72, 17, 6, 1, 0, '2019-05-13 14:50:48'),
(73, 17, 7, 1, 0, '2019-05-13 14:50:48'),
(74, 17, 8, 1, 0, '2019-05-13 14:50:48'),
(75, 17, 9, 1, 0, '2019-05-13 14:50:48'),
(76, 17, 10, 1, 0, '2019-05-13 14:50:48'),
(77, 17, 11, 1, 0, '2019-05-13 14:50:48'),
(78, 18, 1, 1, 0, '2019-05-13 14:51:02'),
(79, 18, 2, 1, 0, '2019-05-13 14:51:02'),
(80, 18, 3, 1, 0, '2019-05-13 14:51:02'),
(81, 18, 4, 1, 0, '2019-05-13 14:51:02'),
(82, 18, 5, 1, 0, '2019-05-13 14:51:02'),
(83, 18, 6, 1, 0, '2019-05-13 14:51:02'),
(84, 18, 7, 1, 0, '2019-05-13 14:51:02'),
(85, 18, 8, 1, 0, '2019-05-13 14:51:02'),
(86, 18, 9, 1, 0, '2019-05-13 14:51:02'),
(87, 18, 10, 1, 0, '2019-05-13 14:51:02'),
(88, 18, 11, 1, 0, '2019-05-13 14:51:02'),
(89, 19, 1, 1, 0, '2019-05-13 14:51:22'),
(90, 19, 2, 1, 0, '2019-05-13 14:51:22'),
(91, 19, 3, 1, 0, '2019-05-13 14:51:22'),
(92, 19, 4, 1, 0, '2019-05-13 14:51:22'),
(93, 19, 5, 1, 0, '2019-05-13 14:51:22'),
(94, 19, 6, 1, 0, '2019-05-13 14:51:22'),
(95, 19, 7, 1, 0, '2019-05-13 14:51:22'),
(96, 19, 8, 1, 0, '2019-05-13 14:51:22'),
(97, 19, 9, 1, 0, '2019-05-13 14:51:22'),
(98, 19, 10, 1, 0, '2019-05-13 14:51:22'),
(99, 19, 11, 1, 0, '2019-05-13 14:51:22'),
(100, 20, 1, 1, 0, '2019-05-13 14:51:48'),
(101, 20, 2, 1, 0, '2019-05-13 14:51:48'),
(102, 20, 3, 1, 0, '2019-05-13 14:51:48'),
(103, 20, 4, 1, 0, '2019-05-13 14:51:48'),
(104, 20, 5, 1, 0, '2019-05-13 14:51:48'),
(105, 20, 6, 1, 0, '2019-05-13 14:51:48'),
(106, 20, 7, 1, 0, '2019-05-13 14:51:48'),
(107, 20, 8, 1, 0, '2019-05-13 14:51:48'),
(108, 20, 9, 1, 0, '2019-05-13 14:51:48'),
(109, 20, 10, 1, 0, '2019-05-13 14:51:48'),
(110, 20, 11, 1, 0, '2019-05-13 14:51:48'),
(111, 21, 1, 1, 0, '2019-05-13 14:53:16'),
(112, 21, 2, 1, 0, '2019-05-13 14:53:16'),
(113, 21, 3, 1, 0, '2019-05-13 14:53:16'),
(114, 21, 4, 1, 0, '2019-05-13 14:53:16'),
(115, 21, 5, 1, 0, '2019-05-13 14:53:16'),
(116, 21, 6, 1, 0, '2019-05-13 14:53:16'),
(117, 21, 7, 1, 0, '2019-05-13 14:53:16'),
(118, 21, 8, 1, 0, '2019-05-13 14:53:16'),
(119, 21, 9, 1, 0, '2019-05-13 14:53:16'),
(120, 21, 10, 1, 0, '2019-05-13 14:53:16'),
(121, 21, 11, 1, 0, '2019-05-13 14:53:16'),
(122, 21, 6, 0, 11, '2019-05-13 14:53:16'),
(123, 21, 7, 0, 11, '2019-05-13 14:53:16'),
(124, 21, 8, 0, 11, '2019-05-13 14:53:16'),
(125, 21, 9, 0, 11, '2019-05-13 14:53:16'),
(126, 21, 1, 0, 11, '2019-05-13 14:53:16'),
(127, 21, 2, 0, 11, '2019-05-13 14:53:16'),
(128, 22, 1, 1, 0, '2019-05-13 14:54:20'),
(129, 22, 2, 1, 0, '2019-05-13 14:54:20'),
(130, 22, 3, 1, 0, '2019-05-13 14:54:20'),
(131, 22, 4, 1, 0, '2019-05-13 14:54:20'),
(132, 22, 5, 1, 0, '2019-05-13 14:54:20'),
(133, 22, 6, 1, 0, '2019-05-13 14:54:20'),
(134, 22, 7, 1, 0, '2019-05-13 14:54:20'),
(135, 22, 8, 1, 0, '2019-05-13 14:54:20'),
(136, 22, 9, 1, 0, '2019-05-13 14:54:20'),
(137, 22, 10, 1, 0, '2019-05-13 14:54:20'),
(138, 22, 11, 1, 0, '2019-05-13 14:54:20'),
(139, 22, 6, 0, 11, '2019-05-13 14:54:20'),
(140, 22, 8, 0, 11, '2019-05-13 14:54:21'),
(141, 22, 10, 0, 11, '2019-05-13 14:54:21'),
(142, 22, 1, 0, 11, '2019-05-13 14:54:21'),
(143, 22, 2, 0, 11, '2019-05-13 14:54:21'),
(144, 23, 1, 1, 0, '2019-05-13 15:00:39'),
(145, 23, 2, 1, 0, '2019-05-13 15:00:39'),
(146, 23, 3, 1, 0, '2019-05-13 15:00:39'),
(147, 23, 4, 1, 0, '2019-05-13 15:00:39'),
(148, 23, 5, 1, 0, '2019-05-13 15:00:39'),
(149, 23, 6, 1, 0, '2019-05-13 15:00:39'),
(150, 23, 7, 1, 0, '2019-05-13 15:00:39'),
(151, 23, 8, 1, 0, '2019-05-13 15:00:39'),
(152, 23, 9, 1, 0, '2019-05-13 15:00:39'),
(153, 23, 10, 1, 0, '2019-05-13 15:00:39'),
(154, 23, 11, 1, 0, '2019-05-13 15:00:39'),
(155, 23, 6, 0, 11, '2019-05-13 15:00:39'),
(156, 23, 8, 0, 11, '2019-05-13 15:00:39'),
(157, 23, 9, 0, 11, '2019-05-13 15:00:39'),
(158, 24, 1, 1, 0, '2019-05-23 08:32:34'),
(159, 24, 2, 1, 0, '2019-05-23 08:32:34'),
(160, 24, 3, 1, 0, '2019-05-23 08:32:34'),
(161, 24, 4, 1, 0, '2019-05-23 08:32:34'),
(162, 24, 5, 1, 0, '2019-05-23 08:32:34'),
(163, 24, 6, 1, 0, '2019-05-23 08:32:34'),
(164, 24, 7, 1, 0, '2019-05-23 08:32:34'),
(165, 24, 8, 1, 0, '2019-05-23 08:32:34'),
(166, 24, 9, 1, 0, '2019-05-23 08:32:34'),
(167, 24, 10, 1, 0, '2019-05-23 08:32:34'),
(168, 24, 11, 1, 0, '2019-05-23 08:32:34'),
(169, 24, 6, 0, 11, '2019-05-23 08:32:34'),
(170, 24, 9, 0, 11, '2019-05-23 08:32:34'),
(171, 24, 10, 0, 11, '2019-05-23 08:32:34'),
(172, 24, 11, 0, 11, '2019-05-23 08:32:35'),
(173, 24, 1, 0, 11, '2019-05-23 08:32:35'),
(174, 24, 2, 0, 11, '2019-05-23 08:32:35'),
(175, 25, 1, 1, 0, '2019-05-23 09:37:40'),
(176, 25, 2, 1, 0, '2019-05-23 09:37:40'),
(177, 25, 3, 1, 0, '2019-05-23 09:37:40'),
(178, 25, 4, 1, 0, '2019-05-23 09:37:40'),
(179, 25, 5, 1, 0, '2019-05-23 09:37:40'),
(180, 25, 6, 1, 0, '2019-05-23 09:37:40'),
(181, 25, 7, 1, 0, '2019-05-23 09:37:40'),
(182, 25, 8, 1, 0, '2019-05-23 09:37:40'),
(183, 25, 9, 1, 0, '2019-05-23 09:37:40'),
(184, 25, 10, 1, 0, '2019-05-23 09:37:40'),
(185, 25, 11, 1, 0, '2019-05-23 09:37:40'),
(186, 25, 4, 0, 11, '2019-05-23 09:37:41'),
(187, 25, 6, 0, 11, '2019-05-23 09:37:41'),
(188, 25, 8, 0, 11, '2019-05-23 09:37:41'),
(189, 25, 10, 0, 11, '2019-05-23 09:37:41'),
(190, 25, 2, 0, 11, '2019-05-23 09:37:41'),
(191, 11, 1, 1, 11, '2019-05-23 09:47:40'),
(192, 11, 2, 1, 11, '2019-05-23 09:47:40'),
(193, 11, 3, 1, 11, '2019-05-23 09:47:40'),
(194, 11, 4, 1, 11, '2019-05-23 09:47:40'),
(195, 11, 5, 1, 11, '2019-05-23 09:47:40'),
(196, 11, 6, 1, 11, '2019-05-23 09:47:40'),
(197, 11, 7, 1, 11, '2019-05-23 09:47:40'),
(198, 11, 8, 1, 11, '2019-05-23 09:47:40'),
(199, 11, 9, 1, 11, '2019-05-23 09:47:40'),
(200, 11, 10, 1, 11, '2019-05-23 09:47:40'),
(201, 11, 11, 1, 11, '2019-05-23 09:47:40'),
(202, 11, 9, 0, 11, '2019-05-23 09:47:40'),
(203, 11, 10, 0, 11, '2019-05-23 09:47:40'),
(204, 11, 11, 0, 11, '2019-05-23 09:47:40'),
(205, 11, 1, 0, 11, '2019-05-23 09:47:40'),
(206, 11, 2, 0, 11, '2019-05-23 09:47:40'),
(207, 23, 1, 1, 11, '2019-05-23 09:48:09'),
(208, 23, 2, 1, 11, '2019-05-23 09:48:09'),
(209, 23, 3, 1, 11, '2019-05-23 09:48:09'),
(210, 23, 4, 1, 11, '2019-05-23 09:48:09'),
(211, 23, 5, 1, 11, '2019-05-23 09:48:09'),
(212, 23, 6, 1, 11, '2019-05-23 09:48:09'),
(213, 23, 7, 1, 11, '2019-05-23 09:48:09'),
(214, 23, 8, 1, 11, '2019-05-23 09:48:09'),
(215, 23, 9, 1, 11, '2019-05-23 09:48:09'),
(216, 23, 10, 1, 11, '2019-05-23 09:48:09'),
(217, 23, 11, 1, 11, '2019-05-23 09:48:09'),
(218, 23, 4, 0, 11, '2019-05-23 09:48:09'),
(219, 23, 5, 0, 11, '2019-05-23 09:48:10'),
(220, 23, 1, 0, 11, '2019-05-23 09:48:10'),
(221, 23, 2, 0, 11, '2019-05-23 09:48:10'),
(222, 23, 3, 0, 11, '2019-05-23 09:48:10'),
(223, 25, 1, 1, 11, '2019-05-23 09:48:20'),
(224, 25, 2, 1, 11, '2019-05-23 09:48:20'),
(225, 25, 3, 1, 11, '2019-05-23 09:48:20'),
(226, 25, 4, 1, 11, '2019-05-23 09:48:20'),
(227, 25, 5, 1, 11, '2019-05-23 09:48:20'),
(228, 25, 6, 1, 11, '2019-05-23 09:48:20'),
(229, 25, 7, 1, 11, '2019-05-23 09:48:20'),
(230, 25, 8, 1, 11, '2019-05-23 09:48:20'),
(231, 25, 9, 1, 11, '2019-05-23 09:48:20'),
(232, 25, 10, 1, 11, '2019-05-23 09:48:20'),
(233, 25, 11, 1, 11, '2019-05-23 09:48:20'),
(234, 25, 4, 0, 11, '2019-05-23 09:48:20'),
(235, 25, 5, 0, 11, '2019-05-23 09:48:20'),
(236, 25, 6, 0, 11, '2019-05-23 09:48:20'),
(237, 25, 7, 0, 11, '2019-05-23 09:48:20'),
(238, 25, 8, 0, 11, '2019-05-23 09:48:20'),
(239, 25, 9, 0, 11, '2019-05-23 09:48:20'),
(240, 25, 10, 0, 11, '2019-05-23 09:48:20'),
(241, 25, 11, 0, 11, '2019-05-23 09:48:21'),
(242, 25, 1, 0, 11, '2019-05-23 09:48:21'),
(243, 25, 2, 0, 11, '2019-05-23 09:48:21'),
(244, 25, 3, 0, 11, '2019-05-23 09:48:21'),
(245, 26, 1, 1, 0, '2019-06-02 20:16:33'),
(246, 26, 2, 1, 0, '2019-06-02 20:16:33'),
(247, 26, 3, 1, 0, '2019-06-02 20:16:33'),
(248, 26, 4, 1, 0, '2019-06-02 20:16:33'),
(249, 26, 5, 1, 0, '2019-06-02 20:16:33'),
(250, 26, 6, 1, 0, '2019-06-02 20:16:33'),
(251, 26, 7, 1, 0, '2019-06-02 20:16:33'),
(252, 26, 8, 1, 0, '2019-06-02 20:16:33'),
(253, 26, 9, 1, 0, '2019-06-02 20:16:33'),
(254, 26, 10, 1, 0, '2019-06-02 20:16:33'),
(255, 26, 11, 1, 0, '2019-06-02 20:16:33'),
(256, 26, 4, 0, 11, '2019-06-02 20:16:33'),
(257, 26, 6, 0, 11, '2019-06-02 20:16:33'),
(258, 26, 8, 0, 11, '2019-06-02 20:16:33'),
(259, 26, 10, 0, 11, '2019-06-02 20:16:33'),
(260, 26, 1, 0, 11, '2019-06-02 20:16:33'),
(261, 26, 2, 0, 11, '2019-06-02 20:16:33'),
(262, 26, 3, 0, 11, '2019-06-02 20:16:33'),
(263, 26, 1, 1, 11, '2019-06-02 20:16:53'),
(264, 26, 2, 1, 11, '2019-06-02 20:16:53'),
(265, 26, 3, 1, 11, '2019-06-02 20:16:53'),
(266, 26, 4, 1, 11, '2019-06-02 20:16:53'),
(267, 26, 5, 1, 11, '2019-06-02 20:16:53'),
(268, 26, 6, 1, 11, '2019-06-02 20:16:53'),
(269, 26, 7, 1, 11, '2019-06-02 20:16:53'),
(270, 26, 8, 1, 11, '2019-06-02 20:16:53'),
(271, 26, 9, 1, 11, '2019-06-02 20:16:53'),
(272, 26, 10, 1, 11, '2019-06-02 20:16:53'),
(273, 26, 11, 1, 11, '2019-06-02 20:16:53'),
(274, 26, 5, 0, 11, '2019-06-02 20:16:54'),
(275, 26, 7, 0, 11, '2019-06-02 20:16:54'),
(276, 26, 9, 0, 11, '2019-06-02 20:16:54'),
(277, 26, 11, 0, 11, '2019-06-02 20:16:54'),
(278, 26, 1, 0, 11, '2019-06-02 20:16:54'),
(279, 26, 3, 0, 11, '2019-06-02 20:16:54'),
(280, 11, 1, 1, 0, '2019-06-12 14:25:08'),
(281, 11, 2, 1, 0, '2019-06-12 14:25:08'),
(282, 11, 3, 1, 0, '2019-06-12 14:25:08'),
(283, 11, 4, 1, 0, '2019-06-12 14:25:08'),
(284, 11, 5, 1, 0, '2019-06-12 14:25:08'),
(285, 11, 6, 1, 0, '2019-06-12 14:25:08'),
(286, 11, 7, 1, 0, '2019-06-12 14:25:08'),
(287, 11, 8, 1, 0, '2019-06-12 14:25:08'),
(288, 11, 9, 1, 0, '2019-06-12 14:25:08'),
(289, 11, 10, 1, 0, '2019-06-12 14:25:08'),
(290, 11, 11, 1, 0, '2019-06-12 14:25:08'),
(291, 27, 1, 1, 0, '2019-06-12 14:40:34'),
(292, 27, 2, 1, 0, '2019-06-12 14:40:34'),
(293, 27, 3, 1, 0, '2019-06-12 14:40:34'),
(294, 27, 4, 1, 0, '2019-06-12 14:40:34'),
(295, 27, 5, 1, 0, '2019-06-12 14:40:34'),
(296, 27, 6, 1, 0, '2019-06-12 14:40:34'),
(297, 27, 7, 1, 0, '2019-06-12 14:40:34'),
(298, 27, 8, 1, 0, '2019-06-12 14:40:34'),
(299, 27, 9, 1, 0, '2019-06-12 14:40:34'),
(300, 27, 10, 1, 0, '2019-06-12 14:40:34'),
(301, 27, 11, 1, 0, '2019-06-12 14:40:34'),
(302, 27, 5, 0, 11, '2019-06-12 14:40:34'),
(303, 27, 6, 0, 11, '2019-06-12 14:40:34'),
(304, 27, 7, 0, 11, '2019-06-12 14:40:34'),
(305, 27, 8, 0, 11, '2019-06-12 14:40:34'),
(306, 27, 9, 0, 11, '2019-06-12 14:40:34'),
(307, 27, 11, 0, 11, '2019-06-12 14:40:34'),
(308, 27, 1, 0, 11, '2019-06-12 14:40:34'),
(309, 27, 2, 0, 11, '2019-06-12 14:40:34'),
(310, 27, 3, 0, 11, '2019-06-12 14:40:34'),
(311, 27, 1, 1, 11, '2019-06-12 14:41:09'),
(312, 27, 2, 1, 11, '2019-06-12 14:41:09'),
(313, 27, 3, 1, 11, '2019-06-12 14:41:09'),
(314, 27, 4, 1, 11, '2019-06-12 14:41:09'),
(315, 27, 5, 1, 11, '2019-06-12 14:41:09'),
(316, 27, 6, 1, 11, '2019-06-12 14:41:09'),
(317, 27, 7, 1, 11, '2019-06-12 14:41:09'),
(318, 27, 8, 1, 11, '2019-06-12 14:41:09'),
(319, 27, 9, 1, 11, '2019-06-12 14:41:09'),
(320, 27, 10, 1, 11, '2019-06-12 14:41:09'),
(321, 27, 11, 1, 11, '2019-06-12 14:41:09'),
(322, 27, 1, 1, 11, '2019-06-12 14:41:19'),
(323, 27, 2, 1, 11, '2019-06-12 14:41:19'),
(324, 27, 3, 1, 11, '2019-06-12 14:41:19'),
(325, 27, 4, 1, 11, '2019-06-12 14:41:19'),
(326, 27, 5, 1, 11, '2019-06-12 14:41:19'),
(327, 27, 6, 1, 11, '2019-06-12 14:41:19'),
(328, 27, 7, 1, 11, '2019-06-12 14:41:19'),
(329, 27, 8, 1, 11, '2019-06-12 14:41:19'),
(330, 27, 9, 1, 11, '2019-06-12 14:41:19'),
(331, 27, 10, 1, 11, '2019-06-12 14:41:19'),
(332, 27, 11, 1, 11, '2019-06-12 14:41:19'),
(333, 27, 5, 0, 11, '2019-06-12 14:41:20'),
(334, 27, 6, 0, 11, '2019-06-12 14:41:20'),
(335, 27, 7, 0, 11, '2019-06-12 14:41:20'),
(336, 27, 8, 0, 11, '2019-06-12 14:41:20'),
(337, 27, 9, 0, 11, '2019-06-12 14:41:20'),
(338, 27, 10, 0, 11, '2019-06-12 14:41:20'),
(339, 27, 1, 0, 11, '2019-06-12 14:41:20'),
(340, 27, 2, 0, 11, '2019-06-12 14:41:20'),
(341, 27, 3, 0, 11, '2019-06-12 14:41:20'),
(342, 28, 1, 1, 0, '2019-06-12 15:02:25'),
(343, 28, 2, 1, 0, '2019-06-12 15:02:25'),
(344, 28, 3, 1, 0, '2019-06-12 15:02:25'),
(345, 28, 4, 1, 0, '2019-06-12 15:02:25'),
(346, 28, 5, 1, 0, '2019-06-12 15:02:25'),
(347, 28, 6, 1, 0, '2019-06-12 15:02:25'),
(348, 28, 7, 1, 0, '2019-06-12 15:02:25'),
(349, 28, 8, 1, 0, '2019-06-12 15:02:25'),
(350, 28, 9, 1, 0, '2019-06-12 15:02:25'),
(351, 28, 10, 1, 0, '2019-06-12 15:02:25'),
(352, 28, 11, 1, 0, '2019-06-12 15:02:25'),
(353, 28, 4, 0, 11, '2019-06-12 15:02:25'),
(354, 28, 6, 0, 11, '2019-06-12 15:02:25'),
(355, 28, 8, 0, 11, '2019-06-12 15:02:25'),
(356, 28, 10, 0, 11, '2019-06-12 15:02:25'),
(357, 28, 2, 0, 11, '2019-06-12 15:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `log_user`
--

CREATE TABLE `log_user` (
  `id_log_user` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `nohp_user` varchar(14) NOT NULL,
  `status_user` int(11) NOT NULL,
  `id_user_author` int(11) NOT NULL,
  `date_edit` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_user`
--

INSERT INTO `log_user` (`id_log_user`, `id_user`, `nama_user`, `email_user`, `nohp_user`, `status_user`, `id_user_author`, `date_edit`) VALUES
(1, 11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', 0, 1, '2019-05-12 21:55:11'),
(6, 12, 'Shinta Melinda Sukardi', 'shinta.melinda@leiter.co.id', '08111045532', 0, 1, '2019-05-12 22:14:49'),
(7, 13, 'Robert Cau', 'bob@leiter.co.id', '123456789', 0, 11, '2019-05-13 14:37:41'),
(8, 14, 'Robert Cau', 'bob@leiter.co.id', '123456789', 0, 11, '2019-05-13 14:49:13'),
(9, 15, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:50:06'),
(10, 16, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:50:40'),
(11, 17, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:50:48'),
(12, 18, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:51:02'),
(13, 19, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:51:22'),
(14, 20, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:51:48'),
(15, 21, 'Test Account ', 'testaccount@example.com', '123412341234', 0, 11, '2019-05-13 14:53:16'),
(16, 22, 'test acount 2', 'testaccount2@gmail.com', '123412341234', 0, 11, '2019-05-13 14:54:20'),
(17, 23, 'Test account 3', 'testacoount@gmail.com', '123412341234', 0, 11, '2019-05-13 15:00:39'),
(18, 24, 'Test Employee 4', 'asdf@gmail.com', '12341234', 0, 11, '2019-05-23 08:32:34'),
(19, 24, 'Test Employee 444444444444444', 'asdf@gmail.com4444444444444444444', '12341234444444', 0, 11, '2019-05-23 08:32:34'),
(20, 24, 'Test Employee 444444444444444', 'asdf@gmail.com4444444444444444444', '12341234444444', 1, 11, '2019-05-23 08:32:34'),
(21, 25, 'test edit privilege', 'privilege@user.cin', '12341234', 0, 11, '2019-05-23 09:37:40'),
(22, 26, 'Stevan Nathan', 'stevannathanwijaya@gmail.com', '12332132132', 0, 11, '2019-06-02 20:16:33'),
(23, 26, 'Stevan Nathan W', 'stevannathanwijaya@yahoo.com', '1111111111111', 0, 11, '2019-06-02 20:16:33'),
(24, 23, 'Test account 3', 'testacoount@gmail.com', '123412341234', 1, 11, '2019-05-13 15:00:39'),
(25, 25, 'test edit privilege', 'privilege@user.cin', '12341234', 1, 11, '2019-05-23 09:37:40'),
(26, 11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', 0, 11, '2019-06-12 14:25:08'),
(27, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(28, 27, 'Darus0', 'darus@leiter.co.id0', '0812394384910', 0, 11, '2019-06-12 14:40:34'),
(29, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(30, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 1, 11, '2019-06-12 14:40:34'),
(31, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(32, 11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', 0, 11, '2019-06-12 14:25:08'),
(33, 11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', 0, 11, '2019-06-12 14:25:08'),
(34, 11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', 0, 11, '2019-06-12 14:25:08'),
(35, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(36, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(37, 27, 'Darus', 'darus@leiter.co.id', '081239438491', 0, 11, '2019-06-12 14:40:34'),
(38, 28, 'Daniel Wijaya', 'daniel@leiter.co.id', '089766784456', 0, 11, '2019-06-12 15:02:25'),
(39, 28, 'Daniel Wijaya', 'daniel@leiter.co.id', '089766784456', 0, 11, '2019-06-12 15:02:25'),
(40, 28, 'Daniel Wijaya', 'daniel@leiter.co.id', '089766784456', 1, 11, '2019-06-12 15:02:25'),
(41, 28, 'Daniel Wijaya', 'daniel@leiter.co.id', '089766784456', 0, 11, '2019-06-12 15:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `mata_uang`
--

CREATE TABLE `mata_uang` (
  `id_mata_uang` int(11) NOT NULL,
  `mata_uang` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_uang`
--

INSERT INTO `mata_uang` (`id_mata_uang`, `mata_uang`) VALUES
(1, 'USD'),
(2, 'IDR'),
(3, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `link_control` varchar(100) NOT NULL,
  `type_menu` varchar(100) NOT NULL COMMENT 'MASTER, CRM',
  `head_menu` varchar(100) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `status_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `link_control`, `type_menu`, `head_menu`, `nama_menu`, `status_menu`) VALUES
(1, 'employee', 'MASTER', 'master/user/', 'Employee', 0),
(2, 'labor', 'MASTER', 'master/user/', 'Labor', 0),
(3, 'sales', 'MASTER', 'master/user/', 'Sales', 0),
(4, 'goods', 'CRM', 'crm/', 'Goods', 0),
(5, 'invoice', 'CRM', 'crm/', 'Invoice', 0),
(6, 'oc', 'CRM', 'crm/', 'Order Confirmation', 0),
(7, 'od', 'CRM', 'crm/', 'Order Delivery', 0),
(8, 'po', 'CRM', 'crm/', 'Purchase Order', 0),
(9, 'quotation', 'CRM', 'crm/', 'Quotation', 0),
(10, 'request', 'CRM', 'crm/', 'Price Request', 0),
(11, 'vendor', 'CRM', 'crm/', 'Vendor Price', 0);

--
-- Triggers `menu`
--
DELIMITER $$
CREATE TRIGGER `add additional privilage` AFTER INSERT ON `menu` FOR EACH ROW BEGIN
    insert into privilage(id_menu,id_user,status_privilage,id_user_edit,date_user_edit) select NEW.id_menu, user.id_user, 1, 'SYSTEM', now() from user;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode_pembayaran` int(11) NOT NULL,
  `urutan_pembayaran` int(11) NOT NULL,
  `persentase_pembayaran` int(11) NOT NULL,
  `nominal_pembayaran` bigint(11) NOT NULL,
  `trigger_pembayaran` int(11) NOT NULL COMMENT '1: sesudah OC; 2: setelah OD;',
  `id_quotation` int(11) NOT NULL,
  `id_versi` int(11) NOT NULL,
  `kurs` varchar(100) NOT NULL,
  `id_oc` int(11) NOT NULL DEFAULT '0',
  `status_invoice` int(11) NOT NULL DEFAULT '1' COMMENT '0: sudah aktif, 1 belum',
  `id_invoice` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode_pembayaran`, `urutan_pembayaran`, `persentase_pembayaran`, `nominal_pembayaran`, `trigger_pembayaran`, `id_quotation`, `id_versi`, `kurs`, `id_oc`, `status_invoice`, `id_invoice`) VALUES
(2, 1, 25, 3, 1, 1, 1, 'IDR', 0, 1, 0),
(3, 2, 75, 9, 1, 1, 1, 'IDR', 0, 1, 0),
(4, 1, 40, 4, 1, 2, 1, 'USD', 0, 1, 0),
(5, 2, 60, 6, 1, 2, 1, 'USD', 0, 1, 0),
(6, 1, 0, 0, 1, 4, 1, 'IDR', 0, 1, 0),
(7, 2, 100, 3, 0, 4, 1, 'IDR', 0, 1, 0),
(8, 1, 0, 0, 2, 5, 1, 'IDR', 0, 1, 0),
(9, 2, 100, 448, 2, 5, 1, 'IDR', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `metode_pengiriman_shipping`
--

CREATE TABLE `metode_pengiriman_shipping` (
  `id_perusahaan` int(11) NOT NULL,
  `metode_pengiriman` varchar(10) NOT NULL,
  `status_metode_pengiriman` int(11) NOT NULL DEFAULT '1',
  `id_user_add` int(11) NOT NULL,
  `date_metode_pengiriman_add` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_metode_pengiriman_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_metode_pengiriman_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_pengiriman_shipping`
--

INSERT INTO `metode_pengiriman_shipping` (`id_perusahaan`, `metode_pengiriman`, `status_metode_pengiriman`, `id_user_add`, `date_metode_pengiriman_add`, `id_user_edit`, `date_metode_pengiriman_edit`, `id_user_delete`, `date_metode_pengiriman_delete`) VALUES
(0, '', 1, 0, '2019-05-23 02:03:05', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, 'AIR', 1, 11, '2019-05-14 15:59:46', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, 'LAND', 1, 11, '2019-05-14 15:59:46', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, 'AIR', 0, 11, '2019-05-14 16:12:58', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, 'LAND', 0, 11, '2019-05-14 16:12:58', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, 'SEA', 1, 11, '2019-05-14 16:12:58', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, 'AIR', 0, 11, '2019-05-18 22:04:33', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, 'LAND', 1, 11, '2019-05-18 22:04:33', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, 'SEA', 1, 11, '2019-05-18 22:04:33', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(16, 'AIR', 0, 11, '2019-06-02 20:12:57', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(16, 'LAND', 0, 11, '2019-06-02 20:12:57', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(16, 'SEA', 0, 11, '2019-06-02 20:12:57', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(21, 'AIR', 0, 11, '2019-06-12 13:56:47', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(21, 'LAND', 1, 11, '2019-06-12 13:56:47', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(21, 'SEA', 0, 11, '2019-06-12 13:56:47', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `od_core`
--

CREATE TABLE `od_core` (
  `id_od` int(11) NOT NULL,
  `no_od` varchar(100) NOT NULL,
  `id_oc` int(11) NOT NULL,
  `id_courier` int(11) NOT NULL,
  `delivery_method` varchar(100) NOT NULL,
  `status_od` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL,
  `date_od_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_od_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_od_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `od_core`
--

INSERT INTO `od_core` (`id_od`, `no_od`, `id_oc`, `id_courier`, `delivery_method`, `status_od`, `id_user_add`, `date_od_add`, `id_user_edit`, `date_od_edit`, `id_user_delete`, `date_od_delete`) VALUES
(1, 'OD-00001', 1, 9, 'LAND', 0, 11, '2019-06-11 04:50:04', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `od_item`
--

CREATE TABLE `od_item` (
  `id_od_item` int(11) NOT NULL,
  `id_od` int(11) NOT NULL,
  `id_quotation_item` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `od_item`
--

INSERT INTO `od_item` (`id_od_item`, `id_od`, `id_quotation_item`, `item_qty`) VALUES
(1, 1, 68, 14);

-- --------------------------------------------------------

--
-- Table structure for table `order_confirmation`
--

CREATE TABLE `order_confirmation` (
  `id_oc` int(11) NOT NULL,
  `no_oc` varchar(100) NOT NULL,
  `id_quotation` int(11) NOT NULL,
  `versi_quotation` int(11) NOT NULL,
  `no_po_customer` varchar(200) NOT NULL,
  `status_oc` int(11) NOT NULL DEFAULT '0' COMMENT 'kalau 0, masih oc, 1: delete, 2 sudah po, 3 udah oc',
  `id_user_add` int(11) NOT NULL,
  `date_oc_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_oc_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_oc_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_confirmation`
--

INSERT INTO `order_confirmation` (`id_oc`, `no_oc`, `id_quotation`, `versi_quotation`, `no_po_customer`, `status_oc`, `id_user_add`, `date_oc_add`, `id_user_edit`, `date_oc_edit`, `id_user_delete`, `date_oc_delete`) VALUES
(1, 'OC-00001', 5, 1, 'PO00002cust', 2, 11, '2019-06-04 09:11:13', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(200) NOT NULL DEFAULT '-',
  `jenis_perusahaan` varchar(100) NOT NULL DEFAULT '-',
  `alamat_perusahaan` text,
  `notelp_perusahaan` varchar(15) NOT NULL DEFAULT '-',
  `peran_perusahaan` varchar(100) NOT NULL DEFAULT '-',
  `status_perusahaan` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_perusahaan_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_perusahaan_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_perusahaan_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_perusahaan`, `jenis_perusahaan`, `alamat_perusahaan`, `notelp_perusahaan`, `peran_perusahaan`, `status_perusahaan`, `id_user_add`, `date_perusahaan_add`, `id_user_edit`, `date_perusahaan_edit`, `id_user_delete`, `date_perusahaan_delete`) VALUES
(18, 'PT Adil Makmur Fajar', 'Food', 'Jl. Industri Raya No. 1 Km. 21, \r\nDesa Budimulya, Kec. Cikupa, \r\nTangerang 15710', '5963470-71', 'CUSTOMER', 0, 11, '2019-06-11 23:33:10', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00'),
(19, 'PT Agarindo Bogatama', 'Food', 'Jelambar Selatan II No. 4, \r\nGedung Agar-agar', '569 66930', 'CUSTOMER', 0, 11, '2019-06-11 23:56:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(20, 'SEFAR SINGAPORE PTE LTD', '', '8 Kallang Avenue #04-03 Aperia Tower 1 \r\nSINGAPORE 339509 ', '+65 6299 9092 ', 'PRODUK', 0, 11, '2019-06-12 09:41:26', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00'),
(21, 'Cargo-partner Logistics Pte. Ltd.', 'Glass Expert Shipper', '300 Tampines Avenue 5 #07-04 Income @ Tampines Junction SG-529653 Singapore Singapore', '+65 6578 5094', 'SHIPPING', 1, 11, '2019-06-12 13:56:46', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `po_core`
--

CREATE TABLE `po_core` (
  `id_po` int(11) NOT NULL,
  `no_po` varchar(100) NOT NULL,
  `id_supplier` varchar(100) NOT NULL,
  `id_shipper` int(11) NOT NULL,
  `shipping_method` varchar(100) NOT NULL,
  `total_supplier_payment` int(11) NOT NULL,
  `total_shipper_payment` int(11) NOT NULL,
  `kurs_supplier` varchar(100) NOT NULL,
  `kurs_shipping` varchar(100) NOT NULL,
  `status_po` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL,
  `date_po_core_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_po_core_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_po_core_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_core`
--

INSERT INTO `po_core` (`id_po`, `no_po`, `id_supplier`, `id_shipper`, `shipping_method`, `total_supplier_payment`, `total_shipper_payment`, `kurs_supplier`, `kurs_shipping`, `status_po`, `id_user_add`, `date_po_core_add`, `id_user_edit`, `date_po_core_edit`, `id_user_delete`, `date_po_core_delete`) VALUES
(1, 'PO-00001', '3', 9, 'AIR', 12000, 350000000, 'EUR', 'IDR', 0, 11, '2019-06-10 01:53:11', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `po_item`
--

CREATE TABLE `po_item` (
  `id_po_item` int(11) NOT NULL,
  `id_po_setting` int(11) NOT NULL,
  `id_request_item` int(11) NOT NULL COMMENT 'nanti di join sampe produk vendor',
  `harga_item` int(11) NOT NULL,
  `kurs` int(11) NOT NULL,
  `mata_uang` varchar(10) NOT NULL,
  `id_supplier` int(11) NOT NULL DEFAULT '0' COMMENT 'barang request ini akan dipesan kesiapa',
  `id_shipper` int(11) NOT NULL DEFAULT '0' COMMENT 'akan diantar pake apa ke leiter',
  `shipping_method` varchar(100) NOT NULL,
  `harga_shipping` int(11) NOT NULL,
  `kurs_shipping` int(11) NOT NULL DEFAULT '1',
  `mata_uang_shipping` varchar(100) NOT NULL DEFAULT 'IDR',
  `id_po` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_item`
--

INSERT INTO `po_item` (`id_po_item`, `id_po_setting`, `id_request_item`, `harga_item`, `kurs`, `mata_uang`, `id_supplier`, `id_shipper`, `shipping_method`, `harga_shipping`, `kurs_shipping`, `mata_uang_shipping`, `id_po`) VALUES
(3, 1, 51, 12000, 20000, 'EUR', 3, 9, 'AIR', 350000000, 1, 'IDR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `po_setting`
--

CREATE TABLE `po_setting` (
  `id_po_setting` int(11) NOT NULL,
  `id_request` int(11) NOT NULL,
  `sudah_po` int(11) NOT NULL DEFAULT '1' COMMENT '1: belum po, 0 sudah po',
  `tgl_po` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_add` int(11) NOT NULL,
  `date_po_setting_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_po_setting_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_po_setting_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_setting`
--

INSERT INTO `po_setting` (`id_po_setting`, `id_request`, `sudah_po`, `tgl_po`, `id_user_add`, `date_po_setting_create`, `id_user_edit`, `date_po_setting_edit`, `id_user_delete`, `date_po_setting_delete`) VALUES
(1, 8, 1, '2019-06-09 21:40:12', 11, '2019-06-09 21:40:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `price_request`
--

CREATE TABLE `price_request` (
  `id_request` int(11) NOT NULL,
  `tgl_dateline_request` date NOT NULL,
  `status_request` int(11) NOT NULL DEFAULT '0',
  `id_perusahaan` int(11) NOT NULL COMMENT 'perlu untuk menjaga kalau ada pegawai yang pindah kantor dan masih berinteraksi dengan leiter',
  `id_cp` int(11) NOT NULL,
  `franco` varchar(200) DEFAULT NULL,
  `id_user_add` int(11) NOT NULL,
  `date_request_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_request_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_request_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_buatquo` int(11) NOT NULL DEFAULT '1' COMMENT '1 : yang belum dibuat quo, yang 0 sudah jadi quo',
  `untuk_stock` int(11) NOT NULL DEFAULT '1' COMMENT '0: untuk stock, 1 tidak stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_request`
--

INSERT INTO `price_request` (`id_request`, `tgl_dateline_request`, `status_request`, `id_perusahaan`, `id_cp`, `franco`, `id_user_add`, `date_request_add`, `id_user_edit`, `date_request_edit`, `id_user_delete`, `date_request_delete`, `status_buatquo`, `untuk_stock`) VALUES
(1, '0000-00-00', 1, 1, 1, '', 11, '2019-05-14 23:30:15', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(2, '0000-00-00', 0, 2, 1, '', 11, '2019-05-17 14:16:24', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(3, '0000-00-00', 1, 3, 1, '', 11, '2019-05-17 14:42:33', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(4, '2019-05-31', 1, 4, 1, '', 11, '2019-05-18 08:30:40', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(5, '2019-06-29', 3, 1, 1, 'Medans', 11, '2019-05-18 08:38:37', 11, '2019-05-19 16:13:39', 0, '0000-00-00 00:00:00', 1, 1),
(6, '2019-05-31', 3, 1, 1, 'Surabaya', 11, '2019-05-18 11:37:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1),
(7, '2019-06-20', 2, 11, 12, 'Surabaya', 11, '2019-06-02 20:20:35', 11, '2019-06-02 15:23:08', 0, '0000-00-00 00:00:00', 1, 1),
(8, '2019-07-03', 2, 0, 0, 'MEDAN', 11, '2019-06-07 22:19:06', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 0),
(9, '2019-06-13', 2, 14, 23, 'medan', 11, '2019-06-11 10:21:51', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(10, '2019-06-11', 2, 14, 23, 'Medan', 11, '2019-06-11 10:22:43', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1),
(11, '2019-06-11', 0, 14, 23, 'medan', 11, '2019-06-11 10:29:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `price_request_item`
--

CREATE TABLE `price_request_item` (
  `id_request_item` int(11) NOT NULL,
  `id_request` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `status_request_item` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL,
  `date_request_item_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_request_item_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_request_item_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sudah_po` int(11) NOT NULL DEFAULT '1' COMMENT '1: belum po, 0: sudah po'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_request_item`
--

INSERT INTO `price_request_item` (`id_request_item`, `id_request`, `id_produk`, `jumlah_produk`, `status_request_item`, `id_user_add`, `date_request_item_add`, `id_user_edit`, `date_request_item_edit`, `id_user_delete`, `date_request_item_delete`, `sudah_po`) VALUES
(1, 1, 1, 1, 1, 11, '2019-05-14 23:30:15', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(2, 1, 1, 1, 1, 11, '2019-05-14 23:32:25', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(3, 1, 1, 1, 1, 11, '2019-05-14 23:33:10', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(4, 1, 1, 1, 1, 11, '2019-05-14 23:33:28', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(5, 1, 1, 1, 1, 11, '2019-05-14 23:34:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(6, 1, 1, 1, 1, 11, '2019-05-14 23:34:37', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(8, 1, 3, 0, 1, 11, '2019-05-14 23:36:19', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(9, 1, 3, 1, 1, 11, '2019-05-14 23:36:43', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(10, 1, 3, 1, 1, 11, '2019-05-14 23:37:06', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(11, 1, 3, 1, 1, 11, '2019-05-14 23:37:41', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(12, 1, 1, 1, 1, 11, '2019-05-14 23:38:01', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(13, 1, 1, 100, 1, 11, '2019-05-14 23:39:34', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(14, 1, 3, 15, 1, 11, '2019-05-14 23:39:34', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(15, 1, 3, 15, 0, 11, '2019-05-15 00:49:58', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(16, 1, 4, 20, 0, 11, '2019-05-15 00:52:36', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(17, 1, 2, 100, 0, 11, '2019-05-15 00:52:36', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(18, 2, 3, 1000, 1, 11, '2019-05-15 16:12:06', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(19, 2, 4, 100, 1, 11, '2019-05-17 14:11:45', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(20, 2, 3, 100, 1, 11, '2019-05-17 14:11:45', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(21, 2, 2, 1000, 1, 11, '2019-05-17 14:15:03', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(22, 2, 5, 1000, 1, 11, '2019-05-17 14:15:03', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(23, 2, 2, 1000, 1, 11, '2019-05-17 14:15:08', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(24, 2, 5, 1000, 1, 11, '2019-05-17 14:15:08', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(25, 2, 2, 1000, 1, 11, '2019-05-17 14:15:33', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(26, 2, 5, 1000, 1, 11, '2019-05-17 14:15:33', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(27, 2, 2, 1000, 1, 11, '2019-05-17 14:15:38', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(28, 2, 5, 1000, 1, 11, '2019-05-17 14:15:38', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(29, 2, 2, 1000, 1, 11, '2019-05-17 14:15:42', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(30, 2, 5, 1000, 1, 11, '2019-05-17 14:15:42', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(31, 3, 4, 100, 0, 11, '2019-05-17 14:42:33', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(32, 3, 2, 80, 0, 11, '2019-05-17 14:42:33', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(33, 3, 5, 100, 0, 11, '2019-05-17 15:32:32', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(34, 3, 2, 100, 1, 11, '2019-05-17 15:34:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(35, 4, 5, 100, 0, 11, '2019-05-18 08:30:40', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(36, 4, 2, 50, 0, 11, '2019-05-18 08:30:40', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(41, 6, 5, 100, 0, 11, '2019-05-18 11:37:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(42, 6, 3, 20, 0, 11, '2019-05-18 11:37:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(43, 6, 4, 100, 0, 11, '2019-05-18 22:49:22', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(44, 7, 6, 15, 0, 11, '2019-06-02 20:20:35', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(45, 7, 5, 20, 0, 11, '2019-06-02 20:20:35', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(46, 7, 5, 20, 1, 11, '2019-06-02 20:24:17', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(47, 5, 4, 15, 0, 11, '2019-06-02 23:21:08', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(48, 5, 6, 100, 0, 11, '2019-06-02 23:40:49', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(49, 5, 1, 16, 0, 11, '2019-06-02 23:40:49', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(50, 7, 3, 20, 0, 11, '2019-06-02 23:41:14', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(51, 8, 3, 15, 0, 11, '2019-06-07 22:19:06', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(52, 9, 4, 15, 0, 11, '2019-06-11 10:21:51', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(53, 10, 1, 12, 0, 11, '2019-06-11 10:22:43', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1),
(54, 11, 6, 15000, 0, 11, '2019-06-11 10:29:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `privilage`
--

CREATE TABLE `privilage` (
  `id_privilage` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status_privilage` int(11) NOT NULL,
  `id_user_edit` int(11) NOT NULL,
  `date_user_edit` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privilage`
--

INSERT INTO `privilage` (`id_privilage`, `id_menu`, `id_user`, `status_privilage`, `id_user_edit`, `date_user_edit`) VALUES
(4, 1, 11, 0, 11, '2019-05-23 04:47:40'),
(5, 2, 11, 0, 11, '2019-05-23 04:47:40'),
(6, 3, 11, 1, 11, '2019-05-23 04:47:40'),
(7, 1, 12, 0, 0, '2019-05-12 22:14:49'),
(8, 2, 12, 1, 0, '2019-05-12 22:14:49'),
(9, 3, 12, 1, 0, '2019-05-12 22:14:49'),
(10, 4, 11, 1, 11, '2019-05-23 04:47:40'),
(11, 4, 12, 1, 0, '2019-05-13 13:15:50'),
(13, 5, 11, 1, 11, '2019-05-23 04:47:40'),
(14, 5, 12, 1, 0, '2019-05-13 13:15:50'),
(16, 6, 11, 1, 11, '2019-05-23 04:47:40'),
(17, 6, 12, 1, 0, '2019-05-13 13:15:50'),
(19, 7, 11, 1, 11, '2019-05-23 04:47:40'),
(20, 7, 12, 1, 0, '2019-05-13 13:15:50'),
(22, 8, 11, 1, 11, '2019-05-23 04:47:40'),
(23, 8, 12, 1, 0, '2019-05-13 13:15:50'),
(25, 9, 11, 0, 11, '2019-05-23 04:47:40'),
(26, 9, 12, 1, 0, '2019-05-13 13:15:50'),
(28, 10, 11, 0, 11, '2019-05-23 04:47:40'),
(29, 10, 12, 1, 0, '2019-05-13 13:15:50'),
(31, 11, 11, 0, 11, '2019-05-23 04:47:40'),
(32, 11, 12, 1, 0, '2019-05-13 13:15:50'),
(34, 1, 13, 1, 0, '2019-05-13 14:37:41'),
(35, 2, 13, 1, 0, '2019-05-13 14:37:41'),
(36, 3, 13, 1, 0, '2019-05-13 14:37:41'),
(37, 4, 13, 1, 0, '2019-05-13 14:37:41'),
(38, 5, 13, 1, 0, '2019-05-13 14:37:41'),
(39, 6, 13, 1, 0, '2019-05-13 14:37:41'),
(40, 7, 13, 1, 0, '2019-05-13 14:37:41'),
(41, 8, 13, 1, 0, '2019-05-13 14:37:41'),
(42, 9, 13, 1, 0, '2019-05-13 14:37:41'),
(43, 10, 13, 1, 0, '2019-05-13 14:37:41'),
(44, 11, 13, 1, 0, '2019-05-13 14:37:41'),
(49, 1, 14, 1, 0, '2019-05-13 14:49:13'),
(50, 2, 14, 1, 0, '2019-05-13 14:49:13'),
(51, 3, 14, 1, 0, '2019-05-13 14:49:13'),
(52, 4, 14, 1, 0, '2019-05-13 14:49:13'),
(53, 5, 14, 1, 0, '2019-05-13 14:49:13'),
(54, 6, 14, 1, 0, '2019-05-13 14:49:13'),
(55, 7, 14, 1, 0, '2019-05-13 14:49:13'),
(56, 8, 14, 1, 0, '2019-05-13 14:49:13'),
(57, 9, 14, 1, 0, '2019-05-13 14:49:13'),
(58, 10, 14, 1, 0, '2019-05-13 14:49:13'),
(59, 11, 14, 1, 0, '2019-05-13 14:49:13'),
(64, 1, 15, 1, 0, '2019-05-13 14:50:06'),
(65, 2, 15, 1, 0, '2019-05-13 14:50:06'),
(66, 3, 15, 1, 0, '2019-05-13 14:50:06'),
(67, 4, 15, 1, 0, '2019-05-13 14:50:06'),
(68, 5, 15, 1, 0, '2019-05-13 14:50:06'),
(69, 6, 15, 1, 0, '2019-05-13 14:50:06'),
(70, 7, 15, 1, 0, '2019-05-13 14:50:06'),
(71, 8, 15, 1, 0, '2019-05-13 14:50:06'),
(72, 9, 15, 1, 0, '2019-05-13 14:50:06'),
(73, 10, 15, 1, 0, '2019-05-13 14:50:06'),
(74, 11, 15, 1, 0, '2019-05-13 14:50:06'),
(79, 1, 16, 1, 0, '2019-05-13 14:50:40'),
(80, 2, 16, 1, 0, '2019-05-13 14:50:40'),
(81, 3, 16, 1, 0, '2019-05-13 14:50:40'),
(82, 4, 16, 1, 0, '2019-05-13 14:50:40'),
(83, 5, 16, 1, 0, '2019-05-13 14:50:40'),
(84, 6, 16, 1, 0, '2019-05-13 14:50:40'),
(85, 7, 16, 1, 0, '2019-05-13 14:50:40'),
(86, 8, 16, 1, 0, '2019-05-13 14:50:40'),
(87, 9, 16, 1, 0, '2019-05-13 14:50:40'),
(88, 10, 16, 1, 0, '2019-05-13 14:50:40'),
(89, 11, 16, 1, 0, '2019-05-13 14:50:40'),
(94, 1, 17, 1, 0, '2019-05-13 14:50:48'),
(95, 2, 17, 1, 0, '2019-05-13 14:50:48'),
(96, 3, 17, 1, 0, '2019-05-13 14:50:48'),
(97, 4, 17, 1, 0, '2019-05-13 14:50:48'),
(98, 5, 17, 1, 0, '2019-05-13 14:50:48'),
(99, 6, 17, 1, 0, '2019-05-13 14:50:48'),
(100, 7, 17, 1, 0, '2019-05-13 14:50:48'),
(101, 8, 17, 1, 0, '2019-05-13 14:50:48'),
(102, 9, 17, 1, 0, '2019-05-13 14:50:48'),
(103, 10, 17, 1, 0, '2019-05-13 14:50:48'),
(104, 11, 17, 1, 0, '2019-05-13 14:50:48'),
(109, 1, 18, 1, 0, '2019-05-13 14:51:02'),
(110, 2, 18, 1, 0, '2019-05-13 14:51:02'),
(111, 3, 18, 1, 0, '2019-05-13 14:51:02'),
(112, 4, 18, 1, 0, '2019-05-13 14:51:02'),
(113, 5, 18, 1, 0, '2019-05-13 14:51:02'),
(114, 6, 18, 1, 0, '2019-05-13 14:51:02'),
(115, 7, 18, 1, 0, '2019-05-13 14:51:02'),
(116, 8, 18, 1, 0, '2019-05-13 14:51:02'),
(117, 9, 18, 1, 0, '2019-05-13 14:51:02'),
(118, 10, 18, 1, 0, '2019-05-13 14:51:02'),
(119, 11, 18, 1, 0, '2019-05-13 14:51:02'),
(124, 1, 19, 1, 0, '2019-05-13 14:51:22'),
(125, 2, 19, 1, 0, '2019-05-13 14:51:22'),
(126, 3, 19, 1, 0, '2019-05-13 14:51:22'),
(127, 4, 19, 1, 0, '2019-05-13 14:51:22'),
(128, 5, 19, 1, 0, '2019-05-13 14:51:22'),
(129, 6, 19, 1, 0, '2019-05-13 14:51:22'),
(130, 7, 19, 1, 0, '2019-05-13 14:51:22'),
(131, 8, 19, 1, 0, '2019-05-13 14:51:22'),
(132, 9, 19, 1, 0, '2019-05-13 14:51:22'),
(133, 10, 19, 1, 0, '2019-05-13 14:51:22'),
(134, 11, 19, 1, 0, '2019-05-13 14:51:22'),
(139, 1, 20, 1, 0, '2019-05-13 14:51:48'),
(140, 2, 20, 1, 0, '2019-05-13 14:51:48'),
(141, 3, 20, 1, 0, '2019-05-13 14:51:48'),
(142, 4, 20, 1, 0, '2019-05-13 14:51:48'),
(143, 5, 20, 1, 0, '2019-05-13 14:51:48'),
(144, 6, 20, 1, 0, '2019-05-13 14:51:48'),
(145, 7, 20, 1, 0, '2019-05-13 14:51:48'),
(146, 8, 20, 1, 0, '2019-05-13 14:51:48'),
(147, 9, 20, 1, 0, '2019-05-13 14:51:48'),
(148, 10, 20, 1, 0, '2019-05-13 14:51:48'),
(149, 11, 20, 1, 0, '2019-05-13 14:51:48'),
(154, 1, 21, 0, 11, '0000-00-00 00:00:00'),
(155, 2, 21, 0, 11, '0000-00-00 00:00:00'),
(156, 3, 21, 1, 0, '2019-05-13 14:53:16'),
(157, 4, 21, 1, 0, '2019-05-13 14:53:16'),
(158, 5, 21, 1, 0, '2019-05-13 14:53:16'),
(159, 6, 21, 0, 11, '0000-00-00 00:00:00'),
(160, 7, 21, 0, 11, '0000-00-00 00:00:00'),
(161, 8, 21, 0, 11, '0000-00-00 00:00:00'),
(162, 9, 21, 0, 11, '0000-00-00 00:00:00'),
(163, 10, 21, 1, 0, '2019-05-13 14:53:16'),
(164, 11, 21, 1, 0, '2019-05-13 14:53:16'),
(169, 1, 22, 0, 11, '0000-00-00 00:00:00'),
(170, 2, 22, 0, 11, '0000-00-00 00:00:00'),
(171, 3, 22, 1, 0, '2019-05-13 14:54:20'),
(172, 4, 22, 1, 0, '2019-05-13 14:54:20'),
(173, 5, 22, 1, 0, '2019-05-13 14:54:20'),
(174, 6, 22, 0, 11, '0000-00-00 00:00:00'),
(175, 7, 22, 1, 0, '2019-05-13 14:54:20'),
(176, 8, 22, 0, 11, '0000-00-00 00:00:00'),
(177, 9, 22, 1, 0, '2019-05-13 14:54:20'),
(178, 10, 22, 0, 11, '0000-00-00 00:00:00'),
(179, 11, 22, 1, 0, '2019-05-13 14:54:20'),
(184, 1, 23, 0, 11, '2019-05-23 04:48:10'),
(185, 2, 23, 0, 11, '2019-05-23 04:48:10'),
(186, 3, 23, 0, 11, '2019-05-23 04:48:10'),
(187, 4, 23, 0, 11, '2019-05-23 04:48:09'),
(188, 5, 23, 0, 11, '2019-05-23 04:48:10'),
(189, 6, 23, 1, 11, '2019-05-23 04:48:09'),
(190, 7, 23, 1, 11, '2019-05-23 04:48:09'),
(191, 8, 23, 1, 11, '2019-05-23 04:48:09'),
(192, 9, 23, 1, 11, '2019-05-23 04:48:09'),
(193, 10, 23, 1, 11, '2019-05-23 04:48:09'),
(194, 11, 23, 1, 11, '2019-05-23 04:48:09'),
(195, 1, 24, 0, 11, '2019-05-23 03:32:35'),
(196, 2, 24, 0, 11, '2019-05-23 03:32:35'),
(197, 3, 24, 1, 0, '2019-05-23 08:32:34'),
(198, 4, 24, 1, 0, '2019-05-23 08:32:34'),
(199, 5, 24, 1, 0, '2019-05-23 08:32:34'),
(200, 6, 24, 0, 11, '2019-05-23 03:32:34'),
(201, 7, 24, 1, 0, '2019-05-23 08:32:34'),
(202, 8, 24, 1, 0, '2019-05-23 08:32:34'),
(203, 9, 24, 0, 11, '2019-05-23 03:32:34'),
(204, 10, 24, 0, 11, '2019-05-23 03:32:34'),
(205, 11, 24, 0, 11, '2019-05-23 03:32:35'),
(210, 1, 25, 0, 11, '2019-05-23 04:48:21'),
(211, 2, 25, 0, 11, '2019-05-23 04:48:21'),
(212, 3, 25, 0, 11, '2019-05-23 04:48:21'),
(213, 4, 25, 0, 11, '2019-05-23 04:48:20'),
(214, 5, 25, 0, 11, '2019-05-23 04:48:20'),
(215, 6, 25, 0, 11, '2019-05-23 04:48:20'),
(216, 7, 25, 0, 11, '2019-05-23 04:48:20'),
(217, 8, 25, 0, 11, '2019-05-23 04:48:20'),
(218, 9, 25, 0, 11, '2019-05-23 04:48:20'),
(219, 10, 25, 0, 11, '2019-05-23 04:48:20'),
(220, 11, 25, 0, 11, '2019-05-23 04:48:21'),
(221, 1, 26, 0, 11, '2019-06-02 15:16:54'),
(222, 2, 26, 1, 11, '2019-06-02 15:16:53'),
(223, 3, 26, 0, 11, '2019-06-02 15:16:54'),
(224, 4, 26, 1, 11, '2019-06-02 15:16:53'),
(225, 5, 26, 0, 11, '2019-06-02 15:16:54'),
(226, 6, 26, 1, 11, '2019-06-02 15:16:53'),
(227, 7, 26, 0, 11, '2019-06-02 15:16:54'),
(228, 8, 26, 1, 11, '2019-06-02 15:16:53'),
(229, 9, 26, 0, 11, '2019-06-02 15:16:54'),
(230, 10, 26, 1, 11, '2019-06-02 15:16:53'),
(231, 11, 26, 0, 11, '2019-06-02 15:16:54'),
(232, 1, 11, 1, 0, '2019-06-12 14:25:08'),
(233, 2, 11, 1, 0, '2019-06-12 14:25:08'),
(234, 3, 11, 1, 0, '2019-06-12 14:25:08'),
(235, 4, 11, 1, 0, '2019-06-12 14:25:08'),
(236, 5, 11, 1, 0, '2019-06-12 14:25:08'),
(237, 6, 11, 1, 0, '2019-06-12 14:25:08'),
(238, 7, 11, 1, 0, '2019-06-12 14:25:08'),
(239, 8, 11, 1, 0, '2019-06-12 14:25:08'),
(240, 9, 11, 1, 0, '2019-06-12 14:25:08'),
(241, 10, 11, 1, 0, '2019-06-12 14:25:08'),
(242, 11, 11, 1, 0, '2019-06-12 14:25:08'),
(247, 1, 27, 0, 11, '2019-06-12 09:41:20'),
(248, 2, 27, 0, 11, '2019-06-12 09:41:20'),
(249, 3, 27, 0, 11, '2019-06-12 09:41:20'),
(250, 4, 27, 1, 11, '2019-06-12 09:41:19'),
(251, 5, 27, 0, 11, '2019-06-12 09:41:20'),
(252, 6, 27, 0, 11, '2019-06-12 09:41:20'),
(253, 7, 27, 0, 11, '2019-06-12 09:41:20'),
(254, 8, 27, 0, 11, '2019-06-12 09:41:20'),
(255, 9, 27, 0, 11, '2019-06-12 09:41:20'),
(256, 10, 27, 0, 11, '2019-06-12 09:41:20'),
(257, 11, 27, 1, 11, '2019-06-12 09:41:19'),
(262, 1, 28, 1, 0, '2019-06-12 15:02:25'),
(263, 2, 28, 0, 11, '2019-06-12 10:02:25'),
(264, 3, 28, 1, 0, '2019-06-12 15:02:25'),
(265, 4, 28, 0, 11, '2019-06-12 10:02:25'),
(266, 5, 28, 1, 0, '2019-06-12 15:02:25'),
(267, 6, 28, 0, 11, '2019-06-12 10:02:25'),
(268, 7, 28, 1, 0, '2019-06-12 15:02:25'),
(269, 8, 28, 0, 11, '2019-06-12 10:02:25'),
(270, 9, 28, 1, 0, '2019-06-12 15:02:25'),
(271, 10, 28, 0, 11, '2019-06-12 10:02:25'),
(272, 11, 28, 1, 0, '2019-06-12 15:02:25');

--
-- Triggers `privilage`
--
DELIMITER $$
CREATE TRIGGER `Insert privilage Log` AFTER INSERT ON `privilage` FOR EACH ROW BEGIN
	insert into log_privilage(id_user,id_menu,status_privilage,id_user_edit, date_user_edit) values (NEW.id_user, NEW.id_menu, NEW.status_privilage, NEW.id_user_edit, now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update privilage Log` AFTER UPDATE ON `privilage` FOR EACH ROW BEGIN
	insert into log_privilage(id_user,id_menu,status_privilage,id_user_edit, date_user_edit) values (NEW.id_user, NEW.id_menu, NEW.status_privilage, NEW.id_user_edit, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `bn_produk` varchar(200) NOT NULL DEFAULT '-',
  `nama_produk` varchar(400) NOT NULL DEFAULT '-',
  `satuan_produk` varchar(200) NOT NULL DEFAULT '-',
  `deskripsi_produk` text,
  `gambar_produk` varchar(500) NOT NULL DEFAULT 'default.jpg',
  `status_produk` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_produk_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_produk_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_produk_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `bn_produk`, `nama_produk`, `satuan_produk`, `deskripsi_produk`, `gambar_produk`, `status_produk`, `id_user_add`, `date_produk_add`, `id_user_edit`, `date_produk_edit`, `id_user_delete`, `date_produk_delete`) VALUES
(9, '3F03-0600-075-00', 'Sefar Accuflow 03-600-20 ADBLUE 75cm', 'M', 'Color: ADBLUE\r\nLength: 75 CM', 'images1.png', 0, 11, '2019-06-11 22:04:09', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(10, '3F06-0150-075-00', 'Sefar Accuflow 06-150-30 75cm', 'M', '-', 'default.jpg', 1, 11, '2019-06-11 22:08:10', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(11, '3F07-0230-075-00', 'Sefar Accuflow 07-230-60 75cm', 'M', 'Length: 75 Cm', 'jute-fabric-roll1.png', 0, 11, '2019-06-11 22:39:50', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(12, '3F03-0600-075-000', 'Sefar Accuflow 03-600-20 ADBLUE 75cm0', 'M0', 'Color: ADBLUE0\r\nLength: 75 CM0', 'images.png', 1, 11, '2019-06-11 23:08:29', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(13, '3F03-0600-075-00', 'Sefar Accuflow 03-600-20 ADBLUE 75cm', 'M', 'Color: ADBLUE\r\nLength: 75 CM', 'default.jpg', 1, 11, '2019-06-11 23:09:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(14, '3F03-0600-075-00', 'Sefar Accuflow 03-600-20 ADBLUE 75cm', 'M', 'Color: ADBLUE\r\nLength: 75 CM', 'default.jpg', 1, 11, '2019-06-11 23:09:35', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `produk_vendor`
--

CREATE TABLE `produk_vendor` (
  `id_produk_vendor` int(11) NOT NULL,
  `bn_produk_vendor` varchar(200) NOT NULL,
  `nama_produk_vendor` text NOT NULL,
  `satuan_produk_vendor` varchar(200) NOT NULL,
  `deskripsi_produk_vendor` text NOT NULL,
  `status_produk_vendor` int(11) NOT NULL DEFAULT '0',
  `id_perusahaan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user_add` int(11) NOT NULL,
  `date_produk_vendor_add` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_produk_vendor_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_produk_vendor_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_vendor`
--

INSERT INTO `produk_vendor` (`id_produk_vendor`, `bn_produk_vendor`, `nama_produk_vendor`, `satuan_produk_vendor`, `deskripsi_produk_vendor`, `status_produk_vendor`, `id_perusahaan`, `id_produk`, `id_user_add`, `date_produk_vendor_add`, `id_user_edit`, `date_produk_vendor_edit`, `id_user_delete`, `date_produk_vendor_delete`) VALUES
(14, '3F03-0600-055-11', 'Sefar Accuflow 03-600-20 ADBLUE 50 items/package', 'PACKAGE', 'Color: ADBLUE\r\nAmount: 50 items/package', 0, 20, 9, 11, '2019-06-12 13:38:39', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `id_quo` int(11) NOT NULL,
  `versi_quo` int(11) NOT NULL,
  `id_request` int(11) NOT NULL,
  `no_quo` varchar(200) NOT NULL,
  `hal_quo` text NOT NULL,
  `id_cp` int(11) NOT NULL COMMENT 'nanti ini ambil data perusahaanya',
  `up_cp` varchar(200) NOT NULL,
  `durasi_pengiriman` int(11) NOT NULL,
  `franco` varchar(200) NOT NULL,
  `durasi_pembayaran` int(11) NOT NULL,
  `mata_uang_pembayaran` varchar(100) NOT NULL,
  `dateline_quo` date NOT NULL,
  `status_quo` int(11) NOT NULL DEFAULT '0' COMMENT 'status quo 1: loss, 2: win, 3 uda oc',
  `id_user_add` int(11) NOT NULL,
  `date_quo_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_quo_edit` datetime DEFAULT NULL,
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_quo_delete` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`id_quo`, `versi_quo`, `id_request`, `no_quo`, `hal_quo`, `id_cp`, `up_cp`, `durasi_pengiriman`, `franco`, `durasi_pembayaran`, `mata_uang_pembayaran`, `dateline_quo`, `status_quo`, `id_user_add`, `date_quo_add`, `id_user_edit`, `date_quo_edit`, `id_user_delete`, `date_quo_delete`) VALUES
(5, 1, 6, 'QUO-00005', 'asdf', 1, 'asdf', 5, 'Surabaya', 5, 'IDR', '2019-07-01', 0, 11, '2019-06-03 22:47:29', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item`
--

CREATE TABLE `quotation_item` (
  `id_quotation_item` int(11) NOT NULL,
  `id_quotation` int(11) NOT NULL,
  `quo_version` int(11) NOT NULL,
  `id_request_item` int(11) NOT NULL,
  `id_cp_shipper` int(11) NOT NULL,
  `metode_shipping` varchar(200) NOT NULL,
  `id_cp_vendor` int(11) NOT NULL,
  `id_cp_courier` int(11) NOT NULL,
  `metode_courier` varchar(200) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `selling_price` bigint(20) NOT NULL,
  `final_amount` int(11) NOT NULL DEFAULT '0',
  `final_selling_price` bigint(20) NOT NULL DEFAULT '0',
  `margin_price` decimal(10,3) NOT NULL,
  `id_oc` int(11) NOT NULL DEFAULT '0' COMMENT 'awalnyakan bleom ke oc mana2, setelah oc terbuat dan item di centang, ini ke update dia ada di oc mana ',
  `status_oc_item` int(11) NOT NULL DEFAULT '1' COMMENT '1 : ga di accept di OC; 0 yang fixed dipesen',
  `sudah_po` int(11) NOT NULL DEFAULT '1' COMMENT '1: belum po, 0: sudah po'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_item`
--

INSERT INTO `quotation_item` (`id_quotation_item`, `id_quotation`, `quo_version`, `id_request_item`, `id_cp_shipper`, `metode_shipping`, `id_cp_vendor`, `id_cp_courier`, `metode_courier`, `item_amount`, `selling_price`, `final_amount`, `final_selling_price`, `margin_price`, `id_oc`, `status_oc_item`, `sudah_po`) VALUES
(63, 1, 1, 42, 7, 'SEA', 3, 7, 'SEA', 20, 12345679999, 15, 1111111111111111, '12.188', 0, 0, 1),
(64, 2, 1, 44, 16, 'AIR', 3, 27, 'LAND', 20, 10000000000, 0, 0, '75.250', 0, 1, 1),
(65, 3, 1, 50, 9, 'AIR', 15, 28, 'LAND', 15, 5000000000, 0, 0, '48.400', 0, 1, 1),
(66, 4, 1, 1, 9, 'AIR', 15, 28, 'LAND', 15, 3000000000, 0, 0, '14.000', 0, 1, 1),
(68, 5, 1, 44, 16, 'AIR', 3, 27, 'LAND', 20, 324342344444, 20, 320000000000, '99.237', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(200) NOT NULL DEFAULT '-',
  `status_satuan` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_satuan_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_satuan_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date-satuan_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`, `status_satuan`, `id_user_add`, `date_satuan_add`, `id_user_edit`, `date_satuan_edit`, `id_user_delete`, `date-satuan_delete`) VALUES
(9, 'M', 0, 11, '2019-06-11 22:04:09', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(10, 'M0', 0, 11, '2019-06-11 23:08:29', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(11, 'KM', 1, 0, '2019-06-12 00:47:45', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(12, 'ASDF', 1, 0, '2019-06-12 00:47:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(13, 'PCS', 0, 11, '2019-06-12 10:31:44', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(14, 'ROLL', 0, 11, '2019-06-12 13:31:59', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(15, 'PACKAGE', 0, 11, '2019-06-12 13:35:25', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `success_project`
--

CREATE TABLE `success_project` (
  `id_success_project` int(11) NOT NULL,
  `id_quo` int(11) NOT NULL,
  `status_po` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_user`
--

CREATE TABLE `tipe_user` (
  `id_user` int(11) NOT NULL,
  `id_tipe` int(11) NOT NULL COMMENT '0 = employee, 1 = sales, 2 = labor, 3 = super'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe_user`
--

INSERT INTO `tipe_user` (`id_user`, `id_tipe`) VALUES
(23, 0),
(11, 3),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL DEFAULT '-',
  `email_user` varchar(100) NOT NULL DEFAULT '-',
  `nohp_user` varchar(15) NOT NULL DEFAULT '-',
  `password` text,
  `jenis_user` varchar(100) NOT NULL DEFAULT '-',
  `status_user` int(11) NOT NULL DEFAULT '0',
  `id_user_add` int(11) NOT NULL DEFAULT '0',
  `date_user_add` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `date_user_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `date_user_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email_user`, `nohp_user`, `password`, `jenis_user`, `status_user`, `id_user_add`, `date_user_add`, `id_user_edit`, `date_user_edit`, `id_user_delete`, `date_user_delete`) VALUES
(11, 'Joshua Natan', 'joshuanatan.jn@gmail.com', '089616961915', '523c2c2940a37fb651b7a19b68149e0b', 'USER', 0, 11, '2019-06-12 14:25:08', 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(27, 'Darus', 'darus@leiter.co.id', '081239438491', 'e10adc3949ba59abbe56e057f20f883e', 'USER', 0, 11, '2019-06-12 14:40:34', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00'),
(28, 'Daniel Wijaya', 'daniel@leiter.co.id', '089766784456', 'e10adc3949ba59abbe56e057f20f883e', 'USER', 0, 11, '2019-06-12 15:02:25', 11, '0000-00-00 00:00:00', 11, '0000-00-00 00:00:00');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `Default Privilage and log user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	insert into privilage(privilage.id_menu, privilage.id_user, privilage.status_privilage, privilage.id_user_edit,privilage.date_user_edit) select menu.id_menu, NEW.id_user,1,'SYSTEM',now() from menu;
    
    insert into log_user(log_user.id_user, log_user.nama_user, log_user.email_user, log_user.nohp_user, log_user.status_user, log_user.id_user_author,log_user.date_edit) values(NEW.id_user, NEW.nama_user, NEW.email_user, NEW.nohp_user, NEW.status_user, NEW.id_user_add, NEW.date_user_add);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Edit Log User` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
	insert into log_user(log_user.id_user, log_user.nama_user, log_user.email_user, log_user.nohp_user, log_user.status_user, log_user.id_user_author,log_user.date_edit) values(NEW.id_user, NEW.nama_user, NEW.email_user, NEW.nohp_user, NEW.status_user, NEW.id_user_add, NEW.date_user_add);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `variable_courier_price`
--

CREATE TABLE `variable_courier_price` (
  `id_variable_courier` int(11) NOT NULL,
  `shipping_purpose` varchar(50) NOT NULL,
  `metode_pengiriman` varchar(10) NOT NULL,
  `id_cp` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `nama_variable` varchar(300) NOT NULL,
  `biaya_variable` int(11) NOT NULL,
  `kurs_variable` int(11) NOT NULL,
  `mata_uang` varchar(100) NOT NULL DEFAULT 'USD',
  `status_variable` int(11) NOT NULL DEFAULT '0',
  `id_request_item` int(11) NOT NULL,
  `id_user_add` int(11) NOT NULL,
  `id_variable_shipping_price_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `id_variable_shipping_price_edit` datetime DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `id_variable_shipping_price_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variable_courier_price`
--

INSERT INTO `variable_courier_price` (`id_variable_courier`, `shipping_purpose`, `metode_pengiriman`, `id_cp`, `id_perusahaan`, `nama_variable`, `biaya_variable`, `kurs_variable`, `mata_uang`, `status_variable`, `id_request_item`, `id_user_add`, `id_variable_shipping_price_add`, `id_user_edit`, `id_variable_shipping_price_edit`, `id_user_delete`, `id_variable_shipping_price_delete`) VALUES
(1, 'CUSTOMER', 'SEA', 7, 8, 'testsetwojoawjefo', 10000, 1000, 'USD', 1, 42, 11, '2019-05-19 22:06:19', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(2, 'CUSTOMER', 'LAND', 7, 8, 'test 1 land customer', 123000, 321000, 'USD', 0, 42, 11, '2019-05-19 22:21:02', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(3, 'CUSTOMER', 'SEA', 8, 9, 'Sea garuda asdf ', 102000, 12000, 'USD', 0, 42, 11, '2019-05-19 22:43:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(4, 'CUSTOMER', 'SEA', 7, 8, 'test1 sea asf', 120000, 15000, 'USD', 0, 42, 11, '2019-05-19 22:43:37', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(5, 'CUSTOMER', 'SEA', 7, 8, 'test1 sea asf 2', 14000, 11000, 'USD', 0, 42, 11, '2019-05-19 22:43:37', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(6, 'CUSTOMER', 'AIR', 8, 9, 'courier 1', 12000, 12000, 'USD', 0, 47, 11, '2019-06-03 02:30:23', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, 'CUSTOMER', 'AIR', 8, 9, 'courier barang 2', 12000, 11000, 'USD', 0, 48, 11, '2019-06-03 02:31:45', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, 'CUSTOMER', 'LAND', 28, 16, 'barang 2 courier 1', 12000, 11000, 'USD', 0, 48, 11, '2019-06-03 02:33:22', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, 'CUSTOMER', 'LAND', 28, 16, 'barang serius microsoft lion land 1', 30000, 10000, 'IDR', 0, 44, 11, '2019-06-03 08:34:12', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(10, 'CUSTOMER', 'LAND', 27, 16, 'asdf liond land 1', 45000, 1000, 'USD', 0, 50, 11, '2019-06-03 08:34:51', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(11, 'CUSTOMER', 'LAND', 27, 16, 'barang serius microsoft lion land 2', 12000, 11000, 'EUR', 0, 44, 11, '2019-06-07 00:42:16', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `variable_shipping_price`
--

CREATE TABLE `variable_shipping_price` (
  `id_variable_shipping` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `shipping_purpose` varchar(50) NOT NULL,
  `metode_pengiriman` varchar(10) NOT NULL,
  `id_cp` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `nama_variable` varchar(300) NOT NULL,
  `biaya_variable` int(11) NOT NULL,
  `kurs_variable` int(11) NOT NULL,
  `mata_uang` varchar(100) NOT NULL DEFAULT 'USD',
  `status_variable` int(11) NOT NULL DEFAULT '0',
  `id_request_item` int(11) NOT NULL,
  `id_user_add` int(11) NOT NULL,
  `id_variable_shipping_price_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user_edit` int(11) NOT NULL DEFAULT '0',
  `id_variable_shipping_price_edit` datetime DEFAULT '0000-00-00 00:00:00',
  `id_user_delete` int(11) NOT NULL DEFAULT '0',
  `id_variable_shipping_price_delete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variable_shipping_price`
--

INSERT INTO `variable_shipping_price` (`id_variable_shipping`, `id_supplier`, `shipping_purpose`, `metode_pengiriman`, `id_cp`, `id_perusahaan`, `nama_variable`, `biaya_variable`, `kurs_variable`, `mata_uang`, `status_variable`, `id_request_item`, `id_user_add`, `id_variable_shipping_price_add`, `id_user_edit`, `id_variable_shipping_price_edit`, `id_user_delete`, `id_variable_shipping_price_delete`) VALUES
(1, 3, 'SUPPLIER', 'SEA', 8, 9, 'garuda sea ayovendor asdf 1', 11000, 11000, 'USD', 0, 42, 11, '2019-05-19 20:10:09', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(2, 3, 'SUPPLIER', 'SEA', 8, 9, 'garuda sea ayovendor asdf 2', 12000, 12000, 'USD', 0, 42, 11, '2019-05-19 20:10:10', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(3, 4, 'SUPPLIER', 'SEA', 8, 9, 'garuda sea keduasetelahpertama asdf 1', 13000, 13000, 'USD', 0, 42, 11, '2019-05-19 20:12:37', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(4, 4, 'SUPPLIER', 'SEA', 8, 9, 'garuda sea keduasetelahpertama asdf 2', 14000, 14000, 'USD', 0, 42, 11, '2019-05-19 20:12:37', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(5, 3, 'SUPPLIER', 'AIR', 8, 9, 'garuda air ayovendor asdf 1', 11000, 11000, 'USD', 0, 42, 11, '2019-05-19 20:13:41', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(6, 3, 'SUPPLIER', 'AIR', 8, 9, 'garuda air ayovendor asdf 2', 12000, 12000, 'USD', 0, 42, 11, '2019-05-19 20:13:41', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, 3, 'SUPPLIER', 'LAND', 7, 8, 'test1 land ayovendor asdf 1', 11000, 11000, 'USD', 0, 42, 11, '2019-05-19 20:14:31', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, 3, 'SUPPLIER', 'LAND', 7, 8, 'test1 land ayovendor asdf 2', 12000, 12000, 'USD', 0, 42, 11, '2019-05-19 20:14:31', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, 3, 'SUPPLIER', 'SEA', 7, 8, 'test1 sea ayovendor asdf 1', 11000, 11000, 'USD', 0, 42, 11, '2019-05-19 20:14:56', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(10, 3, 'SUPPLIER', 'SEA', 7, 8, 'test1 sea ayovendor asdf 2', 12000, 12000, 'USD', 0, 42, 11, '2019-05-19 20:14:56', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(11, 4, 'SUPPLIER', 'LAND', 7, 8, 'test1 land keduasetelahpertama asdf 1', 14000, 14000, 'USD', 0, 42, 11, '2019-05-19 20:17:50', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(12, 4, 'SUPPLIER', 'LAND', 7, 8, 'test1 land keduasetelahpertama asdf 2', 16000, 16000, 'USD', 0, 42, 11, '2019-05-19 20:17:50', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(13, 4, 'SUPPLIER', 'SEA', 7, 8, 'test1 sea keduasetelahpertama asdf 1', 154000, 12000, 'USD', 0, 42, 11, '2019-05-19 20:18:18', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(14, 4, 'SUPPLIER', 'SEA', 7, 8, 'test1 sea keduasetelahpertama asdf 2', 18000, 17000, 'USD', 0, 42, 11, '2019-05-19 20:18:18', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(15, 4, 'SUPPLIER', 'AIR', 8, 9, 'garuda air keduasetelahpertama asdf 1', 12300, 12000, 'USD', 0, 42, 11, '2019-05-19 20:19:34', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(16, 4, 'SUPPLIER', 'AIR', 8, 9, 'garuda air keduasetelahpertama asdf 2', 15000, 14000, 'USD', 0, 42, 11, '2019-05-19 20:19:34', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(17, 3, 'SUPPLIER', 'AIR', 8, 9, 'letsgo garuda stevan air 1', 120000, 15000, 'USD', 0, 47, 11, '2019-06-03 02:23:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(18, 3, 'SUPPLIER', 'AIR', 8, 9, 'letsgo garuda stevan air 2', 14000, 11000, 'USD', 0, 47, 11, '2019-06-03 02:23:55', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(19, 3, 'SUPPLIER', 'LAND', 27, 16, 'letsgo lion rojo land 1', 15000, 12000, 'USD', 0, 47, 11, '2019-06-03 02:24:39', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(20, 3, 'SUPPLIER', 'LAND', 27, 16, 'letsgo lion rojo land 2', 12000, 12000, 'USD', 0, 47, 11, '2019-06-03 02:24:39', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(21, 3, 'SUPPLIER', 'AIR', 27, 16, 'letsgo lion rojo air 1', 12000, 11000, 'USD', 0, 47, 11, '2019-06-03 02:25:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(22, 3, 'SUPPLIER', 'AIR', 27, 16, 'letsgo lion rojo air 2', 10000, 9000, 'USD', 0, 47, 11, '2019-06-03 02:25:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(23, 3, 'SUPPLIER', 'AIR', 27, 16, 'letsgo lion rojo air 3', 15000, 12000, 'USD', 0, 47, 11, '2019-06-03 02:25:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(24, 4, 'SUPPLIER', 'SEA', 28, 16, 'PT KEDUA SETELAH PERTAMA lion rojo sea 1', 12000, 100, 'USD', 0, 47, 11, '2019-06-03 02:27:08', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(25, 4, 'SUPPLIER', 'SEA', 28, 16, 'PT KEDUA SETELAH PERTAMA lion rojo sea 2', 16000, 12000, 'USD', 0, 47, 11, '2019-06-03 02:27:08', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(26, 15, 'SUPPLIER', 'AIR', 28, 16, 'PT Microsoft Indonesia lion air 1', 12000, 7700, 'USD', 0, 48, 11, '2019-06-03 02:29:24', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(27, 15, 'SUPPLIER', 'AIR', 8, 9, 'barang serius microsoft garuda air 1', 10000, 1000, 'USD', 0, 44, 11, '2019-06-03 08:31:19', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(28, 15, 'SUPPLIER', 'AIR', 8, 9, 'barang serius microsoft garuda air 2', 20000, 1000, 'USD', 0, 44, 11, '2019-06-03 08:31:19', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(29, 3, 'SUPPLIER', 'AIR', 27, 16, 'asdf vendore lion air 1', 30000, 1000, 'IDR', 0, 50, 11, '2019-06-03 08:33:39', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(30, 3, 'SUPPLIER', 'LAND', 28, 16, 'Lion Air Land ayo vendore', 1200000, 1000, 'USD', 0, 50, 11, '2019-06-07 00:28:04', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(31, 15, 'SUPPLIER', 'SEA', 27, 16, 'lion air sea barang serius', 12000, 1, 'IDR', 0, 44, 11, '2019-06-07 00:32:21', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(32, 3, 'SUPPLIER', 'AIR', 8, 9, 'Garuda air asdf leiter 1', 12000, 15000, 'EUR', 0, 51, 11, '2019-06-08 08:03:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(33, 3, 'SUPPLIER', 'AIR', 8, 9, 'Garuda air asdf leiter 2', 13000, 16000, 'USD', 0, 51, 11, '2019-06-08 08:03:57', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(34, 4, 'SUPPLIER', 'AIR', 8, 9, 'garuda air supplier 2', 12000, 11000, 'USD', 0, 51, 11, '2019-06-08 08:04:32', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(35, 3, 'SUPPLIER', 'AIR', 8, 9, 'variable 1', 12000, 10000, 'USD', 0, 53, 11, '2019-06-11 10:27:32', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(36, 3, 'SUPPLIER', 'AIR', 8, 9, 'variable 2', 15000, 1000, 'USD', 0, 53, 11, '2019-06-11 10:27:32', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`id_cp`);

--
-- Indexes for table `finance_usage_type`
--
ALTER TABLE `finance_usage_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `harga_vendor`
--
ALTER TABLE `harga_vendor`
  ADD PRIMARY KEY (`id_harga_vendor`);

--
-- Indexes for table `invoice_core`
--
ALTER TABLE `invoice_core`
  ADD PRIMARY KEY (`id_invoice`);

--
-- Indexes for table `log_privilage`
--
ALTER TABLE `log_privilage`
  ADD PRIMARY KEY (`id_log_privilage`);

--
-- Indexes for table `log_user`
--
ALTER TABLE `log_user`
  ADD PRIMARY KEY (`id_log_user`);

--
-- Indexes for table `mata_uang`
--
ALTER TABLE `mata_uang`
  ADD PRIMARY KEY (`id_mata_uang`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode_pembayaran`);

--
-- Indexes for table `metode_pengiriman_shipping`
--
ALTER TABLE `metode_pengiriman_shipping`
  ADD PRIMARY KEY (`id_perusahaan`,`metode_pengiriman`);

--
-- Indexes for table `od_core`
--
ALTER TABLE `od_core`
  ADD PRIMARY KEY (`id_od`);

--
-- Indexes for table `od_item`
--
ALTER TABLE `od_item`
  ADD PRIMARY KEY (`id_od_item`);

--
-- Indexes for table `order_confirmation`
--
ALTER TABLE `order_confirmation`
  ADD PRIMARY KEY (`id_oc`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `po_core`
--
ALTER TABLE `po_core`
  ADD PRIMARY KEY (`id_po`);

--
-- Indexes for table `po_item`
--
ALTER TABLE `po_item`
  ADD PRIMARY KEY (`id_po_item`);

--
-- Indexes for table `po_setting`
--
ALTER TABLE `po_setting`
  ADD PRIMARY KEY (`id_po_setting`);

--
-- Indexes for table `price_request`
--
ALTER TABLE `price_request`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `price_request_item`
--
ALTER TABLE `price_request_item`
  ADD PRIMARY KEY (`id_request_item`);

--
-- Indexes for table `privilage`
--
ALTER TABLE `privilage`
  ADD PRIMARY KEY (`id_privilage`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_vendor`
--
ALTER TABLE `produk_vendor`
  ADD PRIMARY KEY (`id_produk_vendor`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id_quo`,`versi_quo`);

--
-- Indexes for table `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`id_quotation_item`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `success_project`
--
ALTER TABLE `success_project`
  ADD PRIMARY KEY (`id_success_project`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `variable_courier_price`
--
ALTER TABLE `variable_courier_price`
  ADD PRIMARY KEY (`id_variable_courier`);

--
-- Indexes for table `variable_shipping_price`
--
ALTER TABLE `variable_shipping_price`
  ADD PRIMARY KEY (`id_variable_shipping`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `finance_usage_type`
--
ALTER TABLE `finance_usage_type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `harga_vendor`
--
ALTER TABLE `harga_vendor`
  MODIFY `id_harga_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `invoice_core`
--
ALTER TABLE `invoice_core`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_privilage`
--
ALTER TABLE `log_privilage`
  MODIFY `id_log_privilage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `log_user`
--
ALTER TABLE `log_user`
  MODIFY `id_log_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `mata_uang`
--
ALTER TABLE `mata_uang`
  MODIFY `id_mata_uang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_metode_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `od_item`
--
ALTER TABLE `od_item`
  MODIFY `id_od_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `po_item`
--
ALTER TABLE `po_item`
  MODIFY `id_po_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `price_request`
--
ALTER TABLE `price_request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `price_request_item`
--
ALTER TABLE `price_request_item`
  MODIFY `id_request_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `privilage`
--
ALTER TABLE `privilage`
  MODIFY `id_privilage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `produk_vendor`
--
ALTER TABLE `produk_vendor`
  MODIFY `id_produk_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `id_quotation_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `success_project`
--
ALTER TABLE `success_project`
  MODIFY `id_success_project` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `variable_courier_price`
--
ALTER TABLE `variable_courier_price`
  MODIFY `id_variable_courier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `variable_shipping_price`
--
ALTER TABLE `variable_shipping_price`
  MODIFY `id_variable_shipping` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
