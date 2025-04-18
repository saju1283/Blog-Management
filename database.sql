-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 12:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(2, 10, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(3, 4, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(4, 1, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(5, 5, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(6, 7, 2, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(7, 1, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(8, 3, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(9, 8, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(10, 8, 4, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(11, 1, 5, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(12, 10, 5, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(13, 10, 6, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(14, 7, 6, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(15, 9, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(16, 8, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(17, 4, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(18, 1, 8, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(19, 9, 9, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(20, 6, 9, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(21, 1, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(22, 5, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(23, 4, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(24, 10, 11, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(25, 7, 11, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(26, 4, 12, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(27, 7, 12, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(28, 6, 13, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(29, 10, 14, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(30, 3, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(31, 10, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(32, 7, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(33, 4, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(34, 1, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(35, 5, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(36, 6, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(37, 2, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(38, 7, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(39, 1, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(40, 6, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(41, 8, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(42, 10, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(43, 10, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(44, 9, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(45, 6, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(46, 7, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(47, 1, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(48, 2, 19, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(49, 1, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(50, 5, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(51, 7, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(52, 10, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(53, 6, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `parent_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, 'Vel sit qui dolores amet et similique sit quisquam.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(2, 2, 17, NULL, 'Velit rerum distinctio deleniti architecto omnis sed ut.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(3, 4, 13, NULL, 'Officiis at sapiente laudantium quam illum.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(4, 3, 11, NULL, 'Sequi beatae nam sit voluptates at.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(5, 10, 5, NULL, 'Praesentium earum non officiis quo expedita quibusdam voluptatem deserunt.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(6, 4, 10, NULL, 'Illo sunt et enim incidunt.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(7, 7, 11, NULL, 'Asperiores maiores repellendus unde necessitatibus hic doloribus.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(8, 1, 19, NULL, 'Voluptates assumenda et blanditiis non.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(9, 4, 6, NULL, 'Autem aut alias doloribus molestiae enim qui.', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(10, 3, 12, NULL, 'Corporis rerum rerum tempore atque consequatur quasi numquam.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(11, 2, 5, NULL, 'Ad debitis accusantium quas natus molestiae.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(12, 4, 5, NULL, 'Quis libero vel est deserunt dolorem modi fugit eius.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(13, 7, 7, NULL, 'Debitis accusamus rerum sed voluptate.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(14, 8, 6, NULL, 'Aliquid sint et quam qui et.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(15, 9, 12, NULL, 'Praesentium inventore quia exercitationem enim amet molestiae.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(16, 1, 7, NULL, 'Perferendis tempore molestias sunt accusamus.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(17, 4, 20, NULL, 'Non et adipisci repellendus dolorem quia eum.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(18, 3, 19, NULL, 'Quaerat reiciendis molestias est consectetur quo saepe.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(19, 8, 18, NULL, 'Nemo ut enim aut non sed occaecati totam illum.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(20, 6, 13, NULL, 'Molestias et omnis ratione odio tempore voluptate vitae a.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(21, 8, 15, NULL, 'Et ab consequatur voluptatem nesciunt ut eum.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(22, 4, 19, NULL, 'Molestiae suscipit fugiat tenetur consequatur quia.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(23, 1, 3, NULL, 'Similique sunt omnis non aliquam dicta voluptatibus ex dignissimos.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(24, 10, 1, NULL, 'Ut voluptates vel minima rerum labore ea enim quas.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(25, 4, 10, NULL, 'Magnam ad aut accusamus consequatur et quo.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(26, 10, 11, NULL, 'Dicta molestias quia laudantium aut soluta quis sed dolorem.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(27, 1, 20, NULL, 'Perferendis amet aliquid in atque delectus itaque eum expedita.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(28, 4, 9, NULL, 'Animi eos ut facilis et aut excepturi.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(29, 5, 12, NULL, 'Ut et qui expedita debitis quos.', '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(30, 4, 20, NULL, 'Numquam et delectus nisi excepturi aliquam consequatur commodi.', '2025-04-18 04:27:44', '2025-04-18 04:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(2, 10, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(3, 4, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(4, 1, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(5, 5, 1, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(6, 7, 2, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(7, 1, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(8, 3, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(9, 8, 3, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(10, 8, 4, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(11, 1, 5, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(12, 10, 5, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(13, 10, 6, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(14, 7, 6, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(15, 9, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(16, 8, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(17, 4, 7, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(18, 1, 8, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(19, 9, 9, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(20, 6, 9, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(21, 1, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(22, 5, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(23, 4, 10, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(24, 10, 11, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(25, 7, 11, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(26, 4, 12, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(27, 7, 12, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(28, 6, 13, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(29, 10, 14, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(30, 3, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(31, 10, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(32, 7, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(33, 4, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(34, 1, 15, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(35, 5, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(36, 6, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(37, 2, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(38, 7, 16, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(39, 1, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(40, 6, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(41, 8, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(42, 10, 17, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(43, 10, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(44, 9, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(45, 6, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(46, 7, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(47, 1, 18, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(48, 2, 19, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(49, 1, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(50, 5, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(51, 7, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(52, 10, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44'),
(53, 6, 20, '2025-04-18 04:27:44', '2025-04-18 04:27:44');

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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '2025_04_16_154756_create_users_table', 1),
(3, '2025_04_16_154826_create_posts_table', 1),
(4, '2025_04_16_154838_create_tags_table', 1),
(5, '2025_04_16_154847_create_post_tag_table', 1),
(6, '2025_04_16_154858_create_comments_table', 1),
(7, '2025_04_16_154909_create_likes_table', 1),
(8, '2025_04_16_154920_create_bookmarks_table', 1),
(9, '2025_04_16_154929_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('like','comment','reply') NOT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `image`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 7, 'Numquam quas suscipit velit rerum dolor.', 'Nisi dolore in reprehenderit deleniti distinctio in quia doloremque. Rerum aliquam quae quae tempora quibusdam aut eaque. Doloremque deleniti unde aliquid vel rerum ea ut.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(2, 9, 'Tempora aut voluptate velit laborum eius eos quam.', 'Natus voluptatem qui voluptatem nam. Nihil animi dignissimos commodi cumque. Aperiam officia soluta velit repellendus velit ad dolor quam. Atque nobis aut omnis molestiae. Et atque iure itaque sequi. Facere et voluptas maiores quis iusto laboriosam.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(3, 5, 'Est quas esse eligendi.', 'Doloribus quo numquam debitis ea. Repellendus ut ab perspiciatis iste. Dolores odit non odio. Maiores doloribus et et quidem sed. Non dolores repudiandae velit. Fugit quis quo asperiores illo et.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(4, 6, 'Et nostrum deleniti quisquam incidunt.', 'Veritatis quis eos laboriosam et eligendi et repellendus. Fugiat qui est laboriosam adipisci totam voluptatem. Exercitationem consequatur distinctio et odio qui sunt consequatur. Id eligendi inventore suscipit eos quis. Et pariatur qui sequi est possimus mollitia.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(5, 8, 'Officia placeat laudantium quasi iste.', 'Et quo nihil est exercitationem. Natus adipisci quisquam porro eaque ducimus sed. Unde et harum occaecati magni esse. Illum et reprehenderit et. Voluptas nobis id enim atque distinctio ducimus rerum corrupti.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(6, 10, 'Aut et voluptates odio et qui excepturi consequuntur.', 'Error ut quis perspiciatis asperiores dolores deserunt nobis. Eius id odit rerum velit provident. Ut aspernatur sint accusantium vitae ab animi quis. Qui nisi ut accusamus repellat et neque.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(7, 8, 'In vero vel porro facilis.', 'Qui cupiditate est pariatur esse pariatur dicta. Qui fugit deserunt et rerum voluptas alias et. Nihil sed quidem libero in perspiciatis. Sunt soluta provident alias quisquam occaecati at.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(8, 2, 'In vel quia nam reprehenderit fugit ut molestiae.', 'Autem molestiae ducimus deserunt enim. Delectus labore reprehenderit et deleniti. Id unde et asperiores asperiores porro. Aut et quos magnam voluptas aut nihil cumque. Omnis voluptatem nam vel.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(9, 6, 'A in reprehenderit voluptatibus qui id aut quis.', 'Aut et voluptas quas saepe. Nam et rerum ullam sed ea debitis. Qui sed nostrum soluta. Voluptatem iusto ut ea corporis ipsam cumque sed. Et minima dolores aperiam.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(10, 4, 'Aut provident consequatur doloremque non.', 'Recusandae perspiciatis praesentium voluptas mollitia et reiciendis. Sunt quae fugiat quasi laborum. Fugiat repellendus et deleniti est laudantium doloribus. Minus impedit tempore blanditiis voluptatem corrupti.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(11, 5, 'Nihil odit ipsam consequatur reiciendis consequuntur laboriosam.', 'Odio vel velit laudantium nostrum qui qui labore. Corrupti delectus occaecati quis sint vitae illo. Iusto dolorem non molestiae debitis. Nisi ut non asperiores repellat modi minus. Nemo et doloremque dolorem est autem cum temporibus. Aut est eligendi suscipit praesentium animi facilis aut.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(12, 5, 'Id quae neque dolorum a.', 'Fugit sint aut doloremque et est occaecati. Sint consequatur voluptas voluptas distinctio quibusdam id. Autem distinctio exercitationem non perferendis natus molestias impedit. Quo voluptate molestias harum in aut accusamus laudantium. Delectus aperiam eligendi repellat et aliquid. Impedit animi velit quia porro esse.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(13, 4, 'Corrupti distinctio corrupti nobis fugiat autem cum dignissimos.', 'Debitis porro commodi non quod vitae. Doloremque sit porro dolorum dolores saepe. Ex ipsam omnis ullam ab nihil. Voluptatem magnam excepturi praesentium quam autem non.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(14, 9, 'Ipsam recusandae dolorum accusamus rerum ea repudiandae ut.', 'Reiciendis iste et consequatur voluptatem. Soluta optio quia amet qui necessitatibus dolores est. Occaecati asperiores et blanditiis saepe. Maiores consectetur iste animi aut aut aut. Ea non similique est ut harum et.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(15, 10, 'Eum quia eaque voluptatem laboriosam.', 'Amet vero minima est saepe. Molestias quos aspernatur consectetur corporis corporis fugit modi. Maxime doloribus quam placeat esse asperiores facilis incidunt. Magnam aut aliquam quae quis dignissimos.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(16, 9, 'Quia omnis dignissimos autem ad quod excepturi.', 'Possimus adipisci blanditiis cumque repudiandae voluptatibus. Quae ut est ea dolorum consequuntur natus. Exercitationem similique voluptatum unde voluptatibus doloribus.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(17, 5, 'Accusamus modi hic magnam ut officiis libero quo.', 'Laudantium assumenda est et dolorem repudiandae. Tenetur rem numquam non delectus. Laborum eaque iure culpa explicabo dignissimos quas et. Debitis totam totam quia et mollitia sed fugit. Eveniet dolorum repellendus est nobis.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(18, 4, 'Et modi quod voluptatum aliquam.', 'Blanditiis saepe asperiores corrupti eveniet nobis repudiandae omnis. Officia et ipsam consectetur quia. Maxime nulla labore molestias iure dolores harum corporis. Hic et vel et modi qui ut dolor. Animi magni provident pariatur quis velit. Delectus eum quia ut quia eligendi qui.', NULL, 'private', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(19, 1, 'Qui maxime vel sunt ut aspernatur.', 'Impedit quis aut vel quisquam velit unde velit. Labore debitis similique suscipit quas ea est voluptas. Natus officia consequatur eos eaque autem labore nulla. Occaecati voluptatum odio voluptatibus nemo eveniet labore.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(20, 6, 'Enim sunt magni autem neque quo placeat maiores.', 'Beatae neque eum et. Quia qui quis suscipit velit occaecati quod esse. Est ut exercitationem tempore fugiat voluptas voluptatem. Exercitationem perspiciatis provident nihil quo veritatis ut deleniti consequatur. Adipisci repudiandae minima ea ratione dolore laudantium facilis.', NULL, 'public', '2025-04-18 04:27:43', '2025-04-18 04:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 4, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 3, 2, NULL, NULL),
(6, 3, 4, NULL, NULL),
(7, 3, 5, NULL, NULL),
(8, 4, 1, NULL, NULL),
(9, 4, 5, NULL, NULL),
(10, 5, 1, NULL, NULL),
(11, 5, 3, NULL, NULL),
(12, 6, 1, NULL, NULL),
(13, 7, 1, NULL, NULL),
(14, 7, 5, NULL, NULL),
(15, 8, 1, NULL, NULL),
(16, 8, 5, NULL, NULL),
(17, 9, 3, NULL, NULL),
(18, 10, 1, NULL, NULL),
(19, 11, 1, NULL, NULL),
(20, 11, 3, NULL, NULL),
(21, 11, 4, NULL, NULL),
(22, 12, 3, NULL, NULL),
(23, 13, 1, NULL, NULL),
(24, 13, 2, NULL, NULL),
(25, 13, 4, NULL, NULL),
(26, 14, 2, NULL, NULL),
(27, 15, 1, NULL, NULL),
(28, 15, 5, NULL, NULL),
(29, 16, 1, NULL, NULL),
(30, 16, 2, NULL, NULL),
(31, 16, 5, NULL, NULL),
(32, 17, 2, NULL, NULL),
(33, 18, 1, NULL, NULL),
(34, 19, 2, NULL, NULL),
(35, 20, 1, NULL, NULL),
(36, 20, 3, NULL, NULL),
(37, 20, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'vitae', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(2, 'quas', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(3, 'eum', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(4, 'dolore', '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(5, 'quo', '2025-04-18 04:27:43', '2025-04-18 04:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 'dickens.connie', 'ned.robel@example.com', '$2y$12$cuFoB01riGoffJEOlMpBfeZUCKJ1Rgx1C7SQWP6ROkJn4iIRaMVxW', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(2, 'luz70', 'elbert.rowe@example.net', '$2y$12$d1Jox3LofyNFob9U2SQhO.fRDZ1VpJC1BE3iF2INn5elh.E586Yvu', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(3, 'matt.nolan', 'cedrick.maggio@example.net', '$2y$12$bYfXUfHH.2X1F.mzJ/cZv.GIhymCMV7GLDvN18F4dK8CzD57qCCyu', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(4, 'emayer', 'omoore@example.com', '$2y$12$NFdjw9h8BgyVGmLSDyeH0.FHziDvL61N8j9rk7U/u6umIdHdHbs6G', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(5, 'eusebio.shields', 'kschaden@example.org', '$2y$12$3JN.A7RZNUA.CpwkbO0z9ONxGTi6q1YGgQ7gHhYKIYT1rqPFYduNe', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(6, 'bmarquardt', 'larkin.boris@example.org', '$2y$12$74bFR0fUMU7URkToipElHuvTbbtZjRsY32KxKebXoF5QGTzDmNZuu', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(7, 'qbechtelar', 'upton.stanley@example.com', '$2y$12$E2k9W4bS0YQj.NEgpdS7vuFe2h7zbwUVCEPJmh0Sg68a.hEMzdMBO', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(8, 'robel.alfreda', 'lemke.brandt@example.com', '$2y$12$pwnyLqL0Qto.q72/4kzvbOFzoj/MXt4HA80ZeyBmbfE87GElBhvYi', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(9, 'murazik.carolina', 'luz57@example.net', '$2y$12$eJX7766eKbYhlBQw4xKjge2u65dR8Qip6xG0h9Rx0WfADEMb07wvW', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43'),
(10, 'saju', 'saju@gmail.com', '$2y$12$4x.TqwvgycoKavWe.U7Ea.mBQdHYlnsp32FuSpbuljUsj3WonDtDa', NULL, '2025-04-18 04:27:43', '2025-04-18 04:27:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_post_id_foreign` (`post_id`);

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
