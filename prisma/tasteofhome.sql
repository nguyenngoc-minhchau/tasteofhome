-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 24, 2025 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tasteofhome`
--

-- --------------------------------------------------------
CREATE DATABASE tasteofhome CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tasteofhome;
--
-- Cấu trúc bảng cho bảng `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `re_name` varchar(255) NOT NULL,
  `isdefault` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advertisement`
--

CREATE TABLE `advertisement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `new_tab` tinyint(4) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `group` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `agents`
--

CREATE TABLE `agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level_id` tinyint(4) NOT NULL DEFAULT 0,
  `commission` tinyint(4) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `isstaff` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `agent_commission`
--

CREATE TABLE `agent_commission` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `commission` double DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `agent_level`
--

CREATE TABLE `agent_level` (
  `id` int(10) UNSIGNED NOT NULL,
  `levelname` varchar(191) NOT NULL,
  `pricepercent` tinyint(4) NOT NULL DEFAULT 1,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `attachmentable_id` int(11) DEFAULT NULL,
  `attachmentable_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner_type`
--

CREATE TABLE `banner_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 2 COMMENT '1=>video, 2=>image',
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(190) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(190) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `config_mailsmtp`
--

CREATE TABLE `config_mailsmtp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_host` varchar(255) NOT NULL,
  `mail_port` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_mail`
--

CREATE TABLE `contact_mail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(190) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(190) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(190) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meta_header`
--

CREATE TABLE `meta_header` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `script` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `language_id` tinyint(4) DEFAULT 2,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `brief` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `re_name` varchar(255) NOT NULL,
  `ishot` tinyint(4) NOT NULL DEFAULT 0,
  `isdefault` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `activedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `news_cat`
--

CREATE TABLE `news_cat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `re_name` varchar(255) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `orderid` varchar(190) DEFAULT NULL,
  `qrcodeimg` varchar(255) DEFAULT NULL,
  `iccid` varchar(50) DEFAULT NULL,
  `smdpaddress` varchar(200) DEFAULT '1',
  `pin` varchar(50) DEFAULT NULL,
  `puk` varchar(50) DEFAULT NULL,
  `activationcode` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_request`
--

CREATE TABLE `order_request` (
  `orderid` varchar(190) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `trackid` varchar(100) DEFAULT NULL,
  `subtrackid` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `procode` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(190) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_capacity`
--

CREATE TABLE `product_capacity` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_capacity`
--

INSERT INTO `product_capacity` (`id`, `title`, `priority`) VALUES
(1, '50gr', 1),
(2, '100gr', 4),
(3, '500gr', 16),
(4, '1kg', 18),
(5, '250gr', 10),
(6, '200gr', 8),
(7, '500ml', 20),
(8, '300gr', 11),
(9, '600gr', 17),
(10, '1 lít', 21),
(11, '400gr', 13),
(12, '52gr', 2),
(13, '105gr', 5),
(14, '1 cái', 24),
(15, '1 hộp', 23),
(16, '1 túi', 22),
(17, '1.5kg', 19),
(18, '150gr', 7),
(19, '120gr', 6),
(20, '390gr', 12),
(21, '220gr', 9),
(22, '435gr', 14),
(23, '95gr', 3),
(24, '460gr', 15),
(25, 'Hấp lá tía tô', 25),
(26, 'Hấp sả', 26),
(27, 'Hấp lá chanh', 27),
(28, 'Nướng chao', 28),
(29, 'Nướng ngũ vị', 29),
(30, 'Nướng mọi', 30),
(31, 'Nướng sa tế', 31),
(32, 'Xào lăn', 32),
(33, '1 Gói', 33),
(34, 'Nướng mè', 34);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_cat`
--

CREATE TABLE `product_cat` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `re_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `brief` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tips` text DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `isnew` tinyint(4) NOT NULL DEFAULT 0,
  `ishot` tinyint(4) NOT NULL DEFAULT 0,
  `isactive` tinyint(2) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_cat`
--

INSERT INTO `product_cat` (`id`, `title`, `re_name`, `image`, `brief`, `content`, `tips`, `tag`, `keyword`, `meta_description`, `parent_id`, `language_id`, `isnew`, `ishot`, `isactive`, `priority`) VALUES
(1, 'Miền Bắc', 'mien-bac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 1),
(2, 'Miền Trung', 'mien-trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 2),
(3, 'Miền Nam', 'mien-nam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 3),
(4, 'Nước Ngoài', 'nuoc-ngoai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, 0, 1, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_datepackage`
--

CREATE TABLE `product_datepackage` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_datepackage`
--

INSERT INTO `product_datepackage` (`id`, `title`, `priority`) VALUES
(1, 'Bánh', 1),
(2, 'Gia vị', 2),
(3, 'Thực phẩm đông mát', 3),
(4, 'Bột', 4),
(5, 'Thức uống', 5),
(6, 'Mắm', 6),
(7, 'Thực phẩm chế biến sẵn', 7),
(8, 'Kẹo', 8),
(9, 'Giò chả', 9),
(10, 'Khô các loại', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_detail`
--

CREATE TABLE `product_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `capacity_id` tinyint(4) DEFAULT 0,
  `capacity` varchar(255) DEFAULT NULL,
  `price_im` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `price_discount` int(11) DEFAULT 0,
  `price_npp` int(11) DEFAULT 0,
  `price_daily` int(11) DEFAULT 0,
  `price_ctv` int(11) DEFAULT 0,
  `price_private` int(11) DEFAULT 0,
  `price_sale1` int(11) DEFAULT 0,
  `price_sale2` int(11) DEFAULT 0,
  `brief` text DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_detail`
--

INSERT INTO `product_detail` (`id`, `pro_id`, `code`, `capacity_id`, `capacity`, `price_im`, `price`, `price_discount`, `price_npp`, `price_daily`, `price_ctv`, `price_private`, `price_sale1`, `price_sale2`, `brief`, `priority`, `isactive`, `updated_at`, `created_at`) VALUES
(1, 40, 'MT-002-2', 13, NULL, 0, 13000, 0, 0, 13500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi có 35 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 105gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(2, 41, 'MT-003-2', 15, NULL, 0, 21500, 0, 0, 22000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(3, 52, 'MT-014-2', 8, NULL, 0, 47000, 0, 0, 49000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(4, 57, 'MT-019-2', 3, NULL, 0, 37000, 0, 0, 40000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(5, 58, 'MT-020-2', 3, NULL, 0, 87000, 0, 0, 90000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(6, 67, 'MT-029-2', 18, NULL, 0, 14000, 0, 0, 15000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(7, 70, 'MT-032-2', 9, NULL, 0, 75000, 0, 0, 77000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 600gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(8, 71, 'MT-033-2', 5, NULL, 0, 22000, 0, 0, 24000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(9, 71, 'MT-033-3', 8, NULL, 0, 27000, 0, 0, 29000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL),
(10, 18, 'MB-003-2', 22, NULL, 0, 45000, 0, 0, 47000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 435gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(11, 18, 'MB-003-3', 3, NULL, 0, 52000, 0, 0, 55000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL),
(12, 19, 'MB-005-2', 3, NULL, 0, 42000, 0, 0, 45000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 10 gói nhỏ/1 túi.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(13, 25, 'MN-03-2', 2, NULL, 0, 20000, 0, 0, 22000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 100gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 2, 1, NULL, NULL),
(14, 25, 'MN-03-3', 11, NULL, 0, 90000, 0, 0, 92000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng, trứng muối.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 3, 1, NULL, NULL),
(15, 25, 'MN-03-4', 24, NULL, 0, 92000, 0, 0, 95000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 460gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 4, 1, NULL, NULL),
(16, 25, 'MN-03-5', 3, NULL, 0, 95000, 86000, 0, 97000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 5, 1, NULL, NULL),
(17, 25, 'MN-03-1', 23, NULL, 0, 18000, 0, 0, 20000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 95gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(18, 77, 'MT-036-2', 3, NULL, 0, 380000, 0, 0, 385000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 2, 1, NULL, NULL),
(19, 77, 'MT-036-1', 2, NULL, 0, 82000, 0, 0, 85000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 1, 1, NULL, NULL),
(20, 78, 'MN-18-1', 2, NULL, 0, 45000, 0, 0, 47000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 1, 1, NULL, NULL),
(21, 78, 'MN-18-2', 3, NULL, 0, 195000, 0, 0, 199000, 0, 0, 0, 0, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối Lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', 2, 1, NULL, NULL),
(22, 18, 'MB-003-1', 21, NULL, 0, 25000, 0, 0, 27000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 220gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(23, 84, 'XH-002-1', 28, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL),
(24, 84, 'XH-002-2', 29, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL),
(25, 84, 'XH-002-3', 30, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL),
(26, 84, 'XH-002-4', 31, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL),
(27, 83, 'XH-001-1', 25, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL),
(28, 83, 'XH-001-2', 26, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL),
(29, 83, 'XH-001-3', 27, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL),
(30, 83, 'XH-001-4', 32, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL),
(31, 85, 'XH-003-1', 28, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL),
(32, 85, 'XH-003-2', 29, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL),
(33, 85, 'XH-003-3', 30, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL),
(34, 85, 'XH-003-4', 31, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL),
(35, 86, 'XH-004-1', 26, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL),
(36, 86, 'XH-004-2', 27, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL),
(37, 86, 'XH-004-3', 32, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL),
(38, 87, 'XH-005-1', 28, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 1, 1, NULL, NULL),
(39, 87, 'XH-005-2', 29, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 2, 1, NULL, NULL),
(40, 87, 'XH-005-3', 30, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 3, 1, NULL, NULL),
(41, 87, 'XH-005-4', 31, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 4, 1, NULL, NULL),
(43, 19, 'MB-005-1', 11, NULL, 0, 37000, 0, 0, 39000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Bịch 400gr gồm 10 gói nhỏ.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(44, 40, 'MT-002-1', 12, NULL, 0, 7000, 0, 0, 7500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi có 20 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 52gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(45, 41, 'MT-003-1', 33, NULL, 0, 6300, 0, 0, 6500, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 gói 80gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:&nbsp;</strong>Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(46, 52, 'MT-014-1', 18, NULL, 0, 23000, 0, 0, 25000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(47, 57, 'MT-019-1', 5, NULL, 0, 23000, 0, 0, 25000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL);
INSERT INTO `product_detail` (`id`, `pro_id`, `code`, `capacity_id`, `capacity`, `price_im`, `price`, `price_discount`, `price_npp`, `price_daily`, `price_ctv`, `price_private`, `price_sale1`, `price_sale2`, `brief`, `priority`, `isactive`, `updated_at`, `created_at`) VALUES
(48, 58, 'MT-020-1', 5, NULL, 0, 45000, 0, 0, 48000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(49, 67, 'MT-029-1', 19, NULL, 0, 11000, 0, 0, 12000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 120gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(50, 70, 'MT-032-1', 20, NULL, 0, 55000, 0, 0, 57000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 390gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(51, 71, 'MT-033-1', 6, NULL, 0, 17000, 0, 0, 18000, 0, 0, 0, 0, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', 1, 1, NULL, NULL),
(52, 84, 'XH-002-5', 34, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL),
(53, 85, 'XH-003-5', 34, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL),
(54, 87, 'XH-005-5', 34, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_imexport`
--

CREATE TABLE `product_imexport` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `imexport` tinyint(4) NOT NULL DEFAULT 0 COMMENT '-1: Xuất; 1: nhập',
  `province_id` tinyint(4) NOT NULL DEFAULT 1,
  `amount` double NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_imexport`
--

INSERT INTO `product_imexport` (`id`, `order_id`, `product_id`, `imexport`, `province_id`, `amount`, `price`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 81, -1, 1, 2, 137000, 1, '2025-02-03 03:00:45', '2025-02-03 03:00:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_imexport_history`
--

CREATE TABLE `product_imexport_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `imexport_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `imexport` tinyint(4) NOT NULL DEFAULT 0 COMMENT '-1: Xuất; 1: nhập',
  `amount` double NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `inv_id` int(11) NOT NULL,
  `invcode` varchar(7) NOT NULL,
  `inv_code` varchar(50) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sendingaddress` varchar(255) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `content` tinytext DEFAULT NULL,
  `totalcost` int(11) DEFAULT NULL,
  `totalamount` double NOT NULL DEFAULT 0,
  `discount` double DEFAULT NULL,
  `subtotal` float NOT NULL,
  `payment_at` datetime NOT NULL,
  `transportfee` int(11) NOT NULL DEFAULT 0,
  `taxvat` double NOT NULL DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `voucher` int(20) DEFAULT NULL,
  `npp` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `ctv` int(11) DEFAULT NULL,
  `commission_npp` double DEFAULT NULL,
  `commission_daily` double DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `shipped_at` datetime NOT NULL,
  `out_for_delivery_at` datetime NOT NULL,
  `deliverydate` datetime DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT '0',
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `product_orderdetail`
--

CREATE TABLE `product_orderdetail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `stock_id` tinyint(4) NOT NULL DEFAULT 1,
  `product_id` int(11) UNSIGNED NOT NULL,
  `capacity_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `commission_daily` int(11) NOT NULL DEFAULT 0,
  `commission_npp` int(11) NOT NULL DEFAULT 0,
  `commission_ctv` int(11) DEFAULT 0,
  `price_im` int(11) DEFAULT NULL,
  `pro_status` tinyint(4) NOT NULL,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_orderdetail`
--

INSERT INTO `product_orderdetail` (`id`, `order_id`, `stock_id`, `product_id`, `capacity_id`, `quantity`, `price`, `commission_daily`, `commission_npp`, `commission_ctv`, `price_im`, `pro_status`, `delivery_date`) VALUES
(1, 1, 1, 81, 3, 2, 137000, 0, 0, 0, NULL, 2, NULL),
(2, 2, 1, 73, 1, 1, 82000, 0, 0, 0, NULL, 1, NULL),
(3, 3, 1, 73, 1, 1, 82000, 0, 0, 0, NULL, 1, NULL),
(4, 4, 1, 73, 1, 1, 82000, 0, 0, 0, NULL, 1, NULL),
(5, 5, 1, 73, 1, 1, 82000, 0, 0, 0, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order_history`
--

CREATE TABLE `product_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `product_order_return`
--

CREATE TABLE `product_order_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ischeck` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order_status`
--

CREATE TABLE `product_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_order_status`
--

INSERT INTO `product_order_status` (`id`, `title`, `priority`) VALUES
(1, 'Mới', 1),
(2, 'Duyệt', 2),
(3, 'Đang giao', 3),
(4, 'Đã giao', 4),
(5, 'Hủy', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order_unc`
--

CREATE TABLE `product_order_unc` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `inv_code` varchar(50) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_photo`
--

CREATE TABLE `product_photo` (
  `id` int(10) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_photo`
--

INSERT INTO `product_photo` (`id`, `pro_id`, `title`, `image`, `priority`) VALUES
(63, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-7.jpg', 1),
(64, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-6.jpg', 2),
(65, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-5.jpg', 3),
(66, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-4.jpg', 4),
(67, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-3.jpg', 5),
(68, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-2.jpg', 6),
(69, 5, 'Chả cốm Hà Nội', 'mb-007-cha-com-1.jpg', 7),
(94, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-4.jpg', 1),
(95, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-3.jpg', 2),
(96, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-2.jpg', 3),
(97, 21, 'Dồi sụn Hà Nội', 'mb-021-doi-sun-1.jpg', 4),
(170, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-6.jpg', 1),
(171, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-5.jpg', 2),
(172, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-4.jpg', 3),
(173, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-3.jpg', 4),
(174, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-2.jpg', 5),
(175, 40, 'Bánh đa nem cuốn Lương Sơn', 'mt-002-banh-da-nem-1.jpg', 6),
(292, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-4.jpg', 1),
(293, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-3.jpg', 2),
(294, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-2.jpg', 3),
(295, 61, 'Giò bê bắp Nam Đàn - Nghệ An', 'mt-023-gio-be-1.jpg', 4),
(354, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '1.png', 1),
(355, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '2.png', 2),
(356, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '3.png', 3),
(357, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '4.png', 4),
(358, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '5.png', 5),
(360, 76, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '7.png', 6),
(458, 3, 'Bánh quế Hà Nội', '14_1.png', 1),
(459, 3, 'Bánh quế Hà Nội', '15_2.png', 2),
(460, 3, 'Bánh quế Hà Nội', 'banh-que-ha-noi.png', 3),
(461, 1, 'banh-cha-ha-noi', '2_5.png', 1),
(462, 1, 'banh-cha-ha-noi', '3_5.png', 2),
(463, 1, 'banh-cha-ha-noi', '4_5.png', 3),
(464, 1, 'banh-cha-ha-noi', '5_5.png', 4),
(465, 1, 'banh-cha-ha-noi', 'banh-cha-ha-noi.png', 5),
(466, 2, 'banh-com-ha-noi', '7_5.png', 1),
(467, 2, 'banh-com-ha-noi', '8_1.png', 2),
(468, 2, 'banh-com-ha-noi', 'banh-com-ha-noi.png', 3),
(469, 18, 'banh-dau-xanh-tien-trung-hai-duong', '10_1.png', 1),
(470, 18, 'banh-dau-xanh-tien-trung-hai-duong', '11_2.png', 2),
(471, 18, 'banh-dau-xanh-tien-trung-hai-duong', '12_1.png', 3),
(472, 18, 'banh-dau-xanh-tien-trung-hai-duong', 'banh-dau-xanh-tien-trung-hai-duong.png', 4),
(473, 19, 'bot-dau-xanh-nguyen-chat-tien-dung', '3_6.png', 1),
(474, 19, 'bot-dau-xanh-nguyen-chat-tien-dung', 'bot-dau-xanh-nguyen-chat-tien-dung.png', 2),
(475, 4, 'bot-san-day-kim-son-ninh-binh', '2_6.png', 1),
(476, 4, 'bot-san-day-kim-son-ninh-binh', '3_7.png', 2),
(477, 4, 'bot-san-day-kim-son-ninh-binh', '4_6.png', 3),
(478, 4, 'bot-san-day-kim-son-ninh-binh', 'bot-san-day-kim-son-ninh-binh.png', 4),
(479, 74, 'bot-dau-den-nguyen-chat-tien-dung', 'bot-dau-den-nguyen-chat-tien-dung.png', 1),
(480, 6, 'Chả mực Hạ Long', '11_3.png', 1),
(481, 6, 'Chả mực Hạ Long', '12_2.png', 2),
(482, 6, 'Chả mực Hạ Long', '13_2.png', 3),
(483, 6, 'Chả mực Hạ Long', '14_2.png', 4),
(484, 6, 'Chả mực Hạ Long', '15_3.png', 5),
(485, 6, 'Chả mực Hạ Long', 'cha-muc-ha-long.png', 6),
(486, 7, 'cha-que-nuong-nam-dinh', '17_2.png', 1),
(487, 7, 'cha-que-nuong-nam-dinh', '18_2.png', 2),
(488, 7, 'cha-que-nuong-nam-dinh', 'cha-que-nuong-nam-dinh.png', 3),
(489, 8, 'cha-ruoi-ha-noi', '21_2.png', 1),
(490, 8, 'cha-ruoi-ha-noi', '22_2.png', 2),
(491, 8, 'cha-ruoi-ha-noi', 'cha-ruoi-ha-noi.png', 3),
(492, 10, 'gio-lua-nam-dinh', '23_2.png', 1),
(493, 10, 'gio-lua-nam-dinh', '25_1.png', 2),
(494, 10, 'gio-lua-nam-dinh', 'gio-lua-nam-dinh.png', 3),
(495, 11, 'Giò xào Nam Định', '26_1.png', 1),
(496, 11, 'Giò xào Nam Định', '28_1.png', 2),
(497, 11, 'Giò xào Nam Định', '29_1.png', 3),
(498, 11, 'Giò xào Nam Định', 'gio-xao-nam-dinh.png', 4),
(499, 13, 'mam-ruoi-ninh-binh', '35.png', 1),
(500, 13, 'mam-ruoi-ninh-binh', '36_1.png', 2),
(501, 13, 'mam-ruoi-ninh-binh', 'mam-ruoi-ninh-binh.png', 3),
(502, 14, 'Mắm tép Kim Sơn Ninh Bình', '6_4.png', 1),
(503, 14, 'Mắm tép Kim Sơn Ninh Bình', '7_6.png', 2),
(504, 14, 'Mắm tép Kim Sơn Ninh Bình', '8_2.png', 3),
(505, 14, 'Mắm tép Kim Sơn Ninh Bình', 'mam-tep-kim-son-ninh-binh.png', 4),
(506, 15, 'Mắm Tôm Kim Hải Ninh Bình', '9_2.png', 1),
(507, 15, 'Mắm Tôm Kim Hải Ninh Bình', '11_4.png', 2),
(508, 15, 'Mắm Tôm Kim Hải Ninh Bình', 'mam-tom-kim-hai-ninh-binh.png', 3),
(509, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '31_1.png', 1),
(510, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '32_1.png', 2),
(511, 12, 'Mắm Cáy Kim Sơn Ninh Bình', '33.png', 3),
(512, 12, 'Mắm Cáy Kim Sơn Ninh Bình', 'mam-cay-kim-son-ninh-binh.png', 4),
(513, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '17_3.png', 1),
(514, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '18_3.png', 2),
(515, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '19_2.png', 3),
(516, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '13_3.png', 4),
(517, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '14_3.png', 5),
(518, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '15_4.png', 6),
(519, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', '16_2.png', 7),
(520, 16, 'Rượu đế nếp Kim Sơn Ninh Bình', 'ruou-de-nep-kim-son-ninh-binh.png', 8),
(521, 17, 'Rươi tươi Thái Bình', '21_3.png', 1),
(522, 17, 'Rươi tươi Thái Bình', '22_3.png', 2),
(523, 17, 'Rươi tươi Thái Bình', '23_3.png', 3),
(524, 17, 'Rươi tươi Thái Bình', '24.png', 4),
(525, 17, 'Rươi tươi Thái Bình', 'ruoi-tuoi.png', 5),
(526, 20, 'Mọc heo', '25_2.png', 1),
(527, 20, 'Mọc heo', '26_2.png', 2),
(528, 20, 'Mọc heo', '27_1.png', 3),
(529, 20, 'Mọc heo', 'moc-heo.png', 4),
(530, 22, 'Bò viên gân Hà Nội', '33_1.png', 1),
(531, 22, 'Bò viên gân Hà Nội', '35_1.png', 2),
(532, 22, 'Bò viên gân Hà Nội', '36_2.png', 3),
(533, 22, 'Bò viên gân Hà Nội', '37_1.png', 4),
(534, 22, 'Bò viên gân Hà Nội', 'bo-vien-gan.png', 5),
(535, 9, 'Dồi sụn Hà Nội', '29_2.png', 1),
(536, 9, 'Dồi sụn Hà Nội', '30_1.png', 2),
(537, 9, 'Dồi sụn Hà Nội', '31_2.png', 3),
(538, 9, 'Dồi sụn Hà Nội', '32_2.png', 4),
(539, 9, 'Dồi sụn Hà Nội', '38_1.png', 5),
(540, 9, 'Dồi sụn Hà Nội', '39_1.png', 6),
(541, 9, 'Dồi sụn Hà Nội', '40_1.png', 7),
(542, 9, 'Dồi sụn Hà Nội', '41_1.png', 8),
(543, 9, 'Dồi sụn Hà Nội', '42.png', 9),
(544, 9, 'Dồi sụn Hà Nội', '43.png', 10),
(545, 39, 'Bánh chưng Bình Định', '1_4.png', 1),
(546, 39, 'Bánh chưng Bình Định', 'mt-001-banh-chung-binh-dinh.png', 2),
(547, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '56.png', 1),
(548, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '57.png', 2),
(549, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '58.png', 3),
(550, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '59.png', 4),
(551, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', '60.png', 5),
(552, 41, 'Kẹo gương Kim Ngọc Quảng Ngãi', 'mt-03-keo-guong-kim-ngoc-quang-ngai.png', 6),
(553, 42, 'Bánh ít lá gai Bình Định', '11_5.png', 1),
(554, 42, 'Bánh ít lá gai Bình Định', '12_3.png', 2),
(555, 42, 'Bánh ít lá gai Bình Định', '13_4.png', 3),
(556, 42, 'Bánh ít lá gai Bình Định', '14_4.png', 4),
(557, 42, 'Bánh ít lá gai Bình Định', '15_5.png', 5),
(558, 42, 'Bánh ít lá gai Bình Định', 'mt-004-banh-it-la-gai-binh-dinh.png', 6),
(559, 43, 'Bánh ít nhân mặn Bình Định', '17_4.png', 1),
(560, 43, 'Bánh ít nhân mặn Bình Định', '18_4.png', 2),
(561, 43, 'Bánh ít nhân mặn Bình Định', '19_3.png', 3),
(562, 43, 'Bánh ít nhân mặn Bình Định', '20_1.png', 4),
(563, 43, 'Bánh ít nhân mặn Bình Định', 'mt-005-banh-it-nhan-man-binh-dinh.png', 5),
(564, 44, 'Bánh su sê Bình Định', '21_4.png', 1),
(565, 44, 'Bánh su sê Bình Định', '23_4.png', 2),
(566, 44, 'Bánh su sê Bình Định', '24_1.png', 3),
(567, 44, 'Bánh su sê Bình Định', 'mt-006-banh-su-se-binh-dinh.png', 4),
(568, 45, 'Bánh tét Bình Định', '25_3.png', 1),
(569, 45, 'Bánh tét Bình Định', '27_2.png', 2),
(570, 45, 'Bánh tét Bình Định', '28_2.png', 3),
(571, 45, 'Bánh tét Bình Định', 'mt-007-banh-tet-binh-dinh.png', 4),
(572, 46, 'Chả cá Nha Trang', '29_3.png', 1),
(573, 46, 'Chả cá Nha Trang', '30_2.png', 2),
(574, 46, 'Chả cá Nha Trang', '31_3.png', 3),
(575, 46, 'Chả cá Nha Trang', '32_3.png', 4),
(576, 46, 'Chả cá Nha Trang', '34_1.png', 5),
(577, 46, 'Chả cá Nha Trang', '35_2.png', 6),
(578, 47, 'Chả ram tôm đất Bình Định', '37_2.png', 1),
(579, 47, 'Chả ram tôm đất Bình Định', '38_2.png', 2),
(580, 47, 'Chả ram tôm đất Bình Định', '39_2.png', 3),
(581, 47, 'Chả ram tôm đất Bình Định', '40_2.png', 4),
(582, 47, 'Chả ram tôm đất Bình Định', '41_2.png', 5),
(583, 47, 'Chả ram tôm đất Bình Định', 'mt-009-cha-ram-tom-dat-binh-dinh.png', 6),
(584, 48, 'Cua xay lagi Bình Thuận', '44.png', 1),
(585, 48, 'Cua xay lagi Bình Thuận', '45.png', 2),
(586, 48, 'Cua xay lagi Bình Thuận', '47.png', 3),
(587, 48, 'Cua xay lagi Bình Thuận', '48.png', 4),
(588, 48, 'Cua xay lagi Bình Thuận', 'mt-010-cua-xay-lagi-binh-thuan.png', 5),
(589, 48, 'Cua xay lagi Bình Thuận', '42_1.png', 6),
(590, 48, 'Cua xay lagi Bình Thuận', '43_1.png', 7),
(591, 49, 'Đường phèn vàng Quảng Ngãi', '50.png', 1),
(592, 49, 'Đường phèn vàng Quảng Ngãi', '51.png', 2),
(593, 49, 'Đường phèn vàng Quảng Ngãi', '52.png', 3),
(594, 49, 'Đường phèn vàng Quảng Ngãi', '53.png', 4),
(595, 49, 'Đường phèn vàng Quảng Ngãi', '54.png', 5),
(596, 49, 'Đường phèn vàng Quảng Ngãi', 'mt-011-duong-phen-quang-ngai.png', 6),
(597, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '62.png', 1),
(598, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '63.png', 2),
(599, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', '64.png', 3),
(600, 50, 'Lạc rang tỏi ớt Lương Sơn Nghệ An', 'mt-012-lac-rang-toi-ot-luong-son.png', 4),
(601, 51, 'Bánh dừa nướng Quảng Nam', '2_7.png', 1),
(602, 51, 'Bánh dừa nướng Quảng Nam', '3_8.png', 2),
(603, 51, 'Bánh dừa nướng Quảng Nam', '4_7.png', 3),
(604, 51, 'Bánh dừa nướng Quảng Nam', '6_5.png', 4),
(605, 51, 'Bánh dừa nướng Quảng Nam', '7_7.png', 5),
(606, 51, 'Bánh dừa nướng Quảng Nam', 'mt-014-banh-dua-nuong-quang-nam.png', 6),
(610, 53, 'Mắm cá cơm Dì Cẩn', '19_4.png', 4),
(612, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '8_3.png', 1),
(613, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '10_2.png', 2),
(614, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '11_6.png', 3),
(615, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '12_4.png', 4),
(616, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '13_5.png', 5),
(617, 52, 'Bánh đậu xanh nướng nhân thịt Quảng Nam', '14_5.png', 6),
(618, 54, 'Mắm cá giò Dì Cẩn', '23_5.png', 1),
(619, 54, 'Mắm cá giò Dì Cẩn', '25_4.png', 2),
(620, 54, 'Mắm cá giò Dì Cẩn', '26_3.png', 3),
(621, 54, 'Mắm cá giò Dì Cẩn', 'mt-016-mam-ca-gio-di-can-2.png', 4),
(622, 53, 'Mắm cá cơm Dì Cẩn', '15_6.png', 5),
(623, 53, 'Mắm cá cơm Dì Cẩn', '16_3.png', 6),
(624, 53, 'Mắm cá cơm Dì Cẩn', '17_5.png', 7),
(625, 55, 'Mắm dưa Dì Cẩn', '28_3.png', 1),
(626, 55, 'Mắm dưa Dì Cẩn', '29_4.png', 2),
(627, 56, 'Mắm mực Đà Nẵng', '35_3.png', 1),
(628, 56, 'Mắm mực Đà Nẵng', '31_4.png', 2),
(629, 56, 'Mắm mực Đà Nẵng', '32_4.png', 3),
(630, 56, 'Mắm mực Đà Nẵng', '33_2.png', 4),
(631, 56, 'Mắm mực Đà Nẵng', '34_2.png', 5),
(632, 56, 'Mắm mực Đà Nẵng', 'mt-018-mam-muc-da-nang.png', 6),
(633, 57, 'Mắm nêm Dì Cẩn', '36_3.png', 1),
(634, 57, 'Mắm nêm Dì Cẩn', '37_3.png', 2),
(635, 57, 'Mắm nêm Dì Cẩn', '38_3.png', 3),
(636, 57, 'Mắm nêm Dì Cẩn', '39_3.png', 4),
(637, 57, 'Mắm nêm Dì Cẩn', 'mt-019-mam-nem-di-can.png', 5),
(638, 58, 'Mắm ruốc Dì Cẩn', '41_3.png', 1),
(639, 58, 'Mắm ruốc Dì Cẩn', '42_2.png', 2),
(640, 58, 'Mắm ruốc Dì Cẩn', '43_2.png', 3),
(641, 58, 'Mắm ruốc Dì Cẩn', '45_1.png', 4),
(642, 58, 'Mắm ruốc Dì Cẩn', '46.png', 5),
(643, 58, 'Mắm ruốc Dì Cẩn', '47_1.png', 6),
(644, 58, 'Mắm ruốc Dì Cẩn', 'mt-020-mam-ruoc-di-can.png', 7),
(645, 59, 'Mắm tôm chua Dì Cẩn', '52_1.png', 1),
(646, 59, 'Mắm tôm chua Dì Cẩn', '53_1.png', 2),
(647, 59, 'Mắm tôm chua Dì Cẩn', '50_1.png', 3),
(648, 59, 'Mắm tôm chua Dì Cẩn', '51_1.png', 4),
(649, 59, 'Mắm tôm chua Dì Cẩn', 'mt-021-mam-tom-chu-di-can.png', 5),
(650, 60, 'Tép khô (ruốc khô) Nha Trang', '55.png', 1),
(651, 60, 'Tép khô (ruốc khô) Nha Trang', '56_1.png', 2),
(652, 60, 'Tép khô (ruốc khô) Nha Trang', 'mt-022-tep-kho-ruoc-kho-nha-trang.png', 3),
(653, 62, 'Mực rim me Phan Thiết', '6_6.png', 1),
(654, 62, 'Mực rim me Phan Thiết', '7_8.png', 2),
(655, 62, 'Mực rim me Phan Thiết', '8_4.png', 3),
(656, 62, 'Mực rim me Phan Thiết', '9_3.png', 4),
(657, 62, 'Mực rim me Phan Thiết', '10_3.png', 5),
(658, 62, 'Mực rim me Phan Thiết', '11_7.png', 6),
(659, 62, 'Mực rim me Phan Thiết', 'mt-024-muc-rim-me-phan-thiet.png', 7),
(660, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '12_5.png', 1),
(661, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '13_6.png', 2),
(662, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', '15_7.png', 3),
(663, 63, 'Giò bê truyền thống Nam Đàn - Nghệ An', 'mt-025-gio-be-truyen-thong-nam-dan-nghe-an.png', 4),
(664, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '17_6.png', 1),
(665, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '18_5.png', 2),
(666, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', '19_5.png', 3),
(667, 64, 'Đường thô mật mía Nghĩa Đàn - Nghệ An', 'mt-026-duong-tho-mat-mia-nghia-dan-nghe-an.png', 4),
(668, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '20_2.png', 1),
(669, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '21_5.png', 2),
(670, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', '23_6.png', 3),
(671, 65, 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', 'mt-027-mat-mia-nguyen-chat-nghia-dan-nghe-an.png', 4),
(672, 66, 'Mứt sen Liên - Đặc sản Huế', '24_2.png', 1),
(673, 66, 'Mứt sen Liên - Đặc sản Huế', '25_5.png', 2),
(674, 66, 'Mứt sen Liên - Đặc sản Huế', '26_4.png', 3),
(675, 66, 'Mứt sen Liên - Đặc sản Huế', '27_3.png', 4),
(676, 66, 'Mứt sen Liên - Đặc sản Huế', 'mt-028-mut-sen-lien-dac-san-hue.png', 5),
(677, 67, 'Kẹo đậu phộng Hoàng Bách Huế', '32_5.png', 1),
(678, 67, 'Kẹo đậu phộng Hoàng Bách Huế', 'mt-029-keo-dau-phong-hoang-bach-hue.png', 2),
(679, 68, 'Mè xửng loại thượng hạng Hoàng Bách - Huế', 'mt-030-me-xung-loai-thuong-hang-hoang-bach-hue.png', 1),
(680, 69, 'Mạch nha nếp Quảng Ngãi', '34_3.png', 1),
(681, 69, 'Mạch nha nếp Quảng Ngãi', '36_4.png', 2),
(682, 69, 'Mạch nha nếp Quảng Ngãi', 'mt-031-mach-nha-nep-quang-ngai.png', 3),
(683, 70, 'Kẹo cu đơ Hà Tĩnh', '38_4.png', 1),
(684, 70, 'Kẹo cu đơ Hà Tĩnh', '39_4.png', 2),
(685, 71, 'Mè xửng Hoàng Bách - Huế', '40_3.png', 1),
(686, 71, 'Mè xửng Hoàng Bách - Huế', '42_3.png', 2),
(687, 71, 'Mè xửng Hoàng Bách - Huế', '43_3.png', 3),
(688, 71, 'Mè xửng Hoàng Bách - Huế', '44_1.png', 4),
(689, 71, 'Mè xửng Hoàng Bách - Huế', '45_2.png', 5),
(690, 72, 'Giò bò loại đặc biệt Đà Nẵng', '48_1.png', 1),
(691, 72, 'Giò bò loại đặc biệt Đà Nẵng', '49.png', 2),
(692, 72, 'Giò bò loại đặc biệt Đà Nẵng', '50_2.png', 3),
(693, 72, 'Giò bò loại đặc biệt Đà Nẵng', '51_2.png', 4),
(694, 72, 'Giò bò loại đặc biệt Đà Nẵng', '52_2.png', 5),
(695, 72, 'Giò bò loại đặc biệt Đà Nẵng', '47_2.png', 6),
(696, 72, 'Giò bò loại đặc biệt Đà Nẵng', 'mt-034-gio-bo-loai-dac-biet-da-nang.png', 7),
(697, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '53_2.png', 1),
(698, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '55_1.png', 2),
(699, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', '56_2.png', 3),
(700, 73, 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', 'mt-035-mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh.png', 4),
(701, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '1_1.png', 1),
(702, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '2_1.png', 2),
(703, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '3_1.png', 3),
(704, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '4_1.png', 4),
(705, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '5_1.png', 5),
(706, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', '6.png', 6),
(707, 77, 'Rong mứt nấu canh/Rong biển khô Nha Trang', 'mt-036-rong-mut-nau-canh-rong-bien-kho-nha-trang.png', 7),
(719, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '16_4.png', 1),
(720, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '17_7.png', 2),
(721, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '18_6.png', 3),
(722, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '19_6.png', 4),
(723, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '20_3.png', 5),
(724, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', '21_6.png', 6),
(725, 23, 'Khô chỉ vàng loại 1 Vũng Tàu', 'mn-01-kho-chi-vang-loai-1-vung-tau.png', 7),
(726, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '24_3.png', 1),
(727, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '25_6.png', 2),
(728, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', '22_4.png', 3),
(729, 24, 'Bánh phồng sữa Tuyết Phụng - Bến Tre', 'mn-02-banh-phong-sua-tuyet-phung-ben-tre.png', 4),
(730, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '27_4.png', 1),
(731, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '28_4.png', 2),
(732, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '29_5.png', 3),
(733, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '30_3.png', 4),
(734, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', '31_5.png', 5),
(735, 25, 'Bánh pía Mỹ Ngọc - Sóc Trăng', 'mn-03-banh-pia-my-ngoc-soc-trang.png', 6),
(736, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '32_6.png', 1),
(737, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '33_3.png', 2),
(738, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', '35_4.png', 3),
(739, 26, 'Khô cá sặc loại lớn đặc sản Cà Mau', 'mn-04-kho-ca-sac-loai-lon-dac-san-ca-mau.png', 4),
(740, 27, 'Khô cá Lóc 3 nắng Trà Vinh', '38_5.png', 1),
(741, 27, 'Khô cá Lóc 3 nắng Trà Vinh', '39_5.png', 2),
(742, 28, 'Khô cá Lóc 2 nắng Trà Vinh', '40_4.png', 1),
(743, 28, 'Khô cá Lóc 2 nắng Trà Vinh', '42_4.png', 2),
(744, 28, 'Khô cá Lóc 2 nắng Trà Vinh', 'mn-06-kho-ca-loc-2-nang-tra-vinh.png', 3),
(745, 29, 'Khô cá đù loại lớn', '42_5.png', 1),
(746, 29, 'Khô cá đù loại lớn', '43_4.png', 2),
(747, 29, 'Khô cá đù loại lớn', '44_2.png', 3),
(748, 29, 'Khô cá đù loại lớn', '45_3.png', 4),
(749, 29, 'Khô cá đù loại lớn', '46_1.png', 5),
(750, 29, 'Khô cá đù loại lớn', '47_3.png', 6),
(751, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '50_3.png', 1),
(752, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '51_3.png', 2),
(753, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '52_3.png', 3),
(754, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '53_3.png', 4),
(755, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', '54_1.png', 5),
(756, 30, 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', 'mn-08-kho-ca-dua-chuan-2-soc-1-nang-vung-tau.png', 6),
(757, 34, 'Khô cá kèo loại lớn Cà Mau', '65.png', 1),
(758, 34, 'Khô cá kèo loại lớn Cà Mau', '67.png', 2),
(759, 34, 'Khô cá kèo loại lớn Cà Mau', '68.png', 3),
(760, 34, 'Khô cá kèo loại lớn Cà Mau', '69.png', 4),
(761, 34, 'Khô cá kèo loại lớn Cà Mau', 'mn-09-kho-ca-keo-loai-lon-ca-mau.png', 5),
(762, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', '59_1.png', 1),
(763, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', '60_1.png', 2),
(764, 32, 'Kẹo dừa thập cẩm Tuyết Phụng', 'mn-10-keo-dua-thap-cam-tuyet-phung-ben-tre.png', 3),
(765, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', '62_1.png', 1),
(766, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', '64_1.png', 2),
(767, 33, 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', 'mn-11-keo-chuoi-vi-gung-tuyet-phung-ben-tre.png', 3),
(768, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '57_1.png', 1),
(769, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '58_1.png', 2),
(770, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', '56_3.png', 3),
(771, 31, 'Kẹo dừa Tuyết Phụng - Bến Tre', 'mn-012-keo-dua-tuyet-phung-ben-tre.png', 4),
(772, 35, 'Kẹo chuối loại đặc biệt Tuyết Phụng - Bến Tre', 'mn-013-keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre.png', 1),
(773, 36, 'Nước màu đường thốt nốt An Giang', '72.png', 1),
(774, 36, 'Nước màu đường thốt nốt An Giang', '73.png', 2),
(775, 36, 'Nước màu đường thốt nốt An Giang', 'mn-014-nuoc-mau-duong-thot-not-an-giang.png', 3),
(776, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '75.png', 1),
(777, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '76.png', 2),
(778, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '77.png', 3),
(779, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', '78.png', 4),
(780, 37, 'Đường Thốt nốt viên loại đặc biệt An Giang', 'mn-015-dduong-thot-not-vien-loai-dac-biet-an-giang.png', 5),
(781, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '79.png', 1),
(782, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '80.png', 2),
(783, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '81.png', 3),
(784, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '82.png', 4),
(785, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '83.png', 5),
(786, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', '85.png', 6),
(787, 38, 'Đường Thốt nốt hũ loại đặc biệt An Giang', 'mn-015-duong-thot-not-hu-loai-dac-biet-an-giang.png', 7),
(788, 75, 'Bánh pía chay Mỹ Ngọc - Sóc Trăng', 'mn-17-banh-pia-chay-my-ngoc-soc-trang.png', 1),
(810, 78, 'Bánh thuyền Mix hạt', '2_2.png', 1),
(811, 78, 'Bánh thuyền Mix hạt', '3_2.png', 2),
(812, 78, 'Bánh thuyền Mix hạt', '4_2.png', 3),
(813, 78, 'Bánh thuyền Mix hạt', '5_2.png', 4),
(814, 78, 'Bánh thuyền Mix hạt', '6_1.png', 5),
(815, 78, 'Bánh thuyền Mix hạt', '7_1.png', 6),
(816, 78, 'Bánh thuyền Mix hạt', '1_2.png', 7),
(828, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia.png', 1),
(829, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-2.png', 2),
(830, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-3.png', 3),
(831, 79, 'Lạp xưởng nạc loại đặc biệt Campuchia', 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia-4.png', 4),
(832, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia.png', 1),
(833, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia2.png', 2),
(834, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia3.png', 3),
(835, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia4.png', 4),
(836, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia5.png', 5),
(837, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia6.png', 6),
(838, 80, 'Khô Cá Tra Phồng Biển Hồ Campuchia', 'mn-02-kho-ca-tra-phong-bien-ho-campuchia7.png', 7),
(843, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia.png', 1),
(844, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia2.png', 2),
(845, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia3.png', 3),
(846, 81, 'Khô cá lóc Biển Hồ Campuchia', 'nn-03-kho-ca-loc-bien-ho-campuchia4.png', 4),
(847, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia.png', 1),
(848, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia2.png', 2),
(849, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia4.png', 3),
(850, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia5.png', 4),
(851, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia6.png', 5),
(852, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia7.png', 6),
(853, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia8.png', 7),
(854, 82, 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia9.png', 8),
(855, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-1.png', 1),
(856, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-2.png', 2),
(857, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-3.png', 3),
(858, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-4.png', 4),
(859, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-5.png', 5),
(860, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-6.png', 6),
(861, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-xao-cac-loai-7.png', 7),
(862, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai.png', 1),
(863, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai2.png', 2),
(864, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai3.png', 3),
(865, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai5.png', 4),
(866, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai6.png', 5),
(867, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai7.png', 6),
(868, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai8.png', 7),
(869, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai9.png', 8),
(870, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai10.png', 9),
(871, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai11.png', 10),
(872, 84, 'Thịt dê nướng các loại', 'thit-de-nuong-cac-loai12.png', 11),
(873, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai1.png', 1),
(874, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai2.png', 2),
(875, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai3.png', 3),
(876, 85, 'Vú heo nướng các loại (500gr)', 'vu-heo-nuong-cac-loai4.png', 4),
(877, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai1.png', 1),
(878, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai2.png', 2),
(879, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai3.png', 3),
(880, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai4.png', 4),
(881, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai5.png', 5),
(882, 86, 'Heo rừng hấp, xào các loại (500gr)', 'heo-rung-hap-xao-cac-loai6.png', 6),
(883, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai1.png', 1),
(884, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai3.png', 2),
(885, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai4.png', 3),
(886, 87, 'Heo rừng nướng các loại (500gr)', 'heo-rung-nuong-cac-loai2.png', 4),
(887, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay1.png', 1),
(888, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay2.png', 2),
(889, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay3.png', 3),
(890, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'thit-heo-nau-gia-cay4.png', 4),
(891, 88, 'Giò Heo nấu giả cầy chuẩn vị Bắc', 'heo-nau-gia-cay-chuan-vi-bac.png', 5),
(892, 83, 'Thịt dê hấp lá tía tô/hấp sả/hấp lá chanh', 'thit-de-hap-la-tia-tohap-sa-hap-la-chanh.png', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_price_history`
--

CREATE TABLE `product_price_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` int(11) DEFAULT 0,
  `user_id` tinyint(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_pro`
--

CREATE TABLE `product_pro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `capacity_id` tinyint(4) DEFAULT 0,
  `datepackage_id` tinyint(4) DEFAULT 0,
  `capacity` varchar(255) DEFAULT NULL,
  `price_im` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `price_discount` int(11) DEFAULT 0,
  `price_npp` int(11) DEFAULT 0,
  `price_daily` int(11) DEFAULT 0,
  `price_ctv` int(11) DEFAULT 0,
  `price_private` int(11) DEFAULT 0,
  `price_sale1` int(11) DEFAULT 0,
  `price_sale2` int(11) DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `brief` text DEFAULT NULL,
  `tips` text DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `re_name` varchar(255) NOT NULL,
  `ishot` tinyint(4) NOT NULL DEFAULT 0,
  `isnew` tinyint(4) NOT NULL DEFAULT 0,
  `isdefault` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_pro`
--

INSERT INTO `product_pro` (`id`, `cat_id`, `code`, `title`, `capacity_id`, `datepackage_id`, `capacity`, `price_im`, `price`, `price_discount`, `price_npp`, `price_daily`, `price_ctv`, `price_private`, `price_sale1`, `price_sale2`, `content`, `brief`, `tips`, `tag`, `keyword`, `meta_description`, `image`, `re_name`, `ishot`, `isnew`, `isdefault`, `priority`, `isactive`, `updated_at`, `created_at`) VALUES
(1, 1, 'MB-001', 'Bánh chả Hà Nội', 18, 1, 'Đặt hàng qua website giá chỉ còn: 20.000', 0, 20000, 0, 0, 22000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay, lạp xưởng,&nbsp;lá chanh, mỡ heo, bột mỳ, lạc, hạt dưa&nbsp;cùng một số loại gia vị.</p>\r\n\r\n<p><strong>Xuất xứ: </strong>Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 150gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 75 ngày kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ&nbsp;phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-cha-ha-noi_1.png', 'banh-cha-ha-noi', 0, 0, 1, 1, 1, NULL, NULL),
(2, 1, 'MB-002', 'Bánh cốm Hà Nội', 5, 1, 'Đặt hàng qua website giá chỉ còn: 27.000', 0, 27000, 0, 0, 28000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Đậu xanh, bột nếp, đường cát, dừa, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 1 cái bánh.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Bảo quản ngăn đông hoặc ngăn mát tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong><strong> </strong>12 ngày kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-com-ha-noi_1.png', 'banh-com-ha-noi', 0, 0, 1, 2, 1, NULL, NULL),
(3, 1, 'MB-004', 'Bánh quế Hà Nội', 6, 1, 'Đặt hàng qua website giá chỉ còn: 40.000', 0, 40000, 0, 0, 43000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột nếp, đường cát, mè.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hộp giấy.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-que-ha-noi.png', 'banh-que-ha-noi', 0, 1, 1, 4, 1, NULL, NULL),
(4, 1, 'MB-006', 'Bột sắn dây Kim Sơn - Ninh Bình', 4, 5, 'Đặt hàng qua website giá chỉ còn: 155.000', 0, 155000, 0, 0, 160000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Sắn dây ta nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 1kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-san-day-kim-son-ninh-binh.png', 'bot-san-day-kim-son-ninh-binh', 1, 0, 1, 6, 1, NULL, NULL),
(5, 1, 'MB-011', 'Chả cốm Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 77.000', 0, 77000, 0, 0, 80000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay, cốm xanh, mỡ heo, muối, tiêu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-com-ha-noi.png', 'cha-com-ha-noi', 0, 1, 1, 11, 1, NULL, NULL),
(6, 1, 'MB-008', 'Chả mực Hạ Long', 3, 9, 'Đặt hàng qua website giá chỉ còn: 270.000', 0, 270000, 0, 0, 275000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mực tươi giã tay.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát, nơi khô ráo.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-muc-ha-long.png', 'cha-muc-ha-long', 1, 1, 1, 8, 1, NULL, NULL),
(7, 1, 'MB-009', 'Chả quế nướng Nam Định', 3, 9, 'Đặt hàng qua website giá chỉ còn: 107.000', 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt lợn tươi, mỡ lợn, bột quế.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 0.5kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5-7 ngày ở&nbsp;ngăn mát tủ lạnh. 3 tháng ở ngăn đông.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-que-nuong-nam-dinh.png', 'cha-que-nuong-nam-dinh', 0, 1, 1, 9, 1, NULL, NULL),
(8, 1, 'MB-010', 'Chả rươi Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 255.000', 0, 255000, 0, 0, 260000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 70% Rươi tươi, 30% thịt nạc và các gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đá tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'cha-ruoi-ha-noi.png', 'cha-ruoi-ha-noi', 0, 1, 1, 10, 1, NULL, NULL),
(9, 1, 'MB-022', 'Dồi sụn Hà Nội', 3, 9, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo xay,&nbsp;sụn, lạc, đỗ xanh, rau thơm.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'doi-sun-ha-noi.png', 'doi-sun-ha-noi', 0, 1, 1, 22, 1, NULL, NULL),
(10, 1, 'MB-012', 'Giò lụa Nam Định', 4, 9, 'Đặt hàng qua website giá chỉ còn: 215.000', 0, 215000, 0, 0, 220000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><b>Bảo quản</b>: Bảo quản trong ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'gio-lua-nam-dinh.png', 'gio-lua-nam-dinh', 0, 1, 1, 12, 1, NULL, NULL),
(11, 1, 'MB-013', 'Giò xào Nam Định', 4, 9, 'Đặt hàng qua website giá chỉ còn: 225.000', 0, 225000, 0, 0, 230000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tai heo, lưỡi heo, thị đùi heo,&nbsp;nấm mèo, hạt tiêu.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;3&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Bảo quản trong ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'gio-xao-nam-dinh.png', 'gio-xao-nam-dinh', 0, 1, 1, 13, 1, NULL, NULL),
(12, 1, 'MB-018', 'Mắm Cáy Kim Sơn Ninh Bình', 7, 6, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% con cáy tự nhiên, muối biển tinh khiết, thính gạo nếp.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 500ml.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-cay-kim-son-ninh-binh.png', 'mam-cay-kim-son-ninh-binh', 0, 1, 1, 18, 1, NULL, NULL),
(13, 1, 'MB-015', 'Mắm rươi Ninh Bình', 8, 6, 'Đặt hàng qua website giá chỉ còn: 105.000', 0, 105000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Rươi tươi, muối, vỏ quýt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 300gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 300gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-ruoi-ninh-binh.png', 'mam-ruoi-ninh-binh', 0, 1, 1, 15, 1, NULL, NULL),
(14, 1, 'MB-016', 'Mắm tép Kim Sơn Ninh Bình', 9, 6, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tép &gt; 65%, muối, thính nếp, cơm nóng, men rượu, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 600gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 600gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-tep-kim-son-ninh-binh.png', 'mam-tep-kim-son-ninh-binh', 0, 1, 1, 16, 1, NULL, NULL),
(15, 1, 'MB-017', 'Mắm Tôm Kim Hải Ninh Bình', 3, 6, 'Đặt hàng qua website giá chỉ còn: 52.000', 0, 52000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 chai 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mam-tom-kim-hai-ninh-binh.png', 'mam-tom-kim-hai-ninh-binh', 0, 1, 1, 17, 1, NULL, NULL),
(16, 1, 'MB-019', 'Rượu đế nếp Kim Sơn Ninh Bình', 10, 5, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 68000, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Gạo nếp cái hoa vàng, men rượu,&nbsp;không&nbsp;chất phụ gia.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Tính theo lít</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Sau khi sử dụng&nbsp;nắp kín, tránh lẫn nước và tạp chất. Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'ruou-de-nep-kim-son-ninh-binh.png', 'ruou-de-nep-kim-son-ninh-binh', 0, 0, 1, 19, 1, NULL, NULL),
(17, 1, 'MB-020', 'Rươi tươi Thái Bình', 3, 3, 'Đặt hàng qua website giá chỉ còn: 435.000', 0, 435000, 0, 0, 440000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Rươi tươi 100%.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 hộp 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đá tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'ruoi-tuoi.png', 'ruoi-tuoi', 0, 1, 1, 20, 1, NULL, NULL),
(18, 1, 'MB-003', 'Bánh đậu xanh Tiên Trung - Hải Dương', 21, 1, 'Đặt hàng qua website giá chỉ còn: 25.000', 0, 25000, 0, 0, 27000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 5 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'banh-dau-xanh-tien-trung-hai-duong_1.png', 'banh-dau-xanh-tien-trung-hai-duong', 0, 1, 1, 3, 1, NULL, NULL),
(19, 1, 'MB-005', 'Bột đậu xanh nguyên chất Tiên Dung', 11, 5, 'Đặt hàng qua website giá chỉ còn: 37.000', 0, 37000, 0, 0, 39000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột đậu xanh nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-dau-xanh-nguyen-chat-tien-dung.png', 'bot-dau-xanh-nguyen-chat-tien-dung', 0, 1, 1, 5, 1, NULL, NULL),
(20, 1, 'MB-021', 'Mọc heo', 3, 3, 'Đặt hàng qua website giá chỉ còn: 102.000', 0, 102000, 0, 0, 105000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt heo nóng&nbsp;xay, mộc nhĩ, nước mắm, tiêu.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng&nbsp;kể từ NSX.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'moc-heo.png', 'moc-heo', 0, 1, 1, 21, 1, NULL, NULL),
(22, 1, 'MB-023', 'Bò viên gân Hà Nội', 3, 3, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 98000, 0, 130000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Thịt bò, gân bò.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bo-vien-gan.png', 'bo-vien-gan', 0, 1, 1, 23, 1, NULL, NULL),
(23, 3, 'MN-01', 'Khô chỉ vàng loại 1 Vũng Tàu', 3, 10, 'Đặt hàng qua website giá chỉ còn: 92.000', 0, 92000, 0, 0, 95000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-01-kho-chi-vang-loai-1-vung-tau_1.png', 'kho-chi-vang-loai-1-vung-tau', 0, 1, 1, 1, 1, NULL, NULL),
(24, 3, 'MN-02', 'Bánh phồng sữa Tuyết Phụng - Bến Tre', 11, 1, 'Đặt hàng qua website giá chỉ còn: 47.000', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 400gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-02-banh-phong-sua-tuyet-phung-ben-tre_1.png', 'banh-phong-sua-tuyet-phung-ben-tre', 0, 1, 1, 2, 1, NULL, NULL),
(25, 3, 'MN-03', 'Bánh pía Mỹ Ngọc - Sóc Trăng', 3, 1, NULL, 0, 95000, 86000, 0, 97000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-03-banh-pia-my-ngoc-soc-trang.png', 'banh-pia-my-ngoc-soc-trang', 1, 0, 1, 3, 1, NULL, NULL),
(26, 3, 'MN-04', 'Khô cá sặc loại lớn đặc sản Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 152.000', 0, 152000, 0, 0, 155000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-04-kho-ca-sac-loai-lon-dac-san-ca-mau.png', 'kho-ca-sac-loai-lon-dac-san-ca-mau', 0, 1, 1, 4, 1, NULL, NULL),
(27, 3, 'MN-05', 'Khô cá Lóc 3 nắng Trà Vinh', 3, 10, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 0, 0, 130000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-05-kho-ca-loc-3-nang-tra-vinh.png', 'kho-ca-loc-3-nang-tra-vinh', 0, 1, 1, 5, 1, NULL, NULL),
(28, 3, 'MN-06', 'Khô cá Lóc 2 nắng Trà Vinh', 3, 10, 'Đặt hàng qua website giá chỉ còn: 117.000', 0, 117000, 0, 0, 120000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-06-kho-ca-loc-2-nang-tra-vinh.png', 'kho-ca-loc-2-nang-tra-vinh', 0, 1, 1, 6, 1, NULL, NULL),
(29, 3, 'MN-07', 'Khô cá đù loại lớn Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 87.000', 0, 87000, 0, 0, 90000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-07-kho-ca-du-loai-lon.png', 'kho-ca-du-loai-lon-ca-maukho-ca-du-loai-lon', 0, 1, 1, 7, 1, NULL, NULL),
(30, 3, 'MN-08', 'Khô cá dứa chuẩn 2 sọc, 1 nắng Vũng Tàu', 3, 10, 'Đặt hàng qua website giá chỉ còn: 187.000', 0, 187000, 0, 0, 190000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-08-kho-ca-dua-chuan-2-soc-1-nang-vung-tau.png', 'kho-ca-dua-chuan-2-soc-1-nang-vung-tau', 0, 1, 1, 8, 1, NULL, NULL),
(31, 3, 'MN-12', 'Kẹo dừa Tuyết Phụng - Bến Tre', 11, 8, 'Đặt hàng qua website giá chỉ còn: 63.000', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dừa, lá dứa, sầu riêng.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 400gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-012-keo-dua-tuyet-phung-ben-tre.png', 'keo-dua-tuyet-phung-ben-tre', 0, 1, 1, 12, 1, NULL, NULL),
(32, 3, 'MN-10', 'Kẹo dừa thập cẩm Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 83.000', 0, 83000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dừa, lá dứa, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-10-keo-dua-thap-cam-tuyet-phung-ben-tre.png', 'keo-dua-thap-cam-tuyet-phung-ben-trekeo-dua-thap-cam-tuyet-phung-ben-tre', 0, 1, 1, 10, 1, NULL, NULL),
(33, 3, 'MN-11', 'Kẹo chuối vị gừng Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 53.000', 0, 53000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-11-keo-chuoi-vi-gung-tuyet-phung-ben-tre.png', 'keo-chuoi-vi-gung-tuyet-phung-ben-tre', 0, 1, 1, 11, 1, NULL, NULL),
(34, 3, 'MN-09', 'Khô cá kèo loại lớn Cà Mau', 3, 10, 'Đặt hàng qua website giá chỉ còn: 327.000', 0, 327000, 0, 0, 330000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-09-kho-ca-keo-loai-lon-ca-mau.png', 'kho-ca-keo-loai-lon-ca-mau', 0, 1, 1, 9, 1, NULL, NULL),
(35, 3, 'MN-13', 'Kẹo chuối loại đặc biệt Tuyết Phụng - Bến Tre', 3, 8, 'Đặt hàng qua website giá chỉ còn: 73.000', 0, 73000, 0, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-013-keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre.png', 'keo-chuoi-loai-dac-biet-tuyet-phung-ben-tre', 0, 1, 1, 13, 1, NULL, NULL),
(36, 3, 'MN-14', 'Nước màu đường thốt nốt An Giang', 11, 2, 'Đặt hàng qua website giá chỉ còn: 35.000', 0, 35000, 0, 0, 38000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mật hoa đường thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-014-nuoc-mau-duong-thot-not-an-giang.png', 'nuoc-mau-duong-thot-not-an-giang', 0, 1, 1, 14, 1, NULL, NULL),
(37, 3, 'MN-15', 'Đường Thốt nốt viên loại đặc biệt An Giang', 4, 2, 'Đặt hàng qua website giá chỉ còn: 57.000', 0, 57000, 0, 0, 59000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mật hoa đường thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-015-dduong-thot-not-vien-loai-dac-biet-an-giang.png', 'duong-thot-not-vien-loai-dac-biet-an-giang', 0, 1, 1, 15, 1, NULL, NULL),
(38, 3, 'MN-16', 'Đường Thốt nốt hũ loại đặc biệt An Giang', 4, 2, 'Đặt hàng qua website giá chỉ còn: 65.000', 0, 65000, 0, 0, 68000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Kết tinh từ mật hoa cây thốt nốt.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;24&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-015-duong-thot-not-hu-loai-dac-biet-an-giang.png', 'duong-thot-not-hu-loai-dac-biet-an-giang', 1, 0, 1, 16, 1, NULL, NULL),
(39, 2, 'MT-001', 'Bánh chưng Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 26.000', 0, 26000, 0, 0, 28000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Gạo nếp, thịt heo, đậu xanh.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Gói bằng lá chuối.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-001-banh-chung-binh-dinh.png', 'banh-chung-binh-dinh', 0, 1, 1, 1, 1, NULL, NULL),
(40, 2, 'MT-002', 'Bánh đa nem cuốn Lương Sơn Nghệ An', 12, 1, 'Đặt hàng qua website giá chỉ còn: 7.000', 0, 7000, 0, 0, 7500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-002-banh-da-nem-cuon-luong-son-nghe-an.png', 'banh-da-nem-cuon-luong-son-nghe-an', 0, 1, 1, 2, 1, NULL, NULL),
(41, 2, 'MT-003', 'Kẹo gương Kim Ngọc Quảng Ngãi', 33, 8, 'Đặt hàng qua website giá chỉ còn: 6.300', 0, 6300, 0, 0, 6500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-003-keo-guong-kim-ngoc-quang-ngai.png', 'keo-guong-kim-ngoc-quang-ngai', 1, 0, 1, 3, 1, NULL, NULL),
(42, 2, 'MT-004', 'Bánh ít lá gai Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 4.700', 0, 4700, 4300, 0, 5000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột nếp, lá gai, đường cát,&nbsp;mè, đậu hoặc dừa, không chất bảo quản, không chất tạo màu.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-004-banh-it-la-gai-binh-dinh.png', 'banh-it-la-gai-binh-dinh', 0, 1, 1, 4, 1, NULL, NULL),
(43, 2, 'MT-005', 'Bánh ít nhân mặn Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 6.700', 0, 6700, 0, 0, 7000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần:&nbsp;</strong>Bột nếp, nắm mèo, thịt xay, thịt tôm, đậu xanh, không chất bảo quản, không chất tạo màu.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-005-banh-it-nhan-man-binh-dinh.png', 'banh-it-nhan-man-binh-dinh', 0, 1, 1, 5, 1, NULL, NULL),
(44, 2, 'MT-006', 'Bánh su sê Bình Định', 14, 1, 'Đặt hàng qua website giá chỉ còn: 4.700', 0, 4700, 0, 0, 5000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Thành phần: </strong>Bột nếp, bột năng, đậu xanh, đường cát, dừa sợi.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 ngày kể từ NSX in trên bao bì. Sau 2 ngày bảo quản ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-006-banh-su-se-binh-dinh.png', 'banh-su-se-binh-dinh', 0, 1, 1, 6, 1, NULL, NULL),
(45, 2, 'MT-007', 'Bánh tét Bình Định', 17, 1, 'Đặt hàng qua website giá chỉ còn: 137.000', 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Nếp loại 1, thịt ba rọi loại ngon, đậu loại 1.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 đòn 1.5Kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1.5Kg.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 1 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-007-banh-tet-binh-dinh.png', 'banh-tet-binh-dinh', 0, 1, 1, 7, 1, NULL, NULL),
(46, 2, 'MT-008', 'Chả cá Nha Trang', 3, 3, 'Đặt hàng qua website giá chỉ còn: 72.000', 0, 72000, 62000, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% cá tươi, không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 2 miếng.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-008-cha-ca-nha-trang.png', 'cha-ca-nha-trang', 0, 1, 1, 8, 1, NULL, NULL),
(47, 2, 'MT-009', 'Chả ram tôm đất Bình Định', 3, 3, 'Đặt hàng qua website giá chỉ còn: 97.000', 0, 97000, 0, 0, 100000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tôm tươi, thịt xay, nấm mèo, gia vị, bánh tráng cuốn.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 500gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-009-cha-ram-tom-dat-binh-dinh.png', 'cha-ram-tom-dat-binh-dinh', 0, 1, 1, 9, 1, NULL, NULL),
(48, 2, 'MT-010', 'Cua xay lagi Bình Thuận', 5, 3, 'Đặt hàng qua website giá chỉ còn: 30.000', 0, 30000, 0, 0, 33000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cua tươi xay.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 250gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-010-cua-xay-lagi-binh-thuan.png', 'cua-xay-lagi-binh-thuan', 0, 1, 1, 10, 1, NULL, NULL),
(49, 2, 'MT-011', 'Đường phèn vàng Quảng Ngãi', 4, 2, 'Đặt hàng qua website giá chỉ còn: 52.000', 0, 52000, 0, 0, 55000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Kết tinh từ mật mía.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 1Kg.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1Kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;36&nbsp;tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-011-duong-phen-quang-ngai.png', 'duong-phen-quang-ngai', 1, 0, 1, 11, 1, NULL, NULL),
(50, 2, 'MT-012', 'Lạc rang tỏi ớt Lương Sơn Nghệ An', 1, 1, 'Đặt hàng qua website giá chỉ còn: 9.200', 0, 9200, 0, 0, 9500, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 50gr.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 50gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Để nơi râm mát, đảm bảo vệ sinh. Tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng ngày kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-012-lac-rang-toi-ot-luong-son.png', 'lac-rang-toi-ot-luong-son', 0, 1, 1, 12, 1, NULL, NULL);
INSERT INTO `product_pro` (`id`, `cat_id`, `code`, `title`, `capacity_id`, `datepackage_id`, `capacity`, `price_im`, `price`, `price_discount`, `price_npp`, `price_daily`, `price_ctv`, `price_private`, `price_sale1`, `price_sale2`, `content`, `brief`, `tips`, `tag`, `keyword`, `meta_description`, `image`, `re_name`, `ishot`, `isnew`, `isdefault`, `priority`, `isactive`, `updated_at`, `created_at`) VALUES
(51, 2, 'MT-013', 'Bánh dừa nướng Quảng Nam', 5, 1, 'Đặt hàng qua website giá chỉ còn: 32.000', 0, 32000, 0, 0, 35000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Gạo nếp hương và dừa bánh tẻ.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 250gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-014-banh-dua-nuong-quang-nam.png', 'banh-dua-nuong-quang-nam', 0, 1, 1, 13, 1, NULL, NULL),
(52, 2, 'MT-014', 'Bánh đậu xanh nướng nhân thịt Quảng Nam', 18, 1, 'Đặt hàng qua website giá chỉ còn: 23.000đ', 0, 23000, 0, 0, 25000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Đậu xanh, đường trắng, thịt heo, muối, hành phi, ngũ vị hương.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-015-banh-dau-xanh-nuong-nhan-thit-quang-nam_1.png', 'banh-dau-xanh-nuong-nhan-thit-quang-nam', 0, 1, 1, 14, 1, NULL, NULL),
(53, 2, 'MT-015', 'Mắm cá cơm Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 47.000đ', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-015-mam-ca-com-di-can_1.png', 'mam-ca-com-di-can', 0, 1, 1, 15, 1, NULL, NULL),
(54, 2, 'MT-016', 'Mắm cá giò Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 57.000đ', 0, 57000, 0, 0, 60000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá Giò, nếp, muối, rượu, gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-016-mam-ca-gio-di-can-2.png', 'mam-ca-gio-di-can', 0, 1, 1, 16, 1, NULL, NULL),
(55, 2, 'MT-017', 'Mắm dưa Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 63.000đ', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Dưa gang, đu đủ, cà pháo, mắm nêm.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-017-mam-dua-di-can.png', 'mam-dua-di-can', 0, 1, 1, 17, 1, NULL, NULL),
(56, 2, 'MT-018', 'Mắm mực Đà Nẵng', 3, 6, 'Đặt hàng qua website giá chỉ còn: 63.000đ', 0, 63000, 0, 0, 65000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mực, muối, ớt, tỏi.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 3 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-018-mam-muc-da-nang.png', 'mam-muc-da-nang', 0, 1, 1, 18, 1, NULL, NULL),
(57, 2, 'MT-019', 'Mắm nêm Dì Cẩn', 5, 6, 'Đặt hàng qua website giá chỉ còn: 23.000đ', 0, 23000, 0, 0, 25000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Cá cơm, muối, mì chính, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-019-mam-nem-di-can.png', 'mam-nem-di-can', 0, 1, 1, 19, 1, NULL, NULL),
(58, 2, 'MT-020', 'Mắm ruốc Dì Cẩn', 5, 6, 'Đặt hàng qua website giá chỉ còn: 45.000đ', 0, 45000, 0, 0, 48000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Mắm ruốc Dì Cẩn đặc sản Đà Nẵng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-020-mam-ruoc-di-can-2.png', 'mam-ruoc-di-can', 0, 1, 1, 20, 1, NULL, NULL),
(59, 2, 'MT-021', 'Mắm tôm chua Dì Cẩn', 3, 6, 'Đặt hàng qua website giá chỉ còn: 67.000đ', 0, 67000, 0, 0, 70000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Tôm, nếp, mắm đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Hũ nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-021-mam-tom-chu-di-can.png', 'mam-tom-chua-di-can', 0, 1, 1, 21, 1, NULL, NULL),
(60, 2, 'MT-022', 'Tép khô (ruốc khô) Nha Trang', 3, 3, 'Đặt hàng qua website giá chỉ còn: 82.000đ', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Ruốc tự nhiên được phơi sấy khô.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> Túi nhựa.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, khuyến khích trong ngăn mát tủ lạnh, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-022-tep-kho-ruoc-kho-nha-trang.png', 'tep-kho-ruoc-kho-nha-trang', 0, 1, 1, 22, 1, NULL, NULL),
(61, 2, 'MT-023', 'Giò bê bắp Nam Đàn - Nghệ An', 4, 3, 'Đặt hàng qua website giá chỉ còn: 257.000', 0, 257000, 0, 0, 260000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Thịt&nbsp;Bê tươi, gia vị,&nbsp;không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-023-gio-be-bap-nam-dan-nghe-an.png', 'gio-be-bap-nam-dan-nghe-an', 0, 1, 1, 23, 1, NULL, NULL),
(62, 2, 'MT-024', 'Mực rim me Phan Thiết', 6, 7, 'Đặt hàng qua website giá chỉ còn: 72.000', 0, 72000, 0, 0, 75000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 200gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-024-muc-rim-me-phan-thiet.png', 'muc-rim-me-phan-thiet', 0, 1, 1, 24, 1, NULL, NULL),
(63, 2, 'MT-025', 'Giò bê truyền thống Nam Đàn - Nghệ An', 4, 3, 'Đặt hàng qua website giá chỉ còn: 232.000', 0, 232000, 195000, 0, 235000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Thịt bê tươi, gia vị,&nbsp;không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn đông hoặc ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-025-gio-be-truyen-thong-nam-dan-nghe-an.png', 'gio-be-truyen-thong-nam-dan-nghe-an', 1, 1, 1, 25, 1, NULL, NULL),
(64, 2, 'MT-026', 'Đường thô mật mía Nghĩa Đàn - Nghệ An', 4, 2, 'Đặt hàng qua website giá chỉ còn: 47.000', 0, 47000, 0, 0, 50000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 1kg.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-026-duong-tho-mat-mia-nghia-dan-nghe-an.png', 'duong-tho-mat-mia-nghia-dan-nghe-an', 0, 1, 1, 26, 1, NULL, NULL),
(65, 2, 'MT-027', 'Mật mía nguyên chất Nghĩa Đàn - Nghệ An', 7, 2, 'Đặt hàng qua website giá chỉ còn: 28.000', 0, 28000, 23000, 0, 30000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-027-mat-mia-nguyen-chat-nghia-dan-nghe-an.png', 'mat-mia-nguyen-chat-nghia-dan-nghe-an', 0, 1, 1, 27, 1, NULL, NULL),
(66, 2, 'MT-028', 'Mứt sen Liên - Đặc sản Huế', 3, 1, 'Đặt hàng qua website giá chỉ còn: 112.000', 0, 112000, 0, 0, 115000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Hạt sen khô, đường.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:&nbsp;</strong>Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-028-mut-sen-lien-dac-san-hue.png', 'mut-sen-lien-dac-san-hue', 0, 1, 1, 28, 1, NULL, NULL),
(67, 2, 'MT-029', 'Kẹo đậu phộng Hoàng Bách Huế', 19, 8, 'Đặt hàng qua website giá chỉ còn: 11.000', 0, 11000, 0, 0, 12000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-029-keo-dau-phong-hoang-bach-hue.png', 'keo-dau-phong-hoang-bach-hue', 0, 1, 1, 29, 1, NULL, NULL),
(68, 2, 'MT-030', 'Mè xửng loại thượng hạng Hoàng Bách - Huế', 3, 8, 'Đặt hàng qua website giá chỉ còn: 40.000', 0, 40000, 0, 0, 43000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-030-me-xung-loai-thuong-hang-hoang-bach-hue.png', 'me-xung-loai-thuong-hang-hoang-bach-hue', 0, 1, 1, 30, 1, NULL, NULL),
(69, 2, 'MT-031', 'Mạch nha nếp Quảng Ngãi', 11, 2, 'Đặt hàng qua website giá chỉ còn: 25.000', 0, 25000, 0, 0, 27000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> 100% mầm lúa và nếp.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-031-mach-nha-nep-quang-ngai.png', 'mach-nha-nep-quang-ngai', 0, 1, 1, 31, 1, NULL, NULL),
(70, 2, 'MT-032', 'Kẹo cu đơ Hà Tĩnh', 20, 8, 'Đặt hàng qua website giá chỉ còn: 55.000', 0, 55000, 0, 0, 57000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Lạc, gừng, mật mía, đường, mạch nha, bánh tráng vừng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-031-keo-cu-do-ha-tinh.png', 'keo-cu-do-ha-tinh', 0, 1, 1, 32, 1, NULL, NULL),
(71, 2, 'MT-033', 'Mè xửng Hoàng Bách - Huế', 6, 8, 'Đặt hàng qua website giá chỉ còn: 17.000', 0, 17000, 0, 0, 18000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 6 tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-033-me-xung-hoang-bach-hue.png', 'me-xung-hoang-bach-hue', 0, 1, 1, 33, 1, NULL, NULL),
(72, 2, 'MT-034', 'Giò bò loại đặc biệt Đà Nẵng', 3, 9, 'Đặt hàng qua website giá chỉ còn: 152.000', 0, 152000, 0, 0, 155000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bò tươi, tiêu, gia vị, không hàn the, không phẩm màu, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát hoặc ngăn đông tủ lạnh.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-034-gio-bo-loai-dac-biet-da-nang.png', 'gio-bo-loai-dac-biet-da-nang', 0, 1, 1, 34, 1, NULL, NULL),
(73, 2, 'MT-035', 'Mắm tép tươi muối xổi thơm ngon loại đặc biệt - Bình Định', 3, 6, 'Đặt hàng qua website giá chỉ còn: 82.000đ', 0, 82000, 67000, 0, 85000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Ruốc, tép tươi, gia vị.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Ngăn mát tủ lạnh.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong> 12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mt-035-mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh.png', 'mam-tep-tuoi-muoi-xoi-thom-ngon-loai-dac-biet-binh-dinh', 1, 1, 1, 35, 1, NULL, NULL),
(74, 1, 'MB-007', 'Bột đậu đen nguyên chất Tiên Dung', 3, 5, 'Đặt hàng qua website giá chỉ còn: 45.000', 0, 45000, 0, 0, 48000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong>&nbsp;Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong>&nbsp;Bột đậu đen&nbsp;nguyên chất, không chất bảo quản.</p>\r\n\r\n<p><strong>Xuất xứ:</strong>&nbsp;Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong>&nbsp;Bịch 500gr gồm 10 gói nhỏ.</p>\r\n\r\n<p><strong>Khối lượng:</strong>&nbsp;500gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong>&nbsp;In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong>&nbsp;Nơi khô ráo, tránh ánh nắng trực tiếp.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;12 tháng kể từ NSX in trên bao bì.</p>\r\n\r\n<p><strong>Giao hàng:</strong>&nbsp;Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'bot-dau-den-nguyen-chat-tien-dung.png', 'bot-dau-den-nguyen-chat-tien-dung', 0, 1, 1, 7, 1, NULL, NULL),
(75, 3, 'MN-17', 'Bánh pía chay Mỹ Ngọc - Sóc Trăng', 11, 1, 'Đặt hàng qua website giá chỉ còn: 85.000', 0, 85000, 0, 0, 87000, 0, 0, 0, 0, NULL, '<p><strong>Tình trạng:</strong> Còn hàng, luôn mới.</p>\r\n\r\n<p><strong>Thành phần:</strong> Bột, đậu xanh, sầu riêng.</p>\r\n\r\n<p><strong>Xuất xứ:</strong> Việt Nam.</p>\r\n\r\n<p><strong>Quy cách đóng gói:</strong> 1 túi 4 cái.</p>\r\n\r\n<p><strong>Khối lượng:</strong> 400gr.</p>\r\n\r\n<p><strong>Ngày sản xuất:</strong> In trên nhãn.</p>\r\n\r\n<p><strong>Bảo quản:</strong> Nơi khô ráo, thoáng mát.</p>\r\n\r\n<p><strong>Hạn sử dụng:</strong>&nbsp;6&nbsp;tháng kể từ ngày sản xuất.</p>\r\n\r\n<p><strong>Giao hàng:</strong> Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</p>', NULL, NULL, NULL, NULL, 'mn-17-banh-pia-chay-my-ngoc-soc-trang.png', 'banh-pia-chay-my-ngoc-soc-trang', 0, 1, 1, 17, 1, NULL, NULL),
(77, 2, 'MT-036', 'Rong mứt nấu canh/Rong biển khô Nha Trang', 2, 2, 'Đặt hàng qua website giá chỉ còn: 82.000', 0, 82000, 0, 0, 85000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% rong biển.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mt-036-rong-mut-nau-canh-rong-bien-kho-nha-trang.png', 'rong-mut-nau-canh-rong-bien-kho-nha-trang', 0, 1, 1, 36, 1, NULL, NULL),
(78, 3, 'MN-18', 'Bánh thuyền Mix hạt', 3, 1, 'Đặt hàng qua website giá chỉ còn: 45.000', 0, 45000, 0, 0, 47000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành Phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Hạnh nhân, Hạt điều, Bí xanh, Yến mạch, gạo lứt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Việt Nam.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Quy cách đóng gói</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Túi nhựa.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Nơi khô ráo, thoáng mát, tránh ánh nắng mặt trời, </span></span></span></span></span></span><span style=\"font-size:11.5pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"background-color:#ffffff\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">tránh gió lùa</span></span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng kể từ NSX in trên bao bì.&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mn-018-banh-thuyen-mix-hat.png', 'banh-thuyen-mix-hat', 0, 1, 1, 18, 1, NULL, NULL),
(79, 4, 'NN-01', 'Lạp xưởng nạc loại đặc biệt Campuchia', 3, 3, 'Đặt hàng qua website giá chỉ còn: 127.000', 0, 127000, 0, 0, 130000, 0, 0, 0, 0, NULL, '<p><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình Trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% Thịt heo tươi ngon, tiêu hột, ngũ vị hương, gia vị.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-01-lap-xuong-nac-loai-dac-biet-campuchia.png', 'lap-xuong-nac-loai-dac-biet-campuchia', 0, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `product_pro` (`id`, `cat_id`, `code`, `title`, `capacity_id`, `datepackage_id`, `capacity`, `price_im`, `price`, `price_discount`, `price_npp`, `price_daily`, `price_ctv`, `price_private`, `price_sale1`, `price_sale2`, `content`, `brief`, `tips`, `tag`, `keyword`, `meta_description`, `image`, `re_name`, `ishot`, `isnew`, `isdefault`, `priority`, `isactive`, `updated_at`, `created_at`) VALUES
(80, 4, 'NN-02', 'Khô Cá Tra Phồng Biển Hồ Campuchia', 3, 10, 'Đặt hàng qua website giá chỉ còn: 117.000', 0, 120000, 0, 0, 117000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% cá tra, muối biển, không phẩm màu, không chất bảo quản.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh, luôn giữ kín bao bì.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'mn-02-kho-ca-tra-phong-bien-ho-campuchia.png', 'kho-ca-tra-phong-bien-ho-campuchia', 0, 1, 1, 2, 1, NULL, NULL),
(81, 4, 'NN-03', 'Khô cá lóc Biển Hồ Campuchia', 3, 10, 'Đặt hàng qua website giá chỉ còn: 137.000', 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 100% cá lóc, muối biển, không phẩm màu, không chất bảo quản.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 500gr.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 6 tháng (bảo quản ngăn mát), 1 năm (bảo quản ngăn đông).</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Ngăn mát hoặc ngăn đông tủ lạnh, luôn giữ kín bao bì.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: </span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500 nghìn đồng phí giao hàng là 25.000đ và phát sinh phí nếu ở khu vực xa. Giao nhanh từ 1 đến 3 ngày tùy vào khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi nhận, thanh toán khi nhận hàng, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-03-kho-ca-loc-bien-ho-campuchia.png', 'kho-ca-loc-bien-ho-campuchia', 0, 1, 1, 3, 1, NULL, NULL),
(82, 4, 'NN-04', 'Đường Thốt nốt hũ hoặc viên nguyên chất Campuchia', 4, 2, 'Đặt hàng qua website giá chỉ còn: 65.000', 0, 65000, 0, 0, 68000, 0, 0, 0, 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Tình trạng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Còn hàng, luôn mới.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Xuất xứ</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Camphuchia.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Thành phần</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Mật hoa đường thốt nốt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Khối lượng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 1kg.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Ngày sản xuất</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: In trên nhãn.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Hạn sử dụng</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: 12 tháng kể từ ngày sản xuất.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Bảo quản:</span></span></span></span></span></span><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\"> Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"line-height:1.7307692307692306; text-align:justify\"><span style=\"font-size:12pt; font-variant:normal; white-space:pre-wrap\"><span style=\"font-family:Roboto,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:700\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">Giao hàng</span></span></span></span></span><span style=\"font-family:Arial,sans-serif\"><span style=\"color:#67696f\"><span style=\"font-weight:400\"><span style=\"font-style:normal\"><span style=\"text-decoration:none\">: Miễn phí giao hàng cho đơn từ 500.000đ trở lên (khu vực TP. HCM), đơn ít hơn 500.000đ phí giao hàng là 25.000đ. Giao nhanh từ 1 đến 3 ngày tùy theo khu vực (để đảm bảo hàng luôn tươi mới), được kiểm tra hàng trước khi thanh toán, đổi trả nếu không ưng ý.</span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'nn-04-duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia.png', 'duong-thot-not-hu-hoac-vien-nguyen-chat-campuchia', 0, 1, 1, 4, 1, NULL, NULL),
(83, 5, 'XH-001', 'Thịt Dê hấp, xào các loại (500gr)', 25, 3, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>Thịt dê được chế biến sẵn, tặng thêm đậu bắp, nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'thit-de-hap-xao-cac-loai-1.png', 'thit-de-hap-xao-cac-loai', 0, 1, 1, 1, 1, NULL, NULL),
(84, 5, 'XH-002', 'Thịt Dê nướng các loại (500gr)', 28, 3, NULL, 0, 137000, 0, 0, 140000, 0, 0, 0, 0, NULL, '<p>Thịt dê đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'thit-de-nuong-cac-loai.png', 'thit-de-nuong-cac-loai', 0, 1, 1, 2, 1, NULL, NULL),
(85, 5, 'XH-003', 'Vú heo nướng các loại (500gr)', 28, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Vú heo&nbsp;đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'vu-heo-nuong-cac-loai1.png', 'vu-heo-nuong-cac-loai', 0, 1, 1, 3, 1, NULL, NULL),
(86, 5, 'XH-004', 'Heo rừng hấp, xào các loại (500gr)', 27, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Thịt Heo rừng lai&nbsp;đã được ướp sẵn chỉ cần bật bếp lên hấp, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'heo-rung-hap-xao-cac-loai1.png', 'heo-rung-hap-xao-cac-loai', 0, 1, 1, 4, 1, NULL, NULL),
(87, 5, 'XH-005', 'Heo rừng nướng các loại (500gr)', 28, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Thịt Heo rừng lai&nbsp;đã được ướp sẵn chỉ cần bật bếp lên và nướng, được tặng kèm đậu bắp và nước chấm đặc biệt</p>', NULL, NULL, NULL, NULL, 'heo-rung-nuong-cac-loai1.png', 'heo-rung-nuong-cac-loai', 0, 1, 1, 5, 1, NULL, NULL),
(88, 5, 'XH-006', 'Giò Heo nấu giả cầy chuẩn vị Bắc', 3, 3, NULL, 0, 107000, 0, 0, 110000, 0, 0, 0, 0, NULL, '<p>Giò&nbsp;Heo đã được chế biến và ướp sẵn, chỉ cần bật bếp lên và nấu</p>', NULL, NULL, NULL, NULL, 'thit-heo-nau-gia-cay1.png', 'thit-heo-nau-gia-cay', 0, 1, 1, 6, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route_language`
--

CREATE TABLE `route_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `controlleract` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `middleware` varchar(255) DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `language_id` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(190) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(190) NOT NULL,
  `instance` varchar(190) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taggables`
--

CREATE TABLE `taggables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taggables`
--

INSERT INTO `taggables` (`id`, `tags_id`, `taggable_id`, `taggable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'App\\Models\\News', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `re_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `re_name`, `created_at`, `updated_at`) VALUES
(1, 'Ẩm thực Việt Nam', 'am-thuc-viet-nam', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagecode` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `brief` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `popup` tinyint(4) DEFAULT 0,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `tbl_companyinfo`
--

CREATE TABLE `tbl_companyinfo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `font_icon` varchar(255) DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Cấu trúc bảng cho bảng `tbl_function`
--

CREATE TABLE `tbl_function` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `controlleract` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `title_vn` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `function_tab` varchar(255) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `can_grant` tinyint(4) NOT NULL DEFAULT 0,
  `isshow` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `tbl_language`
--

CREATE TABLE `tbl_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(255) DEFAULT NULL,
  `url_name` varchar(255) DEFAULT NULL,
  `flag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_language`
--

INSERT INTO `tbl_language` (`id`, `lang_name`, `url_name`, `flag`) VALUES
(2, 'Vietnam', 'vi', 'flags_vn.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_mailmanager`
--

CREATE TABLE `tbl_mailmanager` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_pagging`
--

CREATE TABLE `tbl_pagging` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `numofpage` int(11) NOT NULL DEFAULT 1,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_pagging`
--

INSERT INTO `tbl_pagging` (`id`, `title`, `route_name`, `numofpage`, `language_id`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Miền Bắc', 'product', 16, 2, 1, '2024-12-27 14:51:27', '2025-01-17 05:08:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_permission`
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
-- Cấu trúc bảng cho bảng `tbl_province`
--

CREATE TABLE `tbl_province` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` tinytext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `star_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipper`
--

CREATE TABLE `tbl_shipper` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT 1,
  `priority` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_staticpage`
--

CREATE TABLE `tbl_staticpage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `pagecode` varchar(255) NOT NULL,
  `brief` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `htmlfile` varchar(255) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` int(11) NOT NULL DEFAULT 1,
  `isdefault` tinyint(4) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Cấu trúc bảng cho bảng `tbl_transaction`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transport_fee`
--

CREATE TABLE `transport_fee` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `fee` int(4) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 2,
  `priority` tinyint(4) NOT NULL DEFAULT 0,
  `isactive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transport_fee`
--

INSERT INTO `transport_fee` (`id`, `title`, `fee`, `language_id`, `priority`, `isactive`) VALUES
(1, 'Đơn ít hơn 500.000đ phí giao hàng là:', 25000, 2, 1, 1),
(2, 'Miễn phí giao hàng đơn từ 500.000đ', 0, 2, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isadmin` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_id` tinyint(4) NOT NULL DEFAULT 1,
  `isactive` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `agent_commission`
--
ALTER TABLE `agent_commission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `agent_level`
--
ALTER TABLE `agent_level`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banner_type`
--
ALTER TABLE `banner_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `config_mailsmtp`
--
ALTER TABLE `config_mailsmtp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact_mail`
--
ALTER TABLE `contact_mail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `meta_header`
--
ALTER TABLE `meta_header`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news_cat`
--
ALTER TABLE `news_cat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_request`
--
ALTER TABLE `order_request`
  ADD PRIMARY KEY (`orderid`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `product_capacity`
--
ALTER TABLE `product_capacity`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_cat`
--
ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_datepackage`
--
ALTER TABLE `product_datepackage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_imexport`
--
ALTER TABLE `product_imexport`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_imexport_history`
--
ALTER TABLE `product_imexport_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_orderdetail`
--
ALTER TABLE `product_orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order_history`
--
ALTER TABLE `product_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order_return`
--
ALTER TABLE `product_order_return`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order_status`
--
ALTER TABLE `product_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order_unc`
--
ALTER TABLE `product_order_unc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_photo`
--
ALTER TABLE `product_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`pro_id`);

--
-- Chỉ mục cho bảng `product_price_history`
--
ALTER TABLE `product_price_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_pro`
--
ALTER TABLE `product_pro`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `route_language`
--
ALTER TABLE `route_language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Chỉ mục cho bảng `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_companyinfo`
--
ALTER TABLE `tbl_companyinfo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_function`
--
ALTER TABLE `tbl_function`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_mailmanager`
--
ALTER TABLE `tbl_mailmanager`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_pagging`
--
ALTER TABLE `tbl_pagging`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_province`
--
ALTER TABLE `tbl_province`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_shipper`
--
ALTER TABLE `tbl_shipper`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_staticpage`
--
ALTER TABLE `tbl_staticpage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transport_fee`
--
ALTER TABLE `transport_fee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT cho bảng `agent_commission`
--
ALTER TABLE `agent_commission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `agent_level`
--
ALTER TABLE `agent_level`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `banner_type`
--
ALTER TABLE `banner_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `config_mailsmtp`
--
ALTER TABLE `config_mailsmtp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact_mail`
--
ALTER TABLE `contact_mail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `news_cat`
--
ALTER TABLE `news_cat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_capacity`
--
ALTER TABLE `product_capacity`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `product_cat`
--
ALTER TABLE `product_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_datepackage`
--
ALTER TABLE `product_datepackage`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `product_imexport`
--
ALTER TABLE `product_imexport`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product_imexport_history`
--
ALTER TABLE `product_imexport_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_orderdetail`
--
ALTER TABLE `product_orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_order_history`
--
ALTER TABLE `product_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_order_return`
--
ALTER TABLE `product_order_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_order_status`
--
ALTER TABLE `product_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_order_unc`
--
ALTER TABLE `product_order_unc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_photo`
--
ALTER TABLE `product_photo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=893;

--
-- AUTO_INCREMENT cho bảng `product_price_history`
--
ALTER TABLE `product_price_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_pro`
--
ALTER TABLE `product_pro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `route_language`
--
ALTER TABLE `route_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_companyinfo`
--
ALTER TABLE `tbl_companyinfo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tbl_function`
--
ALTER TABLE `tbl_function`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1140;

--
-- AUTO_INCREMENT cho bảng `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_mailmanager`
--
ALTER TABLE `tbl_mailmanager`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_pagging`
--
ALTER TABLE `tbl_pagging`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_province`
--
ALTER TABLE `tbl_province`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_shipper`
--
ALTER TABLE `tbl_shipper`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_staticpage`
--
ALTER TABLE `tbl_staticpage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transport_fee`
--
ALTER TABLE `transport_fee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
