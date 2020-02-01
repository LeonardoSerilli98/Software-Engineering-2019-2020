-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2020 at 12:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softengproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `utente` bigint(20) UNSIGNED NOT NULL,
  `data_fine_ban` date NOT NULL,
  `moderatore` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `boughts`
--

CREATE TABLE `boughts` (
  `utente` bigint(20) UNSIGNED NOT NULL,
  `appunto` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoria`) VALUES
(1, 'appunto'),
(3, 'esame'),
(4, 'esercizi'),
(2, 'saggio');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pagina` bigint(20) UNSIGNED NOT NULL,
  `caricato_da` bigint(20) UNSIGNED NOT NULL,
  `num_segnalazioni` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `num_upvote` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `corso_laurea` bigint(20) UNSIGNED NOT NULL,
  `lingua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` bigint(20) UNSIGNED NOT NULL,
  `tipo_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `argomento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_contenuto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_contenuto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `corso_laurea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `universita` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `corso_laurea`, `universita`) VALUES
(3, 'informatica', 2),
(4, 'matematica', 2),
(5, 'medicina', 2),
(6, 'economia', 4),
(7, 'biologia', 3);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `moderators`
--

CREATE TABLE `moderators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creato_da` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('177ede73dfde0ca3df2ee3ca501e7fddb2ce100064ff4b5282d262472280607911c4918020b31657', 5, 1, 'authToken', '[]', 0, '2020-01-28 15:00:26', '2020-01-28 15:00:26', '2021-01-28 16:00:26'),
('20fa507760861290edd04413690962b503d1ece875f5e741c14075aa4aed36b677330163cffad36b', 6, 1, 'authToken', '[]', 1, '2020-01-28 16:16:43', '2020-01-28 16:16:43', '2021-01-28 17:16:43'),
('242288dbe9adab4ce22b8d2215b58aba8a9ef5a86bbbc5d1d4b6774d82a93d69359612c572b7f816', 6, 4, 'authToken', '[]', 0, '2020-01-29 21:33:50', '2020-01-29 21:33:50', '2021-01-29 22:33:50'),
('3baf2fcf308b8dd7dc562310d8c0f1a467e1996cad0167a18727d379d44d24e5011296a4c3827336', 6, 1, 'authToken', '[]', 1, '2020-01-28 16:49:09', '2020-01-28 16:49:09', '2021-01-28 17:49:09'),
('4178d7d59e49dc42dfe752229695774a50cd72f20992622e8aef2d106e366014a64a048c66e4db7e', 10, 12, 'authToken', '[]', 0, '2020-01-31 21:38:38', '2020-01-31 21:38:38', '2021-01-31 22:38:38'),
('6d47173ba21c3b0df4ea8c82ba44df76141dd58a232d8b54a04faff08967b4070096612aace47fc7', 10, 12, 'authToken', '[]', 0, '2020-01-31 21:40:14', '2020-01-31 21:40:14', '2021-01-31 22:40:14'),
('8f6a755b3fbc06327c3c79449d9d57764f9b4dc28f236c6153b5a570a1a197a66b56792d39ca4d7b', 6, 10, 'authToken', '[]', 0, '2020-01-31 17:20:36', '2020-01-31 17:20:36', '2021-01-31 18:20:36'),
('b24d1b241d7f85421d85c171b0f6558ce5063207488ecf85550f6db88545f2cb462227b442922a69', 6, 6, 'authToken', '[]', 0, '2020-01-30 12:00:45', '2020-01-30 12:00:45', '2021-01-30 13:00:45'),
('cc2d7ab8584eb063462f9c0cf0250029b10abefc4875bebedffe4c31265989efbf3d3fbfe1e41fbb', 6, 6, 'authToken', '[]', 0, '2020-01-30 08:58:09', '2020-01-30 08:58:09', '2021-01-30 09:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eYzLu9mpSsCw9Okh3kwqdj28dvnIso8kBkiNu26e', 'http://localhost', 1, 0, 0, '2020-01-27 17:40:21', '2020-01-27 17:40:21'),
(2, NULL, 'Laravel Password Grant Client', 't9mAsdAMWoxLzmycFsK3PrSFyRSBn27WklD0iXLo', 'http://localhost', 0, 1, 0, '2020-01-27 17:40:21', '2020-01-27 17:40:21'),
(3, 2, 'test', 'EBHYwqJGYYqIcCPZi9ynnQnBHeF25zDKe6n8RrRX', '27.0.0.1:8000/', 0, 0, 0, '2020-01-28 12:38:46', '2020-01-28 12:38:46'),
(4, NULL, 'Laravel Personal Access Client', 'UMfME5LBEi5DDWHz59AtTHdDzJysEl8GojLTFkkE', 'http://localhost', 1, 0, 0, '2020-01-29 21:33:07', '2020-01-29 21:33:07'),
(5, NULL, 'Laravel Password Grant Client', 'QQZEA5BYLToKClm4WxsxyfaRBkfR3atukewdNYBv', 'http://localhost', 0, 1, 0, '2020-01-29 21:33:08', '2020-01-29 21:33:08'),
(6, NULL, 'Laravel Personal Access Client', 'hMPnZ0NIsAVvD4ES9VrEfGMx9JIURIv34nngC4gs', 'http://localhost', 1, 0, 0, '2020-01-29 22:23:04', '2020-01-29 22:23:04'),
(7, NULL, 'Laravel Password Grant Client', 'FigmSBrhZrneEpIHaLmaemIRCrmuJuvm3PS3Ic3F', 'http://localhost', 0, 1, 0, '2020-01-29 22:23:05', '2020-01-29 22:23:05'),
(8, NULL, 'Laravel Personal Access Client', '7Kp4XJOthrYaRUx6Cwlc39R7ecHOZJrtLZ3Dnz74', 'http://localhost', 1, 0, 0, '2020-01-30 13:09:35', '2020-01-30 13:09:35'),
(9, NULL, 'Laravel Password Grant Client', 'KaG1HFJmpwk9uq7EsEumJe6t1idv7cV0ysB4GBtf', 'http://localhost', 0, 1, 0, '2020-01-30 13:09:35', '2020-01-30 13:09:35'),
(10, NULL, 'Laravel Personal Access Client', '192ZTX3otquqXeozdjxoB9bhMLkrvOr7XdMiv8K4', 'http://localhost', 1, 0, 0, '2020-01-31 17:20:04', '2020-01-31 17:20:04'),
(11, NULL, 'Laravel Password Grant Client', '2H8l4mvr3Nj2u1o7CTCkzLM0QOY7aR1eX5Tdw3nA', 'http://localhost', 0, 1, 0, '2020-01-31 17:20:04', '2020-01-31 17:20:04'),
(12, NULL, 'Laravel Personal Access Client', 'faSEAUnzZpccSPqMjAOrHat2WOfJ7ZzqdPyC7629', 'http://localhost', 1, 0, 0, '2020-01-31 20:31:05', '2020-01-31 20:31:05'),
(13, NULL, 'Laravel Password Grant Client', 'V5FbSl07mvIOMSsD7neCdxSLX8PMQtVtOlR1yvP7', 'http://localhost', 0, 1, 0, '2020-01-31 20:31:06', '2020-01-31 20:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-27 17:40:21', '2020-01-27 17:40:21'),
(2, 4, '2020-01-29 21:33:08', '2020-01-29 21:33:08'),
(3, 6, '2020-01-29 22:23:05', '2020-01-29 22:23:05'),
(4, 8, '2020-01-30 13:09:35', '2020-01-30 13:09:35'),
(5, 10, '2020-01-31 17:20:04', '2020-01-31 17:20:04'),
(6, 12, '2020-01-31 20:31:06', '2020-01-31 20:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creata_da` bigint(20) UNSIGNED NOT NULL,
  `materia` bigint(20) UNSIGNED NOT NULL,
  `nome_pagina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `creata_da`, `materia`, `nome_pagina`) VALUES
(16, 9, 6, 'Deliverable finale'),
(26, 12, 5, 'SE'),
(27, 13, 5, 'test'),
(28, 14, 6, 'test');

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
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `utente` bigint(20) UNSIGNED NOT NULL,
  `appunto` bigint(20) UNSIGNED NOT NULL,
  `motivazione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `corso_laurea` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `materia`, `corso_laurea`) VALUES
(5, 'elaborazione delle immagini', 3),
(6, 'Software Engineering', 3),
(7, 'microeconomia', 6),
(8, 'anatomia', 5),
(9, 'chimica organica', 7),
(10, 'Analisi matematica', 4);

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `universita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dominio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `universita`, `dominio`) VALUES
(4, 'unipe', 'unipe.it'),
(3, 'Unite', 'unite.it'),
(2, 'Univaq', 'student.univaq.it');

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE `upvotes` (
  `utente` bigint(20) UNSIGNED NOT NULL,
  `appunto` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_caricamenti` bigint(20) UNSIGNED DEFAULT 0,
  `num_token` bigint(20) UNSIGNED DEFAULT 5,
  `corso_laurea` bigint(20) UNSIGNED DEFAULT NULL,
  `per_token` bigint(20) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `num_caricamenti`, `num_token`, `corso_laurea`, `per_token`) VALUES
(9, 'andrea', 'andrea@student.univaq.it', NULL, '$2y$10$49kzCkrQx09gdC6RTmt6/u.dxViUgVMRmz2yhn5tMqomsg9.XUiPe', NULL, '2020-01-31 21:26:40', '2020-01-31 22:03:50', 5, 3, 3, 5),
(10, 'Utente1', 'Utente1@unite.it', NULL, '$2y$10$dvwkW0xsJNQSLVMxvn5SkOidTdiFQS3hXQsPkVk/pm0HyCve7tuJa', NULL, '2020-01-31 21:38:37', '2020-01-31 21:38:37', 0, 0, 7, 5),
(12, 'leo', 'leo@student.univaq.it', NULL, '$2y$10$UQnSUfd78VU76PMmol1WCemttSFitmVrdWT27ZqAgHvQOnyjJIYyG', NULL, '2020-01-31 22:01:59', '2020-01-31 22:03:00', 1, 5, 3, 4),
(13, 'leonardo', 'leonardo@student.univaq.it', NULL, '$2y$10$hDwsdPQsYQInyLnEUPiKpelu8v9DAwdvqHdYdqEbEkFId/OJXFJCO', NULL, '2020-01-31 22:07:22', '2020-01-31 22:09:10', 1, 2, 3, 4),
(14, 'leonardo1', 'leonardo1@student.univaq.it', NULL, '$2y$10$sxh8wUhMSaCdZJKK.1I/uOtgRLWKHtqX35xh/fp04.7b7vAWv9P4S', NULL, '2020-01-31 22:18:18', '2020-01-31 22:22:35', 2, 2, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`utente`),
  ADD KEY `moderatore` (`moderatore`);

--
-- Indexes for table `boughts`
--
ALTER TABLE `boughts`
  ADD PRIMARY KEY (`utente`,`appunto`),
  ADD KEY `appunto` (`appunto`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoria` (`categoria`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `corso_laurea` (`corso_laurea`),
  ADD KEY `caricato_da` (`caricato_da`),
  ADD KEY `pagina` (`pagina`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `corso_laurea` (`corso_laurea`),
  ADD KEY `universita` (`universita`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderators`
--
ALTER TABLE `moderators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `moderators_ibfk_1` (`creato_da`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia` (`materia`),
  ADD KEY `pages_ibfk_1` (`creata_da`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`utente`,`appunto`),
  ADD KEY `reports_ibfk_1` (`appunto`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materia` (`materia`),
  ADD KEY `corso_laurea` (`corso_laurea`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `universita` (`universita`,`dominio`);

--
-- Indexes for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`utente`,`appunto`),
  ADD KEY `upvotes_ibfk_1` (`appunto`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `corso_laurea` (`corso_laurea`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bans`
--
ALTER TABLE `bans`
  ADD CONSTRAINT `bans_ibfk_1` FOREIGN KEY (`moderatore`) REFERENCES `moderators` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bans_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `boughts`
--
ALTER TABLE `boughts`
  ADD CONSTRAINT `boughts_ibfk_1` FOREIGN KEY (`appunto`) REFERENCES `contents` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `boughts_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `contents_ibfk_3` FOREIGN KEY (`corso_laurea`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `contents_ibfk_6` FOREIGN KEY (`caricato_da`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contents_ibfk_7` FOREIGN KEY (`pagina`) REFERENCES `pages` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`universita`) REFERENCES `universities` (`id`);

--
-- Constraints for table `moderators`
--
ALTER TABLE `moderators`
  ADD CONSTRAINT `moderators_ibfk_1` FOREIGN KEY (`creato_da`) REFERENCES `moderators` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`creata_da`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_ibfk_2` FOREIGN KEY (`materia`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`appunto`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`corso_laurea`) REFERENCES `courses` (`id`);

--
-- Constraints for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD CONSTRAINT `upvotes_ibfk_1` FOREIGN KEY (`appunto`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upvotes_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`corso_laurea`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
