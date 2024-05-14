-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 14, 2024 at 11:41 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE `admin` (
  `admin_id` tinyint(3) UNSIGNED NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE `adres` (
  `adres_id` smallint(5) UNSIGNED NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `miasto` varchar(30) NOT NULL,
  `adres` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adres`
--

INSERT INTO `adres` (`adres_id`, `kod_pocztowy`, `miasto`, `adres`) VALUES
(3, '34-620', 'JodÅ‚ownik', 'SÅ‚upia 33'),
(4, '34-620', 'JodÅ‚ownik', 'SÅ‚upia 33');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `kategoria_id` smallint(5) UNSIGNED NOT NULL,
  `nazwa_kategoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategoria`
--

INSERT INTO `kategoria` (`kategoria_id`, `nazwa_kategoria`) VALUES
(28, 'adsa'),
(24, 'adsas'),
(31, 'asdaa'),
(32, 'asdadsa'),
(27, 'asdasd'),
(34, 'asdasdasd'),
(22, 'asdasdf'),
(35, 'asfaf'),
(25, 'chujaaaa'),
(15, 'dd'),
(19, 'ghasd'),
(26, 'nowa'),
(29, 'spławiki'),
(14, 'w'),
(17, 'wa'),
(12, 'wę'),
(13, 'wedka'),
(10, 'wędki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `koszyk_id` smallint(5) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opinia`
--

CREATE TABLE `opinia` (
  `opinia_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `trescOpinia` text DEFAULT NULL,
  `ocena` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

CREATE TABLE `producent` (
  `producent_id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producent`
--

INSERT INTO `producent` (`producent_id`, `nazwa`) VALUES
(8, 'asdasd'),
(10, 'gsasdg'),
(11, 'luxpord');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `kategoria_id` smallint(5) UNSIGNED NOT NULL,
  `nazwa` varchar(15) NOT NULL,
  `ilosc_magazyn` smallint(5) UNSIGNED NOT NULL,
  `cena_brutto` decimal(7,2) NOT NULL,
  `zdj_glowne` varchar(70) NOT NULL,
  `opis` tinytext NOT NULL,
  `producent_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produktkoszyk`
--

CREATE TABLE `produktkoszyk` (
  `produktKoszyk_id` mediumint(8) UNSIGNED NOT NULL,
  `koszyk_id` smallint(5) UNSIGNED NOT NULL,
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `ilosc_koszyk` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `haslo` varchar(80) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `adres_id` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `login`, `haslo`, `email`, `telefon`, `adres_id`) VALUES
(2, 'qwerty', 'asfasda', 'koobav123@gmail.com', NULL, NULL),
(3, 'safags', '$2y$10$LbVXmKR.UqxJfTKzctx8BeyazvMGCMEAKF4vuCuHirAXOnOXOY2Yi', 'koobav1@gmail.com', NULL, NULL),
(4, 'test', '$2y$10$CqaBdGfWKgCEOzKseGO7dOCfcMEqnUL4lDjtMrk97u0iEakZSdtuK', 'tst@tst.tst', NULL, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `zamowienie_id` mediumint(8) UNSIGNED NOT NULL,
  `numer_zamowienie` varchar(10) NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `platnosc` enum('blik','karta','gotowka') NOT NULL,
  `przesylka_id` mediumint(8) UNSIGNED NOT NULL,
  `status` enum('przygotowanie','wyslana','dostarczona') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecia`
--

CREATE TABLE `zdjecia` (
  `zdjecia_id` mediumint(8) UNSIGNED NOT NULL,
  `produkt_id` smallint(5) UNSIGNED NOT NULL,
  `nazwaPliku` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeksy dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`adres_id`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategoria_id`),
  ADD UNIQUE KEY `nazwa` (`nazwa_kategoria`);

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`koszyk_id`);

--
-- Indeksy dla tabeli `opinia`
--
ALTER TABLE `opinia`
  ADD PRIMARY KEY (`opinia_id`);

--
-- Indeksy dla tabeli `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`producent_id`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`produkt_id`),
  ADD KEY `kategoria_id` (`kategoria_id`);

--
-- Indeksy dla tabeli `produktkoszyk`
--
ALTER TABLE `produktkoszyk`
  ADD PRIMARY KEY (`produktKoszyk_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `koszyk_id` (`adres_id`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`zamowienie_id`);

--
-- Indeksy dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD PRIMARY KEY (`zdjecia_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adres`
--
ALTER TABLE `adres`
  MODIFY `adres_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `kategoria_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `koszyk_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opinia`
--
ALTER TABLE `opinia`
  MODIFY `opinia_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producent`
--
ALTER TABLE `producent`
  MODIFY `producent_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `produkt_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `produktkoszyk`
--
ALTER TABLE `produktkoszyk`
  MODIFY `produktKoszyk_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `zamowienie_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zdjecia`
--
ALTER TABLE `zdjecia`
  MODIFY `zdjecia_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`kategoria_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
