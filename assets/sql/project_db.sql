-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2024 at 03:32 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `course_table`
--

CREATE TABLE `course_table` (
  `Id` int(11) NOT NULL,
  `course_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_table`
--

INSERT INTO `course_table` (`Id`, `course_title`) VALUES
(47, 'CEC214'),
(26, 'CEC218'),
(27, 'CEC220'),
(28, 'CEC224'),
(29, 'CEC226'),
(37, 'CEC228'),
(1, 'CEC302'),
(2, 'CEC304'),
(3, 'CEC306'),
(12, 'CEC318'),
(41, 'CEC320'),
(13, 'CEC322'),
(42, 'CEC324'),
(46, 'CEC328'),
(14, 'CEC330'),
(44, 'COT12'),
(43, 'COT308'),
(15, 'COT310'),
(16, 'COT312'),
(34, 'CVE100'),
(50, 'EEC204'),
(54, 'EEC218'),
(55, 'EEC220'),
(32, 'EEC224'),
(33, 'EEC242'),
(51, 'EEC244'),
(52, 'EEC246'),
(53, 'EEC248'),
(4, 'EEC302'),
(7, 'EEC306'),
(6, 'EEC308'),
(40, 'EEC312'),
(9, 'EEC324'),
(5, 'EEC330'),
(39, 'EEC334'),
(38, 'EEC338'),
(10, 'EEC344'),
(11, 'EEC346'),
(8, 'EEC348'),
(31, 'ENG102'),
(30, 'FRE102'),
(48, 'MET202'),
(35, 'MET204'),
(36, 'MET206'),
(49, 'MET208'),
(17, 'MET302'),
(18, 'MET304'),
(19, 'MET306'),
(20, 'MET308'),
(21, 'MET310'),
(22, 'MET312'),
(23, 'MET314'),
(24, 'MET316'),
(25, 'MET360'),
(45, 'MET364');

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
(10, 'CT22A117', 5),
(11, 'CT22A117', 7),
(12, 'CT22A128', 2);

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
(1, 10, 47, '07:00:00', '09:00:00', 'TUESDAY'),
(2, 17, 34, '09:00:00', '11:00:00', 'TUESDAY'),
(3, 17, 27, '11:00:00', '13:00:00', 'TUESDAY'),
(4, 19, 48, '11:00:00', '13:00:00', 'TUESDAY'),
(5, 18, 32, '11:00:00', '13:00:00', 'TUESDAY'),
(6, 6, 30, '13:00:00', '15:00:00', 'TUESDAY'),
(7, 9, 31, '15:00:00', '17:00:00', 'TUESDAY'),
(8, 6, 51, '09:00:00', '11:00:00', 'WEDNESDAY'),
(9, 10, 33, '11:00:00', '13:00:00', 'WEDNESDAY'),
(10, 17, 27, '11:00:00', '13:00:00', 'WEDNESDAY'),
(11, 10, 48, '13:00:00', '15:00:00', 'WEDNESDAY'),
(12, 17, 37, '13:00:00', '15:00:00', 'WEDNESDAY'),
(13, 10, 47, '07:00:00', '09:00:00', 'THURSDAY'),
(14, 4, 51, '11:00:00', '13:00:00', 'THURSDAY'),
(15, 6, 50, '15:00:00', '17:00:00', 'THURSDAY'),
(16, 17, 37, '13:00:00', '15:00:00', 'THURSDAY'),
(17, 20, 26, '07:00:00', '09:00:00', 'FRIDAY'),
(18, 10, 49, '09:00:00', '11:00:00', 'FRIDAY'),
(19, 6, 50, '11:00:00', '13:00:00', 'FRIDAY'),
(20, 18, 54, '13:00:00', '15:00:00', 'FRIDAY'),
(21, 3, 53, '17:00:00', '19:00:00', 'FRIDAY'),
(22, 2, 49, '07:00:00', '09:00:00', 'SATURDAY'),
(23, 4, 53, '11:00:00', '13:00:00', 'SATURDAY'),
(24, 2, 52, '15:00:00', '17:00:00', 'SATURDAY'),
(25, 5, 33, '13:00:00', '15:00:00', 'THURSDAY'),
(26, 20, 28, '15:00:00', '17:00:00', 'WEDNESDAY'),
(27, 5, 26, '07:00:00', '09:00:00', 'WEDNESDAY'),
(28, 21, 29, '13:00:00', '15:00:00', 'WEDNESDAY'),
(29, 22, 51, '17:00:00', '19:00:00', 'TUESDAY');

-- --------------------------------------------------------

--
-- Table structure for table `occupy`
--

CREATE TABLE `occupy` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `matricule` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `occupy`
--

INSERT INTO `occupy` (`id`, `class_id`, `matricule`) VALUES
(175, 14, 'CT22A117'),
(176, 1, 'CT22A117'),
(177, 2, 'CT22A117'),
(178, 3, 'CT22A117'),
(179, 4, 'CT22A117'),
(180, 5, 'CT22A117'),
(181, 6, 'CT22A117'),
(182, 7, 'CT22A117'),
(183, 8, 'CT22A117'),
(184, 9, 'CT22A117'),
(185, 10, 'CT22A117'),
(186, 11, 'CT22A117'),
(187, 13, 'CT22A117'),
(188, 12, 'CT22A117');

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
(2, 'Rose Sharon Achi', 'rose@gmail.com', 'CT22A128', '$2y$10$DjJ0DJvA0DBuecTkRXnm2eUoIB8DbXvYOPxsN3Ca7cuR6Z2a6NWKq'),
(4, 'Nkonyu Vera Taken', 'takenvera@gmail.com', 'CT22A117', '$2y$10$.WCG5XelE244zvJnHvz9UuRZThcUQDvPscdK3xnpptbJhHRzkUHzK');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `course_table`
--
ALTER TABLE `course_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `delegates`
--
ALTER TABLE `delegates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `final_table`
--
ALTER TABLE `final_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `occupy`
--
ALTER TABLE `occupy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
