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
-- Database: `housing`
--
CREATE DATABASE IF NOT EXISTS `housing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `housing`;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `contract_period` int NOT NULL,
  `contract_users_id` int NOT NULL,
  `contract_offers_id` int DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract_id`, `contract_period`, `contract_users_id`, `contract_offers_id`) VALUES
(1, 6, 1, NULL),
(2, 12, 2, 2),
(3, 60, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `offers_id` int NOT NULL AUTO_INCREMENT,
  `offers_percentatge` int NOT NULL,
  `offers_name` varchar(50) NOT NULL,
  PRIMARY KEY (`offers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offers_id`, `offers_percentatge`, `offers_name`) VALUES
(1, 0, 'none'),
(2, 10, 'twelve months'),
(3, 30, 'five years');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `orders_users_id` int NOT NULL,
  `orders_total` decimal(11,2) NOT NULL,
  `orders_date_created` timestamp(6) NOT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_users_id`, `orders_total`, `orders_date_created`) VALUES
(4, 1, '251.00', '2023-01-19 09:14:54.000000'),
(5, 2, '183.50', '2023-01-19 09:14:54.000000'),
(6, 3, '434.50', '2023-01-19 09:14:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `order_contents_id`
--

CREATE TABLE IF NOT EXISTS `order_contents_id` (
  `order_contents_id` int NOT NULL AUTO_INCREMENT,
  `order_contents_orders_id` int NOT NULL,
  `order_contents_product_id` int NOT NULL,
  `order_contents_price_per_unit` decimal(11,2) NOT NULL,
  PRIMARY KEY (`order_contents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_contents_id`
--

INSERT INTO `order_contents_id` (`order_contents_id`, `order_contents_orders_id`, `order_contents_product_id`, `order_contents_price_per_unit`) VALUES
(1, 1, 1, '200.00'),
(2, 1, 4, '51.00'),
(3, 2, 2, '100.00'),
(4, 2, 3, '83.50'),
(5, 3, 1, '200.00'),
(6, 3, 2, '100.00'),
(7, 3, 3, '83.50'),
(8, 3, 4, '51.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_name`, `product_price`) VALUES
(1, 'P001', 'Photography', '200.00'),
(2, 'P002', 'Floorplan', '100.00'),
(3, 'P003', 'Gas Certificate', '83.50'),
(4, 'P004', 'EICR Certificate', '51.00');

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
  `users_authorized` enum('0','1') COLLATE utf8mb3_swedish_ci NOT NULL DEFAULT '0',
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_type`, `users_first_name`, `users_last_name`, `users_username`, `users_phone_number`, `users_email`, `users_pass`, `users_emailverified`, `users_authorized`, `users_eactivationcode`, `users_updated`, `users_created`) VALUES
(1, 'admin', '', '', 'fritz', NULL, '', 0xc8cde018de3e91d82112fce52b853412, 'no', '0', NULL, '2021-01-29 11:01:45', '2023-01-23 17:23:41.247104'),
(2, 'member', '', '', 'john', NULL, '', 0xc8cde018de3e91d82112fce52b853412, 'no', '0', NULL, '2023-01-23 17:03:15', '2023-01-23 17:23:41.247104');

-- --------------------------------------------------------

--
-- Table structure for table `user_contracts`
--

CREATE TABLE IF NOT EXISTS `user_contracts` (
  `user_contracts_id` int NOT NULL AUTO_INCREMENT,
  `user_contracts_users_id` int NOT NULL,
  `user_contracts_start` date NOT NULL,
  `user_contracts_end` date NOT NULL,
  `user_contracts_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_contracts_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
