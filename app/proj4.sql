-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2016 at 06:56 PM
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
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `userID` int(11) NOT NULL,
  `dateMade` datetime NOT NULL,
  `content` varchar(200) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `recieverID` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `buildID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`userID`, `dateMade`, `content`, `unique_id`, `recieverID`, `type`, `buildID`) VALUES
(1, '0000-00-00 00:00:00', 'admin has added part AMD FD6300WMHKBOX FX-6300 to build 1', 6, 0, 'edited', 1),
(1, '0000-00-00 00:00:00', 'admin followed c!', 15, 3, 'followed', 0),
(1, '0000-00-00 00:00:00', 'admin followed c!', 16, 3, 'followed', 0),
(3, '0000-00-00 00:00:00', '', 17, 0, 'publish', 4),
(1, '0000-00-00 00:00:00', 'admin has liked c''s build 4', 18, 3, 'liked', 4);

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
(1, 1, 'B009O7YORK', '', '', '', ''),
(2, 1, '', '', '', '', ''),
(4, 3, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `follower`
--

CREATE TABLE `follower` (
  `userID` int(11) NOT NULL,
  `followingID` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follower`
--

INSERT INTO `follower` (`userID`, `followingID`, `unique_id`) VALUES
(3, 1, 8),
(1, 3, 10);

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
  `password` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `rank` int(11) NOT NULL,
  `emailAddress` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`unique_id`, `username`, `password`, `firstName`, `lastName`, `gender`, `rank`, `emailAddress`) VALUES
(1, 'admin', 'adminpw', 'Benny', 'Boy', 'Male', 0, 'fakeEmail@fake.com'),
(3, 'c', 'e', 'a', 'b', 'Male', 1, 'd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`unique_id`);

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`unique_id`);

--
-- Indexes for table `follower`
--
ALTER TABLE `follower`
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
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `follower`
--
ALTER TABLE `follower`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
