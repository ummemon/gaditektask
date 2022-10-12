-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2022 at 07:46 PM
-- Server version: 8.0.30-0ubuntu0.22.04.1
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraveltask`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailbox`
--

CREATE TABLE `mailbox` (
  `id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `sender_id` int UNSIGNED NOT NULL,
  `sender_to_id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `is_read` int NOT NULL DEFAULT '0',
  `status` enum('Sent','received') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mailbox`
--

INSERT INTO `mailbox` (`id`, `subject`, `message`, `sender_id`, `sender_to_id`, `parent_id`, `is_read`, `status`, `created_at`, `updated_at`) VALUES
(1, 'asdas', 'adsdas', 1, 2, 0, 0, 'Sent', NULL, NULL),
(2, 'message', 'test', 1, 2, 0, 0, 'Sent', '2022-10-12 07:56:34', '2022-10-12 07:56:34'),
(3, 'message', 'test', 1, 2, 0, 0, 'Sent', '2022-10-12 07:58:17', '2022-10-12 07:58:17'),
(4, 'SADASD', 'SADASD', 3, 1, 0, 0, 'Sent', '2022-10-12 08:46:12', '2022-10-12 08:46:12'),
(5, 'sadsada', 'test subject', 1, 3, 0, 0, 'Sent', '2022-10-12 09:31:49', '2022-10-12 09:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_10_11_100908_create_products_table', 2),
(7, '2022_10_11_130014_create_table_orders', 3),
(8, '2022_10_11_130932_create_order_products_table', 4),
(11, '2022_10_12_104048_create__mailbox_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `amount`, `charge_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '120', 'dsadasd', 1, NULL, NULL),
(2, '1', '123', '', 1, '2022-10-12 02:23:04', '2022-10-12 02:23:04'),
(3, '1', '123', '', 1, '2022-10-12 02:23:17', '2022-10-12 02:23:17'),
(4, '1', '1020', 'ch_3LrzwNDSjOV1z3Jr2V8yrhmM', 1, '2022-10-12 03:05:24', '2022-10-12 03:05:24'),
(5, '1', '1020', 'ch_3Ls038DSjOV1z3Jr0KtyEdhC', 1, '2022-10-12 03:12:23', '2022-10-12 03:12:23'),
(6, '1', '560', 'ch_3Ls0m6DSjOV1z3Jr2C3vcWD2', 1, '2022-10-12 03:58:51', '2022-10-12 03:58:51'),
(7, '1', '340', 'ch_3Ls13EDSjOV1z3Jr1vf9pidp', 1, '2022-10-12 04:16:33', '2022-10-12 04:16:33'),
(8, '1', '120', 'ch_3Ls1ngDSjOV1z3Jr0DhMMGaX', 1, '2022-10-12 05:04:33', '2022-10-12 05:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 4, 1, '2022-10-12 03:05:24', '2022-10-12 03:05:24'),
(3, 4, 2, '2022-10-12 03:05:24', '2022-10-12 03:05:24'),
(4, 5, 1, '2022-10-12 03:12:23', '2022-10-12 03:12:23'),
(5, 5, 2, '2022-10-12 03:12:23', '2022-10-12 03:12:23'),
(6, 222, 1, '2022-10-12 03:13:55', '2022-10-12 03:13:55'),
(7, 222, 2, '2022-10-12 03:13:55', '2022-10-12 03:13:55'),
(8, 222, 1, '2022-10-12 03:14:11', '2022-10-12 03:14:11'),
(9, 222, 2, '2022-10-12 03:14:11', '2022-10-12 03:14:11'),
(10, 222, 1, '2022-10-12 03:15:20', '2022-10-12 03:15:20'),
(11, 222, 2, '2022-10-12 03:15:20', '2022-10-12 03:15:20'),
(12, 222, 1, '2022-10-12 03:15:24', '2022-10-12 03:15:24'),
(13, 222, 2, '2022-10-12 03:15:24', '2022-10-12 03:15:24'),
(14, 222, 1, '2022-10-12 03:15:51', '2022-10-12 03:15:51'),
(15, 222, 2, '2022-10-12 03:15:51', '2022-10-12 03:15:51'),
(16, 222, 1, '2022-10-12 03:16:41', '2022-10-12 03:16:41'),
(17, 6, 1, '2022-10-12 03:58:51', '2022-10-12 03:58:51'),
(18, 6, 2, '2022-10-12 03:58:51', '2022-10-12 03:58:51'),
(19, 7, 1, '2022-10-12 04:16:33', '2022-10-12 04:16:33'),
(20, 7, 2, '2022-10-12 04:16:33', '2022-10-12 04:16:33'),
(21, 8, 1, '2022-10-12 05:04:33', '2022-10-12 05:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `weight` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `color`, `price`, `weight`, `created_at`, `updated_at`) VALUES
(1, 'Graphic Design', NULL, 'blue', 120, 11, NULL, NULL),
(2, 'Banner Design', NULL, NULL, 220, NULL, NULL, NULL),
(3, 'Logo Design', NULL, NULL, 440, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@mail.com', NULL, '$2y$10$d/J6Dt1MBoetxFUIVriFsOt0ntgb5ijbsyAAt3P5TzUvpROzfue/.', NULL, '2022-10-11 04:56:54', '2022-10-11 04:56:54'),
(3, 'john', 'john@mail.com', NULL, '$2y$10$d/J6Dt1MBoetxFUIVriFsOt0ntgb5ijbsyAAt3P5TzUvpROzfue/.', NULL, '2022-10-11 04:56:54', '2022-10-11 04:56:54');

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
-- Indexes for table `mailbox`
--
ALTER TABLE `mailbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mailbox`
--
ALTER TABLE `mailbox`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
