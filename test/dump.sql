-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2017 às 05:42
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codeline_laravel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` mediumint(8) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `commentary` text NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `comments`
--

INSERT INTO `comments` (`id`, `film_id`, `user_id`, `commentary`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'ziro commentary', '2017-11-22 05:34:57', '2017-11-22 05:34:57'),
(2, 6, 1, 'first commentary', '2017-11-22 07:34:26', '2017-11-22 07:34:26'),
(3, 6, 1, 'first commentary', '2017-11-22 07:41:37', '2017-11-22 07:41:37'),
(4, 6, 1, 'second commentary', '2017-11-22 07:44:36', '2017-11-22 07:44:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Brazil', '2017-11-22 05:13:57', '2017-11-22 05:13:57'),
(3, 'USA', '2017-11-22 05:14:54', '2017-11-22 05:14:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `films`
--

CREATE TABLE IF NOT EXISTS `films` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `slug` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `release_date` date NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL,
  `country_id` smallint(5) unsigned NOT NULL,
  `photo` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Extraindo dados da tabela `films`
--

INSERT INTO `films` (`id`, `name`, `slug`, `description`, `release_date`, `rating`, `ticket_price`, `country_id`, `photo`, `created_at`, `updated_at`) VALUES
(6, 'Teste Film 6', '', 'asdas', '2017-11-21', '4', '0.00', 1, 'Desert.jpg', '2017-11-21 04:44:08', '2017-11-22 04:03:49'),
(7, 'Teste Film7 ', '', 'description film 7', '2017-11-23', '3', '3.50', 1, 'Desert.jpg', '2017-11-21 23:13:48', '2017-11-21 23:13:48'),
(8, 'Test Film 8', '', 'Teste Film 8', '2017-11-22', '2', '4.80', 1, 'Desert.jpg', '2017-11-21 23:19:54', '2017-11-21 23:19:54'),
(9, 'Test Film 9', '', 'dsadas', '2017-11-21', '2', '4.50', 1, 'Desert.jpg', '2017-11-21 23:20:25', '2017-11-21 23:20:25'),
(18, 'Film LrxkT3h', '', 'TaSFXPfJwHKbfUqqDW6DqSp6QQJy5ASrTwOnm5gZ', '2017-09-17', '1', '0.87', 1, 'Chrysanthemum.jpg', '2017-11-21 23:58:59', '2017-11-21 23:58:59'),
(19, 'Film npyLTsv', '', 'CqFXNnwicpvKXWo4EvMcyLMp75QmnkTWqy7MFgU9', '2017-10-16', '1', '0.95', 1, '', '2017-11-22 01:17:40', '2017-11-22 01:17:40'),
(20, 'Film ynuUpTv', '', '8CnDWQ0D7wUkRbZdoardBza2EUoQOCd3NnVTrvwo', '2017-08-29', '1', '0.52', 1, '', '2017-11-22 01:19:30', '2017-11-22 01:19:30'),
(21, 'Film SFto5NF', '', 'kdx809TvCuSAntI00D5BQ58i5QAFpKzI5KVdirfZ', '2017-09-12', '1', '0.96', 1, '', '2017-11-22 01:20:31', '2017-11-22 01:20:31'),
(22, 'Film ytB6Rv3', '', 'TzkrvsUalyvyKOeCFGpxvKayc5zBLgX6vxmxzdfd', '2017-08-16', '1', '2.00', 1, 'C:\\wamp\\tmp\\php2031.tmp', '2017-11-22 01:41:29', '2017-11-22 01:41:29'),
(23, 'Film 0WuiBa1', '', '0ti8GPxCdiQNCmBS9bE18nh9d4soifmM6nrrq8wl', '2017-08-18', '1', '1.00', 1, 'C:\\wamp\\tmp\\phpFC7F.tmp', '2017-11-22 01:47:53', '2017-11-22 01:47:53'),
(24, 'Film Hxp9d6U', '', 'l0w9KxoqTTXAVAa7Wnq2R2kGvAG0RT89UqdsAzzb', '2017-09-15', '1', '4.00', 1, 'C:\\wamp\\tmp\\php2D02.tmp', '2017-11-22 01:50:17', '2017-11-22 01:50:17'),
(25, 'Film LzC2gZq', '', 'mcvRCrwnHPx0cUPzX2IrZ2ewGfH4ofxST4Sd8QnN', '2017-11-08', '1', '0.48', 1, 'C:\\wamp\\tmp\\php67D2.tmp', '2017-11-22 01:52:43', '2017-11-22 01:52:43'),
(26, 'Film LpXghDn', '', 'OyqRZrCH7Mh2dADdiGJ7iMAAiu1P3exup4upwA6w', '2017-11-19', '1', '0.90', 1, 'C:\\wamp\\tmp\\php1071.tmp', '2017-11-22 01:54:31', '2017-11-22 01:54:31'),
(27, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\php7BE1.tmp', '2017-11-22 01:54:59', '2017-11-22 01:54:59'),
(28, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\php59E1.tmp', '2017-11-22 01:55:56', '2017-11-22 01:55:56'),
(29, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\phpDA4B.tmp', '2017-11-22 01:59:45', '2017-11-22 01:59:45'),
(30, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\php4F9A.tmp', '2017-11-22 02:02:26', '2017-11-22 02:02:26'),
(31, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\phpB291.tmp', '2017-11-22 02:10:30', '2017-11-22 02:10:30'),
(32, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'C:\\wamp\\tmp\\php686A.tmp', '2017-11-22 02:15:39', '2017-11-22 02:15:39'),
(33, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, 'test', '2017-11-22 02:16:06', '2017-11-22 02:16:06'),
(34, 'Film WVJMgEl', '', 'sAn7Cnow06ziv3pXgQukTE1NNPWsdOIq2zpBroun', '2017-10-20', '1', '0.91', 1, '1511317024.jpg', '2017-11-22 02:17:04', '2017-11-22 02:17:04'),
(35, 'Film Z5laCNt', '', 'eIhcFT3J7ZhRvVNnTQcmziRa2WM606soriBA3RIG', '2017-10-31', '1', '0.77', 1, '1511323452.jpg', '2017-11-22 04:04:12', '2017-11-22 04:04:12'),
(36, 'Film Z6FPJWv', '', 'CCIZHnMcAWbDezxp9kOQyJE4N1kKG4LehwFW8pNx', '2017-11-03', '1', '0.14', 1, '1511323500.jpg', '2017-11-22 04:05:00', '2017-11-22 04:05:00'),
(37, 'Film ZTpDLBh', '', 'kICFXTLF2M5QDK6DDZRmldmb1RWcu9WioZial0rM', '2017-08-29', '1', '0.95', 1, '1511323514.jpg', '2017-11-22 04:05:14', '2017-11-22 04:05:14'),
(38, 'Film V22czoM', 'testeslug', 'hP8vktExzKQrdtzRmauVa9d2zxDiXUkL98h1echH', '2017-10-24', '', '0.56', 1, '1511335942.jpg', '2017-11-22 07:32:22', '2017-11-22 07:32:22'),
(39, 'Film Jof3noP', 'testslug2', 'idx6vhfm1cbm44Spr31XZGZz4J9gzH5CBTmvBbip', '2017-09-24', '3', '0.80', 1, '1511336034.jpg', '2017-11-22 07:33:54', '2017-11-22 07:33:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `films_genres`
--

CREATE TABLE IF NOT EXISTS `films_genres` (
  `film_id` mediumint(8) unsigned NOT NULL,
  `genre_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`film_id`,`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `films_genres`
--

INSERT INTO `films_genres` (`film_id`, `genre_id`) VALUES
(6, 1),
(6, 2),
(38, 1),
(38, 2),
(39, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Comedy', '2017-11-22 06:31:20', '2017-11-22 06:32:24'),
(2, 'Adventure', '2017-11-22 06:31:36', '2017-11-22 06:31:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_11_20_220158_help', 1),
('2016_08_07_145904_add_table_cms_apicustom', 2),
('2016_08_07_150332_add_table_cms_companies', 2),
('2016_08_07_150834_add_table_cms_dashboard', 2),
('2016_08_07_151210_add_table_cms_logs', 2),
('2016_08_07_151329_add_table_cms_menus', 2),
('2016_08_07_151445_add_table_cms_menus_groups', 2),
('2016_08_07_151533_add_table_cms_pages', 2),
('2016_08_07_151709_add_table_cms_posts', 2),
('2016_08_07_151829_add_table_cms_posts_categories', 2),
('2016_08_07_152014_add_table_cms_privileges', 2),
('2016_08_07_152214_add_table_cms_privileges_roles', 2),
('2016_08_07_152320_add_table_cms_settings', 2),
('2016_08_07_152421_add_table_cms_users', 2),
('2016_08_07_154624_add_table_cms_moduls', 2),
('2016_08_07_154802_add_table_cms_moduls_group', 2),
('2016_08_17_173115_add_is_register_to_privileges', 2),
('2016_08_17_225409_add_status_cms_users', 2),
('2016_08_17_230703_add_hash_confirmation_cms_users', 2),
('2016_08_20_125418_add_table_cms_notifications', 2),
('2016_09_04_033706_add_table_cms_email_queues', 2),
('2016_09_16_035347_add_group_setting', 2),
('2016_09_16_045425_add_label_setting', 2),
('2016_09_17_104728_create_nullable_cms_apicustom', 2),
('2016_10_01_141740_add_method_type_apicustom', 2),
('2016_10_01_141846_add_parameters_apicustom', 2),
('2016_10_01_141934_add_responses_apicustom', 2),
('2016_10_01_144826_add_table_apikey', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Rafael Keller', 'faelkeller@gmail.com', '$2y$10$7ULd5XXFaJtNcTsJkaSd.OiIEq6CHlcw7T.yKaviDrWIIwBv3SUIq', 'Cu5jZYfLYfMDgoYfhwIDaxAzIrUExDusqzmFS6KcwsFFO4xm9CPkpUYUQo8R', 1, '2017-11-21 00:04:00', '2017-11-22 00:30:57'),
(2, 'Rafael Keller 2', 'faelkeller@ig.com.br', '$2y$10$h7p0zmJhVMaPNdxtrUsTruCvD82yFWOSwrJjLT4TdZu5RoGZMBGYS', 'oKy5tpYWHCd4dTGfEIKM6d57dGnfj0zWmaMlRCoQWX9en1SCWxlVgNd5X35B', 0, '2017-11-21 16:36:36', '2017-11-22 00:13:22');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
