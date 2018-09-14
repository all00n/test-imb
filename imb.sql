-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 14 2018 г., 17:43
-- Версия сервера: 10.1.33-MariaDB
-- Версия PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `imb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `doc_price`
--

CREATE TABLE `doc_price` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doc_price`
--

INSERT INTO `doc_price` (`id`, `datetime`, `status`) VALUES
(1, '2018-09-11 15:39:14', '1'),
(2, '2018-09-11 15:40:14', '1'),
(3, '2018-09-12 15:41:14', '1'),
(4, '2018-09-12 14:41:13', '1'),
(5, '2018-09-12 14:41:13', '1'),
(6, '2018-09-12 14:41:13', '1'),
(7, '2018-09-12 14:41:13', '0'),
(8, '2018-09-14 14:41:13', '1'),
(9, '2018-09-14 14:41:13', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `doc_price_body`
--

CREATE TABLE `doc_price_body` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doc_price_body`
--

INSERT INTO `doc_price_body` (`id`, `doc_id`, `product_id`, `price`) VALUES
(1, 1, 1, '99.99'),
(2, 2, 2, '129.00'),
(3, 3, 3, '200.00'),
(4, 4, 4, '149.50'),
(5, 5, 2, '10.99'),
(6, 6, 1, '13.00'),
(7, 7, 3, '19.00'),
(8, 8, 5, '112.00'),
(9, 9, 1, '400.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `status`) VALUES
(1, 'продукт 1', 'описание 1', '0'),
(2, 'продукт 2', 'описание 2', '0'),
(3, 'продукт 3', 'описание 3', '0'),
(4, 'продукт 4', 'описание 4', '0'),
(5, 'продукт 5', 'описание 5', '0');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `doc_price`
--
ALTER TABLE `doc_price`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doc_price_body`
--
ALTER TABLE `doc_price_body`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `doc_price`
--
ALTER TABLE `doc_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `doc_price_body`
--
ALTER TABLE `doc_price_body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
