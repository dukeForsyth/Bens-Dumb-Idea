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
(1, 1, 'B009O7YU56', 'B00847TPH0', '', 'B006YG8X9Y', 'B00W8XXRPM'),
(2, 1, '', '', '', '', ''),
(4, 3, '', '', '', '', ''),
(5, 112, 'B009O7YORK', 'B00NVODXR4', 'B00TOBQQTK', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `unique_id` varchar(25) DEFAULT NULL,
  `part_type` varchar(25) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`unique_id`, `part_type`, `name`) VALUES
('B009O7YORK', 'cpu', 'AMD FD6300WMHKBOX FX-6300'),
('B009O7YU56', 'cpu', 'AMD FD8320FRHKBOX FX-8320'),
('B009FC3YJ8', 'motherboard', 'Gigabyte AM3+ AMD DDR3'),
('B00J8E8Y5C', 'memory', 'Kingston HyperX FURY 16GB'),
('B006YG8X9Y', 'memory', 'Crucial 8GB Single DDR3'),
('B00UVN21RQ', 'videocard', 'Nvidia Titan X'),
('B00JST2QEW', 'cpu', 'i5 4590'),
('B00K23BW70', 'motherboard', 'MSI Intel Z97 LGA 1150 DDR3 USB 3.1 ATX Motherboard '),
('B00NT9UT3M', 'videocard', 'EVGA GeForce GTX 980'),
('B00FLMKQYW', 'videocard', 'Sapphire Radeon R9 290 4GB GDDR5'),
('B012M8LXQW', 'cpu', 'i7 6700k'),
('B0088PUEPK', 'storage', 'Western Digital Caviar Blue 1TB 3.5" 7200RPM Internal Hard Drive'),
('B00OAJ412U', 'storage', 'Samsung 850 EVO-Series 250GB 2.5" Solid State Drive'),
('B005T3GRN2', 'storage', 'Seagate Barracuda 2TB 3.5" 7200RPM Internal Hard Drive'),
('B005T3GRNW', 'storage', 'Seagate Barracuda 1TB 3.5" 7200RPM Internal Hard Drive'),
('B00NVODXR4', 'videocard', 'EVGA GeForce GTX 970 4GB'),
('B0131GA4WI', 'motherboard', 'MSI Z170A GAMING M5 ATX LGA1151 Motherboard'),
('B00TOBQQTK', 'motherboard', 'ASRock 970M PRO3 Micro ATX AM3+/AM3 Motherboard'),
('B0134EW7G8', 'memory', 'Corsair Vengeance LPX 16GB (2 x 8GB) DDR4-3000 Memory'),
('B00J8E9334', 'memory', 'Kingston HyperX Fury Black 8GB (1 x 8GB) DDR3-1600 Memory'),
('B00MU00IOQ', 'cpu', 'AMD Athlon X4 860K'),
('B0033S95FC', 'cpu', 'Intel Core i5-520M'),
('B00JIJUBAS', 'cpu', 'Intel Core i5-4460'),
('B00MU00HGK', 'cpu', 'AMD A4-7300 APU'),
('B012M8M7TY', 'cpu', 'Intel i5-6600k'),
('B004KABG1I', 'videocard', 'EVGA GeForce 210 Passive 1024 MB'),
('B012ZDI8ZS', 'videocard', 'Gigabyte GT 420 2GB 128-Bit'),
('B00847TPH0', 'videocard', 'EVGA GeForce GT 610 2048 MB'),
('B0049MPQA4', 'videocard', 'EVGA GeForce 8400GS 1GB'),
('B014YN6732', 'motherboard', 'MSI Gaming Intel Skylake B150'),
('B014F7BQUG', 'motherboard', 'ASUS LGA1151 DDR4');

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
(3, 'c', 'e', 'a', 'b', 'Male', 1, 'd'),
(111, 'abcd', 'abcd', 'abcd', 'abcd', '', 1, 'abcd'),
(112, 'ee', 'ee', 'ee', 'ee', 'Not Specified', 1, 'ee');

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
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `unique_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
