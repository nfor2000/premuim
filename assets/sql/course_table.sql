-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2024 at 03:31 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_table`
--
ALTER TABLE `course_table`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `course_title` (`course_title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_table`
--
ALTER TABLE `course_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
