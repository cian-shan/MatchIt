-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2022 at 12:50 AM
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
  `ChatID` int(255) DEFAULT NULL,
  `UserID` int(255) NOT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Message` varchar(1000) NOT NULL,
  `IsFrosty` bit(1) DEFAULT NULL,
  `IsFirstMessage` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `profile table`
--

CREATE TABLE `profile table` (
  `UserID` int(255) NOT NULL,
  `Age` int(255) DEFAULT NULL,
  `Gender` enum('male','female','other','') DEFAULT NULL,
  `Seeking` enum('male','female',' all','') DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Banned` binary(1) NOT NULL DEFAULT '\0',
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user table`
--

CREATE TABLE `user table` (
  `UserID` int(255) NOT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Admin` binary(1) NOT NULL DEFAULT '\0',
  `Completed` binary(1) NOT NULL DEFAULT '\0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `ChatID` (`ChatID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `potential matches table`
--
ALTER TABLE `potential matches table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `profile table`
--
ALTER TABLE `profile table`
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `user table`
--
ALTER TABLE `user table`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about table`
--
ALTER TABLE `about table`
  ADD CONSTRAINT `about table_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`),
  ADD CONSTRAINT `about table_ibfk_2` FOREIGN KEY (`AboutID`) REFERENCES `available about table` (`AboutID`);

--
-- Constraints for table `gallery pictures table`
--
ALTER TABLE `gallery pictures table`
  ADD CONSTRAINT `gallery pictures table_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`);

--
-- Constraints for table `hobbies table`
--
ALTER TABLE `hobbies table`
  ADD CONSTRAINT `hobbies table_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`),
  ADD CONSTRAINT `hobbies table_ibfk_2` FOREIGN KEY (`InterestID`) REFERENCES `available hobbies table` (`InterestID`);

--
-- Constraints for table `location information`
--
ALTER TABLE `location information`
  ADD CONSTRAINT `location information_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`ChatID`) REFERENCES `chat table` (`ChatID`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`);

--
-- Constraints for table `profile table`
--
ALTER TABLE `profile table`
  ADD CONSTRAINT `profile table_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user table` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
