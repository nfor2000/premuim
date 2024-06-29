-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2024 at 03:29 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `final_table`
--
ALTER TABLE `final_table`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `final_table`
--
ALTER TABLE `final_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
