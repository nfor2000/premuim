-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2024 at 07:38 AM
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
  `class_name` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`Id`, `class_name`, `state`) VALUES
(1, 'U-BLOCK F', 0),
(2, 'U-BLOCK E', 0),
(3, 'CRB II 50A 	\r\n 	\r\n\r\n', 0),
(4, 'CRB II 150B', 0),
(5, 'CRB II 100B', 0),
(6, 'CRB II 50B 	\r\n', 0),
(7, 'CRB II 50C 	\r\n', 0),
(8, 'CRB II 50D', 0),
(9, 'AMPHI 150E 	\r\n	\r\n', 0),
(10, 'G110 	\r\n', 0),
(11, 'G111 	\r\n', 0),
(12, 'CRB I 50E', 0),
(13, 'CRB I 50D 	\r\n', 0),
(14, 'CRB I 50C 	\r\n', 0),
(15, 'RESTUA I 	\r\n', 0),
(16, 'G108 	\r\n ', 0),
(17, 'G109', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_table`
--

CREATE TABLE `course_table` (
  `Id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_table`
--

INSERT INTO `course_table` (`Id`, `course_title`) VALUES
(1, 'DATA INTEGRITY AND SECURITY'),
(4, 'DIGITAL ELECTRONICS'),
(5, 'EMBEDDED SYSTEMS'),
(2, 'MOBILE APP DEVELOPMENT'),
(3, 'OBJECT ORIENTED PROGRAMMING'),
(6, 'PROBABILITY AND STATISTICS'),
(7, 'SYSTEM ANALYSIS AND DESIGN');

-- --------------------------------------------------------

--
-- Table structure for table `delegates`
--

CREATE TABLE `delegates` (
  `id` int(11) NOT NULL,
  `matricule` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delegates`
--

INSERT INTO `delegates` (`id`, `matricule`, `course_id`) VALUES
(1, 'CT22A128', 2),
(2, 'CT22A117', 7),
(3, 'CT22A128', 3),
(4, 'CT22A117', 6);

-- --------------------------------------------------------

--
-- Table structure for table `final_table`
--

CREATE TABLE `final_table` (
  `Id` int(11) NOT NULL,
  `CLASS_ID` int(11) NOT NULL,
  `COURSE_ID` int(11) NOT NULL,
  `START_TIME` time NOT NULL,
  `STOP_TIME` time NOT NULL,
  `Day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `final_table`
--

INSERT INTO `final_table` (`Id`, `CLASS_ID`, `COURSE_ID`, `START_TIME`, `STOP_TIME`, `Day`) VALUES
(1, 1, 5, '07:00:00', '09:00:00', 'TUESDAY'),
(2, 5, 4, '09:00:00', '11:00:00', 'WEDNESDAY'),
(3, 6, 4, '11:00:00', '13:00:00', 'THURSDAY'),
(4, 3, 3, '07:00:00', '09:00:00', 'WEDNESDAY'),
(5, 1, 3, '07:00:00', '09:00:00', 'FRIDAY'),
(6, 6, 5, '15:00:00', '17:00:00', 'TUESDAY'),
(7, 10, 6, '11:00:00', '13:00:00', 'THURSDAY'),
(8, 7, 6, '17:00:00', '19:00:00', 'FRIDAY'),
(9, 8, 7, '11:00:00', '13:00:00', 'TUESDAY'),
(10, 1, 7, '07:00:00', '09:00:00', 'THURSDAY'),
(11, 4, 2, '15:00:00', '17:00:00', 'WEDNESDAY');

-- --------------------------------------------------------

--
-- Table structure for table `occupy`
--

CREATE TABLE `occupy` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `matricule` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `matricule` varchar(8) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `matricule`, `password`) VALUES
(1, 'Nfor Presly Takop', 'takoppresly@gmail.com', 'CT22A100', '$2y$10$qpU6D4V8xgmbAD.cvDFDj.C24aqC3lnNRu3HKmHlretr31pdlEKvu'),
(2, 'Rose Sharon Achi', 'rose@gmail.com', 'CT22A128', '$2y$10$DjJ0DJvA0DBuecTkRXnm2eUoIB8DbXvYOPxsN3Ca7cuR6Z2a6NWKq');

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
-- Indexes for table `course_table`
--
ALTER TABLE `course_table`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `course_title` (`course_title`);

--
-- Indexes for table `delegates`
--
ALTER TABLE `delegates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `final_table`
--
ALTER TABLE `final_table`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `occupy`
--
ALTER TABLE `occupy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `course_table`
--
ALTER TABLE `course_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delegates`
--
ALTER TABLE `delegates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `final_table`
--
ALTER TABLE `final_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `occupy`
--
ALTER TABLE `occupy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
