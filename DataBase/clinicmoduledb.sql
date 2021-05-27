-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2021 at 01:05 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinicmoduledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(64);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_billing`
--

CREATE TABLE `tbl_billing` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `physician_id` int(11) NOT NULL,
  `billed_datetime` datetime NOT NULL,
  `bill_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_billing`
--

INSERT INTO `tbl_billing` (`id`, `patient_id`, `physician_id`, `billed_datetime`, `bill_amount`) VALUES
(1, 1, 1, '2021-05-27 09:45:30', 1000.01),
(45, 3, 4, '2021-05-27 13:19:03', 1541.5),
(47, 1, 1, '2021-05-27 13:52:50', 1480.01);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holiday`
--

CREATE TABLE `tbl_holiday` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `holidaydate` date NOT NULL,
  `created_datetime` datetime NOT NULL,
  `modified_datetime` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_holiday`
--

INSERT INTO `tbl_holiday` (`id`, `name`, `holidaydate`, `created_datetime`, `modified_datetime`, `created_by`, `modified_by`) VALUES
(1, 'Independence Day', '2021-06-01', '2021-05-26 19:03:37', '2021-05-26 19:03:37', '', ''),
(2, 'Poya holiday', '2021-06-17', '2021-05-26 19:03:37', '2021-05-26 19:03:37', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient`
--

CREATE TABLE `tbl_patient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `modified_datetime` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `mobile_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_patient`
--

INSERT INTO `tbl_patient` (`id`, `name`, `age`, `gender`, `created_datetime`, `modified_datetime`, `created_by`, `mobile`, `mobile_number`) VALUES
(1, 'Mr. Kate', 50, 'Male', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '0774859632', NULL),
(3, 'Mrs. Kate', 48, 'Female', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '0774859630', NULL),
(14, 'Mr. Robin', 52, 'Male', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '0774859635', NULL),
(37, 'Mr. Gal', 60, 'Male', '2021-05-27 12:32:06', '2021-05-27 12:32:06', '', '0774855632', NULL),
(38, 'Mr. Gale', 60, 'Male', '2021-05-27 12:33:01', '2021-05-27 12:33:01', '', '0777855632', NULL),
(39, 'Mr. Ter', 60, 'Male', '2021-05-27 12:34:09', '2021-05-27 12:34:09', '', '0771855632', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_physician`
--

CREATE TABLE `tbl_physician` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `modified_datetime` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_physician`
--

INSERT INTO `tbl_physician` (`id`, `name`, `created_datetime`, `modified_datetime`, `created_by`, `modified_by`, `mobile`) VALUES
(1, 'Dr. Bill', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '', '0771236547'),
(4, 'Dr. Mark', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '', '0771236549'),
(5, 'Dr. Gates', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '', '0771236544'),
(6, 'Dr. Will', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '', '0771236540'),
(9, 'Dr. Wills', '2021-05-26 00:00:00', '2021-05-26 00:00:00', '', '', '0771236542'),
(12, 'Dr. Wills', '2021-05-25 00:00:00', '2021-05-26 00:00:00', '', '', '0771236579'),
(41, 'Dr. John', '2021-05-27 12:37:17', '2021-05-27 12:37:17', '', '', '0771206547'),
(43, 'Dr. John', '2021-05-27 12:37:43', '2021-05-27 12:37:43', 'Receptionist005', 'Receptionist005', '0771276547'),
(48, 'asdasd', '2021-05-27 15:43:18', '2021-05-27 15:43:18', 'Receptionist005', 'Receptionist005', '0777123123'),
(49, 'test', '2021-05-27 15:44:27', '2021-05-27 15:44:27', 'Receptionist005', 'Receptionist005', '0777123124'),
(56, 'Mr.kanth', '2021-05-27 15:48:16', '2021-05-27 15:48:16', 'Receptionist005', 'Receptionist005', '0777879264'),
(57, 'Mr.kanth', '2021-05-27 15:48:30', '2021-05-27 15:48:30', 'Receptionist005', 'Receptionist005', '0777879263'),
(63, 'Mr tamil', '2021-05-27 15:57:10', '2021-05-27 15:57:10', 'Receptionist005', 'Receptionist005', '0777675765');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visit`
--

CREATE TABLE `tbl_visit` (
  `id` int(11) NOT NULL,
  `physician_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `modified_datetime` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `visitdatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_visit`
--

INSERT INTO `tbl_visit` (`id`, `physician_id`, `patient_id`, `reason`, `created_datetime`, `modified_datetime`, `created_by`, `modified_by`, `visitdatetime`) VALUES
(1, 4, 3, 'Checkup', '2021-05-27 11:09:58', '2021-05-27 11:09:58', '', '', '2021-05-27 11:09:58'),
(29, 4, 3, 'checkups', '2021-05-27 11:14:39', '2021-05-27 11:14:39', '', '', '2021-05-27 11:14:39'),
(30, 4, 3, 'checkups new', '2021-05-17 00:00:00', '2021-05-17 00:00:00', '', '', '2021-05-17 00:00:00'),
(32, 4, 14, 'checkups new', '2021-05-17 00:00:00', '2021-05-17 00:00:00', '', '', '2021-05-17 00:00:00'),
(33, 6, 14, 'checkups', '2021-05-17 00:00:00', '2021-05-17 00:00:00', '', '', '2021-05-27 11:54:16'),
(34, 6, 14, 'checkups', '2021-05-17 00:00:00', '2021-05-17 00:00:00', '', '', '2021-05-27 11:56:30'),
(35, 6, 14, 'checkups date', '2021-05-27 12:06:05', '2021-05-27 13:00:33', 'Receptionist005', 'Receptionist005', '2021-06-27 10:30:00'),
(44, 12, 37, 'regular date', '2021-05-27 13:02:35', '2021-05-27 13:02:35', 'Receptionist005', 'Receptionist005', '2021-07-27 08:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_billing`
--
ALTER TABLE `tbl_billing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_billing_patient` (`patient_id`),
  ADD KEY `foreign_billing_physician` (`physician_id`);

--
-- Indexes for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_patient`
--
ALTER TABLE `tbl_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Unique` (`mobile`),
  ADD UNIQUE KEY `UK49wi31avlpvl22p02wkrs6dg1` (`mobile`);

--
-- Indexes for table `tbl_physician`
--
ALTER TABLE `tbl_physician`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Unique` (`mobile`),
  ADD UNIQUE KEY `UK9bh3qv24hcedv5q01jg9qhyq` (`mobile`),
  ADD UNIQUE KEY `UKavkxws1v2xp0j7va4v9elx2a1` (`mobile`);

--
-- Indexes for table `tbl_visit`
--
ALTER TABLE `tbl_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_visit_physician` (`physician_id`),
  ADD KEY `foreign_visit_patient` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_billing`
--
ALTER TABLE `tbl_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_patient`
--
ALTER TABLE `tbl_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_physician`
--
ALTER TABLE `tbl_physician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_visit`
--
ALTER TABLE `tbl_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_billing`
--
ALTER TABLE `tbl_billing`
  ADD CONSTRAINT `foreign_billing_patient` FOREIGN KEY (`Patient_id`) REFERENCES `tbl_patient` (`Id`),
  ADD CONSTRAINT `foreign_billing_physician` FOREIGN KEY (`Physician_id`) REFERENCES `tbl_physician` (`Id`);

--
-- Constraints for table `tbl_visit`
--
ALTER TABLE `tbl_visit`
  ADD CONSTRAINT `foreign_visit_patient` FOREIGN KEY (`patient_id`) REFERENCES `tbl_patient` (`Id`),
  ADD CONSTRAINT `foreign_visit_physician` FOREIGN KEY (`physician_id`) REFERENCES `tbl_physician` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
