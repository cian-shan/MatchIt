-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2022 at 07:42 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matchit`
--

-- --------------------------------------------------------

--
-- Table structure for table `about table`
--

CREATE TABLE `about table` (
  `UserID` int(255) NOT NULL,
  `AboutID` int(255) DEFAULT NULL,
  `Rank` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `available about table`
--

CREATE TABLE `available about table` (
  `AboutID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `available hobbies table`
--

CREATE TABLE `available hobbies table` (
  `InterestID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist table`
--

CREATE TABLE `blacklist table` (
  `ID` int(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat table`
--

CREATE TABLE `chat table` (
  `ChatID` int(255) NOT NULL,
  `UserA_ID` int(255) NOT NULL,
  `UserB_ID` int(255) NOT NULL,
  `PreviouslyViewed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery pictures table`
--

CREATE TABLE `gallery pictures table` (
  `UserID` int(255) DEFAULT NULL,
  `GalleryPicture1` varchar(255) DEFAULT NULL,
  `GalleryPicture2` varchar(255) DEFAULT NULL,
  `GalleryPicture3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hobbies table`
--

CREATE TABLE `hobbies table` (
  `UserID` int(255) DEFAULT NULL,
  `InterestID` int(255) DEFAULT NULL,
  `Rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location information`
--

CREATE TABLE `location information` (
  `UserID` int(255) NOT NULL,
  `Address Line 1` varchar(255) DEFAULT NULL,
  `Address Line 2` varchar(255) DEFAULT NULL,
  `Address Line 3` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `County` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `LAT_Coord` varchar(255) DEFAULT NULL,
  `LNG_Coord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `matching table`
--

CREATE TABLE `matching table` (
  `MatchID` int(255) NOT NULL,
  `UserA_ID` int(255) DEFAULT NULL,
  `UserB_ID` int(255) DEFAULT NULL,
  `ConnectionTimestamp` datetime DEFAULT NULL,
  `Status` enum('accepted','declined','pending','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(255) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `msg` varchar(1000) NOT NULL,
  `IsFrosty` bit(1) DEFAULT NULL,
  `IsFirstMessage` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `Timestamp`, `msg`, `IsFrosty`, `IsFirstMessage`) VALUES
(1, 821030718, 878765824, NULL, 'hello', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `potential matches table`
--

CREATE TABLE `potential matches table` (
  `ID` int(255) NOT NULL,
  `UserA_ID` int(255) NOT NULL,
  `UserB_ID` int(255) NOT NULL,
  `IsMatched` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profiletable`
--

CREATE TABLE `profiletable` (
  `unique_id` int(255) NOT NULL,
  `Age` int(255) NOT NULL,
  `Gender` enum('undefined','male','female','other') NOT NULL,
  `Seeking` enum('undefined','male','female',' all') NOT NULL,
  `Description` text NOT NULL,
  `Photo` varchar(255) NOT NULL,
  `Banned` binary(1) NOT NULL DEFAULT '\0',
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profiletable`
--

INSERT INTO `profiletable` (`unique_id`, `Age`, `Gender`, `Seeking`, `Description`, `Photo`, `Banned`, `Location`) VALUES
(868689853, 90, 'male', 'female', 'lol', '', 0x00, 'lol'),
(0, 0, '', '', '', '', 0x00, ''),
(821030718, 21, 'male', 'female', 'other yung fellas', '', 0x00, 'ireland'),
(878765824, 12, 'male', '', 'Funny', '', 0x00, 'Limerick'),
(1082355621, 12, 'male', 'male', '132', '', 0x00, '12'),
(1417307306, 0, '', 'female', '21', '', 0x00, '12'),
(0, 0, 'male', 'male', '', '', 0x00, ''),
(1290203799, 0, 'male', 'male', '', '', 0x00, ''),
(1011873969, 45, 'male', 'male', 'Funny', '', 0x00, 'Limerick');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Admin` binary(1) NOT NULL DEFAULT '\0',
  `Completed` tinyint(1) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `Admin`, `Completed`, `status`, `img`) VALUES
(4, 868689853, 'Calvin', 'Power', 'calvin@gmail.com', '202cb962ac59075b964b07152d234b70', 0x00, 1, 'Offline now', '1648043840raccoon-1.jpg'),
(5, 821030718, 'Calvin', 'Power', 'peter@gmail.com', '202cb962ac59075b964b07152d234b70', 0x00, 1, 'Active now', '1648044943download (1).jpg'),
(6, 1444105547, 'Calvin', 'Power', 'pet@gmail.com', '202cb962ac59075b964b07152d234b70', 0x00, 0, 'Active now', '1648067868raccoon-1.jpg'),
(7, 1082355621, 'Jack', 'Boland', 'jack@jack.com', '40687c8206d15373954d8b27c6724f62', 0x00, 0, 'Offline now', '16482284631646743105discordpic.png'),
(8, 1417307306, 'funny', 'man', 'funny@man.com', '8704daa9d50eb980c40510d39c931bfe', 0x00, 0, 'Offline now', '1648230496logoplain.png'),
(9, 1550397125, 'Jack', 'Boland', 'jack@jac.com', '40687c8206d15373954d8b27c6724f62', 0x00, 0, 'Active now', '16482311451646961524Untitled123132.png'),
(10, 1290203799, 'Hilarious', 'Funny', 'jack@jac12.com', '40687c8206d15373954d8b27c6724f62', 0x00, 0, 'Offline now', '16482312531646961524Untitled123132.png'),
(11, 1011873969, 'funky', 'monkey', 'funky@monkey.com', '6b818a3a6bf1234ed24c940021922b63', 0x00, 0, 'Active now', '16482327171646962428Untitled.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about table`
--
ALTER TABLE `about table`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AboutID` (`AboutID`);

--
-- Indexes for table `available about table`
--
ALTER TABLE `available about table`
  ADD PRIMARY KEY (`AboutID`);

--
-- Indexes for table `available hobbies table`
--
ALTER TABLE `available hobbies table`
  ADD PRIMARY KEY (`InterestID`);

--
-- Indexes for table `blacklist table`
--
ALTER TABLE `blacklist table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chat table`
--
ALTER TABLE `chat table`
  ADD PRIMARY KEY (`ChatID`);

--
-- Indexes for table `gallery pictures table`
--
ALTER TABLE `gallery pictures table`
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `hobbies table`
--
ALTER TABLE `hobbies table`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `InterestID` (`InterestID`);

--
-- Indexes for table `location information`
--
ALTER TABLE `location information`
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `matching table`
--
ALTER TABLE `matching table`
  ADD PRIMARY KEY (`MatchID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
