-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 15, 2026 lúc 03:03 PM
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
-- Cơ sở dữ liệu: `tripmate`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Biển'),
(2, 'Núi'),
(3, 'Thành phố'),
(4, 'Thiên nhiên'),
(5, 'Văn hóa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checklists`
--

CREATE TABLE `checklists` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(180) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `item_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `checklists`
--

INSERT INTO `checklists` (`id`, `trip_id`, `item_name`, `is_completed`, `item_order`, `created_at`) VALUES
(1, 1, 'CCCD / giấy tờ tùy thân', 1, 1, '2026-09-14 08:06:31'),
(2, 1, 'Sạc dự phòng', 0, 2, '2026-09-14 08:06:31'),
(3, 1, 'Kem chống nắng', 0, 3, '2026-09-14 08:06:31'),
(4, 1, 'Áo khoác mỏng', 0, 4, '2026-09-14 08:06:31'),
(6, 4, 'cầm theo tiền', 0, 0, '2026-09-15 12:42:41'),
(7, 5, 'cầm theo tiền', 0, 0, '2026-09-15 12:54:44'),
(8, 5, 'cầm theo cái não', 0, 1, '2026-09-15 12:54:46'),
(9, 5, 'ví có giấy tờ để công an có bắt thì còn biết đường về', 0, 2, '2026-09-15 12:54:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checklist_progress`
--

CREATE TABLE `checklist_progress` (
  `id` int(10) UNSIGNED NOT NULL,
  `checklist_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `checklist_progress`
--

INSERT INTO `checklist_progress` (`id`, `checklist_id`, `user_id`, `is_completed`, `updated_at`) VALUES
(1, 1, 3, 0, '2026-09-14 08:15:39'),
(2, 2, 3, 0, '2026-09-14 08:15:39'),
(3, 3, 3, 0, '2026-09-14 08:15:39'),
(4, 4, 3, 0, '2026-09-14 08:15:39'),
(18, 6, 3, 1, '2026-09-15 12:42:44'),
(26, 7, 4, 1, '2026-09-15 12:55:00'),
(29, 8, 4, 1, '2026-09-15 12:55:01'),
(32, 9, 4, 1, '2026-09-15 12:55:02'),
(35, 7, 3, 0, '2026-09-15 12:54:56'),
(36, 8, 3, 0, '2026-09-15 12:54:56'),
(37, 9, 3, 0, '2026-09-15 12:54:56'),
(51, 6, 4, 0, '2026-09-15 12:55:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `destinations`
--

CREATE TABLE `destinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `notes` text DEFAULT NULL,
  `average_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rating` decimal(2,1) NOT NULL DEFAULT 0.0,
  `image_url` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `notes`, `average_cost`, `rating`, `image_url`, `is_active`, `created_at`) VALUES
(1, 'Hà Nội', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(2, 'Hồ Chí Minh', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(3, 'Đà Nẵng', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(4, 'Hải Phòng', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(5, 'Cần Thơ', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(6, 'An Giang', '', 0.00, 0.0, 'https://cdn3.ivivu.com/2025/12/du-lich-an-giang-ivivu-1.png', 1, '2026-09-14 08:47:31'),
(7, 'Bà Rịa - Vũng Tàu', '', 0.00, 0.0, 'https://i2.ex-cdn.com/crystalbay.com/files/content/2025/05/15/tai-sao-co-ten-ba-ria-vung-tau-3-1534.jpg', 1, '2026-09-14 08:47:31'),
(8, 'Bắc Giang', '', 0.00, 0.0, 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/10/28/1110122/4-CDE-948755-03.jpg', 1, '2026-09-14 08:47:31'),
(9, 'Bắc Kạn', '', 0.00, 0.0, 'https://ik.imagekit.io/tvlk/blog/2021/09/kinh-nghiem-du-lich-bac-kan-2.jpg', 1, '2026-09-14 08:47:31'),
(10, 'Bạc Liêu', '', 0.00, 0.0, 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/12/1/1122790/Bac-Lieu-1.jpg', 1, '2026-09-14 08:47:31'),
(11, 'Bắc Ninh', '', 0.00, 0.0, 'https://nqs.1cdn.vn/2026/09/10/5E56_bac-ninh-len-tp-truc-thuoc-trung-uong.jpg', 1, '2026-09-14 08:47:31'),
(12, 'Bến Tre', '', 0.00, 0.0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-DdO-mpXt746nBAgw9pJEV8UWgXZSeVeuvuS9xfSnHy-4D6X6GjGrcH0&s=10', 1, '2026-09-14 08:47:31'),
(13, 'Bình Định', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(14, 'Bình Dương', '', 0.00, 0.0, 'https://ik.imagekit.io/tvlk/blog/2022/02/dia-diem-du-lich-binh-duong-cover-1.jpg', 1, '2026-09-14 08:47:31'),
(15, 'Bình Phước', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(16, 'Bình Thuận', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(17, 'Cà Mau', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(18, 'Cao Bằng', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(19, 'Đắk Lắk', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(20, 'Đắk Nông', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(21, 'Điện Biên', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(22, 'Đồng Nai', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(23, 'Đồng Tháp', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(24, 'Gia Lai', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(25, 'Hà Giang', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(26, 'Hà Nam', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(27, 'Hà Tĩnh', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(28, 'Hải Dương', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(29, 'Hậu Giang', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(30, 'Hòa Bình', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(31, 'Hưng Yên', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(32, 'Khánh Hòa', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(33, 'Kiên Giang', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(34, 'Kon Tum', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(35, 'Lai Châu', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(36, 'Lâm Đồng', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(37, 'Lạng Sơn', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(38, 'Lào Cai', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(39, 'Long An', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(40, 'Nam Định', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(41, 'Nghệ An', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(42, 'Ninh Bình', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(43, 'Ninh Thuận', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(44, 'Phú Thọ', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(45, 'Phú Yên', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(46, 'Quảng Bình', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(47, 'Quảng Nam', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(48, 'Quảng Ngãi', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(49, 'Quảng Ninh', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(50, 'Quảng Trị', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(51, 'Sóc Trăng', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(52, 'Sơn La', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(53, 'Tây Ninh', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(54, 'Thái Bình', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(55, 'Thái Nguyên', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(56, 'Thanh Hóa', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(57, 'Thừa Thiên Huế', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(58, 'Tiền Giang', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(59, 'Trà Vinh', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(60, 'Tuyên Quang', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(61, 'Vĩnh Long', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(62, 'Vĩnh Phúc', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31'),
(63, 'Yên Bái', NULL, 0.00, 0.0, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 1, '2026-09-14 08:47:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `paid_by` int(10) UNSIGNED NOT NULL,
  `category` varchar(80) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expense_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expenses`
--

INSERT INTO `expenses` (`id`, `trip_id`, `paid_by`, `category`, `amount`, `description`, `expense_date`) VALUES
(1, 1, 2, 'Khách sạn', 1500000.00, '2 đêm', '2026-09-10'),
(2, 1, 2, 'Ăn uống', 500000.00, 'Ngày 1', '2026-09-10'),
(3, 1, 2, 'Di chuyển', 700000.00, 'Xe + xăng', '2026-09-10'),
(4, 4, 3, 'mua đồ', 200000.00, 'mua vật dụng', '2026-09-15'),
(5, 5, 4, 'mua đồ', 3000.00, 'mua vật dụng', '2026-09-15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `location_id`, `created_at`) VALUES
(2, 3, 57, '2026-09-15 07:53:38'),
(3, 3, 29, '2026-09-15 12:43:24'),
(4, 4, 29, '2026-09-15 12:53:21'),
(5, 4, 86, '2026-09-15 12:53:23'),
(6, 4, 34, '2026-09-15 12:53:31'),
(7, 3, 86, '2026-09-15 12:56:44'),
(8, 3, 34, '2026-09-15 12:56:45'),
(9, 3, 121, '2026-09-15 12:56:46'),
(10, 3, 206, '2026-09-15 12:56:46'),
(11, 3, 186, '2026-09-15 12:56:47'),
(12, 3, 171, '2026-09-15 12:56:48'),
(13, 3, 122, '2026-09-15 12:56:48'),
(14, 3, 180, '2026-09-15 12:57:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `day_number` int(10) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `itineraries`
--

INSERT INTO `itineraries` (`id`, `trip_id`, `location_id`, `day_number`, `start_time`, `end_time`, `note`) VALUES
(1, 1, 1, 1, '08:00:00', '09:00:00', 'Ăn sáng + cà phê'),
(2, 1, 1, 1, '10:00:00', '12:00:00', 'Khám phá trung tâm'),
(3, 1, 5, 2, '09:00:00', '12:00:00', 'Gợi ý điểm thiên nhiên'),
(4, 4, 180, 1, '20:42:00', '08:42:00', 'đi chùa'),
(5, 5, 32, 1, '21:54:00', '12:54:00', 'đi chơi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `average_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rating` decimal(2,1) NOT NULL DEFAULT 0.0,
  `image_url` varchar(500) DEFAULT NULL,
  `destination` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `locations`
--

INSERT INTO `locations` (`id`, `category_id`, `destination_id`, `name`, `address`, `description`, `average_cost`, `rating`, `image_url`, `destination`, `created_at`, `price`) VALUES
(1, 1, 1, 'Hồ Hoàn Kiếm & Đền Ngọc Sơn', 'Q. Hoàn Kiếm', 'Biểu tượng trái tim thủ đô, gắn liền với truyền thuyết trả gươm thần.', 0.00, 4.9, 'https://sovhtt.hanoi.gov.vn/wp-content/uploads/2017/06/1-79-600x402.jpg', 'Hà Nội', '2026-09-14 08:47:31', 250000.00),
(2, 2, 1, 'Lăng Chủ tịch Hồ Chí Minh', 'Q. Ba Đình', 'Nơi lưu giữ thi hài vị lãnh tụ kính yêu của dân tộc Việt Nam.', 0.00, 4.9, 'https://static.vinwonders.com/production/lang-chu-tich-ho-chi-minh-1.jpg', 'Hà Nội', '2026-09-14 08:47:31', 250000.00),
(3, 3, 1, 'Văn Miếu - Quốc Tử Giám', 'Q. Đống Đa', 'Trường đại học đầu tiên của Việt Nam, nơi tôn vinh truyền thống hiếu học.', 30000.00, 4.8, 'https://statics.vinpearl.com/van-mieu-quoc-tu-giam_1752765746.jpg', 'Hà Nội', '2026-09-14 08:47:31', 50000.00),
(4, 4, 1, 'Phố cổ Hà Nội', 'Q. Hoàn Kiếm', 'Khu phố 36 phố phường với nét văn hóa ẩm thực và kiến trúc độc đáo.', 100000.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/pho-co-ha-noi-6-1731039789.jpg', 'Hà Nội', '2026-09-14 08:47:31', 50000.00),
(5, 5, 1, 'Hồ Tây & Chùa Trấn Quốc', 'Q. Tây Hồ', 'Hồ nước lớn nhất thủ đô và ngôi chùa cổ kính bậc nhất.', 0.00, 4.8, 'https://hoangthanhthanglong.vn/wp-content/uploads/2023/05/chuatranquoc1.jpg', 'Hà Nội', '2026-09-14 08:47:31', 250000.00),
(6, 1, 2, 'Chợ Bến Thành', 'Q.1', 'Biểu tượng giao thương lâu đời và sầm uất bậc nhất Sài Gòn.', 150000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/cho-ben-thanh-cover-1693128271.jpeg', 'Hồ Chí Minh', '2026-09-14 08:47:31', 50000.00),
(7, 2, 2, 'Dinh Độc Lập', 'Q.1', 'Di tích lịch sử quan trọng chứng kiến sự kiện thống nhất đất nước.', 40000.00, 4.8, 'https://dinhdoclap.gov.vn/wp-content/uploads/2025/12/dinh-doc-lap-bieu-tuong-hoa-binh-giua-long-do-thi-hien-dai-9944.jpg', 'Hồ Chí Minh', '2026-09-14 08:47:31', 50000.00),
(8, 3, 2, 'Nhà thờ Đức Bà & Bưu điện trung tâm', 'Q.1', 'Kiến trúc Pháp cổ kính mang tính biểu tượng của thành phố.', 0.00, 4.8, 'https://cdn.xanhsm.com/2024/11/a926ac35-nha-tho-duc-ba-11-min.jpg', 'Hồ Chí Minh', '2026-09-14 08:47:31', 50000.00),
(9, 4, 2, 'Phố đi bộ Nguyễn Huệ', 'Q.1', 'Tuyến phố hiện đại, nơi diễn ra các hoạt động vui chơi giải trí sầm uất.', 50000.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/pho-di-bo-nguyen-hue-1-1691590967.jpg', 'Hồ Chí Minh', '2026-09-14 08:47:31', 80000.00),
(10, 5, 2, 'Bến Nhà Rồng', 'Q.4', 'Nơi Bác Hồ ra đi tìm đường cứu nước năm 1911.', 20000.00, 4.8, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/09/anh1-5.png', 'Hồ Chí Minh', '2026-09-14 08:47:31', 50000.00),
(11, 1, 3, 'Cầu Rồng Đà Nẵng', 'Q. Hải Châu', 'Cây cầu độc đáo có khả năng phun lửa và phun nước vào cuối tuần.', 0.00, 4.9, 'https://ik.imagekit.io/tvlk/blog/2024/10/cau-rong-da-nang-3.png?tr=q-70,c-at_max,w-1000,h-600', 'Đà Nẵng', '2026-09-14 08:47:31', 0.00),
(12, 2, 3, 'Bà Nà Hills', 'H. Hòa Vang', 'Khu du lịch nổi tiếng với Cầu Vàng và kiến trúc châu Âu.', 900000.00, 4.9, 'https://www.kkday.com/vi/blog/wp-content/uploads/ba-na-hills-o-dau.jpg', 'Đà Nẵng', '2026-09-14 08:47:31', 50000.00),
(13, 3, 3, 'Bãi biển Mỹ Khê', 'Q. Ngũ Hành Sơn', 'Một trong những bãi biển quyến rũ nhất hành tinh.', 0.00, 4.9, 'https://sun-ecommerce-cdn.azureedge.net/ecommerce/service-sites/asset/SunWorld/swold/8-kinh-nghiem-du-lich-bien-my-khe-da-nang-2024-nhat-dinh-phai-biet-6056/Quang-canh-bien-My-Khe.png', 'Đà Nẵng', '2026-09-14 08:47:31', 290000.00),
(14, 4, 3, 'Danh thắng Ngũ Hành Sơn', 'Q. Ngũ Hành Sơn', 'Quần thể núi đá vôi với các hang động và chùa chiền linh thiêng.', 40000.00, 4.8, 'https://images.vietnamtourism.gov.vn/vn/images/2023/thang_4/1204.nhs-_tuyet_tac_cua_thien_nhien_3.jpg', 'Đà Nẵng', '2026-09-14 08:47:31', 50000.00),
(15, 5, 3, 'Chùa Linh Úng Sơn Trà', 'Q. Sơn Trà', 'Nơi có tượng Phật Quan Thế Âm cao nhất Việt Nam.', 0.00, 4.9, 'https://www.dulichvn.org.vn/nhaptin/uploads/images/2022/Thang11/2211Chua-Linh-Ung-Bai-But--linh-thieng-tren-ban-dao-Son-Tra.jpg', 'Đà Nẵng', '2026-09-14 08:47:31', 50000.00),
(16, 1, 4, 'Bãi biển Đồ Sơn', 'Q. Đồ Sơn', 'Khu nghỉ mát và tắm biển nổi tiếng miền Bắc.', 0.00, 4.5, 'https://www.homepaylater.vn/static/c1b445c49bdfb2ee90e8e1e475dc83f5/0dffa/10_dao_hon_dau_voi_vi_tri_va_phong_canh_tuyet_dep_mang_den_khong_gian_yen_tinh_b9757c30a7.jpg\r\n', 'Hải Phòng', '2026-09-14 08:47:31', 290000.00),
(17, 2, 4, 'Quần đảo Cát Bà', 'H. Cát Hải', 'Khu dự trữ sinh quyển thế giới với cảnh quan vịnh biển tuyệt đẹp.', 200000.00, 4.8, 'https://static.vinwonders.com/production/2025/04/cat-ba-thumb.jpg', 'Hải Phòng', '2026-09-14 08:47:31', 50000.00),
(18, 3, 4, 'Khu di tích Tràng Kênh', 'H. Thủy Nguyên', 'Quần thể di tích lịch sử và danh thắng núi đá vôi ven sông.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/khu-di-tich-bach-dang-trang-kenh-trang-su-vang-cua-vung-dat-hoa-phuong-do-1-1646972988.jpg\r\n', 'Hải Phòng', '2026-09-14 08:47:31', 50000.00),
(19, 4, 4, 'Nhà hát lớn Hải Phòng', 'Q. Hồng Bàng', 'Công trình kiến trúc Pháp tiêu biểu tại đất cảng.', 0.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW-VPV5TaEgsBvCHXpblN3TxQu_idoj-TZ4Ck3qLUTwzYy0WetG4nJCczG&s=10', 'Hải Phòng', '2026-09-14 08:47:31', 50000.00),
(20, 5, 4, 'Tuyệt Tình Cốc Hải Phòng', 'H. Thủy Nguyên', 'Hồ nước xanh ngọc bích độc đáo giữa lòng núi đá.', 20000.00, 4.6, 'https://www.homepaylater.vn/static/2979830db685105d400726d139d7ccb0/9f6eb/9_ban_nen_luu_y_tuyet_doi_khong_tiep_xuc_voi_nuoc_ho_6a23f8756c.jpg', 'Hải Phòng', '2026-09-14 08:47:31', 50000.00),
(21, 1, 5, 'Chợ nổi Cái Răng', 'Q. Cái Răng', 'Chợ nổi tiêu biểu và sầm uất nhất miền Tây Nam Bộ.', 150000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBakmJxyIfYuZeddgOx8AyyjOn9Z7UW4geGhN-HFOT77yrEhrx3ObjclQF&s=10', 'Cần Thơ', '2026-09-14 08:47:31', 50000.00),
(22, 2, 5, 'Bến Ninh Kiều', 'Q. Ninh Kiều', 'Biểu tượng du lịch bên bờ sông Hậu thơ mộng.', 0.00, 4.7, 'https://timtour.vn/files/images/Choi-o-dau/ben-ninh-kieu-2.jpg', 'Cần Thơ', '2026-09-14 08:47:31', 50000.00),
(23, 3, 5, 'Nhà cổ Bình Thủy', 'Q. Bình Thủy', 'Ngôi nhà cổ hơn 100 năm với kiến trúc Đông Tây kết hợp.', 30000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIVmOx294oS13XKyA2MgcSdyT_N1c-a_G68meHgTuoZ10ys1cbi9P78o_y&s=10', 'Cần Thơ', '2026-09-14 08:47:31', 50000.00),
(24, 4, 5, 'Vườn cò Bằng Lăng', 'H. Thốt Nốt', 'Sân chim tự nhiên lớn bậc nhất vùng đồng bằng sông Cửu Long.', 40000.00, 4.6, 'https://ik.imagekit.io/tvlk/blog/2023/07/vuon-co-bang-lang-7.jpg?tr=q-70,c-at_max,w-1000,h-600', 'Cần Thơ', '2026-09-14 08:47:31', 80000.00),
(25, 5, 5, 'Thiền viện Trúc Lâm Phương Nam', 'H. Phong Điền', 'Ngôi thiền viện lớn nhất miền Tây theo kiến trúc thời Lý - Trần.', 0.00, 4.8, 'https://images2.thanhnien.vn/528068263637045248/2026/2/1/anh-3-17699318983072096617418.jpg', 'Cần Thơ', '2026-09-14 08:47:31', 50000.00),
(26, 1, 6, 'Rừng tràm Trà Sư', 'H. Tịnh Biên', 'Khu rừng ngập nước tiêu biểu cho vùng Tây Nam Bộ.', 150000.00, 4.8, 'https://images.vietnamtourism.gov.vn/vn//images/2021/CNMN/Thang5/7.5.rung_tram_tra_su__an_giang.jpg', 'An Giang', '2026-09-14 08:47:31', 50000.00),
(27, 2, 6, 'Miếu Bà Chúa Xứ Núi Sam', 'TP. Châu Đốc', 'Trung tâm hành hương tâm linh nổi tiếng linh thiêng.', 0.00, 4.9, 'https://static.vinwonders.com/production/2025/09/chua-hang-nui-sam.jpg', 'An Giang', '2026-09-14 08:47:31', 50000.00),
(28, 3, 6, 'Núi Cấm (Thiên Cấm Sơn)', 'H. Tịnh Biên', 'Ngọn núi cao và hùng vĩ nhất vùng Thất Sơn.', 50000.00, 4.8, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/02/nui-cam-an-giang-1.png', 'An Giang', '2026-09-14 08:47:31', 50000.00),
(29, 4, 6, 'Hồ Lat Cốt (Hồ Tà Pạ)', 'H. Tri Tôn', 'Hồ nước trên núi nhân tạo có màu xanh ngọc bích tuyệt đẹp.', 0.00, 5.0, 'https://static.vinwonders.com/production/2025/09/ho-ta-pa-an-giang.jpg', 'An Giang', '2026-09-14 08:47:31', 250000.00),
(30, 5, 6, 'Búng Bình Thiên', 'H. An Phú', 'Hồ nước ngọt tự nhiên lớn nhất miền Tây đầy thơ mộng.', 100000.00, 4.6, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/02/hinh-anh-bung-binh-thien-an-giang.png', 'An Giang', '2026-09-14 08:47:31', 50000.00),
(31, 1, 7, 'Bãi Trước & Bãi Sau', 'TP. Vũng Tàu', 'Các bãi tắm sầm uất và nổi tiếng nhất phố biển Vũng Tàu.', 0.00, 4.7, 'https://owa.bestprice.vn/images/destinations/uploads/bai-truoc-609ca7036edb7.jpg', 'Bà Rịa - Vũng Tàu', '2026-09-14 08:47:31', 290000.00),
(32, 2, 7, 'Tượng Chúa Kito Vũng Tàu', 'TP. Vũng Tàu', 'Bức tượng chúa giang tay lớn trên đỉnh núi Nhỏ.', 0.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/tuong-chua-kito-vung-tau-tuong-chua-jesus-lon-nhat-chau-a-1633941577.jpg', 'Bà Rịa - Vũng Tàu', '2026-09-14 08:47:31', 50000.00),
(33, 3, 7, 'Hồ Tràm & Hồ Cỏ', 'H. Xuyên Mộc', 'Khu vực nghỉ dưỡng biển cao cấp hoang sơ và yên tĩnh.', 200000.00, 4.8, 'https://static.vinwonders.com/production/2025/05/ho-tram-vung-tau-o-dau.jpg', 'Bà Rịa - Vũng Tàu', '2026-09-14 08:47:31', 250000.00),
(34, 1, 7, 'Côn Đảo', 'H. Côn Đảo', 'Quần đảo thiên đường du lịch nghỉ dưỡng và lịch sử.', 1000000.00, 5.0, 'https://condao.com.vn/uploads/news/2023_03/toan-canh-thi-tran-con-dao_1.jpg', 'Bà Rịa - Vũng Tàu', '2026-09-14 08:47:31', 50000.00),
(35, 5, 7, 'Mũi Nghinh Phong', 'TP. Vũng Tàu', 'Điểm đón gió và ngắm cảnh biển cực chill.', 0.00, 4.7, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2016/01/khu-du-lich-mui-nghinh-phong.png', 'Bà Rịa - Vũng Tàu', '2026-09-14 08:47:31', 290000.00),
(36, 1, 8, 'Tây Yên Tử', 'H. Sơn Động', 'Quần thể danh thắng tâm linh gắn liền với thiền phái Trúc Lâm.', 150000.00, 4.7, 'https://bizweb.dktcdn.net/100/101/075/files/hinh-anh-o-tay-yen-tu.jpg?v=1672285321033', 'Bắc Giang', '2026-09-14 08:47:31', 50000.00),
(37, 2, 8, 'Khu sinh thái Khe Rỗ', 'H. Sơn Động', 'Khu rừng nguyên sinh mang đậm nét hoang sơ vùng Đông Bắc.', 50000.00, 4.6, 'https://ik.imagekit.io/tvlk/blog/2023/09/Khe-Ro-4-1024x683.jpg?tr=q-70,c-at_max,w-1000,h-600', 'Bắc Giang', '2026-09-14 08:47:31', 50000.00),
(38, 3, 8, 'Hồ Khuân Mần', 'H. Lục Ngạn', 'Hồ nước mênh mông được mệnh danh là vịnh Hạ Long trên cạn.', 0.00, 4.6, 'https://media.mybacgiang.vn/resources/portal//Images/BGG/annn.bgg/%C4%90%E1%BB%8Ba%20%C4%91i%E1%BB%83m/H%E1%BB%93%20Khu%C3%B4n%20Th%E1%BA%A7n/136958120851a2269893e0a_636828172277487960.jpg', 'Bắc Giang', '2026-09-14 08:47:31', 250000.00),
(39, 4, 8, 'Chùa Bổ Đà', 'H. Việt Yên', 'Ngôi cổ tự độc đáo với kiến trúc tường đất và kho tàng mộc bản.', 10000.00, 4.8, 'https://static-images.vnncdn.net/files/publish/2022/7/23/chua-bo-da-115-840.jpg?width=0&s=449_OZ5xRLKb3bSzeecoMg', 'Bắc Giang', '2026-09-14 08:47:31', 50000.00),
(40, 5, 8, 'Thành cổ Hĩnh Xương', 'TP. Bắc Giang', 'Dấu tích lịch sử kháng chiến lâu đời.', 0.00, 4.5, 'https://bizweb.dktcdn.net/100/006/093/files/thanh-xuong-giang-4.jpg?v=1708577575370', 'Bắc Giang', '2026-09-14 08:47:31', 50000.00),
(41, 1, 9, 'Hồ Ba Bể', 'H. Ba Bể', 'Hồ nước ngọt tự nhiên lớn nhất Việt Nam trên núi đá vôi.', 200000.00, 4.9, 'https://bcp.cdnchinhphu.vn/Uploaded/nguyenminhdiem/2021_12_23/195225_ho-ba-be.jpg\r\n', 'Bắc Kạn', '2026-09-14 08:47:31', 250000.00),
(42, 2, 9, 'Động Puông', 'H. Ba Bể', 'Hang động xuyên lòng núi với hệ thống thạch nhũ kỳ ảo.', 50000.00, 4.7, 'https://pystravel.vn/_next/image?url=https%3A%2F%2Fbooking.pystravel.vn%2Fuploads%2Fposts%2Favatar%2F1770577164.jpg&w=3840&q=75', 'Bắc Kạn', '2026-09-14 08:47:31', 50000.00),
(43, 3, 9, 'Thác Đầu Đẳng', 'H. Ba Bể', 'Ngọn thác hùng vĩ nơi con sông Năng đổ xuống qua các bậc đá.', 30000.00, 4.8, 'https://upload.wikimedia.org/wikipedia/commons/3/32/SuoiBabe.jpg?utm_source=vi.wikipedia.org&utm_campaign=index&utm_content=original', 'Bắc Kạn', '2026-09-14 08:47:31', 45000.00),
(44, 4, 9, 'Đèo Phja Đắc', 'H. Ba Bể', 'Cung đường đèo hiểm trở ngắm trọn núi rừng Đông Bắc.', 0.00, 4.6, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800&auto=format&fit=crop&q=60', 'Bắc Kạn', '2026-09-14 08:47:31', 0.00),
(45, 5, 9, 'Khu di tích ATK Chợ Đồn', 'H. Chợ Đồn', 'Căn cứ kháng chiến cách mạng lịch sử quốc gia.', 20000.00, 4.6, 'https://images.vietnamtourism.gov.vn/vn//images/2021/Thang_6/2506.atkdinhhoa.jpg', 'Bắc Kạn', '2026-09-14 08:47:31', 50000.00),
(46, 1, 10, 'Khu lưu niệm nghệ thuật Đờn ca tài tử Nam Bộ', 'TP. Bạc Liêu', 'Nơi tôn vinh bộ môn nghệ thuật đặc trưng Nam Bộ.', 20000.00, 4.7, 'https://dulichocean.vn/wp-content/uploads/2024/10/khu-luu-niem-nhac-si-cao-van-lau.jpg', 'Bạc Liêu', '2026-09-14 08:47:31', 50000.00),
(47, 2, 10, 'Nhà Công tử Bạc Liêu', 'TP. Bạc Liêu', 'Dinh thự mang kiến trúc Pháp gắn liền giai thoại nổi tiếng.', 30000.00, 4.7, 'https://www.congtubaclieu.com.vn/wp-content/uploads/sites/86/2025/04/IMG_4564-2200x1200.jpg', 'Bạc Liêu', '2026-09-14 08:47:31', 50000.00),
(48, 3, 10, 'Cánh đồng điện gió Bạc Liêu', 'H. Vĩnh Lợi', 'Điểm check-in tua bin gió khổng lồ trên biển cực hot.', 20000.00, 4.8, 'https://ik.imagekit.io/tvlk/blog/2023/08/canh-dong-dien-gio-6.jpg', 'Bạc Liêu', '2026-09-14 08:47:31', 50000.00),
(49, 4, 10, 'Chùa Phật Bà Nam Hải', 'TP. Bạc Liêu', 'Trung tâm tín ngưỡng tâm linh hướng biển linh thiêng.', 0.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJrB13oJGE-_Ej16W_dw6xVzrTduOErDFFrfG2sU0RrqUltoQY00v9CVP9&s=10', 'Bạc Liêu', '2026-09-14 08:47:31', 50000.00),
(50, 5, 10, 'Khu sinh thái Nhà Mát', 'TP. Bạc Liêu', 'Khu vui chơi giải trí biển nhân tạo hấp dẫn.', 100000.00, 4.5, 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2023/1/22/1140693/Nha-Mat-Du-Lich-1.jpg', 'Bạc Liêu', '2026-09-14 08:47:31', 50000.00),
(51, 1, 11, 'Đền Đô', 'Tx. Từ Sơn', 'Nơi thờ 8 vị vua nhà Lý và kiến trúc nghệ thuật đặc sắc.', 20000.00, 4.8, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/09/Den-Do-Bac-Ninh-2-e1504716795180.png', 'Bắc Ninh', '2026-09-14 08:47:31', 50000.00),
(52, 2, 11, 'Chùa Phật Tích', 'H. Tiên Du', 'Ngôi chùa cổ nổi tiếng với tượng Phật bằng đá thời Lý.', 30000.00, 4.8, 'https://phunuvietnam.mediacdn.vn/thumb_w/1098/179072216278405120/2025/4/14/cpttt-1744644539487852168366-150-0-900-1200-crop-1744644553749519727174.jpg', 'Bắc Ninh', '2026-09-14 08:47:31', 50000.00),
(53, 3, 11, 'Làng tranh dân gian Đông Hồ', 'H. Thuận Thành', 'Làng nghề lưu giữ nghệ thuật tranh khắc gỗ lâu đời.', 10000.00, 4.7, 'https://www.aseantraveller.net/source/img_news/2497.jpg', 'Bắc Ninh', '2026-09-14 08:47:31', 250000.00),
(54, 4, 11, 'Chùa Dâu', 'H. Thuận Thành', 'Trung tâm Phật giáo cổ xưa nhất Việt Nam.', 20000.00, 4.8, 'https://owa.bestprice.vn/images/destinations/uploads/chua-dau-6013ca1a32885.jpg', 'Bắc Ninh', '2026-09-14 08:47:31', 50000.00),
(55, 5, 11, 'Làng gốm Phù Lãng', 'H. Quế Võ', 'Làng nghề gốm thủ công truyền thống bên bờ sông Cầu.', 10000.00, 4.6, 'https://cdn3.ivivu.com/2022/11/lang-gom-phu-lang-ivivu-2.jpg', 'Bắc Ninh', '2026-09-14 08:47:31', 50000.00),
(56, 1, 12, 'Cồn Phụng', 'H. Châu Thành', 'Khu du lịch sinh thái sông nước miệt vườn xứ dừa.', 50000.00, 4.7, 'https://conphungtourist.com/uploads/2024/12/nhahangconphung.conphungtourist.com.webp', 'Bến Tre', '2026-09-14 08:47:31', 50000.00),
(57, 2, 12, 'Làng hoa kiểng Chợ Lách', 'H. Chợ Lách', 'Vương quốc hoa kiểng và cây ăn trái lớn miền Tây.', 0.00, 4.7, 'https://owa.bestprice.vn/images/destinations/uploads/lang-hoa-kieng-cho-lach-60a228b2d5a3d.jpg', 'Bến Tre', '2026-09-14 08:47:31', 50000.00),
(58, 3, 12, 'Sân chim Vàm Hồ', 'H. Ba Tri', 'Khu bảo tồn động thực vật hoang dã ven sông.', 30000.00, 4.5, 'https://owa.bestprice.vn/images/destinations/uploads/san-chim-vam-ho-5435e982807dc.jpg', 'Bến Tre', '2026-09-14 08:47:31', 250000.00),
(59, 4, 12, 'Biển Thừa Đức', 'H. Bình Đại', 'Bãi biển hoang sơ trải dài cát mịn xứ dừa.', 0.00, 4.5, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDFMfjtUkToPDUTA-h_uRpGMfbV9jtndXizWxOgiBdCUJjT2qmekxdT1uyOoxmd8j6jb0Y8LbvvggZvXXovj_YJc17OW6KwAL2573KmnhmvHtK-ijL5B44PSvc6i52PSZbQ49DLcSHeUA/w1600/B%25C3%25A3i-Bi%25E1%25BB%2583n-Th%25E1%25BB%25ABa-%25C4%2590%25E1%25BB%25A9c-B%25E1%25BA%25BFn-Tre.jpg', 'Bến Tre', '2026-09-14 08:47:31', 290000.00),
(60, 5, 12, 'Nhà thờ Tuyên Thủy', 'H. Ba Tri', 'Công trình kiến trúc tôn giáo cổ kính độc đáo.', 0.00, 4.6, 'https://www.tonggiaophanhanoi.org/wp-content/uploads/2024/10/IMG_0646.jpg', 'Bến Tre', '2026-09-14 08:47:31', 50000.00),
(61, 1, 13, 'Eo Gió Quy Nhơn', 'TP. Quy Nhơn', 'Eo biển hoang sơ đẹp nhất Việt Nam với vách đá kỳ vĩ.', 25000.00, 4.9, 'https://quynhontrip.com/wp-content/uploads/2020/10/eo-gio-1024x768.jpg', 'Bình Định', '2026-09-14 08:47:31', 50000.00),
(62, 2, 13, 'Kỳ Co', 'TP. Quy Nhơn', 'Thiên đường biển đảo với làn nước trong vắt hai màu.', 150000.00, 4.9, 'https://static.vinwonders.com/production/ky-co-quy-nhon-2.jpg', 'Bình Định', '2026-09-14 08:47:31', 50000.00),
(63, 3, 13, 'Tháp Chăm Bánh Ít', 'H. Tuy Phước', 'Quần thể kiến trúc tháp Champa cổ kính nguyên vẹn.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/thap-banh-it-net-dep-in-dam-dau-an-champa-co-giua-long-binh-dinh-2-1679648753.jpg', 'Bình Định', '2026-09-14 08:47:31', 50000.00),
(64, 4, 13, 'Ghềnh Ráng Tiên Sa', 'TP. Quy Nhơn', 'Khu du lịch gắn liền với mộ thi nhân Hàn Mặc Tử.', 30000.00, 4.8, 'https://static.vinwonders.com/production/ghenh-rang-tien-sa-banner.jpg', 'Bình Định', '2026-09-14 08:47:31', 50000.00),
(65, 5, 13, 'Hòn Khô', 'TP. Quy Nhơn', 'Hòn đảo nhỏ hoang sơ với hoạt động lặn ngắm san hô.', 100000.00, 4.8, 'https://statics.vinpearl.com/hon-kho-quy-nhon-2_1703597728.jpg', 'Bình Định', '2026-09-14 08:47:31', 50000.00),
(66, 1, 14, 'Khu du lịch Đại Nam', 'TP. Thủ Dầu Một', 'Quần thể vui chơi giải trí và tâm linh hoành tráng.', 200000.00, 4.6, 'https://dulich3mien.vn/wp-content/uploads/2022/12/Khu-du-lich-Dai-Nam-1.jpg', 'Bình Dương', '2026-09-14 08:47:31', 50000.00),
(67, 2, 14, 'Chùa Hội Khánh', 'TP. Thủ Dầu Một', 'Ngôi chùa cổ có tượng Phật nhập niết bàn dài nhất Việt Nam.', 0.00, 4.7, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/06/st-1.jpg', 'Bình Dương', '2026-09-14 08:47:31', 50000.00),
(68, 3, 14, 'Làng gốm sứ Minh Long', 'TP. Thuận An', 'Nơi lưu giữ truyền thống gốm sứ lâu đời.', 0.00, 4.6, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj_LlRSNQy_14RcYSepKnVSQCw_-deIoFJw_7teUCXuoP0VXgrq4BjGpHN1N3zhebf2YD0Axv9j9pWk34bs1ivmt3_kyEmjbzsXpUh5ffZUjB68h_NhxCVXg2n0nWrwexysLmwOXFG_fAU/s1600/bai+1-+cac+sp+gom+tuyet+voi+dc+ra+doi+tu+nhung+ban+tay+nhao+nan+cua+nghe+nhan.PNG', 'Bình Dương', '2026-09-14 08:47:31', 50000.00),
(69, 4, 14, 'Hồ Dầu Tiếng', 'H. Dầu Tiếng', 'Hồ nhân tạo lớn nhất miền Nam cắm trại cực chill.', 0.00, 4.8, 'https://media2.gody.vn/public/mytravelmap/images/2019/6/11/trantai5403/70071dcb5962c900436c3a7f04926638.jpg', 'Bình Dương', '2026-09-14 08:47:31', 250000.00),
(70, 5, 14, 'Khu du lịch sinh thái Thanh Đại', 'TP. Thuận An', 'Không gian miệt vườn trái cây mát mẻ.', 50000.00, 4.5, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/11_2022/doi-che-thanh-chuong-nghe-an-min.jpg', 'Bình Dương', '2026-09-14 08:47:31', 50000.00),
(71, 1, 15, 'Vườn quốc gia Bù Gia Mập', 'H. Bù Gia Mập', 'Khu bảo tồn thiên nhiên hoang dã đa dạng sinh học.', 70000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/du-lich-bui-bu-gia-map-cung-nhung-trai-nghiem-dang-gia-5-1657049960.jpg', 'Bình Phước', '2026-09-14 08:47:31', 50000.00),
(72, 2, 15, 'Trúc Lâm Đạo Trào', 'H. Chơn Thành', 'Không gian thiền viện thanh tịnh giữa rừng cao su.', 0.00, 4.6, 'https://cototourism.vn/wp-content/uploads/2025/09/Chua-truc-lam-dao-tran-3.jpg', 'Bình Phước', '2026-09-14 08:47:31', 50000.00),
(73, 3, 15, 'Hồ Suối Giai', 'H. Đồng Phú', 'Hồ nước trong xanh phục vụ cắm trại dã ngoại.', 0.00, 4.6, 'https://mia.vn/media/uploads/blog-du-lich/review-ho-suoi-giai-nang-tien-ngu-quen-giua-nui-rung-binh-phuoc-1-1657536823.jpg', 'Bình Phước', '2026-09-14 08:47:31', 250000.00),
(74, 4, 15, 'Sóc Bom Bo', 'H. Bù Đăng', 'Địa danh lịch sử gắn liền với tiếng chày giã gạo huyền thoại.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/bo-tui-kinh-nghiem-di-soc-bom-bo-chi-tiet-nhat-danh-cho-hoi-xe-dich-1657079302.jpg', 'Bình Phước', '2026-09-14 08:47:31', 50000.00),
(75, 5, 15, 'Khu du lịch sinh thái Bàu Kên', 'H. Lộc Ninh', 'Thắng cảnh thiên nhiên tươi mát.', 30000.00, 4.5, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/11/Khu-du-lich-sinh-thai-Thuy-Chau.png', 'Bình Phước', '2026-09-14 08:47:31', 50000.00),
(76, 1, 16, 'Đồi cát bay Mũi Né', 'TP. Phan Thiết', 'Kỳ quan đồi cát thay đổi hình dạng liên tục độc đáo.', 0.00, 4.8, 'https://www.kkday.com/vi/blog/wp-content/uploads/doi-cat.jpg', 'Bình Thuận', '2026-09-14 08:47:31', 290000.00),
(77, 2, 16, 'Hòn Rơm', 'TP. Phan Thiết', 'Bãi biển hoang sơ với sóng nước trong xanh.', 0.00, 4.7, 'https://www.vietnamairlines.com/content/dam/legacy-site-assets/SEO-images/2025%20SEO/Thay%20Anh%20Traffic%20Tieng%20Viet/bai%20tam%20hon%20rom/bai-tam-hon-rom.png', 'Bình Thuận', '2026-09-14 08:47:31', 50000.00),
(78, 3, 16, 'Làng chài Mũi Né', 'TP. Phan Thiết', 'Nơi quan sát nhịp sống ngư dân và thưởng thức hải sản.', 0.00, 4.6, 'https://static.vinwonders.com/production/lang-chai-mui-ne-top-banner.jpg', 'Bình Thuận', '2026-09-14 08:47:31', 290000.00),
(79, 4, 16, 'Bàu Trắng - Bàu Sen', 'H. Bắc Bình', 'Ốc đảo sa mạc cát trắng ôm trọn hồ sen ngọt.', 20000.00, 4.9, 'https://bizweb.dktcdn.net/thumb/grande/100/101/075/articles/bt-3b21d513-79ff-4fbf-8abf-ee6502755f64.jpg?v=1563266119937', 'Bình Thuận', '2026-09-14 08:47:31', 50000.00),
(80, 5, 16, 'Tháp Poshanu', 'TP. Phan Thiết', 'Nhóm đền tháp Champa cổ kính kỳ bí.', 15000.00, 4.7, 'https://tour.dulichvietnam.com.vn/uploads/image/a-dia-danh-du-lich/thap-cham-poshanu-nguoi-cham-min.jpg', 'Bình Thuận', '2026-09-14 08:47:31', 50000.00),
(81, 1, 17, 'Mũi Cà Mau', 'H. Ngọc Hiển', 'Điểm cực Nam thiêng liêng của Tổ quốc trên đất liền.', 30000.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/kham-pha-khu-du-lich-mui-ca-mau-tai-vung-cuc-nam-to-quoc-1-1662715842.jpg', 'Cà Mau', '2026-09-14 08:47:31', 290000.00),
(82, 2, 17, 'Vườn quốc gia U Minh Hạ', 'H. U Minh', 'Rừng tràm ngập nước đặc trưng hệ sinh thái đất ngập nước.', 50000.00, 4.8, 'https://thiennhienmoitruong.vn/upload/images/btv/btv/btv6/xuoi.jpg', 'Cà Mau', '2026-09-14 08:47:31', 50000.00),
(83, 3, 17, 'Hòn Đá Bạc', 'H. Trần Văn Thời', 'Cụm đảo đẹp với các giá trị lịch sử và tâm linh.', 20000.00, 4.7, 'https://cdn3.ivivu.com/2023/04/hondabac-ivivu.jpg', 'Cà Mau', '2026-09-14 08:47:31', 50000.00),
(84, 4, 17, 'Rừng đước Năm Căn', 'H. Năm Căn', 'Hệ sinh thái rừng ngập mặn bạt ngàn.', 40000.00, 4.7, 'https://hitour.vn/storage/images/upload/tour-du-lich-ca-mau-28-750x460-type-manager-upload.webp', 'Cà Mau', '2026-09-14 08:47:31', 50000.00),
(85, 5, 17, 'Khu du lịch Khai Long', 'H. Ngọc Hiển', 'Bãi biển sinh thái cực Nam.', 30000.00, 4.6, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/06/bkl.jpg', 'Cà Mau', '2026-09-14 08:47:31', 50000.00),
(86, 1, 18, 'Thác Bản Giốc', 'H. Trùng Khánh', 'Ngọn thác hùng vĩ và đẹp nhất biên giới Việt - Trung.', 45000.00, 5.0, 'https://dulichviet.com.vn/images/bandidau/TIN-TUC/du-lich-cao-bang/thac-ban-gioc-cao-bang-du-lich-viet.jpg', 'Cao Bằng', '2026-09-14 08:47:31', 45000.00),
(87, 2, 18, 'Động Ngườm Ngao', 'H. Trùng Khánh', 'Hang động kỳ vĩ với hệ thống nhũ đá tự nhiên tuyệt mỹ.', 45000.00, 4.9, 'https://image.vietgoing.com/editor/image_xdo1636791787.jpg', 'Cao Bằng', '2026-09-14 08:47:31', 50000.00),
(88, 3, 18, 'Khu di tích Pác Bó', 'H. Hà Quảng', 'Suối Lê-nin và hang Cốc Bó gắn liền với Bác Hồ.', 40000.00, 4.9, 'https://lalago.vn/wp-content/uploads/2025/04/pac-bo-11.jpg', 'Cao Bằng', '2026-09-14 08:47:31', 50000.00),
(89, 4, 18, 'Hồ Thang Hen', 'H. Trà Lĩnh', 'Hồ nước trên núi hình mắt thợ độc đáo giữa thung lũng.', 30000.00, 4.8, 'https://vnn.1cdn.vn/2022/04/27/uploads-2022-th-c3-a1ng-204-ngay_27-to-20oanh-ho-20hang-20then-nuoc-20xanh.jpg', 'Cao Bằng', '2026-09-14 08:47:31', 250000.00),
(90, 5, 18, 'Đèo Mã Phục', 'H. Trà Lĩnh', 'Cung đường đèo 7 tầng uốn lượn đẹp bậc nhất Tây Bắc.', 0.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/deo-ma-phuc-12-1696941074.jpeg', 'Cao Bằng', '2026-09-14 08:47:31', 0.00),
(91, 1, 19, 'Hồ Lắk & Buôn Jun', 'H. Lắk', 'Hồ nước ngọt tự nhiên lớn nhất Tây Nguyên và bản làng đồng bào.', 50000.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/khu-du-lich-ho-lak-2-1703435493.jpg\r\n', 'Đắk Lắk', '2026-09-14 08:47:31', 250000.00),
(92, 2, 19, 'Thác Dray Nur & Dray Sap', 'H. Krông Ana', 'Cụm thác hùng vĩ bậc nhất núi rừng Tây Nguyên.', 40000.00, 4.9, 'https://dulichviet.com.vn/images/bandidau/du-lich-buon-ma-thuot-kham-pha-cum-3-thac-dray-sap-dray-nur-gia-long.jpg', 'Đắk Lắk', '2026-09-14 08:47:31', 45000.00),
(93, 3, 19, 'Vườn quốc gia Yok Đôn', 'H. Buôn Đôn', 'Khu bảo tồn hệ sinh thái rừng khộp độc đáo.', 60000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/Vuon-quoc-gia-YokDon-diem-den-voi-nhung-trai-nghiem-kho-quen-07-1652222280.jpg', 'Đắk Lắk', '2026-09-14 08:47:31', 50000.00),
(94, 4, 19, 'Bảo tàng Thế giới Cà phê', 'TP. Buôn Ma Thuột', 'Kiến trúc nhà dài Tây Nguyên độc đáo trưng bày văn hóa cà phê.', 150000.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYWRPh84qOmzB5fziM3Kz77BUVoOmxNJ6YrAJi9S5S4wVeMq-03squYGkc&s=10', 'Đắk Lắk', '2026-09-14 08:47:31', 50000.00),
(95, 5, 19, 'Khu du lịch sinh thái Ko Tam', 'TP. Buôn Ma Thuột', 'Không gian văn hóa hoa cỏ đặc sắc Tây Nguyên.', 30000.00, 4.7, 'https://cdn.xanhsm.com/2024/12/bd2f5913-khu-du-lich-kotam-23.jpg', 'Đắk Lắk', '2026-09-14 08:47:31', 50000.00),
(96, 1, 20, 'Công viên địa chất toàn cầu Đắk Nông', 'TP. Gia Nghĩa', 'Hệ thống hang động dung nham núi lửa độc đáo.', 50000.00, 4.8, 'https://vnn-imgs-f.vgcloud.vn/2020/07/08/15/le-cong-bo-truc-tuyen-danh-hieu-cong-vien-dia-chat-toan-cau-unesco-nam-2020-1.jpg?width=260&s=TXGWNbdKMdZhyVGUilk9QA', 'Đắk Nông', '2026-09-14 08:47:31', 0.00),
(97, 2, 20, 'Thác Đray Sáp Thượng', 'H. Đắk Mil', 'Ngọn thác hoang sơ giữa đại ngàn Tây Nguyên.', 30000.00, 4.7, 'https://namthientravel.com.vn/wp-content/uploads/2026/03/Thac-Dray-Sap-%E2%80%93-Chinh-Phuc-Thac-Khoi-Hung-Vi-Nhat-Tay-Nguyen-Tai-Dak-Nong-copy.webp', 'Đắk Nông', '2026-09-14 08:47:31', 45000.00),
(98, 3, 20, 'Hồ Tà Đùng', 'H. Đắk Glong', 'Được mệnh danh là vịnh Hạ Long trên cạn của Tây Nguyên.', 0.00, 4.9, 'https://caonguyentourist.com/upload/news/1vedephoangsocuakhudulichtadungcdc0407440-4560.jpg', 'Đắk Nông', '2026-09-14 08:47:31', 250000.00),
(99, 4, 20, 'Khu bảo tồn thiên nhiên Nam Nung', 'H. Đắk Song', 'Cảnh quan rừng nguyên sinh và thác nước kỳ vĩ.', 20000.00, 4.6, 'https://thiennhienmoitruong.vn/upload2026/images/btv/a-btv/a-btv-phuong-4/14b.png', 'Đắk Nông', '2026-09-14 08:47:31', 50000.00),
(100, 5, 20, 'Hồ Trúc Đắk Mil', 'H. Đắk Mil', 'Hồ nước thơ mộng giữa thị trấn nhỏ yên bình.', 0.00, 4.6, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/05_2023/1ho-truc-dak-nong-4.jpg', 'Đắk Nông', '2026-09-14 08:47:31', 250000.00),
(101, 1, 21, 'Đồi A1', 'TP. Điện Biên Phủ', 'Di tích chiến trường lịch sử lừng lẫy năm châu.', 20000.00, 4.9, 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/4/8/doi-a1-noi-gin-giu-nhung-ky-uc-hao-hung-mot-thoi-cua-dan-toc-2-17125556800421812163728.jpg', 'Điện Biên', '2026-09-14 08:47:31', 50000.00),
(102, 2, 21, 'Hầm Tướng De Castries', 'TP. Điện Biên Phủ', 'Trung tâm tập đoàn cứ điểm Điện Biên Phủ xưa.', 20000.00, 4.8, 'https://cdn-images.vtv.vn/562122370168008704/2024/5/2/ntd4231-17146315549851002983434.jpg', 'Điện Biên', '2026-09-14 08:47:31', 50000.00),
(103, 3, 21, 'Hồ Pá Khoang', 'H. Điện Biên', 'Hồ nước mênh mông cảnh sắc mây trời Tây Bắc.', 30000.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/ho-pa-khoang-dien-bien-1739273525.jpg', 'Điện Biên', '2026-09-14 08:47:31', 250000.00),
(104, 4, 21, 'Đèo Pha Đin', 'H. Tủa Chùa', 'Một trong tứ đại đỉnh đèo hiểm trở và đẹp nhất Việt Nam.', 0.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/deo-pha-din-02-1696522965.jpg', 'Điện Biên', '2026-09-14 08:47:31', 0.00),
(105, 5, 21, 'Bảo tàng Chiến thắng lịch sử Điện Biên Phủ', 'TP. Điện Biên Phủ', 'Bảo tàng quy mô lớn tái hiện toàn cảnh chiến dịch.', 50000.00, 4.9, 'https://bcp.cdnchinhphu.vn/334894974524682240/2022/5/6/bao-tang-dien-bien-1651803332409854626032.jpg', 'Điện Biên', '2026-09-14 08:47:31', 50000.00),
(106, 1, 22, 'Vườn quốc gia Nam Cát Tiên', 'H. Tân Phú', 'Khu dự trữ sinh quyển thế giới hoang dã', 60000.00, 4.8, 'https://cdn.realtech.com.vn/uploads/gostay/news/2781/vuon-quoc-gia-nam-cat-tien-o-dau.jpg', 'Đồng Nai', '2026-09-14 08:47:31', 50000.00),
(107, 2, 22, 'Khu du lịch Bửu Long', 'TP. Biên Hòa', 'Được ví như vịnh Hạ Long thu nhỏ tại Đồng Nai.', 40000.00, 4.7, 'https://image.vietgoing.com/destination/large/vietgoing_ccr2403164872.webp', 'Đồng Nai', '2026-09-14 08:47:31', 50000.00),
(108, 3, 22, 'Thác Trị An & Hồ Trị An', 'H. Vĩnh Cửu', 'Điểm cắm trại và ngắm bình minh tuyệt đẹp.', 0.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWh2UvvlcUiHaUHiUud95FJUZup9AuU1MGfRzXRKsCrGnuU3C6oLLDuZI&s=10', 'Đồng Nai', '2026-09-14 08:47:31', 250000.00),
(109, 4, 22, 'Văn miếu Trấn Biên', 'TP. Biên Hòa', 'Văn miếu đầu tiên ở Nam Bộ tôn vinh nho học.', 10000.00, 4.7, 'https://baoquankhu7.vn/fileman/Uploads/tbNews/4335/anh_1.JPG', 'Đồng Nai', '2026-09-14 08:47:31', 50000.00),
(110, 5, 22, 'Khu du lịch Thác Mai', 'H. Định Quán', 'Rừng nguyên sinh và suối nước nóng tự nhiên.', 30000.00, 4.6, 'https://ik.imagekit.io/tvlk/blog/2024/02/thac-mai-1.jpg?tr=q-70,c-at_max,w-1000,h-600', 'Đồng Nai', '2026-09-14 08:47:31', 45000.00),
(111, 1, 23, 'Vườn quốc gia Tràm Chim', 'H. Tam Nông', 'Khu Ramsar quan trọng thế giới với sếu đầu đỏ.', 150000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR33Mom8W5D7W0abV5MkWdTH9Plbuj0QDhScmfQo7r0HY9x5gtpkWdeENEf&s=10', 'Đồng Tháp', '2026-09-14 08:47:31', 50000.00),
(112, 2, 23, 'Làng hoa kiểng Sa Đéc', 'TP. Sa Đéc', 'Làng hoa trăm tuổi lớn nhất miền Tây Nam Bộ.', 20000.00, 4.8, 'https://www.kkday.com/vi/blog/wp-content/uploads/dji_0788.jpg', 'Đồng Tháp', '2026-09-14 08:47:31', 50000.00),
(113, 3, 23, 'Nhà cổ Huỳnh Thủy Lê', 'TP. Sa Đéc', 'Ngôi nhà cổ gắn liền mối tình xuyên biên giới nổi tiếng.', 30000.00, 4.7, 'https://thamhiemmekong.com/wp-content/uploads/2019/12/nha-co-huynh-thuy-le06.jpg', 'Đồng Tháp', '2026-09-14 08:47:31', 50000.00),
(114, 4, 23, 'Khu di tích Nguyễn Sinh Sắc', 'TP. Cao Lãnh', 'Nơi yên nghỉ của cụ thân sinh Chủ tịch Hồ Chí Minh.', 0.00, 4.8, 'https://mediadulich.dongthap.gov.vn/resources/portal/Images/DTP/superadminportal.dtp/trangchu/portal/luutru/diadiem/ditichnguyensinhsac/h3.jpg_636758375126840596.jpg', 'Đồng Tháp', '2026-09-14 08:47:31', 50000.00),
(115, 5, 23, 'Khu du lịch Xẻo Quít', 'H. Cao Lãnh', 'Căn cứ kháng chiến ngập nước rợp bóng tràm.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/xeo-quyt-o-dau-1704209777.jpg', 'Đồng Tháp', '2026-09-14 08:47:31', 50000.00),
(116, 1, 24, 'Biển Hồ Pleiku (T’Nưng)', 'TP. Pleiku', 'Đôi mắt Pleiku xanh ngắt giữa cao nguyên lộng gió.', 20000.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/chiem-nguong-bien-ho-pleiku-bien-ho-tnung-tuyet-dep-01-1659458379.jpg', 'Gia Lai', '2026-09-14 08:47:31', 290000.00),
(117, 2, 24, 'Hàng thông trăm tuổi & Chúc Đăng', 'H. Chư Păh', 'Con đường thông cổ kính lãng mạn bậc nhất phố núi.', 0.00, 4.8, 'https://thanhnien.mediacdn.vn/Uploaded/trantam/2022_11_15/img-20221115-101532-5775.jpg', 'Gia Lai', '2026-09-14 08:47:31', 50000.00),
(118, 3, 24, 'Thác Phú Cường', 'H. Chư Sê', 'Ngọn thác cao hùng vĩ giữa dòng suối nguyên sơ.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/thac-phu-cuong-chiem-nguong-tuyet-tac-cua-nui-rung-gia-lai-04-1659179228.jpg', 'Gia Lai', '2026-09-14 08:47:31', 45000.00),
(119, 4, 24, 'Núi lửa Chư Đăng Ya', 'H. Chư Păh', 'Miệng núi lửa cổ rực rỡ sắc vàng hoa dã quỳ mùa đông.', 0.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/nui-lua-chu-dang-ya-diem-den-tuyet-voi-tai-pho-nui-1659506911.jpg', 'Gia Lai', '2026-09-14 08:47:31', 50000.00),
(120, 5, 24, 'Chùa Minh Thành', 'TP. Pleiku', 'Ngôi chùa mang kiến trúc Nhật Bản hoành tráng.', 0.00, 4.9, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 'Gia Lai', '2026-09-14 08:47:31', 50000.00),
(121, 1, 25, 'Cao nguyên đá Đồng Văn', 'H. Đồng Văn', 'Công viên địa chất toàn cầu UNESCO hùng vĩ bậc nhất.', 30000.00, 5.0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZgtNLs8E5-IQuuNop3qgDD7e5DQ_3Xefp9creY53fsOa-QOFyjT4L3gQ&s=10', 'Hà Giang', '2026-09-14 08:47:31', 30000.00),
(122, 2, 25, 'Đèo Mã Pí Lèng & Sông Nho Quế', 'H. Mèo Vạc', 'Cung đường đèo hiểm trở ngắm vực sâu và dòng sông ngọc.', 0.00, 4.0, 'https://mia.vn/media/uploads/blog-du-lich/review-ma-pi-leng-song-nho-que-va-ve-dep-nuc-long-nguoi-1644147217.jpg', 'Hà Giang', '2026-09-14 08:47:31', 250000.00),
(123, 3, 25, 'Dinh thự Vua Mèo (Họ Vương)', 'H. Sản Phìn', 'Kiến trúc dinh thự độc đáo của thủ lĩnh vùng cao nguyên.', 20000.00, 4.8, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 'Hà Giang', '2026-09-14 08:47:31', 50000.00),
(124, 4, 25, 'Cột mốc Lũng Cú', 'H. Lũng Cú', 'Điểm cực Bắc thiêng liêng của Tổ quốc.', 20000.00, 4.9, 'https://ik.imagekit.io/tvlk/blog/2023/06/cot-co-lung-cu-1.jpg?tr=q-70,c-at_max,w-1000,h-600', 'Hà Giang', '2026-09-14 08:47:31', 0.00),
(125, 5, 25, 'Phố cổ Đồng Văn', 'H. Đồng Văn', 'Khu phố cổ mang đậm dấu ấn kiến trúc trình tường đá.', 0.00, 4.8, 'https://images.unsplash.com/photo-1590523277543-a94d2e4eb00b?w=800&auto=format&fit=crop&q=60', 'Hà Giang', '2026-09-14 08:47:31', 30000.00),
(126, 1, 26, 'Khu du lịch tâm linh Tam Chúc', 'H. Kim Bảng', 'Ngôi chùa lớn nhất thế giới với cảnh quan non nước hữu tình.', 0.00, 4.9, 'https://www.d-annamtravel.com/static/media/hanoi/cha-tam-chc110321.jpg', 'Hà Nam', '2026-09-14 08:47:31', 50000.00),
(127, 2, 26, 'Hang Luồn - Bất Động', 'H. Kim Bảng', 'Hang động tự nhiên hoang sơ kỳ vĩ.', 20000.00, 4.6, 'https://www.halongwave.vn/images/hang-lu%E1%BB%93n.gif', 'Hà Nam', '2026-09-14 08:47:31', 50000.00),
(128, 3, 26, 'Khu tưởng niệm Nam Cao', 'H. Lý Nhân', 'Nơi lưu giữ cuộc đời và sự nghiệp nhà văn lớn.', 10000.00, 4.7, 'https://dltm-cdn.vnptit3.vn/resources/portal//Images/HNM/maithanhchung39/tin_tuc/2024/20240807180358_573_0648_759419749.jpg', 'Hà Nam', '2026-09-14 08:47:31', 50000.00),
(129, 4, 26, 'Đền Trần Thương', 'H. Lý Nhân', 'Ngôi đền linh thiêng thờ Hưng Đạo Vương Trần Quốc Tuấn.', 0.00, 4.8, 'https://visitninhbinh.com.vn/VisitHaNam/%E1%BA%A2NH%20D%C3%99NG%20T%E1%BA%A0M/2359/image-thumb__2359__720_jpg/den-tran-thuong-9-1513.e8919dab.jpg', 'Hà Nam', '2026-09-14 08:47:31', 50000.00),
(130, 5, 26, 'Làng kho cá Vũ Đại', 'H. Lý Nhân', 'Làng nghề truyền thống kho cá kho niêu đất nổi tiếng.', 0.00, 4.7, 'https://dntt.mediacdn.vn/197608888129458176/2022/7/18/kho-ca-16581449220861502027397.jpg', 'Hà Nam', '2026-09-14 08:47:31', 50000.00),
(131, 1, 27, 'Bãi biển Thiên Cầm', 'H. Cẩm Xuyên', 'Bãi biển hoang sơ với tiếng sóng vỗ như đàn trời.', 0.00, 4.7, 'https://thuongtruong2-fileserver.nvcms.net/IMAGES/2022/04/16/20220416233513-10031.png', 'Hà Tĩnh', '2026-09-14 08:47:31', 290000.00),
(132, 2, 27, 'Khu di tích Ngã ba Đồng Lộc', 'H. Can Lộc', 'Địa danh lịch sử hào hùng tri ân các nữ liệt thanh niên xung phong.', 0.00, 4.9, 'https://imgnvsk.vnanet.vn/MediaUpload/Content/2025/4/29/662-nga-ba-dong-loc-2942025.jpg', 'Hà Tĩnh', '2026-09-14 08:47:31', 50000.00),
(133, 3, 27, 'Khu di tích Đại thi hào Nguyễn Du', 'H. Nghi Xuân', 'Nơi sinh và tưởng niệm tác giả Truyện Kiều.', 15000.00, 4.8, 'https://image.vietgoing.com/editor/image_ugi1620456658.jpg', 'Hà Tĩnh', '2026-09-14 08:47:31', 50000.00),
(134, 4, 27, 'Hồ Kẻ Gỗ', 'H. Cẩm Xuyên', 'Hồ nước ngọt nhân tạo mênh mông gắn liền với câu hát nổi tiếng.', 0.00, 4.7, 'https://statics.vinpearl.com/ho-ke-go%201_1624870951.jpg', 'Hà Tĩnh', '2026-09-14 08:47:31', 250000.00),
(135, 5, 27, 'Chùa Hương Tích', 'H. Can Lộc', 'Hoan Châu đệ nhất danh thắng linh thiêng trên đỉnh núi.', 30000.00, 4.8, 'https://dntt.mediacdn.vn/197608888129458176/2022/12/24/ht3-16718699254451419363301.jpg', 'Hà Tĩnh', '2026-09-14 08:47:31', 50000.00),
(136, 1, 28, 'Côn Sơn - Kiếp Bạc', 'TP. Chí Linh', 'Quần thể di tích lịch sử và danh thắng gắn với Trần Hưng Đạo và Nguyễn Trãi.', 20000.00, 4.8, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/02/khu-di-tich-lich-su-con-son-kiep-bac-6-1.png', 'Hải Dương', '2026-09-14 08:47:31', 50000.00),
(137, 2, 28, 'Đảo Cò Chi Lăng Nam', 'H. Thanh Miện', 'Khu sinh thái ngập nước trú ngụ của hàng vạn con cò.', 20000.00, 4.6, 'https://zoomtravel.vn/upload/images/dao-co-chi-lang-2.jpeg', 'Hải Dương', '2026-09-14 08:47:31', 80000.00),
(138, 3, 28, 'Văn miếu Mao Điền', 'H. Cẩm Giàng', 'Trường thi và văn miếu trấn Hải Dương xưa.', 10000.00, 4.7, 'https://doanhnghiepkinhtexanh.vn/uploads/images/2024/12/14/jpg-3-1734191636.jpg', 'Hải Dương', '2026-09-14 08:47:31', 50000.00),
(139, 4, 28, 'Làng gốm Chu Đậu', 'H. Nam Sách', 'Làng nghề gốm cổ truyền xuất khẩu nổi tiếng.', 20000.00, 4.7, 'https://ik.imagekit.io/tvlk/blog/2023/07/lang-gom-chu-dau-1-1.jpg', 'Hải Dương', '2026-09-14 08:47:31', 50000.00),
(140, 5, 28, 'Khu danh thắng Phượng Hoàng', 'TP. Chí Linh', 'Nơi ở ẩn cuối đời của danh nhân văn hóa Nguyễn Trãi.', 10000.00, 4.8, 'https://kimlientravel.com.vn/upload/image/image-20240105101002-3.jpeg', 'Hải Dương', '2026-09-14 08:47:31', 50000.00),
(141, 1, 29, 'Khu bảo tồn thiên nhiên Lung Ngọc Hoàng', 'H. Phụng Hiệp', 'Lá phổi xanh miền Tây Nam Bộ với hệ sinh thái phong phú.', 60000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/khu-bao-ton-thien-nhien-lung-ngoc-hoang-3-1718620080.jpg', 'Hậu Giang', '2026-09-14 08:47:31', 50000.00),
(142, 2, 29, 'Chợ nổi Ngã Bảy (Phụng Hiệp)', 'TP. Ngã Bảy', 'Khu chợ nổi giao thương lịch sử nổi tiếng.', 0.00, 4.6, 'https://images2.thanhnien.vn/528068263637045248/2024/5/22/anh-1-1716392257982366201686.jpg', 'Hậu Giang', '2026-09-14 08:47:31', 50000.00),
(143, 3, 29, 'Khu di tích lịch sử Căn cứ Tỉnh ủy', 'H. Vị Thủy', 'Di tích cách mạng hào hùng.', 10000.00, 4.5, 'https://images.vietnamtourism.gov.vn/vn//images/2022/thang_11/2111.di-tich-lich-su-khu-can-cu-tinh-uy-soc-trang-1.png', 'Hậu Giang', '2026-09-14 08:47:31', 50000.00),
(144, 4, 29, 'Công viên giải trí Kittyd & Minnied', 'H. Châu Thành A', 'Công viên phong cách châu Âu lớn nhất miền Tây.', 150000.00, 4.7, 'https://bazantravel.com/cdn/medias/uploads/24/24837-cong-vien-kittyd-minnied-hau-giang-600x398.jpg', 'Hậu Giang', '2026-09-14 08:47:31', 50000.00),
(145, 5, 29, 'Thiền viện Trúc Lâm việt Nam', 'TP. Vị Thanh', 'Thiền viện thanh tịnh giữa miệt vườn.', 0.00, 4.7, 'https://image.vietgoing.com/editor/image_bbk1622539949.jpg', 'Hậu Giang', '2026-09-14 08:47:31', 50000.00),
(146, 1, 30, 'Thung lũng Mai Châu', 'H. Mai Châu', 'Thung lũng nên thơ rợp bóng nhà sàn người Thái.', 20000.00, 4.9, 'https://maichau.ecolodge.asia/ckfinder/userfiles/images/Johan%20Nieuwerth%20(25).jpg', 'Hòa Bình', '2026-09-14 08:47:31', 50000.00),
(147, 2, 30, 'Thủy điện Hòa Bình', 'TP. Hòa Bình', 'Công trình thế kỷ chặn dòng sông Đà hùng vĩ.', 30000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UpiAL-1C_hZ61Sk0ZKpkwSrwZxrQK05G6f_DW8LMn4KQwHQXWWnECCE&s=10', 'Hòa Bình', '2026-09-14 08:47:31', 50000.00),
(148, 3, 30, 'Khu du lịch Hồ Hòa Bình', 'TP. Hòa Bình', 'Vịnh Hạ Long trên cạn của miền Tây Bắc.', 50000.00, 4.8, 'https://congviendisan.vn/wp-content/uploads/2025/06/unnamed.jpg', 'Hòa Bình', '2026-09-14 08:47:31', 250000.00),
(149, 4, 30, 'Cửu Thác Tú Sơn', 'H. Kim Bôi', 'Cụm thác nước tự nhiên mát lạnh giữa rừng già.', 40000.00, 4.6, 'https://lalago.vn/wp-content/uploads/2025/04/cuu-thac-tu-son-2.webp', 'Hòa Bình', '2026-09-14 08:47:31', 45000.00),
(150, 5, 30, 'Suối khoáng nóng Kim Bôi', 'H. Kim Bôi', 'Khu nghỉ dưỡng suối khoáng nóng tự nhiên thư giãn.', 100000.00, 4.7, 'https://bazaarvietnam.vn/wp-content/uploads/2025/09/harper-bazaar-khu-du-lich-suoi-khoang-kim-boi-7.jpg', 'Hòa Bình', '2026-09-14 08:47:31', 50000.00),
(151, 1, 31, 'Phố Hiến xưa', 'TP. Hưng Yên', 'Thương phố sầm uất thứ nhì thời xưa \"Thứ nhất Kinh Kỳ, thứ nhì Phố Hiến\".', 0.00, 4.7, 'https://mekongasean.vn/stores/news_dataimages/2026/032026/10/03/phohien620260310032034.jpg?rt=20260310033015', 'Hưng Yên', '2026-09-14 08:47:31', 50000.00),
(152, 2, 31, 'Đền Chử Đồng Tử (Đền Dạ Trạch)', 'H. Khoái Châu', 'Di tích gắn liền với truyền thuyết tình yêu cổ tích nổi tiếng.', 10000.00, 4.8, 'https://cdn3.ivivu.com/2022/12/den-hoa-da-trach-ivivu-11.jpg', 'Hưng Yên', '2026-09-14 08:47:31', 50000.00),
(153, 3, 31, 'Làng nghề nhãn lồng Phố Hiến', 'TP. Hưng Yên', 'Thủ phủ đặc sản nhãn lồng tiến vua nổi tiếng.', 0.00, 4.7, 'https://banquanlyditichhy.vn/uploads/data/5262/files/news/012026/nhan1.jpg', 'Hưng Yên', '2026-09-14 08:47:31', 50000.00),
(154, 4, 31, 'Chùa Nôm', 'H. Văn Lâm', 'Ngôi cổ tự hàng trăm năm với kiến trúc độc đáo và cầu đá cổ.', 0.00, 4.8, 'https://hungyentourism.com.vn/ckfinder/userfiles/images/img_6641_49268015817_o.jpg', 'Hưng Yên', '2026-09-14 08:47:31', 50000.00),
(155, 5, 31, 'Khu di tích Đa Hoà', 'H. Khoái Châu', 'Quần thể kiến trúc đền thờ truyền thống.', 10000.00, 4.6, 'https://media2.gody.vn/public/images/place/quan-the-di-tich-pho-hien/620f2677ea937-1645160055.jpeg', 'Hưng Yên', '2026-09-14 08:47:31', 50000.00),
(156, 1, 32, 'Vịnh Nha Trang', 'TP. Nha Trang', 'Một trong những vịnh biển đẹp nhất thế giới.', 0.00, 4.9, 'https://seayoutravel.vn/wp-content/uploads/2025/10/vinh-nha-trang.webp', 'Khánh Hòa', '2026-09-14 08:47:31', 290000.00),
(157, 2, 32, 'VinWonders Nha Trang', 'H. Vĩnh Nguyên', 'Khu vui chơi giải trí đẳng cấp quốc tế trên đảo Hòn Tre.', 950000.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqUlLZxIAtNOhZJq_N8QjhIoU_LseSYS1siwutm4EbCQUsow7O56e8r-U&s=10', 'Khánh Hòa', '2026-09-14 08:47:31', 50000.00),
(158, 3, 32, 'Tháp Bà Ponagar', 'TP. Nha Trang', 'Quần thể kiến trúc đền tháp Champa cổ kính.', 30000.00, 4.8, 'https://mocban.vn/wp-content/uploads/2024/05/thap-ba-ponagar-3.jpg', 'Khánh Hòa', '2026-09-14 08:47:31', 50000.00),
(159, 4, 32, 'Bãi biển Dốc Lết', 'Tx. Ninh Hòa', 'Bãi biển cát trắng mịn màng nước trong xanh hoang sơ.', 0.00, 4.8, 'https://vcdn1-dulich.vnecdn.net/2026/06/30/668440163-4527767867469141-738-7795-7331-1782814589.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=ng4pVYusL_0PzuGRV3K4SQ', 'Khánh Hòa', '2026-09-14 08:47:31', 290000.00),
(160, 5, 32, 'Vịnh Vân Phong', 'H. Vạn Ninh', 'Vịnh biển hoang sơ tuyệt đẹp với hệ sinh thái phong phú.', 100000.00, 4.9, 'https://statics.vinpearl.com/vinh-van-phong-4_1689755820.jpg', 'Khánh Hòa', '2026-09-14 08:47:31', 290000.00),
(161, 1, 33, 'Đảo Phú Quốc', 'TP. Phú Quốc', 'Đảo ngọc thiên đường du lịch nghỉ dưỡng quốc tế.', 200000.00, 4.9, 'https://phuquocxanh.com/vi/wp-content/uploads/2016/05/tour-kham-pha-dao-ngoc-phu-quoc-3n2d-12.jpg', 'Kiên Giang', '2026-09-14 08:47:31', 50000.00),
(162, 2, 33, 'Quần đảo Nam Du', 'H. Kiên Hải', 'Quần đảo hoang sơ với biển xanh cát trắng tuyệt mỹ.', 150000.00, 4.8, 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Cau_cang_Dao_cu_tron-quan_Dao_nam_du._xa_An_S%C6%A1n%2C_Huyen_Ki%C3%AAn_H%E1%BA%A3i%2C_t%E1%BB%89nh_Ki%C3%AAn_Giang%2C_Vi%E1%BB%87t_Nam%2C02-07-16-Dyt_-_panoramio.jpg?utm_source=vi.wikipedia.org&utm_campaign=index&utm_content=original', 'Kiên Giang', '2026-09-14 08:47:31', 50000.00),
(163, 3, 33, 'Quần đảo Bà Lụa', 'H. Kiên Lương', 'Được ví như vịnh Hạ Long của phương Nam.', 100000.00, 4.7, 'https://cdn3.ivivu.com/2024/04/dao-ba-lua-ivivu6.jpg', 'Kiên Giang', '2026-09-14 08:47:31', 50000.00),
(164, 4, 33, 'Rạch Giá Waterfront', 'TP. Rạch Giá', 'Khu đô thị lấn biển sầm uất ven vịnh Thái Lan.', 0.00, 4.6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQsH1ElsHgS1ZAoQxqPP71ejsrfHsv-Ud6-JZA5v4ykEOR0t0b5dTanM&s=10', 'Kiên Giang', '2026-09-14 08:47:31', 50000.00),
(165, 5, 33, 'Vườn quốc gia Phú Quốc', 'TP. Phú Quốc', 'Hệ sinh thái rừng nguyên sinh phong phú trên đảo.', 0.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnYTbMribg3-vtNchbSfci6CKx-ddutVdoLffPiKY92ejvl7vlJl14pW8&s=10', 'Kiên Giang', '2026-09-14 08:47:31', 50000.00),
(166, 1, 34, 'Nhà thờ gỗ Kon Tum', 'TP. Kon Tum', 'Công trình kiến trúc gỗ kết hợp giữa phong cách Roman và nhà sàn Ba Na.', 0.00, 4.8, 'https://vietnamtourism.vn/imguploads/tourist/2014/KonTum/NhathogoKonTum/35Nhathokontum03.jpg', 'Kon Tum', '2026-09-14 08:47:31', 50000.00),
(167, 2, 34, 'Măng Đen', 'H. Kon Plông', 'Đà Lạt thứ hai của Tây Nguyên với rừng thông và khí hậu se lạnh.', 0.00, 4.9, 'https://vcdn1-dulich.vnecdn.net/2023/06/23/MD1-1872-1687513752.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=amYECSAidkfMnY6j4lK-7g', 'Kon Tum', '2026-09-14 08:47:31', 50000.00),
(168, 3, 34, 'Cột mốc biên giới Ngã ba Đông Dương', 'H. Sa Thầy', 'Nơi một tiếng gà gáy vang ba nước Đông Dương.', 50000.00, 4.8, 'https://vietrektravel.com/ckeditor/plugins/fileman/Uploads/%E1%BA%A2nh%20DL/nga-ba-dong-duong-1.jpg\r\n', 'Kon Tum', '2026-09-14 08:47:31', 0.00),
(169, 4, 34, 'Cầu treo Kon Klor', 'TP. Kon Tum', 'Cây cầu treo dây văng bằng sắt lớn nhất khu vực Tây Nguyên.', 0.00, 4.7, 'https://mangdentrip.com/wp-content/uploads/2025/03/4bdbddb5-839c-45de-bb5c-d2ce0fa3365b-425481977-358597297065846-2223297348888428578-njpg20241218055507.jpg', 'Kon Tum', '2026-09-14 08:47:31', 0.00),
(170, 5, 34, 'Thác Pa Sỹ', 'H. Kon Plông', 'Ngọn thác tuyệt đẹp giữa đại ngàn Măng Đen.', 20000.00, 4.8, 'https://static.vinwonders.com/production/thac-pa-sy-3.jpg', 'Kon Tum', '2026-09-14 08:47:31', 45000.00),
(171, 1, 35, 'Đèo Ô Quy Hồ', 'H. Tam Đường', 'Một trong tứ đại đỉnh đèo hiểm trở và mây ngàn bạt ngàn.', 0.00, 5.0, 'https://bizweb.dktcdn.net/100/101/075/files/toan-canh-khu-du-lich-o-quy-ho.jpg?v=1669363517990', 'Lai Châu', '2026-09-14 08:47:31', 0.00),
(172, 2, 35, 'Bản Sin Suối Hồ', 'H. Phong Thổ', 'Bản văn hóa cộng đồng người Mông xanh sạch đẹp xuất sắc.', 30000.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvI02mSEbvMErt6mghyGyKRmlBdluI1ZOnNcOB4jyhOTlw7OxMbWeOBIDK&s=10', 'Lai Châu', '2026-09-14 08:47:31', 250000.00),
(173, 3, 35, 'Động Tiên Sơn', 'H. Tân Uyên', 'Hang động tự nhiên kỳ ảo thạch nhũ lung linh.', 30000.00, 4.7, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&auto=format&fit=crop&q=60', 'Lai Châu', '2026-09-14 08:47:31', 50000.00),
(174, 4, 35, 'Cầu kính Rồng Mây', 'H. Tam Đường', 'Cầu kính trong suốt trên đỉnh đèo ngắm trọn núi non.', 400000.00, 4.8, 'https://dulichtaybac.vn/wp-content/uploads/2025/05/1-cau-kinh-s.png', 'Lai Châu', '2026-09-14 08:47:31', 0.00),
(175, 5, 35, 'Cao nguyên Sìn Hồ', 'H. Sìn Hồ', 'Nóc nhà của tỉnh Lai Châu mờ sương', 0.00, 4.8, 'https://travelhanoi.com.vn/UserFiles/images/%C4%91i%E1%BB%87n%20bi%C3%AAn/canh-dong-muong-than.jpg', 'Lai Châu', '2026-09-14 08:47:31', 250000.00),
(176, 1, 36, 'Hồ Xuân Hương & Chợ Đà Lạt', 'TP. Đà Lạt', 'Trái tim thành phố ngàn hoa thơ mộng và nhộn nhịp.', 0.00, 4.9, 'https://media-cdn.tripadvisor.com/media/photo-s/0e/75/cb/61/ben-m-n-ph-i-c-a-h-xuan.jpg', 'Lâm Đồng', '2026-09-14 08:47:31', 250000.00),
(177, 2, 36, 'Thung lũng Tình Yêu', 'TP. Đà Lạt', 'Khu du lịch lãng mạn gắn liền với đồi thông xanh ngát.', 250000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/thung-lung-tinh-yeu-1-1751825945.jpg', 'Lâm Đồng', '2026-09-14 08:47:31', 50000.00),
(178, 3, 36, 'Đỉnh Langbiang', 'H. Lạc Dương', 'Nóc nhà Đà Lạt ngắm trọn toàn cảnh cao nguyên.', 50000.00, 4.8, 'https://ik.imagekit.io/tvlk/blog/2022/11/khu-du-lich-langbiang-5.jpg\r\n', 'Lâm Đồng', '2026-09-14 08:47:31', 850000.00),
(179, 4, 36, 'Thác Datanla', 'TP. Đà Lạt', 'Khu du lịch thác nước kết hợp trượt ống mạo hiểm.', 100000.00, 4.8, 'https://luhanhtour.com/wp-content/uploads/2021/05/THAC-DATANLA.jpg', 'Lâm Đồng', '2026-09-14 08:47:31', 45000.00),
(180, 5, 36, 'Chùa Linh Phước (Chùa Ve Chai)', 'TP. Đà Lạt', 'Ngôi chùa kiến trúc khảm sành sứ độc đáo bậc nhất.', 0.00, 5.0, 'https://merperledalat.vn/wp-content/uploads/2025/12/image4-1.jpg', 'Lâm Đồng', '2026-09-14 08:47:31', 50000.00),
(181, 1, 37, 'Động Tam Thanh & Nhị Thanh', 'TP. Lạng Sơn', 'Danh thắng hang động kỳ ảo gắn liền với lịch sử văn hóa.', 20000.00, 4.8, 'https://mediabls.mediatech.vn/upload/image/202108/medium/9014_1-1.jpg', 'Lạng Sơn', '2026-09-14 08:47:31', 50000.00),
(182, 2, 37, 'Thành nhà Mạc', 'TP. Lạng Sơn', 'Dấu tích kiến trúc quân sự cổ trên đỉnh núi đá.', 10000.00, 4.7, 'https://ik.imagekit.io/tvlk/blog/2023/08/thanh-nha-mac-acc-1-1024x576.png?tr=q-70,c-at_max,w-1000,h-600', 'Lạng Sơn', '2026-09-14 08:47:31', 50000.00),
(183, 3, 37, 'Đỉnh Mẫu Sơn', 'H. Lộc Bình', 'Vùng núi cao săn mây và ngắm tuyết rơi mùa đông.', 0.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ppOlb5B5TJ6MV-o0R4ZM9a187YteH7A7EaJ5RT8uFEgst4fIYHX82b4r&s=10', 'Lạng Sơn', '2026-09-14 08:47:31', 850000.00),
(184, 4, 37, 'Ải Chi Lăng', 'H. Chi Lăng', 'Thung lũng lịch sử hào hùng chống giặc ngoại xâm.', 20000.00, 4.8, 'https://ik.imagekit.io/tvlk/blog/2023/07/ai-chi-lang-acc-1.webp?tr=q-70,c-at_max,w-1000,h-600', 'Lạng Sơn', '2026-09-14 08:47:31', 80000.00),
(185, 5, 37, 'Chợ Đông Kinh', 'TP. Lạng Sơn', 'Trung tâm mua sắm biên mải sầm uất.', 0.00, 4.6, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/12_2019/cho-dong-kinh-lang-son-1.jpg', 'Lạng Sơn', '2026-09-14 08:47:31', 50000.00),
(186, 1, 38, 'Đỉnh Fansipan', 'TP. Sapa', 'Nóc nhà Đông Dương cao 3.143m', 850000.00, 5.0, 'https://bvhttdl.gov.vn/uploads/oldscontents/20241119081810454/fansipan-173192405921596420153-1731979103339-17319791038601349225292.jpg', 'Lào Cai', '2026-09-14 08:47:31', 850000.00),
(187, 2, 38, 'Bản Cát Cát', 'TP. Sapa', 'Làng văn hóa du lịch cộng đồng người Mông đẹp như tranh.', 150000.00, 4.8, 'https://cdn3.ivivu.com/2024/07/ban-cat-cat-ivivu-11.jpg', 'Lào Cai', '2026-09-14 08:47:31', 50000.00),
(188, 3, 38, 'Thung lũng Mường Hoa & Bãi đá cổ', 'TP. Sapa', 'Thung lũng ruộng bậc thang tuyệt đẹp bậc nhất Tây Bắc.', 80000.00, 4.9, 'https://alltours.vn/wp-content/uploads/thung-lung-muong-hoa-1.jpg', 'Lào Cai', '2026-09-14 08:47:31', 290000.00),
(189, 4, 38, 'Thác Bạc Sapa', 'TP. Sapa', 'Ngọn thác nước trắng xóa tuôn chảy từ đỉnh núi cao.', 20000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/tan-mat-chiem-nguong-ve-dep-cua-thac-bac-cay-vi-cam-cua-nui-rung-sapa-1621358687.jpg', 'Lào Cai', '2026-09-14 08:47:31', 45000.00);
INSERT INTO `locations` (`id`, `category_id`, `destination_id`, `name`, `address`, `description`, `average_cost`, `rating`, `image_url`, `destination`, `created_at`, `price`) VALUES
(190, 5, 38, 'Chợ phiên Bắc Hà', 'H. Bắc Hà', 'Phiên chợ vùng cao đặc sắc rực rỡ sắc màu Tây Bắc.', 0.00, 4.8, 'https://images.vietnamtourism.gov.vn/vn//images/2022/thang_11/2411.cho-phien-bac-ha-net-dep-vung-cao-nguyen-trang-3.jpg', 'Lào Cai', '2026-09-14 08:47:31', 50000.00),
(191, 1, 39, 'Làng nổi Tân Lập', 'H. Mộc Hóa', 'Khu du lịch sinh thái ngập nước tràm rợp bóng.', 60000.00, 4.7, 'https://ik.imagekit.io/tvlk/blog/2022/03/lang-noi-tan-lap-1.jpg', 'Long An', '2026-09-14 08:47:31', 50000.00),
(192, 2, 39, 'Khu di tích Vàm Nhựt Tảo', 'H. Tân Trụ', 'Địa danh lịch sử gắn liền anh hùng Nguyễn Trung Trực.', 10000.00, 4.6, 'https://i2.ex-cdn.com/crystalbay.com/files/content/2025/03/07/khu-di-tich-vam-nhut-tao-long-an-2-1547.jpg', 'Long An', '2026-09-14 08:47:31', 50000.00),
(193, 3, 39, 'Nhà trăm cột Long An', 'H. Cần Đước', 'Ngôi nhà cổ kiến trúc nhà rường Nam Bộ quý giá.', 20000.00, 4.7, 'https://ik.imagekit.io/tvlk/blog/2023/11/nha-tram-cot-cover.jpg', 'Long An', '2026-09-14 08:47:31', 50000.00),
(194, 4, 39, 'Khu du lịch sinh thái Đồng Tháp Mười', 'H. Thạnh Hóa', 'Vùng ngập nước nguyên sơ hoa sen súng.', 40000.00, 4.6, 'https://media.loveitopcdn.com/2137/khu-bao-ton-dong-thap-muoi-tien-giang.jpg', 'Long An', '2026-09-14 08:47:31', 50000.00),
(195, 5, 39, 'Cảng quốc tế Long An', 'H. Cần Giuộc', 'Khu vực cảng biển hiện đại phát triển.', 0.00, 4.5, 'https://longanport.com/wp-content/uploads/2023/05/LAIP-brochure-480x320.jpg.webp', 'Long An', '2026-09-14 08:47:31', 50000.00),
(196, 1, 40, 'Quần thánh nhà thờ đổ Hải Lý', 'H. Hải Hậu', 'Công trình kiến trúc nhà thờ bị biển xâm thực độc đáo.', 0.00, 4.8, 'https://images2.thanhnien.vn/528068263637045248/2023/9/26/nha-tho-do-1695726693999569654782.jpg', 'Nam Định', '2026-09-14 08:47:31', 50000.00),
(197, 2, 40, 'Phủ Dủ (Đền Thánh Liễu Hạnh)', 'H. Vụ Bản', 'Trung tâm tín ngưỡng thờ Mẫu tam phủ linh thiêng.', 10000.00, 4.8, 'https://dulichthuduc.com.vn/vnt_upload/news/MIEN-BAC/nam-dinh/phu_day_nam_dinh_thu_duc_travel.jpg', 'Nam Định', '2026-09-14 08:47:31', 50000.00),
(198, 3, 40, 'Chùa Cổ Lễ', 'H. Trực Ninh', 'Ngôi chùa cổ có kiến trúc Phật giáo và tháp chuông lớn.', 10000.00, 4.7, 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2023/5/3/1187551/Chua-Co-Le-13.jpg', 'Nam Định', '2026-09-14 08:47:31', 50000.00),
(199, 4, 40, 'Vườn quốc gia Xuân Thủy', 'H. Giao Thủy', 'Khu Ramsar đất ngập nước quốc tế quan trọng.', 40000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/vuon-quoc-gia-xuan-thuy-01-1698308068.jpeg', 'Nam Định', '2026-09-14 08:47:31', 50000.00),
(200, 5, 40, 'Đền Trần Nam Định', 'TP. Nam Định', 'Nơi thờ các vị vua triều Trần lịch sử.', 20000.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/den-tran-nam-dinh-co-kinh-1696807839.jpg', 'Nam Định', '2026-09-14 08:47:31', 50000.00),
(201, 1, 41, 'Khu di tích Kim Liên', 'H. Nam Đàn', 'Quê hương của Chủ tịch Hồ Chí Minh kính yêu.', 0.00, 4.9, 'https://paivietnam.vn/_next/image?url=%2Fapi%2Fimages%2Fpai-media%2Flocations%2F760%2Fmedia%2F2026%2F08%2F19eb6061-57a6-448d-a277-b03300fa8d8e.jpg&w=3840&q=75', 'Nghệ An', '2026-09-14 08:47:31', 50000.00),
(202, 2, 41, 'Bãi biển Cửa Lò', 'Tx. Cửa Lò', 'Bãi biển sầm uất và nổi tiếng bậc nhất miền Trung.', 0.00, 4.7, 'https://static.vinwonders.com/production/bien-cua-lo-topbanner.jpg', 'Nghệ An', '2026-09-14 08:47:31', 290000.00),
(203, 3, 41, 'Vườn quốc gia Pù Mát', 'H. Con Cuông', 'Khu bảo tồn thiên nhiên hoang dã với thác Khe Kèm kỳ vĩ.', 50000.00, 4.8, 'https://vcdn1-dulich.vnecdn.net/2025/03/09/thackem2-1741497134-1741497212-1855-1741498170.jpg?w=1200&h=675&q=100&dpr=1&fit=crop&s=o7CUoah-X28m5VeTDRdhVg', 'Nghệ An', '2026-09-14 08:47:31', 50000.00),
(204, 4, 41, 'Đảo Chè Thanh Chương', 'H. Thanh Chương', 'Những đồi chè xanh hình đảo nổi giữa hồ nước mênh mông.', 30000.00, 4.8, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/doi-che-thanh-chuong.jpg', 'Nghệ An', '2026-09-14 08:47:31', 50000.00),
(205, 5, 41, 'Cánh đồng hoa hướng dừa Nghĩa Đàn', 'H. Nghĩa Đàn', 'Cánh đồng hoa hướng dương rực rỡ lớn nhất cả nước.', 0.00, 4.9, 'https://photo-baomoi.bmcdn.me/w500_r1/2025_12_15_180_54013545/9673b75f4216ab48f207.jpg', 'Nghệ An', '2026-09-14 08:47:31', 50000.00),
(206, 1, 42, 'Quần thể danh thắng Tràng An', 'TP. Ninh Bình', 'Di sản thiên nhiên và văn hóa thế giới UNESCO.', 250000.00, 5.0, 'https://images.vietnamtourism.gov.vn/vn/images/2021/trang_an.jpg', 'Ninh Bình', '2026-09-14 08:47:31', 250000.00),
(207, 2, 42, 'Tam Cốc - Bích Động', 'H. Hoa Lư', 'Được ví như vịnh Hạ Long trên cạn với hệ thống hang động xuyên thủy.', 150000.00, 4.9, 'https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/depositphotos437663592xl-1736213457034.jpg', 'Ninh Bình', '2026-09-14 08:47:31', 50000.00),
(208, 3, 42, 'Chùa Bái Đính', 'H. Gia Viễn', 'Ngôi chùa kỷ lục sở hữu nhiều tượng Phật lớn nhất châu Á.', 60000.00, 4.9, 'https://cdn2.tuoitre.vn/nld/291774122806476800/2025/8/11/dji202305271839200167d-1754880862074799106427.jpg', 'Ninh Bình', '2026-09-14 08:47:31', 250000.00),
(209, 4, 42, 'Hang Múa', 'H. Hoa Lư', 'Điểm check-in đỉnh núi ngắm trọn thung lũng Tam Cốc.', 100000.00, 4.9, 'https://vissaihotel.vn/photo/hang-mua-ninh-binh.jpg', 'Ninh Bình', '2026-09-14 08:47:31', 50000.00),
(210, 5, 42, 'Vườn quốc gia Cúc Phương', 'H. Nho Quan', 'Rừng nguyên sinh lâu đời với mùa bướm rừng tuyệt đẹp.', 60000.00, 4.8, 'https://phuotvivu.com/blog/wp-content/uploads/2021/09/vuon-quoc-gia-cuc-phuong.jpg', 'Ninh Bình', '2026-09-14 08:47:31', 50000.00),
(211, 1, 43, 'Vịnh Vĩnh Hy', 'H. Ninh Hải', 'Một trong bốn vịnh biển đẹp nhất Việt Nam hoang sơ.', 50000.00, 4.9, 'https://static.vinwonders.com/production/vinh-vinh-hy-1.jpg', 'Ninh Thuận', '2026-09-14 08:47:31', 290000.00),
(212, 2, 43, 'Đồi cát Nam Cương', 'H. Ninh Hải', 'Đồi cát vàng mênh mông đậm chất sa mạc nắng gió.', 0.00, 4.7, 'https://cdn3.ivivu.com/2022/10/%C4%90%E1%BB%93i-c%C3%A1t-Nam-C%C6%B0%C6%A1ng-ivivu-10-@gowithnature_.jpg', 'Ninh Thuận', '2026-09-14 08:47:31', 50000.00),
(213, 3, 43, 'Tháp Chăm Klong Garai', 'TP. Phan Rang', 'Cụm tháp Champa cổ kính và nguyên vẹn bậc nhất.', 20000.00, 4.8, 'https://vnn.1cdn.vn/thumbs/1200x630/2025/05/20/uploads-2025-thang-5-ngay-20-anh-w-thap-polokrong-10-filtered-1-907.jpg', 'Ninh Thuận', '2026-09-14 08:47:31', 50000.00),
(214, 4, 43, 'Biển Ninh Chữ', 'TP. Phan Rang', 'Bãi biển hình vòng cung trong xanh thơ mộng.', 0.00, 4.7, 'https://static.vinwonders.com/production/bai-bien-ninh-chu-1.jpg', 'Ninh Thuận', '2026-09-14 08:47:31', 290000.00),
(215, 5, 43, 'Vườn quốc gia Núi Chúa', 'H. Ninh Hải', 'Khu dự trữ sinh quyển thế giới ven biển khô hạn độc đáo.', 40000.00, 4.8, 'https://statics.vinpearl.com/trekking-thac-5-tang_1763628523.jpg', 'Ninh Thuận', '2026-09-14 08:47:31', 50000.00),
(216, 1, 44, 'Khu di tích lịch sử Đền Hùng', 'TP. Việt Trì', 'Nơi thờ cúng các Vua Hùng dựng nước linh thiêng cội nguồn.', 30000.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT2UKek102inOLlR7keHah-2-u0OymaWz3ZnftH7_k6eNpS_CyQ-omow0&s=10', 'Phú Thọ', '2026-09-14 08:47:31', 50000.00),
(217, 2, 44, 'Vườn quốc gia Xuân Sơn', 'H. Tân Sơn', 'Hệ sinh thái rừng nguyên sinh phong phú vùng trung du.', 40000.00, 4.7, 'https://lalago.vn/wp-content/uploads/2025/04/vuon-quoc-gia-xuan-son-9.jpg', 'Phú Thọ', '2026-09-14 08:47:31', 50000.00),
(218, 3, 44, 'Đầm Ao Châu', 'H. Hạ Hòa', 'Vịnh Hạ Long trên cạn của đất Tổ với hàng trăm hòn đảo nhỏ.', 20000.00, 4.6, 'https://xevietnam.com/wp-content/uploads/2023/10/100-dao-nho-o-dam-ao-chau.jpg', 'Phú Thọ', '2026-09-14 08:47:31', 50000.00),
(219, 4, 44, 'Đền Lăng Xương', 'H. Thanh Thủy', 'Ngôi đền cổ thờ thân mẫu Thánh Tản Viên.', 10000.00, 4.7, 'https://images.baoangiang.com.vn/image/news/2023/20230922/origin/lang-suong-noi-dat_1250_1695365824.jpg', 'Phú Thọ', '2026-09-14 08:47:31', 80000.00),
(220, 5, 44, 'Khu du lịch nước khoáng nóng Thanh Thủy', 'H. Thanh Thủy', 'Khu nghỉ dưỡng suối khoáng trị liệu sức khỏe.', 100000.00, 4.7, 'https://www.dulichvtv.com/wp-content/uploads/2025/06/Du-lich-Thanh-Thuy-Trai-nghiem-tam-khoang-nong-giua-song-Da.jpg', 'Phú Thọ', '2026-09-14 08:47:31', 50000.00),
(221, 1, 45, 'Gành Đá Đĩa', 'H. Tuy An', 'Kỳ quan thiên nhiên các cột đá bazan xếp hình lục giác độc đáo.', 20000.00, 4.9, 'https://statics.vinpearl.com/ganh-da-dia-phu-yen_1751078702.jpg', 'Phú Yên', '2026-09-14 08:47:31', 50000.00),
(222, 2, 45, 'Bãi Xép & Cỏ Xanh', 'H. Tuy An', 'Bối cảnh nổi tiếng của bộ phim \"Tôi thấy hoa vàng trên cỏ xanh\".', 20000.00, 4.8, 'https://bizweb.dktcdn.net/100/514/026/files/bai-xep-phu-yen-2.jpg?v=1767414543239', 'Phú Yên', '2026-09-14 08:47:31', 290000.00),
(223, 3, 45, 'Mũi Điện (Cap Varella)', 'H. Đông Hòa', 'Điểm đón ánh bình minh trên đất liền sớm nhất Việt Nam.', 20000.00, 4.9, 'https://zoomtravel.vn/upload/news/mui-dien-phu-yen11300.png', 'Phú Yên', '2026-09-14 08:47:31', 290000.00),
(224, 4, 45, 'Vịnh Xuân Đài', 'Tx. Sông Cầu', 'Vịnh biển hoang sơ nước phẳng lặng như gương.', 0.00, 4.8, 'https://mia.vn/media/uploads/blog-du-lich/vinh-xuan-dai-phu-yen-ve-dep-tru-tinh-duoc-thien-nhien-uu-ai-ban-tang-manh-dat-phu-yen-05-1637655958.jpeg', 'Phú Yên', '2026-09-14 08:47:31', 290000.00),
(225, 5, 45, 'Hồ Ô Loan', 'H. Tuy An', 'Đầm nước lợ nổi tiếng với đặc sản sò huyết tươi ngon.', 0.00, 4.7, 'https://cdn3.ivivu.com/2022/09/%C4%90%E1%BA%A7m-%C3%94-Loan-ivivu-6.jpg', 'Phú Yên', '2026-09-14 08:47:31', 250000.00),
(226, 1, 46, 'Động Phong Nha', 'H. Bố Trạch', 'Kỳ quan hang động nước dài và kỳ vĩ thế giới.', 150000.00, 4.9, 'https://dulichnewtour.vn/ckfinder/images/dong-phong-nha%20(17).jpg', 'Quảng Bình', '2026-09-14 08:47:31', 50000.00),
(227, 2, 46, 'Động Thiên Đường', 'H. Bố Trạch', 'Hoàng cung trong lòng đất với thạch nhũ tráng lệ.', 250000.00, 5.0, 'https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/depositphotos88801884xl-1734917577484.jpg', 'Quảng Bình', '2026-09-14 08:47:31', 50000.00),
(228, 3, 46, 'Sông Chày - Hang Tối', 'H. Bố Trạch', 'Điểm du lịch trải nghiệm chèo thuyền kayak và tắm bùn hang động.', 450000.00, 4.9, 'https://phongnhatourist.com/wp-content/uploads/2020/03/88060507_484394255591121_5438686901894643712_n.jpg', 'Quảng Bình', '2026-09-14 08:47:31', 250000.00),
(229, 4, 46, 'Bãi biển Nhật Lệ', 'TP. Đồng Hới', 'Bãi biển cát trắng nước trong xanh tuyệt đẹp.', 0.00, 4.7, 'https://statics.vinpearl.com/bien-nhat-le-1_1629783746.png', 'Quảng Bình', '2026-09-14 08:47:31', 290000.00),
(230, 5, 46, 'Vũng Chùa - Đảo Yến', 'H. Quảng Trạch', 'Nơi yên nghỉ của Đại tướng Võ Nguyên Giáp.', 0.00, 4.9, 'https://api.sovaba.travel/uploads/vung_chua_dao_yen_sovaba_cb3310aafc.jpg', 'Quảng Bình', '2026-09-14 08:47:31', 50000.00),
(231, 1, 47, 'Phố cổ Hội An', 'TP. Hội An', 'Di sản văn hóa thế giới với đèn lồng và kiến trúc cổ kính.', 80000.00, 5.0, 'https://dulichdemen.vn/wp-content/uploads/2023/10/pho-co-hoi-an-du-lich-de-men-vn.jpg', 'Quảng Nam', '2026-09-14 08:47:31', 80000.00),
(232, 2, 47, 'Thánh địa Mỹ Sơn', 'H. Duy Xuyên', 'Quần thể đền tháp Champa cổ kính ngàn năm.', 150000.00, 4.8, 'https://danangfantasticity.com/wp-content/uploads/2025/09/khu-den-thap-my-son-03-1024x576.jpg\r\n', 'Quảng Nam', '2026-09-14 08:47:31', 50000.00),
(233, 3, 47, 'Cù Lao Chàm', 'TP. Hội An', 'Khu dự trữ sinh quyển thế giới đảo hoang sơ.', 70000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoZcW-qzUf5WlCj-V6LR9ly_yicBGVnzDI4ILPlkspdLXwMn2IQHCO2HI&s=10', 'Quảng Nam', '2026-09-14 08:47:31', 50000.00),
(234, 4, 47, 'Làng bích họa Tam Thanh', 'TP. Tam Kỳ', 'Làng chài ven biển với các bức tranh tường rực rỡ.', 0.00, 4.6, 'https://static.vinwonders.com/2022/03/lang-bich-hoa-tam-thanh-thumb.jpg', 'Quảng Nam', '2026-09-14 08:47:31', 50000.00),
(235, 5, 47, 'Đỉnh Quế Tây Giang', 'H. Tây Giang', 'Săn mây đại ngàn trên dãy Trường Sơn hùng vĩ.', 0.00, 4.8, 'https://statics.vinpearl.com/dinh-que-tay-giang-4_1634609630.jpg', 'Quảng Nam', '2026-09-14 08:47:31', 850000.00),
(236, 1, 48, 'Đảo Lý Sơn', 'H. Lý Sơn', 'Vương quốc tỏi và thiên đường đảo núi lửa giữa trùng khơi.', 150000.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/dao-ly-son-13-1696462556.jpg', 'Quảng Ngãi', '2026-09-14 08:47:31', 50000.00),
(237, 2, 48, 'Bãi biển Mỹ Khê Quảng Ngãi', 'TP. Quảng Ngãi', 'Bãi biển hiền hòa rợp bóng dừa xanh mát.', 0.00, 4.6, 'https://ik.imagekit.io/tvlk/blog/2023/06/mJDL20Dt-image-1024x576.png?tr=q-70,c-at_max,w-1000,h-600', 'Quảng Ngãi', '2026-09-14 08:47:31', 290000.00),
(238, 3, 48, 'Khu chứng tích Sơn Mỹ', 'H. Sơn Tịnh', 'Di tích lịch sử đau thương và gìn giữ hòa bình.', 10000.00, 4.7, 'https://upload.wikimedia.org/wikipedia/commons/8/89/Monument_of_the_My_Lai_Massacre_%282%29.jpg?utm_source=vi.wikipedia.org&utm_campaign=index&utm_content=original', 'Quảng Ngãi', '2026-09-14 08:47:31', 50000.00),
(239, 4, 48, 'Thành cổ Châu Sa', 'H. Tư Nghĩa', 'Dấu tích văn hóa Champa cổ ngàn năm.', 0.00, 4.5, 'https://lalago.vn/wp-content/uploads/2025/07/Thanh-co-Chau-Sa-7.jpg', 'Quảng Ngãi', '2026-09-14 08:47:31', 50000.00),
(240, 5, 48, 'Khu sinh thái Trà Bồng', 'H. Trà Bồng', 'Vùng núi non quê hương quế trứ danh.', 20000.00, 4.6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYYCZFVB5FstNjbNrUWVVScKbYyi2uP-UO2FoPge1IJNVFKrYtPQOxFH0&s=10', 'Quảng Ngãi', '2026-09-14 08:47:31', 50000.00),
(241, 1, 49, 'Vịnh Hạ Long', 'TP. Hạ Long', 'Kỳ quan thiên nhiên thế giới UNESCO hàng nghìn hòn đảo đá.', 300000.00, 5.0, 'https://cdn3.ivivu.com/2013/04/1Halong-bay-Vietnamt.jpg', 'Quảng Ninh', '2026-09-14 08:47:31', 290000.00),
(242, 2, 49, 'Khu di tích Yên Tử', 'TP. Uông Bí', 'Đất tổ Phật giáo Trúc Lâm thiêng liêng trên đỉnh núi.', 40000.00, 4.9, 'https://cdn3.ivivu.com/2022/10/qu%E1%BA%A7n-th%C3%AA-di-tich-danh-thang-Y%C3%AAn-Tu-ivivu.jpg', 'Quảng Ninh', '2026-09-14 08:47:31', 50000.00),
(243, 3, 49, 'Đảo Quan Lạn & Minh Châu', 'H. Vân Đồn', 'Bãi biển hoang sơ cát trắng mịn màng như kem.', 100000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIJbBLpbWtG53jOb1vWIHZKrapXl5awu-mvAzD0jc1g&s=10', 'Quảng Ninh', '2026-09-14 08:47:31', 50000.00),
(244, 4, 49, 'Bình Liêu', 'H. Bình Liêu', 'Sống lưng khủng long check-in biên giới tuyệt đẹp mùa lúa chín.', 0.00, 4.9, 'https://vcdn1-dulich.vnecdn.net/2022/06/08/BinhLieuQuangNinh00-1654667352-6661-1654667806.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=MrR2gGIJv9yz7IvY-_TDhQ', 'Quảng Ninh', '2026-09-14 08:47:31', 50000.00),
(245, 5, 49, 'Sun World Hạ Long Complex', 'TP. Hạ Long', 'Tổ hợp công viên giải trí và cáp treo Nữ Hoàng hiện đại.', 350000.00, 4.8, 'https://halongpearlhotel.vn/uploads/images/2021/01/1610941029-single_news2-sunworldhalongpearl.jpg', 'Quảng Ninh', '2026-09-14 08:47:31', 290000.00),
(246, 1, 50, 'Thành cổ Quảng Trị', 'Tx. Quảng Trị', 'Di tích lịch sử hào hùng ghi dấu cuộc chiến 81 ngày đêm.', 0.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReOXGMz_ELZKVkbTogsTh3euY4emGDvao6Y-PEcGSdF1Zzn73SWVBmgPg&s=10', 'Quảng Trị', '2026-09-14 08:47:31', 50000.00),
(247, 2, 50, 'Địa đạo Vịnh Mốc', 'H. Vĩnh Linh', 'Làng hầm trú ẩn kỳ diệu trong lòng đất thời chiến tranh.', 40000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfPf3lrFoJPvRh7HmQDAHEUHZ0Vx74GghCOrb432kIBic7uLSjIof0jKHK&s=10', 'Quảng Trị', '2026-09-14 08:47:31', 290000.00),
(248, 3, 50, 'Cầu Hiền Lương & Sông Bến Hải', 'H. Vĩnh Linh', 'Vĩ tuyến 17 chia cắt đất nước hai miền Nam - Bắc lịch sử.', 20000.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/cau-hien-luong-phuc-dung-1754296893.jpg', 'Quảng Trị', '2026-09-14 08:47:31', 250000.00),
(249, 4, 50, 'Đảo Cồn Cỏ', 'H. Cồn Cỏ', 'Hòn đảo tiền tiêu anh hùng giữa biển khơi.', 150000.00, 4.7, 'https://vcdn1-dulich.vnecdn.net/2026/05/17/2aOboQWeKHNG67ecV5fMGx3uHQJWjq-8068-5039-1778983026.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=JlK1XdkWcPEKGnSox5F6Qw', 'Quảng Trị', '2026-09-14 08:47:31', 50000.00),
(250, 5, 50, 'Biển Cửa Tùng', 'H. Vĩnh Linh', 'Nữ hoàng các bãi tắm một thời.', 0.00, 4.6, 'https://sanvemaybay.vn/includes/uploads/2024/09/cuaviet_OUYG-e1727441511548.jpg', 'Quảng Trị', '2026-09-14 08:47:31', 290000.00),
(251, 1, 51, 'Chùa Dơi (Chùa Mã Tồ)', 'TP. Sóc Trăng', 'Ngôi chùa cổ đặc trưng văn hóa Khmer nổi tiếng hàng vạn con dơi.', 10000.00, 4.7, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/chua-doi-st.png', 'Sóc Trăng', '2026-09-14 08:47:31', 50000.00),
(252, 2, 51, 'Chùa Som Rong', 'TP. Sóc Trăng', 'Ngôi chùa Khmer với tượng Phật Thích Ca nhập niết bàn khổng lồ ngoài trời.', 0.00, 4.9, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0a/T%C6%B0%E1%BB%A3ng_ph%E1%BA%ADt_n%E1%BA%B1m_t%E1%BA%A1i_S%C3%B3c_Tr%C4%83ng_2.jpg/1280px-T%C6%B0%E1%BB%A3ng_ph%E1%BA%ADt_n%E1%BA%B1m_t%E1%BA%A1i_S%C3%B3c_Tr%C4%83ng_2.jpg?utm_source=vi.wikipedia.org&utm_campaign=index&utm_content=thumbnail', 'Sóc Trăng', '2026-09-14 08:47:31', 50000.00),
(253, 3, 51, 'Chùa Chén Kiểu (Sro Lôn)', 'H. Châu Thành', 'Ngôi chùa độc đáo được khảm từ hàng vạn mảnh chén đĩa sứ.', 10000.00, 4.8, 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/12/13/1126883/277300939_2478340285.jpg', 'Sóc Trăng', '2026-09-14 08:47:31', 50000.00),
(254, 4, 51, 'Bảo tàng Khmer Sóc Trăng', 'TP. Sóc Trăng', 'Nơi trưng bày hiện vật văn hóa truyền thống đồng bào Khmer.', 20000.00, 4.7, 'https://hitour.vn/storage/images/upload/tour-du-lich-soc-trang-38-750x460-type-manager-upload.webp', 'Sóc Trăng', '2026-09-14 08:47:31', 50000.00),
(255, 5, 51, 'Khu du lịch Hồ Nước Ngọt', 'TP. Sóc Trăng', 'Công viên cây xanh vui chơi dạo mát.', 0.00, 4.5, 'https://dulichthuduc.com.vn/vnt_upload/news/MIEN-TAY/soc-trang/cong_vien_ho_nuoc_ngot_soc_trang_du_lich_thu_duc_4.jpg', 'Sóc Trăng', '2026-09-14 08:47:31', 250000.00),
(256, 1, 52, 'Cao nguyên Mộc Châu', 'H. Mộc Châu', 'Thiên đường chè xanh, hoa mận trắng ngút ngàn.', 0.00, 4.9, 'https://longphutravel.com/uploads/gallery/kham-pha-cao-nguyen-moc-chau/72520.jpg', 'Sơn La', '2026-09-14 08:47:31', 30000.00),
(257, 2, 52, 'Thác Dải Yếm', 'H. Mộc Châu', 'Ngọn thác nước đẹp như dải lụa trắng giữa núi rừng.', 30000.00, 4.8, 'https://booking.muongthanh.com/upload_images/images/2024%20-%20Nh/H%C3%A0/ve-dep-thac-dai-yem.jpg', 'Sơn La', '2026-09-14 08:47:31', 45000.00),
(258, 3, 52, 'Rừng thông Bản Áng', 'H. Mộc Châu', 'Được ví như Đà Lạt thu nhỏ giữa lòng Tây Bắc.', 40000.00, 4.8, 'https://zoomtravel.vn/upload/images/rung-thong-ban-ang-1.jpg', 'Sơn La', '2026-09-14 08:47:31', 50000.00),
(259, 4, 52, 'Nhà tù Sơn La', 'TP. Sơn La', 'Di tích lịch sử giam giữ các chiến sĩ cách mạng kiên trung.', 30000.00, 4.8, 'https://kenh14cdn.com/203336854389633024/2025/4/13/tp-3-2181-8735-1744545510241-1744545510859849761783.jpg', 'Sơn La', '2026-09-14 08:47:31', 50000.00),
(260, 5, 52, 'Cầu kính Bạch Long Mộc Châu', 'H. Mộc Châu', 'Cầu kính đi bộ dài nhất thế giới ngắm thung lũng sâu.', 550000.00, 4.8, 'https://phetravel.com/uploads/cau-kinh-bach-long-7.jpg', 'Sơn La', '2026-09-14 08:47:31', 0.00),
(261, 1, 53, 'Núi Bà Đen', 'TP. Tây Ninh', 'Nóc nhà Nam Bộ với hệ thống cáp treo và tượng Phật Bà cao nhất châu Á.', 250000.00, 4.9, 'https://cdn3.ivivu.com/2023/12/nui-ba-den-ivivu3.jpg', 'Tây Ninh', '2026-09-14 08:47:31', 50000.00),
(262, 2, 53, 'Tòa thánh Tây Ninh', 'H. Hoà Thành', 'Trung tâm tối cao của đạo Cao Đài kiến trúc độc đáo.', 0.00, 4.9, 'https://dulich.tayninh.gov.vn/uploads/images/%C4%90%E1%BB%8Ba%20%C4%91i%E1%BB%83m//z5305475159516-73d4c3ab165e4404e80d4c2dc4e6f769-7720.jpg', 'Tây Ninh', '2026-09-14 08:47:31', 50000.00),
(263, 3, 53, 'Hồ Dầu Tiếng Tây Ninh', 'H. Dương Minh Châu', 'Hồ nước mênh mông phục vụ cắm trại ngắm hoàng hôn.', 0.00, 4.8, 'https://static.vinwonders.com/production/2025/07/vi-tri-ho-dau-tieng.jpg', 'Tây Ninh', '2026-09-14 08:47:31', 250000.00),
(264, 4, 53, 'Tháp Chót Mạt', 'H. Tân Biên', 'Ngôi tháp Champa cổ hiếm hoi tại miền Nam.', 10000.00, 4.6, 'https://mia.vn/media/uploads/blog-du-lich/thap-chop-mat-tay-ninh-dau-an-nen-van-hoa-oc-eo-co-dai-15-1661173890.jpg', 'Tây Ninh', '2026-09-14 08:47:31', 50000.00),
(265, 5, 53, 'Vườn quốc gia Lò Gò - Xa Mát', 'H. Tân Biên', 'Khu bảo tồn thiên nhiên hoang dã biên giới.', 30000.00, 4.6, 'https://images.vietnamtourism.gov.vn/vn/images/2022/thang_11/1911.vqg_lo_go_-_xa_mat_4.jpg', 'Tây Ninh', '2026-09-14 08:47:31', 50000.00),
(266, 1, 54, 'Biển Cồn Vành', 'H. Tiền Hải', 'Bãi biển sinh thái hoang sơ lộng gió biển.', 0.00, 4.5, 'https://ik.imagekit.io/tvlk/blog/2022/11/khu-du-lich-con-vanh-2.jpg', 'Thái Bình', '2026-09-14 08:47:31', 290000.00),
(267, 2, 54, 'Chùa Keo Thái Bình', 'H. Vũ Thư', 'Ngôi cổ tự gỗ hàng trăm năm tuổi kiến trúc nghệ thuật độc nhất.', 10000.00, 4.9, 'https://redsvn.net/wp-content/uploads/2019/02/Chua-Keo-Thai-Binh-10.jpg', 'Thái Bình', '2026-09-14 08:47:31', 50000.00),
(268, 3, 54, 'Đền Tiên La', 'H. Hưng Hà', 'Ngôi đền thờ tướng nhà Đinh linh thiêng.', 10000.00, 4.7, 'https://media-cdn-v2.laodong.vn/storage/newsportal/2024/10/11/1406405/Den-Tien-La_6739.jpg', 'Thái Bình', '2026-09-14 08:47:31', 50000.00),
(269, 4, 54, 'Khu sinh thái cồn Đen', 'H. Thái Thụy', 'Khu du lịch sinh thái biển ngập mặn.', 30000.00, 4.6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfnZky1MlbZ4EfX5rPnDXBBcVTWooaVbU_8SW_n_T4tSvN0p8IAFLgN0U&s=10', 'Thái Bình', '2026-09-14 08:47:31', 50000.00),
(270, 5, 54, 'Làng nghề dệt lụa tơ tằm', 'H. Vũ Thư', 'Làng nghề truyền thống lâu đời.', 0.00, 4.6, 'https://visitninhbinh.com.vn/VisitHaNam/_default_upload_bucket/2833/image-thumb__2833__720_jpg/d1204dth-3264_1743354809.jpg_1743354809.006d39bd.png', 'Thái Bình', '2026-09-14 08:47:31', 50000.00),
(271, 1, 55, 'Hồ Núi Cốc', 'TP. Thái Nguyên', 'Khu du lịch sinh thái gắn liền huyền thoại nàng Công chàng Cốc.', 50000.00, 4.7, 'https://dltm-cdn.vnptit3.vn/resources/portal//Images/TNN/ngoclinh.tnn/Tin%202026/Th%C3%A1ng%204/H%E1%BB%93%20N%C3%BAi%20C%E1%BB%91c/ImageWaterMark/gemini_generated_image_r42l42r42l42r42l_395685673_579748068.jpg', 'Thái Nguyên', '2026-09-14 08:47:31', 250000.00),
(272, 2, 55, 'Không gian văn hóa chè Tân Cương', 'TP. Thái Nguyên', 'Thủ phủ đệ nhất danh trà Việt Nam xanh ngát.', 0.00, 4.8, 'https://cdn.baophapluat.vn/uploaded/trinhvantuananh/2025_05_15/khong-gian-van-hoa-che-tam-cuong-thai-nguyen-7502-4397.jpeg', 'Thái Nguyên', '2026-09-14 08:47:31', 50000.00),
(273, 3, 55, 'Khu di tích lịch sử ATK Định Hóa', 'H. Định Hóa', 'Thủ đô gió buôn căn cứ kháng chiến trung ương.', 30000.00, 4.8, 'https://dulichvietnam.com.vn/vnt_upload/news/05_2025/khu_di_tich_ATK_Dinh_Hoa_Thai_Nguyen_4.jpg', 'Thái Nguyên', '2026-09-14 08:47:31', 50000.00),
(274, 4, 55, 'Bảo tàng Văn hóa các dân tộc Việt Nam', 'TP. Thái Nguyên', 'Bảo tàng văn hóa dân tộc quy mô quốc gia.', 30000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuZTiLJ-hNI_wJ8W7fhBYw260ZQTRTHAfTkvVE-lH90w&s=10', 'Thái Nguyên', '2026-09-14 08:47:31', 50000.00),
(275, 5, 55, 'Hang Phượng Hoàng & Suối Mỏ Gà', 'H. Võ Nhai', 'Danh thắng hang động và nguồn suối mát lạnh.', 20000.00, 4.7, 'https://ticotravel.com.vn/wp-content/uploads/2024/10/Hang-Phuong-Hoang-Thai-Nguyen-8.jpg', 'Thái Nguyên', '2026-09-14 08:47:31', 50000.00),
(276, 1, 56, 'Bãi biển Sầm Sơn', 'TP. Sầm Sơn', 'Bãi tắm sầm uất và nổi tiếng lâu đời miền Bắc.', 0.00, 4.6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStW03r4j3AWDqjkmkz5eVivb9lrwAQrxd7k_AICYfGErmpn9zTBRusMbO4&s=10', 'Thanh Hóa', '2026-09-14 08:47:31', 290000.00),
(277, 2, 56, 'Thành nhà Hồ', 'H. Vĩnh Lộc', 'Di sản văn hóa thế giới thành đá độc nhất vô nhị.', 40000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdYi1cNYFTnJK96DGR56DCzSmT88GHdmg7c5rGaSHRx-iRfZo4xlmmEYg&s=10', 'Thanh Hóa', '2026-09-14 08:47:31', 250000.00),
(278, 3, 56, 'Khu bảo tồn thiên nhiên Pù Luông', 'H. Bá Thước', 'Thiên đường ruộng bậc thang và nghỉ dưỡng núi rừng.', 0.00, 4.9, 'https://thiennhienmoitruong.vn/upload/images/btv/bvt8/5cc5bae3-00e5-445c-b124-b2021638a838.jpg', 'Thanh Hóa', '2026-09-14 08:47:31', 50000.00),
(279, 4, 56, 'Suối cá thần Cẩm Lương', 'H. Cẩm Thủy', 'Con suối kỳ lạ hàng ngàn con cá bơi lội linh thiêng.', 20000.00, 4.8, 'https://media.thuonghieucongluan.vn/uploads/2018_07_18/5-1531918374.jpg', 'Thanh Hóa', '2026-09-14 08:47:31', 50000.00),
(280, 5, 56, 'Bãi biển Hải Tiến', 'H. Hoằng Hóa', 'Bãi biển hoang sơ hiện đại và yên bình.', 0.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZJz-DKJGVkUB9iNAOjI8VovCjpXjgniOYywm_WAU3iJP6bO7QhxOSbCs&s=10', 'Thanh Hóa', '2026-09-14 08:47:31', 290000.00),
(281, 1, 57, 'Quần thể di tích Cố đô Huế', 'TP. Huế', 'Di sản thế giới UNESCO triều đại phong kiến nhà Nguyễn.', 200000.00, 4.9, 'https://bcp.cdnchinhphu.vn/334894974524682240/2023/6/15/dji0452-16868228543002119277839.jpg', 'Thừa Thiên Huế', '2026-09-14 08:47:31', 50000.00),
(282, 2, 57, 'Chùa Thiên Mụ', 'TP. Huế', 'Ngôi cổ tự linh thiêng bên dòng sông Hương thơ mộng.', 0.00, 4.9, 'https://ik.imagekit.io/tvlk/blog/2023/06/chua-thien-mu-1.jpg', 'Thừa Thiên Huế', '2026-09-14 08:47:31', 50000.00),
(283, 3, 57, 'Lăng Khải Định & Lăng Tự Đức', 'TP. Huế', 'Kiến trúc lăng tẩm vua chúa tinh xảo bậc nhất.', 150000.00, 4.9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn-VSNIFtGGqduCGS-Tiht0VHHDKevW2JLQi38jekzc5uX1XRsSHvl6d87&s=10', 'Thừa Thiên Huế', '2026-09-14 08:47:31', 80000.00),
(284, 4, 57, 'Biển Lăng Cô & Đèo Hải Vân', 'H. Phú Lộc', 'Vịnh biển đẹp nhất hành tinh dưới chân đèo hùng vĩ.', 0.00, 4.9, 'https://brotherstravel.com.vn/wp-content/uploads/2024/06/kinh-nghiem-du-lich-lang-co-1-1.webp', 'Thừa Thiên Huế', '2026-09-14 08:47:31', 290000.00),
(285, 5, 57, 'Đồi Vọng Cảnh', 'TP. Huế', 'Điểm ngắm hoàng hôn sông Hương tuyệt đẹp.', 0.00, 4.8, 'https://khamphahue.com.vn/Portals/0/Medias/Nam2024/T8/Khamphahue_Doi-Vong-Canh-Hue_ThamquanDoiVongCanh-1.jpg', 'Thừa Thiên Huế', '2026-09-14 08:47:31', 50000.00),
(286, 1, 58, 'Cù Lao Thới Sơn', 'TP. Mỹ Tho', 'Khu du lịch miệt vườn sông nước Cửu Long.', 50000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/khu-du-lich-cu-lao-thoi-son-con-lan-tien-giang-co-gi-thu-vi-11-1650893631.jpeg', 'Tiền Giang', '2026-09-14 08:47:31', 50000.00),
(287, 2, 58, 'Chùa Vĩnh Tràng', 'TP. Mỹ Tho', 'Ngôi chùa cổ kiến trúc pha trộn Á - Âu độc đáo.', 10000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbjx-Uv5Ww2NHiGhveR6CENDpyfA_LyIGiaC17OC1Wk8D8HJnAnD_4N_o&s=10', 'Tiền Giang', '2026-09-14 08:47:31', 50000.00),
(288, 3, 58, 'Trại rắn Đồng Tâm', 'H. Châu Thành', 'Trung tâm nghiên cứu rắn lớn nhất nước.', 40000.00, 4.6, 'https://media.gody.vn//images/hinh-tong-hop/hinh-anh-tong-hop-2/4-2019/97557747-20190409084233-hinh-tong-hop-hinh-anh-tong-hop-2.jpg', 'Tiền Giang', '2026-09-14 08:47:31', 50000.00),
(289, 4, 58, 'Chợ nổi Cái Bè', 'H. Cái Bè', 'Chợ nổi giao thương sầm uất trên sông Tiền.', 0.00, 4.6, 'https://mia.vn/media/uploads/blog-du-lich/doc-dao-cho-noi-cai-be-tien-giang-binh-di-va-dac-sac-07-1650892535.jpeg', 'Tiền Giang', '2026-09-14 08:47:31', 50000.00),
(290, 5, 58, 'Di tích Rạch Gầm - Xoài Mút', 'H. Châu Thành', 'Nơi ghi dấu chiến thắng oanh liệt của Quang Trung.', 10000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBnYdSOE3xyhvglzHKR-xGSBvTV9RMC90WFeo0uncbGA&s=10', 'Tiền Giang', '2026-09-14 08:47:31', 50000.00),
(291, 1, 59, 'Ao Bà Om', 'TP. Trà Vinh', 'Danh thắng ao nước ngọt cổ kính rợp bóng cây cổ thụ hàng trăm năm.', 0.00, 4.8, 'https://ik.imagekit.io/tvlk/blog/2025/03/ao-ba-om-2.png?tr=q-70,c-at_max,w-1000,h-600', 'Trà Vinh', '2026-09-14 08:47:31', 50000.00),
(292, 2, 59, 'Chùa Hang (Chùa Kompong Krang)', 'H. Cầu Kè', 'Ngôi chùa Khmer có khuôn viên rừng rậm tự nhiên trú ngụ của chim cò.', 0.00, 4.7, 'https://cdn2.tuoitre.vn/nld/291774122806476800/2023/4/16/chua-hang-cong-6-1681634236013851222042.jpg', 'Trà Vinh', '2026-09-14 08:47:31', 50000.00),
(293, 3, 59, 'Chùa Âng', 'TP. Trà Vinh', 'Ngôi chùa Khmer cổ kính bậc nhất Trà Vinh đối diện Ao Bà Om.', 10000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmnKdLxKOHHCjXHOhvr4L5C8dw9b2CCVq4ecX2QgJSQ4KCXte0HghvWeE&s=10', 'Trà Vinh', '2026-09-14 08:47:31', 50000.00),
(294, 4, 59, 'Khu sinh thái Rừng đước Long Hải', 'H. Duyên Hải', 'Hệ sinh thái rừng ngập mặn ven biển.', 30000.00, 4.6, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/08_2023/canh_dep_nhu_tranh_ve.jpg', 'Trà Vinh', '2026-09-14 08:47:31', 50000.00),
(295, 5, 59, 'Biển Ba Động', 'H. Duyên Hải', 'Bãi biển cát pha bùn đặc trưng miền biển Trà Vinh.', 0.00, 4.5, 'https://storage.googleapis.com/blogvxr-uploads/2026/04/db482ab0-bien-ba-dong-tra-vinh-1724163.jpg', 'Trà Vinh', '2026-09-14 08:47:31', 290000.00),
(296, 1, 60, 'Khu di tích lịch sử Tân Trào', 'H. Sơn Dương', 'Thủ đô kháng chiến cách mạng lịch sử quốc gia.', 30000.00, 4.8, 'https://cdn-images.vtv.vn/66349b6076cb4dee98746cf1/2026/04/04/m2-14058503416239607642314.jpg\r\n', 'Tuyên Quang', '2026-09-14 08:47:31', 50000.00),
(297, 2, 60, 'Hồ Na Hang & Thác Bản Bung', 'H. Na Hang', 'Vịnh Hạ Long trên cạn giữa núi rừng xanh thẳm.', 100000.00, 4.9, 'https://huonganhtourist.vn/wp-content/uploads/2022/07/anh-dep-na-hang-3353f9a5-a39b-45b8-b363-8b86db3a5634.webp', 'Tuyên Quang', '2026-09-14 08:47:31', 250000.00),
(298, 3, 60, 'Suối khoáng nóng Mỹ Lâm', 'TP. Tuyên Quang', 'Khu nghỉ dưỡng suối khoáng trị liệu chất lượng cao.', 80000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ99k5C9lX0d7MHZ3KjEW_AL0Vq91lrv13FmrMelEOohB3S6C8tYxmMnSup&s=10', 'Tuyên Quang', '2026-09-14 08:47:31', 50000.00),
(299, 4, 60, 'Thác Mơ Na Hang', 'H. Na Hang', 'Ngọn thác 3 tầng trắng xóa giữa đại ngàn.', 20000.00, 4.7, 'https://statics.vinpearl.com/thac-mo-tuyen-quang_1730129631.jpg', 'Tuyên Quang', '2026-09-14 08:47:31', 45000.00),
(300, 5, 60, 'Đền Thượng Tuyên Quang', 'TP. Tuyên Quang', 'Ngôi đền linh thiêng bên bờ sông Lô.', 0.00, 4.6, 'https://statics.vinpearl.com/vang-canh-den-thuong_1735488025.jpg', 'Tuyên Quang', '2026-09-14 08:47:31', 50000.00),
(301, 1, 61, 'Cù lao An Bình', 'H. Long Hồ', 'Thiên đường du lịch miệt vườn trái cây trĩu quả', 40000.00, 4.7, 'https://mia.vn/media/uploads/blog-du-lich/kham-pha-cu-lao-an-binh-voi-khong-gian-miet-vuon-dam-chat-mien-tay-2-1662980905.jpg', 'Vĩnh Long', '2026-09-14 08:47:31', 50000.00),
(302, 2, 61, 'Chợ nổi Trà Ôn', 'H. Trà Ôn', 'Chợ nổi giao thương sầm uất trên sông Hậu.', 0.00, 4.6, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2023/tra_on5_MIA_vn.jpg', 'Vĩnh Long', '2026-09-14 08:47:31', 50000.00),
(303, 3, 61, 'Văn thánh miếu Vĩnh Long', 'TP. Vĩnh Long', 'Văn miếu tôn vinh Nho học vùng đất Nam Bộ.', 10000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUNT8PM8S_tfEGtqArd0AAqKjx-w4IN8IaRpdnOMS0dg&s=10', 'Vĩnh Long', '2026-09-14 08:47:31', 50000.00),
(304, 4, 61, 'Khu di tích Phạm Hùng', 'H. Long Hồ', 'Nơi tưởng niệm cố chủ tịch hội đồng bộ trưởng.', 0.00, 4.7, 'https://dltm-cdn.vnptit3.vn/resources/portal//Images/VLG/superadminportal.vlg/%C4%90%E1%BB%8Ba%20%C4%91i%E1%BB%83m/1.%20Khu%20t%C6%B0%E1%BB%9Fng%20ni%E1%BB%87m%20c%E1%BB%91%20Ch%E1%BB%A7%20t%E1%BB%8Bch%20H%C4%90BT%20Ph%E1%BA%A1m%20H%C3%B9ng/636528327474054864_images1925966_phung_1.jpg', 'Vĩnh Long', '2026-09-14 08:47:31', 50000.00),
(305, 5, 61, 'Chùa Tiên Châu', 'H. Long Hồ', 'Ngôi cổ tự hơn 250 năm trên cù lao An Bình.', 0.00, 4.7, 'https://vietnamtourism.vn/imguploads/tourist/2014/VinhLong/62Chuatienchau01.jpg', 'Vĩnh Long', '2026-09-14 08:47:31', 50000.00),
(306, 1, 62, 'Khu du lịch Tam Đảo', 'H. Tam Đảo', 'Đà Lạt của miền Bắc với mây mù che phủ và kiến trúc độc đáo.', 0.00, 4.8, 'https://storage.googleapis.com/blogvxr-uploads/2025/08/d75be014-dia-diem-du-lich-tam-dao-1650730.jpg', 'Vĩnh Phúc', '2026-09-14 08:47:31', 50000.00),
(307, 2, 62, 'Thiền viện Trúc Lâm Tây Thiên', 'H. Tam Đảo', 'Trung tâm Phật giáo lớn dưới chân núi Tam Đảo linh thiêng.', 0.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/thien-vien-truc-lam-tay-thien-7-1690413231.jpg', 'Vĩnh Phúc', '2026-09-14 08:47:31', 50000.00),
(308, 3, 62, 'Hồ Đại Lải & Flamingo', 'Tx. Phúc Yên', 'Khu nghỉ dưỡng sinh thái hồ nước cao cấp.', 150000.00, 4.8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8XVCAhETRVHvhonOoRCJhE7T18W9LHwKLfKyPl1Um5pe5p8SKUBPidQQ&s=10', 'Vĩnh Phúc', '2026-09-14 08:47:31', 250000.00),
(309, 4, 62, 'Tháp Bình Sơn', 'H. Sông Lô', 'Ngôi tháp đất nung kiến trúc thời Lý vô cùng quý giá.', 10000.00, 4.7, 'https://file3.qdnd.vn/data/images/0/2024/11/24/upload_2325/z6063857476752_43fdd87a4759bec11ba5ea0685a984f0.jpg', 'Vĩnh Phúc', '2026-09-14 08:47:31', 50000.00),
(310, 5, 62, 'Đền thờ Hai Bà Trưng', 'H. Mê Linh', 'Khu di tích lịch sử quốc gia trang nghiêm.', 10000.00, 4.8, 'https://ik.imagekit.io/tvlk/blog/2023/08/den-hai-ba-trung-acc-2.jpg', 'Vĩnh Phúc', '2026-09-14 08:47:31', 50000.00),
(311, 1, 63, 'Ruộng bậc thang Mù Căng Chải', 'H. Mù Căng Chải', 'Di sản danh thắng quốc gia với mùa vàng đẹp ngây ngất.', 20000.00, 5.0, 'https://phuotvivu.com/blog/wp-content/uploads/2021/09/mu-cang-chai-mua-lua-chin.jpeg', 'Yên Bái', '2026-09-14 08:47:31', 20000.00),
(312, 2, 63, 'Đèo Khau Phạ', 'H. Mù Căng Chải', 'Một trong tứ đại đỉnh đèo điểm nhảy dù cực hot.', 0.00, 4.9, 'https://cdn3.ivivu.com/2022/11/%C4%90%C3%A8o-Khau-Ph%E1%BA%A1-ivivu-11.jpg', 'Yên Bái', '2026-09-14 08:47:31', 0.00),
(313, 3, 63, 'Hồ Thác Bà', 'H. Yên Bình', 'Hồ nhân tạo lớn với hàng nghìn đảo xanh kỳ vĩ.', 40000.00, 4.7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZKXJuLMie5aqZYoNz5LDcuFZQtR5sdtfsDq6X1NbJ6ITL9tWfdQLjLxU&s=10', 'Yên Bái', '2026-09-14 08:47:31', 250000.00),
(314, 4, 63, 'Suối khoáng nóng Trạm Tấu', 'H. Trạm Tấu', 'Bể bơi suối khoáng nóng tự nhiên giữa thung lũng lúa.', 50000.00, 4.9, 'https://mia.vn/media/uploads/blog-du-lich/suoi-khoang-nong-tram-tau-thien-duong-suoi-khoang-nong-dep-nhat-tay-bac-1727409176.jpg', 'Yên Bái', '2026-09-14 08:47:31', 50000.00),
(315, 5, 63, 'Tà Xùa (Bản Công)', 'H. Trạm Tấu', 'Thiên đường săn mây đại ngàn Tây Bắc.', 0.00, 4.9, 'https://viettrekking.vn/wp-content/uploads/2025/02/73C2768.jpeg', 'Yên Bái', '2026-09-14 08:47:31', 50000.00),
(316, 4, 9, 'Đèo Phja Đắc', 'H. Ba Bể', 'Cung đường đèo hiểm trở ngắm trọn núi rừng Đông Bắc.', 0.00, 4.6, 'https://mia.vn/media/uploads/blog-du-lich/deo-pha-din-9-1694230855.jpg', 'Bắc Kạn', '2026-09-14 08:47:31', 0.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `registrations`
--

CREATE TABLE `registrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `registrations`
--

INSERT INTO `registrations` (`id`, `user_id`, `trip_id`, `status`, `registered_at`) VALUES
(1, 3, 1, 'confirmed', '2026-09-14 08:15:39'),
(6, 4, 4, 'confirmed', '2026-09-15 12:55:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `location_id`, `rating`, `comment`, `created_at`) VALUES
(1, 3, 29, 5, 'ok ngon', '2026-09-14 10:04:20'),
(5, 3, 86, 5, 'địa điểm đẹp đáng để đi', '2026-09-15 12:45:07'),
(6, 4, 34, 5, 'địa điểm đẹp đáng để đi', '2026-09-15 12:53:37'),
(7, 3, 122, 4, 'cũng được', '2026-09-15 12:56:57'),
(8, 3, 180, 5, 'địa điểm đẹp đáng để đi', '2026-09-15 12:57:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review_images`
--

CREATE TABLE `review_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trips`
--

CREATE TABLE `trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED DEFAULT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `destination` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `status` enum('draft','published','completed','cancelled') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trips`
--

INSERT INTO `trips` (`id`, `destination_id`, `owner_id`, `name`, `destination`, `start_date`, `end_date`, `budget`, `description`, `status`, `created_at`) VALUES
(1, NULL, 2, 'Đà Lạt 3N2Đ', 'Đà Lạt', '2026-09-10', '2026-09-12', 5000000.00, 'Demo trip cho bài cuối kỳ.', 'published', '2026-09-14 08:06:31'),
(4, 36, 3, 'Đà lạt', 'Lâm Đồng', '2026-09-15', '2026-09-19', 5000000.00, 'Đi chơi ăn uống nghỉ dưỡng', 'published', '2026-09-15 12:42:00'),
(5, 7, 4, 'Vũng sình', 'Bà Rịa - Vũng Tàu', '2026-09-15', '2026-09-18', 3999996.00, 'đi du lịch tắm biển', 'published', '2026-09-15 12:54:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trip_members`
--

CREATE TABLE `trip_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `member_role` enum('owner','member') NOT NULL DEFAULT 'member',
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trip_members`
--

INSERT INTO `trip_members` (`id`, `trip_id`, `user_id`, `member_role`, `joined_at`) VALUES
(1, 1, 2, 'owner', '2026-09-14 08:06:31'),
(4, 4, 3, 'owner', '2026-09-15 12:42:00'),
(5, 5, 4, 'owner', '2026-09-15 12:54:07'),
(6, 5, 3, 'member', '2026-09-15 12:54:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','blocked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password_hash`, `role`, `status`, `created_at`) VALUES
(1, 'Admin TripMate', 'admin@tripmate.local', '$2y$10$92VJbW4v7jW5j8y7Y2E.6eV6V2Lx6cJg6kQ5r7KJ7QG0cY8dR6a', 'admin', 'active', '2026-09-14 08:06:31'),
(2, 'Demo User', 'demo@tripmate.local', '$2y$10$92VJbW4v7jW5j8y7Y2E.6eV6V2Lx6cJg6kQ5r7KJ7QG0cY8dR6a', 'user', 'active', '2026-09-14 08:06:31'),
(3, 'Bảo Lê', 'lebao021106@gmail.com', '$2y$10$lNtrB0y3/2MmSuq4DcO7aeU9WsXIO7fGxj0QsHVZZiwIMexE8YziC', 'admin', 'active', '2026-09-14 08:13:04'),
(4, 'Bảo Lê', 'legiabao056@gmail.com', '$2y$10$.jkyStnxnZT..sdeIGAfhewdebbp4S2Lb57/stinsvZhfD69lEt6.', 'user', 'active', '2026-09-15 12:52:58');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checklist_trip` (`trip_id`,`item_order`,`is_completed`);

--
-- Chỉ mục cho bảng `checklist_progress`
--
ALTER TABLE `checklist_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_checklist_user` (`checklist_id`,`user_id`),
  ADD KEY `idx_progress_user` (`user_id`,`checklist_id`);

--
-- Chỉ mục cho bảng `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_destinations_active_name` (`is_active`,`name`);

--
-- Chỉ mục cho bảng `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_id` (`trip_id`),
  ADD KEY `paid_by` (`paid_by`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_favorite` (`user_id`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Chỉ mục cho bảng `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `idx_itinerary_trip_day` (`trip_id`,`day_number`,`start_time`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `idx_locations_name` (`name`),
  ADD KEY `idx_locations_rating` (`rating`),
  ADD KEY `fk_locations_destination` (`destination_id`);

--
-- Chỉ mục cho bảng `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_registration` (`user_id`,`trip_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_review_user_location` (`user_id`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Chỉ mục cho bảng `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_review_images_review` (`review_id`);

--
-- Chỉ mục cho bảng `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `idx_trips_dates` (`start_date`,`end_date`);

--
-- Chỉ mục cho bảng `trip_members`
--
ALTER TABLE `trip_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_trip_user` (`trip_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `checklists`
--
ALTER TABLE `checklists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `checklist_progress`
--
ALTER TABLE `checklist_progress`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT cho bảng `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `trip_members`
--
ALTER TABLE `trip_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `checklists`
--
ALTER TABLE `checklists`
  ADD CONSTRAINT `checklists_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `checklist_progress`
--
ALTER TABLE `checklist_progress`
  ADD CONSTRAINT `checklist_progress_ibfk_1` FOREIGN KEY (`checklist_id`) REFERENCES `checklists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checklist_progress_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`paid_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `itineraries`
--
ALTER TABLE `itineraries`
  ADD CONSTRAINT `itineraries_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `itineraries_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `fk_locations_destination` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `review_images`
--
ALTER TABLE `review_images`
  ADD CONSTRAINT `review_images_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `trip_members`
--
ALTER TABLE `trip_members`
  ADD CONSTRAINT `trip_members_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trip_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
