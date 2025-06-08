-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 01:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scc`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_courses`
--

CREATE TABLE `all_courses` (
  `Sno` int(3) NOT NULL,
  `Cid` varchar(10) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Teacher` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`Sno`, `Cid`, `Course`, `Teacher`) VALUES
(1, 'c01_pyt', 'Python', 'Tushar Kute'),
(2, 'c02_jc', 'Core Java', 'Raham Ali'),
(3, 'c03_wdb', 'Web Dev Basics', 'Puneet Verma'),
(4, 'c04_ang', 'AngularJS', 'Vijay Kumar'),
(5, 'c05_rct', 'ReactJS', 'Manish Shinde'),
(6, 'c06_dps', 'DevOps', 'Raham Ali'),
(7, 'c07_ds', 'Data Science', 'Tushar Kute'),
(8, 'c08_fsj', 'Full Stack Java', 'Raham Ali'),
(9, 'c09_dm', 'Digital Marketing', 'Mr. Ramakanth');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `Sno` int(3) NOT NULL,
  `Cid` varchar(20) NOT NULL,
  `Morning` varchar(50) NOT NULL,
  `Evening` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`Sno`, `Cid`, `Morning`, `Evening`) VALUES
(1, 'c02_jc', 'Java Core', 'Java Core');

-- --------------------------------------------------------

--
-- Table structure for table `registered_courses`
--

CREATE TABLE `registered_courses` (
  `Sno` int(2) NOT NULL,
  `Cid` varchar(10) NOT NULL,
  `Rollno` int(3) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Batch` varchar(100) NOT NULL,
  `Teacher` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registered_courses`
--

INSERT INTO `registered_courses` (`Sno`, `Cid`, `Rollno`, `Course`, `Batch`, `Teacher`) VALUES
(1, 'c03_wdb', 2, 'Web Dev Basics', 'Evening', 'Puneet Verma');

-- --------------------------------------------------------

--
-- Table structure for table `studentreg`
--

CREATE TABLE `studentreg` (
  `Rollno` int(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact` bigint(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Photo` varchar(100) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentreg`
--

INSERT INTO `studentreg` (`Rollno`, `Name`, `Age`, `Gender`, `Email`, `Contact`, `Address`, `Photo`, `Password`) VALUES
(1, 'Khushi Verma', 29, 'female', 'khushi23@gmail.com', 9811112222, 'Pune', 'stu1.jpg', '$5$rounds=535000$N/qgoET0TRR4ngeK$QmIeErQoVPdODNHumTNj3siDJoceUO8SsmGQ837.PR1'),
(2, 'Raj Verma', 22, 'male', 'raj23@gmail.com', 9811112222, 'Pune', 'raj.jpg', '$5$rounds=535000$5KaxD8usQ/BAwN8u$JChZTGhdnIpsDkfmtR0jXhf7eYiobcoTICPFJiA.TM6'),
(3, 'Manish Kumar', 22, 'male', 'man@gmail.com', 9876546548, 'Maharashtra', 'stu2.png', '$5$rounds=535000$5mUmr0PF7p29sqOS$SiqYjmndEiNWxNUKRKxoJ22DhNn3blTJSWW1.e1GqYC');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `Sno` int(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Cid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`Sno`, `Name`, `Phone`, `Cid`) VALUES
(1, 'Tushar Kute', 9876543211, 'c01_pyt, c07_ds'),
(2, 'Raham Ali', 9876543212, 'c02_jc, c08_fsj, c06_dps'),
(3, 'Puneet Verma', 9876543213, 'c03_wdb'),
(4, 'Vijay Kumar', 9876543214, 'c04_ang, c09_dm'),
(5, 'Manish Shinde', 9876543215, 'c05_rct'),
(6, 'Mr. Ramakanth', 9876543216, 'c09_dm');

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_courses`
--

CREATE TABLE `upcoming_courses` (
  `Sno` int(2) NOT NULL,
  `Cid` varchar(10) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Batch` varchar(50) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Time` varchar(20) NOT NULL,
  `Teacher` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upcoming_courses`
--

INSERT INTO `upcoming_courses` (`Sno`, `Cid`, `Course`, `Batch`, `Date`, `Time`, `Teacher`) VALUES
(1, 'c09_dm', 'Digital Marketting', 'Evening', '10 August', '5:00 - 6:00 PM', 'Mr. Ramakanth');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_courses`
--
ALTER TABLE `all_courses`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `registered_courses`
--
ALTER TABLE `registered_courses`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `studentreg`
--
ALTER TABLE `studentreg`
  ADD PRIMARY KEY (`Rollno`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `upcoming_courses`
--
ALTER TABLE `upcoming_courses`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_courses`
--
ALTER TABLE `all_courses`
  MODIFY `Sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `Sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registered_courses`
--
ALTER TABLE `registered_courses`
  MODIFY `Sno` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `studentreg`
--
ALTER TABLE `studentreg`
  MODIFY `Rollno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `Sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `upcoming_courses`
--
ALTER TABLE `upcoming_courses`
  MODIFY `Sno` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
