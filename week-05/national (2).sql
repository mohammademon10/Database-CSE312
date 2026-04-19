-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2026 at 05:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `national`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `nation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `nation_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 3),
(9, 3),
(10, 4),
(11, 4),
(12, 5),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 7),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(22, 8),
(23, 9);

-- --------------------------------------------------------

--
-- Table structure for table `nation`
--

CREATE TABLE `nation` (
  `nation_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nation`
--

INSERT INTO `nation` (`nation_id`, `name`, `region_id`, `population`) VALUES
(1, 'Bangladesh', 1, 170000000),
(2, 'India', 1, 1400000000),
(3, 'China', 1, 1440000000),
(4, 'Germany', 2, 83000000),
(5, 'France', 2, 67000000),
(6, 'Nigeria', 3, 220000000),
(7, 'Egypt', 3, 110000000),
(8, 'USA', 4, 331000000),
(9, 'Canada', 4, 38000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `amount`) VALUES
(1, 1, 200.00),
(2, 1, 300.00),
(3, 2, 150.00),
(4, 3, 400.00),
(5, 4, 500.00),
(6, 5, 700.00),
(7, 6, 250.00),
(8, 7, 350.00),
(9, 8, 1000.00),
(10, 9, 1200.00),
(11, 10, 600.00),
(12, 11, 450.00),
(13, 12, 800.00),
(14, 13, 300.00),
(15, 14, 500.00),
(16, 15, 200.00),
(17, 16, 400.00),
(18, 17, 650.00),
(19, 18, 900.00),
(20, 19, 1100.00),
(21, 20, 700.00),
(22, 21, 600.00),
(23, 22, 500.00),
(24, 23, 350.00);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `name`) VALUES
(1, 'Asia'),
(2, 'Europe'),
(3, 'Africa'),
(4, 'America');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `nation_id` (`nation_id`);

--
-- Indexes for table `nation`
--
ALTER TABLE `nation`
  ADD PRIMARY KEY (`nation_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`nation_id`);

--
-- Constraints for table `nation`
--
ALTER TABLE `nation`
  ADD CONSTRAINT `nation_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
