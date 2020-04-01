-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Мар 28 2020 г., 06:44
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2_loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `description`, `keywords`) VALUES
(1, 0, 'Branded Foods', 'Branded Foods description', 'Branded Foods keywords'),
(2, 0, 'Households', 'Households description', 'Households keywords'),
(3, 0, 'Veggies & Fruits', 'Veggies & Fruits description', 'Veggies & Fruits keywords'),
(4, 3, 'Vegetables', 'Vegetables description', 'Vegetables keywords'),
(5, 3, 'Fruits', 'Fruits description', 'Fruits keywords'),
(6, 0, 'Kitchen', NULL, NULL),
(7, 0, 'Short Codes', NULL, NULL),
(8, 0, 'Beverages', NULL, NULL),
(9, 8, 'Soft Drinks', NULL, NULL),
(10, 8, 'Juices', NULL, NULL),
(11, 0, 'Pet Food', NULL, NULL),
(12, 0, 'Frozen Foods', NULL, NULL),
(13, 12, 'Frozen Snacks', NULL, NULL),
(14, 12, 'Frozen Nonveg', NULL, NULL),
(15, 0, 'Bread & Bakery', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` tinyint(3) UNSIGNED NOT NULL,
  `total` decimal(6,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `qty`, `total`, `status`, `name`, `email`, `phone`, `address`, `note`) VALUES
(1, '2020-03-21 20:34:11', '2020-03-21 20:34:11', 2, '10.00', 1, 'Виталий', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', 'Доставка после 18-00'),
(2, '2020-03-21 22:49:21', '2020-03-21 22:49:21', 2, '8.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(3, '2020-03-21 23:02:03', '2020-03-21 23:02:03', 1, '3.00', 0, 'Виталий', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', 'Отправить почтой'),
(4, '2020-03-21 23:10:46', '2020-03-21 23:10:46', 1, '5.00', 1, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', 'Самовывоз'),
(5, '2020-03-21 23:15:44', '2020-03-21 23:15:44', 1, '5.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', '123'),
(6, '2020-03-21 23:21:00', '2020-03-21 23:21:00', 1, '2.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', '456'),
(7, '2020-03-21 23:24:56', '2020-03-21 23:24:56', 1, '5.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Куйбышева 74-8', 'good'),
(8, '2020-03-21 23:26:21', '2020-03-21 23:26:21', 1, '3.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(9, '2020-03-21 23:28:52', '2020-03-21 23:28:52', 1, '4.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(10, '2020-03-21 23:31:34', '2020-03-21 23:31:34', 1, '4.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(11, '2020-03-21 23:32:47', '2020-03-21 23:32:47', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(12, '2020-03-21 23:33:14', '2020-03-21 23:33:14', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(13, '2020-03-21 23:37:52', '2020-03-21 23:37:52', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(14, '2020-03-21 23:39:16', '2020-03-21 23:39:16', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(15, '2020-03-21 23:46:05', '2020-03-21 23:46:05', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(16, '2020-03-21 23:47:05', '2020-03-21 23:47:05', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(17, '2020-03-21 23:48:18', '2020-03-21 23:48:18', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(18, '2020-03-21 23:48:38', '2020-03-21 23:48:38', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(19, '2020-03-21 23:48:57', '2020-03-21 23:48:57', 1, '4.00', 0, 'Виталий2', 'vetalm1982@yandex.ru', '89242629509', 'Советская', ''),
(20, '2020-03-21 23:58:25', '2020-03-21 23:58:25', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(21, '2020-03-22 00:21:58', '2020-03-22 00:21:58', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(22, '2020-03-22 00:22:33', '2020-03-22 00:22:33', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(23, '2020-03-22 00:23:15', '2020-03-22 00:23:15', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(24, '2020-03-22 00:23:48', '2020-03-22 00:23:48', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(25, '2020-03-22 00:25:44', '2020-03-22 00:25:44', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(26, '2020-03-22 00:26:06', '2020-03-22 00:26:06', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(27, '2020-03-22 00:31:07', '2020-03-22 00:31:07', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(28, '2020-03-22 00:45:33', '2020-03-22 00:45:33', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(29, '2020-03-22 00:49:33', '2020-03-22 00:49:33', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(30, '2020-03-22 00:54:26', '2020-03-22 00:54:26', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(31, '2020-03-22 00:55:48', '2020-03-22 00:55:48', 1, '3.00', 0, 'Виталий2', 'vetalf.m3000@gmail.com', '89242629509', 'Советская', ''),
(32, '2020-03-22 01:00:28', '2020-03-28 13:01:31', 2, '8.00', 1, 'Сурок', 'vetalm1982@yandex.ru', '89242629509', 'Куйбышева 74-8', 'Доставка на дом.');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `qty` tinyint(4) NOT NULL,
  `total` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `title`, `price`, `qty`, `total`) VALUES
(1, 1, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(2, 1, 6, 'fresh mango dasheri (1 kg)', '5.00', 1, '5.00'),
(3, 2, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(4, 2, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(5, 3, 3, 'lahsun sev (150 gm)', '3.00', 1, '3.00'),
(6, 4, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(7, 5, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(8, 6, 5, 'fresh spinach (palak)', '2.00', 1, '2.00'),
(9, 7, 6, 'fresh mango dasheri (1 kg)', '5.00', 1, '5.00'),
(10, 8, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(11, 9, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(12, 10, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(13, 11, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(14, 12, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(15, 13, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(16, 14, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(17, 15, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(18, 16, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(19, 17, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(20, 18, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(21, 19, 8, 'fresh broccoli (500 gm)', '4.00', 1, '4.00'),
(22, 20, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(23, 21, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(24, 22, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(25, 23, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(26, 24, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(27, 25, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(28, 26, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(29, 27, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(30, 28, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(31, 29, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(32, 30, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(33, 31, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(34, 32, 1, 'knorr instant soup (100 gm)', '3.00', 1, '3.00'),
(35, 32, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `old_price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `is_offer` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `content`, `price`, `old_price`, `description`, `keywords`, `img`, `is_offer`) VALUES
(1, 1, 'knorr instant soup (100 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '76.png', 1),
(2, 1, 'chings noodles (75 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '6.png', 0),
(3, 1, 'lahsun sev (150 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '5.00', NULL, NULL, '7.png', 0),
(4, 1, 'premium bake rusk (300 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '7.00', NULL, NULL, '8.png', 0),
(5, 1, 'fresh spinach (palak)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2.00', '3.00', NULL, NULL, '9.png', 1),
(6, 1, 'fresh mango dasheri (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '10.png', 1),
(7, 5, 'fresh apple red (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '6.00', '8.00', NULL, NULL, '11.png', 1),
(8, 4, 'fresh broccoli (500 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '6.00', NULL, NULL, '12.png', 1),
(9, 10, 'mixed fruit juice (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '13.png', 0),
(10, 10, 'prune juice - sunsweet (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '0.00', NULL, NULL, '14.png', 1),
(11, 9, 'coco cola zero can (330 ml)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '15.png', 0),
(12, 9, 'sprite bottle (2 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '16.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$SlP5p2oFCdPJdU9xEIjRauIzjlI5M3ZsRnps8dwG1XH0XTn37nd8y', 'GKOnrTvSxLhvd6CKq9Q3O6RoYS36SjKu');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
