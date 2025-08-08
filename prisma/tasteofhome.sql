-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2025 at 10:01 AM
-- Server version: 5.6.51
-- PHP Version: 8.1.29

CREATE DATABASE IF NOT EXISTS `tasteofhome` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tasteofhome`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasteofhome`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdefault` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` VALUES(1, 'SẢN PHẨM CHẤT LƯỢNG', '<p>Chúng tôi cam kết mang đến những sản phẩm chất lượng, được sản xuất và chế biến từ những vùng đất nổi tiếng về độ ngon và an toàn vệ sinh thực phẩm.</p>', NULL, NULL, NULL, 'dam-bao-chat-luong.png', 'san-pham-chat-luong', 0, 1, 1, 2, '2025-01-13 10:57:52', '2025-01-20 23:53:17');
INSERT INTO `about_us` VALUES(2, 'GIÁ CẢ HỢP LÝ', '<p>Chúng tôi cung cấp các đặc sản với mức giá cạnh tranh, phù hợp với nhu cầu của mọi đối tượng khách hàng.</p>', NULL, NULL, NULL, 'gia-ca-hop-ly.png', 'gia-ca-hop-ly', 0, 3, 1, 2, '2025-01-13 10:58:17', '2025-01-22 08:35:47');
INSERT INTO `about_us` VALUES(3, 'GIAO HÀNG TẬN NƠI', '<p>Dù bạn ở bất kỳ đâu kể cả nước ngoài, chúng tôi sẽ giao hàng tận nơi nhanh chóng, bảo đảm chất lượng sản phẩm, liên hệ trực tiếp số điện thoại: 08 42 81 81 32 để được tư vấn tận tình</p>', NULL, NULL, NULL, 'giao-hang-tan-noi.png', 'giao-hang-tan-noi', 0, 5, 1, 2, '2025-01-13 10:58:59', '2025-01-22 07:10:44');
INSERT INTO `about_us` VALUES(4, 'ĐÓNG GÓI CẨN THẬN', NULL, NULL, NULL, NULL, 'logo-dong-doi.png', 'dong-goi-can-than', 0, 4, 1, 2, '2025-01-20 23:47:20', '2025-01-22 07:10:54');
INSERT INTO `about_us` VALUES(5, 'TƯ VẤN NHIỆT TÌNH', NULL, NULL, NULL, NULL, 'logo-tu-van.png', 'tu-van-nhiet-tinh', 0, 2, 1, 2, '2025-01-20 23:47:41', '2025-01-22 08:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_tab` tinyint(4) DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` VALUES(1, 'Flash sales', NULL, NULL, 1, 'banner-3_1.jpg', 1, 2, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_id` tinyint(4) NOT NULL DEFAULT '0',
  `commission` tinyint(4) DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `isstaff` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` VALUES(1, 'WEB-250216223159', 'Kim Loan', 0, 0, NULL, NULL, 'ntkl77@gmail.com', '0948844889', '103 Pasteur, Q1', 1, NULL, '$2y$12$2ZJhghimutv2kg.vmWPwuOiLCAm9o1xJNTp2Q3Wsj.dkJPMF4cFWi', 1, 0, NULL, 0, NULL, '2025-02-16 15:32:00', '2025-02-16 15:32:00');
INSERT INTO `agents` VALUES(2, 'WEB-250217115037', 'zkWLxGpGzYDSEc', 0, 0, NULL, NULL, 'hubbardjaddhn@gmail.com', '6006303231', 'yIUDHCVTNIXs', 1, NULL, '$2y$12$.C.25.3lzgtuoLjKjijw2eOhgsjlDyHEYMm3/eNg0kGd4TxgB.Lqa', 1, 0, NULL, 0, NULL, '2025-02-17 04:50:37', '2025-02-17 04:50:37');
INSERT INTO `agents` VALUES(3, 'WEB-250218144351', 'qpOcIFqU', 0, 0, NULL, NULL, 'gonzdarkeih7@gmail.com', '5560655669', 'gRhDLGgIxYZBcO', 1, NULL, '$2y$12$JtLN6quTXaLj32EVVY6hx..92FqS4x9TAQAfiVrl1nb1OxHFAlg1G', 1, 0, NULL, 0, NULL, '2025-02-18 07:43:52', '2025-02-18 07:43:52');
INSERT INTO `agents` VALUES(4, 'WEB-250220003032', 'CVdhizAA', 0, 0, NULL, NULL, 'zazevenopo699@gmail.com', '7876727629', 'uOYbsHzYI', 1, NULL, '$2y$12$YymEvhRWnRJHAnvh4fDO8e0TJvDHq03JVCJIqZPb0FjOUuqrPAMNa', 1, 0, NULL, 0, NULL, '2025-02-19 17:30:33', '2025-02-19 17:30:33');
INSERT INTO `agents` VALUES(5, 'WEB-250222110042', 'qJUnlGPXePfrAKj', 0, 0, NULL, NULL, 'ywilkersonmn46@gmail.com', '4307648169', 'vUVesNbepmoE', 1, NULL, '$2y$12$v/ADNH4KuRGHJ0nHhxcCju2uCbS.ljAPy684Fplo9i6coTibuteuW', 1, 0, NULL, 0, NULL, '2025-02-22 04:00:42', '2025-02-22 04:00:42');
INSERT INTO `agents` VALUES(6, 'WEB-250223093119', 'oeHMUXfIdPlnHm', 0, 0, NULL, NULL, 'oldindaw30@gmail.com', '3666875262', 'qygHNsZYrTtPz', 1, NULL, '$2y$12$T3FWRkPZ2Gl45ivivOAEs.R3D8.6xCLoSfXZQf1F5KHWNsKiN1.pe', 1, 0, NULL, 0, NULL, '2025-02-23 02:31:20', '2025-02-23 02:31:20');
INSERT INTO `agents` VALUES(7, 'WEB-250224031251', 'srjSyKFPZvIbCOW', 0, 0, NULL, NULL, 'cohensilverd39@gmail.com', '9844835050', 'qQucyBhfq', 1, NULL, '$2y$12$fdvBg.lkbFV8pTalHF0zq.ViYB3xDU8Hwcz2ccW0oPteuiWMEME4y', 1, 0, NULL, 0, NULL, '2025-02-23 20:12:52', '2025-02-23 20:12:52');
INSERT INTO `agents` VALUES(8, 'WEB-250226031902', 'qaBjhqvmzQgTQ', 0, 0, NULL, NULL, 'foliobison@yahoo.com', '5519489132', 'xyVNTegxNfyij', 1, NULL, '$2y$12$NkTjNSqrvaj3bNaCs5w.QOsOM/izrqsNEsRAgFvyyOsIiSA/tRSwe', 1, 0, NULL, 0, NULL, '2025-02-25 20:19:03', '2025-02-25 20:19:03');
INSERT INTO `agents` VALUES(9, 'WEB-250227193250', 'XhpyumKvd', 0, 0, NULL, NULL, 'ramirezaetelrikqi@gmail.com', '4263960228', 'wRybcxzPpP', 1, NULL, '$2y$12$FIbDZ60GEdfd821s0pC.EuAx.V0tHGdJWfA5YXRFxrA.hnLSPB3pK', 1, 0, NULL, 0, NULL, '2025-02-27 12:32:51', '2025-02-27 12:32:51');
INSERT INTO `agents` VALUES(10, 'WEB-250228192858', 'uINvHjkmAViQxtd', 0, 0, NULL, NULL, 'lyizabe@gmail.com', '7163774959', 'eHVuaVRoUalDrrg', 1, NULL, '$2y$12$Pvzzxzq/Z/FNpnmKUdoE7eced7iaIKeQXmuUbApOQA4MSn0nhEgJ.', 1, 0, NULL, 0, NULL, '2025-02-28 12:28:58', '2025-02-28 12:28:58');
INSERT INTO `agents` VALUES(11, 'WEB-250301130518', 'CvTRFndYrAxdlK', 0, 0, NULL, NULL, 'syzirushq3@gmail.com', '4759329772', 'JkKLXnRls', 1, NULL, '$2y$12$Jma9XlT1pHuRKj7X7OeYRufjdZpvSszv8LrVM8y7JnvjuffLUjcwC', 1, 0, NULL, 0, NULL, '2025-03-01 06:05:19', '2025-03-01 06:05:19');
INSERT INTO `agents` VALUES(12, 'WEB-250302064822', 'AqCWLGBzQt', 0, 0, NULL, NULL, 'denmalone40@gmail.com', '2354310900', 'ldJtCOtkvWBxW', 1, NULL, '$2y$12$aIXeEtzIhMZFbSzjvY7XpOD88.Ze8ePV.7VJSHVKRpjkwUcqEZPBi', 1, 0, NULL, 0, NULL, '2025-03-01 23:48:23', '2025-03-01 23:48:23');
INSERT INTO `agents` VALUES(13, 'WEB-250303000024', 'FTDzTjBGAaxxla', 0, 0, NULL, NULL, 'vddhlisumdl@yahoo.com', '8285652850', 'eIyiXFdNI', 1, NULL, '$2y$12$3gM/BIcoHF6AjNsZX5hzJO.xJnhAwLwAFoIAeO7ETIPWyM/gmcp4u', 1, 0, NULL, 0, NULL, '2025-03-02 17:00:24', '2025-03-02 17:00:24');
INSERT INTO `agents` VALUES(14, 'WEB-250303154137', 'sEnUwHwJr', 0, 0, NULL, NULL, 'tc9qilhfz@yahoo.com', '2512422256', 'ysVvTBxzMWtMI', 1, NULL, '$2y$12$VL4ArAkpb/UbWUbKeybZ0e2tzNV6gwUpnKjmcf36i6saXPJ1gwHiy', 1, 0, NULL, 0, NULL, '2025-03-03 08:41:37', '2025-03-03 08:41:37');
INSERT INTO `agents` VALUES(15, 'WEB-250304172117', 'jtvAxWgBQGQRDU', 0, 0, NULL, NULL, 'povto9ll8w@yahoo.com', '8336373243', 'yARsjIzMvUPdc', 1, NULL, '$2y$12$0TyUoY/NgpFxGhN.XBbpy.hn.wFP84Mw3SlSvVeFE7l3ueMQ8OgI2', 1, 0, NULL, 0, NULL, '2025-03-04 10:21:18', '2025-03-04 10:21:18');
INSERT INTO `agents` VALUES(16, 'WEB-250305180708', 'fuJSCuKezgWhzR', 0, 0, NULL, NULL, 'ashgolden80@gmail.com', '5373166506', 'XLZIMGRGKDaHNd', 1, NULL, '$2y$12$Gvo0urZIAlmPGkE0aETAJudJr8Ne/8e7tj6wep1.DVmWRZw3LMLHi', 1, 0, NULL, 0, NULL, '2025-03-05 11:07:09', '2025-03-05 11:07:09');
INSERT INTO `agents` VALUES(17, 'WEB-250307004622', 'iweZPtrajyepM', 0, 0, NULL, NULL, 'zavalamidjlg@gmail.com', '6521714432', 'rMPimUGYr', 1, NULL, '$2y$12$ukTkbeJFPm6pSh78Y.YQdOYpMt9yzw8MqDQyKAoOXmEVknI0ZifR.', 1, 0, NULL, 0, NULL, '2025-03-06 17:46:22', '2025-03-06 17:46:22');
INSERT INTO `agents` VALUES(18, 'WEB-250308071318', 'SOQEjrSt', 0, 0, NULL, NULL, 'iutempestau72zeal10@gmail.com', '6074589760', 'nUfwtfcBFcvOl', 1, NULL, '$2y$12$V4uqcWI9z.mjvr/WK9VAzeFJ13W/ViIdB4NmIsnu7KoJd0Ba1zmyq', 1, 0, NULL, 0, NULL, '2025-03-08 00:13:18', '2025-03-08 00:13:18');
INSERT INTO `agents` VALUES(19, 'WEB-250309003638', 'IBUANKuZLSkqA', 0, 0, NULL, NULL, 'browningleksiyaos4@gmail.com', '4453599165', 'EusRdCSo', 1, NULL, '$2y$12$EQHxgxn3VxEs7Tgv.Tc4HOIGP6psmD7wJY2BcK.00Vaxqo6BeWNbO', 1, 0, NULL, 0, NULL, '2025-03-08 17:36:39', '2025-03-08 17:36:39');
INSERT INTO `agents` VALUES(20, 'WEB-250310004349', 'JIXZfpibTq', 0, 0, NULL, NULL, 'durhamcherisve@gmail.com', '3824766433', 'xmvrwKwoYUI', 1, NULL, '$2y$12$.CCyo.rQ2ivZOFxJdC5iPOl7RNDmvmmVFFHNWjk4bK/0/JcgrwHOC', 1, 0, NULL, 0, NULL, '2025-03-09 17:43:49', '2025-03-09 17:43:49');
INSERT INTO `agents` VALUES(21, 'WEB-250311194447', 'UEwBaxyLFcb', 0, 0, NULL, NULL, 'kertjordan38@gmail.com', '5699944592', 'bdEHtGbh', 1, NULL, '$2y$12$h7VPxiYGCz2njaAGGcEnSeUCSOyCo9JobYvbe29Z4Qfv4BsBopU/6', 1, 0, NULL, 0, NULL, '2025-03-11 12:44:47', '2025-03-11 12:44:47');
INSERT INTO `agents` VALUES(22, 'WEB-250313132339', 'oVxHoFhWUKpDPq', 0, 0, NULL, NULL, 'dshahk53@gmail.com', '9321397953', 'UHPndotvxDkESi', 1, NULL, '$2y$12$8D6c0aY6/oDfu7uXaIXXNONoLzGLQFy9LRE8N2fSD8OZb4AAgjFEC', 1, 0, NULL, 0, NULL, '2025-03-13 06:23:40', '2025-03-13 06:23:40');
INSERT INTO `agents` VALUES(23, 'WEB-250314153523', 'YlezAwmvc', 0, 0, NULL, NULL, 'eilitspencezy@gmail.com', '7617431300', 'IVUptWKyGQVDE', 1, NULL, '$2y$12$s/gP9.JQJDgjZh58dpglRuCZohgPNeMCNsE1.xqjpCmaVhH/8fWim', 1, 0, NULL, 0, NULL, '2025-03-14 08:35:23', '2025-03-14 08:35:23');
INSERT INTO `agents` VALUES(24, 'WEB-250315133011', 'YjljrQxPNNhO', 0, 0, NULL, NULL, 'delaitgutierrezm2000@gmail.com', '7208005327', 'EUaRDSmeIU', 1, NULL, '$2y$12$vRelIPdQRb2CdSMyuz.E5uZAWCwdwH1wBJWSmyl8u.BQlkDbSGABG', 1, 0, NULL, 0, NULL, '2025-03-15 06:30:11', '2025-03-15 06:30:11');
INSERT INTO `agents` VALUES(25, 'WEB-250316094239', 'tNxIqTrMTy', 0, 0, NULL, NULL, 'arizonabrahmavar955010@yahoo.com', '6986632579', 'cmqTfgRsxLSPgmJ', 1, NULL, '$2y$12$rgAm6eVfc6chKfVclbalxOlOQEiC5CusAWdcDpaO/a41SmUyKzYrK', 1, 0, NULL, 0, NULL, '2025-03-16 02:42:40', '2025-03-16 02:42:40');
INSERT INTO `agents` VALUES(26, 'WEB-250317214550', 'ElMsesAqi', 0, 0, NULL, NULL, 'michelle.salazar21686@yahoo.com', '6503422361', 'WleGxMrmjcEViWc', 1, NULL, '$2y$12$2ipJW9d/CMPymgJDRhvqBOUD2G1pNVZuT5MwqRuTAxPovoPekZ.bC', 1, 0, NULL, 0, NULL, '2025-03-17 14:45:51', '2025-03-17 14:45:51');
INSERT INTO `agents` VALUES(27, 'WEB-250319111044', 'telJIdunAfFNyy', 0, 0, NULL, NULL, 'koylmanjo91@gmail.com', '6745325138', 'DwovcapSkN', 1, NULL, '$2y$12$m2JAX/bnGEkNfuyJMVK4Q.vwFVjHEL4BOGUuhIWsXi2oq2VCn7SGW', 1, 0, NULL, 0, NULL, '2025-03-19 04:10:45', '2025-03-19 04:10:45');
INSERT INTO `agents` VALUES(28, 'WEB-250321201305', 'WXdNvvujh', 0, 0, NULL, NULL, 'jan_classen494561@yahoo.com', '3573676791', 'NGzjNXKUcaSSyk', 1, NULL, '$2y$12$NvVIveEXALUoBViSTBOuG.c5p5CVTBcqDjYRhAzCi4F.F8EJdL2Pe', 1, 0, NULL, 0, NULL, '2025-03-21 13:13:06', '2025-03-21 13:13:06');
INSERT INTO `agents` VALUES(29, 'WEB-250322123642', 'PdLqCLdhXdLis', 0, 0, NULL, NULL, 'colemanberniscq1989@gmail.com', '6319008426', 'EJrmFhMxKMLokwt', 1, NULL, '$2y$12$UGuVCnc1Rx1j3rPz3C58UOqrE5Oizvw.AamspeD.znmjuVlb4Qr.a', 1, 0, NULL, 0, NULL, '2025-03-22 05:36:43', '2025-03-22 05:36:43');
INSERT INTO `agents` VALUES(30, 'WEB-250323033005', 'kNBuIMoUuo', 0, 0, NULL, NULL, 'birhanienovak271100@yahoo.com', '5112045603', 'dFzzYCGFduS', 1, NULL, '$2y$12$D/F2YDSuz4XPoY4V.z2mzeyFhx7ha5xfNpHVFMMXeVT7Uz6BEsa.m', 1, 0, NULL, 0, NULL, '2025-03-22 20:30:06', '2025-03-22 20:30:06');
INSERT INTO `agents` VALUES(31, 'WEB-250323175747', 'ISEGpsdJaJ', 0, 0, NULL, NULL, 'solisfrend2002@gmail.com', '9388556465', 'ccyoxQFWIJNn', 1, NULL, '$2y$12$VAmRI03MUeHPXhAMlCNUgOXN2ueOtGR4zllb5iwvmMblL4bZIljWi', 1, 0, NULL, 0, NULL, '2025-03-23 10:57:48', '2025-03-23 10:57:48');
INSERT INTO `agents` VALUES(32, 'WEB-250324111245', 'lrkgoVEVn', 0, 0, NULL, NULL, 'evans.angie338492@yahoo.com', '5265168241', 'oFYRqylqDLM', 1, NULL, '$2y$12$4.6ap1cr6b/KXPjQvrNKUOradKqfSiWTLd7R2G6Bj3mvYSSlsli5u', 1, 0, NULL, 0, NULL, '2025-03-24 04:12:46', '2025-03-24 04:12:46');
INSERT INTO `agents` VALUES(33, 'WEB-250406005051', 'cFKRmFRofBLa', 0, 0, NULL, NULL, 'vangbelindtd@gmail.com', '6753431387', 'QCzvOzKA', 1, NULL, '$2y$12$yiaNOjaYR7xs14sC.6VPl.pJ7Wuf.1vTp.i6V8M/nkg2P2ZjBisze', 1, 0, NULL, 0, NULL, '2025-04-05 17:50:51', '2025-04-05 17:50:51');
INSERT INTO `agents` VALUES(34, 'WEB-250407005920', 'CMjowVyrt', 0, 0, NULL, NULL, 'chasehykkga32@gmail.com', '3116385422', 'HAvuYKXMcoAz', 1, NULL, '$2y$12$RwemkHq7ymI7exQJbRK13uMHOiQMUrwce3YdtqGqINAkInkXcnfyG', 1, 0, NULL, 0, NULL, '2025-04-06 17:59:21', '2025-04-06 17:59:21');
INSERT INTO `agents` VALUES(35, 'WEB-250407042427', 'kTVyEazEsjLjIx', 0, 0, NULL, NULL, 'willbroydihm1988@gmail.com', '6993525194', 'wsfrsrAozYu', 1, NULL, '$2y$12$H.7uAyeXNjlrZjG1Moy1w.7DG4Q4FiVfTvb32q3u8swwJv4gN4FJW', 1, 0, NULL, 0, NULL, '2025-04-06 21:24:27', '2025-04-06 21:24:27');
INSERT INTO `agents` VALUES(36, 'WEB-250407125942', 'kOswLGsER', 0, 0, NULL, NULL, 'bdjid38@gmail.com', '6283343519', 'fONVLOGQVmPHeKe', 1, NULL, '$2y$12$uokX6Dq254JuZbNUNyat4eGrZFWcTyPLUkx3D3rRr1YPv.m.AB5Ii', 1, 0, NULL, 0, NULL, '2025-04-07 05:59:42', '2025-04-07 05:59:42');
INSERT INTO `agents` VALUES(37, 'WEB-250407154431', 'feoGqYPEI', 0, 0, NULL, NULL, 'redvargas37@gmail.com', '7539114570', 'wgGILcmN', 1, NULL, '$2y$12$ccDKQrLfw250ceN6PtcwNed8bkBtjS6yCSSHvA841QfvUe2melcoS', 1, 0, NULL, 0, NULL, '2025-04-07 08:44:32', '2025-04-07 08:44:32');
INSERT INTO `agents` VALUES(38, 'WEB-250410143704', 'RVSsUlVb', 0, 0, NULL, NULL, 'darsigvz1988@gmail.com', '9382653532', 'ccEXtgNFY', 1, NULL, '$2y$12$GmAehpQFo1pXk6EoXBasDOVLudEXAZIxBzjES5Izid4pH7w3XI0QC', 1, 0, NULL, 0, NULL, '2025-04-10 07:37:05', '2025-04-10 07:37:05');
INSERT INTO `agents` VALUES(39, 'WEB-250411120125', 'wrtXHXGTZp', 0, 0, NULL, NULL, 'hudginsjaime268731@yahoo.com', '5395566275', 'seFgKXrbtyGfFzg', 1, NULL, '$2y$12$W4C4Q0nCgt5qKN5ZviA/AOsTh4UizvIu3vtlxRBiYOQM/nfH3AUX2', 1, 0, NULL, 0, NULL, '2025-04-11 05:01:25', '2025-04-11 05:01:25');
INSERT INTO `agents` VALUES(40, 'WEB-250411141354', 'UOQJjNUUiUNXPR', 0, 0, NULL, NULL, 'gensjg@gmail.com', '4247066847', 'QbxLKuivlQp', 1, NULL, '$2y$12$ikKZk5oGT74NPVWNMoSZCOTMGkN.BfQbK2lQA6a7Rf56O4lPzW4bi', 1, 0, NULL, 0, NULL, '2025-04-11 07:13:55', '2025-04-11 07:13:55');
INSERT INTO `agents` VALUES(41, 'WEB-250411162728', 'rsOSmgWCrUCJBwN', 0, 0, NULL, NULL, 'misty_stokes152776@yahoo.com', '9670131125', 'onSaiyEUMuJvMZe', 1, NULL, '$2y$12$ryPk2.cbIty7sJHnvLuaNO8LdLra6hzrhbrUbNdVCsdorPmNFDTNi', 1, 0, NULL, 0, NULL, '2025-04-11 09:27:28', '2025-04-11 09:27:28');
INSERT INTO `agents` VALUES(42, 'WEB-250412135843', 'vCiKLQgKPFiRp', 0, 0, NULL, NULL, 'alex.ford588593@yahoo.com', '4139770626', 'ywWsYWuOjx', 1, NULL, '$2y$12$Buk9D/FOzn3csjJKkScNHOX.E5MSZACnWYv6g3YM4TK.QG0GEr7n2', 1, 0, NULL, 0, NULL, '2025-04-12 06:58:43', '2025-04-12 06:58:43');
INSERT INTO `agents` VALUES(43, 'WEB-250415131525', 'UFsdSSzO', 0, 0, NULL, NULL, 'michelle.morgan784468@yahoo.com', '4897114433', 'JBYfqcGGg', 1, NULL, '$2y$12$y7OOxYGaQgts.Ivwntlfd.fFNLI0ruZNIA2i6qFi07laetcA05OO2', 1, 0, NULL, 0, NULL, '2025-04-15 06:15:25', '2025-04-15 06:15:25');
INSERT INTO `agents` VALUES(44, 'WEB-250416084750', 'kIOmtwRkgMVloP', 0, 0, NULL, NULL, 'camachchep@gmail.com', '5964523099', 'mbOFlsTackDYPRU', 1, NULL, '$2y$12$rc6ki3pb63BhcN3MB2OFoO6nXiHdHSsHeSbvPx.gUJ5Xso.c1uvaK', 1, 0, NULL, 0, NULL, '2025-04-16 01:47:50', '2025-04-16 01:47:50');
INSERT INTO `agents` VALUES(45, 'WEB-250416135252', 'LLybdNQMVwv', 0, 0, NULL, NULL, 'cvernaq1993@gmail.com', '8368104463', 'zBqMmGhCNRcGw', 1, NULL, '$2y$12$qW/lSq/DVnadDTzEndmXzuocetzQK85cuCyuqoulNx3I0DA4RIeq6', 1, 0, NULL, 0, NULL, '2025-04-16 06:52:53', '2025-04-16 06:52:53');
INSERT INTO `agents` VALUES(46, 'WEB-250418071505', 'pCcggfGaOsVS', 0, 0, NULL, NULL, 'ohardyw1@gmail.com', '6122344256', 'vCIMteUQBEIj', 1, NULL, '$2y$12$VqR/NXa4xXmz3wyp/n2UweEl5d5dYUbqMN5KJJYLACEHY.ijZ5rmu', 1, 0, NULL, 0, NULL, '2025-04-18 00:15:05', '2025-04-18 00:15:05');
INSERT INTO `agents` VALUES(47, 'WEB-250418102343', 'UHosrOmEAyMo', 0, 0, NULL, NULL, 'byrdchelsiuu28@gmail.com', '5264743695', 'JibAfLcwPFpCzvu', 1, NULL, '$2y$12$Vulx1I.c1WS24OwdYGjqvusFKYe8.IA9ByV1Le/5pOniDCpCKglrq', 1, 0, NULL, 0, NULL, '2025-04-18 03:23:43', '2025-04-18 03:23:43');
INSERT INTO `agents` VALUES(48, 'WEB-250420202036', 'SzEXsCbQxtJRaY', 0, 0, NULL, NULL, 'schmittfelisiya53@gmail.com', '3182076523', 'MAuEtNjk', 1, NULL, '$2y$12$coL6P/0IFTnNGO4xLTRU4uqz/Jr0h4Laqr08IlOw8DzCEuItsg7TC', 1, 0, NULL, 0, NULL, '2025-04-20 13:20:37', '2025-04-20 13:20:37');
INSERT INTO `agents` VALUES(49, 'WEB-250421164457', 'IpVLDBsxXdBA', 0, 0, NULL, NULL, 'yondasimsfp@gmail.com', '4268157007', 'dXBLSqdaxhrkq', 1, NULL, '$2y$12$sKpaAMBryX9zLEvjcVFJVegYkiwhi/ok/.Dcihmda3PhH3.hLf2cu', 1, 0, NULL, 0, NULL, '2025-04-21 09:44:57', '2025-04-21 09:44:57');
INSERT INTO `agents` VALUES(50, 'WEB-250421221518', 'wTRJJfLnJbOCE', 0, 0, NULL, NULL, 'villanuevaterans2002@gmail.com', '6449751688', 'vqggJwkZsnkBL', 1, NULL, '$2y$12$Z3mMvdm106jZLFrnF7Cvau4GW1/ojIAz5ZxrkxcrKWw.F9EXvHOs2', 1, 0, NULL, 0, NULL, '2025-04-21 15:15:18', '2025-04-21 15:15:18');
INSERT INTO `agents` VALUES(51, 'WEB-250422034428', 'iCrGizhkyNdo', 0, 0, NULL, NULL, 'oldfolsos@gmail.com', '7200209213', 'TaQuUMji', 1, NULL, '$2y$12$pxBIpuffMzl9iXh2jp2PYuBm.BY4RJ7IHG0eGHc4pONi74BAk7ok2', 1, 0, NULL, 0, NULL, '2025-04-21 20:44:29', '2025-04-21 20:44:29');
INSERT INTO `agents` VALUES(52, 'WEB-250426044721', 'ubUVNfqwkTbdr', 0, 0, NULL, NULL, 'bbollardo@gmail.com', '7951640886', 'JvHBAIoBr', 1, NULL, '$2y$12$whD/op97um8fKRXGxlPo3.KFTQRB7opFHB.BkckJJQnSqU5sgE6c2', 1, 0, NULL, 0, NULL, '2025-04-25 21:47:21', '2025-04-25 21:47:21');
INSERT INTO `agents` VALUES(53, 'WEB-250426185633', 'TZkUPhPFxHqVW', 0, 0, NULL, NULL, 'alfikzq8@gmail.com', '7725732423', 'dAgQxZOGrS', 1, NULL, '$2y$12$7NBYpofIX1hHq4D31vcacusNdKwnYJROkB8sMCDS/m0E/FpMknlGG', 1, 0, NULL, 0, NULL, '2025-04-26 11:56:33', '2025-04-26 11:56:33');
INSERT INTO `agents` VALUES(54, 'WEB-250426212942', 'IfKaSHlgWx', 0, 0, NULL, NULL, 'simmonkaro40@gmail.com', '5834497732', 'svhbKWtdzPAQP', 1, NULL, '$2y$12$zsqFfOVDGdGwV0sqydMV2uPNqvbogs7Wg3Fq4M4iXfYfgOPEuVROW', 1, 0, NULL, 0, NULL, '2025-04-26 14:29:42', '2025-04-26 14:29:42');
INSERT INTO `agents` VALUES(55, 'WEB-250427034017', 'OCDDvxlzhl', 0, 0, NULL, NULL, 'delbesilvef38@gmail.com', '9283984868', 'VhvCdctGHZNZvE', 1, NULL, '$2y$12$d4zlYWuD4E61U1iKxwycRevg3n180H/Up2j2I.HTQt0vwmkDuNXb2', 1, 0, NULL, 0, NULL, '2025-04-26 20:40:18', '2025-04-26 20:40:18');
INSERT INTO `agents` VALUES(56, 'WEB-250427084929', 'DXsrEtslH', 0, 0, NULL, NULL, 'rayanjac42@gmail.com', '9433261014', 'rEgJlbcuQdZcR', 1, NULL, '$2y$12$h4oAFjBw69QlWk1kexHMtOu6A4uqsyVY.sB8rdcLhnCltuhPhT5HG', 1, 0, NULL, 0, NULL, '2025-04-27 01:49:30', '2025-04-27 01:49:30');
INSERT INTO `agents` VALUES(57, 'WEB-250427093641', 'YclxdMjMulbYan', 0, 0, NULL, NULL, 'rosscaseb@gmail.com', '3279798822', 'mxnZRNwLh', 1, NULL, '$2y$12$0S0fTj540usNJ1iNzJX9quVFXczrgaHrPlvqtxdptmKfB2vu63n6m', 1, 0, NULL, 0, NULL, '2025-04-27 02:36:41', '2025-04-27 02:36:41');
INSERT INTO `agents` VALUES(58, 'WEB-250427143934', 'rbafuMaUJxqsu', 0, 0, NULL, NULL, 'mskyilerp@gmail.com', '3080319359', 'CGweoOeBjNNF', 1, NULL, '$2y$12$lQt0l.6eOBeBKeSyrbe5du73HXPc.c1JPmrIO2HCwDcN01WBBFllu', 1, 0, NULL, 0, NULL, '2025-04-27 07:39:34', '2025-04-27 07:39:34');
INSERT INTO `agents` VALUES(59, 'WEB-250427163844', 'NPGMKAWV', 0, 0, NULL, NULL, 'terrensbyh2001@gmail.com', '8847566754', 'EJxcgOetsgkicN', 1, NULL, '$2y$12$GeqD0hUBsS5afTseQjHrXuHfXyf2BKy7JWjsx4gExc6utzk9MF6aS', 1, 0, NULL, 0, NULL, '2025-04-27 09:38:45', '2025-04-27 09:38:45');
INSERT INTO `agents` VALUES(60, 'WEB-250428013115', 'fEUDcbLGKMog', 0, 0, NULL, NULL, 'sberryhc1999@gmail.com', '9217268384', 'iMdZuuczIlxf', 1, NULL, '$2y$12$BIfbn1OYdFTT5VBN5503SuOJ8scRmA7sc1CC1aO4PJWLK/F7JV15e', 1, 0, NULL, 0, NULL, '2025-04-27 18:31:15', '2025-04-27 18:31:15');
INSERT INTO `agents` VALUES(61, 'WEB-250429050551', 'HxVIJTYkN', 0, 0, NULL, NULL, 'tenkacoten1982@yahoo.com', '8446103487', 'YTsQemZwQWzFTb', 1, NULL, '$2y$12$AwLljBdnOC2Y0lvUfPdZAe/zuWidUM9ZPXv0b0f8e0grgNZH8viB6', 1, 0, NULL, 0, NULL, '2025-04-28 22:05:52', '2025-04-28 22:05:52');
INSERT INTO `agents` VALUES(62, 'WEB-250429123531', 'zCrrTJyWmDE', 0, 0, NULL, NULL, 'norrisdjoynic1994@gmail.com', '7038559049', 'EmevCiLxUUmJa', 1, NULL, '$2y$12$Vr93ZzvyUITvjjnCREHoC.bytyWGhJ5eAPDKopHT2uf1elqVtVoO6', 1, 0, NULL, 0, NULL, '2025-04-29 05:35:32', '2025-04-29 05:35:32');
INSERT INTO `agents` VALUES(63, 'WEB-250430143313', 'PjbDSlVsfSuFpoy', 0, 0, NULL, NULL, 'vbowmanuu48@gmail.com', '9686540996', 'zcLNoQiDvTp', 1, NULL, '$2y$12$sv8YqShrHRDFu4yP3BJU5uK6cFUg5UCN7ou8MqvxnzDK0nUHXRQuu', 1, 0, NULL, 0, NULL, '2025-04-30 07:33:13', '2025-04-30 07:33:13');
INSERT INTO `agents` VALUES(64, 'WEB-250430185413', 'ZzeOIGdybpSHhoH', 0, 0, NULL, NULL, 'deivhudsonpe2005@gmail.com', '7408967956', 'JmAlhzvHhIIbm', 1, NULL, '$2y$12$JsP137IruYJ/xAwM/snXgeexJpcLCpZU/x6cOUspk6t.gyvKfb.KG', 1, 0, NULL, 0, NULL, '2025-04-30 11:54:13', '2025-04-30 11:54:13');
INSERT INTO `agents` VALUES(65, 'WEB-250501140505', 'xCObbpqEPXlaXm', 0, 0, NULL, NULL, 'klagoodm34@gmail.com', '9845873895', 'uYvtdwOnq', 1, NULL, '$2y$12$DoemJVw5GUVY9mRv0FPF8OohnLkglHws5.ufJ2cx2Gcx5zG9IlJmu', 1, 0, NULL, 0, NULL, '2025-05-01 07:05:05', '2025-05-01 07:05:05');
INSERT INTO `agents` VALUES(66, 'WEB-250501225820', 'RVGdwIjJptj', 0, 0, NULL, NULL, 'dennboydlb9@gmail.com', '6427665088', 'ralMteTp', 1, NULL, '$2y$12$eDt.oGPCkMWuFK.abHG.YOUXPiJdTa1UDTghi3Qww7bFsavac1gXW', 1, 0, NULL, 0, NULL, '2025-05-01 15:58:20', '2025-05-01 15:58:20');
INSERT INTO `agents` VALUES(67, 'WEB-250502013246', 'mGNuCdOJHrH', 0, 0, NULL, NULL, 'evalinbestd1992@gmail.com', '5267415732', 'rgBiPhxupN', 1, NULL, '$2y$12$ct1KhVPc9QKOHZ10xr.1c.I2jk28dizGGXAZhRfv76EXkHJ1KSIBe', 1, 0, NULL, 0, NULL, '2025-05-01 18:32:46', '2025-05-01 18:32:46');
INSERT INTO `agents` VALUES(68, 'WEB-250502115643', 'KyvYLFIgVWPe', 0, 0, NULL, NULL, 'tironhuang49@gmail.com', '3502676575', 'ngUVQGrAbediXvF', 1, NULL, '$2y$12$R.IPEi.4hOkIvvgRmrjYVerUWxYHPPYDG0CXu6NxiimEL.kahqS3q', 1, 0, NULL, 0, NULL, '2025-05-02 04:56:44', '2025-05-02 04:56:44');
INSERT INTO `agents` VALUES(69, 'WEB-250503103309', 'zsoIoXaeTwnyX', 0, 0, NULL, NULL, 'dmadizinr@gmail.com', '4534730113', 'cnRmAQkRNKTBY', 1, NULL, '$2y$12$k0yjE1x4ahua78Namq1lV./ahfKaLQWZaYqvHIAlJ6cx8wU/BKCm6', 1, 0, NULL, 0, NULL, '2025-05-03 03:33:09', '2025-05-03 03:33:09');
INSERT INTO `agents` VALUES(70, 'WEB-250504210549', 'UQBveNdxiDhyWZp', 0, 0, NULL, NULL, 'nobleklaivzj1986@gmail.com', '7756528317', 'VXsTpjQDYGjxcno', 1, NULL, '$2y$12$rhzeQu0N6bDIYHQXFT4vH.FMNZ7UwAIBV8K4z7xbuHpZeb2.8NQCy', 1, 0, NULL, 0, NULL, '2025-05-04 14:05:49', '2025-05-04 14:05:49');
INSERT INTO `agents` VALUES(71, 'WEB-250505044132', 'rEwPSirFkRAi', 0, 0, NULL, NULL, 'tgrahamjz@gmail.com', '6707008129', 'rHiWxBCEfEEgEbW', 1, NULL, '$2y$12$p4d46MRI9E5YIvHu7UXBauGIeIaMPdwPH7ehpVzH/cIHLxgh.XgKO', 1, 0, NULL, 0, NULL, '2025-05-04 21:41:32', '2025-05-04 21:41:32');
INSERT INTO `agents` VALUES(72, 'WEB-250507173845', 'PuOjkzqzGJlxuW', 0, 0, NULL, NULL, 'sdjervisr@gmail.com', '4137459433', 'nrPrZVZZFpzj', 1, NULL, '$2y$12$9mulXPLjaKWrD4qfpBVGm.F7plrhTCODJzVoh9XIeyxwD9Wvew8fG', 1, 0, NULL, 0, NULL, '2025-05-07 10:38:45', '2025-05-07 10:38:45');
INSERT INTO `agents` VALUES(73, 'WEB-250507180423', 'hrEwfYCtEaNuGW', 0, 0, NULL, NULL, 'keiburnsyu1@gmail.com', '5403716540', 'vyuVeXMiAONigfC', 1, NULL, '$2y$12$5v7uB1mQYVkjtmCDoyjpaOrcqOM5GMUBVgQkE5zNq393.WvKkE9jq', 1, 0, NULL, 0, NULL, '2025-05-07 11:04:23', '2025-05-07 11:04:23');
INSERT INTO `agents` VALUES(74, 'WEB-250512132311', 'YdzfNwkOnZLUi', 0, 0, NULL, NULL, 'idgardbu78@gmail.com', '9033112058', 'wcxpeTgs', 1, NULL, '$2y$12$jVbC57hXLliTuKOK.g3ioOuVcnU1pMQKFRkn878/VJYSpVmhAw4bG', 1, 0, NULL, 0, NULL, '2025-05-12 06:23:12', '2025-05-12 06:23:12');
INSERT INTO `agents` VALUES(75, 'WEB-250513013342', 'LXNbSqoeLIr', 0, 0, NULL, NULL, 'filippariceqk@gmail.com', '5059395392', 'VVrQUeBnA', 1, NULL, '$2y$12$s.BzIbsltAIQ53nPtHsC6uAOW54diPp5u.G23rj2hC.TyPzku6GPK', 1, 0, NULL, 0, NULL, '2025-05-12 18:33:43', '2025-05-12 18:33:43');
INSERT INTO `agents` VALUES(76, 'WEB-250513074034', 'RPaCKJBsDxmCUN', 0, 0, NULL, NULL, 'osmondgonzalesi2004@gmail.com', '5016319097', 'PfwWHZMeZgpCOl', 1, NULL, '$2y$12$vtfxdylaHsPs9qMvEsQWE.YzH3SxtEj3BbzwKpHEmvpz6rSzv6FYW', 1, 0, NULL, 0, NULL, '2025-05-13 00:40:34', '2025-05-13 00:40:34');
INSERT INTO `agents` VALUES(77, 'WEB-250513221115', 'MnXKLcwao', 0, 0, NULL, NULL, 'ayersronhh1980@gmail.com', '9076737295', 'LcaawCcPLZIFqI', 1, NULL, '$2y$12$hUa595pxbM92LmOPS/p3mexv9RdgpjXF/PxuJIPL3xSSBqJ5IWvh6', 1, 0, NULL, 0, NULL, '2025-05-13 15:11:15', '2025-05-13 15:11:15');
INSERT INTO `agents` VALUES(78, 'WEB-250514222827', 'UNeAxsOcMrsW', 0, 0, NULL, NULL, 'mendozafrancisco261314@yahoo.com', '9137890764', 'fWUGWxUJiSjv', 1, NULL, '$2y$12$bxTk9hT2gdve8bAh6hZkM.lbggdO2lM/65pT5ir.GNtr89WUA59bi', 1, 0, NULL, 0, NULL, '2025-05-14 15:28:28', '2025-05-14 15:28:28');
INSERT INTO `agents` VALUES(79, 'WEB-250515034429', 'dXmaSpTiGzFSrb', 0, 0, NULL, NULL, 'bassettwlr@gmail.com', '9525739747', 'XeaNibXbTQpIk', 1, NULL, '$2y$12$8MeUFDCEJKgnPPJCsOZIQenIqRd8o04rLWFRuZxPEjLQC8rZkChcy', 1, 0, NULL, 0, NULL, '2025-05-14 20:44:29', '2025-05-14 20:44:29');
INSERT INTO `agents` VALUES(80, 'WEB-250515091720', 'iVZoFteVY', 0, 0, NULL, NULL, 'braymondg1993@gmail.com', '6829086651', 'eUuJydyCxuJR', 1, NULL, '$2y$12$iIYxU.3elFa9Mhe5DbBXEOaMAXAt8kP8d15U0qZQXKizn7fBu37Vm', 1, 0, NULL, 0, NULL, '2025-05-15 02:17:21', '2025-05-15 02:17:21');
INSERT INTO `agents` VALUES(81, 'WEB-250515180600', 'OegvtNpvOVLykRI', 0, 0, NULL, NULL, 'steelkonk57@gmail.com', '7188271985', 'KGZPgFGt', 1, NULL, '$2y$12$2Ld/LdpiV.7ZA0mAGxn6zuFbr1T33fIxN.kGDcssuw8ho9w/kx9Ey', 1, 0, NULL, 0, NULL, '2025-05-15 11:06:00', '2025-05-15 11:06:00');
INSERT INTO `agents` VALUES(82, 'WEB-250515181158', 'mHHeIwOdRUWCqV', 0, 0, NULL, NULL, 'kertarcherfx@gmail.com', '7160836234', 'NFiDNqRpxFBJ', 1, NULL, '$2y$12$SyGb/zI58Mxn2O/fW4Lnze4mzC5xWDaFCeBZbyI.wKv1V5qutchdS', 1, 0, NULL, 0, NULL, '2025-05-15 11:11:58', '2025-05-15 11:11:58');
INSERT INTO `agents` VALUES(83, 'WEB-250516155316', 'CKhlNFxnYtRks', 0, 0, NULL, NULL, 'dinofrank270340@yahoo.com', '8123534348', 'fQOFNspUCwl', 1, NULL, '$2y$12$dC8M9/PfxVG15zxrvm3UXO8wDLlFdU256f3mqJxziD0KOPb1mpCzu', 1, 0, NULL, 0, NULL, '2025-05-16 08:53:17', '2025-05-16 08:53:17');
INSERT INTO `agents` VALUES(84, 'WEB-250516161410', 'UnezJVHMni', 0, 0, NULL, NULL, 'kirbymodesti1@gmail.com', '9064630105', 'NMEQSZYAORIOSK', 1, NULL, '$2y$12$us0EuARDrE4xqxDyArDJfONyev4NOuUj.CQud0HQfSNqvYgOe4lpu', 1, 0, NULL, 0, NULL, '2025-05-16 09:14:11', '2025-05-16 09:14:11');
INSERT INTO `agents` VALUES(85, 'WEB-250516175836', 'dIhfVlXprBwEE', 0, 0, NULL, NULL, 'daviesdjoangz14@gmail.com', '9991432331', 'bdXdaOkZKy', 1, NULL, '$2y$12$Eb9CgtOGB9wrzXoQh45Nl.xj/pG9XugrsPIzd2DUnDDbfgpL7pSTO', 1, 0, NULL, 0, NULL, '2025-05-16 10:58:37', '2025-05-16 10:58:37');
INSERT INTO `agents` VALUES(86, 'WEB-250516223048', 'IlTjCYFotXm', 0, 0, NULL, NULL, 'mordenir2000@gmail.com', '3783342657', 'rPkgveQWYuUPrl', 1, NULL, '$2y$12$KSK54BX497.YYg1xJ8UMce2aYPXr7Gptx3r1CNCA5zSAf.PLSeCXK', 1, 0, NULL, 0, NULL, '2025-05-16 15:30:48', '2025-05-16 15:30:48');
INSERT INTO `agents` VALUES(87, 'WEB-250517160148', 'HkdKsjUX', 0, 0, NULL, NULL, 'kbatildf@gmail.com', '4561438103', 'QiOwovsxj', 1, NULL, '$2y$12$auaS7qWhVY8XDR6a4JdOWuRr32brtlSfn8QBwvWDCVoPvoaBxPK8.', 1, 0, NULL, 0, NULL, '2025-05-17 09:01:48', '2025-05-17 09:01:48');
INSERT INTO `agents` VALUES(88, 'WEB-250517172253', 'LmUpktpACMK', 0, 0, NULL, NULL, 'hitkliffedwardsr@gmail.com', '7974627550', 'ZHYsaFIMasaIY', 1, NULL, '$2y$12$MNeM4lDLjDPeaXfFVmQql.NbOOiBNfahnSCFXfexkxUY/kVzH7lQm', 1, 0, NULL, 0, NULL, '2025-05-17 10:22:54', '2025-05-17 10:22:54');
INSERT INTO `agents` VALUES(89, 'WEB-250517210135', 'RFpNLXlmSQaE', 0, 0, NULL, NULL, 'djekkbestpr50@gmail.com', '5324782131', 'qcdpCuwYumJVpK', 1, NULL, '$2y$12$hoQn7DZeemAS8bZTXX1N2eKTtQ.WNYm8WkdWTA4UfntbMnp.AuDQK', 1, 0, NULL, 0, NULL, '2025-05-17 14:01:35', '2025-05-17 14:01:35');
INSERT INTO `agents` VALUES(90, 'WEB-250519102356', 'sFsSWTMxTE', 0, 0, NULL, NULL, 'gburnettnm1991@gmail.com', '8472520104', 'fQAcmeQrb', 1, NULL, '$2y$12$Km47JjKhfy.AZwpKeIGJ6.xpTaI6/H/2MoUEPlfaJ.LWPwDGcAzlq', 1, 0, NULL, 0, NULL, '2025-05-19 03:23:57', '2025-05-19 03:23:57');
INSERT INTO `agents` VALUES(91, 'WEB-250519172314', 'CEqCNCZCGGFa', 0, 0, NULL, NULL, 'tuckerhelen107393@yahoo.com', '8653707268', 'FDmjfurvFnt', 1, NULL, '$2y$12$wR9IeFDKxlBBxoHRHJCfKOqxbk2SDgKs.X7Pfy6Bovk0tNeYpTkRW', 1, 0, NULL, 0, NULL, '2025-05-19 10:23:15', '2025-05-19 10:23:15');
INSERT INTO `agents` VALUES(92, 'WEB-250519175004', 'VjOQdghsY', 0, 0, NULL, NULL, 'sokkalingamyovany912110@yahoo.com', '4467550130', 'IDWJezXqHyXN', 1, NULL, '$2y$12$PLJdEdD0Epig8iwKwkuiAu0meT0c89AryKbqDc.AoDQtBTSUpm9dK', 1, 0, NULL, 0, NULL, '2025-05-19 10:50:04', '2025-05-19 10:50:04');
INSERT INTO `agents` VALUES(93, 'WEB-250520135357', 'AHZyknXKtHbxbTQ', 0, 0, NULL, NULL, 'vargasmarlong5@gmail.com', '4804065184', 'cjqLCIYYhw', 1, NULL, '$2y$12$WkHKGs91M8fOOcnDJ0RwueCvUhmMZmpreG8v8.0eW3xlmRhCLx9kS', 1, 0, NULL, 0, NULL, '2025-05-20 06:53:57', '2025-05-20 06:53:57');
INSERT INTO `agents` VALUES(94, 'WEB-250521185500', 'teeRbgZwFd', 0, 0, NULL, NULL, 'hiramcsu@gmail.com', '6482356788', 'WlukOrGgFVFTNx', 1, NULL, '$2y$12$kyt5OwpDU4Kn.mpNx9Ps5efUJwpB1jzv9zJTONqip6RmC0wSk13ce', 1, 0, NULL, 0, NULL, '2025-05-21 11:55:01', '2025-05-21 11:55:01');
INSERT INTO `agents` VALUES(95, 'WEB-250522101417', 'EfllfTYs', 0, 0, NULL, NULL, 'filoyorkdr78@gmail.com', '5441002272', 'vUrINbmwmtk', 1, NULL, '$2y$12$cAza76qOHS.6BEW2MxSBG.pJqlAFifM.gIZjAX0Ycn6lFFpZ6hJkG', 1, 0, NULL, 0, NULL, '2025-05-22 03:14:18', '2025-05-22 03:14:18');
INSERT INTO `agents` VALUES(96, 'WEB-250523042342', 'fgDSgLkWHJuB', 0, 0, NULL, NULL, 'michkari22@gmail.com', '4367163575', 'hSzlZegWCv', 1, NULL, '$2y$12$A3gMssCLf/gPSuceHJgQ3utOLKe0DsNcSQNFqZyPAL4uIlMuj3Nsq', 1, 0, NULL, 0, NULL, '2025-05-22 21:23:43', '2025-05-22 21:23:43');
INSERT INTO `agents` VALUES(97, 'WEB-250524105005', 'YWQqcnSag', 0, 0, NULL, NULL, 'dsparksm1997@gmail.com', '6100181563', 'PGqLCpecJk', 1, NULL, '$2y$12$b/ht4otupwfdBAxhLpSugOnVmQ6vuqBUGgVahn1bBNPkK8P95wWvy', 1, 0, NULL, 0, NULL, '2025-05-24 03:50:05', '2025-05-24 03:50:05');
INSERT INTO `agents` VALUES(98, 'WEB-250524165239', 'XNbyjzhGxJCe', 0, 0, NULL, NULL, 'brennaharringtonhh18@gmail.com', '5570991243', 'YLYAsIHhPzmKS', 1, NULL, '$2y$12$CFI73nZ/dsNKLq7PJe3tY.aZGsDL8EY2jSTx594Q3Cqj/GIoYbnbe', 1, 0, NULL, 0, NULL, '2025-05-24 09:52:39', '2025-05-24 09:52:39');
INSERT INTO `agents` VALUES(99, 'WEB-250525045529', 'kfQJmXob', 0, 0, NULL, NULL, 'kbradshaww17@gmail.com', '9448291455', 'QjTtMRblCNiS', 1, NULL, '$2y$12$tvMmqj9LXw3aaBcUN.FtK.fIFYpNSA5IVW.uskPZOvZRblzoSoJlC', 1, 0, NULL, 0, NULL, '2025-05-24 21:55:30', '2025-05-24 21:55:30');
INSERT INTO `agents` VALUES(100, 'WEB-250525175127', 'GFRVFVKQ', 0, 0, NULL, NULL, 'abidjilfrazierz1990@gmail.com', '6278887177', 'qcDgjoCcwpAX', 1, NULL, '$2y$12$DXjH2Ad24AzM.khyCt3Tb.hZ1aLbsI.4U/uYK1Koe36aWXeLQxI0i', 1, 0, NULL, 0, NULL, '2025-05-25 10:51:27', '2025-05-25 10:51:27');
INSERT INTO `agents` VALUES(101, 'WEB-250526073121', 'ATqkwWdTqDTT', 0, 0, NULL, NULL, 'dgilbertvy9@gmail.com', '5637507807', 'OsoJkoNvZGvyB', 1, NULL, '$2y$12$yJh4IgIsrYsOeo/qR87QD.jPFNykJLIZJseVbi3ZMiC1YroG5cg0a', 1, 0, NULL, 0, NULL, '2025-05-26 00:31:22', '2025-05-26 00:31:22');
INSERT INTO `agents` VALUES(102, 'WEB-250526141911', 'vwUitEucBfNAYn', 0, 0, NULL, NULL, 'hamiltonanthony269563@yahoo.com', '7300398517', 'bhqReSEjaXcbRs', 1, NULL, '$2y$12$Lxs3IiwOK3pgHxUppjtZluaP2m0FmUqe01BBlz5lh8rKpB135aR5G', 1, 0, NULL, 0, NULL, '2025-05-26 07:19:11', '2025-05-26 07:19:11');
INSERT INTO `agents` VALUES(103, 'WEB-250526155201', 'cFBddOhoT', 0, 0, NULL, NULL, 'lynndarilbf@gmail.com', '3830142767', 'iiNmoNumU', 1, NULL, '$2y$12$.M8lTbPklnCoqIO2K..7cuv1AoupSKaoJqjEck/n14jCcqdDWSeHi', 1, 0, NULL, 0, NULL, '2025-05-26 08:52:01', '2025-05-26 08:52:01');
INSERT INTO `agents` VALUES(104, 'WEB-250526185323', 'MEZRPwBBuNc', 0, 0, NULL, NULL, 'arobersonva@gmail.com', '3269633299', 'KNjSsPmUVWOWt', 1, NULL, '$2y$12$jUHTSsoLim4ObCFP1tUjc.zfeliu0gYKmCnWWr0BXaejsSd9B6Sau', 1, 0, NULL, 0, NULL, '2025-05-26 11:53:24', '2025-05-26 11:53:24');
INSERT INTO `agents` VALUES(105, 'WEB-250526212846', 'DJyAEnsGtbW', 0, 0, NULL, NULL, 'elfridgarr@gmail.com', '9074566572', 'NNMYlNxjBRldgnF', 1, NULL, '$2y$12$tzlqCb001QYVNd8PXo/jC.W5bFeyzvbbWspmXkLYfdwCd7qjlEhbq', 1, 0, NULL, 0, NULL, '2025-05-26 14:28:47', '2025-05-26 14:28:47');
INSERT INTO `agents` VALUES(106, 'WEB-250527072441', 'upJyvilcIDPqHh', 0, 0, NULL, NULL, 'averyarabel43@gmail.com', '7952148326', 'XsCjldqWCcd', 1, NULL, '$2y$12$/mpm4AUg5t6.s/COA3YGKOqZVf2b2GsmJ4wXgAVXA1p4GqWcVOoI2', 1, 0, NULL, 0, NULL, '2025-05-27 00:24:41', '2025-05-27 00:24:41');
INSERT INTO `agents` VALUES(107, 'WEB-250527134009', 'QymYHMtGZSABvBL', 0, 0, NULL, NULL, 'idgarmathews1@gmail.com', '6348604857', 'sQQeAgnXXOAu', 1, NULL, '$2y$12$aKpArCK5sMeaZm68jBYcJ.r5INAzvB5uUBQiIhLHaQup.iSnMELrW', 1, 0, NULL, 0, NULL, '2025-05-27 06:40:10', '2025-05-27 06:40:10');
INSERT INTO `agents` VALUES(108, 'WEB-250527232718', 'EfzWxcTVCOkvbKt', 0, 0, NULL, NULL, 'mereditpeterson2006@gmail.com', '4871598625', 'qzsBBVwzfui', 1, NULL, '$2y$12$VrdyoAowE6C0zhPOymSDMebHX8C8M9FWZ.T.qTuVyHT287UYrh/Bm', 1, 0, NULL, 0, NULL, '2025-05-27 16:27:19', '2025-05-27 16:27:19');
INSERT INTO `agents` VALUES(109, 'WEB-250528180352', 'iLSJapoE', 0, 0, NULL, NULL, 'yriahcx20@gmail.com', '3315633688', 'VCQNxxhnJGSNPPn', 1, NULL, '$2y$12$3U6yry44W89XeTEX4NtC6.UwXRwLxUl3uQqErlJvqNV5MY9D8CVL.', 1, 0, NULL, 0, NULL, '2025-05-28 11:03:52', '2025-05-28 11:03:52');
INSERT INTO `agents` VALUES(110, 'WEB-250528182324', 'amIKmqWWRTQXka', 0, 0, NULL, NULL, 'lmckenziewc1998@gmail.com', '2464328762', 'KxUvjnYpx', 1, NULL, '$2y$12$oCmNA0krFihqrUesN/twv.rCCfHCS.r.HzO3PibmMgA66h3WHSGFC', 1, 0, NULL, 0, NULL, '2025-05-28 11:23:25', '2025-05-28 11:23:25');
INSERT INTO `agents` VALUES(111, 'WEB-250528200127', 'vvKXeUtTU', 0, 0, NULL, NULL, 'tacevedox@gmail.com', '2597174552', 'UWsYAYED', 1, NULL, '$2y$12$6scLWr.mm3hCz3KhS8fj1ea6txavbRfmjrIYHcr.AaD6gue4oBpXC', 1, 0, NULL, 0, NULL, '2025-05-28 13:01:27', '2025-05-28 13:01:27');
INSERT INTO `agents` VALUES(112, 'WEB-250529092341', 'TLosTqiLSZ', 0, 0, NULL, NULL, 'tongateszb@gmail.com', '4036997916', 'AVMuWLsVujGDgv', 1, NULL, '$2y$12$mEhHZwZGg0.3SVfRQX3uRO0Igib/G/Y2ZprILTC7MgJNNIkacB5Pa', 1, 0, NULL, 0, NULL, '2025-05-29 02:23:41', '2025-05-29 02:23:41');
INSERT INTO `agents` VALUES(113, 'WEB-250530164730', 'yTLpzUJNXy', 0, 0, NULL, NULL, 'robrobbinsgb1982@gmail.com', '4509737807', 'hwmJznCpTe', 1, NULL, '$2y$12$NrVTrvFlGj3G.z19EyD9T.IRh81CR7ZWdJ8/AtW4G4oTSSlyoMK36', 1, 0, NULL, 0, NULL, '2025-05-30 09:47:31', '2025-05-30 09:47:31');
INSERT INTO `agents` VALUES(114, 'WEB-250530165143', 'VuYopbVESoIBFi', 0, 0, NULL, NULL, 'kilercn48@gmail.com', '3302317508', 'rVOKzQBxjeGHXS', 1, NULL, '$2y$12$m6jwrL2TFU6Tn.3X6Ag.SOVl2kv3D/AutPI3lfafRsEZZ/i0.Ez5a', 1, 0, NULL, 0, NULL, '2025-05-30 09:51:43', '2025-05-30 09:51:43');
INSERT INTO `agents` VALUES(115, 'WEB-250531060046', 'ISPjQwRUWDqeQCr', 0, 0, NULL, NULL, 'ericking277409@yahoo.com', '7940808636', 'neIZIDCvrzw', 1, NULL, '$2y$12$ouv66wvDysYX32nFgFGXCeGRDS2GzU9VQw/GHb90LzsZkmJo0AK06', 1, 0, NULL, 0, NULL, '2025-05-30 23:00:47', '2025-05-30 23:00:47');
INSERT INTO `agents` VALUES(116, 'WEB-250531155519', 'QGWFptutJgZX', 0, 0, NULL, NULL, 'roseannteale@gmail.com', '6982036851', 'HJJRezsEMgxc', 1, NULL, '$2y$12$JRsU7wIiTz6lXvbFWcKAc.EgGgic7RfH76.OxoDCrA2Cp9mAz.RSm', 1, 0, NULL, 0, NULL, '2025-05-31 08:55:19', '2025-05-31 08:55:19');
INSERT INTO `agents` VALUES(117, 'WEB-250601061046', 'rhozSRfvYPAoA', 0, 0, NULL, NULL, 'djastise95@gmail.com', '5744567601', 'XJbACxgKWtCGHQ', 1, NULL, '$2y$12$QC7y2HMVwgx08X6GLkb50uFF1FJSThdsqOs1nKQALTTVvIyaSgbc6', 1, 0, NULL, 0, NULL, '2025-05-31 23:10:46', '2025-05-31 23:10:46');
INSERT INTO `agents` VALUES(118, 'WEB-250602171208', 'JxWSzwznXE', 0, 0, NULL, NULL, 'natansumme@gmail.com', '2608970767', 'HYEACbgsPH', 1, NULL, '$2y$12$vNFUkorNqrJTunMvJJV8T.vOX3lV5s4iB52RPloJ7dPmApOriR2ty', 1, 0, NULL, 0, NULL, '2025-06-02 10:12:09', '2025-06-02 10:12:09');
INSERT INTO `agents` VALUES(119, 'WEB-250604093612', 'bqnsCAjfcQFngih', 0, 0, NULL, NULL, 'pollarddjoism1994@gmail.com', '2166403098', 'ltPaDxyZOY', 1, NULL, '$2y$12$NwOEtEEKbeSTu4ilMOnY.edkJPoIL2O3nurXDg1SMFnCGDWUNk/76', 1, 0, NULL, 0, NULL, '2025-06-04 02:36:12', '2025-06-04 02:36:12');
INSERT INTO `agents` VALUES(120, 'WEB-250604215133', 'lMEimWpRvxMQm', 0, 0, NULL, NULL, 'deitonaou@gmail.com', '7060544532', 'ekzlNSgvSvKb', 1, NULL, '$2y$12$0bb3QTJs8OcQOhoNs.eBy.nnDO31/QsThElQtyd5Boy6ptMPNis/W', 1, 0, NULL, 0, NULL, '2025-06-04 14:51:33', '2025-06-04 14:51:33');
INSERT INTO `agents` VALUES(121, 'WEB-250606053831', 'ahcMnEzzPUzN', 0, 0, NULL, NULL, 'hbakerd5@gmail.com', '9604589758', 'iuqNVOqL', 1, NULL, '$2y$12$kBS5uh/A2dlmItTJ9c2xm.JSsHYChOxYwIGWWGURPJAuaXrfKGeCe', 1, 0, NULL, 0, NULL, '2025-06-05 22:38:31', '2025-06-05 22:38:31');
INSERT INTO `agents` VALUES(122, 'WEB-250606085354', 'rAhunzZwq', 0, 0, NULL, NULL, 'lekolttu1994@gmail.com', '4516102544', 'KJQMyuvUOEHH', 1, NULL, '$2y$12$JsiNXRyipuBfdASDtH5QA.HuLxb0O1o8JTqx7d/QQInX8TJsM/E/e', 1, 0, NULL, 0, NULL, '2025-06-06 01:53:55', '2025-06-06 01:53:55');
INSERT INTO `agents` VALUES(123, 'WEB-250606092937', 'oLIPmVBVGbhhK', 0, 0, NULL, NULL, 'vfishery1994@gmail.com', '5681943954', 'SDuchNQi', 1, NULL, '$2y$12$IBq3jIFkVAJOf59.JtmrvemP3j./Vb7ZBgBUfPHCqkbMkuk6phWPy', 1, 0, NULL, 0, NULL, '2025-06-06 02:29:38', '2025-06-06 02:29:38');
INSERT INTO `agents` VALUES(124, 'WEB-250606124527', 'QiAcudUJCli', 0, 0, NULL, NULL, 'hodzickevin833429@yahoo.com', '3197711080', 'nufNVdfEyqwl', 1, NULL, '$2y$12$lStXpllsj19SisoOg.GtX.Eup6DYgj.blm2SJSEYYV0a3baLDNmRW', 1, 0, NULL, 0, NULL, '2025-06-06 05:45:27', '2025-06-06 05:45:27');
INSERT INTO `agents` VALUES(125, 'WEB-250606181728', 'etcOqXZzllnHmE', 0, 0, NULL, NULL, 'hloyae59@gmail.com', '6569122784', 'rgvPiEfHIubahyN', 1, NULL, '$2y$12$iUqmAmud5fzeovlk5FZs6.S//F8xw4MBiOtWlNRWjTvo6WM2FPRiu', 1, 0, NULL, 0, NULL, '2025-06-06 11:17:28', '2025-06-06 11:17:28');
INSERT INTO `agents` VALUES(126, 'WEB-250606213929', 'bBOqmwnvWkqLI', 0, 0, NULL, NULL, 'odomebigeilwa5@gmail.com', '2615199521', 'qqDlFOzmVeCyzH', 1, NULL, '$2y$12$hTDcFyJQI0lgmTTrc8pKjextmcuMqmrfmoAgZGs2I6BhPULtkEg0C', 1, 0, NULL, 0, NULL, '2025-06-06 14:39:29', '2025-06-06 14:39:29');
INSERT INTO `agents` VALUES(127, 'WEB-250607031152', 'bdRjRUnVeFaE', 0, 0, NULL, NULL, 'syzanrhodesfi7@gmail.com', '9323330537', 'adlvWmvGVC', 1, NULL, '$2y$12$LP8yCgxMMGuoEA8hAsqbSeGaZTP2cWL6P/kCNtAlSuYNhFosy2gtK', 1, 0, NULL, 0, NULL, '2025-06-06 20:11:52', '2025-06-06 20:11:52');
INSERT INTO `agents` VALUES(128, 'WEB-250607085750', 'zkMARFgw', 0, 0, NULL, NULL, 'drakemeidleinfq@gmail.com', '4083267171', 'GAGpOgRTlOwqdJ', 1, NULL, '$2y$12$YcChPLWyKU.WGTk6T1nJh.bb2e/qlxDwjcDTYIbmtCURi7Cz74Uki', 1, 0, NULL, 0, NULL, '2025-06-07 01:57:50', '2025-06-07 01:57:50');
INSERT INTO `agents` VALUES(129, 'WEB-250607093924', 'IjassaRSJh', 0, 0, NULL, NULL, 'vyattwarh95@gmail.com', '6290217898', 'MhFPluVY', 1, NULL, '$2y$12$wBRrG8h/MfR2ZkRX2gAIe.hwlsPSecfsTh1AK9ks4n5sgVao69nSm', 1, 0, NULL, 0, NULL, '2025-06-07 02:39:24', '2025-06-07 02:39:24');
INSERT INTO `agents` VALUES(130, 'WEB-250607120339', 'bpvmLUIZJwFivno', 0, 0, NULL, NULL, 'melespvz1983@gmail.com', '4311310737', 'ZFWmWArLhABVZmo', 1, NULL, '$2y$12$Btq1vco4IfksDOh48qg7EurlSTW/X4QXvsH6uxB1XGKYWlzCAHBGO', 1, 0, NULL, 0, NULL, '2025-06-07 05:03:40', '2025-06-07 05:03:40');
INSERT INTO `agents` VALUES(131, 'WEB-250607175533', 'fCvhLGfjS', 0, 0, NULL, NULL, 'robinapacel@gmail.com', '7744003755', 'ToIHoXXdDVqFQNS', 1, NULL, '$2y$12$e..8yR5Dak0EaBBN69Vve.TAK2kPZn7myfwJCAUSpjHNAAnwEHWZe', 1, 0, NULL, 0, NULL, '2025-06-07 10:55:34', '2025-06-07 10:55:34');
INSERT INTO `agents` VALUES(132, 'WEB-250608012426', 'gztqlpmOlTcuCem', 0, 0, NULL, NULL, 'imoginbrown99@gmail.com', '4300431482', 'snGBXUvZYr', 1, NULL, '$2y$12$XZkySycB43CvGc3LUMGCLOmS3Y.Wzgo201OMsn6C18BoPdHpMpzXS', 1, 0, NULL, 0, NULL, '2025-06-07 18:24:27', '2025-06-07 18:24:27');
INSERT INTO `agents` VALUES(133, 'WEB-250608015425', 'nKyvqHaFOS', 0, 0, NULL, NULL, 'dotayamq2@gmail.com', '2967922355', 'LEALuBwOkwXz', 1, NULL, '$2y$12$DuNygwRl4k2jXnqu6saQR.WeUe3GBTfF2hPhBp59oqe3bB.QdrlOG', 1, 0, NULL, 0, NULL, '2025-06-07 18:54:25', '2025-06-07 18:54:25');
INSERT INTO `agents` VALUES(134, 'WEB-250608015712', 'EPqtqbkm', 0, 0, NULL, NULL, 'evandjelaincdr3@gmail.com', '9874859970', 'bDZqteSuW', 1, NULL, '$2y$12$v6EEM/68GYeBYQ2keRULUOYIzUd5itjkySPnK5PkkvZ4zjzQZVktO', 1, 0, NULL, 0, NULL, '2025-06-07 18:57:13', '2025-06-07 18:57:13');
INSERT INTO `agents` VALUES(135, 'WEB-250608134313', 'uRYheFiebCqJP', 0, 0, NULL, NULL, 'monroetrentgb1998@gmail.com', '9121275153', 'CoYzWPdrVhro', 1, NULL, '$2y$12$mZtKzhbKAWqjpmnWqrdhn.LpXyimhKps.qO9zXl.4bKyX4vOlN3gq', 1, 0, NULL, 0, NULL, '2025-06-08 06:43:13', '2025-06-08 06:43:13');
INSERT INTO `agents` VALUES(136, 'WEB-250608164356', 'SCCBLlgC', 0, 0, NULL, NULL, 'erikacole641775@yahoo.com', '4788976999', 'AyCfpFRHTgkC', 1, NULL, '$2y$12$DdQ59qVoJVt./xM6V6SEVOqye0rav.yvR45cBJ5XMjtrHORJcw/TW', 1, 0, NULL, 0, NULL, '2025-06-08 09:43:57', '2025-06-08 09:43:57');
INSERT INTO `agents` VALUES(137, 'WEB-250608192200', 'FFlltUsdFNJnCcN', 0, 0, NULL, NULL, 'penalaioneld36@gmail.com', '6069148390', 'zabJgHSOrMaX', 1, NULL, '$2y$12$wepQheh3swNgSNbGK1e8NeIiHOsRzW4/gpij2g3FK8FgcM4YhXY0C', 1, 0, NULL, 0, NULL, '2025-06-08 12:22:00', '2025-06-08 12:22:00');
INSERT INTO `agents` VALUES(138, 'WEB-250608230126', 'FCxbTKPDjAr', 0, 0, NULL, NULL, 'sextonflinnhq@gmail.com', '2896096596', 'ZIVWdFSdGvcyDD', 1, NULL, '$2y$12$0Eo4QfLGkkLNL4/TeocEteY2HA7XMslEoYjzQETz1p.45tMYxYYJq', 1, 0, NULL, 0, NULL, '2025-06-08 16:01:27', '2025-06-08 16:01:27');
INSERT INTO `agents` VALUES(139, 'WEB-250609035315', 'EEQDzVcHyHfLc', 0, 0, NULL, NULL, 'gvaierdkz2002@gmail.com', '3451171941', 'KzRkoQxaaOQLPhv', 1, NULL, '$2y$12$AncCcjbbjetFbj0dp9H49uMDG2G5IVgrpwgTh0w9E7bTSuKB4Hw1m', 1, 0, NULL, 0, NULL, '2025-06-08 20:53:15', '2025-06-08 20:53:15');
INSERT INTO `agents` VALUES(140, 'WEB-250609164408', 'vayCMCTURkyQg', 0, 0, NULL, NULL, 'chrisrogers166713@yahoo.com', '6002673685', 'fIrqDyARUGCdDt', 1, NULL, '$2y$12$is9jiLJimGIbfhYM4OBFjuvQSvS1t1JAWPt6RLFZ8xjIFbT24qmIq', 1, 0, NULL, 0, NULL, '2025-06-09 09:44:08', '2025-06-09 09:44:08');
INSERT INTO `agents` VALUES(141, 'WEB-250609192033', 'NHiLjnKMeqj', 0, 0, NULL, NULL, 'ashledeivirk1989@gmail.com', '8873504449', 'XidWZBCABAdZRSX', 1, NULL, '$2y$12$TqsRHExUvXlRsgS9ydwFreMbFjXe8lEignzfisJ1.k6H/B5.IK4Yu', 1, 0, NULL, 0, NULL, '2025-06-09 12:20:33', '2025-06-09 12:20:33');
INSERT INTO `agents` VALUES(142, 'WEB-250610025505', 'icRGptNxiKQ', 0, 0, NULL, NULL, 'tannerdevereyks4@gmail.com', '9404683046', 'pYGGanRZPcg', 1, NULL, '$2y$12$psFqStVds0hBcQ1z9D01AuJAXgw7lpNmB342SnJkK6QhXuRC2PROO', 1, 0, NULL, 0, NULL, '2025-06-09 19:55:05', '2025-06-09 19:55:05');
INSERT INTO `agents` VALUES(143, 'WEB-250610154329', 'gJcmOtdW', 0, 0, NULL, NULL, 'laurajones555073@yahoo.com', '8092604837', 'AaMpHddZ', 1, NULL, '$2y$12$gm/Io2KyBZ0kvslDtZ7cGulBlr72RxWXikFfmypJKLeeuBco7DEEi', 1, 0, NULL, 0, NULL, '2025-06-10 08:43:29', '2025-06-10 08:43:29');
INSERT INTO `agents` VALUES(144, 'WEB-250610225107', 'EGjlwdcnHCKwNt', 0, 0, NULL, NULL, 'santanaklint4@gmail.com', '4137921034', 'cbpZgHNPoovR', 1, NULL, '$2y$12$yhpIv.0brC2VC86m4BDpB.WsG3/46bYDDQssYhR0uzEB2HhSH2bfG', 1, 0, NULL, 0, NULL, '2025-06-10 15:51:08', '2025-06-10 15:51:08');
INSERT INTO `agents` VALUES(145, 'WEB-250612041408', 'iNnETcrr', 0, 0, NULL, NULL, 'tempestlct8@gmail.com', '4524433170', 'tEdNbiIBArQhsPz', 1, NULL, '$2y$12$dQDFpnCYek6p2Qi49cBfv.prsz5gV10xt4Bj.QIXpy62qzWZJs/h.', 1, 0, NULL, 0, NULL, '2025-06-11 21:14:08', '2025-06-11 21:14:08');
INSERT INTO `agents` VALUES(146, 'WEB-250612195800', 'ZUNZBKPhlhzEZqb', 0, 0, NULL, NULL, 'krisschw33@gmail.com', '9340116066', 'eYNKGTbMS', 1, NULL, '$2y$12$d.yFsL6XT0BHv0YVyvxk0ejubZMcyPCDJg5.Ue4qA3rN2KjdRMSjK', 1, 0, NULL, 0, NULL, '2025-06-12 12:58:01', '2025-06-12 12:58:01');
INSERT INTO `agents` VALUES(147, 'WEB-250612213232', 'KmcXUVUHRitqs', 0, 0, NULL, NULL, 'ndeniel27@gmail.com', '8786863721', 'tClVWbiqs', 1, NULL, '$2y$12$HTftc2LxF6eCKJhhC9VSjeX0NGnHVi1WFq3/yiZp/Wxw1EiTpvbga', 1, 0, NULL, 0, NULL, '2025-06-12 14:32:32', '2025-06-12 14:32:32');
INSERT INTO `agents` VALUES(148, 'WEB-250613044200', 'FQxCskwvBo', 0, 0, NULL, NULL, 'fterransi30@gmail.com', '6289859673', 'irdeqeIB', 1, NULL, '$2y$12$DO6Xxu2vIABdomHU85VY9O15L7eqGRegxSkZ7Lm.QWLbaDFl0MMOO', 1, 0, NULL, 0, NULL, '2025-06-12 21:42:00', '2025-06-12 21:42:00');
INSERT INTO `agents` VALUES(149, 'WEB-250613104324', 'qbjBjXqj', 0, 0, NULL, NULL, 'osbornklintonzn@gmail.com', '7010233449', 'BmrtxQMM', 1, NULL, '$2y$12$3nvdclMH4rt7qcXLR9PbEeNg8OsxH14fCbYxpGkQiEFgkddxXHlGu', 1, 0, NULL, 0, NULL, '2025-06-13 03:43:24', '2025-06-13 03:43:24');
INSERT INTO `agents` VALUES(150, 'WEB-250614121715', 'SgtetcZgmqRU', 0, 0, NULL, NULL, 'hogandeai35@gmail.com', '2918985288', 'twhBflhTh', 1, NULL, '$2y$12$6kfy39H76o/xhHIknM1Kv.kqL/mrTZrSKPosOKsJk11cNDKo64HCG', 1, 0, NULL, 0, NULL, '2025-06-14 05:17:15', '2025-06-14 05:17:15');
INSERT INTO `agents` VALUES(151, 'WEB-250614235112', 'TvsEtYDbBSFNg', 0, 0, NULL, NULL, 'melbgloverh@gmail.com', '2899049714', 'dIpegWSPznwl', 1, NULL, '$2y$12$VwdV6sjw.YEHB4hHEG7LTe.lsiFK6T7SiSszqdHChQGW5XEidih5O', 1, 0, NULL, 0, NULL, '2025-06-14 16:51:12', '2025-06-14 16:51:12');
INSERT INTO `agents` VALUES(152, 'WEB-250615154650', 'DBUerPamDLII', 0, 0, NULL, NULL, 'gantvanrl1990@gmail.com', '5657481737', 'dcPgSSKwJhG', 1, NULL, '$2y$12$fJBL5r4cPMgr1SONf2fpzu/Z.eST.YgNrG8UZvPBizZf9ZWvGDYwK', 1, 0, NULL, 0, NULL, '2025-06-15 08:46:50', '2025-06-15 08:46:50');
INSERT INTO `agents` VALUES(153, 'WEB-250615212117', 'FVrIAyChGyuAV', 0, 0, NULL, NULL, 'shamysdickerson23@gmail.com', '2948404656', 'xajSXgUQmWBSVZ', 1, NULL, '$2y$12$4D33sC8GO8i8ik3DS3RY8ecw4VIa8he/55qT9IdxfbIAlemZxgYCG', 1, 0, NULL, 0, NULL, '2025-06-15 14:21:18', '2025-06-15 14:21:18');
INSERT INTO `agents` VALUES(154, 'WEB-250616130650', 'DeVQGdvw', 0, 0, NULL, NULL, 'mannicherrih@gmail.com', '3946374960', 'vpchhWlpEoPjvr', 1, NULL, '$2y$12$ws3qTgXT.lONHE0gM47HvOsHQAw07UYMficvUD4z/lhFS/loLuHzK', 1, 0, NULL, 0, NULL, '2025-06-16 06:06:51', '2025-06-16 06:06:51');
INSERT INTO `agents` VALUES(155, 'WEB-250616132115', 'nFcVFjGMAdPXu', 0, 0, NULL, NULL, 'kaneendib@gmail.com', '7294003459', 'TYwHigKAHauWBmc', 1, NULL, '$2y$12$DacS7WU3f8BObOwB20jZ1OjQpCbP9aMMbtud4/smyPoygU/4sjtKW', 1, 0, NULL, 0, NULL, '2025-06-16 06:21:15', '2025-06-16 06:21:15');
INSERT INTO `agents` VALUES(156, 'WEB-250617035951', 'UEQpRhHufmd', 0, 0, NULL, NULL, 'adelislove42@gmail.com', '3388827167', 'QSkGoqVCvlhO', 1, NULL, '$2y$12$1XOkuvnHDAHAn8m47ycGCOJ75Jjnt9DXSF5417SIr0mTRKTT.VHhG', 1, 0, NULL, 0, NULL, '2025-06-16 20:59:52', '2025-06-16 20:59:52');
INSERT INTO `agents` VALUES(157, 'WEB-250617070138', 'lbMLdwNVG', 0, 0, NULL, NULL, 'fordkingj80@gmail.com', '8656025496', 'OxTsUBfmi', 1, NULL, '$2y$12$hTjPZeXgPj/oEk0hIpnD2O239cI9gaBW2KHj0IIVAcg/6srWy4KcK', 1, 0, NULL, 0, NULL, '2025-06-17 00:01:39', '2025-06-17 00:01:39');
INSERT INTO `agents` VALUES(158, 'WEB-250617213401', 'XodIFWFqWcQHIfl', 0, 0, NULL, NULL, 'mfabianft47@gmail.com', '9210310273', 'yKFCqLwLuB', 1, NULL, '$2y$12$YtsskFjGO795522hQ3FQ2eqU.2kub8IQg91NcR4f3uuIQ9T3JulLi', 1, 0, NULL, 0, NULL, '2025-06-17 14:34:02', '2025-06-17 14:34:02');
INSERT INTO `agents` VALUES(159, 'WEB-250618071807', 'LfADjhjZMq', 0, 0, NULL, NULL, 'lawsofil63@gmail.com', '9605447534', 'UulotfHS', 1, NULL, '$2y$12$65Ukk7mbKE3Zzjy5.vmAqeGxn.u89qctq.Bcri1LnhrXOnJs42DWO', 1, 0, NULL, 0, NULL, '2025-06-18 00:18:07', '2025-06-18 00:18:07');
INSERT INTO `agents` VALUES(160, 'WEB-250618091245', 'VRAMaWiaTb', 0, 0, NULL, NULL, 'deifordn9@gmail.com', '9669719639', 'mXFXcttFujZXdH', 1, NULL, '$2y$12$ROsdwdp05zwN9uEFkcIE0OGbfGuyh9ktsDjU0cfOp.DkJNGfZ3AMe', 1, 0, NULL, 0, NULL, '2025-06-18 02:12:45', '2025-06-18 02:12:45');
INSERT INTO `agents` VALUES(161, 'WEB-250618142733', 'lRyCHUYNXIEs', 0, 0, NULL, NULL, 'djyliannsampson5@gmail.com', '7646748908', 'brTbCeLqYWRNHn', 1, NULL, '$2y$12$he7m0NxiVdJnDpjmJPFIgedVE4haOU4FU06d6cRT398CH3O636MOe', 1, 0, NULL, 0, NULL, '2025-06-18 07:27:33', '2025-06-18 07:27:33');
INSERT INTO `agents` VALUES(162, 'WEB-250619222012', 'RHKmCVzTU', 0, 0, NULL, NULL, 'chaseervani@gmail.com', '8849091941', 'zEDAuUTMRFLfvzj', 1, NULL, '$2y$12$kF70oIa4PODSv8fHN2Cerurr4JoWn502Jf9AxMPZnU7fTSqWlcybu', 1, 0, NULL, 0, NULL, '2025-06-19 15:20:12', '2025-06-19 15:20:12');
INSERT INTO `agents` VALUES(163, 'WEB-250620003624', 'bpdFJloevL', 0, 0, NULL, NULL, 'aburkerh89@gmail.com', '8080255764', 'yToFaAfPxiwMtvi', 1, NULL, '$2y$12$E0Bsst/x0wYANLYfmnUHmu/mBgvDmikU1Rtyj3Kp4/3Vd8B3k4r5.', 1, 0, NULL, 0, NULL, '2025-06-19 17:36:24', '2025-06-19 17:36:24');
INSERT INTO `agents` VALUES(164, 'WEB-250620010549', 'lUXYRzViZQg', 0, 0, NULL, NULL, 'elizafpp45@gmail.com', '9432193227', 'dZBwfxJuNSO', 1, NULL, '$2y$12$KRZ10vJcpVA/pj.kS6yQlO338TaocBZG/GliOnKTjljRnEOHRvh0m', 1, 0, NULL, 0, NULL, '2025-06-19 18:05:49', '2025-06-19 18:05:49');
INSERT INTO `agents` VALUES(165, 'WEB-250620213836', 'SsBLiPbeKLsCY', 0, 0, NULL, NULL, 'kyinbn1984@gmail.com', '4029702593', 'xfuSRZcPWmOY', 1, NULL, '$2y$12$KonanSBHUGUuhhLmrDzrJuxDIysQ/EDY6bFUpWmwDXwliWUqk7t06', 1, 0, NULL, 0, NULL, '2025-06-20 14:38:36', '2025-06-20 14:38:36');
INSERT INTO `agents` VALUES(166, 'WEB-250620232231', 'eWvcTokkFODwIA', 0, 0, NULL, NULL, 'sochybenscent1976@yahoo.com', '4620003809', 'tKPQyjYVrEDzj', 1, NULL, '$2y$12$ALl4YuATtcrSPuLtQE6Y3eAW/tgMa2eXqVk1sIJEW2Mdcv4PzX41u', 1, 0, NULL, 0, NULL, '2025-06-20 16:22:31', '2025-06-20 16:22:31');
INSERT INTO `agents` VALUES(167, 'WEB-250621091934', 'HmCqWPuvyZTUNn', 0, 0, NULL, NULL, 'bsondrag34@gmail.com', '2155280961', 'UQTIYLiJXdBL', 1, NULL, '$2y$12$FBtapNZGknOUm7QDX6weF.OyQL2Rm2IDS3Fl3V3Xdw7Gdq4uGnr4S', 1, 0, NULL, 0, NULL, '2025-06-21 02:19:35', '2025-06-21 02:19:35');
INSERT INTO `agents` VALUES(168, 'WEB-250621162311', 'AKGlSnotfjFWYLF', 0, 0, NULL, NULL, 'larsonbrandayasj49@gmail.com', '3945121031', 'ufudAVTVnSqXIQZ', 1, NULL, '$2y$12$xqLhYkfRuAAWbd.W9T03X.zQWw2yQr5LbJisG/kjSd2rllPiNSQqi', 1, 0, NULL, 0, NULL, '2025-06-21 09:23:12', '2025-06-21 09:23:12');
INSERT INTO `agents` VALUES(169, 'WEB-250621171831', 'lqcVSUQNXU', 0, 0, NULL, NULL, 'mikparbi@gmail.com', '4715827709', 'SItBNXsTTNavMkw', 1, NULL, '$2y$12$rFjqYIg6AmGf9BtztaG5vehtulRd/v7zzW10.F/rAwxk7ui5gQmjq', 1, 0, NULL, 0, NULL, '2025-06-21 10:18:31', '2025-06-21 10:18:31');
INSERT INTO `agents` VALUES(170, 'WEB-250622201803', 'NTVKXnKARQFuyqd', 0, 0, NULL, NULL, 'estemw1@gmail.com', '8130641378', 'TPmJNvFWjJp', 1, NULL, '$2y$12$VVfUH0LB8YeX08VhAd2HrOgacinqH01f/SLwffV7qltyDTRjd1tpC', 1, 0, NULL, 0, NULL, '2025-06-22 13:18:03', '2025-06-22 13:18:03');
INSERT INTO `agents` VALUES(171, 'WEB-250623011652', 'DkbZmvSFl', 0, 0, NULL, NULL, 'aziyaschmitth1984@gmail.com', '3218029794', 'KxMUTEwshpxvJhI', 1, NULL, '$2y$12$NwVK2d06ucxD66NWa1E.2Oh6YWa9uYZiCC7GoB93VTxrsVXI2AKfy', 1, 0, NULL, 0, NULL, '2025-06-22 18:16:53', '2025-06-22 18:16:53');
INSERT INTO `agents` VALUES(172, 'WEB-250623044657', 'FRWWoMTDVLROp', 0, 0, NULL, NULL, 'bazillmw@gmail.com', '3758005518', 'QrhxuhvqbZmZ', 1, NULL, '$2y$12$A92I5KtbznokNfmyBHzLfeSq.P.gGIHSxmjwQ89iYt1hGnZoVj3Pe', 1, 0, NULL, 0, NULL, '2025-06-22 21:46:57', '2025-06-22 21:46:57');
INSERT INTO `agents` VALUES(173, 'WEB-250623111059', 'nmDigFlut', 0, 0, NULL, NULL, 'spearsdikkioe13@gmail.com', '6483253529', 'hdbYMftPTDNX', 1, NULL, '$2y$12$nBGtLW4Wbb/MyIULCBzjIu5kuHA6kapQi5CBwdWMZt5/Pdbci/.Pu', 1, 0, NULL, 0, NULL, '2025-06-23 04:11:00', '2025-06-23 04:11:00');
INSERT INTO `agents` VALUES(174, 'WEB-250623210639', 'lnAZjCuJ', 0, 0, NULL, NULL, 'wubaikk7@gmail.com', '2664692212', 'UJvtmtqgzMOADv', 1, NULL, '$2y$12$m4AWsNkASVZ4Ctg5VZNvnuE6/dDMlR0CT5fi0NQjh7ObZZT3ANv2.', 1, 0, NULL, 0, NULL, '2025-06-23 14:06:40', '2025-06-23 14:06:40');
INSERT INTO `agents` VALUES(175, 'WEB-250623212434', 'RXqAFkBgwI', 0, 0, NULL, NULL, 'kilklinegu@gmail.com', '5368378701', 'VDmJXttMzqrqDf', 1, NULL, '$2y$12$rwF4HQVS5WL2UH9nllo7BuAVRbS.Bomxxp3Pb9jllnVYLnWSu5UFu', 1, 0, NULL, 0, NULL, '2025-06-23 14:24:34', '2025-06-23 14:24:34');
INSERT INTO `agents` VALUES(176, 'WEB-250625141240', 'LtnrXYiJBasl', 0, 0, NULL, NULL, 'lorrinmullina48@gmail.com', '8713961681', 'ElufqpngEbM', 1, NULL, '$2y$12$KVYU3dDNn0JrqaG62gJevOVHAnjoORsWNBYOdPKsSSJ5/Rav6ceFW', 1, 0, NULL, 0, NULL, '2025-06-25 07:12:41', '2025-06-25 07:12:41');
INSERT INTO `agents` VALUES(177, 'WEB-250626073410', 'utHESMlareLR', 0, 0, NULL, NULL, 'ganglonteavi1978@yahoo.com', '9509864642', 'VfxTuQowANxlqA', 1, NULL, '$2y$12$eoCNK.z9peAfq4wI/ykkMu4BjatcU8/Re6ZwEK8PRatF52HmAc2xq', 1, 0, NULL, 0, NULL, '2025-06-26 00:34:10', '2025-06-26 00:34:10');
INSERT INTO `agents` VALUES(178, 'WEB-250626134440', 'DfFsQlSPtVxbFx', 0, 0, NULL, NULL, 'ahobbsu22@gmail.com', '3066405451', 'QLhAawTExHAZ', 1, NULL, '$2y$12$yh4eGwE0x5Dhg9U.DIzBKuomQwA4NOejrQ/5Ve9KBSsAbdmSE0vxO', 1, 0, NULL, 0, NULL, '2025-06-26 06:44:40', '2025-06-26 06:44:40');
INSERT INTO `agents` VALUES(179, 'WEB-250627143353', 'aVXSOAlR', 0, 0, NULL, NULL, 'shakyilanwa@gmail.com', '5343836669', 'tCfVCJGC', 1, NULL, '$2y$12$QM/FrI.pCW.ISMzlHB36pO1ynToUZWD78EKweu0.rPqhXLxzmo3yi', 1, 0, NULL, 0, NULL, '2025-06-27 07:33:53', '2025-06-27 07:33:53');
INSERT INTO `agents` VALUES(180, 'WEB-250627214258', 'hmMGYyIzJCxXH', 0, 0, NULL, NULL, 'mehumuri944@gmail.com', '9952317698', 'jkHieZMAaK', 1, NULL, '$2y$12$rQ/M19Ug8Kk3zTdG1ccutuHqhZ10qscADwPxndJ3/tobjMV5gXS32', 1, 0, NULL, 0, NULL, '2025-06-27 14:42:59', '2025-06-27 14:42:59');
INSERT INTO `agents` VALUES(181, 'WEB-250628043527', 'OzDqYWGpKOsX', 0, 0, NULL, NULL, 'yidaracexemo49@gmail.com', '3168816407', 'cAChvjtiSoifXk', 1, NULL, '$2y$12$fZDIWMiGneP0S5hJhDKCJOLkjFeTEXLPHIyigJDWi8W.Kc6vlw/g6', 1, 0, NULL, 0, NULL, '2025-06-27 21:35:27', '2025-06-27 21:35:27');
INSERT INTO `agents` VALUES(182, 'WEB-250628110907', 'njpluGtDZSLQ', 0, 0, NULL, NULL, 'etabafuqaki31@gmail.com', '4984603647', 'zpKtCZvxSNoz', 1, NULL, '$2y$12$/WgVDzMwX.NZeINRu5IjP.EPTnrNW6hKHFNLOHIB4oExnMqy28Azi', 1, 0, NULL, 0, NULL, '2025-06-28 04:09:07', '2025-06-28 04:09:07');
INSERT INTO `agents` VALUES(183, 'WEB-250628120518', 'RbjXQmYTFcSgax', 0, 0, NULL, NULL, 'sogewegitej631@gmail.com', '7372949177', 'ZVksZsIRtndkfIL', 1, NULL, '$2y$12$FNIXXtotxamZwup7X2G3N.9d7bBwKI0l5E06wQuDcmZ9B74HiIUAG', 1, 0, NULL, 0, NULL, '2025-06-28 05:05:18', '2025-06-28 05:05:18');
INSERT INTO `agents` VALUES(184, 'WEB-250628211024', 'XoimhvyEDcYMQ', 0, 0, NULL, NULL, 'akuruhequva05@gmail.com', '9512153231', 'zuYopqDHofodW', 1, NULL, '$2y$12$WdBd8eoAYeVdWb8fK5iEOeKNR4tyTrerXnN1xUDlygDAHnBDJex5K', 1, 0, NULL, 0, NULL, '2025-06-28 14:10:24', '2025-06-28 14:10:24');
INSERT INTO `agents` VALUES(185, 'WEB-250629224345', 'qQDNIESNlPLrgUy', 0, 0, NULL, NULL, 'levymellonixs7@gmail.com', '5593630128', 'XiwrEpsR', 1, NULL, '$2y$12$WtqxqJLsImXICwpsql5FM.YboCZbBUCQZicPxux0lPvw30x/Yaxku', 1, 0, NULL, 0, NULL, '2025-06-29 15:43:46', '2025-06-29 15:43:46');
INSERT INTO `agents` VALUES(186, 'WEB-250629233428', 'VGHLpqZlUMMY', 0, 0, NULL, NULL, 'emildredcd8@gmail.com', '7386284617', 'oEXTMWWmO', 1, NULL, '$2y$12$6fji6glGB.WrD8qNS9lwAOBmVsD8KXSceQTAqAtQJHUODB00874B2', 1, 0, NULL, 0, NULL, '2025-06-29 16:34:28', '2025-06-29 16:34:28');
INSERT INTO `agents` VALUES(187, 'WEB-250630094938', 'FsLSobyCRwE', 0, 0, NULL, NULL, 'stewartdencf34@gmail.com', '6399093270', 'OSXEEGhkqzRXExr', 1, NULL, '$2y$12$Ww.1r0v07LS/RBziTwg0YOtm1mNPlykOwxowM2H6wEiy7xCbM1Tzu', 1, 0, NULL, 0, NULL, '2025-06-30 02:49:38', '2025-06-30 02:49:38');
INSERT INTO `agents` VALUES(188, 'WEB-250701021833', 'GjRhcOgVNT', 0, 0, NULL, NULL, 'abottpor2@gmail.com', '2316665111', 'jvPDDOXOShX', 1, NULL, '$2y$12$TV4MV0paJob6NlrdssdnZOe/aj/mKSqbY2zr2rD7JDogOKnPGt9Se', 1, 0, NULL, 0, NULL, '2025-06-30 19:18:34', '2025-06-30 19:18:34');
INSERT INTO `agents` VALUES(189, 'WEB-250701192322', 'GfmZoBdUI', 0, 0, NULL, NULL, 'rhondareyes777949@yahoo.com', '2103021553', 'vwLrOEBGGKMUVlR', 1, NULL, '$2y$12$HE1x.u.htDsg9MCzvbL8oOduirpUEbW6SNca7TijNJn/IP3kZ6s/e', 1, 0, NULL, 0, NULL, '2025-07-01 12:23:22', '2025-07-01 12:23:22');
INSERT INTO `agents` VALUES(190, 'WEB-250702160824', 'pzxEzqGTvg', 0, 0, NULL, NULL, 'djeidabuckqa@gmail.com', '6061614412', 'dOakOcILnRUzxiV', 1, NULL, '$2y$12$0vc4tTViqg19nGuB72Q42eSf89/60jhLCVlr1UbOUnoeYZZmWWl5K', 1, 0, NULL, 0, NULL, '2025-07-02 09:08:25', '2025-07-02 09:08:25');
INSERT INTO `agents` VALUES(191, 'WEB-250702180350', 'yKGCPOQSrivi', 0, 0, NULL, NULL, 'craneabott77@gmail.com', '5478689893', 'JLwHyoNpjY', 1, NULL, '$2y$12$E5lunA292WV/w/y/3GY9..fVaWqllsF078EwLO6SiMnH8rGwC7EJO', 1, 0, NULL, 0, NULL, '2025-07-02 11:03:51', '2025-07-02 11:03:51');
INSERT INTO `agents` VALUES(192, 'WEB-250702232511', 'qUDRnEXiLrLMn', 0, 0, NULL, NULL, 'skinnersedrikwx12@gmail.com', '3519697559', 'EBdjvqTvsY', 1, NULL, '$2y$12$T1RX9moJpu8JtO4BRpF9zeiaw0RgYSlyzzD50MjOyeP/1I8SoMBxS', 1, 0, NULL, 0, NULL, '2025-07-02 16:25:12', '2025-07-02 16:25:12');
INSERT INTO `agents` VALUES(193, 'WEB-250703051843', 'jctZLRapmYqpg', 0, 0, NULL, NULL, 'fergusonannie754173@yahoo.com', '9382283190', 'BVwpDXELkTvo', 1, NULL, '$2y$12$IHabIt2.TwqbrkWwasRjsune6WjwEh8aSisttSrC4CNiIvwgP4wO6', 1, 0, NULL, 0, NULL, '2025-07-02 22:18:43', '2025-07-02 22:18:43');
INSERT INTO `agents` VALUES(194, 'WEB-250703080623', 'FUlJaeSCXSLm', 0, 0, NULL, NULL, 'gibbonsdavione946729@yahoo.com', '8590174802', 'veIeCfSNBb', 1, NULL, '$2y$12$3LcMPJ2ysz6oqGkFae0Uku9vJbf9vx6Xwn7f6Hv.KorMIPrVzNth.', 1, 0, NULL, 0, NULL, '2025-07-03 01:06:23', '2025-07-03 01:06:23');
INSERT INTO `agents` VALUES(195, 'WEB-250703115438', 'KkHIEeuwYemC', 0, 0, NULL, NULL, 'gordonmeior34@gmail.com', '7237801721', 'HJFOTTxazJB', 1, NULL, '$2y$12$DbBD3kCabfScemBT5V5fLuSApOAuLGvj.d9AYnROy6pjV.xSoSj36', 1, 0, NULL, 0, NULL, '2025-07-03 04:54:38', '2025-07-03 04:54:38');
INSERT INTO `agents` VALUES(196, 'WEB-250703150744', 'njsLTsUuPq', 0, 0, NULL, NULL, 'horatiyamcgeei65@gmail.com', '4277752601', 'ZDITJHFEUMo', 1, NULL, '$2y$12$2QrR4mdmYwTj/KG3XQSaZuxjdvf6.3zDw./tkuOEuG73o4PhXPgaG', 1, 0, NULL, 0, NULL, '2025-07-03 08:07:45', '2025-07-03 08:07:45');
INSERT INTO `agents` VALUES(197, 'WEB-250703175347', 'DHcISpixY', 0, 0, NULL, NULL, 'ywileyp19@gmail.com', '5607749442', 'hkGUQPIRWgJZEDl', 1, NULL, '$2y$12$5wzFDrOjqPDecexxk0TChOCdzx0Dom3k2A93ZMb3CvHUNzFFWMv3S', 1, 0, NULL, 0, NULL, '2025-07-03 10:53:48', '2025-07-03 10:53:48');
INSERT INTO `agents` VALUES(198, 'WEB-250704002042', 'KSGjHAZPPfmVj', 0, 0, NULL, NULL, 'roddicn9@gmail.com', '4054715316', 'MQEVEUVgxr', 1, NULL, '$2y$12$/99zTOZmfKtcDlIBAqOSj.a6aHYuSTbKyuZTyaDiOZYP75NCE7mAy', 1, 0, NULL, 0, NULL, '2025-07-03 17:20:43', '2025-07-03 17:20:43');
INSERT INTO `agents` VALUES(199, 'WEB-250704102138', 'VnCiANvhotRY', 0, 0, NULL, NULL, 'malloychuck985547@yahoo.com', '3256345513', 'KgPIrBinHUbbEi', 1, NULL, '$2y$12$6shSPkrql3sDdQ9iMMin9OSwDqEEoIQM07zkg/MGHBX51CgLspokC', 1, 0, NULL, 0, NULL, '2025-07-04 03:21:39', '2025-07-04 03:21:39');
INSERT INTO `agents` VALUES(200, 'WEB-250705011023', 'GzBChqlyEfHjlW', 0, 0, NULL, NULL, 'ecimahelivas50@gmail.com', '6336161366', 'cGzxMUIylcIhlr', 1, NULL, '$2y$12$LXupEAi2QyMIA.Cha6d.Y.OJEML1r2Q6ikzsWDnCfThdUHzRQ/RKO', 1, 0, NULL, 0, NULL, '2025-07-04 18:10:24', '2025-07-04 18:10:24');
INSERT INTO `agents` VALUES(201, 'WEB-250705145013', 'nZpevBdnGUm', 0, 0, NULL, NULL, 'rifajus474@gmail.com', '4771159796', 'kKTmekCBKkQrO', 1, NULL, '$2y$12$b.2UFPWd/f8Y98LUpWcUk.X/EQOnlkRQjdXwZo40pkyf4P.cKtq7m', 1, 0, NULL, 0, NULL, '2025-07-05 07:50:13', '2025-07-05 07:50:13');
INSERT INTO `agents` VALUES(202, 'WEB-250706032255', 'cwOmmNBzkS', 0, 0, NULL, NULL, 'weaverreksanaq38@gmail.com', '4129307474', 'JqgViGCrUETW', 1, NULL, '$2y$12$ZLKGZTSOLgmhv5FrnGDPdeiEeYArKEW8esSb5ZAqOPat/FkKftaPK', 1, 0, NULL, 0, NULL, '2025-07-05 20:22:56', '2025-07-05 20:22:56');
INSERT INTO `agents` VALUES(203, 'WEB-250706082754', 'TpKdMjzdHHC', 0, 0, NULL, NULL, 'kingvestlr11@gmail.com', '7507165578', 'plEsZVTfyEZ', 1, NULL, '$2y$12$NcNBQNCsBfDgeSrnjt1pNu8HGeJ2BC7wyciGsg3LViUal0YiQFn2y', 1, 0, NULL, 0, NULL, '2025-07-06 01:27:55', '2025-07-06 01:27:55');
INSERT INTO `agents` VALUES(204, 'WEB-250706102543', 'QTLfiNZjOfu', 0, 0, NULL, NULL, 'oqixokajek28@gmail.com', '6479350947', 'zBAOQGuIB', 1, NULL, '$2y$12$C5lMLZDijWusP73b.t5z5OCaJ6es1f.W5bFaCsPF/RpHgvIssPKta', 1, 0, NULL, 0, NULL, '2025-07-06 03:25:44', '2025-07-06 03:25:44');
INSERT INTO `agents` VALUES(205, 'WEB-250706104620', 'kVdQQhLk', 0, 0, NULL, NULL, 'peqobaruvak66@gmail.com', '2066729807', 'MyemkjVWf', 1, NULL, '$2y$12$JbSOCh0EJvJh6mpErJiCmu3d4hW9fZjItniGl6syAlevguiaMoIwi', 1, 0, NULL, 0, NULL, '2025-07-06 03:46:20', '2025-07-06 03:46:20');
INSERT INTO `agents` VALUES(206, 'WEB-250706112416', 'llrzkHKvQeRAMG', 0, 0, NULL, NULL, 'xatohumo79@gmail.com', '5050711139', 'lZUzhULq', 1, NULL, '$2y$12$ietjjfUfhYXK1fl/HK0k8e6FKdKyIBmF2U0fKJRauqxFL7keNIPaa', 1, 0, NULL, 0, NULL, '2025-07-06 04:24:16', '2025-07-06 04:24:16');
INSERT INTO `agents` VALUES(207, 'WEB-250706142911', 'nJuEBAtPfNcoF', 0, 0, NULL, NULL, 'ozufepateza486@gmail.com', '5371850641', 'IXfSdzwN', 1, NULL, '$2y$12$DvJMkqdE6c4PjIS4nHK1teEwbHRP2cgp2MJ1I44fbuzwI0k5Bzzea', 1, 0, NULL, 0, NULL, '2025-07-06 07:29:11', '2025-07-06 07:29:11');
INSERT INTO `agents` VALUES(208, 'WEB-250707104517', 'kzWIeWQuzDXx', 0, 0, NULL, NULL, 'olliduartef41@gmail.com', '5690229752', 'MvbHCZWc', 1, NULL, '$2y$12$I4jEGn9drBSmEZvsQ2KYZ.UI99l6hntJwMOKMGjkE9TVT2CEjCT36', 1, 0, NULL, 0, NULL, '2025-07-07 03:45:17', '2025-07-07 03:45:17');
INSERT INTO `agents` VALUES(209, 'WEB-250707165038', 'KlRZpwNNnELYaV', 0, 0, NULL, NULL, 'issachris272189@yahoo.com', '2553975293', 'LWiKJUGdRpL', 1, NULL, '$2y$12$FM7x1Ajo56l/Md8G8hFctunC/RqVdNSSHq5CwF0mpyjV15BIbsOtK', 1, 0, NULL, 0, NULL, '2025-07-07 09:50:39', '2025-07-07 09:50:39');
INSERT INTO `agents` VALUES(210, 'WEB-250708015358', 'ndwdiuHxFAuDO', 0, 0, NULL, NULL, 'racchenm@gmail.com', '9347810560', 'GTIBlDRHAuHh', 1, NULL, '$2y$12$PpXTL9P7x05vDe37WbqVPef/dDWj.npoenOHUr82O3Pfl8ORcWMvq', 1, 0, NULL, 0, NULL, '2025-07-07 18:53:59', '2025-07-07 18:53:59');
INSERT INTO `agents` VALUES(211, 'WEB-250710083535', 'BMjGWOmni', 0, 0, NULL, NULL, 'curulinos38@gmail.com', '5046184710', 'OtHdZLhBPgzMW', 1, NULL, '$2y$12$jwSQYH3RLBfUP/2q1MJJseRnRvQgz6VhwW52x803AVu5PDqXOeltC', 1, 0, NULL, 0, NULL, '2025-07-10 01:35:36', '2025-07-10 01:35:36');
INSERT INTO `agents` VALUES(212, 'WEB-250710163109', 'wHiSfmnkwOEJs', 0, 0, NULL, NULL, 'hveronikagh5@gmail.com', '8224150027', 'dZQEjpqIRJhso', 1, NULL, '$2y$12$wPwdE2Mv9WAYhK9/KbQNd.DQclva2H6QB/lXNiEE2ZoYhF0UcjdpS', 1, 0, NULL, 0, NULL, '2025-07-10 09:31:09', '2025-07-10 09:31:09');
INSERT INTO `agents` VALUES(213, 'WEB-250711023956', 'gbmuMJnL', 0, 0, NULL, NULL, 'klemmimru97@gmail.com', '6241589186', 'eEGRjWxvu', 1, NULL, '$2y$12$2WLvAfaraSQgfwArByRM8uo4OalapKVIsHhY6AHiPYVEqK.lU5Fki', 1, 0, NULL, 0, NULL, '2025-07-10 19:39:56', '2025-07-10 19:39:56');
INSERT INTO `agents` VALUES(214, 'WEB-250711035259', 'yXpIMBepmMGw', 0, 0, NULL, NULL, 'canininow756@gmail.com', '5045703689', 'HKJSQRKHjQUUQuU', 1, NULL, '$2y$12$OFmsmTNIBl1lA/tQwwG.PuxXq4uWoNPcFh5/mUW2daLzPXPhJZ8lO', 1, 0, NULL, 0, NULL, '2025-07-10 20:52:59', '2025-07-10 20:52:59');
INSERT INTO `agents` VALUES(215, 'WEB-250711141224', 'ADHiSxHvDYTf', 0, 0, NULL, NULL, 'xotaxegevujo52@gmail.com', '5139894161', 'GqqwXOvxBKvMCD', 1, NULL, '$2y$12$PJG.HtsXCeJ79mzaINkXZu1.u3EygL.0yMHDhz0ZBCTs8DGByOxkm', 1, 0, NULL, 0, NULL, '2025-07-11 07:12:24', '2025-07-11 07:12:24');
INSERT INTO `agents` VALUES(216, 'WEB-250712215710', 'tmkrNCaUgtujl', 0, 0, NULL, NULL, 'abrockeu@gmail.com', '6447967592', 'AXUxxbIAkYmibq', 1, NULL, '$2y$12$70kKxhhT6RrAlyo8QFqP6.YYfIiS/Vw0GYsP/lIZCuHSoN2EPSAUq', 1, 0, NULL, 0, NULL, '2025-07-12 14:57:11', '2025-07-12 14:57:11');
INSERT INTO `agents` VALUES(217, 'WEB-250712234733', 'XZFGYXzbALa', 0, 0, NULL, NULL, 'akleinw32@gmail.com', '9662823616', 'tmMemnQoTakYrma', 1, NULL, '$2y$12$sA.b.fzmcR7OXJ.OpmfvcOSsxZNePXKEcWuUE1ZQcrwKIDQez3SVC', 1, 0, NULL, 0, NULL, '2025-07-12 16:47:33', '2025-07-12 16:47:33');
INSERT INTO `agents` VALUES(218, 'WEB-250713042756', 'BnGzWHaJ', 0, 0, NULL, NULL, 'darilcharlesv1992@gmail.com', '7182919340', 'GqoyubnN', 1, NULL, '$2y$12$7O.YJC8.V6dL720UiSLB7OAUj2.m2zzw7QmdghfTlpAF/6PYcjMIe', 1, 0, NULL, 0, NULL, '2025-07-12 21:27:56', '2025-07-12 21:27:56');
INSERT INTO `agents` VALUES(219, 'WEB-250713094518', 'kPcnCVjmeqp', 0, 0, NULL, NULL, 'riganalexanderf@gmail.com', '9433923177', 'knJXBrUKZwBhi', 1, NULL, '$2y$12$tskmI/lKL10z0vKi7Jbr2uC924trP..i2jDwN3hN9948ZkbLf7noi', 1, 0, NULL, 0, NULL, '2025-07-13 02:45:19', '2025-07-13 02:45:19');
INSERT INTO `agents` VALUES(220, 'WEB-250714075047', 'bOFwPDTsUgAsQ', 0, 0, NULL, NULL, 'honoramdn@gmail.com', '2408553077', 'pDPYytEngAr', 1, NULL, '$2y$12$OXvYtWItENBqLEtzRc4IbeALKHHXFpdX7YbRtZPOdLKp0AwFUP3JO', 1, 0, NULL, 0, NULL, '2025-07-14 00:50:48', '2025-07-14 00:50:48');
INSERT INTO `agents` VALUES(221, 'WEB-250715035347', 'pMSfKPAXp', 0, 0, NULL, NULL, 'bessisii2002@gmail.com', '6466288909', 'oeCHlyIhuaXFgp', 1, NULL, '$2y$12$24IF93L9rd4WY2MrfJceqOFOOcFP.tsu6p6rzhIJ7cdf63ey7AVzm', 1, 0, NULL, 0, NULL, '2025-07-14 20:53:47', '2025-07-14 20:53:47');
INSERT INTO `agents` VALUES(222, 'WEB-250716052024', 'tzzwAmIY', 0, 0, NULL, NULL, 'kareramos71@gmail.com', '8637360661', 'OeAwiAEgIhu', 1, NULL, '$2y$12$udqRRD.txxX/H5GeTWLo5.7L3BrEj6KhjA4Ynx.tGYX9CqSU2iYBy', 1, 0, NULL, 0, NULL, '2025-07-15 22:20:24', '2025-07-15 22:20:24');
INSERT INTO `agents` VALUES(223, 'WEB-250716145013', 'xghXfpIefXPheer', 0, 0, NULL, NULL, 'upesagaqi19@gmail.com', '4342340151', 'AnQaOrwlUiez', 1, NULL, '$2y$12$NzHVj1.md6zFF.V.pPEVNO5FRbMV8L4bp10d1Nb5or792eOmWRm9K', 1, 0, NULL, 0, NULL, '2025-07-16 07:50:13', '2025-07-16 07:50:13');
INSERT INTO `agents` VALUES(224, 'WEB-250716145620', 'ovKFcHFAqpFzoYb', 0, 0, NULL, NULL, 'okuviruz833@gmail.com', '9995035030', 'fFfcBQzkO', 1, NULL, '$2y$12$EcMcGQxhQ...5U.4kAJtouds32w7lI/HMtZJ1O0K8kCeMy2TWobTa', 1, 0, NULL, 0, NULL, '2025-07-16 07:56:20', '2025-07-16 07:56:20');
INSERT INTO `agents` VALUES(225, 'WEB-250717012343', 'fTrqGVsVpDYnQra', 0, 0, NULL, NULL, 'walternilym5@gmail.com', '6799354114', 'mKooPzNrS', 1, NULL, '$2y$12$.xR8RzEARwj3VHYnpaL0v.or.I/2Uw.JwzdNh3IpcKXSoKpUYSotS', 1, 0, NULL, 0, NULL, '2025-07-16 18:23:44', '2025-07-16 18:23:44');
INSERT INTO `agents` VALUES(226, 'WEB-250717075131', 'WyYEnRhLdX', 0, 0, NULL, NULL, 'epalovofo53@gmail.com', '4289692674', 'OCsRHYYLFW', 1, NULL, '$2y$12$/X21rRrAzzdsNZZg/KSupelJIi.56AQV7aNh0P0DcMRxSrxEytAoK', 1, 0, NULL, 0, NULL, '2025-07-17 00:51:32', '2025-07-17 00:51:32');
INSERT INTO `agents` VALUES(227, 'WEB-250717175201', 'KkXvnHeQwNagEKI', 0, 0, NULL, NULL, 'djaklincci1988@gmail.com', '8832060789', 'eHZKFaOpPQLQ', 1, NULL, '$2y$12$HC0NPeZBnNxM7X3UQnmRRO1KOjfsRW8vAaB5pC4yD/QA4wgJP.fzm', 1, 0, NULL, 0, NULL, '2025-07-17 10:52:01', '2025-07-17 10:52:01');
INSERT INTO `agents` VALUES(228, 'WEB-250719030702', 'EDGMsbrEJv', 0, 0, NULL, NULL, 'sheinhk4@gmail.com', '2039011148', 'mssQFTyED', 1, NULL, '$2y$12$jAFos/VoOfy1GgPoHT7K3uzFRrvfDt3cB923NYSW32RCoGItFVqhq', 1, 0, NULL, 0, NULL, '2025-07-18 20:07:03', '2025-07-18 20:07:03');
INSERT INTO `agents` VALUES(229, 'WEB-250721084435', 'dTPbREvzAM', 0, 0, NULL, NULL, 'wowuzim807@gmail.com', '2119683532', 'bwDdnsEz', 1, NULL, '$2y$12$Zh7cpc0kAmW/9NT6hyxm4eIy3YBGKysVKKZsnfdXnnvxuvnrDPn1i', 1, 0, NULL, 0, NULL, '2025-07-21 01:44:35', '2025-07-21 01:44:35');
INSERT INTO `agents` VALUES(230, 'WEB-250722061313', 'uLTsixTImgPO', 0, 0, NULL, NULL, 'verdjilprestonq43@gmail.com', '6602985080', 'uArDZGaXyoLWOwK', 1, NULL, '$2y$12$ecUXvXud34EMQCw9jKuZieWT8Rnss0OnIX8knWNzCrMwRFLCWdgP.', 1, 0, NULL, 0, NULL, '2025-07-21 23:13:13', '2025-07-21 23:13:13');
INSERT INTO `agents` VALUES(231, 'WEB-250722143203', 'GMPEUbVtH', 0, 0, NULL, NULL, 'shanejacobsen393127@yahoo.com', '7268764845', 'RehtMeWgojGLO', 1, NULL, '$2y$12$IzspK4VHPxNRyYh8yTMtTOPw0SkucAMGFYYGAwuJ3H5P5C4CTmzEO', 1, 0, NULL, 0, NULL, '2025-07-22 07:32:04', '2025-07-22 07:32:04');
INSERT INTO `agents` VALUES(232, 'WEB-250723135609', 'fgFWxeNGyb', 0, 0, NULL, NULL, 'nonicasenp1@gmail.com', '2146114426', 'lscliyxOlNef', 1, NULL, '$2y$12$LaY3u8v49UYMG.XBjvHb2OpXpWAmet/pCWCBTDBgcvg.mrzpz/d0C', 1, 0, NULL, 0, NULL, '2025-07-23 06:56:10', '2025-07-23 06:56:10');
INSERT INTO `agents` VALUES(233, 'WEB-250724021649', 'LMXAtQlthwcZ', 0, 0, NULL, NULL, 'kgalvansm1994@gmail.com', '9777371077', 'kWZcBNAiBmwyGz', 1, NULL, '$2y$12$/EHrA2CeZeennlV4qLSGe.6JBFB9gPA9i6rEd6Zk43KZ7OLaHQ8Ly', 1, 0, NULL, 0, NULL, '2025-07-23 19:16:49', '2025-07-23 19:16:49');
INSERT INTO `agents` VALUES(234, 'WEB-250724054730', 'jVyeZRXUvFWZQ', 0, 0, NULL, NULL, 'elichasevr24@gmail.com', '5042396755', 'oclrORBJECMPuGP', 1, NULL, '$2y$12$nOXqapCbrFE2yp4emd8iTena2DN1fmjdQAchBcolEramtCOYvsHze', 1, 0, NULL, 0, NULL, '2025-07-23 22:47:31', '2025-07-23 22:47:31');
INSERT INTO `agents` VALUES(235, 'WEB-250726085031', 'YjZnliQVtTFctz', 0, 0, NULL, NULL, 'hicorir925@gmail.com', '5039335769', 'oODhzegeilsfwLt', 1, NULL, '$2y$12$ffgvKTc9QxGSSLAM1bhrN.zwWHx9NZ8LddyQc6Bif.AY6YxU2Hryy', 1, 0, NULL, 0, NULL, '2025-07-26 01:50:32', '2025-07-26 01:50:32');
INSERT INTO `agents` VALUES(236, 'WEB-250726105353', 'hPCMvmTgs', 0, 0, NULL, NULL, 'enuluqevad176@gmail.com', '2594096447', 'GKtBHLmBjK', 1, NULL, '$2y$12$9t2BW.u7Swekktzrxy55nuXaNnw7SX5qhs2sTZQMowDSMhPuUV.7.', 1, 0, NULL, 0, NULL, '2025-07-26 03:53:53', '2025-07-26 03:53:53');
INSERT INTO `agents` VALUES(237, 'WEB-250726201133', 'OeAOvFvxiPt', 0, 0, NULL, NULL, 'ufaranoleso704@gmail.com', '3338356258', 'ClufYufqgH', 1, NULL, '$2y$12$M78lqX5/iYCJzNA9R.7j/OhvtNhCiQtnsH6I0h81NOFjmXvtdHo6S', 1, 0, NULL, 0, NULL, '2025-07-26 13:11:34', '2025-07-26 13:11:34');
INSERT INTO `agents` VALUES(238, 'WEB-250726230711', 'WzSaqmvWgqapn', 0, 0, NULL, NULL, 'siscotim921878@yahoo.com', '9220406795', 'tsFjjFZTNSkMZg', 1, NULL, '$2y$12$4YHHruxKaTxx8LMB9nGUtuvbRhm.4yhGTzJ6B/mnB3NceobPou1di', 1, 0, NULL, 0, NULL, '2025-07-26 16:07:12', '2025-07-26 16:07:12');
INSERT INTO `agents` VALUES(239, 'WEB-250727034702', 'kBOABayWgE', 0, 0, NULL, NULL, 'idumunoyogah40@gmail.com', '6329510498', 'jRDlIIESOD', 1, NULL, '$2y$12$Pc3tXxVM0fJZCmZyspDWu.1EyK1cdBveiqs9Lc1r1uz61JtvJPEfu', 1, 0, NULL, 0, NULL, '2025-07-26 20:47:02', '2025-07-26 20:47:02');
INSERT INTO `agents` VALUES(240, 'WEB-250727045341', 'FmzPbdfaM', 0, 0, NULL, NULL, 'cipozudisav602@gmail.com', '7852788187', 'KtfdLQksksAvTLo', 1, NULL, '$2y$12$mYBjSeDcfF0v92Iyq9Q2EOaNTbzB3So3mdef478qGR3yuT8pb9Lja', 1, 0, NULL, 0, NULL, '2025-07-26 21:53:42', '2025-07-26 21:53:42');
INSERT INTO `agents` VALUES(241, 'WEB-250728014840', 'iOLoiWpvXBZV', 0, 0, NULL, NULL, 'linseilqt75@gmail.com', '2494135681', 'tYnkZpqMeFFp', 1, NULL, '$2y$12$R0HKk4J9k4xr0lHrzgGTGuYKLarYduOHj/C8p2eOd1jsbloNyxVDW', 1, 0, NULL, 0, NULL, '2025-07-27 18:48:40', '2025-07-27 18:48:40');
INSERT INTO `agents` VALUES(242, 'WEB-250728210205', 'zAsRaIbZbmRYC', 0, 0, NULL, NULL, 'danielseldven@gmail.com', '4212284127', 'cKPFGDrBMUa', 1, NULL, '$2y$12$X9KbQzNEYn9y8kvSX.CIW.a4jqbUoxF3jQ1B5K9jKbKkt3Yph3IuW', 1, 0, NULL, 0, NULL, '2025-07-28 14:02:06', '2025-07-28 14:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `agent_commission`
--

CREATE TABLE `agent_commission` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `commission` double DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_level`
--

CREATE TABLE `agent_level` (
  `id` int(10) UNSIGNED NOT NULL,
  `levelname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricepercent` tinyint(4) NOT NULL DEFAULT '1',
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `attachmentable_id` int(11) DEFAULT NULL,
  `attachmentable_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `banner_type`
--

CREATE TABLE `banner_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '2' COMMENT '1=>video, 2=>image',
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_type`
--

INSERT INTO `banner_type` VALUES(1, 'Banner', 'trangchu', 2, 2, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` VALUES('1|80.64.30.32', 'i:1;', 1739882031);
INSERT INTO `cache` VALUES('1|80.64.30.32:timer', 'i:1739882031;', 1739882031);
INSERT INTO `cache` VALUES('123456|92.255.57.103', 'i:1;', 1739883811);
INSERT INTO `cache` VALUES('123456|92.255.57.103:timer', 'i:1739883811;', 1739883811);
INSERT INTO `cache` VALUES('admin@quadacsan.com|80.64.30.32', 'i:1;', 1739884932);
INSERT INTO `cache` VALUES('admin@quadacsan.com|80.64.30.32:timer', 'i:1739884932;', 1739884932);
INSERT INTO `cache` VALUES('admin@quadacsan.com|92.255.57.103', 'i:1;', 1739884388);
INSERT INTO `cache` VALUES('admin@quadacsan.com|92.255.57.103:timer', 'i:1739884388;', 1739884388);
INSERT INTO `cache` VALUES('admin|45.135.232.10', 'i:1;', 1748382478);
INSERT INTO `cache` VALUES('admin|45.135.232.10:timer', 'i:1748382478;', 1748382478);
INSERT INTO `cache` VALUES('admin|80.64.30.32', 'i:1;', 1743139219);
INSERT INTO `cache` VALUES('admin|80.64.30.32:timer', 'i:1743139219;', 1743139219);
INSERT INTO `cache` VALUES('admin|92.255.57.103', 'i:1;', 1739885253);
INSERT INTO `cache` VALUES('admin|92.255.57.103:timer', 'i:1739885253;', 1739885253);
INSERT INTO `cache` VALUES('administrator|80.64.30.32', 'i:1;', 1743908006);
INSERT INTO `cache` VALUES('administrator|80.64.30.32:timer', 'i:1743908006;', 1743908006);
INSERT INTO `cache` VALUES('adminstrator|14.186.17.91', 'i:3;', 1737173941);
INSERT INTO `cache` VALUES('adminstrator|14.186.17.91:timer', 'i:1737173941;', 1737173941);
INSERT INTO `cache` VALUES('demo|80.64.30.32', 'i:1;', 1739881650);
INSERT INTO `cache` VALUES('demo|80.64.30.32:timer', 'i:1739881650;', 1739881650);
INSERT INTO `cache` VALUES('editor|80.64.30.32', 'i:1;', 1739881153);
INSERT INTO `cache` VALUES('editor|80.64.30.32:timer', 'i:1739881153;', 1739881153);
INSERT INTO `cache` VALUES('jq1|80.64.30.32', 'i:1;', 1739882021);
INSERT INTO `cache` VALUES('jq1|80.64.30.32:timer', 'i:1739882021;', 1739882021);
INSERT INTO `cache` VALUES('jq123456|92.255.57.103', 'i:1;', 1739883802);
INSERT INTO `cache` VALUES('jq123456|92.255.57.103:timer', 'i:1739883802;', 1739883802);
INSERT INTO `cache` VALUES('jqadmin@quadacsan.com|80.64.30.32', 'i:1;', 1739884923);
INSERT INTO `cache` VALUES('jqadmin@quadacsan.com|80.64.30.32:timer', 'i:1739884923;', 1739884923);
INSERT INTO `cache` VALUES('jqadmin@quadacsan.com|92.255.57.103', 'i:1;', 1739884379);
INSERT INTO `cache` VALUES('jqadmin@quadacsan.com|92.255.57.103:timer', 'i:1739884379;', 1739884379);
INSERT INTO `cache` VALUES('jqadmin|45.135.232.10', 'i:1;', 1748382470);
INSERT INTO `cache` VALUES('jqadmin|45.135.232.10:timer', 'i:1748382470;', 1748382470);
INSERT INTO `cache` VALUES('jqadmin|80.64.30.32', 'i:1;', 1743139210);
INSERT INTO `cache` VALUES('jqadmin|80.64.30.32:timer', 'i:1743139210;', 1743139210);
INSERT INTO `cache` VALUES('jqadmin|92.255.57.103', 'i:1;', 1739885244);
INSERT INTO `cache` VALUES('jqadmin|92.255.57.103:timer', 'i:1739885244;', 1739885244);
INSERT INTO `cache` VALUES('jqadministrator|80.64.30.32', 'i:1;', 1743907998);
INSERT INTO `cache` VALUES('jqadministrator|80.64.30.32:timer', 'i:1743907998;', 1743907998);
INSERT INTO `cache` VALUES('jqdemo|80.64.30.32', 'i:1;', 1739881642);
INSERT INTO `cache` VALUES('jqdemo|80.64.30.32:timer', 'i:1739881642;', 1739881642);
INSERT INTO `cache` VALUES('jqeditor|80.64.30.32', 'i:1;', 1739881145);
INSERT INTO `cache` VALUES('jqeditor|80.64.30.32:timer', 'i:1739881145;', 1739881145);
INSERT INTO `cache` VALUES('jqmanager|80.64.30.32', 'i:1;', 1739881580);
INSERT INTO `cache` VALUES('jqmanager|80.64.30.32:timer', 'i:1739881580;', 1739881580);
INSERT INTO `cache` VALUES('jqquadacsan|80.64.30.32', 'i:1;', 1739881886);
INSERT INTO `cache` VALUES('jqquadacsan|80.64.30.32:timer', 'i:1739881886;', 1739881886);
INSERT INTO `cache` VALUES('jqquadacsan|92.255.57.103', 'i:1;', 1739884792);
INSERT INTO `cache` VALUES('jqquadacsan|92.255.57.103:timer', 'i:1739884792;', 1739884792);
INSERT INTO `cache` VALUES('jqsupport|80.64.30.32', 'i:1;', 1739881764);
INSERT INTO `cache` VALUES('jqsupport|80.64.30.32:timer', 'i:1739881764;', 1739881764);
INSERT INTO `cache` VALUES('jqtest|80.64.30.32', 'i:1;', 1739881519);
INSERT INTO `cache` VALUES('jqtest|80.64.30.32:timer', 'i:1739881519;', 1739881519);
INSERT INTO `cache` VALUES('jqtesting|80.64.30.32', 'i:1;', 1739881703);
INSERT INTO `cache` VALUES('jqtesting|80.64.30.32:timer', 'i:1739881703;', 1739881703);
INSERT INTO `cache` VALUES('jqwebmaster|80.64.30.32', 'i:1;', 1743867549);
INSERT INTO `cache` VALUES('jqwebmaster|80.64.30.32:timer', 'i:1743867549;', 1743867549);
INSERT INTO `cache` VALUES('manager|80.64.30.32', 'i:1;', 1739881589);
INSERT INTO `cache` VALUES('manager|80.64.30.32:timer', 'i:1739881589;', 1739881589);
INSERT INTO `cache` VALUES('pa-675837|123.21.115.105', 'i:1;', 1736818244);
INSERT INTO `cache` VALUES('pa-675837|123.21.115.105:timer', 'i:1736818244;', 1736818244);
INSERT INTO `cache` VALUES('quadacsan.com|123.21.115.105', 'i:1;', 1736818280);
INSERT INTO `cache` VALUES('quadacsan.com|123.21.115.105:timer', 'i:1736818280;', 1736818280);
INSERT INTO `cache` VALUES('quadacsan|80.64.30.32', 'i:1;', 1739881894);
INSERT INTO `cache` VALUES('quadacsan|80.64.30.32:timer', 'i:1739881894;', 1739881894);
INSERT INTO `cache` VALUES('quadacsan|92.255.57.103', 'i:1;', 1739884800);
INSERT INTO `cache` VALUES('quadacsan|92.255.57.103:timer', 'i:1739884800;', 1739884800);
INSERT INTO `cache` VALUES('support|80.64.30.32', 'i:1;', 1739881773);
INSERT INTO `cache` VALUES('support|80.64.30.32:timer', 'i:1739881773;', 1739881773);
INSERT INTO `cache` VALUES('test|80.64.30.32', 'i:1;', 1739881529);
INSERT INTO `cache` VALUES('test|80.64.30.32:timer', 'i:1739881529;', 1739881529);
INSERT INTO `cache` VALUES('testing|80.64.30.32', 'i:1;', 1739881712);
INSERT INTO `cache` VALUES('testing|80.64.30.32:timer', 'i:1739881712;', 1739881712);
INSERT INTO `cache` VALUES('webmaster|80.64.30.32', 'i:1;', 1743867558);
INSERT INTO `cache` VALUES('webmaster|80.64.30.32:timer', 'i:1743867558;', 1743867558);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_mailsmtp`
--

CREATE TABLE `config_mailsmtp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_mail`
--

CREATE TABLE `contact_mail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` VALUES(1, 'default', '{\"uuid\":\"53c47de1-bcf7-4866-9748-56834af5f818\",\"displayName\":\"App\\\\Mail\\\\MailOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\MailOrder\\\":3:{s:4:\\\"data\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:8:{s:4:\\\"info\\\";a:13:{s:6:\\\"_token\\\";s:40:\\\"RZnda0Jct7W5fJ9e028qNwsm4Srra106alii4nR9\\\";s:10:\\\"pricetotal\\\";s:6:\\\"548000\\\";s:3:\\\"fee\\\";s:1:\\\"0\\\";s:8:\\\"discount\\\";s:1:\\\"0\\\";s:12:\\\"transportfee\\\";s:1:\\\"2\\\";s:7:\\\"voucher\\\";s:3:\\\"aaa\\\";s:6:\\\"taxvat\\\";s:1:\\\"0\\\";s:12:\\\"deliverydate\\\";s:10:\\\"23\\/01\\/2025\\\";s:8:\\\"fullname\\\";s:30:\\\"Test - Nguyễn Thị Kim Loan\\\";s:7:\\\"address\\\";s:15:\\\"103 Pasteur, Q1\\\";s:5:\\\"phone\\\";s:10:\\\"0948844889\\\";s:5:\\\"email\\\";s:16:\\\"ntkl77@gmail.com\\\";s:5:\\\"notes\\\";s:8:\\\"Test web\\\";}s:4:\\\"cart\\\";O:23:\\\"App\\\\Models\\\\ProductOrder\\\":30:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:13:\\\"product_order\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:21:{s:8:\\\"fullname\\\";s:30:\\\"Test - Nguyễn Thị Kim Loan\\\";s:5:\\\"phone\\\";s:10:\\\"0948844889\\\";s:7:\\\"company\\\";N;s:7:\\\"address\\\";s:15:\\\"103 Pasteur, Q1\\\";s:14:\\\"sendingaddress\\\";s:15:\\\"103 Pasteur, Q1\\\";s:15:\\\"transportfee_id\\\";s:1:\\\"2\\\";s:12:\\\"transportfee\\\";i:0;s:12:\\\"deliverydate\\\";s:10:\\\"2025-01-23\\\";s:5:\\\"email\\\";s:16:\\\"ntkl77@gmail.com\\\";s:7:\\\"content\\\";s:8:\\\"Test web\\\";s:6:\\\"inv_id\\\";i:3;s:7:\\\"invcode\\\";s:5:\\\"Q0003\\\";s:8:\\\"inv_code\\\";O:35:\\\"Ramsey\\\\Uuid\\\\Lazy\\\\LazyUuidFromString\\\":1:{s:6:\\\"string\\\";s:36:\\\"a3efb3fe-8c2d-4e52-8763-8910139a336f\\\";}s:8:\\\"isactive\\\";i:1;s:7:\\\"ischeck\\\";i:1;s:10:\\\"updated_at\\\";s:19:\\\"2025-01-23 15:32:45\\\";s:10:\\\"created_at\\\";s:19:\\\"2025-01-23 15:32:45\\\";s:2:\\\"id\\\";i:3;s:11:\\\"totalamount\\\";i:0;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";i:0;}s:11:\\\"\\u0000*\\u0000original\\\";a:21:{s:8:\\\"fullname\\\";s:30:\\\"Test - Nguyễn Thị Kim Loan\\\";s:5:\\\"phone\\\";s:10:\\\"0948844889\\\";s:7:\\\"company\\\";N;s:7:\\\"address\\\";s:15:\\\"103 Pasteur, Q1\\\";s:14:\\\"sendingaddress\\\";s:15:\\\"103 Pasteur, Q1\\\";s:15:\\\"transportfee_id\\\";s:1:\\\"2\\\";s:12:\\\"transportfee\\\";i:0;s:12:\\\"deliverydate\\\";s:10:\\\"2025-01-23\\\";s:5:\\\"email\\\";s:16:\\\"ntkl77@gmail.com\\\";s:7:\\\"content\\\";s:8:\\\"Test web\\\";s:6:\\\"inv_id\\\";i:3;s:7:\\\"invcode\\\";s:5:\\\"Q0003\\\";s:8:\\\"inv_code\\\";r:45;s:8:\\\"isactive\\\";i:1;s:7:\\\"ischeck\\\";i:1;s:10:\\\"updated_at\\\";s:19:\\\"2025-01-23 15:32:45\\\";s:10:\\\"created_at\\\";s:19:\\\"2025-01-23 15:32:45\\\";s:2:\\\"id\\\";i:3;s:11:\\\"totalamount\\\";i:0;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";i:0;}s:10:\\\"\\u0000*\\u0000changes\\\";a:3:{s:11:\\\"totalamount\\\";i:0;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";i:0;}s:8:\\\"\\u0000*\\u0000casts\\\";a:0:{}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:36:{i:0;s:2:\\\"id\\\";i:1;s:6:\\\"inc_id\\\";i:2;s:7:\\\"invcode\\\";i:3;s:8:\\\"inv_code\\\";i:4;s:7:\\\"user_id\\\";i:5;s:8:\\\"agent_id\\\";i:6;s:8:\\\"fullname\\\";i:7;s:7:\\\"address\\\";i:8;s:14:\\\"sendingaddress\\\";i:9;s:7:\\\"company\\\";i:10;s:5:\\\"email\\\";i:11;s:5:\\\"phone\\\";i:12;s:7:\\\"content\\\";i:13;s:9:\\\"totalcost\\\";i:14;s:11:\\\"totalamount\\\";i:15;s:8:\\\"discount\\\";i:16;s:7:\\\"balance\\\";i:17;s:3:\\\"COD\\\";i:18;s:15:\\\"transportfee_id\\\";i:19;s:12:\\\"transportfee\\\";i:20;s:6:\\\"taxvat\\\";i:21;s:7:\\\"voucher\\\";i:22;s:3:\\\"npp\\\";i:23;s:5:\\\"daily\\\";i:24;s:3:\\\"ctv\\\";i:25;s:14:\\\"commission_npp\\\";i:26;s:16:\\\"commission_daily\\\";i:27;s:14:\\\"commission_ctv\\\";i:28;s:8:\\\"isactive\\\";i:29;s:7:\\\"ischeck\\\";i:30;s:10:\\\"isdelivery\\\";i:31;s:12:\\\"deliverydate\\\";i:32;s:9:\\\"ispayment\\\";i:33;s:11:\\\"paymentdate\\\";i:34;s:10:\\\"created_at\\\";i:35;s:10:\\\"updated_at\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}}s:9:\\\"pricetype\\\";s:5:\\\"price\\\";s:7:\\\"invcode\\\";s:5:\\\"Q0003\\\";s:12:\\\"transportfee\\\";i:0;s:8:\\\"discount\\\";i:0;s:5:\\\"total\\\";i:0;s:6:\\\"taxvat\\\";i:0;}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:7:\\\"invcode\\\";s:5:\\\"Q0003\\\";s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1737621165, 1737621165);
INSERT INTO `jobs` VALUES(2, 'default', '{\"uuid\":\"5af6362c-1cdf-4b63-b074-5fdd1078cb62\",\"displayName\":\"App\\\\Mail\\\\MailOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\MailOrder\\\":3:{s:4:\\\"data\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:8:{s:4:\\\"info\\\";a:13:{s:6:\\\"_token\\\";s:40:\\\"TL4TeAGOr4QmkDrwrnR1hy75sPSlsk0xhEYN4UCe\\\";s:10:\\\"pricetotal\\\";s:6:\\\"274000\\\";s:3:\\\"fee\\\";s:5:\\\"25000\\\";s:8:\\\"discount\\\";s:1:\\\"0\\\";s:12:\\\"transportfee\\\";s:1:\\\"1\\\";s:7:\\\"voucher\\\";N;s:6:\\\"taxvat\\\";s:1:\\\"1\\\";s:12:\\\"deliverydate\\\";s:10:\\\"03\\/02\\/2025\\\";s:8:\\\"fullname\\\";s:7:\\\"Thắng\\\";s:7:\\\"address\\\";s:12:\\\"Thủ Đức\\\";s:5:\\\"phone\\\";s:10:\\\"0945685221\\\";s:5:\\\"email\\\";N;s:5:\\\"notes\\\";N;}s:4:\\\"cart\\\";O:23:\\\"App\\\\Models\\\\ProductOrder\\\":30:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:13:\\\"product_order\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:21:{s:8:\\\"fullname\\\";s:7:\\\"Thắng\\\";s:5:\\\"phone\\\";s:10:\\\"0945685221\\\";s:7:\\\"company\\\";N;s:7:\\\"address\\\";s:12:\\\"Thủ Đức\\\";s:14:\\\"sendingaddress\\\";s:12:\\\"Thủ Đức\\\";s:15:\\\"transportfee_id\\\";s:1:\\\"1\\\";s:12:\\\"transportfee\\\";i:25000;s:12:\\\"deliverydate\\\";s:10:\\\"2025-02-03\\\";s:5:\\\"email\\\";N;s:7:\\\"content\\\";N;s:6:\\\"inv_id\\\";i:1;s:7:\\\"invcode\\\";s:5:\\\"Q0001\\\";s:8:\\\"inv_code\\\";O:35:\\\"Ramsey\\\\Uuid\\\\Lazy\\\\LazyUuidFromString\\\":1:{s:6:\\\"string\\\";s:36:\\\"435b8e5f-a4f9-41a5-a699-229509a0e43d\\\";}s:8:\\\"isactive\\\";i:1;s:7:\\\"ischeck\\\";i:1;s:10:\\\"updated_at\\\";s:19:\\\"2025-02-03 09:58:02\\\";s:10:\\\"created_at\\\";s:19:\\\"2025-02-03 09:58:02\\\";s:2:\\\"id\\\";i:1;s:11:\\\"totalamount\\\";i:274000;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";d:27400;}s:11:\\\"\\u0000*\\u0000original\\\";a:21:{s:8:\\\"fullname\\\";s:7:\\\"Thắng\\\";s:5:\\\"phone\\\";s:10:\\\"0945685221\\\";s:7:\\\"company\\\";N;s:7:\\\"address\\\";s:12:\\\"Thủ Đức\\\";s:14:\\\"sendingaddress\\\";s:12:\\\"Thủ Đức\\\";s:15:\\\"transportfee_id\\\";s:1:\\\"1\\\";s:12:\\\"transportfee\\\";i:25000;s:12:\\\"deliverydate\\\";s:10:\\\"2025-02-03\\\";s:5:\\\"email\\\";N;s:7:\\\"content\\\";N;s:6:\\\"inv_id\\\";i:1;s:7:\\\"invcode\\\";s:5:\\\"Q0001\\\";s:8:\\\"inv_code\\\";r:45;s:8:\\\"isactive\\\";i:1;s:7:\\\"ischeck\\\";i:1;s:10:\\\"updated_at\\\";s:19:\\\"2025-02-03 09:58:02\\\";s:10:\\\"created_at\\\";s:19:\\\"2025-02-03 09:58:02\\\";s:2:\\\"id\\\";i:1;s:11:\\\"totalamount\\\";i:274000;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";d:27400;}s:10:\\\"\\u0000*\\u0000changes\\\";a:3:{s:11:\\\"totalamount\\\";i:274000;s:9:\\\"totalcost\\\";i:0;s:6:\\\"taxvat\\\";d:27400;}s:8:\\\"\\u0000*\\u0000casts\\\";a:0:{}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:36:{i:0;s:2:\\\"id\\\";i:1;s:6:\\\"inc_id\\\";i:2;s:7:\\\"invcode\\\";i:3;s:8:\\\"inv_code\\\";i:4;s:7:\\\"user_id\\\";i:5;s:8:\\\"agent_id\\\";i:6;s:8:\\\"fullname\\\";i:7;s:7:\\\"address\\\";i:8;s:14:\\\"sendingaddress\\\";i:9;s:7:\\\"company\\\";i:10;s:5:\\\"email\\\";i:11;s:5:\\\"phone\\\";i:12;s:7:\\\"content\\\";i:13;s:9:\\\"totalcost\\\";i:14;s:11:\\\"totalamount\\\";i:15;s:8:\\\"discount\\\";i:16;s:7:\\\"balance\\\";i:17;s:3:\\\"COD\\\";i:18;s:15:\\\"transportfee_id\\\";i:19;s:12:\\\"transportfee\\\";i:20;s:6:\\\"taxvat\\\";i:21;s:7:\\\"voucher\\\";i:22;s:3:\\\"npp\\\";i:23;s:5:\\\"daily\\\";i:24;s:3:\\\"ctv\\\";i:25;s:14:\\\"commission_npp\\\";i:26;s:16:\\\"commission_daily\\\";i:27;s:14:\\\"commission_ctv\\\";i:28;s:8:\\\"isactive\\\";i:29;s:7:\\\"ischeck\\\";i:30;s:10:\\\"isdelivery\\\";i:31;s:12:\\\"deliverydate\\\";i:32;s:9:\\\"ispayment\\\";i:33;s:11:\\\"paymentdate\\\";i:34;s:10:\\\"created_at\\\";i:35;s:10:\\\"updated_at\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}}s:9:\\\"pricetype\\\";s:5:\\\"price\\\";s:7:\\\"invcode\\\";s:5:\\\"Q0001\\\";s:12:\\\"transportfee\\\";i:25000;s:8:\\\"discount\\\";i:0;s:5:\\\"total\\\";i:274000;s:6:\\\"taxvat\\\";d:27400;}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:7:\\\"invcode\\\";s:5:\\\"Q0001\\\";s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1738551484, 1738551484);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_header`
--

CREATE TABLE `meta_header` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `script` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` tinyint(4) DEFAULT '2',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_header`
--

INSERT INTO `meta_header` VALUES(1, 'QUÀ ĐẶC SẢN VÙNG MIỀN VIỆT NAM - Đặc sản vùng miền ngon', 'trangchu', 'Chúng tôi tự hào mang đến cho bạn những sản phẩm đặc sản nổi tiếng từ khắp các vùng miền của Việt Nam, các đặc sản đều được tuyển chọn từ các thương hiệu nổi tiếng, tươi ngon và đậm đà hương vị.', 'Chuyên cung cấp những món ngon đậm đà hương vị Quê Nhà', NULL, 'quadacsan-logo_2.png', 2, 1, '2022-06-27 21:11:12', '2025-01-06 08:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ishot` tinyint(4) NOT NULL DEFAULT '0',
  `isdefault` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` VALUES(1, 1, 'Việt Nam là một trong 20 nền ẩm thực ngon nhất thế giới', NULL, NULL, '<p>Theo chuyên trang ẩm thực TasteAtlas, ẩm thực Việt Nam đứng thứ 19 trong bảng xếp hạng 100 nền ẩm thực ngon nhất thế giới năm 2024.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Gỏi cuốn\" src=\"/storage/photos/shares/tin-am-thuc/goi-cuon.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Gỏi cuốn - Ảnh: TasteAtlas</p>\r\n\r\n<p style=\"text-align: justify;\">Top 100 nền ẩm thực ngon nhất thế giới do TasteAtlas công bố, dựa trên 477.287 đánh giá hợp lệ cho 15.478 món ăn trong cơ sở dữ liệu của chuyên trang này.<br />\r\nVới đánh giá 4,34/5 sao do các chuyên gia ẩm thực, đầu bếp và khách quốc tế đánh giá, ẩm thực Việt Nam đứng vị trí 19 trong top này.</p>\r\n\r\n<p style=\"text-align: justify;\">Theo TasteAtlas, các món ăn phổ biến ở Việt Nam có thể kể ra như phở, bánh mì, bánh xèo, bún bò Huế, gỏi cuốn, bún bò Nam Bộ, cơm tấm, chả giò, bún chả, bánh cuốn, mì Quảng...<br />\r\nCòn có bún thịt nướng, cà ri gà, cơm chiên, bánh rán, bánh trôi, bún riêu, bún đậu mắm tôm, bò nướng lá lốt, bún mắm…</p>\r\n\r\n<p style=\"text-align: justify;\">TasteAtlas cũng nhắc đến cơm cháy, cơm lam, bánh chưng, bánh tét, bánh da lợn, bánh bèo, xôi, bò bía, bánh khoái, nem chua, bánh giò, bánh bột lọc, bánh chuối…<br />\r\nThậm chí có cả tiết canh - món khiến không ít người nước ngoài e ngại.</p>\r\n\r\n<p style=\"text-align: justify;\">Chuyên trang này cũng liệt kê một số sản vật địa phương nổi tiếng ở Việt Nam như cua Năm Căn, nước mắm Phan Thiết, sầu riêng Cái Mơn, ốc lể Hội An, xoài Hòa Lộc, ớt Phú Quốc...<br />\r\nCó cả gạo Nàng Thơm chợ Đào, dừa Bến Tre, lợn cắp nách Sa Pa, thanh long Bình Thuận, gà đen Sa Pa, quế Việt Nam, rượu nếp cẩm, rượu sim Phú Quốc, rượu táo mèo…</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Top 20 nền ẩm thực ngon nhất thế giới\" src=\"/storage/photos/shares/tin-am-thuc/top20-tasteatlas.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Top 20 nền ẩm thực ngon nhất thế giới - Đồ họa: TTXVN</p>\r\n\r\n<p><br />\r\nDẫn đầu bảng xếp hạng 100 nền ẩm thực ngon nhất là ẩm thực Hy Lạp. Trong top 10 còn có ẩm thực của các nước Ý, Mexico, Tây Ban Nha, Bồ Đào Nha, Thổ Nhĩ Kỳ, Indonesia, Pháp, Nhật Bản, Trung Quốc.<br />\r\nTrong khu vực Đông Nam Á, ngoài ẩm thực Việt Nam và ẩm thực Indonesia còn có ẩm thực các nước Thái Lan, Philippines, Malaysia, Singapore, Lào cũng nằm trong Top 100 nền ẩm thực ngon nhất thế giới.<br />\r\nMột số món ăn phổ biến của ẩm thực Việt Nam:</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Bún riêu\" src=\"/storage/photos/shares/tin-am-thuc/bun-rieu.jpg\" /><br />\r\n<span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:126%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span lang=\"vi\" style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:126%\"><span style=\"font-family:Roboto\"><span style=\"color:#8f8f8f\">Bún riêu - Ảnh: TasteAtlas</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Bánh giò - Ảnh: TasteAtlas\" src=\"/storage/photos/shares/tin-am-thuc/banh-gio.jpg\" /><br />\r\nBánh giò - Ảnh: TasteAtlas</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mì Quảng\" src=\"/storage/photos/shares/tin-am-thuc/mi-quang.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Mì Quảng - Ảnh: TasteAtlas</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Xôi\" src=\"/storage/photos/shares/tin-am-thuc/xoi.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Xôi - Ảnh: TasteAtlas</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Phở\" src=\"/storage/photos/shares/tin-am-thuc/pho.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Phở - Ảnh: TasteAtlas</p>\r\n\r\n<p style=\"text-align: justify;\">Nguồn bài viết: Báo Tuổi trẻ</p>', 'Ẩm thực Việt Nam', 'Ẩm thực Việt Nam', NULL, 'am-thuc-viet-nam-thuoc-top-20-ngon-nhat-the-gioi_3.jpg', 'viet-nam-la-mot-trong-20-nen-am-thuc-ngon-nhat-the-gioi', 0, 1, 1, 1, '2025-01-22 03:30:46', '2024-12-31 03:30:00', NULL);
INSERT INTO `news` VALUES(2, 1, 'Nước mắm, mắm nêm Việt lọt top 100 loại nước chấm ngon nhất thế giới', NULL, NULL, '<p>Chuyên trang ẩm thực Taste Atlas vừa công bố danh sách 100 loại nước chấm ngon nhất thế giới, trong đó Việt Nam ghi danh với hai loại nước chấm vô cùng gần gũi là nước mắm và mắm nêm.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;<img alt=\"Nước mắm và mắm nêm Việt Nam lọt danh sách 100 nước chấm ngon nhất thế giới\" src=\"/storage/photos/shares/tin-am-thuc/nuoc-mam-va-mam-nem.png\" /><br />\r\nNước mắm và mắm nêm Việt Nam lọt danh sách 100 nước chấm ngon nhất thế giới</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Nước mắm</strong><br />\r\nNước mắm đứng hạng 22 với 4.4/5 sao.</p>\r\n\r\n<p style=\"text-align: center;\"><br />\r\n&nbsp;<img alt=\"Nước mắm và mắm nêm Việt Nam lọt danh sách 100 nước chấm ngon nhất thế giới\" src=\"/images/news/nuoc-mam-toi-ot.jpg\" /><br />\r\nNước mắm thường xuất hiện trong các bữa ăn của người Việt - Ảnh: Taste Atlas</p>\r\n\r\n<p><br />\r\nNước mắm vừa là nước chấm của những món ăn truyền thống, vừa là gia vị cho các món ăn hiện đại.</p>\r\n\r\n<p>Người ăn dễ dàng bắt gặp nước mắm trong những bữa cơm nhà nấu, lẫn các khu ẩm thực đường phố ngày nay.</p>\r\n\r\n<p>Tại Việt Nam, nước mắm được chia làm hai loại là nước mắm mặn và nước mắm ngọt.</p>\r\n\r\n<p>Nước mắm góp mặt trong hầu hết các bữa ăn gia đình, tiệc tùng, quán ăn ven đường...</p>\r\n\r\n<p>Để làm ra một chén nước mắm ngọt \"đúng bài\" cần chuẩn bị các nguyên liệu như nước mắm, đường, nước cốt chanh hoặc giấm, tỏi, ớt và nước lọc, sau đó cân chỉnh để pha chúng với nhau.</p>\r\n\r\n<p>Tuy dùng những nguyên liệu giống nhau, nhưng hương vị nước mắm mỗi nhà đều mang một nét đặc trưng riêng. Điều đó phụ thuộc vào cách pha, khẩu vị của người làm.<br />\r\nQua việc \"ghép đôi\" nước chấm với những món ăn từ xưa nay, nước mắm ngọt ở Việt Nam thường ăn chung với cơm tấm, chả giò, bánh xèo...</p>\r\n\r\n<p>Trong khi đó, nước mắm mặn thường ăn kèm các món như lẩu, đồ ăn hấp, đồ ăn luộc...</p>\r\n\r\n<p><strong>Mắm nêm</strong><br />\r\nMắm nêm đứng hạng 96 với 3.9/5 sao.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;<img alt=\"Mắm nêm có sự điều chỉnh cho phù hợp khẩu vị của thực khách từng vùng miền\" src=\"/storage/photos/shares/tin-am-thuc/mam-nem.jpg\" /><br />\r\nMắm nêm có sự điều chỉnh cho phù hợp khẩu vị của thực khách từng vùng miền</p>\r\n\r\n<p style=\"text-align: justify;\">Đây cũng là một loại nước chấm truyền thống của người Việt. So với nước mắm, mắm nêm có độ \"bao phủ\" ít hơn trong những bữa ăn.<br />\r\nTrước đây mắm nêm thường được ăn nhiều ở các tỉnh miền Trung. Tuy nhiên ngày nay, món ăn các vùng miền dần trải đều khắp cả nước, vì thế mắm nêm cũng gần gũi hơn với cả ba miền.<br />\r\nMuốn cho ra một hũ mắm nêm dân dã, người pha chế thường chuẩn bị các nguyên liệu như thơm, gừng, sả, riềng, tỏi, ớt... Các thành phần này giúp làm dịu đi sự đậm mùi của mắm.</p>\r\n\r\n<p>Để pha chế, người làm sẽ cho mắm nêm nguyên chất cùng các nguyên liệu vào nồi, sau đó quậy đều lên. Việc quậy kỹ lưỡng quyết định phần lớn đến hương vị của mắm nêm.</p>\r\n\r\n<p style=\"text-align: center;\"><br />\r\n&nbsp;<img alt=\"Mắm nêm thường xuất hiện trong nhiều bữa ăn của người Việt\" src=\"/storage/photos/shares/tin-am-thuc/bun-dau-mam-tom.jpg\" /><br />\r\nMắm nêm thường xuất hiện trong nhiều bữa ăn của người Việt</p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\nMắm nêm thường được biết đến với vị mặn gắt.</p>\r\n\r\n<p style=\"text-align: justify;\">Tuy nhiên \"nhập gia tùy tục\", khi món ăn xuất hiện ở các vùng miền khác, được gia giảm cho phù hợp hơn, đặc biệt ở miền Nam, mắm nêm thường có nhiều vị ngọt.<br />\r\nMắm nêm là một loại nước chấm dân dã, cũng vì thế mà thường được dùng chung với những món ăn hết sức giản dị như bún, bánh tráng cuốn, bánh căn…</p>\r\n\r\n<p style=\"text-align: justify;\">Trích nguồn: Báo Tuổi trẻ</p>', NULL, NULL, NULL, 'nuoc-mam-toi-ot.jpg', 'nuoc-mam-mam-nem-viet-lot-top-100-loai-nuoc-cham-ngon-nhat-the-gioi', 0, 1, 2, 1, '2025-01-22 04:18:44', '2025-01-03 04:18:00', NULL);
INSERT INTO `news` VALUES(3, 1, 'Các món mắm đặc sản từng vùng miền', NULL, NULL, '<p style=\"text-align: justify;\">Dọc theo chiều dài đất nước, chúng ta có rất nhiều loại đặc sản mắm. Xuất phát từ thói quen dự trữ bảo quản lúc dư thừa, mắm vô tình thành thứ đặc sản hấp dẫn người sành ăn. Hãy cùng Món Ngon Bình Định khám phá loại đặc sản vô cùng đăc biệt và có “ mùi” này nhé</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>1. Mắm tép (Ninh Bình)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Mắm tép đặc sản danh bất hư truyền của miền đất danh kiệt Ninh Bình, nhưng không một ai biết được từ khi nào và ở đâu xuất hiện mắm tép này. Thành phần chính để làm nên mắm tép là những loại tép riu còn tươi, già, thân tròn nhỏ và có màu xanh lam. Điều tiên quyết có thể quyết định mắm đó ngon hay không, trước hết nguyên liệu phải tươi ngon. Để đánh bắt được tép, người ta phải đi từ sáng sớm tinh mơ, khi thời tiết mát mẻ, đánh bắt ở chỗ nào có nhiều rong rẻ, rong trơn thì tép mới ngon và tươi roi rói. Với những người có kinh nghiệm riu tép, hàng năm vào khoảng tháng 11 và tháng 12 âm lịch, khi nước hơi đục một chút thì sẽ có nhiều tép hơn. Mắm tép là một thứ thực phẩm dân dã nên hầu như nhà nào cũng có, tuy nhiên để có thể làm mắm ngon thì phải có đôi bàn tay khéo léo của người làm ra nó. Người làm phải thực hiện một quy trình nghiêm ngặt, cẩn thận từ khâu đãi tép để không còn cát sạn, sơ chế tép, rang thính, ủ mắm... Sau khi qua sơ chế, người ta phải bịt kín để từ một tháng trở lên mới đem nấu chín. Mắm càng để lâu mắm mới ngon ngọt, đậm đà, rất hấp dẫn.</p>\r\n\r\n<p style=\"text-align: center;\"><br />\r\n&nbsp;<img alt=\"Mắm tép đặc sản danh bất hư truyền của miền đất danh kiệt Ninh Bình\" src=\"/storage/photos/shares/tin-am-thuc/mam-tep-ninh-binh.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<strong>2. Mắm cáy (Thái Bình, Hải Dương, Hải Phòng) </strong></p>\r\n\r\n<p style=\"text-align: justify;\">Với người dân miền Bắc thì không còn ai xa lạ với mắm cáy nữa. Đây là loại mắm làm từ con cáy – còn gọi là cung càng đỏ, một loại cua sống nhiều vùng nước lợ ở vùng duyên hải, có màu xanh nâu, vị dịu, mùi hơi gắt. Sau khi bắt được cáy người ta đem làm sạch, để ráo, bóc yếm và giã nhuyễn, được trộn muối theo đúng tỷ lệ rồi cho vào chum vại ủ nơi thoáng mát khoảng 7-10 ngày. Tiếp đó, họ đem mắm ra phơi nắng, phơi sương chừng một tuần cho ngấm. Cuối cùng là trộn thêm thính, men rượu để khử mùi hôi và tạo mùi thơm. Trong thời tiết se lạnh của mùa đông miền Bắc, chỉ còn đĩa rau luộc với mắm cáy thôi cũng làm cho chúng ta ăn cơm không biết no. Và mỗi khi xa quê là bồi hồi thèm nhớ</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm cáy Thái Bình, Hải Dương, Hải Phòng\" src=\"/storage/photos/shares/tin-am-thuc/mam-cay-thai-binh-hai-duong.jpg\" /></p>\r\n\r\n<p>&nbsp;<br />\r\n<strong>3. Mắm tôm (Thanh Hóa)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Mắm tôm&nbsp; là một đặc sản nổi tiếng về độ nặng mùi. Mắm tôm nổi tiếng khắp cả nước và cả những người Việt xa quê với món bún đậu mắm tôm, bún riêu cua thì cũng cần phải có chút mắm tôm mới đậm vị, thịt giả cầy…Mắm tôm ngon nhất phải kể đến là mắm tôm Thanh Hóa với màu tím đặc trưng, hương nồng, mịn, không bị lẫn muối hạt và đặc biệt vị rất ngon. Mắm tôm có lẽ là loại mắm khó ăn nhất, có những người chỉ cần nghe mùi thôi đã không muốn cảm được món ăn này, nhưng nếu đã thưởng thức được thì lại rất mê mệt. Không phải làm từ tôm, tép như nhiều nơi khác mà mắm tôm xứ Thanh được làm từ con moi biển đánh bắt ở vùng biển Hậu Lộc. Nghề chế biến mắm tôm có từ lâu đời, xuất hiện vào thế kỷ thứ 12, chính vì vậy người dân nơi đây có kinh nghiệm chọn nguyên liệu và chế biến kỹ từng công đoạn đã tạo ra món mắm đặc trưng riêng.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm tôm Thanh Hóa\" src=\"/images/news/mam-tom-thanh-hoa.jpg\" /><br />\r\n&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>4. Mắm nêm (Đà Nẵng)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Nếu như du khách đã từng nếm món bánh tráng cuốn thịt heo nổi tiếng ở Đà Nẵng thì không thể không có ấn tượng với món mắm nêm ngon tuyệt. Hay mắm cá cơm Bình Định cũng tương tự. Mắm cá cơm ngon nhất phải được làm từ cá cơm than, lúc cá mới được bắt lên ghẹ còn tươi roi rói. Để làm món mắm này, cá được ướp muối, sau đó ủ khoảng 3 tháng rồi múc ra chén, thêm đường, chanh, tỏi băm nhuyễn và ớt nguyên trái dằm vào, trộn đều lên với thính, đường là được.Mắm cá cơm phải cay nhiều ớt mới đúng chất miền Trung, phổ biến được dùng để chấm ăn với rau luộc, cà giòn, bánh tráng thịt heo luộc,...và nhất là mua về làm quà cho mọi người cũng rất là ý nghĩa.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm nêm Đà Nẵng\" src=\"/storage/photos/shares/tin-am-thuc/mam-nem-da-nang.jpg\" /></p>\r\n\r\n<p><br />\r\n<strong>5. Mắm còng (Long An, Bến Tre,Tiền Giang)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Đến với các tỉnh miền Tây Nam Bộ, du khách hãy thử thưởng thức món mắm còng – là một đặc sản nổi tiếng của Long An, Bến Tre, Tiền Giang. Ở mỗi vùng khác nhau thì cách thức làm ra món mắm này cũng có sự khác biệt nhưng nhìn chung những con còng (một loại thuộc họ cua và nhỏ) sau khi được tách yếm, có thể phơi nắng rồi cho vào hũ ủ cùng các loại gia vị trong khoảng 45 ngày. Mắm còng không chỉ được dùng chung với cơm, hay cuốn chấm với thịt luộc, rau sống, bánh tráng, người ta còn dùng mắm còng nguyên chất để tăng vị cho bún riêu để tăng thêm vị ngon.<br />\r\n&nbsp;<br />\r\n<strong>6. Mắm nhum (Bình Định)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Con nhum hay còn gọi là nhím biển được người dân Bình Định đánh bắt để làm nên món mắm nhum nổi tiếng. Nguyên liệu chính để làm nên món mắm này là những con nhum biển. Nhum sau khi được làm sạch người ra sẽ rắc thêm muối rồi cất trong chum, phơi ngoài nắng chừng 20 ngày sẽ chín. Mắm mang màu đỏ rất đặc trưng, hương vị mằn mặn, béo bùi của nhím biển sẽ dễ dàng được du khách cảm nhận chỉ ngay lần nếm thử đầu tiên. Mắm nhum là một trong những đặc sản thú vị của Bình Định, tuy nhiên do độ khó của nguyên liệu cùng cách chế biến, chỉ những người sành ăn hay dân địa phương mới biết tên hay có dịp thưởng thức món ăn này. Chính vì vậy, du khách đừng bỏ lỡ cơ hội thưởng thức mắm nhum khi ghé qua địa danh này nhé.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm nhum Bình Định\" src=\"/storage/photos/shares/tin-am-thuc/mam-nhum-binh-dinh.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n&nbsp;<br />\r\n<strong>7. Mắm thái (An Giang)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Đến với vùng sông nước miền Tây, du khách hãy ghé thăm An Giang để thưởng thức “vương quốc mắm” ở vùng Châu Đốc. Được mệnh danh như vậy bởi Châu Đốc có một vị trí rất ngư ông đắc lợi – nằm ngay ngã ba sông Hậu, một trong hai nhánh của sông Mekong nổi tiếng với trữ lượng cá trong tự nhiên vô cùng phong phú. Đến đây, du khách sẽ bắt gặp các loại hấp dẫn và đa dạng như mắm cá linh, cá lóc, cá trèn, ba khía, cá sặc... hay nổi tiếng nhất là mắm Thái được bày bán khắp nơi. Mắm thái khác với các loại mắm khác bởi thành phần chính là cá lóc và đu đủ xanh (cả hai đều được xắt nhuyễn, có nhiều giả thuyết cho rằng vì lý do đó mà loại mắm này có tên như thế). Du khách có thể có nhiều cách thưởng thức mắm thái khác nhau, nhưng ngon nhất là ăn kèm với một mâm đầy đủ gồm bún, rau xanh, thịt luộc, bánh tráng. Không những vậy, du khách còn có thể mua về làm quà đặc sản trứ danh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm thái -An Giang\" src=\"/storage/photos/shares/tin-am-thuc/mam-thai-an-giang.jpg\" /></p>\r\n\r\n<p>&nbsp;<br />\r\n<strong>8. Mắm rươi (Trà Vinh)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Tháng chín ăn rươi, tháng mười ăn nhộng, hay bao giờ cho đến tháng mười, bát cơm thì trắng bát rươi thì đầy. Câu nói dân gian nói về mùa rươi nhiều nhất trong năm. Rươi là loài nhuyễn thể sống ở vùng nước lợ hoặc nước mặn. Rươi thường được dùng để chế biến các món ăn giàu dinh dưỡng như chả rươi, nem rán từ rươi, lẩu rươi, rươi rang muối và đặc biệt là mắm rươi Nếu thực khách đã từng nghe đến món chả rươi ngon tuyệt của miền Bắc thì hãy đến Trà Vinh thưởng thức món mắm rươi hấp dẫn không kém. Rươi sau khi vớt lên sẽ được đem rửa sạch rồi ủ trong lu cùng nước và muối hột, cuối cùng đem phơi nắng khoảng 10-15 ngày. Nước mắm rươi sẽ có màu màu vàng óng của mật ong và có một mùi thơm rất đặc trưng. Với loại mắm này, người ta sẽ vắt thêm chanh, ớt là có thể chấm cùng thịt luộc, rau xanh có mùi hăng nồng hay hương thơm mạnh như cải cúc, lá cần, hành hoa cắt khúc, hay húng để có thể dễ ăn hơn cho một số du khách.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm rươi - Trà Vinh\" src=\"/storage/photos/shares/tin-am-thuc/mam-ruoi-tra-vinh.jpg\" />&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<strong>9. Mắm ba khía (Cà Mau)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Mắm ba khía là loại mắm mang màu sắc đặc trưng của vùng đồng bằng sông Cửu Long. Mắm được làm từ con ba khía, một loài thuộc họ cua có càng to, sống tập trung ở vùng nước lợ, mặn, trải từ Cần Thơ đến Sóc Trăng, Cà Mau, nhiều nhất ở U Minh (Cà Mau). Do chúng có ba gạch ở trên lưng nên được đặt tên ba khía, và đặc biệt mỗi năm ba khía chỉ tập trung một lần vào 3 - 4 đêm của tháng 10. Cứ vào mùa nước lên, khi những hang của chúng dưới gốc đước, gốc mắm bị chìm trong nước, ba khía phải leo lên những rễ cây để trú ẩn và giao phối. Để làm mắm ba khía người ta thường chọn con nhỏ, gạch nhiều (gạch son màu đỏ, gạch bùn màu xám), thịt chắc (ngắt càng ra thịt không dính lại ngoe, càng). Ngon nhất là loại đang ôm trứng và không nên chọn con to<br />\r\nBa khía sau khi bắt về sẽ được rửa sạch bùn đất rồi cho vào nồi hoặc lu có chứa sẵn nước muối. Chất lượng của ba khía sau này phụ thuộc độ mặn của nước muối, công đoạn này đòi hỏi nhiều kỹ thuật và kinh nghiệm. Sau đó lấy lá dừa nước phủ lên. Ba khía làm “tới” có thể để cả năm không hư hỏng. Món gỏi ba khía đu đủ cũng rất nổi tiếng. Phần nước muối còn lại trong khạp sau khi bảo quản ba khía có thể dùng nấu nước mắm rất ngon. Về vùng nước nổi nhất định phải thử món mắm đặc sản ba khía này mới cảm nhận được hương vị miền Tây sông nước.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Mắm ba khía - Cà Mau\" src=\"/storage/photos/shares/tin-am-thuc/mam-ba-khia.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Trích: Món ngon Bình Định</p>', NULL, NULL, NULL, 'mam-tom-thanh-hoa.jpg', 'cac-mon-mam-dac-san-tung-vung-mien', 0, 1, 3, 1, '2025-01-22 07:05:12', '2025-01-22 07:05:12', NULL);
INSERT INTO `news` VALUES(4, 1, 'Bánh tét lọt top 100 món ăn từ đậu ngon nhất thế giới', NULL, NULL, '<p>Bánh tét truyền thống của Việt Nam lọt vào danh sách 100 món từ đậu ngon nhất theo chuyên trang ẩm thực Taste Atlas. Thời gian vừa qua, đây còn là món ăn được gửi đến cho người dân vùng bão lũ.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Bánh Tét\" src=\"/storage/photos/shares/tin-am-thuc/banh-tet.jpg\" /><br />\r\nBánh tét Việt Nam lọt danh sách 100 món ăn từ đậu ngon nhất thế giới - Ảnh: Chụp lại từ YOUTUBE</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong danh sách 100 món ăn từ đậu ngon nhất do chuyên trang Taste Atlas cập nhật ngày 17-9, bánh tét đứng hạng 47 với 4.1/5 sao.</p>\r\n\r\n<p><br />\r\n<strong>Bánh tét truyền thống</strong></p>\r\n\r\n<p>Bánh tét là một món ăn truyền thống của Việt Nam, thường góp mặt trong các dịp lễ đặc biệt như Tết, đám giỗ...</p>\r\n\r\n<p style=\"text-align: center;\"><br />\r\n<img alt=\"Bánh Tét\" src=\"/images/news/banh-tet-truyen-thong.jpg\" /><br />\r\nBánh tét thường xuất hiện trong các dịp đặc biệt - Ảnh: Chụp lại từ YOUTUBE</p>\r\n\r\n<p><br />\r\nTrước khi cho vào nồi hấp, các đòn bánh tét trải qua nhiều công đoạn đòi hỏi sự tỉ mỉ, khéo léo của bàn tay các bà, các mẹ.<br />\r\nNgười nấu cần chuẩn bị những nguyên liệu như nếp, đậu xanh, thịt ba chỉ, muối, tiêu xay... Đồng thời, lá chuối và lạt tre để gói cũng cần được vệ sinh sạch sẽ.<br />\r\nTheo Taste Atlas, việc sử dụng lá chuối khi gói bánh làm dậy lên hương thơm độc đáo của nếp.<br />\r\nCông đoạn đầu tiên là rửa sạch gạo nếp và ngâm ít nhất 8 tiếng, để gạo nở ra và mềm hơn.<br />\r\nĐậu xanh cũng được chuẩn bị tương tự, là rửa sạch, đãi vỏ và ngâm trong 4 tiếng.<br />\r\nSau khi ngâm, người làm bánh cần vớt nguyên liệu ra và để ráo nước.<br />\r\nVề thịt, người nấu sẽ cắt để thịt trở nên vừa vặn khi gói vào bánh tét, sau đó là nêm nếm cho phù hợp khẩu vị của mình, cuối cùng là bắt tay vào gói bánh.<br />\r\nĐây là một trong những thao tác đòi hỏi sự tỉ mỉ cao, quyết định chiếc bánh tét làm ra có khả năng lôi kéo thị giác của người ăn hay không.<br />\r\nNgười làm bánh trải lá chuối lên một mặt phẳng, phủ lên đó một lớp gạo nếp mỏng. Một lớp đậu xanh sẽ được dàn đều trên bề mặt của gạo và thịt ba chỉ được đặt ở giữa.<br />\r\nKhi gói, người làm cần cuộn, gấp mép lá chuối thật chắc để đảm bảo bánh có hình dạng đẹp mắt, không bị bung ra. Bánh tét thường được gói theo chiều dọc và chiều ngang.</p>\r\n\r\n<p><br />\r\n<strong>Gắn kết người Việt</strong><br />\r\nTừ xưa, hình ảnh đòn bánh tét thường gắn liền với các câu chuyện cổ tích, dân gian hay những ngày hội truyền thống.<br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Người dân chung tay gói bánh tét tặng đồng bào miền Bắc\" src=\"/storage/photos/shares/tin-am-thuc/nguoi-dan-chung-tay-goi-banh-tet-tang-dong-bao-mien-bac.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Người dân chung tay gói bánh tét tặng đồng bào miền Bắc</p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\nGần gũi hơn là vào ngày Tết, bánh tét là sự gắn kết của các thành viên trong gia đình, mỗi người góp tay một chút để làm bánh hoặc đó là thức ăn khi nhâm nhi trà và trò chuyện.<br />\r\nGần đây, những đòn bánh tét lại tôn lên tinh thần dân tộc của người Việt trong mùa bão lũ.<br />\r\nHình ảnh những người phụ nữ miền Nam, miền Trung quây quần bên nhau gói bánh để gửi tặng bà con trong vùng nước ngập miền Bắc khiến nhiều người cảm động.<br />\r\nNhững chiếc bánh được gửi đi sau nhiều ngày vẫn giữ nguyên được hương vị. Bí quyết là do tất cả bánh tét khi làm xong đều được cho vào nồi hấp suốt 12 tiếng, nhờ đó sau nhiều ngày bánh không bị hư.<br />\r\nViệc lựa chọn món bánh tét để gửi tặng vào lúc cả nước cần sự chung tay giúp đỡ phần nào cũng thể hiện tính truyền thống dân tộc đã gắn liền với món ăn.</p>\r\n\r\n<p>Trích: Báo Tuổi trẻ</p>', NULL, NULL, NULL, 'banh-tet-truyen-thong.jpg', 'banh-tet-lot-top-100-mon-an-tu-dau-ngon-nhat-the-gioi', 0, 1, 4, 1, '2025-01-22 07:29:39', '2025-01-22 07:29:39', NULL);
INSERT INTO `news` VALUES(5, 1, 'Kẹo dừa Bến Tre trong top 70 loại bánh kẹo ngon nhất thế giới', NULL, NULL, '<p>Trong 70 món bánh kẹo ngon nhất thế giới do chuyên trang ẩm thực Taste Atlas công bố, kẹo dừa Bến Tre được chấm 3.5/5 sao, xếp hạng 26 trong toàn danh sách.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Dừa để làm kẹo phải là dừa vừa khô để đảm bảo cho hương vị thơm, béo nhất - Ảnh: Chụp lại từ YOUTUBE\" src=\"/images/news/keo-dua-ben-tre.jpg\" /><br />\r\nKẹo dừa được kết hợp với nhiều hương vị khác để trở nên đa dạng - Ảnh: Taste Atlas</p>\r\n\r\n<p><br />\r\nKẹo dừa từ cốt dừa béo thơm, mạch nha bằng nếp tốt<br />\r\nKẹo dừa là một món đặc sản hiện lên trong tiềm thức của người Việt Nam khi nhắc về tỉnh Bến Tre. Loại kẹo này vừa mang yếu tố truyền thống, văn hóa, vừa là mặt hàng phục vụ cho mục đích du lịch trong khu vực.<br />\r\nKẹo dừa có nguồn gốc tại huyện Mỏ Cày, tỉnh Bến Tre. Ban đầu bà con vùng này gọi đây là kẹo Mỏ Cày. Theo thời gian, nhiều người điều chỉnh cách chế biến và cho ra đời hương vị như ngày nay.<br />\r\nKẹo dừa rất mềm và dai. Trong từng hương vị của kẹo cũng bộc lộ rõ thói quen ăn uống đặc trưng của người miền Tây, đó là vị ngọt sắc và thơm mùi dừa. Khi ăn, kẹo sẽ tan dần trong miệng.<br />\r\nLoại đặc sản này đòi hỏi người ăn phải kiên trì để cảm nhận vị của dừa hòa trong cái ngọt và hương thơm dịu, nhẹ nhưng tạo ấn tượng khó tả.<br />\r\nĐể làm nên những viên kẹo này, người nghệ nhân cần chuẩn bị các nguyên liệu gồm đường, đường mạch nha, nước cốt dừa. Món ăn đòi hỏi người làm phải tỉ mỉ trong từng công đoạn.<br />\r\nĐường mạch nha được làm từ ngũ cốc, hạt lúa mì, gạo nếp… Vì thế, người thợ phải lựa loại nếp tốt, hạt to.<br />\r\nNgoài ra, bà con nơi đây còn chú ý chọn những trái dừa khô vừa chín, được hái từ trên cây xuống và có màu rám vàng. Đặc điểm của những trái này là nước còn rất ít, cơm dừa dày.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Dừa để làm kẹo phải là dừa vừa khô để đảm bảo cho hương vị thơm, béo nhất - Ảnh: Chụp lại từ YOUTUBE\" src=\"/storage/photos/shares/tin-am-thuc/dua-kho-ben-tre.jpg\" /><br />\r\nDừa để làm kẹo phải là dừa vừa khô để đảm bảo cho hương vị thơm, béo nhất - Ảnh: Chụp lại từ YOUTUBE</p>\r\n\r\n<p><br />\r\nKhi ấy, dừa sẽ bộc lộ rõ hương vị đặc trưng, dùng làm nước cốt sẽ cho ra vị ngọt thanh hơn.<br />\r\nKhi các nguyên liệu đã sẵn sàng, người thợ sẽ cho tất cả vào một chảo lớn và khuấy liên tục. Công đoạn khuấy trông có vẻ đơn giản nhưng lại đòi hỏi sự công phu, điêu luyện.<br />\r\nLửa nhỏ khiến hỗn hợp bị lỏng, lửa lớn dễ khiến kẹo bị đặc. Vì thế, người thợ phải khuấy đều tay trong lúc sên. Tuy nhiên về sau máy móc đã trở thành công cụ chính làm việc này.<br />\r\nKhi hỗn hợp trở nên sền sệt và chuyển sang màu nâu caramel, những nghệ nhân bắt đầu đổ kẹo vào khuôn, cho thêm các thành phần khác như đậu phộng, lớp kẹo lá dứa, kẹo sầu riêng… Cuối cùng là cắt thành những viên kẹo.<br />\r\nTrở thành hình ảnh văn hóa của bà con miền Tây sông nước, kẹo dừa thường xuất hiện trên những bàn trà và những câu chuyện đời thường.<br />\r\nĐến ngày nay, không ít du khách cả trong lẫn ngoài nước đến đây để tìm hiểu nếp sống của người địa phương, trong đó chắc chắn phải kể đến việc ăn kẹo dừa.<br />\r\nTrích nguồn: Báo Tuổi trẻ</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, 'keo-dua-ben-tre.jpg', 'keo-dua-ben-tre-trong-top-70-loai-banh-keo-ngon-nhat-the-gioi', 0, 1, 5, 1, '2025-01-22 07:42:00', '2025-01-22 07:42:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_cat`
--

CREATE TABLE `news_cat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_cat`
--

INSERT INTO `news_cat` VALUES(1, 'Tin ẩm thực', NULL, '', 'tin-am-thuc', 2, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `orderid` varchar(190) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrcodeimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iccid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smdpaddress` varchar(200) COLLATE utf8_unicode_ci DEFAULT '1',
  `pin` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puk` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activationcode` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_request`
--

CREATE TABLE `order_request` (
  `orderid` varchar(190) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `trackid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtrackid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_capacity`
--

CREATE TABLE `product_capacity` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_capacity`
--

INSERT INTO `product_capacity` VALUES(1, '50gr', 1);
INSERT INTO `product_capacity` VALUES(2, '100gr', 4);
INSERT INTO `product_capacity` VALUES(3, '500gr', 16);
INSERT INTO `product_capacity` VALUES(4, '1kg', 18);
INSERT INTO `product_capacity` VALUES(5, '250gr', 10);
INSERT INTO `product_capacity` VALUES(6, '200gr', 8);
INSERT INTO `product_capacity` VALUES(7, '500ml', 20);
INSERT INTO `product_capacity` VALUES(8, '300gr', 11);
INSERT INTO `product_capacity` VALUES(9, '600gr', 17);
INSERT INTO `product_capacity` VALUES(10, '1 lít', 21);
INSERT INTO `product_capacity` VALUES(11, '400gr', 13);
INSERT INTO `product_capacity` VALUES(12, '52gr', 2);
INSERT INTO `product_capacity` VALUES(13, '105gr', 5);
INSERT INTO `product_capacity` VALUES(14, '1 cái', 24);
INSERT INTO `product_capacity` VALUES(15, '1 hộp', 23);
INSERT INTO `product_capacity` VALUES(16, '1 túi', 22);
INSERT INTO `product_capacity` VALUES(17, '1.5kg', 19);
INSERT INTO `product_capacity` VALUES(18, '150gr', 7);
INSERT INTO `product_capacity` VALUES(19, '120gr', 6);
INSERT INTO `product_capacity` VALUES(20, '390gr', 12);
INSERT INTO `product_capacity` VALUES(21, '220gr', 9);
INSERT INTO `product_capacity` VALUES(22, '435gr', 14);
INSERT INTO `product_capacity` VALUES(23, '95gr', 3);
INSERT INTO `product_capacity` VALUES(24, '460gr', 15);
INSERT INTO `product_capacity` VALUES(25, 'Hấp lá tía tô', 25);
INSERT INTO `product_capacity` VALUES(26, 'Hấp sả', 26);
INSERT INTO `product_capacity` VALUES(27, 'Hấp lá chanh', 27);
INSERT INTO `product_capacity` VALUES(28, 'Nướng chao', 28);
INSERT INTO `product_capacity` VALUES(29, 'Nướng ngũ vị', 29);
INSERT INTO `product_capacity` VALUES(30, 'Nướng mọi', 30);
INSERT INTO `product_capacity` VALUES(31, 'Nướng sa tế', 31);
INSERT INTO `product_capacity` VALUES(32, 'Xào lăn', 32);
INSERT INTO `product_capacity` VALUES(33, '1 Gói', 33);
INSERT INTO `product_capacity` VALUES(34, 'Nướng mè', 34);

-- --------------------------------------------------------

--
-- Table structure for table `product_cat`
--

CREATE TABLE `product_cat` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `re_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `brief` text,
  `content` longtext,
  `tips` text,
  `tag` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `parent_id` int(11) DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `isnew` tinyint(4) NOT NULL DEFAULT '0',
  `ishot` tinyint(4) NOT NULL DEFAULT '0',
  `isactive` tinyint(2) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_cat`
--

INSERT INTO `product_cat` VALUES(1, 'Miền Bắc', 'mien-bac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 1);
INSERT INTO `product_cat` VALUES(2, 'Miền Trung', 'mien-trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 2);
INSERT INTO `product_cat` VALUES(3, 'Miền Nam', 'mien-nam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 3);
INSERT INTO `product_cat` VALUES(4, 'Nước Ngoài', 'nuoc-ngoai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 5);
INSERT INTO `product_cat` VALUES(5, 'Xuân Hương Food', 'xuan-huong-food', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_datepackage`
--

CREATE TABLE `product_datepackage` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_datepackage`
--

INSERT INTO `product_datepackage` VALUES(1, 'Bánh', 1);
INSERT INTO `product_datepackage` VALUES(2, 'Gia vị', 2);
INSERT INTO `product_datepackage` VALUES(3, 'Thực phẩm đông mát', 3);
INSERT INTO `product_datepackage` VALUES(4, 'Bột', 4);
INSERT INTO `product_datepackage` VALUES(5, 'Thức uống', 5);
INSERT INTO `product_datepackage` VALUES(6, 'Mắm', 6);
INSERT INTO `product_datepackage` VALUES(7, 'Thực phẩm chế biến sẵn', 7);
INSERT INTO `product_datepackage` VALUES(8, 'Kẹo', 8);
INSERT INTO `product_datepackage` VALUES(9, 'Giò chả', 9);
INSERT INTO `product_datepackage` VALUES(10, 'Khô các loại', 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity_id` tinyint(4) DEFAULT '0',
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_im` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `price_discount` int(11) DEFAULT '0',
  `price_npp` int(11) DEFAULT '0',
  `price_daily` int(11) DEFAULT '0',
  `price_ctv` int(11) DEFAULT '0',
  `price_private` int(11) DEFAULT '0',
  `price_sale1` int(11) DEFAULT '0',
  `price_sale2` int(11) DEFAULT '0',
  `brief` text COLLATE utf8mb4_unicode_ci,
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` VALUES(1, 40, 'MT-002-2', 13, NULL, 0, 13000, 0, 0, 13500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi có 35 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 105gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(2, 41, 'MT-003-2', 15, NULL, 0, 21500, 0, 0, 22000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(3, 52, 'MT-014-2', 8, NULL, 0, 47000, 0, 0, 49000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(4, 57, 'MT-019-2', 3, NULL, 0, 37000, 0, 0, 40000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(5, 58, 'MT-020-2', 3, NULL, 0, 87000, 0, 0, 90000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(6, 67, 'MT-029-2', 18, NULL, 0, 14000, 0, 0, 15000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(7, 70, 'MT-032-2', 9, NULL, 0, 75000, 0, 0, 77000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 600gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(8, 71, 'MT-033-2', 5, NULL, 0, 22000, 0, 0, 24000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(9, 71, 'MT-033-3', 8, NULL, 0, 27000, 0, 0, 29000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(10, 18, 'MB-003-2', 22, NULL, 0, 45000, 0, 0, 47000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 435gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(11, 18, 'MB-003-3', 3, NULL, 0, 52000, 0, 0, 55000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(12, 19, 'MB-005-2', 3, NULL, 0, 42000, 0, 0, 45000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 10 gói nhỏ/1 túi.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(13, 25, 'MN-03-2', 2, NULL, 0, 20000, 0, 0, 22000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 100gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(14, 25, 'MN-03-3', 11, NULL, 0, 90000, 0, 0, 92000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng, trứng muối.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(15, 25, 'MN-03-4', 24, NULL, 0, 92000, 0, 0, 95000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 460gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 4, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(16, 25, 'MN-03-5', 3, NULL, 0, 95000, 86000, 0, 97000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 5, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(17, 25, 'MN-03-1', 23, NULL, 0, 18000, 0, 0, 20000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 95gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(18, 77, 'MT-036-2', 3, NULL, 0, 380000, 0, 0, 385000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(19, 77, 'MT-036-1', 2, NULL, 0, 82000, 0, 0, 85000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(20, 78, 'MN-18-1', 2, NULL, 0, 45000, 0, 0, 47000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(21, 78, 'MN-18-2', 3, NULL, 0, 195000, 0, 0, 199000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(22, 18, 'MB-003-1', 21, NULL, 0, 25000, 0, 0, 27000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 220gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(23, 84, 'XH-002-1', 28, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(24, 84, 'XH-002-2', 29, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(25, 84, 'XH-002-3', 30, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(26, 84, 'XH-002-4', 31, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(27, 83, 'XH-001-1', 25, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(28, 83, 'XH-001-2', 26, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(29, 83, 'XH-001-3', 27, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(30, 83, 'XH-001-4', 32, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(31, 85, 'XH-003-1', 28, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(32, 85, 'XH-003-2', 29, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(33, 85, 'XH-003-3', 30, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(34, 85, 'XH-003-4', 31, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(35, 86, 'XH-004-1', 26, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(36, 86, 'XH-004-2', 27, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(37, 86, 'XH-004-3', 32, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(38, 87, 'XH-005-1', 28, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(39, 87, 'XH-005-2', 29, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(40, 87, 'XH-005-3', 30, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(41, 87, 'XH-005-4', 31, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(43, 19, 'MB-005-1', 11, NULL, 0, 37000, 0, 0, 39000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Bịch 400gr gồm 10 gói nhỏ.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(44, 40, 'MT-002-1', 12, NULL, 0, 7000, 0, 0, 7500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi có 20 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 52gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(45, 41, 'MT-003-1', 33, NULL, 0, 6300, 0, 0, 6500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 gói 80gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:&nbsp;</strong>Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(46, 52, 'MT-014-1', 18, NULL, 0, 23000, 0, 0, 25000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(47, 57, 'MT-019-1', 5, NULL, 0, 23000, 0, 0, 25000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(48, 58, 'MT-020-1', 5, NULL, 0, 45000, 0, 0, 48000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(49, 67, 'MT-029-1', 19, NULL, 0, 11000, 0, 0, 12000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 120gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(50, 70, 'MT-032-1', 20, NULL, 0, 55000, 0, 0, 57000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 390gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(51, 71, 'MT-033-1', 6, NULL, 0, 17000, 0, 0, 18000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(52, 84, 'XH-002-5', 34, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(53, 85, 'XH-003-5', 34, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL);
INSERT INTO `product_detail` VALUES(54, 87, 'XH-005-5', 34, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_imexport`
--

CREATE TABLE `product_imexport` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `imexport` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1: Xuất; 1: nhập',
  `province_id` tinyint(4) NOT NULL DEFAULT '1',
  `amount` double NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_imexport`
--

INSERT INTO `product_imexport` VALUES(1, 1, 81, -1, 1, 2, 137000, 1, '2025-02-03 03:00:45', '2025-02-03 03:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_imexport_history`
--

CREATE TABLE `product_imexport_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `imexport_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `imexport` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1: Xuất; 1: nhập',
  `amount` double NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_imexport_history`
--

INSERT INTO `product_imexport_history` VALUES(1, 1, 1, 81, -1, 2, 137000, 1, 'Xuất hàng', '2025-02-03 03:00:45', '2025-02-03 03:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `inv_id` int(11) NOT NULL,
  `invcode` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inv_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sendingaddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` tinytext COLLATE utf8mb4_unicode_ci,
  `totalcost` int(11) DEFAULT NULL,
  `totalamount` double NOT NULL DEFAULT '0',
  `discount` double DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `COD` int(11) NOT NULL DEFAULT '0' COMMENT 'Thu hộ',
  `transportfee_id` tinyint(4) NOT NULL,
  `transportfee` int(11) NOT NULL DEFAULT '0',
  `taxvat` double NOT NULL DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `voucher` int(20) DEFAULT NULL,
  `npp` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `ctv` int(11) DEFAULT NULL,
  `commission_npp` double DEFAULT NULL,
  `commission_daily` double DEFAULT NULL,
  `commission_ctv` double DEFAULT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: Huy; 1:check;2:Thanh toan',
  `ischeck` tinyint(1) NOT NULL DEFAULT '0',
  `isdelivery` tinyint(2) NOT NULL DEFAULT '0',
  `deliverydate` timestamp NULL DEFAULT NULL,
  `ispayment` tinyint(4) NOT NULL DEFAULT '0',
  `paymentdate` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` VALUES(1, 1, 'Q0001', '435b8e5f-a4f9-41a5-a699-229509a0e43d', 'Thắng', 'Thủ Đức', 'Thủ Đức', NULL, NULL, '0945685221', NULL, 0, 274000, NULL, 0, 0, 1, 25000, 27400, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 0, '2025-02-02 17:00:00', 0, NULL, '2025-02-03 02:58:02', '2025-02-03 03:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_orderdetail`
--

CREATE TABLE `product_orderdetail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `stock_id` tinyint(4) NOT NULL DEFAULT '1',
  `product_id` int(11) UNSIGNED NOT NULL,
  `capacity_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `commission_daily` int(11) NOT NULL DEFAULT '0',
  `commission_npp` int(11) NOT NULL DEFAULT '0',
  `commission_ctv` int(11) DEFAULT '0',
  `price_im` int(11) DEFAULT NULL,
  `pro_status` tinyint(4) NOT NULL,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_orderdetail`
--

INSERT INTO `product_orderdetail` VALUES(1, 1, 1, 81, 3, 2, 137000, 0, 0, 0, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_order_history`
--

CREATE TABLE `product_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_order_history`
--

INSERT INTO `product_order_history` VALUES(1, 1, 0, 1, 'Cập nhật đơn hàng ', '2025-02-03 03:00:45', '2025-02-03 03:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_order_return`
--

CREATE TABLE `product_order_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `notes` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ischeck` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_order_status`
--

CREATE TABLE `product_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_order_status`
--

INSERT INTO `product_order_status` VALUES(1, 'Mới', 1);
INSERT INTO `product_order_status` VALUES(2, 'Duyệt', 2);
INSERT INTO `product_order_status` VALUES(3, 'Đang giao', 3);
INSERT INTO `product_order_status` VALUES(4, 'Đã giao', 4);
INSERT INTO `product_order_status` VALUES(5, 'Hủy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_order_unc`
--

CREATE TABLE `product_order_unc` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `inv_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_photo`
--

CREATE TABLE `product_photo` (
  `id` int(10) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_photo`
--

INSERT INTO `product_photo` VALUES(63, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-7.jpg', 1);
INSERT INTO `product_photo` VALUES(64, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-6.jpg', 2);
INSERT INTO `product_photo` VALUES(65, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-5.jpg', 3);
INSERT INTO `product_photo` VALUES(66, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-4.jpg', 4);
INSERT INTO `product_photo` VALUES(67, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-3.jpg', 5);
INSERT INTO `product_photo` VALUES(68, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-2.jpg', 6);
INSERT INTO `product_photo` VALUES(69, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-1.jpg', 7);
INSERT INTO `product_photo` VALUES(94, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-4.jpg', 1);
INSERT INTO `product_photo` VALUES(95, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-3.jpg', 2);
INSERT INTO `product_photo` VALUES(96, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-2.jpg', 3);
INSERT INTO `product_photo` VALUES(97, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-1.jpg', 4);
INSERT INTO `product_photo` VALUES(170, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-6.jpg', 1);
INSERT INTO `product_photo` VALUES(171, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-5.jpg', 2);
INSERT INTO `product_photo` VALUES(172, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-4.jpg', 3);
INSERT INTO `product_photo` VALUES(173, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-3.jpg', 4);
INSERT INTO `product_photo` VALUES(174, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-2.jpg', 5);
INSERT INTO `product_photo` VALUES(175, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-1.jpg', 6);
INSERT INTO `product_photo` VALUES(292, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-4.jpg', 1);
INSERT INTO `product_photo` VALUES(293, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-3.jpg', 2);
INSERT INTO `product_photo` VALUES(294, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-2.jpg', 3);
INSERT INTO `product_photo` VALUES(295, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-1.jpg', 4);
INSERT INTO `product_photo` VALUES(354, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '1.png', 1);
INSERT INTO `product_photo` VALUES(355, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '2.png', 2);
INSERT INTO `product_photo` VALUES(356, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '3.png', 3);
INSERT INTO `product_photo` VALUES(357, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '4.png', 4);
INSERT INTO `product_photo` VALUES(358, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '5.png', 5);
INSERT INTO `product_photo` VALUES(360, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '7.png', 6);
INSERT INTO `product_photo` VALUES(458, 3, 'Bánh quế Hà Nội', '14_1.png', 1);
INSERT INTO `product_photo` VALUES(459, 3, 'Bánh quế Hà Nội', '15_2.png', 2);
INSERT INTO `product_photo` VALUES(460, 3, 'Bánh quế Hà Nội', 'banh-que-ha-noi.png', 3);
INSERT INTO `product_photo` VALUES(461, 1, 'banh-cha-ha-noi', '2_5.png', 1);
INSERT INTO `product_photo` VALUES(462, 1, 'banh-cha-ha-noi', '3_5.png', 2);
INSERT INTO `product_photo` VALUES(463, 1, 'banh-cha-ha-noi', '4_5.png', 3);
INSERT INTO `product_photo` VALUES(464, 1, 'banh-cha-ha-noi', '5_5.png', 4);
INSERT INTO `product_photo` VALUES(465, 1, 'banh-cha-ha-noi', 'banh-cha-ha-noi.png', 5);
INSERT INTO `product_photo` VALUES(466, 2, 'banh-com-ha-noi', '7_5.png', 1);
INSERT INTO `product_photo` VALUES(467, 2, 'banh-com-ha-noi', '8_1.png', 2);
INSERT INTO `product_photo` VALUES(468, 2, 'banh-com-ha-noi', 'banh-com-ha-noi.png', 3);
INSERT INTO `product_photo` VALUES(469, 18, 'banh-dau-xanh-tien-trung-hai-duong', '10_1.png', 1);
INSERT INTO `product_photo` VALUES(470, 18, 'banh-dau-xanh-tien-trung-hai-duong', '11_2.png', 2);
INSERT INTO `product_photo` VALUES(471, 18, 'banh-dau-xanh-tien-trung-hai-duong', '12_1.png', 3);
INSERT INTO `product_photo` VALUES(472, 18, 'banh-dau-xanh-tien-trung-hai-duong', 'banh-dau-xanh-tien-trung-hai-duong.png', 4);
INSERT INTO `product_photo` VALUES(473, 19, 'bot-dau-xanh-nguyen-chat-tien-dung', '3_6.png', 1);
INSERT INTO `product_photo` VALUES(474, 19, 'bot-dau-xanh-nguyen-chat-tien-dung', 'bot-dau-xanh-nguyen-chat-tien-dung.png', 2);
INSERT INTO `product_photo` VALUES(475, 4, 'bot-san-day-kim-son-ninh-binh', '2_6.png', 1);
INSERT INTO `product_photo` VALUES(476, 4, 'bot-san-day-kim-son-ninh-binh', '3_7.png', 2);
INSERT INTO `product_photo` VALUES(477, 4, 'bot-san-day-kim-son-ninh-binh', '4_6.png', 3);
INSERT INTO `product_photo` VALUES(478, 4, 'bot-san-day-kim-son-ninh-binh', 'bot-san-day-kim-son-ninh-binh.png', 4);
INSERT INTO `product_photo` VALUES(479, 74, 'bot-dau-den-nguyen-chat-tien-dung', 'bot-dau-den-nguyen-chat-tien-dung.png', 1);
INSERT INTO `product_photo` VALUES(480, 6, 'Chả mực Hạ Long', '11_3.png', 1);
INSERT INTO `product_photo` VALUES(481, 6, 'Chả mực Hạ Long', '12_2.png', 2);
INSERT INTO `product_photo` VALUES(482, 6, 'Chả mực Hạ Long', '13_2.png', 3);
INSERT INTO `product_photo` VALUES(483, 6, 'Chả mực Hạ Long', '14_2.png', 4);
INSERT INTO `product_photo` VALUES(484, 6, 'Chả mực Hạ Long', '15_3.png', 5);
INSERT INTO `product_photo` VALUES(485, 6, 'Chả mực Hạ Long', 'cha-muc-ha-long.png', 6);
INSERT INTO `product_photo` VALUES(486, 7, 'cha-que-nuong-nam-dinh', '17_2.png', 1);
INSERT INTO `product_photo` VALUES(487, 7, 'cha-que-nuong-nam-dinh', '18_2.png', 2);
INSERT INTO `product_photo` VALUES(488, 7, 'cha-que-nuong-nam-dinh', 'cha-que-nuong-nam-dinh.png', 3);
INSERT INTO `product_photo` VALUES(489, 8, 'cha-ruoi-ha-noi', '21_2.png', 1);
INSERT INTO `product_photo` VALUES(490, 8, 'cha-ruoi-ha-noi', '22_2.png', 2);
INSERT INTO `product_photo` VALUES(491, 8, 'cha-ruoi-ha-noi', 'cha-ruoi-ha-noi.png', 3);
INSERT INTO `product_photo` VALUES(492, 10, 'gio-lua-nam-dinh', '23_2.png', 1);
INSERT INTO `product_photo` VALUES(493, 10, 'gio-lua-nam-dinh', '25_1.png', 2);
INSERT INTO `product_photo` VALUES(494, 10, 'gio-lua-nam-dinh', 'gio-lua-nam-dinh.png', 3);
INSERT INTO `product_photo` VALUES(495, 11, 'Giò xào Nam Định', '26_1.png', 1);
INSERT INTO `product_photo` VALUES(496, 11, 'Giò xào Nam Định', '28_1.png', 2);
INSERT INTO `product_photo` VALUES(497, 11, 'Giò xào Nam Định', '29_1.png', 3);
INSERT INTO `product_photo` VALUES(498, 11, 'Giò xào Nam Định', 'gio-xao-nam-dinh.png', 4);
INSERT INTO `product_photo` VALUES(499, 13, 'mam-ruoi-ninh-binh', '35.png', 1);
INSERT INTO `product_photo` VALUES(500, 13, 'mam-ruoi-ninh-binh', '36_1.png', 2);
INSERT INTO `product_photo` VALUES(501, 13, 'mam-ruoi-ninh-binh', 'mam-ruoi-ninh-binh.png', 3);
INSERT INTO `product_photo` VALUES(502, 14, 'Mắm tép Kim Sơn Ninh Bình', '6_4.png', 1);
INSERT INTO `product_photo` VALUES(503, 14, 'Mắm tép Kim Sơn Ninh Bình', '7_6.png', 2);
INSERT INTO `product_photo` VALUES(504, 14, 'Mắm tép Kim Sơn Ninh Bình', '8_2.png', 3);
INSERT INTO `product_photo` VALUES(505, 14, 'Mắm tép Kim Sơn Ninh Bình', 'mam-tep-kim-son-ninh-binh.png', 4);
INSERT INTO `product_photo` VALUES(506, 15, 'Mắm Tôm Kim Hải Ninh Bình', '9_2.png', 1);
INSERT INTO `product_photo` VALUES(507, 15, 'Mắm Tôm Kim Hải Ninh Bình', '11_4.png', 2);
INSERT INTO `product_photo` VALUES(508, 15, 'Mắm Tôm Kim Hải Ninh Bình', 'mam-tom-kim-hai-ninh-binh.png', 3);
INSERT INTO `product_photo` VALUES(509, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '31_1.png', 1);
INSERT INTO `product_photo` VALUES(510, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '32_1.png', 2);
INSERT INTO `product_photo` VALUES(511, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '33.png', 3);
INSERT INTO `product_photo` VALUES(512, 12, 'Mắm Cáy Kim Sơn Ninh Bình', 'mam-cay-kim-son-ninh-binh.png', 4);
INSERT INTO `product_photo` VALUES(513, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '17_3.png', 1);
INSERT INTO `product_photo` VALUES(514, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '18_3.png', 2);
INSERT INTO `product_photo` VALUES(515, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '19_2.png', 3);
INSERT INTO `product_photo` VALUES(516, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '13_3.png', 4);
INSERT INTO `product_photo` VALUES(517, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '14_3.png', 5);
INSERT INTO `product_photo` VALUES(518, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '15_4.png', 6);
INSERT INTO `product_photo` VALUES(519, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '16_2.png', 7);
INSERT INTO `product_photo` VALUES(520, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', 'ruou-de-nep-kim-son-ninh-binh.png', 8);
INSERT INTO `product_photo` VALUES(521, 17, 'Rươi tươi Thái Bình', '21_3.png', 1);
INSERT INTO `product_photo` VALUES(522, 17, 'Rươi tươi Thái Bình', '22_3.png', 2);
INSERT INTO `product_photo` VALUES(523, 17, 'Rươi tươi Thái Bình', '23_3.png', 3);
INSERT INTO `product_photo` VALUES(524, 17, 'Rươi tươi Thái Bình', '24.png', 4);
INSERT INTO `product_photo` VALUES(525, 17, 'Rươi tươi Thái Bình', 'ruoi-tuoi.png', 5);
INSERT INTO `product_photo` VALUES(526, 20, 'Mọc heo', '25_2.png', 1);
INSERT INTO `product_photo` VALUES(527, 20, 'Mọc heo', '26_2.png', 2);
INSERT INTO `product_photo` VALUES(528, 20, 'Mọc heo', '27_1.png', 3);
INSERT INTO `product_photo` VALUES(529, 20, 'Mọc heo', 'moc-heo.png', 4);
INSERT INTO `product_photo` VALUES(530, 22, 'Bò viên gân Hà Nội', '33_1.png', 1);
INSERT INTO `product_photo` VALUES(531, 22, 'Bò viên gân Hà Nội', '35_1.png', 2);
INSERT INTO `product_photo` VALUES(532, 22, 'Bò viên gân Hà Nội', '36_2.png', 3);
INSERT INTO `product_photo` VALUES(533, 22, 'Bò viên gân Hà Nội', '37_1.png', 4);
INSERT INTO `product_photo` VALUES(534, 22, 'Bò viên gân Hà Nội', 'bo-vien-gan.png', 5);
INSERT INTO `product_photo` VALUES(535, 9, 'Dồi sụn Hà Nội', '29_2.png', 1);
INSERT INTO `product_photo` VALUES(536, 9, 'Dồi sụn Hà Nội', '30_1.png', 2);
INSERT INTO `product_photo` VALUES(537, 9, 'Dồi sụn Hà Nội', '31_2.png', 3);
INSERT INTO `product_photo` VALUES(538, 9, 'Dồi sụn Hà Nội', '32_2.png', 4);
INSERT INTO `product_photo` VALUES(539, 9, 'Dồi sụn Hà Nội', '38_1.png', 5);
INSERT INTO `product_photo` VALUES(540, 9, 'Dồi sụn Hà Nội', '39_1.png', 6);
INSERT INTO `product_photo` VALUES(541, 9, 'Dồi sụn Hà Nội', '40_1.png', 7);
INSERT INTO `product_photo` VALUES(542, 9, 'Dồi sụn Hà Nội', '41_1.png', 8);
INSERT INTO `product_photo` VALUES(543, 9, 'Dồi sụn Hà Nội', '42.png', 9);
INSERT INTO `product_photo` VALUES(544, 9, 'Dồi sụn Hà Nội', '43.png', 10);
INSERT INTO `product_photo` VALUES(545, 39, 'Bánh chưng Bình Định', '1_4.png', 1);
INSERT INTO `product_photo` VALUES(546, 39, 'Bánh chưng Bình Định', 'mt-001-banh-chung-binh-dinh.png', 2);
INSERT INTO `product_photo` VALUES(547, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '56.png', 1);
INSERT INTO `product_photo` VALUES(548, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '57.png', 2);
INSERT INTO `product_photo` VALUES(549, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '58.png', 3);
INSERT INTO `product_photo` VALUES(550, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '59.png', 4);
INSERT INTO `product_photo` VALUES(551, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '60.png', 5);
INSERT INTO `product_photo` VALUES(552, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', 'mt-03-keo-guong-kim-ngoc-quang-ngai.png', 6);
INSERT INTO `product_photo` VALUES(553, 42, 'Bánh ít lá gai Bình Định', '11_5.png', 1);
INSERT INTO `product_photo` VALUES(554, 42, 'Bánh ít lá gai Bình Định', '12_3.png', 2);
INSERT INTO `product_photo` VALUES(555, 42, 'Bánh ít lá gai Bình Định', '13_4.png', 3);
INSERT INTO `product_photo` VALUES(556, 42, 'Bánh ít lá gai Bình Định', '14_4.png', 4);
INSERT INTO `product_photo` VALUES(557, 42, 'Bánh ít lá gai Bình Định', '15_5.png', 5);
INSERT INTO `product_photo` VALUES(558, 42, 'Bánh ít lá gai Bình Định', 'mt-004-banh-it-la-gai-binh-dinh.png', 6);
INSERT INTO `product_photo` VALUES(559, 43, 'Bánh ít nhân mặn Bình Định', '17_4.png', 1);
INSERT INTO `product_photo` VALUES(560, 43, 'Bánh ít nhân mặn Bình Định', '18_4.png', 2);
INSERT INTO `product_photo` VALUES(561, 43, 'Bánh ít nhân mặn Bình Định', '19_3.png', 3);
INSERT INTO `product_photo` VALUES(562, 43, 'Bánh ít nhân mặn Bình Định', '20_1.png', 4);
INSERT INTO `product_photo` VALUES(563, 43, 'Bánh ít nhân mặn Bình Định', 'mt-005-banh-it-nhan-man-binh-dinh.png', 5);
INSERT INTO `product_photo` VALUES(564, 44, 'Bánh su sê Bình Định', '21_4.png', 1);
INSERT INTO `product_photo` VALUES(565, 44, 'Bánh su sê Bình Định', '23_4.png', 2);
INSERT INTO `product_photo` VALUES(566, 44, 'Bánh su sê Bình Định', '24_1.png', 3);
INSERT INTO `product_photo` VALUES(567, 44, 'Bánh su sê Bình Định', 'mt-006-banh-su-se-binh-dinh.png', 4);
INSERT INTO `product_photo` VALUES(568, 45, 'Bánh tét Bình Định', '25_3.png', 1);
INSERT INTO `product_photo` VALUES(569, 45, 'Bánh tét Bình Định', '27_2.png', 2);
INSERT INTO `product_photo` VALUES(570, 45, 'Bánh tét Bình Định', '28_2.png', 3);
INSERT INTO `product_photo` VALUES(571, 45, 'Bánh tét Bình Định', 'mt-007-banh-tet-binh-dinh.png', 4);
INSERT INTO `product_photo` VALUES(572, 46, 'Chả cá Nha Trang', '29_3.png', 1);
INSERT INTO `product_photo` VALUES(573, 46, 'Chả cá Nha Trang', '30_2.png', 2);
INSERT INTO `product_photo` VALUES(574, 46, 'Chả cá Nha Trang', '31_3.png', 3);
INSERT INTO `product_photo` VALUES(575, 46, 'Chả cá Nha Trang', '32_3.png', 4);
INSERT INTO `product_photo` VALUES(576, 46, 'Chả cá Nha Trang', '34_1.png', 5);
INSERT INTO `product_photo` VALUES(577, 46, 'Chả cá Nha Trang', '35_2.png', 6);
INSERT INTO `product_photo` VALUES(578, 47, 'Chả ram tôm đất Bình Định', '37_2.png', 1);
INSERT INTO `product_photo` VALUES(579, 47, 'Chả ram tôm đất Bình Định', '38_2.png', 2);
INSERT INTO `product_photo` VALUES(580, 47, 'Chả ram tôm đất Bình Định', '39_2.png', 3);
INSERT INTO `product_photo` VALUES(581, 47, 'Chả ram tôm đất Bình Định', '40_2.png', 4);
INSERT INTO `product_photo` VALUES(582, 47, 'Chả ram tôm đất Bình Định', '41_2.png', 5);
INSERT INTO `product_photo` VALUES(583, 47, 'Chả ram tôm đất Bình Định', 'mt-009-cha-ram-tom-dat-binh-dinh.png', 6);
INSERT INTO `product_photo` VALUES(584, 48, 'Cua xay lagi Bình Thuận', '44.png', 1);
INSERT INTO `product_photo` VALUES(585, 48, 'Cua xay lagi Bình Thuận', '45.png', 2);
INSERT INTO `product_photo` VALUES(586, 48, 'Cua xay lagi Bình Thuận', '47.png', 3);
INSERT INTO `product_photo` VALUES(587, 48, 'Cua xay lagi Bình Thuận', '48.png', 4);
INSERT INTO `product_photo` VALUES(588, 48, 'Cua xay lagi Bình Thuận', 'mt-010-cua-xay-lagi-binh-thuan.png', 5);
INSERT INTO `product_photo` VALUES(589, 48, 'Cua xay lagi Bình Thuận', '42_1.png', 6);
INSERT INTO `product_photo` VALUES(590, 48, 'Cua xay lagi Bình Thuận', '43_1.png', 7);
INSERT INTO `product_photo` VALUES(591, 49, 'Đường phèn vàng Quảng Ngãi', '50.png', 1);
INSERT INTO `product_photo` VALUES(592, 49, 'Đường phèn vàng Quảng Ngãi', '51.png', 2);
INSERT INTO `product_photo` VALUES(593, 49, 'Đường phèn vàng Quảng Ngãi', '52.png', 3);
INSERT INTO `product_photo` VALUES(594, 49, 'Đường phèn vàng Quảng Ngãi', '53.png', 4);
INSERT INTO `product_photo` VALUES(595, 49, 'Đường phèn vàng Quảng Ngãi', '54.png', 5);
INSERT INTO `product_photo` VALUES(596, 49, 'Đường phèn vàng Quảng Ngãi', 'mt-011-duong-phen-quang-ngai.png', 6);
INSERT INTO `product_photo` VALUES(597, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '62.png', 1);
INSERT INTO `product_photo` VALUES(598, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '63.png', 2);
INSERT INTO `product_photo` VALUES(599, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '64.png', 3);
INSERT INTO `product_photo` VALUES(600, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', 'mt-012-lac-rang-toi-ot-luong-son.png', 4);
INSERT INTO `product_photo` VALUES(601, 51, 'Bánh dừa nướng Quảng Nam', '2_7.png', 1);
INSERT INTO `product_photo` VALUES(602, 51, 'Bánh dừa nướng Quảng Nam', '3_8.png', 2);
INSERT INTO `product_photo` VALUES(603, 51, 'Bánh dừa nướng Quảng Nam', '4_7.png', 3);
INSERT INTO `product_photo` VALUES(604, 51, 'Bánh dừa nướng Quảng Nam', '6_5.png', 4);
INSERT INTO `product_photo` VALUES(605, 51, 'Bánh dừa nướng Quảng Nam', '7_7.png', 5);
INSERT INTO `product_photo` VALUES(606, 51, 'Bánh dừa nướng Quảng Nam', 'mt-014-banh-dua-nuong-quang-nam.png', 6);
INSERT INTO `product_photo` VALUES(610, 53, 'Mắm cá cơm Dì Cẩn', '19_4.png', 4);
INSERT INTO `product_photo` VALUES(612, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '8_3.png', 1);
INSERT INTO `product_photo` VALUES(613, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '10_2.png', 2);
INSERT INTO `product_photo` VALUES(614, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '11_6.png', 3);
INSERT INTO `product_photo` VALUES(615, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '12_4.png', 4);
INSERT INTO `product_photo` VALUES(616, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '13_5.png', 5);
INSERT INTO `product_photo` VALUES(617, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '14_5.png', 6);
INSERT INTO `product_photo` VALUES(618, 54, 'Mắm cá giò Dì Cẩn', '23_5.png', 1);
INSERT INTO `product_photo` VALUES(619, 54, 'Mắm cá giò Dì Cẩn', '25_4.png', 2);
INSERT INTO `product_photo` VALUES(620, 54, 'Mắm cá giò Dì Cẩn', '26_3.png', 3);
INSERT INTO `product_photo` VALUES(621, 54, 'Mắm cá giò Dì Cẩn', 'mt-016-mam-ca-gio-di-can-2.png', 4);
INSERT INTO `product_photo` VALUES(622, 53, 'Mắm cá cơm Dì Cẩn', '15_6.png', 5);
INSERT INTO `product_photo` VALUES(623, 53, 'Mắm cá cơm Dì Cẩn', '16_3.png', 6);
INSERT INTO `product_photo` VALUES(624, 53, 'Mắm cá cơm Dì Cẩn', '17_5.png', 7);
INSERT INTO `product_photo` VALUES(625, 55, 'Mắm dưa Dì Cẩn', '28_3.png', 1);
INSERT INTO `product_photo` VALUES(626, 55, 'Mắm dưa Dì Cẩn', '29_4.png', 2);
INSERT INTO `product_photo` VALUES(627, 56, 'Mắm mực Đà Nẵng', '35_3.png', 1);
INSERT INTO `product_photo` VALUES(628, 56, 'Mắm mực Đà Nẵng', '31_4.png', 2);
INSERT INTO `product_photo` VALUES(629, 56, 'Mắm mực Đà Nẵng', '32_4.png', 3);
INSERT INTO `product_photo` VALUES(630, 56, 'Mắm mực Đà Nẵng', '33_2.png', 4);
INSERT INTO `product_photo` VALUES(631, 56, 'Mắm mực Đà Nẵng', '34_2.png', 5);
INSERT INTO `product_photo` VALUES(632, 56, 'Mắm mực Đà Nẵng', 'mt-018-mam-muc-da-nang.png', 6);
INSERT INTO `product_photo` VALUES(633, 57, 'Mắm nêm Dì Cẩn', '36_3.png', 1);
INSERT INTO `product_photo` VALUES(634, 57, 'Mắm nêm Dì Cẩn', '37_3.png', 2);
INSERT INTO `product_photo` VALUES(635, 57, 'Mắm nêm Dì Cẩn', '38_3.png', 3);
INSERT INTO `product_photo` VALUES(636, 57, 'Mắm nêm Dì Cẩn', '39_3.png', 4);
INSERT INTO `product_photo` VALUES(637, 57, 'Mắm nêm Dì Cẩn', 'mt-019-mam-nem-di-can.png', 5);
INSERT INTO `product_photo` VALUES(638, 58, 'Mắm ruốc Dì Cẩn', '41_3.png', 1);
INSERT INTO `product_photo` VALUES(639, 58, 'Mắm ruốc Dì Cẩn', '42_2.png', 2);
INSERT INTO `product_photo` VALUES(640, 58, 'Mắm ruốc Dì Cẩn', '43_2.png', 3);
INSERT INTO `product_photo` VALUES(641, 58, 'Mắm ruốc Dì Cẩn', '45_1.png', 4);
INSERT INTO `product_photo` VALUES(642, 58, 'Mắm ruốc Dì Cẩn', '46.png', 5);
INSERT INTO `product_photo` VALUES(643, 58, 'Mắm ruốc Dì Cẩn', '47_1.png', 6);
INSERT INTO `product_photo` VALUES(644, 58, 'Mắm ruốc Dì Cẩn', 'mt-020-mam-ruoc-di-can.png', 7);
INSERT INTO `product_photo` VALUES(645, 59, 'Mắm tôm chua Dì Cẩn', '52_1.png', 1);
INSERT INTO `product_photo` VALUES(646, 59, 'Mắm tôm chua Dì Cẩn', '53_1.png', 2);
INSERT INTO `product_photo` VALUES(647, 59, 'Mắm tôm chua Dì Cẩn', '50_1.png', 3);
INSERT INTO `product_photo` VALUES(648, 59, 'Mắm tôm chua Dì Cẩn', '51_1.png', 4);
INSERT INTO `product_photo` VALUES(649, 59, 'Mắm tôm chua Dì Cẩn', 'mt-021-mam-tom-chu-di-can.png', 5);
INSERT INTO `product_photo` VALUES(650, 60, 'Tép khô (ruốc khô) Nha Trang', '55.png', 1);
INSERT INTO `product_photo` VALUES(651, 60, 'Tép khô (ruốc khô) Nha Trang', '56_1.png', 2);
INSERT INTO `product_photo` VALUES(652, 60, 'Tép khô (ruốc khô) Nha Trang', 'mt-022-tep-kho-ruoc-kho-nha-trang.png', 3);
INSERT INTO `product_photo` VALUES(653, 62, 'Mực rim me Phan Thiết', '6_6.png', 1);
INSERT INTO `product_photo` VALUES(654, 62, 'Mực rim me Phan Thiết', '7_8.png', 2);
INSERT INTO `product_photo` VALUES(655, 62, 'Mực rim me Phan Thiết', '8_4.png', 3);
INSERT INTO `product_photo` VALUES(656, 62, 'Mực rim me Phan Thiết', '9_3.png', 4);
INSERT INTO `product_photo` VALUES(657, 62, 'Mực rim me Phan Thiết', '10_3.png', 5);
INSERT INTO `product_photo` VALUES(658, 62, 'Mực rim me Phan Thiết', '11_7.png', 6);
INSERT INTO `product_photo` VALUES(659, 62, 'Mực rim me Phan Thiết', 'mt-024-muc-rim-me-phan-thiet.png', 7);
INSERT INTO `product_photo` VALUES(660, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '12_5.png', 1);
INSERT INTO `product_photo` VALUES(661, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '13_6.png', 2);
INSERT INTO `product_photo` VALUES(662, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '15_7.png', 3);
INSERT INTO `product_photo` VALUES(663, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', 'mt-025-gio-be-truyen-thong-nam-dan-nghe-an.png', 4);
INSERT INTO `product_photo` VALUES(664, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '17_6.png', 1);
INSERT INTO `product_photo` VALUES(665, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '18_5.png', 2);
INSERT INTO `product_photo` VALUES(666, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '19_5.png', 3);
INSERT INTO `product_photo` VALUES(667, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', 'mt-026-duong-tho-mat-mia-nghia-dan-nghe-an.png', 4);
INSERT INTO `product_photo` VALUES(668, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '20_2.png', 1);
INSERT INTO `product_photo` VALUES(669, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '21_5.png', 2);
INSERT INTO `product_photo` VALUES(670, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '23_6.png', 3);
INSERT INTO `product_photo` VALUES(671, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', 'mt-027-mat-mia-nguyen-chat-nghia-dan-nghe-an.png', 4);
INSERT INTO `product_photo` VALUES(672, 66, 'Mứt sen Liên - Đặc sản Huế', '24_2.png', 1);
INSERT INTO `product_photo` VALUES(673, 66, 'Mứt sen Liên - Đặc sản Huế', '25_5.png', 2);
INSERT INTO `product_photo` VALUES(674, 66, 'Mứt sen Liên - Đặc sản Huế', '26_4.png', 3);
INSERT INTO `product_photo` VALUES(675, 66, 'Mứt sen Liên - Đặc sản Huế', '27_3.png', 4);
INSERT INTO `product_photo` VALUES(676, 66, 'Mứt sen Liên - Đặc sản Huế', 'mt-028-mut-sen-lien-dac-san-hue.png', 5);
INSERT INTO `product_photo` VALUES(677, 67, 'Kẹo đậu phộng Hoàng Bách Huế', '32_5.png', 1);
INSERT INTO `product_photo` VALUES(678, 67, 'Kẹo đậu phộng Hoàng Bách Huế', 'mt-029-keo-dau-phong-hoang-bach-hue.png', 2);
INSERT INTO `product_photo` VALUES(679, 68, 'Mè xửng loại thượng hạng Hoàng Bách - Huế', 'mt-030-me-xung-loai-thuong-hang-hoang-bach-hue.png', 1);
INSERT INTO `product_photo` VALUES(680, 69, 'Mạch nha nếp Quảng Ngãi', '34_3.png', 1);
INSERT INTO `product_photo` VALUES(681, 69, 'Mạch nha nếp Quảng Ngãi', '36_4.png', 2);
INSERT INTO `product_photo` VALUES(682, 69, 'Mạch nha nếp Quảng Ngãi', 'mt-031-mach-nha-nep-quang-ngai.png', 3);
INSERT INTO `product_photo` VALUES(683, 70, 'Kẹo cu đơ Hà Tĩnh', '38_4.png', 1);
INSERT INTO `product_photo` VALUES(684, 70, 'Kẹo cu đơ Hà Tĩnh', '39_4.png', 2);
INSERT INTO `product_photo` VALUES(685, 71, 'Mè xửng Hoàng Bách - Huế', '40_3.png', 1);
INSERT INTO `product_photo` VALUES(686, 71, 'Mè xửng Hoàng Bách - Huế', '42_3.png', 2);
INSERT INTO `product_photo` VALUES(687, 71, 'Mè xửng Hoàng Bách - Huế', '43_3.png', 3);
INSERT INTO `product_photo` VALUES(688, 71, 'Mè xửng Hoàng Bách - Huế', '44_1.png', 4);
INSERT INTO `product_photo` VALUES(689, 71, 'Mè xửng Hoàng Bách - Huế', '45_2.png', 5);
INSERT INTO `product_photo` VALUES(690, 72, 'Giò bò loại đặc biệt Đà Nẵng', '48_1.png', 1);
INSERT INTO `product_photo` VALUES(691, 72, 'Giò bò loại đặc biệt Đà Nẵng', '49.png', 2);
INSERT INTO `product_photo` VALUES(692, 72, 'Giò bò loại đặc biệt Đà Nẵng', '50_2.png', 3);
INSERT INTO `product_photo` VALUES(693, 72, 'Giò bò loại đặc biệt Đà Nẵng', '51_2.png', 4);
INSERT INTO `product_photo` VALUES(694, 72, 'Giò bò loại đặc biệt Đà Nẵng', '52_2.png', 5);
INSERT INTO `product_photo` VALUES(695, 72, 'Giò bò loại đặc biệt Đà Nẵng', '47_2.png', 6);
INSERT INTO `product_photo` VALUES(696, 72, 'Giò bò loại đặc biệt Đà Nẵng', 'mt-034-gio-bo-loai-dac-biet-da-nang.png', 7);
INSERT INTO `product_photo` VALUES(697, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '53_2.png', 1);
INSERT INTO `product_photo` VALUES(698, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '55_1.png', 2);
INSERT INTO `product_photo` VALUES(699, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '56_2.png', 3);
INSERT INTO `product_photo` VALUES(700, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', 'mt-035-mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh.png', 4);
INSERT INTO `product_photo` VALUES(701, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '1_1.png', 1);
INSERT INTO `product_photo` VALUES(702, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '2_1.png', 2);
INSERT INTO `product_photo` VALUES(703, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '3_1.png', 3);
INSERT INTO `product_photo` VALUES(704, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '4_1.png', 4);
INSERT INTO `product_photo` VALUES(705, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '5_1.png', 5);
INSERT INTO `product_photo` VALUES(706, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '6.png', 6);
INSERT INTO `product_photo` VALUES(707, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', 'mt-036-rong-mut-nau-canh-rong-bien-kho-nha-trang.png', 7);
INSERT INTO `product_photo` VALUES(719, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '16_4.png', 1);
INSERT INTO `product_photo` VALUES(720, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '17_7.png', 2);
INSERT INTO `product_photo` VALUES(721, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '18_6.png', 3);
INSERT INTO `product_photo` VALUES(722, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '19_6.png', 4);
INSERT INTO `product_photo` VALUES(723, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '20_3.png', 5);
INSERT INTO `product_photo` VALUES(724, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '21_6.png', 6);
INSERT INTO `product_photo` VALUES(725, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', 'mn-01-kho-chi-vang-loai-1-vung-tau.png', 7);
INSERT INTO `product_photo` VALUES(726, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '24_3.png', 1);
INSERT INTO `product_photo` VALUES(727, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '25_6.png', 2);
INSERT INTO `product_photo` VALUES(728, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '22_4.png', 3);
INSERT INTO `product_photo` VALUES(729, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', 'mn-02-banh-phong-sua-tuyet-phung-ben-tre.png', 4);
INSERT INTO `product_photo` VALUES(730, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '27_4.png', 1);
INSERT INTO `product_photo` VALUES(731, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '28_4.png', 2);
INSERT INTO `product_photo` VALUES(732, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '29_5.png', 3);
INSERT INTO `product_photo` VALUES(733, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '30_3.png', 4);
INSERT INTO `product_photo` VALUES(734, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '31_5.png', 5);
INSERT INTO `product_photo` VALUES(735, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', 'mn-03-banh-pia-my-ngoc-soc-trang.png', 6);
INSERT INTO `product_photo` VALUES(736, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '32_6.png', 1);
INSERT INTO `product_photo` VALUES(737, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '33_3.png', 2);
INSERT INTO `product_photo` VALUES(738, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '35_4.png', 3);
INSERT INTO `product_photo` VALUES(739, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', 'mn-04-kho-ca-sac-loai-lon-dac-san-ca-mau.png', 4);
INSERT INTO `product_photo` VALUES(740, 27, 'Khô cá Lóc 3 nắng Trà Vinh', '38_5.png', 1);
INSERT INTO `product_photo` VALUES(741, 27, 'Khô cá Lóc 3 nắng Trà Vinh', '39_5.png', 2);
INSERT INTO `product_photo` VALUES(742, 28, 'Khô cá Lóc 2 nắng Trà Vinh', '40_4.png', 1);
INSERT INTO `product_photo` VALUES(743, 28, 'Khô cá Lóc 2 nắng Trà Vinh', '42_4.png', 2);
INSERT INTO `product_photo` VALUES(744, 28, 'Khô cá Lóc 2 nắng Trà Vinh', 'mn-06-kho-ca-loc-2-nang-tra-vinh.png', 3);
INSERT INTO `product_photo` VALUES(745, 29, 'Khô cá đù loại lớn', '42_5.png', 1);
INSERT INTO `product_photo` VALUES(746, 29, 'Khô cá đù loại lớn', '43_4.png', 2);
INSERT INTO `product_photo` VALUES(747, 29, 'Khô cá đù loại lớn', '44_2.png', 3);
INSERT INTO `product_photo` VALUES(748, 29, 'Khô cá đù loại lớn', '45_3.png', 4);
INSERT INTO `product_photo` VALUES(749, 29, 'Khô cá đù loại lớn', '46_1.png', 5);
INSERT INTO `product_photo` VALUES(750, 29, 'Khô cá đù loại lớn', '47_3.png', 6);
INSERT INTO `product_photo` VALUES(751, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '50_3.png', 1);
INSERT INTO `product_photo` VALUES(752, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '51_3.png', 2);
INSERT INTO `product_photo` VALUES(753, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '52_3.png', 3);
INSERT INTO `product_photo` VALUES(754, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '53_3.png', 4);
INSERT INTO `product_photo` VALUES(755, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '54_1.png', 5);
INSERT INTO `product_photo` VALUES(756, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', 'mn-08-kho-ca-dua-chuan-2-soc-1-nang-vung-tau.png', 6);
INSERT INTO `product_photo` VALUES(757, 34, 'Khô cá kèo loại lớn Cà Mau', '65.png', 1);
INSERT INTO `product_photo` VALUES(758, 34, 'Khô cá kèo loại lớn Cà Mau', '67.png', 2);
INSERT INTO `product_photo` VALUES(759, 34, 'Khô cá kèo loại lớn Cà Mau', '68.png', 3);
INSERT INTO `product_photo` VALUES(760, 34, 'Khô cá kèo loại lớn Cà Mau', '69.png', 4);
INSERT INTO `product_photo` VALUES(761, 34, 'Khô cá kèo loại lớn Cà Mau', 'mn-09-kho-ca-keo-loai-lon-ca-mau.png', 5);
INSERT INTO `product_photo` VALUES(762, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', '59_1.png', 1);
INSERT INTO `product_photo` VALUES(763, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', '60_1.png', 2);
INSERT INTO `product_photo` VALUES(764, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', 'mn-10-keo-dua-thap-cam-tuyet-phung-ben-tre.png', 3);
INSERT INTO `product_photo` VALUES(765, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', '62_1.png', 1);
INSERT INTO `product_photo` VALUES(766, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', '64_1.png', 2);
INSERT INTO `product_photo` VALUES(767, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', 'mn-11-keo-chuoi-vi-gung-tuyet-phung-ben-tre.png', 3);
INSERT INTO `product_photo` VALUES(768, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '57_1.png', 1);
INSERT INTO `product_photo` VALUES(769, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '58_1.png', 2);
INSERT INTO `product_photo` VALUES(770, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '56_3.png', 3);
INSERT INTO `product_photo` VALUES(771, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', 'mn-012-keo-dua-tuyet-phung-ben-tre.png', 4);
INSERT INTO `product_photo` VALUES(772, 35, 'Kẹo chuối loại đặc biệt Tuyết Phụng - Bến Tre', 'mn-013-keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre.png', 1);
INSERT INTO `product_photo` VALUES(773, 36, 'Nước màu đường thốt nốt An Giang', '72.png', 1);
INSERT INTO `product_photo` VALUES(774, 36, 'Nước màu đường thốt nốt An Giang', '73.png', 2);
INSERT INTO `product_photo` VALUES(775, 36, 'Nước màu đường thốt nốt An Giang', 'mn-014-nuoc-mau-duong-thot-not-an-giang.png', 3);
INSERT INTO `product_photo` VALUES(776, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '75.png', 1);
INSERT INTO `product_photo` VALUES(777, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '76.png', 2);
INSERT INTO `product_photo` VALUES(778, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '77.png', 3);
INSERT INTO `product_photo` VALUES(779, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '78.png', 4);
INSERT INTO `product_photo` VALUES(780, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', 'mn-015-dduong-thot-not-vien-loai-dac-biet-an-giang.png', 5);
INSERT INTO `product_photo` VALUES(781, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '79.png', 1);
INSERT INTO `product_photo` VALUES(782, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '80.png', 2);
INSERT INTO `product_photo` VALUES(783, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '81.png', 3);
INSERT INTO `product_photo` VALUES(784, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '82.png', 4);
INSERT INTO `product_photo` VALUES(785, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '83.png', 5);
INSERT INTO `product_photo` VALUES(786, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '85.png', 6);
INSERT INTO `product_photo` VALUES(787, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', 'mn-015-duong-thot-not-hu-loai-dac-biet-an-giang.png', 7);
INSERT INTO `product_photo` VALUES(788, 75, 'Bánh pía chay Mỹ Ngọc - Sóc Trăng', 'mn-17-banh-pia-chay-my-ngoc-soc-trang.png', 1);
INSERT INTO `product_photo` VALUES(810, 78, 'Bánh thuyền Mix hạt', '2_2.png', 1);
INSERT INTO `product_photo` VALUES(811, 78, 'Bánh thuyền Mix hạt', '3_2.png', 2);
INSERT INTO `product_photo` VALUES(812, 78, 'Bánh thuyền Mix hạt', '4_2.png', 3);
INSERT INTO `product_photo` VALUES(813, 78, 'Bánh thuyền Mix hạt', '5_2.png', 4);
INSERT INTO `product_photo` VALUES(814, 78, 'Bánh thuyền Mix hạt', '6_1.png', 5);
INSERT INTO `product_photo` VALUES(815, 78, 'Bánh thuyền Mix hạt', '7_1.png', 6);
INSERT INTO `product_photo` VALUES(816, 78, 'Bánh thuyền Mix hạt', '1_2.png', 7);
INSERT INTO `product_photo` VALUES(828, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia.png', 1);
INSERT INTO `product_photo` VALUES(829, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-2.png', 2);
INSERT INTO `product_photo` VALUES(830, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-3.png', 3);
INSERT INTO `product_photo` VALUES(831, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-4.png', 4);
INSERT INTO `product_photo` VALUES(832, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia.png', 1);
INSERT INTO `product_photo` VALUES(833, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia2.png', 2);
INSERT INTO `product_photo` VALUES(834, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia3.png', 3);
INSERT INTO `product_photo` VALUES(835, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia4.png', 4);
INSERT INTO `product_photo` VALUES(836, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia5.png', 5);
INSERT INTO `product_photo` VALUES(837, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia6.png', 6);
INSERT INTO `product_photo` VALUES(838, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia7.png', 7);
INSERT INTO `product_photo` VALUES(843, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia.png', 1);
INSERT INTO `product_photo` VALUES(844, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia2.png', 2);
INSERT INTO `product_photo` VALUES(845, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia3.png', 3);
INSERT INTO `product_photo` VALUES(846, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia4.png', 4);
INSERT INTO `product_photo` VALUES(847, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia.png', 1);
INSERT INTO `product_photo` VALUES(848, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia2.png', 2);
INSERT INTO `product_photo` VALUES(849, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia4.png', 3);
INSERT INTO `product_photo` VALUES(850, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia5.png', 4);
INSERT INTO `product_photo` VALUES(851, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia6.png', 5);
INSERT INTO `product_photo` VALUES(852, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia7.png', 6);
INSERT INTO `product_photo` VALUES(853, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia8.png', 7);
INSERT INTO `product_photo` VALUES(854, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia9.png', 8);
INSERT INTO `product_photo` VALUES(855, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-1.png', 1);
INSERT INTO `product_photo` VALUES(856, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-2.png', 2);
INSERT INTO `product_photo` VALUES(857, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-3.png', 3);
INSERT INTO `product_photo` VALUES(858, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-4.png', 4);
INSERT INTO `product_photo` VALUES(859, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-5.png', 5);
INSERT INTO `product_photo` VALUES(860, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-6.png', 6);
INSERT INTO `product_photo` VALUES(861, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-7.png', 7);
INSERT INTO `product_photo` VALUES(862, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai.png', 1);
INSERT INTO `product_photo` VALUES(863, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai2.png', 2);
INSERT INTO `product_photo` VALUES(864, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai3.png', 3);
INSERT INTO `product_photo` VALUES(865, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai5.png', 4);
INSERT INTO `product_photo` VALUES(866, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai6.png', 5);
INSERT INTO `product_photo` VALUES(867, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai7.png', 6);
INSERT INTO `product_photo` VALUES(868, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai8.png', 7);
INSERT INTO `product_photo` VALUES(869, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai9.png', 8);
INSERT INTO `product_photo` VALUES(870, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai10.png', 9);
INSERT INTO `product_photo` VALUES(871, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai11.png', 10);
INSERT INTO `product_photo` VALUES(872, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai12.png', 11);
INSERT INTO `product_photo` VALUES(873, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai1.png', 1);
INSERT INTO `product_photo` VALUES(874, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai2.png', 2);
INSERT INTO `product_photo` VALUES(875, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai3.png', 3);
INSERT INTO `product_photo` VALUES(876, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai4.png', 4);
INSERT INTO `product_photo` VALUES(877, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai1.png', 1);
INSERT INTO `product_photo` VALUES(878, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai2.png', 2);
INSERT INTO `product_photo` VALUES(879, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai3.png', 3);
INSERT INTO `product_photo` VALUES(880, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai4.png', 4);
INSERT INTO `product_photo` VALUES(881, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai5.png', 5);
INSERT INTO `product_photo` VALUES(882, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai6.png', 6);
INSERT INTO `product_photo` VALUES(883, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai1.png', 1);
INSERT INTO `product_photo` VALUES(884, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai3.png', 2);
INSERT INTO `product_photo` VALUES(885, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai4.png', 3);
INSERT INTO `product_photo` VALUES(886, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai2.png', 4);
INSERT INTO `product_photo` VALUES(887, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay1.png', 1);
INSERT INTO `product_photo` VALUES(888, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay2.png', 2);
INSERT INTO `product_photo` VALUES(889, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay3.png', 3);
INSERT INTO `product_photo` VALUES(890, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay4.png', 4);
INSERT INTO `product_photo` VALUES(891, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'heo-nau-gia-cay-chuan-vi-bac.png', 5);
INSERT INTO `product_photo` VALUES(892, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-la-tia-tohap-sa-hap-la-chanh.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `product_price_history`
--

CREATE TABLE `product_price_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` int(11) DEFAULT '0',
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_pro`
--

CREATE TABLE `product_pro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity_id` tinyint(4) DEFAULT '0',
  `datepackage_id` tinyint(4) DEFAULT '0',
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_im` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `price_discount` int(11) DEFAULT '0',
  `price_npp` int(11) DEFAULT '0',
  `price_daily` int(11) DEFAULT '0',
  `price_ctv` int(11) DEFAULT '0',
  `price_private` int(11) DEFAULT '0',
  `price_sale1` int(11) DEFAULT '0',
  `price_sale2` int(11) DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `tips` text COLLATE utf8mb4_unicode_ci,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ishot` tinyint(4) NOT NULL DEFAULT '0',
  `isnew` tinyint(4) NOT NULL DEFAULT '0',
  `isdefault` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_pro`
--

INSERT INTO `product_pro` VALUES(1, 1, 'MB-001', 'Bánh chả Hà Nội', 18, 1, 'Đặt hàng qua website giá chỉ còn: 20.000', 0, 20000, 0, 0, 22000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay, lạp xưởng,&nbsp;lá chanh, mỡ heo, bột mỳ, lạc, hạt dưa&nbsp;cùng một số loại gia vị.</p>\r\n\r\n<p><strong>Xuất xứ: </strong>Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 75 ngày kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ&nbsp;phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-cha-ha-noi_1.png', 'banh-cha-ha-noi', 0, 0, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(2, 1, 'MB-002', 'Bánh cốm Hà Nội', 5, 1, 'Đặt hàng qua website giá chỉ còn: 27.000', 0, 27000, 0, 0, 28000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Đậu xanh, bột nếp, đường cát, dừa, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 1 cái bánh.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Bảo quản ngăn đông hoặc ngăn mát tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong><strong> </strong>12 ngày kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-com-ha-noi_1.png', 'banh-com-ha-noi', 0, 0, 1, 2, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(3, 1, 'MB-004', 'Bánh quế Hà Nội', 6, 1, 'Đặt hàng qua website giá chỉ còn: 40.000', 0, 40000, 0, 0, 43000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột nếp, đường cát, mè.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hộp giấy.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-que-ha-noi.png', 'banh-que-ha-noi', 0, 1, 1, 4, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(4, 1, 'MB-006', 'Bột sắn dây Kim Sơn - Ninh Bình', 4, 5, 'Đặt hàng qua website giá chỉ còn: 155.000', 0, 155000, 0, 0, 160000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Sắn dây ta nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 1kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-san-day-kim-son-ninh-binh.png', 'bot-san-day-kim-son-ninh-binh', 1, 0, 1, 6, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(5, 1, 'MB-011', 'Chả cốm Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 77.000', 0, 77000, 0, 0, 80000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay, cốm xanh, mỡ heo, muối, tiêu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-com-ha-noi.png', 'cha-com-ha-noi', 0, 1, 1, 11, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(6, 1, 'MB-008', 'Chả mực Hạ Long', 3, 9, 'Đặt hàng qua website giá chỉ còn: 270.000', 0, 270000, 0, 0, 275000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mực tươi giã tay.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát, nơi khô ráo.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-muc-ha-long.png', 'cha-muc-ha-long', 1, 1, 1, 8, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(7, 1, 'MB-009', 'Chả quế nướng Nam Định', 3, 9, 'Đặt hàng qua website giá chỉ còn: 107.000', 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt lợn tươi, mỡ lợn, bột quế.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 0.5kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5-7 ngày ở&nbsp;ngăn mát tủ lạnh. 3 tháng ở ngăn đông.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-que-nuong-nam-dinh.png', 'cha-que-nuong-nam-dinh', 0, 1, 1, 9, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(8, 1, 'MB-010', 'Chả rươi Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 255.000', 0, 255000, 0, 0, 260000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 70% Rươi tươi, 30% thịt nạc và các gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đá tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-ruoi-ha-noi.png', 'cha-ruoi-ha-noi', 0, 1, 1, 10, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(9, 1, 'MB-022', 'Dồi sụn Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay,&nbsp;sụn, lạc, đỗ xanh, rau thơm.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'doi-sun-ha-noi.png', 'doi-sun-ha-noi', 0, 1, 1, 22, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(10, 1, 'MB-012', 'Giò lụa Nam Định', 4, 9, 'Đặt hàng qua website giá chỉ còn: 215.000', 0, 215000, 0, 0, 220000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><b>Bảo quản</b>: Bảo quản trong ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'gio-lua-nam-dinh.png', 'gio-lua-nam-dinh', 0, 1, 1, 12, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(11, 1, 'MB-013', 'Giò xào Nam Định', 4, 9, 'Đặt hàng qua website giá chỉ còn: 225.000', 0, 225000, 0, 0, 230000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tai heo, lưỡi heo, thị đùi heo,&nbsp;nấm mèo, hạt tiêu.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;3&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Bảo quản trong ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'gio-xao-nam-dinh.png', 'gio-xao-nam-dinh', 0, 1, 1, 13, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(12, 1, 'MB-018', 'Mắm Cáy Kim Sơn Ninh Bình', 7, 6, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% con cáy tự nhiên, muối biển tinh khiết, thính gạo nếp.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 500ml.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-cay-kim-son-ninh-binh.png', 'mam-cay-kim-son-ninh-binh', 0, 1, 1, 18, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(13, 1, 'MB-015', 'Mắm rươi Ninh Bình', 8, 6, 'Đặt hàng qua website giá chỉ còn: 105.000', 0, 105000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Rươi tươi, muối, vỏ quýt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 300gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-ruoi-ninh-binh.png', 'mam-ruoi-ninh-binh', 0, 1, 1, 15, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(14, 1, 'MB-016', 'Mắm tép Kim Sơn Ninh Bình', 9, 6, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tép &gt; 65%, muối, thính nếp, cơm nóng, men rượu, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 600gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 600gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-tep-kim-son-ninh-binh.png', 'mam-tep-kim-son-ninh-binh', 0, 1, 1, 16, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(15, 1, 'MB-017', 'Mắm Tôm Kim Hải Ninh Bình', 3, 6, 'Đặt hàng qua website giá chỉ còn: 52.000', 0, 52000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-tom-kim-hai-ninh-binh.png', 'mam-tom-kim-hai-ninh-binh', 0, 1, 1, 17, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(16, 1, 'MB-019', 'Rượu đế nếp Kim Sơn Ninh Bình', 10, 5, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 68000, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Gạo nếp cái hoa vàng, men rượu,&nbsp;không&nbsp;chất phụ gia.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Tính theo lít</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng&nbsp;nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'ruou-de-nep-kim-son-ninh-binh.png', 'ruou-de-nep-kim-son-ninh-binh', 0, 0, 1, 19, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(17, 1, 'MB-020', 'Rươi tươi Thái Bình', 3, 3, 'Đặt hàng qua website giá chỉ còn: 435.000', 0, 435000, 0, 0, 440000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Rươi tươi 100%.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đá tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'ruoi-tuoi.png', 'ruoi-tuoi', 0, 1, 1, 20, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(18, 1, 'MB-003', 'Bánh đậu xanh Tiên Trung - Hải Dương', 21, 1, 'Đặt hàng qua website giá chỉ còn: 25.000', 0, 25000, 0, 0, 27000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-dau-xanh-tien-trung-hai-duong_1.png', 'banh-dau-xanh-tien-trung-hai-duong', 0, 1, 1, 3, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(19, 1, 'MB-005', 'Bột đậu xanh nguyên chất Tiên Dung', 11, 5, 'Đặt hàng qua website giá chỉ còn: 37.000', 0, 37000, 0, 0, 39000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-dau-xanh-nguyen-chat-tien-dung.png', 'bot-dau-xanh-nguyen-chat-tien-dung', 0, 1, 1, 5, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(20, 1, 'MB-021', 'Mọc heo', 3, 3, 'Đặt hàng qua website giá chỉ còn: 102.000', 0, 102000, 0, 0, 105000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo nóng&nbsp;xay, mộc nhĩ, nước mắm, tiêu.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng&nbsp;kể từ NSX.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'moc-heo.png', 'moc-heo', 0, 1, 1, 21, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(22, 1, 'MB-023', 'Bò viên gân Hà Nội', 3, 3, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 98000, 0, 130000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt bò, gân bò.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bo-vien-gan.png', 'bo-vien-gan', 0, 1, 1, 23, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(23, 3, 'MN-01', 'Khô chỉ vàng loại 1 Vũng Tàu', 3, 10, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-01-kho-chi-vang-loai-1-vung-tau_1.png', 'kho-chi-vang-loai-1-vung-tau', 0, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(24, 3, 'MN-02', 'Bánh phồng sữa Tuyết Phụng - Bến Tre', 11, 1, 'Đặt hàng qua website giá chỉ còn: 47.000', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 400gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-02-banh-phong-sua-tuyet-phung-ben-tre_1.png', 'banh-phong-sua-tuyet-phung-ben-tre', 0, 1, 1, 2, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(25, 3, 'MN-03', 'Bánh pía Mỹ Ngọc - Sóc Trăng', 3, 1, NULL, 0, 95000, 86000, 0, 97000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-03-banh-pia-my-ngoc-soc-trang.png', 'banh-pia-my-ngoc-soc-trang', 1, 0, 1, 3, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(26, 3, 'MN-04', 'Khô cá sặc loại lớn đặc sản Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 152.000', 0, 152000, 0, 0, 155000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-04-kho-ca-sac-loai-lon-dac-san-ca-mau.png', 'kho-ca-sac-loai-lon-dac-san-ca-mau', 0, 1, 1, 4, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(27, 3, 'MN-05', 'Khô cá Lóc 3 nắng Trà Vinh', 3, 10, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 0, 0, 130000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-05-kho-ca-loc-3-nang-tra-vinh.png', 'kho-ca-loc-3-nang-tra-vinh', 0, 1, 1, 5, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(28, 3, 'MN-06', 'Khô cá Lóc 2 nắng Trà Vinh', 3, 10, 'Đặt hàng qua website giá chỉ còn: 117.000', 0, 117000, 0, 0, 120000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-06-kho-ca-loc-2-nang-tra-vinh.png', 'kho-ca-loc-2-nang-tra-vinh', 0, 1, 1, 6, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(29, 3, 'MN-07', 'Khô cá đù loại lớn Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 87.000', 0, 87000, 0, 0, 90000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-07-kho-ca-du-loai-lon.png', 'kho-ca-du-loai-lon-ca-maukho-ca-du-loai-lon', 0, 1, 1, 7, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(30, 3, 'MN-08', 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', 3, 10, 'Đặt hàng qua website giá chỉ còn: 187.000', 0, 187000, 0, 0, 190000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-08-kho-ca-dua-chuan-2-soc-1-nang-vung-tau.png', 'kho-ca-dua-chuan-2-soc-1-nang-vung-tau', 0, 1, 1, 8, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(31, 3, 'MN-12', 'Kẹo dừa Tuyết Phụng - Bến Tre', 11, 8, 'Đặt hàng qua website giá chỉ còn: 63.000', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dừa, lá dứa, sầu riêng.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 400gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-012-keo-dua-tuyet-phung-ben-tre.png', 'keo-dua-tuyet-phung-ben-tre', 0, 1, 1, 12, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(32, 3, 'MN-10', 'Kẹo dừa thập cẩm Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 83.000', 0, 83000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dừa, lá dứa, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-10-keo-dua-thap-cam-tuyet-phung-ben-tre.png', 'keo-dua-thap-cam-tuyet-phung-ben-trekeo-dua-thap-cam-tuyet-phung-ben-tre', 0, 1, 1, 10, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(33, 3, 'MN-11', 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 53.000', 0, 53000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-11-keo-chuoi-vi-gung-tuyet-phung-ben-tre.png', 'keo-chuoi-vi-gung-tuyet-phung-ben-tre', 0, 1, 1, 11, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(34, 3, 'MN-09', 'Khô cá kèo loại lớn Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 327.000', 0, 327000, 0, 0, 330000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-09-kho-ca-keo-loai-lon-ca-mau.png', 'kho-ca-keo-loai-lon-ca-mau', 0, 1, 1, 9, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(35, 3, 'MN-13', 'Kẹo chuối loại đặc biệt Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 73.000', 0, 73000, 0, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-013-keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre.png', 'keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre', 0, 1, 1, 13, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(36, 3, 'MN-14', 'Nước màu đường thốt nốt An Giang', 11, 2, 'Đặt hàng qua website giá chỉ còn: 35.000', 0, 35000, 0, 0, 38000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mật hoa đường thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-014-nuoc-mau-duong-thot-not-an-giang.png', 'nuoc-mau-duong-thot-not-an-giang', 0, 1, 1, 14, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(37, 3, 'MN-15', 'Đường Thốt nốt viên loại đặc biệt An Giang', 4, 2, 'Đặt hàng qua website giá chỉ còn: 57.000', 0, 57000, 0, 0, 59000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mật hoa đường thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-015-dduong-thot-not-vien-loai-dac-biet-an-giang.png', 'duong-thot-not-vien-loai-dac-biet-an-giang', 0, 1, 1, 15, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(38, 3, 'MN-16', 'Đường Thốt nốt hũ loại đặc biệt An Giang', 4, 2, 'Đặt hàng qua website giá chỉ còn: 65.000', 0, 65000, 0, 0, 68000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Kết tinh từ mật hoa cây thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-015-duong-thot-not-hu-loai-dac-biet-an-giang.png', 'duong-thot-not-hu-loai-dac-biet-an-giang', 1, 0, 1, 16, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(39, 2, 'MT-001', 'Bánh chưng Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 26.000', 0, 26000, 0, 0, 28000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Gạo nếp, thịt heo, đậu xanh.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Gói bằng lá chuối.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-001-banh-chung-binh-dinh.png', 'banh-chung-binh-dinh', 0, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(40, 2, 'MT-002', 'Bánh đa nem cuốn Lương Sơn Nghệ An', 12, 1, 'Đặt hàng qua website giá chỉ còn: 7.000', 0, 7000, 0, 0, 7500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-002-banh-da-nem-cuon-luong-son-nghe-an.png', 'banh-da-nem-cuon-luong-son-nghe-an', 0, 1, 1, 2, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(41, 2, 'MT-003', 'Kẹo gương Kim Ngọc Quảng Ngãi', 33, 8, 'Đặt hàng qua website giá chỉ còn: 6.300', 0, 6300, 0, 0, 6500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-003-keo-guong-kim-ngoc-quang-ngai.png', 'keo-guong-kim-ngoc-quang-ngai', 1, 0, 1, 3, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(42, 2, 'MT-004', 'Bánh ít lá gai Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 4.700', 0, 4700, 4300, 0, 5000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột nếp, lá gai, đường cát,&nbsp;mè, đậu hoặc dừa, không chất bảo quản, không chất tạo màu.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-004-banh-it-la-gai-binh-dinh.png', 'banh-it-la-gai-binh-dinh', 0, 1, 1, 4, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(43, 2, 'MT-005', 'Bánh ít nhân mặn Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 6.700', 0, 6700, 0, 0, 7000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:&nbsp;</strong>Bột nếp, nắm mèo, thịt xay, thịt tôm, đậu xanh, không chất bảo quản, không chất tạo màu.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-005-banh-it-nhan-man-binh-dinh.png', 'banh-it-nhan-man-binh-dinh', 0, 1, 1, 5, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(44, 2, 'MT-006', 'Bánh su sê Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 4.700', 0, 4700, 0, 0, 5000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần: </strong>Bột nếp, bột năng, đậu xanh, đường cát, dừa sợi.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-006-banh-su-se-binh-dinh.png', 'banh-su-se-binh-dinh', 0, 1, 1, 6, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(45, 2, 'MT-007', 'Bánh tét Bình Định', 17, 1, 'Đặt hàng qua website giá chỉ còn: 137.000', 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Nếp loại 1, thịt ba rọi loại ngon, đậu loại 1.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 đòn 1.5Kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1.5Kg.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-007-banh-tet-binh-dinh.png', 'banh-tet-binh-dinh', 0, 1, 1, 7, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(46, 2, 'MT-008', 'Chả cá Nha Trang', 3, 3, 'Đặt hàng qua website giá chỉ còn: 72.000', 0, 72000, 62000, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% cá tươi, không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 2 miếng.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-008-cha-ca-nha-trang.png', 'cha-ca-nha-trang', 0, 1, 1, 8, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(47, 2, 'MT-009', 'Chả ram tôm đất Bình Định', 3, 3, 'Đặt hàng qua website giá chỉ còn: 97.000', 0, 97000, 0, 0, 100000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tôm tươi, thịt xay, nấm mèo, gia vị, bánh tráng cuốn.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-009-cha-ram-tom-dat-binh-dinh.png', 'cha-ram-tom-dat-binh-dinh', 0, 1, 1, 9, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(48, 2, 'MT-010', 'Cua xay lagi Bình Thuận', 5, 3, 'Đặt hàng qua website giá chỉ còn: 30.000', 0, 30000, 0, 0, 33000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cua tươi xay.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 250gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-010-cua-xay-lagi-binh-thuan.png', 'cua-xay-lagi-binh-thuan', 0, 1, 1, 10, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(49, 2, 'MT-011', 'Đường phèn vàng Quảng Ngãi', 4, 2, 'Đặt hàng qua website giá chỉ còn: 52.000', 0, 52000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Kết tinh từ mật mía.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1Kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1Kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;36&nbsp;tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-011-duong-phen-quang-ngai.png', 'duong-phen-quang-ngai', 1, 0, 1, 11, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(50, 2, 'MT-012', 'Lạc rang tỏi ớt Lương Sơn Nghệ An', 1, 1, 'Đặt hàng qua website giá chỉ còn: 9.200', 0, 9200, 0, 0, 9500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 50gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 50gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-012-lac-rang-toi-ot-luong-son.png', 'lac-rang-toi-ot-luong-son', 0, 1, 1, 12, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(51, 2, 'MT-013', 'Bánh dừa nướng Quảng Nam', 5, 1, 'Đặt hàng qua website giá chỉ còn: 32.000', 0, 32000, 0, 0, 35000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Gạo nếp hương và dừa bánh tẻ.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-014-banh-dua-nuong-quang-nam.png', 'banh-dua-nuong-quang-nam', 0, 1, 1, 13, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(52, 2, 'MT-014', 'Bánh đậu xanh nướng nhân thịt Quảng Nam', 18, 1, 'Đặt hàng qua website giá chỉ còn: 23.000đ', 0, 23000, 0, 0, 25000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-015-banh-dau-xanh-nuong-nhan-thit-quang-nam_1.png', 'banh-dau-xanh-nuong-nhan-thit-quang-nam', 0, 1, 1, 14, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(53, 2, 'MT-015', 'Mắm cá cơm Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 47.000đ', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-015-mam-ca-com-di-can_1.png', 'mam-ca-com-di-can', 0, 1, 1, 15, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(54, 2, 'MT-016', 'Mắm cá giò Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 57.000đ', 0, 57000, 0, 0, 60000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá Giò, nếp, muối, rượu, gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-016-mam-ca-gio-di-can-2.png', 'mam-ca-gio-di-can', 0, 1, 1, 16, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(55, 2, 'MT-017', 'Mắm dưa Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 63.000đ', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dưa gang, đu đủ, cà pháo, mắm nêm.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-017-mam-dua-di-can.png', 'mam-dua-di-can', 0, 1, 1, 17, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(56, 2, 'MT-018', 'Mắm mực Đà Nẵng', 3, 6, 'Đặt hàng qua website giá chỉ còn: 63.000đ', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mực, muối, ớt, tỏi.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-018-mam-muc-da-nang.png', 'mam-muc-da-nang', 0, 1, 1, 18, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(57, 2, 'MT-019', 'Mắm nêm Dì Cẩn', 5, 6, 'Đặt hàng qua website giá chỉ còn: 23.000đ', 0, 23000, 0, 0, 25000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-019-mam-nem-di-can.png', 'mam-nem-di-can', 0, 1, 1, 19, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(58, 2, 'MT-020', 'Mắm ruốc Dì Cẩn', 5, 6, 'Đặt hàng qua website giá chỉ còn: 45.000đ', 0, 45000, 0, 0, 48000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-020-mam-ruoc-di-can-2.png', 'mam-ruoc-di-can', 0, 1, 1, 20, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(59, 2, 'MT-021', 'Mắm tôm chua Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 67.000đ', 0, 67000, 0, 0, 70000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tôm, nếp, mắm đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-021-mam-tom-chu-di-can.png', 'mam-tom-chua-di-can', 0, 1, 1, 21, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(60, 2, 'MT-022', 'Tép khô (ruốc khô) Nha Trang', 3, 3, 'Đặt hàng qua website giá chỉ còn: 82.000đ', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Ruốc tự nhiên được phơi sấy khô.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-022-tep-kho-ruoc-kho-nha-trang.png', 'tep-kho-ruoc-kho-nha-trang', 0, 1, 1, 22, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(61, 2, 'MT-023', 'Giò bê bắp Nam Đàn - Nghệ An', 4, 3, 'Đặt hàng qua website giá chỉ còn: 257.000', 0, 257000, 0, 0, 260000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Thịt&nbsp;Bê tươi, gia vị,&nbsp;không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-023-gio-be-bap-nam-dan-nghe-an.png', 'gio-be-bap-nam-dan-nghe-an', 0, 1, 1, 23, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(62, 2, 'MT-024', 'Mực rim me Phan Thiết', 6, 7, 'Đặt hàng qua website giá chỉ còn: 72.000', 0, 72000, 0, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-024-muc-rim-me-phan-thiet.png', 'muc-rim-me-phan-thiet', 0, 1, 1, 24, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(63, 2, 'MT-025', 'Giò bê truyền thống Nam Đàn - Nghệ An', 4, 3, 'Đặt hàng qua website giá chỉ còn: 232.000', 0, 232000, 195000, 0, 235000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Thịt bê tươi, gia vị,&nbsp;không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-025-gio-be-truyen-thong-nam-dan-nghe-an.png', 'gio-be-truyen-thong-nam-dan-nghe-an', 1, 1, 1, 25, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(64, 2, 'MT-026', 'Đường thô mật mía Nghĩa Đàn - Nghệ An', 4, 2, 'Đặt hàng qua website giá chỉ còn: 47.000', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-026-duong-tho-mat-mia-nghia-dan-nghe-an.png', 'duong-tho-mat-mia-nghia-dan-nghe-an', 0, 1, 1, 26, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(65, 2, 'MT-027', 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', 7, 2, 'Đặt hàng qua website giá chỉ còn: 28.000', 0, 28000, 23000, 0, 30000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-027-mat-mia-nguyen-chat-nghia-dan-nghe-an.png', 'mat-mia-nguyen-chat-nghia-dan-nghe-an', 0, 1, 1, 27, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(66, 2, 'MT-028', 'Mứt sen Liên - Đặc sản Huế', 3, 1, 'Đặt hàng qua website giá chỉ còn: 112.000', 0, 112000, 0, 0, 115000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Hạt sen khô, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:&nbsp;</strong>Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-028-mut-sen-lien-dac-san-hue.png', 'mut-sen-lien-dac-san-hue', 0, 1, 1, 28, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(67, 2, 'MT-029', 'Kẹo đậu phộng Hoàng Bách Huế', 19, 8, 'Đặt hàng qua website giá chỉ còn: 11.000', 0, 11000, 0, 0, 12000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-029-keo-dau-phong-hoang-bach-hue.png', 'keo-dau-phong-hoang-bach-hue', 0, 1, 1, 29, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(68, 2, 'MT-030', 'Mè xửng loại thượng hạng Hoàng Bách - Huế', 3, 8, 'Đặt hàng qua website giá chỉ còn: 40.000', 0, 40000, 0, 0, 43000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-030-me-xung-loai-thuong-hang-hoang-bach-hue.png', 'me-xung-loai-thuong-hang-hoang-bach-hue', 0, 1, 1, 30, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(69, 2, 'MT-031', 'Mạch nha nếp Quảng Ngãi', 11, 2, 'Đặt hàng qua website giá chỉ còn: 25.000', 0, 25000, 0, 0, 27000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% mầm lúa và nếp.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-031-mach-nha-nep-quang-ngai.png', 'mach-nha-nep-quang-ngai', 0, 1, 1, 31, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(70, 2, 'MT-032', 'Kẹo cu đơ Hà Tĩnh', 20, 8, 'Đặt hàng qua website giá chỉ còn: 55.000', 0, 55000, 0, 0, 57000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-031-keo-cu-do-ha-tinh.png', 'keo-cu-do-ha-tinh', 0, 1, 1, 32, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(71, 2, 'MT-033', 'Mè xửng Hoàng Bách - Huế', 6, 8, 'Đặt hàng qua website giá chỉ còn: 17.000', 0, 17000, 0, 0, 18000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-033-me-xung-hoang-bach-hue.png', 'me-xung-hoang-bach-hue', 0, 1, 1, 33, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(72, 2, 'MT-034', 'Giò bò loại đặc biệt Đà Nẵng', 3, 9, 'Đặt hàng qua website giá chỉ còn: 152.000', 0, 152000, 0, 0, 155000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bò tươi, tiêu, gia vị, không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-034-gio-bo-loai-dac-biet-da-nang.png', 'gio-bo-loai-dac-biet-da-nang', 0, 1, 1, 34, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(73, 2, 'MT-035', 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', 3, 6, 'Đặt hàng qua website giá chỉ còn: 82.000đ', 0, 82000, 67000, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Ruốc, tép tươi, gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-035-mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh.png', 'mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh', 1, 1, 1, 35, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(74, 1, 'MB-007', 'Bột đậu đen nguyên chất Tiên Dung', 3, 5, 'Đặt hàng qua website giá chỉ còn: 45.000', 0, 45000, 0, 0, 48000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong>&nbsp;Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Bột đậu đen&nbsp;nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong>&nbsp;Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr gồm 10 gói nhỏ.</p>\r\n\r\n<p><strong>Khối lượng:</strong>&nbsp;500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong>&nbsp;In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong>&nbsp;Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong>&nbsp;Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-dau-den-nguyen-chat-tien-dung.png', 'bot-dau-den-nguyen-chat-tien-dung', 0, 1, 1, 7, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(75, 3, 'MN-17', 'Bánh pía chay Mỹ Ngọc - Sóc Trăng', 11, 1, 'Đặt hàng qua website giá chỉ còn: 85.000', 0, 85000, 0, 0, 87000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;6&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-17-banh-pia-chay-my-ngoc-soc-trang.png', 'banh-pia-chay-my-ngoc-soc-trang', 0, 1, 1, 17, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(77, 2, 'MT-036', 'Rong mứt nấu canh/Rong biển khô Nha Trang', 2, 2, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mt-036-rong-mut-nau-canh-rong-bien-kho-nha-trang.png', 'rong-mut-nau-canh-rong-bien-kho-nha-trang', 0, 1, 1, 36, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(78, 3, 'MN-18', 'Bánh thuyền Mix hạt', 3, 1, 'Đặt hàng qua website giá chỉ còn: 45.000', 0, 45000, 0, 0, 47000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mn-018-banh-thuyen-mix-hat.png', 'banh-thuyen-mix-hat', 0, 1, 1, 18, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(79, 4, 'NN-01', 'Lạp xưởng nạc loại đặc biệt Campuchia', 3, 3, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 0, 0, 130000, 0, 0, 0, 0, NULL, '<p><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% Thịt heo tươi ngon, tiêu hột, ngũ vị hương, gia vị.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia.png', 'lap-xuong-nac-loai-dac-biet-campuchia', 0, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(80, 4, 'NN-02', 'Khô Cá Tra Phồng Biển Hồ Campuchia', 3, 10, 'Đặt hàng qua website giá chỉ còn: 117.000', 0, 120000, 0, 0, 117000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% cá tra, muối biển, không phẩm màu, không chất bảo quản.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh, luôn giữ kín bao bì.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mn-02-kho-ca-tra-phong-bien-ho-campuchia.png', 'kho-ca-tra-phong-bien-ho-campuchia', 0, 1, 1, 2, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(81, 4, 'NN-03', 'Khô cá lóc Biển Hồ Campuchia', 3, 10, 'Đặt hàng qua website giá chỉ còn: 137.000', 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% cá lóc, muối biển, không phẩm màu, không chất bảo quản.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh, luôn giữ kín bao bì.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: </span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500 nghìn đồng phí giao hàng là 25.000đ và phát sinh phí nếu ở khu vực xa. Giao nhanh từ 1 đến 3 ngày tùy vào khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi nhận, thanh toán khi nhận hàng, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-03-kho-ca-loc-bien-ho-campuchia.png', 'kho-ca-loc-bien-ho-campuchia', 0, 1, 1, 3, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(82, 4, 'NN-04', 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 4, 2, 'Đặt hàng qua website giá chỉ còn: 65.000', 0, 65000, 0, 0, 68000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Mật hoa đường thốt nốt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 1kg.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 12 tháng kể từ ngày sản xuất.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia.png', 'duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia', 0, 1, 1, 4, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(83, 5, 'XH-001', 'Thịt Dê hấp, xào các loại (500gr)', 25, 3, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>Thịt dê được chế biến sẵn, tặng thêm đậu bắp, nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'thit-de-hap-xao-cac-loai-1.png', 'thit-de-hap-xao-cac-loai', 0, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(84, 5, 'XH-002', 'Thịt Dê nướng các loại (500gr)', 28, 3, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>Thịt dê đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'thit-de-nuong-cac-loai.png', 'thit-de-nuong-cac-loai', 0, 1, 1, 2, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(85, 5, 'XH-003', 'Vú heo nướng các loại (500gr)', 28, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Vú heo&nbsp;đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'vu-heo-nuong-cac-loai1.png', 'vu-heo-nuong-cac-loai', 0, 1, 1, 3, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(86, 5, 'XH-004', 'Heo rừng hấp, xào các loại (500gr)', 27, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Thịt Heo rừng lai&nbsp;đã được ướp sẵn chỉ cần bật bếp lên hấp, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'heo-rung-hap-xao-cac-loai1.png', 'heo-rung-hap-xao-cac-loai', 0, 1, 1, 4, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(87, 5, 'XH-005', 'Heo rừng nướng các loại (500gr)', 28, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Thịt Heo rừng lai&nbsp;đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'heo-rung-nuong-cac-loai1.png', 'heo-rung-nuong-cac-loai', 0, 1, 1, 5, 1, NULL, NULL);
INSERT INTO `product_pro` VALUES(88, 5, 'XH-006', 'Giò Heo nấu giả cầy chuẩn vị Bắc', 3, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Giò&nbsp;Heo đã được chế biến và ướp sẵn, chỉ cần bật bếp lên và nấu</p>', NULL, NULL, NULL, NULL, 'thit-heo-nau-gia-cay1.png', 'thit-heo-nau-gia-cay', 0, 1, 1, 6, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `route_language`
--

CREATE TABLE `route_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `controlleract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleware` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `route_language`
--

INSERT INTO `route_language` VALUES(1, 'trangchu', 'Trang chủ', 0, 'HomeController@index', NULL, NULL, 'get', 2, '2022-06-27 07:41:31', '2022-06-27 07:41:31');
INSERT INTO `route_language` VALUES(2, 'sanpham', 'Sản phẩm', 0, 'ProductController@index', 'sim/{name?}', NULL, 'get', 2, '2022-06-27 07:41:31', '2022-07-23 13:28:08');
INSERT INTO `route_language` VALUES(3, 'maillienhe', 'Mail liên hệ', -1, 'ContactController@sendmail', 'mail-lien-he', 'mail', 'post', 2, '2022-06-27 07:41:31', '2022-06-27 07:41:31');
INSERT INTO `route_language` VALUES(4, 'tintuc', 'Tin tức', 0, 'NewsController@index', 'thong-tin/{name?}', NULL, 'get', 2, '2022-06-27 07:41:31', '2024-10-30 08:36:16');
INSERT INTO `route_language` VALUES(5, 'tinct', 'Tin tức', 7, 'NewsController@detail', 'tin-chi-tiet/{name?}', NULL, 'get', 2, '2022-06-27 07:41:31', '2022-06-27 07:41:31');
INSERT INTO `route_language` VALUES(6, 'timkiem', 'Tìm kiếm', 0, 'SearchController@index', 'tim-kiem', NULL, 'any', 2, '2022-06-27 07:41:31', '2022-06-27 07:41:31');
INSERT INTO `route_language` VALUES(7, 'lienhe', 'Liên hệ', 0, 'StaticPageController@index', 'lien-he', NULL, 'get', 2, '2022-06-27 07:41:31', '2022-07-23 13:24:12');
INSERT INTO `route_language` VALUES(9, 'tags', 'Tags', 0, 'TagsController@index', 'tags/{name?}', NULL, 'get', 2, '2022-07-25 10:19:51', '2022-07-25 10:23:17');
INSERT INTO `route_language` VALUES(10, 'additem', 'Thêm vào giỏ hàng', 2, 'ShoppingCartController@ajaxadditem', 'additem/{id?}', NULL, 'get', 2, '2022-07-29 07:44:14', '2022-07-29 07:47:51');
INSERT INTO `route_language` VALUES(11, 'delitem', 'Xóa khỏi giỏ hàng', 2, 'ShoppingCartController@deleteitem', 'delete-item/{rid?}', NULL, 'get', 2, '2022-07-29 07:46:13', '2022-07-29 07:46:13');
INSERT INTO `route_language` VALUES(12, 'delcart', 'Xóa giỏ hàng', 2, 'ShoppingCartController@deletecart', 'delete-cart', NULL, 'get', 2, '2022-07-29 07:46:54', '2022-07-29 07:46:54');
INSERT INTO `route_language` VALUES(13, 'updateitem', 'Cập nhật giỏ hàng', 2, 'ShoppingCartController@updateitem', 'update-item/{rid?}', NULL, 'get', 2, '2022-07-29 07:47:33', '2022-07-29 07:47:33');
INSERT INTO `route_language` VALUES(14, 'vieworder', 'Xem đơn hàng', 2, 'ShoppingCartController@vieworder', 'vieworder/{name?}', NULL, 'get', 2, '2022-07-29 07:48:26', '2022-07-29 07:48:26');
INSERT INTO `route_language` VALUES(15, 'shoppingcart', 'Giỏ hàng', 2, 'ShoppingCartController@index', 'shoppingcart', NULL, 'get', 2, '2022-07-29 07:48:50', '2022-07-29 07:48:50');
INSERT INTO `route_language` VALUES(16, 'sendorder', 'Đặt hàng', 2, 'ShoppingCartController@sendorder', 'sendorder', 'mail', 'get', 2, '2022-07-29 07:49:16', '2023-01-14 08:56:11');
INSERT INTO `route_language` VALUES(17, 'ajaxcheckcode', 'Check mã giảm giá', 2, 'ShoppingCartController@ajaxcheckcode', 'ajaxcheckcode/{code?}', NULL, 'get', 2, '2022-08-12 11:15:52', '2022-08-12 11:15:52');
INSERT INTO `route_language` VALUES(18, 'timkiem', 'Search', -1, 'SearchController@index', 'tim-kiem', NULL, 'any', 2, '2022-08-23 14:36:15', '2022-08-23 14:40:22');
INSERT INTO `route_language` VALUES(19, 'minicart', 'Minicart', 2, 'ShoppingCartController@ajaxminicart', 'minicart', NULL, 'get', 2, '2022-09-28 13:38:37', '2022-09-28 13:38:37');
INSERT INTO `route_language` VALUES(20, 'maildangkydaily', 'Mail đăng ký đối tác', -1, 'ContactController@agentregister', 'dang-ky-doi-tac', 'mail', 'post', 2, '2022-10-07 22:37:28', '2022-10-07 23:15:51');
INSERT INTO `route_language` VALUES(21, 'sendmaildebt', 'Thư đòi nợ', -1, 'ContactController@sendmaildebt', 'sendmaildebt/{id?}', 'mail', 'get', 2, '2022-10-12 05:07:47', '2022-10-12 05:07:47');
INSERT INTO `route_language` VALUES(22, 'minisearch', 'Search', -1, 'SearchController@ajaxminisearch', 'minisearch/{name?}', NULL, 'any', 2, '2022-10-27 01:36:15', '2022-10-27 01:36:15');
INSERT INTO `route_language` VALUES(23, 'taiunc', 'Tải UNC', -1, 'ShoppingCartController@orderpayment', 'taiunc', NULL, 'post', 2, '2023-04-22 08:16:13', '2023-04-22 08:17:26');
INSERT INTO `route_language` VALUES(24, 'esimauto', 'Xuất Esim tự động', 2, 'EsimController@index', 'esimauto/{name?}/{code?}', NULL, 'get', 2, '2024-11-09 09:36:31', '2024-12-11 13:07:32');
INSERT INTO `route_language` VALUES(25, 'esimcart', 'Đặt hàng Esim tự động', 2, 'EsimController@esimcart', 'esimcart', NULL, 'any', 2, '2024-12-11 11:50:30', '2024-12-11 13:07:21');
INSERT INTO `route_language` VALUES(26, 'sendesimorder', 'Đặt hàng esim', 2, 'EsimController@sendorder', 'sendesimorder', 'mail', 'post', 2, '2024-12-11 13:06:17', '2024-12-14 04:54:14');
INSERT INTO `route_language` VALUES(27, 'webhook', 'Webhook', 2, 'EsimController@webhook', 'webhook', 'mail', 'post', 2, '2024-12-12 02:56:52', '2024-12-14 04:54:42');
INSERT INTO `route_language` VALUES(28, 'vieworderesim', 'Xem đơn hàng Esim', 2, 'EsimController@vieworder', 'vieworderesim/{name?}', NULL, 'get', 2, '2024-12-14 04:39:02', '2024-12-14 04:39:02');
INSERT INTO `route_language` VALUES(29, 'webhookpayos', 'Thanh toán Payos', 2, 'EsimController@webhookpayos', 'webhookpayos', 'mail', 'post', 2, '2024-12-16 04:03:13', '2024-12-16 04:03:13');
INSERT INTO `route_language` VALUES(30, 'sendpayment', 'Kết nối Thanh toán Payos', 2, 'EsimController@sendpayment', 'sendpayment', NULL, 'any', 2, '2024-12-20 07:34:14', '2024-12-28 01:48:36');
INSERT INTO `route_language` VALUES(31, 'resultpayment', 'Kết quả thanh toán Payos', 2, 'EsimController@resultpayment', 'resultpayment', NULL, 'any', 2, '2024-12-20 07:35:22', '2024-12-27 19:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` VALUES('0zNA4zpxUPLt14iEFnsUGY4pteDY02jBBJtXXprf', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUFFbWcweGFnZzZhV0t4Z0R5SFgzdVZ3ODloZEdlNGRIdnlnUGtPcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753756939);
INSERT INTO `sessions` VALUES('1N4chSSz883MkgHzT3UKnEFdetDKnBCllOrQAU7q', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRHVvQjBXbzZ0QUtPSmc5YVptVmFHWWVDd2xHTjA1cjNtU0hid01odyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756722);
INSERT INTO `sessions` VALUES('26lqX1DW4ktgoMxwqsgzZEifzDnkLN8TDYWiDHRh', NULL, '57.141.4.4', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGVSV2Y5RkEweklhcEpHcDJUcU5pUlJpR3YzODhPa2RYWHl3enljdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9tYW0tdGVwLXR1b2ktbXVvaS14b2ktdGhvbS1uZ29uLWxvYWktZGFjLWJpZXQtYmluaC1kaW5oIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753750103);
INSERT INTO `sessions` VALUES('2sKncUmiaYABfw6S9QWJV4tKnaViI99PB1WYNm07', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTDE5V0JSVTJSdVp1emp2QkEyUEUxWWdvQVliWHVNTUh1T3hROVdrSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756723);
INSERT INTO `sessions` VALUES('2SQjHWd1U5Pw3ldiyme73L8VJnl45CnzczmpS48E', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3E5b01HRFNaWWZna0ZFNlA3RDdSNjJZNXFCTjJOT0dPeEtMQmdHWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756938);
INSERT INTO `sessions` VALUES('3sjmHdCfl8x9F0cf4RGxf3uqLTninPm9B6QaKDIO', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicnlibmtVSHFkRGRtVWlkbXUxZGY5QUx4eW40REN4TWdHdWlLT09PSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756720);
INSERT INTO `sessions` VALUES('4DH8704OvwYSS3MZKeywsnViNxHPSXuXJL9KQ21k', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidzRTVE9zdnFNUTZkbUNmTHRJUXl3blB6NTV4VHozMXhXaVJlVm5uciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756727);
INSERT INTO `sessions` VALUES('5S3IBe6YMZOxnUbeYc8Os4viq66L3v9LJhnUkAfp', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVZzN0V0MGNvaFIzTEhUdUtmbnVlb1J4bDVFdlpYb1R5ZlowZzFrVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756719);
INSERT INTO `sessions` VALUES('66kKHZ5mtsIgXJEJKeS1vJJn1BWyNrUsmDiWcwey', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidGRqNXVGSFdGUmxvbVhtZjJ0cGlGams4SEpPcjhJR1ZZaEtCVkl1YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756720);
INSERT INTO `sessions` VALUES('6dEQjPC0CJ3jlegWAUJYcltwm7anGE4qlVDUo6Kn', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiekY3TUZPVFhoNW9KY0I2b3BVNUlxUXk1RmRxcVlDenVIZThhRzFYNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756724);
INSERT INTO `sessions` VALUES('8RXzXTsygpWxf0GY44xK1v4jyjdk6itn0LT6SwG1', NULL, '196.251.70.223', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A5362a Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQno5SmZtTVpsTFB1T1FXaWlXS25oUm1jSEdHMWxKR0gxTGN0MDNJZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vbWFpbC5xdWFkYWNzYW4uY29tLy5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753751635);
INSERT INTO `sessions` VALUES('9AdwWnda5PolgsWnQGg36eM0VGJrzlRAH5VdtZR1', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQXd1VWtYNjVWTjE1T1dubzR6blp3SVRTd3hDTzBpTEpWR2ZrblhtbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756726);
INSERT INTO `sessions` VALUES('Aj7jFtFF0pDiEYnpz5rQeld6ZbSpe5PX6yn9whes', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHdDVkN4VjBVeGRCNlNJSEp6VlcwejBKZGZ6RkVxc01TQm5VR0ExeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753756479);
INSERT INTO `sessions` VALUES('ar0lOvftYvvYm6OLcVOucLX7LWY6PMLmEZi1iSc4', NULL, '136.144.19.93', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDlXSHQwOXlMUzV3VmRwd25IODNOSUw4Z0JJNFE0T3FzSUZnZUE2NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751991);
INSERT INTO `sessions` VALUES('azki5Is8K0tQpBheRGV08fcIsLCcPK2WO0k41geW', NULL, '85.208.96.207', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicE5sQ1Z5RkVhaDNMbjQwOTNOZGc3NmdLcnE1ZG5HWXNPU2s4SThiSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9ydW9pLXR1b2kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753750944);
INSERT INTO `sessions` VALUES('BBGi8jl3Stas9Hhr23EhhA0u3pBgMg06S6fZzcVf', NULL, '185.191.171.5', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3l1ekNwdnVOQmNONXI0UUhJemIycHR5QXQ0QUJUTFY2TUNQeFQzQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753755751);
INSERT INTO `sessions` VALUES('cuItf13Lph0VcHElAnpZ59IuzJf5GTDeYsazHE1V', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEJ4bU4xZ0pZYXNIOGJwdmk2aUd5YlgwNTJFYkJ1SzZxd1NYd3hEcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756478);
INSERT INTO `sessions` VALUES('fodDrapRfTzymFKC4A1c1gMS2TC3Wlz3mXqpCi4Q', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiejhDMmRwV0lwb2p5a2RzN0xKazNzYm50OEFaQXpwRHl0S21MaWtGTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756718);
INSERT INTO `sessions` VALUES('Gsuykr2tBlDB8PTHqndLaaQSM3ilfGwtjCbll9Y7', NULL, '136.144.19.244', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEV3SHZKYXBOajZnaEVPTW5XZUFxaWR1cEt6Vk83SEt5WDBtM0tYSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751972);
INSERT INTO `sessions` VALUES('Gu8GQk4fwpTutnUIA4YBGFPZWy5kUG7vw8uR7uVv', NULL, '85.208.96.201', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2ZyUzl3QVdjMWViRDZSdEV1MzN2cFZEclVZZFJVQ1JUSVlNSkxtdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9jaGEtcXVlLW51b25nLW5hbS1kaW5oIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753758066);
INSERT INTO `sessions` VALUES('h1td9eOXIwjUvms0lrQP1L3sCX7069Rt7aWupnOX', NULL, '17.241.227.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHFTeUV3cHVUdE9oYXVGYzg2VFlPNU1YME02dDRGRHZrSUx6UERJYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753752173);
INSERT INTO `sessions` VALUES('hdJFmM7KgIpuhlb9i46UuPZOMxvAccGtb6c3Ahg4', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzY3Zzk5TUs4MEY0U2JOYVBISHhDNkhxYjMxcmcxWFByV0tJd2FoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756475);
INSERT INTO `sessions` VALUES('Hi7TV93wj5aU4G92sFp4m1Z022sn9LsEYkvvCVvX', NULL, '185.191.171.18', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZUQ0lUNElCdVVJY2ptMVd1MlJJMFRpWUVYZEtiOUtoSlZhcEh2WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9rZW8tZHVhLXRoYXAtY2FtLXR1eWV0LXBodW5nLWJlbi10cmVrZW8tZHVhLXRoYXAtY2FtLXR1eWV0LXBodW5nLWJlbi10cmUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753755755);
INSERT INTO `sessions` VALUES('IC4LqBgqZhYjJMNdfC7ct43iIIOACYglmvuVe5Pi', NULL, '123.21.35.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzQzVVJHSUdCWmxZdU9TRnd0R3NKV3FHcno2SkN5cm1BMmM3dDlNcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753758069);
INSERT INTO `sessions` VALUES('Ih9D2SCx6CUQI5ggAOXGEWMwZWUCsuwgqdZ3auPE', NULL, '203.33.203.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1VxVlBwZ3NJT3dwRWNNZWZaaWVPQWI0aUZRdUFZUkVJYWdXWlY5TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly93d3cucXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753751495);
INSERT INTO `sessions` VALUES('IztjKTItA4sjJZc3S4lJL7unJojTbm7bQwsUu2D1', NULL, '85.208.96.194', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkJycUE2Y0NWdHFjenhuMEcxQXVBSlRvcVNaVDRLSTIwNGJoVkxKSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9yb2JvdHMudHh0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753750940);
INSERT INTO `sessions` VALUES('jv019EkN2h3vYW4mDVW6Dnq1aLMPpakHecKPWAZl', NULL, '136.144.19.112', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk91cTI2bW9qNHBaTElpODg0UW8zTkNGeE1IbkxSWjVackhtZXNEUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751876);
INSERT INTO `sessions` VALUES('JVLy3PFeXXJqHpYzIpJ68cDrdl2agGbhDBPcOHP2', NULL, '104.234.19.3', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFVVeUFwV3o4REdDNE9WR3duTHNva3hoQ2lvMmcyeDBhUm5Ud0xZaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751892);
INSERT INTO `sessions` VALUES('kfhgbiELtTviVnJ0Q2mKd2hV6MeqmOnHGDgrbkmJ', NULL, '20.25.151.233', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.0; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidk5xS2FFWFdydWxiYmRyY1BvMlNWWnIwSkdzV2t6amVmU1ZHdnpaTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9ydW91LWRlLW5lcC1raW0tc29uLW5pbmgtYmluaCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753756477);
INSERT INTO `sessions` VALUES('KjTJ88m41TtzDp7AZRVpPszu89xcTAHyHNMUA2p0', NULL, '17.241.227.51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFZiM2xJdkFkMzI0M0dwV2xESnM2a0lUSVkyYnBPV0NQdEZPakY2SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756828);
INSERT INTO `sessions` VALUES('kz2Np0ynr8E7Wts8zuxdLClHW7AmLRfglsgfHMf1', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZG1EYkcwQndiTE83bFplMGZpM01BN0d2M1ZWWG1QdmZSaENLUXp6VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756721);
INSERT INTO `sessions` VALUES('lRSMeft1Qn8qyYtYJrD9LaSZx3ji1BEkTiOS2czX', NULL, '51.222.253.16', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkVuV1hPaVVvVGk3Ujg1ck5Fb3BQRGdJTU1GTEZaUkZOVEFBMzZkSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vd3d3LnF1YWRhY3Nhbi5jb20vZHVvbmctdGhvLW1hdC1taWEtbmdoaWEtZGFuLW5naGUtYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753750472);
INSERT INTO `sessions` VALUES('lvcuFwQVRlBlMhyOfsldXP2n9THVzY7gAXHfpkGI', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclJsZFQ2STR3bTY1dUxYQmc4eTNXa2Q2RUloS3BzM3JTbk9FMG5iQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756726);
INSERT INTO `sessions` VALUES('mhL2dkyWXZziSNHW9lEnK89pmM6Xnhd6zu2Zy51m', NULL, '196.251.70.223', 'Mozilla/5.0 (OS/2; Warp 4.5; rv:24.0) Gecko/20100101 Firefox/24.0 SeaMonkey/2.21', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG1Ia3BNekljTzJSVmhBc0gyZEU5OFNxbDhOM3lPTlE0SnMxelM5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS8uZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753752547);
INSERT INTO `sessions` VALUES('N9Gqb4KDk1l1NTLWSoGcjXYkI66BGruHSxnOliCD', NULL, '43.135.138.128', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDRyMmlRSElsangyQm9JbHVRVUFrMG9qSlZWb3NhVk1zRzhncXV6SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly93d3cucXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753757371);
INSERT INTO `sessions` VALUES('nCxmCFRwVfRrK1SKSXTkC7iUhQvEdZU6XrBd6BWh', NULL, '185.191.171.1', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWdUU0piTHVGTVVpWHQ2dDRxUmM4RElSN2VOeWFSU2N6OEdCRVFKbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9tYW0tY2F5LWtpbS1zb24tbmluaC1iaW5oIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751656);
INSERT INTO `sessions` VALUES('nhz5qXSWw7cUDXQ5dsYbWRMj5bJLXFED2dkdVrcA', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaFUwMHNGUHhza1E0RFZKWmdmVWs4WEhaakYwNFhSRVJoajBmYXJSSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756725);
INSERT INTO `sessions` VALUES('qmFncaJccRMAsQz2PCAA9rt7AqzNGpK9HOlVDurq', NULL, '17.241.227.51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnY1S2lSTVlRVUloZ0szeERxNGY2d2Z1SnBySUhRNDJoY2hsdm1PUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9xdWFkYWNzYW4uY29tL3JvYm90cy50eHQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753756827);
INSERT INTO `sessions` VALUES('rr1fuA1TJOunigkuIpVy7OtfGosfoZTi78qxKcWH', NULL, '17.241.227.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDl5TzRldDNpYnlyU2FUZ0ViZmdHT2IyRU5ienhwYURHTG10REhJaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753752174);
INSERT INTO `sessions` VALUES('svK3TCWldBRVBTKk6cIrkMIuUG7CD5LhTzmR9zwZ', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUXJLaEdwQUk3ZXdzcFN5REphNFdsQ2QxUmZsUnYzYkRHZXFsdnh2MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756727);
INSERT INTO `sessions` VALUES('t9iyIbPGz0WkhJiAu464t0ZIYVQed7Uc42tDDl72', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNHNnMHBCbmtGQnZZMWJ6cmo5WXdGVThPMXJMSHRZdm9ha0p3TTFqSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756719);
INSERT INTO `sessions` VALUES('tx87WdRIZK7vS48wG7GubqjWbXbBoajqB89PJulE', NULL, '20.171.207.121', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEU5bEt2VVZWak1JQWloUE5NclRyVk5xQmhPTzlsMUJrUExhN011RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9taW5pc2VhcmNoIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756944);
INSERT INTO `sessions` VALUES('uilZBa8eNtBkHwGhfeWOkealw5VaF4Bafbzexc1v', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSExYamtTYmJ2a1BNcU50eEpud2JzMTlRVjlkdExnY3NuOUNJQzNaUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756728);
INSERT INTO `sessions` VALUES('VgQLU65swCrGtUtvHOKNd5S16XrDpboJv3EbFpKL', NULL, '51.222.253.8', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkd6QUZ3VTRCd0p5NGpnZVFhWld2UUI1eGlscXRHam8yTXIzamZPWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vd3d3LnF1YWRhY3Nhbi5jb20vZ2lvLWJlLWJhcC1uYW0tZGFuLW5naGUtYW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753754866);
INSERT INTO `sessions` VALUES('vIVUjR0LGeFpZlgPoMEe8fAB43AVpZlJqZuOFOWX', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTRNRDhoYk1BN0c2RmtTY3dvYkVuOFVmRHp1bVRud3lpbWliUzdmZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756722);
INSERT INTO `sessions` VALUES('VxNGduss8eZrBb31ZwpTswpZoUPbYcfmYw821yg1', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidnJVemFjNGFmdmRaa1pFTmNQeUZ5OWR4cXQ2b2pZbTByNXlSb2YyNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756723);
INSERT INTO `sessions` VALUES('WDBvaOvHjun0YhhvGPZ8oUxkzbITuIjqm6JFcVSH', NULL, '20.97.189.101', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko); compatible; ChatGPT-User/1.0; +https://openai.com/bot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmVHSmFHOVJ5ejFudVJkN1MzQ0ZOWG9NMDdVWVZuOHh4Vzd0RVZBQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbS9ydW91LWRlLW5lcC1raW0tc29uLW5pbmgtYmluaCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753754283);
INSERT INTO `sessions` VALUES('wh9GOiF3Mdb1gBVEApU99lA6QgQfn1Qm1HKuAAFD', NULL, '85.208.96.200', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1Q5ZUlETm9IY3JpN3ZpOExkRmprMzFrQ2JyZ0dVdnprQWticXJKMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753755753);
INSERT INTO `sessions` VALUES('wlasfXp9D2ZDlC6kqmf3dKopbWGPnbc1fuBH4JCm', NULL, '185.191.171.9', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFduWjVOV20wenE3aGR1NlFYSGpiTDB4eWh1bE9ZSVcwZTVKeHR5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753750942);
INSERT INTO `sessions` VALUES('WUtuc84Xn3oBwntJjwmRX7E4HScpYWEJ3Uv3wrz4', NULL, '196.251.70.223', 'Mozilla/5.0 (iPod; U; CPU iPhone OS 2_2_1 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5H11a Safari/525.20', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHZ4VVdEd3hjY05XMXQ2VHpkclR5SkQwWnJtNWZkRDRoUkoxQnU4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9tYWlsLnF1YWRhY3Nhbi5jb20vLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753751599);
INSERT INTO `sessions` VALUES('WVuhK47cKIoapdl0wM6zUtB0WhpZ1aV6nwZyoPY6', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTDRMZkNlcGRLRThWSWZHSmlLSkNKVG4zbjVaV0lGZUU1V0gxeXlJZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756721);
INSERT INTO `sessions` VALUES('xl7zanXbHvAgQYvi94HQuUrMzrRBEwvfreZn3sDt', NULL, '34.74.78.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQVNiT2lUUEVHVkFDQ3hWbUhLNnRMWGVFa0MzcU9sYTNJTzZWMkxXRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753756725);
INSERT INTO `sessions` VALUES('xZ0jdh2T4GH9vbW7xKpxZ0qwZ1PnC6aT43eRmLFO', NULL, '136.144.19.250', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFdyWjNraDRQV1FYTVg2Q3RxSzBKSmNmRUY2VUk0b29LWW80NFZSdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9xdWFkYWNzYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753751920);
INSERT INTO `sessions` VALUES('zfVydWhXGFMcq3lXyp3vbRPnFmzSSwX6Hk610W5F', NULL, '4.227.36.42', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVllvaDlEekpBcjJuY0tHUnpLcThIaUdxaTMxaWc3TURTRnFSNDZXQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcXVhZGFjc2FuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753756476);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taggables`
--

INSERT INTO `taggables` VALUES(1, 1, 1, 'App\\Models\\News', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` VALUES(1, 'Ẩm thực Việt Nam', 'am-thuc-viet-nam', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagecode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `popup` tinyint(4) DEFAULT '0',
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` VALUES(2, 'Xuân Hương Food', NULL, NULL, NULL, NULL, 'banner2_1.jpg', 1, 0, 2, 2, 1, NULL, NULL);
INSERT INTO `tbl_banner` VALUES(4, 'Quà đặc sản', NULL, NULL, NULL, NULL, 'banner1_1.jpg', 1, 0, 2, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companyinfo`
--

CREATE TABLE `tbl_companyinfo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_companyinfo`
--

INSERT INTO `tbl_companyinfo` VALUES(1, 'Map', 'map', 'https://maps.app.goo.gl/zbAfDhw8WGPKupaTA', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.626607876963!2d106.7536265!3d10.839860299999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527b78407ceb5%3A0xc0c1fa7a41259357!2zNjkgxJDGsOG7nW5nIFPhu5EgNSwgVHLGsOG7nW5nIFRo4buNLCBUaOG7pyDEkOG7qWMsIEjhu5MgQ2jDrSBNaW5o!5e0!3m2!1sen!2s!4v1736758405682!5m2!1sen!2s\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', NULL, NULL, 2, 1, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(2, 'Địa chỉ', 'address', 'https://maps.app.goo.gl/zbAfDhw8WGPKupaTA', '69 Đường Số 5, Khu Phố 10, Phường Trường Thọ, TP. Thủ Đức, TP. HCM', NULL, NULL, 2, 2, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(3, 'Email', 'email', 'mailto:quadacsan.com@gmail.com', 'quadacsan.com@gmail.com', NULL, NULL, 2, 3, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(4, 'Website', 'website', 'https://quadacsan.com', 'quadacsan.com', NULL, NULL, 2, 4, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(5, 'Điện thoại', 'phone', 'tel:0845168768', '(+84) 845 168 768', NULL, NULL, 2, 5, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(6, 'MST', 'mst', NULL, NULL, NULL, NULL, 2, 6, 0, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(7, 'QUÀ ĐẶC SẢN', 'companyname', NULL, 'QUÀ ĐẶC SẢN', NULL, NULL, 2, 7, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(8, 'Hotline', 'hotline', 'tel:0845168768', 'Tư vấn ngay: 0845 168 768', NULL, NULL, 2, 8, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(9, 'Zalo', 'zalo', '0845168768', '0845168768', NULL, NULL, 2, 9, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(10, 'Facebook', 'facebook', 'https://www.facebook.com/profile.php?id=61571829891242', NULL, NULL, NULL, 2, 10, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(11, 'Thông tin tài khoản', 'bank', NULL, 'Thông tin chuyển khoản:<br>\r\nChủ Tài khoản:  <br>\r\nSố tài khoản:  <br>\r\nNgân hàng:  <br>', NULL, NULL, 2, 11, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(12, 'Pinterest', 'pinterest', NULL, NULL, '', NULL, 2, 12, 1, NULL, NULL);
INSERT INTO `tbl_companyinfo` VALUES(13, 'Twitter', 'twitter', NULL, NULL, '', NULL, 2, 13, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_function`
--

CREATE TABLE `tbl_function` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controlleract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_vn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `function_tab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_grant` tinyint(4) NOT NULL DEFAULT '0',
  `isshow` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_function`
--

INSERT INTO `tbl_function` VALUES(1, 'user-icon.png', NULL, NULL, '', 'System', 'Hệ thống', NULL, 'root', NULL, 0, 1, 0, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(2, 'tintuc_items.png', NULL, NULL, NULL, NULL, 'Tin tức', NULL, 'root', NULL, 0, 1, 0, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(3, 'product.png', NULL, NULL, NULL, NULL, 'Sản phẩm', NULL, 'root', NULL, 0, 1, 0, '2022-07-08 03:00:00', '2022-07-08 03:00:00');
INSERT INTO `tbl_function` VALUES(4, 'account-icon.png', NULL, NULL, NULL, NULL, 'Quản lý bán hàng', NULL, 'root', NULL, 0, 1, 0, NULL, NULL);
INSERT INTO `tbl_function` VALUES(5, 'report-icon.png', NULL, NULL, NULL, NULL, 'Báo cáo', NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `tbl_function` VALUES(10, 'tienich_items.png', NULL, NULL, NULL, NULL, 'Tiện ích', NULL, 'root', NULL, 1, 1, 0, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(11, 'tonghop_items.png', NULL, NULL, '', 'Tổng hợp', 'Tổng hợp', NULL, 'root', NULL, 0, 1, 0, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(101, NULL, 'UserpermissionController@index', 'userpermission', 'any', 'User Permission', 'Phân quyền', NULL, 'user-permission', 'admin.permission.index', 1, 1, 1, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(102, NULL, 'UsermanagerController@index', 'userlist', 'any', 'User List', 'Danh sách người dùng', NULL, 'user-list', 'admin.usermanager.index', 1, 1, 1, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(103, NULL, 'MailManagerController@index', 'mailmanager', 'any', 'Mail Manager', 'Quản lý mail', NULL, 'mail-manager', 'admin.mailmanager.index', 1, 1, 1, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(104, NULL, 'PaggingController@index', 'pagging', 'any', 'pagging', 'Phân trang', NULL, 'pagging', 'admin.pagging.index', 1, 1, 1, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(105, NULL, 'ChangePassWordController@showchangepass', 'changepass', 'get', 'Change Password', 'Đổi mật khẩu', NULL, 'change-pass', 'admin.showchangepass', 1, 1, 1, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(201, NULL, 'NewsTypeController@index', 'catnews', 'any', NULL, 'Loại tin tức', NULL, 'news', 'admin.news.index', 1, 1, 2, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(202, NULL, 'NewsController@index', 'news', 'any', NULL, 'Tin tức', NULL, 'news', 'admin.news.detail', 1, 1, 2, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(301, NULL, 'ProductCatController@index', 'category', 'any', NULL, 'Loại sản phẩm', NULL, 'product', 'admin.product.category', 1, 1, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(302, NULL, 'ProductController@index', 'product', 'any', NULL, 'Thông tin sản phẩm', NULL, 'product', 'admin.product.product', 1, 1, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(303, '', 'ProductPhotoController@index', 'productphoto/{id?}', 'any', NULL, 'Hình sản phẩm', NULL, 'product', 'admin.product.photo', 0, 0, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(304, '', 'ProductDetailController@index', 'productdetail/{id?}', 'any', NULL, 'Sản phẩm chi tiết', NULL, 'PRODUCT', 'admin.product.detail', 0, 0, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(401, NULL, 'ProductOrderController@index', 'orderlist', 'any', NULL, 'Đơn hàng', NULL, 'ORDER', 'admin.product.orderlist', 1, 1, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(402, NULL, 'CheckOrderController@delivery', 'delivery', 'any', NULL, 'Kiểm tra giao hàng', NULL, 'ORDER', 'admin.product.delivery', 1, 1, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(404, NULL, 'ProductImExportController@import', 'import', 'any', NULL, 'Nhập hàng', 'Nhập hàng', 'PRODUCT', 'admin.product.import', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(405, NULL, 'AgentController@index', 'agentlist', 'any', NULL, 'Danh sách đối tác', NULL, 'AGENT', 'admin.agentlist.index', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(406, NULL, 'ProductOrderController@ajaxsearchagent', 'searchagent/{name?}', 'get', NULL, 'Ajax tìm đối tác', NULL, 'ORDER', 'admin.product.searchagent', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(407, NULL, 'ProductOrderController@getorderdetail', 'getorderdetail/{id?}', 'get', NULL, 'Ajax get order', NULL, 'ORDER', 'admin.product.getorderdetail', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(408, NULL, 'ProductOrderController@exportproduct', 'exportproduct', 'post', NULL, 'Xuất hàng', NULL, 'ORDER', 'admin.product.exportproduct', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(410, NULL, 'ProductOrderController@getdeleteorder', 'getdeleteorder/{id?}', 'get', NULL, 'Lấy hàng trả', NULL, 'ORDER', 'admin.product.getdeleteorder', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(415, '', 'ShipperController@index', 'shipper', 'any', NULL, 'Nhân viên giao hàng', NULL, 'ORDER', 'admin.product.shipper', 1, 1, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(420, NULL, 'AgentLevelController@index', 'agentlevel', 'any', NULL, 'Loại đối tác', NULL, 'AGENT', 'admin.agentlevel.index', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(421, '', 'ProductOrderStatusController@index', 'productorderstatus', 'any', NULL, 'Trạng thái đơn hàng', NULL, 'PRODUCT', 'admin.productorderstatus.index', 1, 1, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(422, NULL, 'TransportFeeController@index', 'transportfee', 'any', NULL, 'Phí vận chuyển', NULL, 'product', 'admin.transportfee.index', 1, 1, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1001, NULL, 'ContactMailController@index', 'contact-mail', 'any', 'Contact mail list', 'Danh sách mail liên hệ', NULL, 'contact-mail', 'admin.contactmail.index', 1, 1, 10, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1002, NULL, 'ConfigMailSMTPController@index', 'config-mailsmtp', 'any', 'Config mail smtp', 'Cấu hình mail smtp', NULL, 'config-mailsmtp', 'admin.configmailsmtp.index', 1, 1, 10, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1101, NULL, 'AboutusController@index', 'about-us', 'any', 'About us', 'Giới thiệu', NULL, 'aboutus', 'admin.aboutus.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1102, NULL, 'BannerTypeController@index', 'banner-type/{str?}', 'any', 'Banner', 'Banner', NULL, 'banner', 'admin.banner.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1103, NULL, 'BannerController@index', 'banner/{id?}', 'any', 'Banner', 'Banner', NULL, 'banner', 'admin.banner.detail', 0, 0, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1104, NULL, 'MetaHeaderController@index', 'metaheader', 'any', 'Meta Tag', 'Meta Tag', NULL, 'meta-tag', 'admin.metaheader.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1105, NULL, 'CompanyInfoController@index', 'companyinfo', 'any', 'Company Information', 'Thông tin công ty', NULL, 'company-info', 'admin.companyinfo.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1106, NULL, 'StaticPageController@index', 'staticpage', 'any', 'Static page', 'Quản lý trang tĩnh', NULL, 'trang-tinh', 'admin.staticpage.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1107, NULL, 'StaticPageController@download', 'staticpagedownload/{id?}', 'get', 'download', 'download', NULL, 'download', 'admin.staticpage.download', 0, 0, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1108, NULL, 'AdvertisementController@index', 'advertisement', 'any', 'Advertisement', 'Quảng cáo', NULL, 'advertisement', 'admin.advertisement.index', 1, 1, 11, '2022-06-26 17:41:31', '2022-06-26 17:41:31');
INSERT INTO `tbl_function` VALUES(1109, '', 'ReviewsController@index', 'reviews', 'any', NULL, 'Chia sẻ của khách hàng', NULL, 'reviews', 'admin.reviews.index', 1, 1, 11, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1112, NULL, 'CheckOrderController@delivered', 'delivered', 'any', NULL, 'Đơn hàng đã giao', NULL, 'ORDER', 'admin.product.delivered', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1113, NULL, 'AgentCommissionController@index', 'agentcommission', 'any', NULL, 'Thanh toán chiết khấu', NULL, 'AGENT', 'admin.agent.agentcommission', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1114, NULL, NULL, NULL, NULL, NULL, 'Tồn kho', NULL, NULL, NULL, 0, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1115, NULL, 'CheckOrderController@debt', 'debt', 'any', NULL, 'Công nợ', NULL, 'ORDER', 'admin.product.debt', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1116, NULL, 'CheckOrderController@sales', 'sales', 'any', NULL, 'Doanh thu', NULL, 'ORDER', 'admin.product.sales', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1117, '', 'ProductImExportController@export', 'export', 'get', NULL, 'Xuất hàng', NULL, 'ORDER', 'admin.product.export', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1118, '', 'ProductImExportController@tonkho', 'tonkho', 'any', NULL, 'Tồn kho', NULL, 'ORDER', 'admin.product.tonkho', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1119, NULL, 'CheckOrderController@profit', 'profit', 'any', NULL, 'Lợi nhuận', NULL, 'ORDER', 'admin.product.profit', 1, 1, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1120, NULL, 'CheckOrderController@feeship', 'feeship', 'any', NULL, 'Thu phí ship', NULL, NULL, 'admin.product.feeship', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1121, NULL, 'CheckOrderController@hasUNC', 'unc', 'get', NULL, 'UNC', NULL, 'ORDER', 'admin.product.unc', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1122, NULL, 'CheckOrderController@hasReturn', 'trahang', 'get', NULL, 'Danh sách yêu cầu trả hàng', NULL, 'ORDER', 'admin.product.productreturn', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1123, NULL, 'ProductOrderController@huytrahang', 'huytrahang', 'any', NULL, 'Phục hồi thao tác trả hàng', NULL, 'ORDER', 'admin.product.huytrahang', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1124, '', 'CheckOrderController@debtexcel', 'xuatcongno', 'get', NULL, 'Xuất excel công nợ', NULL, 'ORDER', 'admin.product.xuatcongno', 1, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1125, '', 'ProductOrderController@gethistory', 'gethistory/{id?}', 'any', NULL, 'Ajax lấy lịch sử đơn hàng', NULL, 'ORDER', 'admin.product.gethistory', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1126, '', 'CheckOrderController@salesexcel', 'xuatdoanhthu', 'get', NULL, 'Xuất excel doanh thu', NULL, 'ORDER', 'admin.product.xuatdoanhthu', 1, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1127, '', 'CheckOrderController@salesdetailexcel', 'xuatdoanhthuchitiet', 'get', NULL, 'Xuất excel doanh thu chi tiết', NULL, 'ORDER', 'admin.product.xuatdoanhthuchitiet', 1, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1128, 'staff-sales-1.png', NULL, NULL, NULL, NULL, 'Nhân viên kinh doanh', NULL, 'STAFF', NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1129, '', 'StaffOrderController@sales', 'staffsales', 'any', NULL, 'Doanh thu', NULL, 'STAFF', 'admin.staff.sales', 1, 1, 1128, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1130, '', 'StaffOrderController@staffsalesexcel', 'xuatdoanhthunv', 'get', NULL, 'Xuất excel doanh thu nhân viên', NULL, 'STAFF', 'admin.staff.xuatdoanhthunv', 1, 0, 1128, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1131, '', 'StaffOrderController@staffdetailexcel', 'xuatdoanhthunvchitiet', 'get', NULL, 'Xuất doanh thu nhân viên chi tiết', NULL, 'STAFF', 'admin.staff.xuatdoanhthunvchitiet', 1, 0, 1128, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1132, '', 'ProductImExportController@tonkhoexcel', 'xuattonkho', 'get', NULL, 'Xuất excel tồn kho', NULL, 'REPORT', 'admin.product.xuattonkho', 1, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1133, NULL, 'ProvinceController@index', 'province', 'any', NULL, 'Kho', NULL, 'PROVINCE', 'admin.province.index', 1, 0, 1, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1134, NULL, 'ProductCapacityController@index', 'procapacity', 'any', NULL, 'Trọng lượng', NULL, 'PRODUCT', 'admin.product.procapacity', 1, 1, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1135, NULL, 'ProductDatePackageController@index', 'prodatepackage', 'any', NULL, 'Phân loại', NULL, 'PRODUCT', 'admin.product.prodatepackage', 1, 1, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1136, NULL, 'ProductOrderController@deleteproductorder', 'deleteproductorder', 'post', NULL, 'Trả hàng', NULL, 'ORDER', 'admin.product.deleteproductorder', 0, 0, 4, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1137, NULL, 'ProductUpdatePriceController@index', 'updateprice', 'any', NULL, 'Chỉnh giá đồng loạt', NULL, 'PRODUCT', 'admin.product.updateprice', 1, 0, 3, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1138, '', 'ProductImExportController@soluongbanhangexcel', 'xuatsoluongbanhang', 'get', NULL, 'Xuất excel số lượng bán hàng', NULL, 'REPORT', 'admin.product.xuatsoluongbanhang', 1, 0, 5, NULL, NULL);
INSERT INTO `tbl_function` VALUES(1139, '', 'ProductImExportController@soluongbanhang', 'soluongbanhang', 'any', NULL, 'Số lượng bán hàng', NULL, 'REPORT', 'admin.product.soluongbanhang', 1, 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE `tbl_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` VALUES(2, 'Vietnam', 'vi', 'flags_vn.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mailmanager`
--

CREATE TABLE `tbl_mailmanager` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pagging`
--

CREATE TABLE `tbl_pagging` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numofpage` int(11) NOT NULL DEFAULT '1',
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pagging`
--

INSERT INTO `tbl_pagging` VALUES(1, 'Miền Bắc', 'product', 16, 2, 1, '2024-12-27 14:51:27', '2025-01-17 05:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `function_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_province`
--

CREATE TABLE `tbl_province` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` tinytext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_province`
--

INSERT INTO `tbl_province` VALUES(1, 'HCM', '<p>Thông tin chuyển khoản:<br />\r\nChủ Tài khoản: HAU VI TU<br />\r\nSố tài khoản: 619876<br />\r\nNgân hàng: ACB</p>', 'acb-hau-vi-tu.jpg', 1);
INSERT INTO `tbl_province` VALUES(2, 'Hà Nội', '<p>Thông tin chuyển khoản:<br />\r\nChủ Tài khoản: HAU VI TU<br />\r\nSố tài khoản: 19023699247015<br />\r\nNgân hàng: TECHCOMBANK</p>', 'logo.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `star_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipper`
--

CREATE TABLE `tbl_shipper` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT '1',
  `priority` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staticpage`
--

CREATE TABLE `tbl_staticpage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagecode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htmlfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` int(11) NOT NULL DEFAULT '1',
  `isdefault` tinyint(4) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_staticpage`
--

INSERT INTO `tbl_staticpage` VALUES(1, 'VỀ CHÚNG TÔI', NULL, 'gioithieu', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 0, 1, '2022-07-24 03:01:57', '2025-01-13 16:18:10');
INSERT INTO `tbl_staticpage` VALUES(2, 'Chính sách bảo mật', NULL, 'chinh-sach-bao-mat-thong-tin-khach-hang', NULL, NULL, '', NULL, NULL, NULL, 2, 5, 0, 1, '2022-07-24 07:19:02', '2025-01-13 16:18:31');
INSERT INTO `tbl_staticpage` VALUES(3, 'Chính sách mua hàng', NULL, 'chinh-sach-mua-hang', NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, 0, 1, '2022-07-24 07:19:37', '2025-01-13 16:18:46');
INSERT INTO `tbl_staticpage` VALUES(4, 'Phương thức thanh toán', NULL, 'phuong-thuc-thanh-toan', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 0, 1, '2023-09-27 10:27:21', '2025-01-13 16:19:02');
INSERT INTO `tbl_staticpage` VALUES(5, 'Hướng dẫn đặt hàng', NULL, 'huong-dan-dat-hang', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 0, 1, '2023-09-27 10:28:21', '2025-01-13 16:20:42');
INSERT INTO `tbl_staticpage` VALUES(6, 'Phương thức giao hàng', NULL, 'phuong-thuc-giao-hang', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 0, 1, '2023-09-27 10:33:56', '2025-01-13 16:19:13');
INSERT INTO `tbl_staticpage` VALUES(7, 'Đăng ký tài khoản thành công', NULL, 'thanhcong', NULL, '<div class=\"offset-md-2 col-lg-8\">\r\n<p>Chúc mừng bạn đã đăng ký tài khoản thành công!</p>\r\n\r\n<p>Bạn đã gia nhập Quà Đặc Sản và có thể bắt đầu những món ngon từ các vùng miền. Bây giờ, bạn có thể dễ dàng theo dõi lịch sử mua hàng, nhận những ưu đãi đặc biệt và các khuyến mãi độc quyền dành riêng cho thành viên. Hãy khám phá thêm nhiều sản phẩm và dịch vụ hấp dẫn để tối ưu hóa trải nghiệm mua sắm của bạn!</p>\r\n\r\n<p>Chân thành cảm ơn bạn đã tin tưởng và đồng hành cùng chúng tôi.</p>\r\n\r\n<p>Trân trọng!</p>\r\n\r\n<p>QUÀ ĐẶC SẢN</p>\r\n</div>', '', NULL, NULL, NULL, 2, 6, 0, 1, '2025-02-16 15:30:22', '2025-02-16 15:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` int(11) NOT NULL,
  `inv_code` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `vpc_MerchTxnRef` varchar(255) NOT NULL,
  `txnResponseCode` varchar(255) DEFAULT NULL,
  `transactionNo` varchar(255) DEFAULT NULL,
  `transStatus` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_fee`
--

CREATE TABLE `transport_fee` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` int(4) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '2',
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_fee`
--

INSERT INTO `transport_fee` VALUES(1, 'Đơn ít hơn 500.000đ phí giao hàng là:', 25000, 2, 1, 1);
INSERT INTO `transport_fee` VALUES(2, 'Miễn phí giao hàng đơn từ 500.000đ', 0, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isadmin` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT '1',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'Administrator', 'administrator', 'Sw1zizEJsdJofVCDuP8ZHuQ5gQFHy0OanLjrzf58.jpg', 1, 'tuancsharp@gmail.com', '091810000', '103 pasteur p Bến Nghé Q1 TPHCM', 1, 1, '2022-06-27 07:41:31', '$2y$12$G9BsPlZAfvlAaK5H7FONvOlKVUwbTDjTt9P8yjXkg6mj4Ojs332PO', 'EqMi1jHqKuzltnYZTFEiEdsJLvevYMIfhqmHtAlztVmJzYiWetlgKgMcq8yv', '2022-06-27 07:41:31', '2025-01-14 13:14:39');
INSERT INTO `users` VALUES(2, 'Giao hàng', 'shipper', 'shipper.jpg', 0, 'ntkl77@gmail.com', '0908136476', NULL, 1, 1, NULL, '$2y$10$SYf86U0fnTBSGyOAQvesNuZfxGWqaVvzlL8z0K2Qd8bRz2PPj/OAW', NULL, '2023-03-07 10:54:37', '2024-11-10 12:08:25');
INSERT INTO `users` VALUES(3, 'Nguyễn Khánh Duy', 'SEO', 'icon-user.jpg', 0, 'duynguyen5589@gmail.com', NULL, NULL, 2, 1, NULL, '$2y$10$fgc4A/Dt0IEpm51k/v5.Q.kPXAeSsKE1QEKV3FAGJmZMa72vroSTm', NULL, '2023-03-14 10:05:28', '2024-12-02 12:31:59');
INSERT INTO `users` VALUES(4, 'Admin', 'admin', NULL, 0, 'apttgolf@gmail.com', NULL, NULL, 2, 1, NULL, '$2y$10$3hxZZWAlgo9ZCNWD5Pfx.eiNAAub/JN7cMdzgOAvwcLlW7LTORure', NULL, '2023-04-25 11:52:08', '2024-11-10 12:07:41');
INSERT INTO `users` VALUES(5, 'a.Tiến', 'a.Tiến', '', 0, 'chuongtien2020@gmail.com', '0773999770', NULL, 1, 1, NULL, '$2y$10$6U7Tu47vPJL4NkGHwTCvPObTbkS7qxQCagzufiuEmkvn5QKtMCRNm', NULL, '2023-05-13 09:12:32', '2023-05-13 09:12:32');
INSERT INTO `users` VALUES(6, 'HIẾU VŨ', 'HIEU HIEU', '', 0, 'vt.hieu1991@gmail.com', '0903882224', NULL, 1, 1, NULL, '$2y$10$3fElEh19elZ4q.IRRMEy/ukfb87B9J88yiiuWm8GlO./M2beWHakG', NULL, '2023-06-21 15:26:15', '2023-06-29 11:25:18');
INSERT INTO `users` VALUES(7, 'chị vy', 'vyvu', '', 0, 'nghivu07@yahoo.com.vn', '0906400018', NULL, 1, 1, NULL, '$2y$10$7TqG30UfaOBT/jLQu2pDs.tYjlQvryY39Ws7Pfz/fkZXC2QFvk.2i', NULL, '2023-11-27 06:26:58', '2023-11-27 06:26:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_commission`
--
ALTER TABLE `agent_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_level`
--
ALTER TABLE `agent_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_type`
--
ALTER TABLE `banner_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `config_mailsmtp`
--
ALTER TABLE `config_mailsmtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_mail`
--
ALTER TABLE `contact_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_header`
--
ALTER TABLE `meta_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_cat`
--
ALTER TABLE `news_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_request`
--
ALTER TABLE `order_request`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `product_capacity`
--
ALTER TABLE `product_capacity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_cat`
--
ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_datepackage`
--
ALTER TABLE `product_datepackage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_imexport`
--
ALTER TABLE `product_imexport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_imexport_history`
--
ALTER TABLE `product_imexport_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orderdetail`
--
ALTER TABLE `product_orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_history`
--
ALTER TABLE `product_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_return`
--
ALTER TABLE `product_order_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_status`
--
ALTER TABLE `product_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_unc`
--
ALTER TABLE `product_order_unc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_photo`
--
ALTER TABLE `product_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`pro_id`);

--
-- Indexes for table `product_price_history`
--
ALTER TABLE `product_price_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_pro`
--
ALTER TABLE `product_pro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_language`
--
ALTER TABLE `route_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_companyinfo`
--
ALTER TABLE `tbl_companyinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_function`
--
ALTER TABLE `tbl_function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mailmanager`
--
ALTER TABLE `tbl_mailmanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pagging`
--
ALTER TABLE `tbl_pagging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_province`
--
ALTER TABLE `tbl_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shipper`
--
ALTER TABLE `tbl_shipper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staticpage`
--
ALTER TABLE `tbl_staticpage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_fee`
--
ALTER TABLE `transport_fee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `agent_commission`
--
ALTER TABLE `agent_commission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_level`
--
ALTER TABLE `agent_level`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner_type`
--
ALTER TABLE `banner_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `config_mailsmtp`
--
ALTER TABLE `config_mailsmtp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_mail`
--
ALTER TABLE `contact_mail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news_cat`
--
ALTER TABLE `news_cat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_capacity`
--
ALTER TABLE `product_capacity`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product_cat`
--
ALTER TABLE `product_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_datepackage`
--
ALTER TABLE `product_datepackage`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product_imexport`
--
ALTER TABLE `product_imexport`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_imexport_history`
--
ALTER TABLE `product_imexport_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_orderdetail`
--
ALTER TABLE `product_orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_order_history`
--
ALTER TABLE `product_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_order_return`
--
ALTER TABLE `product_order_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_order_status`
--
ALTER TABLE `product_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_order_unc`
--
ALTER TABLE `product_order_unc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_photo`
--
ALTER TABLE `product_photo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=893;

--
-- AUTO_INCREMENT for table `product_price_history`
--
ALTER TABLE `product_price_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_pro`
--
ALTER TABLE `product_pro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `route_language`
--
ALTER TABLE `route_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_companyinfo`
--
ALTER TABLE `tbl_companyinfo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_function`
--
ALTER TABLE `tbl_function`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1140;

--
-- AUTO_INCREMENT for table `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_mailmanager`
--
ALTER TABLE `tbl_mailmanager`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pagging`
--
ALTER TABLE `tbl_pagging`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_province`
--
ALTER TABLE `tbl_province`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shipper`
--
ALTER TABLE `tbl_shipper`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_staticpage`
--
ALTER TABLE `tbl_staticpage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_fee`
--
ALTER TABLE `transport_fee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO system_setting (setting_key, value, description, category, updated_by)
VALUES ('site_name', 'Taste of Home', 'The name of the site', 'general', 1);

CREATE TABLE `support_requests` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(255) NOT NULL,
  `customer_email` VARCHAR(255) NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL,
  `order_id` BIGINT UNSIGNED DEFAULT NULL,
  `screenshot_url` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;