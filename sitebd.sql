-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 02 2023 г., 20:10
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitebd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Developers`
--

CREATE TABLE `Developers` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Developers`
--

INSERT INTO `Developers` (`ID`, `Name`, `img`) VALUES
(1, 'Valve', '/img/1.png'),
(2, 'EA', '/img/2.png');

-- --------------------------------------------------------

--
-- Структура таблицы `Games`
--

CREATE TABLE `Games` (
  `GameID` int NOT NULL,
  `Name` text NOT NULL,
  `Descriptrion` text NOT NULL,
  `DeveloperID` int NOT NULL,
  `ImgGame` text NOT NULL,
  `GenreID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Games`
--

INSERT INTO `Games` (`GameID`, `Name`, `Descriptrion`, `DeveloperID`, `ImgGame`, `GenreID`) VALUES
(1, 'cs', ' популярный соревновательный командный шутер с видом от первого лица. Основная идеология — противостояние двух команд, а именно террористов против контр-террористов. В начале каждого раунда, вам предстоит выбрать одну из противоборствующих сторон и выполнить задание карты или устранить всех противников.', 1, '[value-5]', 1),
(2, 'fifa 23', 'симулятор футбола', 2, 'img/2.png', 2),
(3, 'Dota 2', 'Moba', 1, 'img/3.png', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `GamesGenre`
--

CREATE TABLE `GamesGenre` (
  `GenreID` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `GamesGenre`
--

INSERT INTO `GamesGenre` (`GenreID`, `Name`) VALUES
(1, 'шутер'),
(2, 'Спорт'),
(3, 'MOBA');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Developers`
--
ALTER TABLE `Developers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`GameID`),
  ADD KEY `DeveloperID` (`DeveloperID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Индексы таблицы `GamesGenre`
--
ALTER TABLE `GamesGenre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`DeveloperID`) REFERENCES `Developers` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `GamesGenre` (`GenreID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
