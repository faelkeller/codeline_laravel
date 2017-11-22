-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2017 às 08:22
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
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `comments`
--

INSERT INTO `comments` (`id`, `film_id`, `user_id`, `commentary`, `created_at`, `updated_at`) VALUES
(8, 41, 1, 'I liked a lot these film ', '2017-11-22 12:18:14', '2017-11-22 12:18:14'),
(9, 41, 2, 'me too =)', '2017-11-22 12:19:13', '2017-11-22 12:19:13'),
(10, 42, 2, 'I''m in first page *.*', '2017-11-22 12:20:45', '2017-11-22 12:20:45'),
(11, 43, 2, 'dont''be afraid. I suggest you watch this film', '2017-11-22 12:21:54', '2017-11-22 12:21:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Brazil', '2017-11-22 05:13:57', '2017-11-22 05:13:57'),
(3, 'USA ', '2017-11-22 05:14:54', '2017-11-22 10:12:13'),
(5, 'Spain', '2017-11-22 10:20:53', '2017-11-22 10:20:53');

-- --------------------------------------------------------

--
-- Estrutura da tabela `films`
--

CREATE TABLE IF NOT EXISTS `films` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `release_date` date NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL,
  `country_id` smallint(5) unsigned NOT NULL,
  `photo` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Extraindo dados da tabela `films`
--

INSERT INTO `films` (`id`, `name`, `slug`, `description`, `release_date`, `rating`, `ticket_price`, `country_id`, `photo`, `created_at`, `updated_at`) VALUES
(41, 'Epic', 'epic', 'Parents need to know that Epic is an animated adventure from the same studio behind the Ice Age franchise and Rio. Part eco-friendly tale and part tiny-creatures story, Epic (which was inspired by the characters in William Joyce''s children''s book The Leaf Men and the Brave Good Bugs) centers on a teen girl who''s magically shrunk into the world of miniscule armed archers called Leafmen who protect the forest from evil. There''s a central good vs. evil theme, as well as a parent vs. adolescent storyline that should appeal to kids, but know that there are definitely battles and even a small body count (mostly due to arrows). The main villain is merciless and believes that it''s his mission to destroy the forest and rule over a rotting wasteland. In addition to the violence, there''s a romantic nature to two relationships in the movie, as well as several flirty (and snotty) jokes courtesy of a slug voiced by Aziz Ansari. Expect some insult language ("stupid," "idiot," etc.).', '2013-05-17', '2', '22.00', 3, '1511344858.jpg', '2017-11-22 10:00:58', '2017-11-22 10:00:58'),
(42, 'Pirates Of The Caribbean: Dead Men Tell No Tales', 'pirates-of-the-caribbean-dead-men-tell-no-tales', 'Parents need to know that Pirates of Caribbean: Dead Men Tell No Tales is the fifth Pirates film starring Johnny Depp as Captain Jack Sparrow. It focuses on a mission Sparrow shares with Henry Turner (Brenton Thwaites) -- the only son of earlier franchise stars William Turner (Orlando Bloom) and Elizabeth Swann (Keira Knightley), neither of whom appears much in the film. This time around, an older, drunker (he downs a lot of rum) Sparrow faces yet another great enemy: the ghost of a pirate-killing Spanish captain, Salazar (Javier Bardem). As usual for this series, expect lots of action violence and a high body count, with lots of close-range sword-fighting and killings (Salazar only ever leaves one man alive aboard a ship). People die in gun battles, from drowning, via burning, and from having their throats slit. The romance is light and limited to Sparrow''s innuendos, some double-meaning jokes, and a couple of kisses. Language is mild, mostly limited to "damn" and "hell." Despite the popularity of this franchise -- and the fact that it offers messages about unconditional family love, women''s intelligence/worth, and teamwork -- it''s still too scary for young kids.', '2017-05-25', '5', '30.50', 3, '1511345199.jpg', '2017-11-22 10:06:39', '2017-11-22 10:06:39'),
(43, 'Alien: Covenant ', 'alien-covenant ', 'Parents need to know that Alien: Covenant is the sequel to Prometheus and the sixth overall movie in the Alien series (or eighth. if you count the Alien vs. Predator movies). It''s scary and violent: There''s lots of blood and gore, aliens bursting from body cavities, a beheading, and someone being burned alive (charred remains are shown). Faces are burned with acid, characters vomit and spew blood, and there''s fighting, kicking, and stabbing, as well as shooting and explosions. Language is also fairly strong, with multiple uses of "f--k," plus "s--t," "t-ts," and more. There''s one somewhat-graphic sex scene, with partial female nudity (a breast). Characters drink and smoke briefly. As has often been the case in the Alien series, one of the central characters is a strong, brave woman (here played by Katherine Waterston).', '2017-05-11', '4', '25.00', 1, '1511345511.jpg', '2017-11-22 10:11:51', '2017-11-22 10:11:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `films_genres`
--

CREATE TABLE IF NOT EXISTS `films_genres` (
  `film_id` mediumint(8) unsigned NOT NULL,
  `genre_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`film_id`,`genre_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `films_genres`
--

INSERT INTO `films_genres` (`film_id`, `genre_id`) VALUES
(42, 1),
(42, 2),
(41, 6),
(43, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Comedy', '2017-11-22 06:31:20', '2017-11-22 06:32:24'),
(2, 'Adventure', '2017-11-22 06:31:36', '2017-11-22 06:31:36'),
(6, 'Kids and Family', '2017-11-22 11:56:19', '2017-11-22 11:56:19'),
(7, 'Horror', '2017-11-22 12:12:20', '2017-11-22 12:12:20');

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
(1, 'Rafael Keller', 'faelkeller@gmail.com', '$2y$10$7ULd5XXFaJtNcTsJkaSd.OiIEq6CHlcw7T.yKaviDrWIIwBv3SUIq', 'FM8MZkPYKRStH7K5pD7CaxwOyx7eKqw7GFOz4rrtekjY0i9ZX2UI7An1RmHc', 1, '2017-11-21 00:04:00', '2017-11-22 11:44:28'),
(2, 'Rafael Keller 2', 'faelkeller@ig.com.br', '$2y$10$h7p0zmJhVMaPNdxtrUsTruCvD82yFWOSwrJjLT4TdZu5RoGZMBGYS', '0l3aj2YHN1UFdE0lY5UcTaAfr2n7CAiLNapI35G4jT0hZCgmM2BQN2MEbggy', 0, '2017-11-21 16:36:36', '2017-11-22 11:55:44');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`);

--
-- Limitadores para a tabela `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Limitadores para a tabela `films_genres`
--
ALTER TABLE `films_genres`
  ADD CONSTRAINT `films_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `films_genres_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
