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
-- Table structure for table `system_setting`
--

CREATE TABLE system_setting (
  id INT AUTO_INCREMENT PRIMARY KEY,
  setting_key VARCHAR(100) NOT NULL,
  value VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(50),
  updated_by INT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
INSERT INTO `product_photo` VALUES(475, 4, 'bot-san-day-kim-son-ninh-binh', '2_6.png', 1);
INSERT INTO `product_photo` VALUES(476, 4, 'bot-san-day-kim-son-ninh-binh', '3_7.png', 2);
INSERT INTO `product_photo` VALUES(477, 4, 'bot-san-day-kim-son-ninh-binh', '4_6.png', 3);
INSERT INTO `product_photo` VALUES(478, 4, 'bot-san-day-kim-son-ninh-binh', 'bot-san-day-kim-son-ninh-binh.png', 4);
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

-- Add role column in users table
ALTER TABLE users
ADD COLUMN role ENUM('customer', 'staff', 'manager', 'admin') 
NOT NULL DEFAULT 'customer';
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