-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 28, 2023 at 08:42 AM
-- Server version: 8.0.32
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_manager`
--
CREATE DATABASE IF NOT EXISTS `housing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `user_manager`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_type` enum('member','admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
  `users_first_name` varchar(20) COLLATE utf8mb3_swedish_ci NOT NULL,
  `users_last_name` varchar(20) COLLATE utf8mb3_swedish_ci NOT NULL,
  `users_username` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
  `users_phone_number` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `users_email` varchar(30) COLLATE utf8mb3_swedish_ci NOT NULL,
  `users_pass` blob NOT NULL,
  `users_emailverified` enum('no','yes') CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL DEFAULT 'no',
  `users_eactivationcode` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `users_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `username` (`users_username`,`users_email`),
  UNIQUE KEY `username_2` (`users_username`),
  UNIQUE KEY `email` (`users_email`),
  KEY `emailverify` (`users_emailverified`),
  KEY `phone_number` (`users_phone_number`),
  KEY `eactivationcode` (`users_eactivationcode`),
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `users` (Note: the emails are fake)
--

INSERT INTO `users` (`users_type`, `users_first_name`, `users_last_name`, `users_username`, `users_phone_number`, `users_email`, `users_pass`, `users_emailverified`, `users_eactivationcode`, `users_updated`, `users_created`) VALUES
('admin', 'fritz', 'Frezo', 'fritz', NULL, 'fritz@camcom.com', 0xc8cde018de3e91d82112fce52b853412, 'no', NULL, '2021-01-29 11:01:45', '2023-01-23 17:23:41.247104'),
('member', 'john', 'Colon', 'john', NULL, 'john@colon.com', 0xc8cde018de3e91d82112fce52b853412, 'no', NULL, '2023-01-23 17:03:15', '2023-01-23 17:23:41.247104');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
