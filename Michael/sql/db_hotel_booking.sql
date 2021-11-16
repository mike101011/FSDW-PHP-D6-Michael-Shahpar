-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Nov 2021 um 15:54
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_hotel_booking`
--
CREATE DATABASE IF NOT EXISTS `db_hotel_booking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_hotel_booking`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(5) NOT NULL,
  `fk_hotel_id` int(11) NOT NULL,
  `fk_u_id` int(5) NOT NULL,
  `room` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bookings`
--

INSERT INTO `bookings` (`book_id`, `fk_hotel_id`, `fk_u_id`, `room`) VALUES
(1, 4, 1, 11),
(3, 2, 5, 55),
(4, 5, 4, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `hotel_name`, `address`, `price`, `picture`) VALUES
(2, 'Hotel Traube', 'Gasse 2, Wien, Zip2, Aut', 55, '618d5684e7287.jpg'),
(4, 'Rio Grande', 'boulevard 33, LA, 11000, USA', 100, 'default-pic.jpg'),
(5, 'Neue Post Gmbh', 'rosengasse 12, wien,1100,Aut', 70, 'default-pic.jpg'),
(6, 'Hotel Test', 'teststrasse 5, wien, 1190,Aut', 28, '618d55dd5fd5c.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `u_id` int(5) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `u_picture` varchar(255) DEFAULT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`u_id`, `f_name`, `s_name`, `password`, `date_of_birth`, `email`, `u_picture`, `status`) VALUES
(1, 'Michael', 'Newman-Work', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1990-11-05', 'mike-new@aon.at', '6193913430fa3.jpg', 'user'),
(3, 'Herman', 'Chef', 'd2789a29f48befe96a70ef3e3eaf57975f692165155e96880b310c82ac012ebf', '1985-11-17', 'herm-chef@aon.at', 'avatar.png', 'adm'),
(4, 'Peter', 'Pan', '9c56cc51b374c3ba189210d5b6d4bf57790d351c96c47c02190ecf1e430635ab', '1992-11-07', 'pete-pan@gmx.at', 'avatar.png', 'user'),
(5, 'Victor', 'Vlees', 'b357b3df08572cd469808592dc1faca645a0bef3906417a8bf9985e013da072e', '1988-11-07', 'vic-vlees@gmx.at', 'avatar.png', 'user');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_hotel_id` (`fk_hotel_id`),
  ADD KEY `fk_u_id` (`fk_u_id`);

--
-- Indizes für die Tabelle `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`fk_hotel_id`) REFERENCES `hotels` (`hotel_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`fk_u_id`) REFERENCES `user` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
