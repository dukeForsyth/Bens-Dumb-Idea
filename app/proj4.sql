-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2016 at 02:36 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proj4`
--

-- --------------------------------------------------------

--
-- Table structure for table `builds`
--

CREATE TABLE `builds` (
  `unique_id` int(25) NOT NULL,
  `userkey` int(25) NOT NULL,
  `cpu_id` varchar(25) NOT NULL,
  `videocard_id` varchar(25) NOT NULL,
  `motherboard_id` varchar(25) NOT NULL,
  `memory_id` varchar(25) NOT NULL,
  `storage_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `builds`
--

INSERT INTO `builds` (`unique_id`, `userkey`, `cpu_id`, `videocard_id`, `motherboard_id`, `memory_id`, `storage_id`) VALUES
(1, 8, 'B009O7YU56', '', 'B009FC3YJ8', '', ''),
(2, 8, '', '', '', '', ''),
(3, 8, 'B009O7YORK', '', '', '', ''),
(4, 8, '', '', '', '', ''),
(5, 8, '', '', '', '', ''),
(6, 8, '', '', '', '', ''),
(7, 8, '', '', '', '', ''),
(8, 16, '', '', '', '', ''),
(9, 17, 'B009O7YORK', 'B00847TPH0', 'B009FC3YJ8', 'B00J8E8Y5C', 'B00H4XH5GI'),
(10, 16, 'B009O7YORK', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `unique_id` varchar(25) DEFAULT NULL,
  `part_type` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`unique_id`, `part_type`, `name`) VALUES
('B009O7YORK', 'cpu', 'AMD FD6300WMHKBOX FX-6300'),
('B009O7YU56', 'cpu', 'AMD FD8320FRHKBOX FX-8320'),
('B00847TPH0', 'videocard', 'EVGA GeForce GT 610'),
('B009FC3YJ8', 'motherboard', 'Gigabyte AM3+ AMD DDR3'),
('B006WAGGUK', 'memory', 'Crucial Ballistix Sport'),
('B00J8E8Y5C', 'memory', 'Kingston HyperX FURY 16GB'),
('B006YG8X9Y', 'memory', 'Crucial 8GB Single DDR3'),
('B00H4XH5GI', 'storage', 'Seagate Backup Plus Slim '),
('B00TKFEEAS', 'memory', 'Seagate Expansion 1TB'),
('B00W8XXRPM', 'storage', 'WD 1TB Black'),
('B00UVN21RQ', 'videocard', 'Nvidia Titan X');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `unique_id` int(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`unique_id`, `username`, `password`) VALUES
(8, 'e', 'd'),
(9, 'e', 'd'),
(10, 'e', 'd'),
(11, 'e', 'd'),
(12, 'e', 'd'),
(13, 'e', 'd'),
(14, 'e', 'd'),
(15, 'e', 'd'),
(16, 'a', 's'),
(17, 'c', 'v'),
(18, 'a', 'z');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`unique_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`unique_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
