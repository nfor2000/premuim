-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2024 at 03:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `Id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`Id`, `class_name`, `state`) VALUES
(1, 'CLASSROOM BLOCK I 50 A', 1),
(2, 'CLASSROOM BLOCK I 50 C', 1),
(3, 'CLASSROOM BLOCK I 50 D', 1),
(4, 'CLASSROOM BLOCK I 50 E', 1),
(5, 'CLASSROOM BLOCK II 100 B', 1),
(6, 'CLASSROOM BLOCK II 150 B', 1),
(7, 'CLASSROOM BLOCK II 50 A', 1),
(8, 'CLASSROOM BLOCK II 50 C', 1),
(9, 'AMPHI 150 E', 1),
(10, 'G108', 1),
(11, 'G109', 1),
(12, 'G110', 1),
(13, 'G111', 1),
(14, 'RESTAU I', 1),
(15, 'RESTAU VIII', 0),
(16, 'U-BLOCK F', 0),
(17, 'U-BLOCK E', 0),
(18, 'G-BLOCK', 0),
(19, 'G114', 0),
(20, 'U-BLOCK D', 0),
(21, 'CT 1', 0),
(22, 'CLASSROOM BLOCK I 50H', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `class_name` (`class_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
