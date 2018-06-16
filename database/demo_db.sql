-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 06:43 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accounts_id` int(10) NOT NULL,
  `numeric_code` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `opening_balance` decimal(10,2) NOT NULL,
  `opening_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accounts_id`, `numeric_code`, `name`, `opening_balance`, `opening_date`) VALUES
(1, 1, 'cash', '65000.00', '2017-03-01'),
(2, 2, 'bank', '342870.23', '2017-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `stmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `name`, `description`, `start_date`, `end_date`, `stmp`) VALUES
(5, 'Parents Meeting', 'For all parents and classes', '2017-11-12', '2017-11-12', '2017-11-12 12:33:04'),
(6, 'Prize Giving Day', 'Academic Day', '2018-04-30', '2018-04-30', '2018-04-04 13:43:07'),
(7, 'Fundraising Day', 'For purchasing a school bus', '2018-06-28', '2018-06-28', '2018-06-15 13:57:47'),
(8, 'Closing Day', 'Closing Day', '2018-06-29', '2018-06-29', '2018-06-15 16:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `activity_attendance`
--

CREATE TABLE `activity_attendance` (
  `activity_attendance_id` int(100) NOT NULL,
  `activity_id` int(100) NOT NULL,
  `parent_id` int(100) NOT NULL,
  `expected` tinyint(5) NOT NULL,
  `attendance` int(5) NOT NULL COMMENT '0=Absent,1=Not Attending, 2=Attended'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_attendance`
--

INSERT INTO `activity_attendance` (`activity_attendance_id`, `activity_id`, `parent_id`, `expected`, `attendance`) VALUES
(25, 7, 1, 1, 0),
(26, 7, 3, 1, 1),
(27, 7, 4, 1, 1),
(28, 6, 1, 1, 0),
(29, 6, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user_id` tinyint(10) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `level` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_id`, `name`, `email`, `birthday`, `sex`, `phone`, `level`) VALUES
(1, 0, 'Nicodemus Karisa', 'mwambirekarisa2017@gmail.com', '', '', '', 'super'),
(2, 0, 'Betty Kanze', 'BYeri@gmail.com', '03/14/1989', 'female', '0711909076', 'manager'),
(4, 0, 'James Mulandi', 'JMulandi@gmail.com', '06/11/1980', '', '0711909076', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 undefined , 1 present , 2  absent',
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `status`, `student_id`, `date`) VALUES
(1, 1, 4, '2018-04-04'),
(2, 0, 4, '2018-04-05'),
(3, 1, 1, '2018-04-20'),
(4, 1, 2, '2018-04-20'),
(5, 2, 3, '2018-04-20'),
(6, 1, 4, '2018-06-14'),
(7, 2, 11, '2018-06-14'),
(8, 1, 12, '2018-06-14'),
(9, 1, 13, '2018-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `budget_id` int(100) NOT NULL,
  `expense_category_id` int(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `fy` int(5) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `unitcost` decimal(10,2) NOT NULL,
  `often` int(10) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `smtp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`budget_id`, `expense_category_id`, `description`, `fy`, `qty`, `unitcost`, `often`, `total`, `smtp`) VALUES
(3, 1, 'Kinder', 2017, '3.00', '7500.00', 12, '270000.00', '2017-02-26 05:42:58'),
(4, 1, 'Primary School Teachers', 2017, '7.00', '9400.00', 12, '789600.00', '2017-02-26 05:46:29'),
(5, 2, 'Electricity', 2017, '1.00', '4800.00', 12, '57600.00', '2017-02-26 06:03:43'),
(6, 2, 'Fuel', 2017, '2.00', '8000.00', 12, '192000.00', '2017-02-26 06:04:44'),
(7, 3, 'Lower Primary Examination', 2017, '89.00', '120.00', 3, '32040.00', '2017-03-12 22:55:16'),
(8, 3, 'Term 1 Exams', 2018, '1.00', '5600.00', 3, '16800.00', '2018-04-04 14:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `budget_schedule`
--

CREATE TABLE `budget_schedule` (
  `budget_schedule_id` int(100) NOT NULL,
  `budget_id` int(100) NOT NULL,
  `month` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `stmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget_schedule`
--

INSERT INTO `budget_schedule` (`budget_schedule_id`, `budget_id`, `month`, `amount`, `stmp`) VALUES
(25, 3, 1, '22500.00', '2017-02-26 05:42:58'),
(26, 3, 2, '22500.00', '2017-02-26 05:42:58'),
(27, 3, 3, '22500.00', '2017-02-26 05:42:58'),
(28, 3, 4, '22500.00', '2017-02-26 05:42:58'),
(29, 3, 5, '22500.00', '2017-02-26 05:42:58'),
(30, 3, 6, '22500.00', '2017-02-26 05:42:58'),
(31, 3, 7, '22500.00', '2017-02-26 05:42:58'),
(32, 3, 8, '22500.00', '2017-02-26 05:42:58'),
(33, 3, 9, '22500.00', '2017-02-26 05:42:58'),
(34, 3, 10, '22500.00', '2017-02-26 05:42:58'),
(35, 3, 11, '22500.00', '2017-02-26 05:42:58'),
(36, 3, 12, '22500.00', '2017-02-26 05:42:58'),
(37, 4, 1, '65800.00', '2017-02-26 05:46:29'),
(38, 4, 2, '65800.00', '2017-02-26 05:46:29'),
(39, 4, 3, '65800.00', '2017-02-26 05:46:29'),
(40, 4, 4, '65800.00', '2017-02-26 05:46:29'),
(41, 4, 5, '65800.00', '2017-02-26 05:46:29'),
(42, 4, 6, '65800.00', '2017-02-26 05:46:29'),
(43, 4, 7, '65800.00', '2017-02-26 05:46:29'),
(44, 4, 8, '65800.00', '2017-02-26 05:46:29'),
(45, 4, 9, '65800.00', '2017-02-26 05:46:29'),
(46, 4, 10, '65800.00', '2017-02-26 05:46:29'),
(47, 4, 11, '65800.00', '2017-02-26 05:46:29'),
(48, 4, 12, '65800.00', '2017-02-26 05:46:29'),
(49, 5, 1, '4800.00', '2017-02-26 06:03:43'),
(50, 5, 2, '4800.00', '2017-02-26 06:03:43'),
(51, 5, 3, '4800.00', '2017-02-26 06:03:43'),
(52, 5, 4, '4800.00', '2017-02-26 06:03:43'),
(53, 5, 5, '4800.00', '2017-02-26 06:03:43'),
(54, 5, 6, '4800.00', '2017-02-26 06:03:43'),
(55, 5, 7, '4800.00', '2017-02-26 06:03:43'),
(56, 5, 8, '4800.00', '2017-02-26 06:03:43'),
(57, 5, 9, '4800.00', '2017-02-26 06:03:43'),
(58, 5, 10, '4800.00', '2017-02-26 06:03:43'),
(59, 5, 11, '4800.00', '2017-02-26 06:03:43'),
(60, 5, 12, '4800.00', '2017-02-26 06:03:43'),
(61, 6, 1, '16000.00', '2017-02-26 06:04:44'),
(62, 6, 2, '16000.00', '2017-02-26 06:04:44'),
(63, 6, 3, '16000.00', '2017-02-26 06:04:44'),
(64, 6, 4, '16000.00', '2017-02-26 06:04:44'),
(65, 6, 5, '16000.00', '2017-02-26 06:04:44'),
(66, 6, 6, '16000.00', '2017-02-26 06:04:44'),
(67, 6, 7, '16000.00', '2017-02-26 06:04:44'),
(68, 6, 8, '16000.00', '2017-02-26 06:04:44'),
(69, 6, 9, '16000.00', '2017-02-26 06:04:44'),
(70, 6, 10, '16000.00', '2017-02-26 06:04:44'),
(71, 6, 11, '16000.00', '2017-02-26 06:04:44'),
(72, 6, 12, '16000.00', '2017-02-26 06:04:44'),
(73, 7, 1, '0.00', '2017-03-12 22:55:16'),
(74, 7, 2, '0.00', '2017-03-12 22:55:16'),
(75, 7, 3, '10680.00', '2017-03-12 22:55:16'),
(76, 7, 4, '0.00', '2017-03-12 22:55:16'),
(77, 7, 5, '0.00', '2017-03-12 22:55:16'),
(78, 7, 6, '0.00', '2017-03-12 22:55:16'),
(79, 7, 7, '10680.00', '2017-03-12 22:55:16'),
(80, 7, 8, '0.00', '2017-03-12 22:55:16'),
(81, 7, 9, '0.00', '2017-03-12 22:55:16'),
(82, 7, 10, '0.00', '2017-03-12 22:55:16'),
(83, 7, 11, '10680.00', '2017-03-12 22:55:16'),
(84, 7, 12, '0.00', '2017-03-12 22:55:16'),
(85, 8, 1, '1400.00', '2018-04-04 14:24:26'),
(86, 8, 2, '1400.00', '2018-04-04 14:24:26'),
(87, 8, 3, '1400.00', '2018-04-04 14:24:26'),
(88, 8, 4, '1400.00', '2018-04-04 14:24:26'),
(89, 8, 5, '1400.00', '2018-04-04 14:24:26'),
(90, 8, 6, '1400.00', '2018-04-04 14:24:26'),
(91, 8, 7, '1400.00', '2018-04-04 14:24:26'),
(92, 8, 8, '1400.00', '2018-04-04 14:24:26'),
(93, 8, 9, '1400.00', '2018-04-04 14:24:26'),
(94, 8, 10, '1400.00', '2018-04-04 14:24:26'),
(95, 8, 11, '1400.00', '2018-04-04 14:24:27'),
(96, 8, 12, '1400.00', '2018-04-04 14:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `caregiver`
--

CREATE TABLE `caregiver` (
  `caregiver_id` int(100) NOT NULL,
  `parent_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caregiver`
--

INSERT INTO `caregiver` (`caregiver_id`, `parent_id`, `student_id`) VALUES
(12, 5, 11),
(13, 6, 11),
(14, 5, 12),
(15, 6, 12),
(20, 7, 2),
(21, 7, 11),
(25, 3, 4),
(26, 7, 4),
(27, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `cashbook_id` int(200) NOT NULL,
  `batch_number` int(200) NOT NULL,
  `t_date` date NOT NULL,
  `description` varchar(100) NOT NULL,
  `transaction_type` int(10) NOT NULL COMMENT '1=income,2=expense,3=to_bank,4=to_cash',
  `account` int(10) NOT NULL COMMENT '1=cash,2=bank',
  `amount` decimal(10,2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`cashbook_id`, `batch_number`, `t_date`, `description`, `transaction_type`, `account`, `amount`, `timestamp`) VALUES
(17, 170301, '2017-03-06', 'Student Payment - James Mulandi', 1, 1, '1500.00', '2017-03-06 20:07:55'),
(18, 170302, '2017-03-06', 'School Bus Fuel', 2, 2, '1710.00', '2017-03-06 20:13:11'),
(19, 170303, '2017-03-06', 'February Salaries', 2, 1, '25500.00', '2017-03-06 20:23:28'),
(20, 170304, '2017-03-06', 'February Salary for Primary School', 2, 2, '68000.00', '2017-03-06 20:27:39'),
(21, 170305, '2017-03-06', 'Student Payment - James Mulandi', 1, 2, '2600.00', '2017-03-06 20:30:45'),
(22, 170306, '2017-03-06', 'Deposit cash to bank', 3, 0, '35000.00', '2017-03-06 20:33:11'),
(23, 170307, '2017-03-06', 'Reversal: Batch - 170303', 2, 1, '-25500.00', '2017-03-06 20:39:46'),
(24, 170308, '2017-03-06', 'Reversal: Batch - 170302', 2, 2, '-1710.00', '2017-03-06 20:50:53'),
(25, 171009, '2017-10-06', 'Testing', 2, 1, '1200.00', '2017-10-06 19:26:26'),
(26, 171110, '2017-11-09', 'Testing', 2, 2, '12000.00', '2017-11-09 21:42:30'),
(27, 171111, '2017-11-09', 'Test 3', 2, 2, '2500.00', '2017-11-09 22:00:30'),
(28, 180412, '2018-04-04', 'Student Payment - Beatrice Maina', 1, 1, '7500.00', '2018-04-04 14:14:21'),
(29, 180413, '2018-04-04', 'Salary', 2, 1, '25000.00', '2018-04-04 14:19:33'),
(30, 180414, '2018-04-04', 'Reversal: Batch - 180413', 2, 1, '-25000.00', '2018-04-04 14:19:44'),
(31, 180415, '2018-04-04', 'Banking', 3, 0, '7500.00', '2018-04-04 14:21:37'),
(32, 180416, '2018-04-04', 'Bankin', 3, 0, '30300.00', '2018-04-04 14:22:46'),
(33, 180417, '2018-04-04', 'To Petty Cash', 4, 0, '8000.00', '2018-04-04 14:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1577c3c4be0bf19306b86c0dd5861c05159911ec', '::1', 1529164974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136343637363b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a31333a22636c6173735f726f7574696e65223b),
('1bb2680af1256d1812d662c021580e6c4eb7202b', '::1', 1529164331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136343033373b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a31333a22636c6173735f726f7574696e65223b),
('2b4f50997c2e2bdee1374633adbf1eae8191acd6', '::1', 1529166633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136363430383b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a343a226578616d223b),
('33d32f8489b23db7af6ac1dd043fc60a6afb889c', '::1', 1529156007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135353931393b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('4277ad80dd58b9d1e39989bd58885f24ad322ba0', '::1', 1529163710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136333536333b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a373a227375626a656374223b666c6173685f6d6573736167657c733a31323a22446174612044656c65746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d),
('6bc5e61b379c9968a438c429246f9897724dcf07', '::1', 1529159930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135393537353b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('757b593a1224b46d2ce90e28b7a0e1fb57b702bd', '::1', 1529161372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136313234333b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('91f080102a1721321fcdb5d368933eb6dc254c14', '::1', 1529166004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136353935363b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a343a226578616d223b),
('992c54d735b42e7a22844cab604d2751cec86c56', '::1', 1529157784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135373338313b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('a04f376b3dc714d619d5324e46e7f7915dfcb6d3', '::1', 1529162850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136323535303b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a353a22636c617373223b),
('a20602cd5e11b756b3c452e8554caa28ff2fed19', '::1', 1529167083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136373032323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a343a226578616d223b),
('ac0cd23373e39a30861b72ca2e2b971e5e05867c', '::1', 1529161184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136303930313b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('b0748f20045db35ec2413c414b1b8a0601962902', '::1', 1529158333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135383230313b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('b68d6aa9928c7db172fc0bec4f9ee51748222e32', '::1', 1529162939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136323835323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a353a22636c617373223b666c6173685f6d6573736167657c733a32333a2244617461204164646564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d),
('c9674cd8ef61b27ee9eb0bc5e029703035d23e61', '::1', 1529158801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135383537323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('d027a765dfc9299e1da127837219b3aeb07ea96e', '::1', 1529160019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136303030353b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('d93b88c05cadfa0fbd606e69c2e7780a868e279f', '::1', 1529166997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136363731323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a343a226578616d223b),
('dd8c5956190fe17a4b42ca0be7fa66a74bead26e', '::1', 1529165444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136353139323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a31303a22617474656e64616e6365223b),
('e85dc73c89c5f533f3b53ed491f0f7481b92be70', '::1', 1529157863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135373739363b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('eb565f7af79fb5ed87a58e3c4e632951b3575d5e', '::1', 1529159267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135383935353b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('ecbd67915b094ccf37217c9d1291399fbf5e8782', '::1', 1529159538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393135393236393b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a363a22706172656e74223b),
('f6751500dfbc158173374dc7dc24357cda510356', '::1', 1529162228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136323135323b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a353a22636c617373223b),
('f6d8ea59367a10c2483defc94bd3fd16fd231cac', '::1', 1529164669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393136343336353b6163746976655f6c6f67696e7c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6c6f67696e5f66697273746e616d657c733a393a224e69636f64656d7573223b6c6f67696e5f6c6173746e616d657c733a363a224b6172697361223b6c6f67696e5f656d61696c7c733a31383a226e6b6d77616d627340676d61696c2e636f6d223b6c6f67696e5f747970655f69647c733a313a2231223b6c6f67696e5f70726f66696c657c733a313a2231223b6c6f67696e5f747970657c733a353a2261646d696e223b706167655f747970657c733a31333a22636c6173735f726f7574696e65223b);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name_numeric` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `name`, `name_numeric`, `teacher_id`) VALUES
(1, 'STD Two', '2', 2),
(2, 'Class Three', '3', 1),
(4, 'STD 4', '4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_routine`
--

CREATE TABLE `class_routine` (
  `class_routine_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_start_min` int(11) NOT NULL,
  `time_end_min` int(11) NOT NULL,
  `day` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_routine`
--

INSERT INTO `class_routine` (`class_routine_id`, `class_id`, `subject_id`, `time_start`, `time_end`, `time_start_min`, `time_end_min`, `day`) VALUES
(1, 2, 1, 12, 12, 0, 40, 'monday'),
(2, 1, 3, 10, 10, 0, 40, 'tuesday'),
(3, 1, 2, 14, 14, 0, 40, 'tuesday'),
(4, 1, 2, 9, 9, 0, 45, 'monday'),
(5, 1, 4, 10, 11, 40, 20, 'tuesday'),
(6, 1, 4, 9, 9, 0, 40, 'wednesday'),
(7, 1, 3, 10, 11, 20, 0, 'thursday'),
(8, 1, 2, 9, 9, 0, 45, 'thursday'),
(9, 0, 0, 24, 13, 15, 0, 'thursday'),
(10, 1, 4, 24, 13, 15, 0, 'friday'),
(11, 2, 7, 10, 11, 25, 0, 'wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `class_routine_attendance`
--

CREATE TABLE `class_routine_attendance` (
  `class_routine_attendance_id` int(100) NOT NULL,
  `class_routine_id` int(10) NOT NULL,
  `attendance_date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_routine_attendance`
--

INSERT INTO `class_routine_attendance` (`class_routine_attendance_id`, `class_routine_id`, `attendance_date`, `notes`) VALUES
(6, 5, '2018-04-28', 'This is okay'),
(7, 7, '2018-04-26', 'Tested and works'),
(8, 6, '2018-04-25', 'This is working'),
(9, 5, '2018-04-24', 'Well done'),
(10, 2, '2018-04-10', 'Hey. This is cool'),
(11, 3, '2018-04-10', 'Good work'),
(12, 5, '2018-04-10', 'Tested well'),
(13, 8, '2018-04-12', 'Hello Hello');

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE `crud` (
  `crud_id` int(100) NOT NULL,
  `user_access` varchar(20) NOT NULL,
  `feature` varchar(20) NOT NULL,
  `operation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crud`
--

INSERT INTO `crud` (`crud_id`, `user_access`, `feature`, `operation`) VALUES
(2, 'super', 'student', 'create'),
(3, 'super', 'student', 'read'),
(4, 'super', 'student', 'update'),
(5, 'super', 'student', 'delete'),
(6, 'super', 'parent', 'create'),
(7, 'super', 'parent', 'read'),
(8, 'super', 'parent', 'update'),
(9, 'super', 'parent', 'delete'),
(10, 'super', 'activity', 'create'),
(11, 'super', 'activity', 'read'),
(12, 'super', 'activity', 'update'),
(13, 'super', 'activity', 'delete'),
(14, 'super', 'student', 'create'),
(15, 'super', 'student', 'read'),
(16, 'super', 'student', 'update'),
(17, 'super', 'student', 'delete'),
(18, 'super', 'parent', 'create'),
(19, 'super', 'parent', 'read'),
(20, 'super', 'parent', 'update'),
(21, 'super', 'parent', 'delete'),
(22, 'super', 'activity', 'create'),
(23, 'super', 'activity', 'read'),
(24, 'super', 'activity', 'update'),
(25, 'super', 'activity', 'delete'),
(26, 'super', 'class', 'read'),
(27, 'super', 'class', 'delete'),
(28, 'super', 'section', 'read'),
(29, 'super', 'subject', 'create'),
(30, 'super', 'class_routine', 'create'),
(31, 'super', 'class_routine', 'update'),
(32, 'super', 'attendance', 'delete'),
(33, 'super', 'student', 'create'),
(34, 'super', 'student', 'read'),
(35, 'super', 'student', 'update'),
(36, 'super', 'student', 'delete'),
(37, 'super', 'parent', 'create'),
(38, 'super', 'parent', 'read'),
(39, 'super', 'parent', 'update'),
(40, 'super', 'parent', 'delete'),
(41, 'super', 'activity', 'create'),
(42, 'super', 'activity', 'read'),
(43, 'super', 'activity', 'update'),
(44, 'super', 'activity', 'delete'),
(45, 'super', 'teacher', 'create'),
(46, 'super', 'teacher', 'read'),
(47, 'super', 'teacher', 'update'),
(48, 'super', 'teacher', 'delete'),
(49, 'super', 'class', 'create'),
(50, 'super', 'class', 'read'),
(51, 'super', 'class', 'update'),
(52, 'super', 'class', 'delete'),
(53, 'super', 'section', 'create'),
(54, 'super', 'section', 'read'),
(55, 'super', 'section', 'update'),
(56, 'super', 'section', 'delete'),
(57, 'super', 'subject', 'create'),
(58, 'super', 'subject', 'read'),
(59, 'super', 'subject', 'update'),
(60, 'super', 'subject', 'delete'),
(61, 'super', 'class_routine', 'create'),
(62, 'super', 'class_routine', 'read'),
(63, 'super', 'class_routine', 'update'),
(64, 'super', 'class_routine', 'delete'),
(65, 'super', 'attendance', 'create'),
(66, 'super', 'attendance', 'read'),
(67, 'super', 'attendance', 'update'),
(68, 'super', 'attendance', 'delete'),
(69, 'super', 'exam', 'create'),
(70, 'super', 'exam', 'read'),
(71, 'super', 'exam', 'update'),
(72, 'super', 'exam', 'delete'),
(73, 'super', 'grade', 'create'),
(74, 'super', 'grade', 'read'),
(75, 'super', 'grade', 'update'),
(76, 'super', 'grade', 'delete'),
(77, 'super', 'fees_structure', 'create'),
(78, 'super', 'fees_structure', 'read'),
(79, 'super', 'fees_structure', 'update'),
(80, 'super', 'fees_structure', 'delete'),
(81, 'super', 'expense', 'create'),
(82, 'super', 'expense', 'read'),
(83, 'super', 'expense', 'update'),
(84, 'super', 'expense', 'delete'),
(85, 'super', 'payment', 'create'),
(86, 'super', 'payment', 'read'),
(87, 'super', 'payment', 'update'),
(88, 'super', 'payment', 'delete'),
(89, 'super', 'contras', 'create'),
(90, 'super', 'contras', 'read'),
(91, 'super', 'contras', 'update'),
(92, 'super', 'contras', 'delete'),
(93, 'super', 'invoice', 'create'),
(94, 'super', 'invoice', 'read'),
(95, 'super', 'invoice', 'update'),
(96, 'super', 'invoice', 'delete'),
(97, 'super', 'budget', 'create'),
(98, 'super', 'budget', 'read'),
(99, 'super', 'budget', 'update'),
(100, 'super', 'budget', 'delete');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `document_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

CREATE TABLE `dormitory` (
  `dormitory_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_room` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `name`, `date`, `comment`) VALUES
(1, 'Mid Term Term one', '04/30/2018', 'Exam');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(200) NOT NULL,
  `batch_number` int(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  `payee` varchar(200) NOT NULL,
  `t_date` date NOT NULL,
  `method` varchar(20) NOT NULL,
  `cheque_no` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`expense_id`, `batch_number`, `description`, `payee`, `t_date`, `method`, `cheque_no`, `amount`, `timestamp`) VALUES
(9, 170302, 'School Bus Fuel', 'Total', '2017-03-01', '2', 0, '1710.00', '2017-03-06 20:13:24'),
(10, 170303, 'February Salaries', 'Various', '2017-03-02', '1', 0, '25500.00', '2017-03-06 20:23:15'),
(11, 170304, 'February Salary for Primary School', 'Various', '2017-03-02', '2', 0, '68000.00', '2017-03-06 20:23:15'),
(12, 170307, 'February Salaries', 'Various', '2017-03-02', '1', 0, '-25500.00', '2017-03-06 20:23:15'),
(13, 170308, 'School Bus Fuel', 'Total', '2017-03-01', '2', 0, '-1710.00', '2017-03-06 20:13:24'),
(14, 171009, 'Testing', 'Test', '2017-10-06', '1', 0, '1200.00', '0000-00-00 00:00:00'),
(15, 171110, 'Testing', 'Test', '2017-11-10', '2', 1, '12000.00', '0000-00-00 00:00:00'),
(16, 171111, 'Test 3', 'Test ', '2017-11-10', '2', 0, '2500.00', '0000-00-00 00:00:00'),
(17, 180413, 'Salary', 'Peninah', '2018-04-04', '1', 0, '25000.00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `expense_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `income_category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`expense_category_id`, `name`, `income_category_id`) VALUES
(1, 'Transport Expenses', 1),
(2, 'Administration', 6),
(3, 'Examination', 2),
(4, 'Maintainance', 3),
(5, 'Salaries', 6);

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `expense_details_id` int(200) NOT NULL,
  `expense_id` int(200) NOT NULL,
  `qty` int(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `unitcost` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `expense_category_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`expense_details_id`, `expense_id`, `qty`, `description`, `unitcost`, `cost`, `expense_category_id`) VALUES
(14, 9, 10, 'Liters of Petrol', '91.00', '910.00', 4),
(15, 9, 5, 'Liters of Oil', '160.00', '800.00', 4),
(16, 10, 3, 'Nursery Teachers', '8500.00', '25500.00', 1),
(17, 11, 6, 'Primary Section Salary', '10500.00', '63000.00', 1),
(18, 11, 2, 'Helb Loans', '2500.00', '5000.00', 1),
(20, 12, 3, 'Nursery Teachers', '-8500.00', '-25500.00', 1),
(23, 13, 10, 'Liters of Petrol', '-91.00', '-910.00', 4),
(24, 13, 5, 'Liters of Oil', '-1160.00', '-800.00', 4),
(25, 14, 1, 'Test', '1200.00', '1200.00', 1),
(26, 15, 10, 'Test', '1200.00', '12000.00', 1),
(27, 16, 5, 'Test 3', '500.00', '2500.00', 3),
(28, 17, 1, 'Salary', '25000.00', '25000.00', 5),
(29, 0, 1, 'Salary', '-25000.00', '-25000.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fees_structure`
--

CREATE TABLE `fees_structure` (
  `fees_id` int(10) NOT NULL,
  `name` longtext NOT NULL,
  `class_id` int(10) NOT NULL,
  `yr` int(10) NOT NULL,
  `term` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_structure`
--

INSERT INTO `fees_structure` (`fees_id`, `name`, `class_id`, `yr`, `term`) VALUES
(1, 'class_STD_Two_term_One_year_2017', 1, 2017, 1),
(2, 'class_STD_Two_term_Two_year_2017', 1, 2017, 2),
(3, 'class_Class_Three_term_One_year_2018', 2, 2018, 1),
(5, 'class_STD_Two_term_One_year_2018', 1, 2018, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fees_structure_details`
--

CREATE TABLE `fees_structure_details` (
  `detail_id` int(10) NOT NULL,
  `name` longtext NOT NULL,
  `fees_id` int(10) NOT NULL,
  `income_category_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_structure_details`
--

INSERT INTO `fees_structure_details` (`detail_id`, `name`, `fees_id`, `income_category_id`, `amount`) VALUES
(1, 'Tuition', 1, 6, 8500),
(2, 'Science Trip', 1, 4, 4500),
(3, 'Opening Exams', 1, 2, 480),
(4, 'Book Fair (New Students)', 1, 3, 3400),
(5, 'Tution', 3, 6, 7500),
(6, 'Meals', 3, 3, 3200),
(7, 'Field Trips', 3, 4, 4500),
(8, 'Tution', 4, 6, 8400),
(9, 'Academic Day', 4, 4, 45000),
(10, 'Tution', 5, 6, 7500),
(11, 'Academic & Career Development', 5, 4, 4200),
(12, 'Books', 5, 5, 1500),
(13, 'Term 1 Exams', 5, 2, 1800);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade_point` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_upto` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `name`, `grade_point`, `mark_from`, `mark_upto`, `comment`) VALUES
(1, 'Excellent ', 'A', 80, 100, ''),
(2, 'Good', 'B', 60, 79, ''),
(3, 'Fair', 'C', 40, 59, '');

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `income_category_id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `income_categories`
--

INSERT INTO `income_categories` (`income_category_id`, `name`) VALUES
(1, 'Transport Revenue'),
(2, 'Examinations'),
(3, 'Miscellaneous'),
(4, 'Academic Trips'),
(5, 'Maintainance'),
(6, 'Tuition');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `yr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `term` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_due` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount_paid` int(100) NOT NULL,
  `balance` int(100) NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `student_id`, `yr`, `term`, `amount`, `amount_due`, `amount_paid`, `balance`, `creation_timestamp`, `status`) VALUES
(1, 1, '2017', '1', 16880, '16880', 4100, 12780, 1488322800, 'unpaid'),
(4, 4, '2018', '1', 15200, '12700', 7500, 5200, 1525039200, 'unpaid'),
(5, 1, '2018', '1', 15000, '15000', 0, 15000, 1514761200, 'unpaid'),
(6, 2, '2018', '1', 15000, '15000', 0, 15000, 1514761200, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `invoice_details_id` int(200) NOT NULL,
  `invoice_id` int(200) NOT NULL,
  `detail_id` int(200) NOT NULL,
  `amount_due` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`invoice_details_id`, `invoice_id`, `detail_id`, `amount_due`) VALUES
(1, 1, 1, 8500),
(2, 1, 2, 4500),
(3, 1, 3, 480),
(4, 1, 4, 3400),
(5, 4, 5, 5000),
(6, 4, 6, 3200),
(7, 4, 7, 4500),
(8, 5, 10, 7500),
(9, 5, 11, 4200),
(10, 5, 12, 1500),
(11, 5, 13, 1800),
(12, 6, 10, 7500),
(13, 6, 11, 4200),
(14, 6, 12, 1500),
(15, 6, 13, 1800);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bengali` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dutch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `russian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `chinese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `turkish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hungarian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `greek` longtext COLLATE utf8_unicode_ci NOT NULL,
  `german` longtext COLLATE utf8_unicode_ci NOT NULL,
  `italian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `thai` longtext COLLATE utf8_unicode_ci NOT NULL,
  `urdu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hindi` longtext COLLATE utf8_unicode_ci NOT NULL,
  `latin` longtext COLLATE utf8_unicode_ci NOT NULL,
  `indonesian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `japanese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `korean` longtext COLLATE utf8_unicode_ci NOT NULL,
  `swahili` longtext COLLATE utf8_unicode_ci,
  `Kikuyu` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `russian`, `chinese`, `turkish`, `portuguese`, `hungarian`, `french`, `greek`, `german`, `italian`, `thai`, `urdu`, `hindi`, `latin`, `indonesian`, `japanese`, `korean`, `swahili`, `Kikuyu`) VALUES
(1, 'login', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(2, 'forgot_your_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(3, 'admin_dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(4, 'dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(5, 'student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(6, 'admit_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(7, 'admit_bulk_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(8, 'student_information', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(9, 'teacher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(10, 'parents', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(11, 'class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(12, 'manage_classes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(13, 'manage_sections', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(14, 'subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(15, 'class_routine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(16, 'daily_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(17, 'exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(18, 'exam_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(19, 'exam_grades', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(20, 'manage_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(21, 'send_marks_by_sms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(22, 'tabulation_sheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(23, 'accounting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(24, 'fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(25, 'create_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(26, 'student_payments', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(27, 'school_expenses', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(28, 'cash_book', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(29, 'budget', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(30, 'library', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(31, 'transport', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(32, 'dormitory', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(33, 'noticeboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(34, 'message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(35, 'settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(36, 'general_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(37, 'sms_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(38, 'language_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(39, 'school_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(40, 'account', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(41, 'edit_profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(42, 'change_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(43, 'event_schedule', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(44, 'parent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 'Muciari'),
(45, 'attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(46, 'delete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(47, 'cancel', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(48, 'Ok', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(49, 'school_budget', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(50, 'new_budget_item', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(51, 'budget_summary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(52, 'budget_schedules', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(53, 'account_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(54, 'select', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(55, 'description_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(56, 'financial_year', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(57, 'quantity_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(58, 'unit_cost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(59, 'how_often', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(60, 'total_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(61, 'monthly_spread', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(62, 'January', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(63, 'February', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(64, 'March', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(65, 'April', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(66, 'May', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(67, 'June', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(68, 'July', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(69, 'August', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(70, 'September', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(71, 'October', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(72, 'November', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(73, 'December', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(74, 'create', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(75, 'clear_spread', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(76, 'error:_account_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(77, 'error:_description_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(78, 'error:_financial_year_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(79, 'error:_quantity_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(80, 'error:_unit_cost_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(81, 'error:_frequency_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(82, 'error:_total_cost_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(83, 'error:_spread_missing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(84, 'error:_spread_incorrect', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(85, 'unpaid_invoices', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(86, 'cleared_invoices', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(87, 'payment_history', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(88, 'year', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(89, 'fee_structure_total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(90, 'payable_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(91, 'balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(92, 'date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(93, 'options', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(94, 'action', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(95, 'term', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(96, 'method', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(97, 'amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(98, 'expenses', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(99, 'add_new_expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(100, 'title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(101, 'category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(102, 'add_expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(103, 'value_required', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(104, 'select_expense_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(105, 'description', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(106, 'cash', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(107, 'check', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(108, 'card', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(109, 'School_terms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(110, 'add', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(111, 'term_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(112, 'terms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(113, 'income_categories', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(114, 'add_new_income_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(115, 'name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(116, 'expense_categories', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(117, 'add_new_expense_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(118, 'income_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(119, 'add_expense_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(120, 'data_added_successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(121, 'expense_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(122, 'edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(123, 'action_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(124, 'qty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(125, 'unitcost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(126, 'often', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(127, 'total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(128, 'Jan', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(129, 'Feb', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(130, 'Mar', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(131, 'Apr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(132, 'Jun', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(133, 'Jul', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(134, 'Aug', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(135, 'Sep', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(136, 'Oct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(137, 'Nov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(138, 'Dec', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(139, 'edit_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(140, 'delete_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(141, 'edit_budget', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(142, 'quantity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(143, 'create_single_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(144, 'create_mass_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(145, 'invoice_informations', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(146, 'select_class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(147, 'select_class_first', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(148, 'payment_informations', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(149, 'total_payable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(150, 'enter_total_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(151, 'fee_items', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(152, 'full_payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(153, 'item', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(154, 'fee_structure_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(155, 'amount_payable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(156, 'due_payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(157, 'enter_payable_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(158, 'enter_payment_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(159, 'edit_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(160, 'add_new_fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(161, 'add_fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(162, 'add_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(163, 'addmission_form', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(164, 'section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(165, 'roll', 'Admission Number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(166, 'birthday', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(167, 'gender', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(168, 'male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(169, 'female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(170, 'address', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(171, 'phone', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(172, 'email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(173, 'password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(174, 'transport_route', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(175, 'photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(176, 'all_parents', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(177, 'add_new_parent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(178, 'profession', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(179, 'add_parent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(180, 'manage_class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(181, 'class_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(182, 'add_class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(183, 'class_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(184, 'numeric_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(185, 'name_numeric', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(186, 'manage_teacher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(187, 'add_new_teacher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(188, 'add_teacher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(189, 'add_new_section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(190, 'section_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(191, 'nick_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(192, 'add_section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(193, 'add_new_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(194, 'all_students', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(195, 'suspended_students', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(196, 'mark_sheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(197, 'profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(198, 'suspend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(199, 'manage_daily_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(200, 'select_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(201, 'select_month', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(202, 'select_year', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(203, 'manage_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(204, 'manage_transport', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(205, 'transport_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(206, 'add_transport', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(207, 'route_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(208, 'number_of_vehicle', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(209, 'route_fare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(210, 'record_already_exists', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(211, 'view_fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(212, 'clone_fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(213, 'add_item', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(214, 'system_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(215, 'system_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(216, 'system_title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(217, 'paypal_email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(218, 'currency', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(219, 'system_email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(220, 'language', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(221, 'text_align', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(222, 'save', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(223, 'update_product', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(224, 'file', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(225, 'install_update', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(226, 'theme_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(227, 'default', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(228, 'select_theme', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(229, 'select_a_theme_to_make_changes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(230, 'upload_logo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(231, 'upload', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(232, 'add_term', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(233, 'term_title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(234, 'add_income_category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(235, 'invoice_created_successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(236, 'invoice_editted_successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(237, 'take_payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(238, 'view_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(239, 'delete_invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(240, 'payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(241, 'paid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(242, 'payment_successfull', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(243, 'creation_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(244, 'status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(245, 'payment_to', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(246, 'bill_to', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(247, 'total_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(248, 'paid_amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(249, 'due', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(250, 'invoice_breakdown', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(251, 'payee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(252, 'cost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(253, 'add_row', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(254, 'student_payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(255, 'bank', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(256, 'reference', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(257, 'transaction_type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(258, 'income', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(259, 'expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(260, 'balance_brought_forward', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(261, 'contra_entries', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(262, 'new_contra_entry', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(263, 'entry_type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(264, 'to_bank', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(265, 'to_cash', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(266, 'transact', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(267, 'Choose', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(268, 'edit_expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(269, 'update', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(270, 'data_updated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(271, 'account_balances', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(272, 'account_opening_balances', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(273, 'add/_Edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(274, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(275, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(276, 'view_history', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(277, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(278, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(279, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(280, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(281, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(282, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(283, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(284, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(285, 'add/_edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(286, 'batch_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(287, 'view', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(288, 'reverse', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(289, 'view_expense_batch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(290, 'expense_reversed_successful', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(291, 'expense_reversal:_batch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(292, 'reversal:_batch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(293, 'record_reversed_successful', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(294, 'actual_incomes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(295, 'receipt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(296, 'serial', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(297, 'payment_receipt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(298, 'student_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(299, 'admission_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(300, 'receipt_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(301, 'total_amount_due', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(302, 'previously_paid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(303, 'amount_due', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(304, 'reciept_total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(305, 'fees_balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(306, 'receipt_total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(307, 'fees_due', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(308, 'fees_paid_to_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(309, 'view_receipt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(310, 'download_receipt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(311, 'manage_library_books', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(312, 'book_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(313, 'add_book', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(314, 'book_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(315, 'author', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(316, 'price', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(317, 'available', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(318, 'unavailable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(319, 'print_receipt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(320, 'manage_noticeboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(321, 'noticeboard_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(322, 'add_noticeboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(323, 'notice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(324, 'add_notice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(325, 'send_sms_to_all', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(326, 'yes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(327, 'no', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(328, 'sms_service_not_activated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(329, 'private_messaging', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(330, 'messages', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(331, 'new_message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(332, 'manage_profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(333, 'update_profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(334, 'current_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(335, 'new_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(336, 'confirm_new_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(337, 'manage_class_routine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(338, 'class_routine_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(339, 'add_class_routine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(340, 'day', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(341, 'starting_time', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(342, 'hour', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(343, 'minutes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(344, 'ending_time', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(345, 'manage_subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(346, 'subject_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(347, 'add_subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(348, 'subject_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(349, 'financial_report', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(350, 'revenue_report', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(351, 'opening_balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(352, 'month_income', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(353, 'month_expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(354, 'ending_balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(355, 'revenue_report_for', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(356, 'summary_by_expense_categories', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(357, 'summary_by_income_categories', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(358, 'theme_selected', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(359, 'teacher_dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(360, 'study_material', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(361, 'student_dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(362, 'exam_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(363, 'school_budget_for_year', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(364, 'school_budget_for_year_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(365, 'students', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(366, 'edit_transport', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(367, 'edit_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(368, 'edit_class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(369, 'beneficiaries', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(370, 'beneficiary_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(371, 'edit_fees_structure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(372, 'data_deleted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(373, 'select_a_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(374, 'cheque', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(375, 'cheque_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(376, 'view_parent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(377, 'parent_activity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(378, 'parents_activity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(379, 'add_activity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(380, 'activity_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(381, 'start_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(382, 'end_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(383, 'add_parents', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(384, 'search_parents_by', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(385, 'All', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(386, 'go', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(387, 'activity_details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(388, 'manage_language', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(389, 'language_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(390, 'add_phrase', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(391, 'add_language', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(392, 'option', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(393, 'edit_phrase', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(394, 'delete_language', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(395, 'phrase', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(396, 'update_phrase', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(397, 'add_bulk_student', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(398, 'student_bulk_add_form', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(399, 'select_excel_file', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(400, 'upload_and_import', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(401, 'service_is_disabled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(402, 'present', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(403, 'manage_exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(404, 'add_exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(405, 'exam_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(406, 'comment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(407, 'manage_grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(408, 'grade_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(409, 'add_grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(410, 'grade_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(411, 'grade_point', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(412, 'mark_from', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(413, 'mark_upto', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(414, 'edit_grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(415, 'manage_exam_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(416, 'select_exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(417, 'select_subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(418, 'select_an_exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(419, 'select_a_class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(420, 'mark_obtained', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(421, 'update_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(422, 'send_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(423, 'select_receiver', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(424, 'view_tabulation_sheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(425, 'subjects', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(426, 'average_grade_point', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(427, 'print_tabulation_sheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(428, 'select_all', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(429, 'select_none', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(430, 'manage_dormitory', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(431, 'dormitory_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(432, 'add_dormitory', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(433, 'dormitory_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `russian`, `chinese`, `turkish`, `portuguese`, `hungarian`, `french`, `greek`, `german`, `italian`, `thai`, `urdu`, `hindi`, `latin`, `indonesian`, `japanese`, `korean`, `swahili`, `Kikuyu`) VALUES
(434, 'number_of_room', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(435, 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(436, 'write_new_message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(437, 'recipient', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(438, 'select_a_user', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(439, 'write_your_message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(440, 'send', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(441, 'message_sent!', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(442, 'reply_message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(443, 'select_a_service', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(444, 'not_selected', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(445, 'disabled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(446, 'clickatell_username', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(447, 'clickatell_password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(448, 'clickatell_api_id', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(449, 'twilio_account', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(450, 'authentication_token', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(451, 'registered_phone_number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(452, 'settings_updated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
(453, 'download', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(454, 'marksheet_for', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(455, 'total_marks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(456, 'print_marksheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(457, 'manage_invoice/payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(458, 'invoice/payment_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(459, 'mark_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(460, 'parent_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(461, 'mark', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(462, 'attended', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(463, 'absent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(464, 'not_attending', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(465, 'show/mark_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(466, 'show_or_mark_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(467, 'teacher_list', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(468, 'student_marksheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(469, 'add_study_material', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(470, 'file_type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(471, 'select_file_type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(472, 'image', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(473, 'doc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(474, 'pdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(475, 'excel', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(476, 'other', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(477, 'show_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(478, 'parent_dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(479, 'total_mark', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(480, 'edit_subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(481, 'mark_attended', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(482, 'class_routine_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(483, 'attendance_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(484, 'notes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(485, 'attendance_created', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(486, 'attendance_exists', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(487, 'attendance_updated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(488, 'routine_date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(489, 'search_routine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(490, 'session(s)_attended_today', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(491, 'no_session_attended_today', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(492, 'edit_class_routine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(493, 'edit_teacher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(494, 'sex', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(495, 'administrators', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(496, 'manage_administrator', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(497, 'add_new_administrator', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(498, 'add_administrator', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(499, 'relationship', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(500, 'care_type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(501, 'primary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(502, 'secondary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(503, 'care_relationship', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(504, 'add_relationship', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(505, 'record_added', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(506, 'duplicate_name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(507, 'record_deleted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(508, 'edit_relationship', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(509, 'duplicate_record', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(510, 'record_edited', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(511, 'none', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(512, 'other_caregivers', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(513, 'edit_parent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(514, 'assign_beneficiary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(515, 'assign_beneficiaries', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(516, 'crud_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(517, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(518, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(519, 'user_access', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(520, 'feature', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(521, 'read', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(522, 'super_administrator', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(523, 'manager', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(524, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(525, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(526, 'super_admin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(527, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(528, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(529, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(530, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(531, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(532, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(533, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(534, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(535, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(536, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(537, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(538, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(539, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(540, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(541, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(542, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(543, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(544, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(545, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(546, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(547, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(548, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(549, 'activity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(550, 'grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(551, 'contras', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(552, 'invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(553, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(554, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(555, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(556, 'record', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(557, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(558, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(559, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(560, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(561, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(562, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(563, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(564, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(565, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(566, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(567, 'admin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(568, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(569, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(570, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(571, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(572, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(573, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(574, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(575, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(576, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(577, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(578, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(579, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(580, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(581, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(582, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(583, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(584, 'settings_saved', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(585, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(586, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(587, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(588, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(589, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(590, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(591, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(592, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(593, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(594, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(595, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(596, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(597, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(598, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(599, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(600, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(601, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(602, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(603, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(604, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(605, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(606, 'level', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(607, 'edit_administrator', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(608, 'super', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(609, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(610, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(611, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(612, 'CRUD_settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(613, 'no_items_found', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(614, 'process_failure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(615, 'student_suspended', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(616, 'unsuspend_', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(617, 'success', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(618, 'targeted_participants', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(619, 'back', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(620, 'print_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(621, 'activity_register', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(622, 'print_activty_attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(623, 'edit_exam', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_type`
--

CREATE TABLE `login_type` (
  `login_type_id` int(100) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_type`
--

INSERT INTO `login_type` (`login_type_id`, `name`) VALUES
(1, 'admin'),
(2, 'teacher'),
(3, 'student'),
(4, 'parent');

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_obtained` int(11) NOT NULL DEFAULT '0',
  `mark_total` int(11) NOT NULL DEFAULT '100',
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`mark_id`, `student_id`, `subject_id`, `class_id`, `exam_id`, `mark_obtained`, `mark_total`, `comment`) VALUES
(1, 4, 1, 2, 1, 72, 100, 'Good Work'),
(2, 1, 2, 1, 1, 0, 100, ''),
(3, 2, 2, 1, 1, 0, 100, ''),
(4, 3, 2, 1, 1, 0, 100, ''),
(5, 4, 7, 2, 1, 60, 100, 'Good'),
(6, 11, 7, 2, 1, 65, 100, 'Good'),
(7, 12, 7, 2, 1, 82, 100, 'Excellent'),
(8, 13, 7, 2, 1, 71, 100, 'Very Good'),
(9, 11, 1, 2, 1, 0, 100, ''),
(10, 12, 1, 2, 1, 0, 100, ''),
(11, 13, 1, 2, 1, 0, 100, '');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_thread_code`, `message`, `sender`, `timestamp`, `read_status`) VALUES
(1, '8cbce2aa38abde1', 'Hey', 'admin-1', '1522852035', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `message_thread_code`, `sender`, `reciever`, `last_message_timestamp`) VALUES
(1, '8cbce2aa38abde1', 'admin-1', 'parent-3', '');

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `noticeboard`
--

INSERT INTO `noticeboard` (`notice_id`, `notice_title`, `notice`, `create_timestamp`) VALUES
(1, 'Academic Day', 'Academic Day', 1524002400);

-- --------------------------------------------------------

--
-- Table structure for table `opening_balance`
--

CREATE TABLE `opening_balance` (
  `opening_balance_id` int(50) NOT NULL,
  `income_category_id` int(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opening_balance`
--

INSERT INTO `opening_balance` (`opening_balance_id`, `income_category_id`, `amount`) VALUES
(1, 1, '407870.23');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `user_id` tinyint(10) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `relationship_id` int(5) NOT NULL,
  `care_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `profession` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `user_id`, `name`, `email`, `phone`, `address`, `relationship_id`, `care_type`, `profession`) VALUES
(1, 0, 'Mulandi Kyalo', 'JMulandi1@gmail.com', '0711808071', 'Nairobi', 1, 'primary', 'Businessman'),
(2, 0, 'Mwambire Karisa', 'mwambire2017@gmail.com', '072267525', 'Kiserian', 5, 'primary', 'Teacher'),
(3, 0, 'Maina Maina', 'MEgelan@gmail.com', '07124345654', '80 Ngong', 3, 'secondary', 'Teacher'),
(4, 0, 'John Njugo', 'JNjugo2017@gmail.com', '0711876542', '1056 Karen Nairobi', 1, 'primary', 'Driver'),
(5, 0, 'Mary Otieno', 'MOtieno12@gmail.com', '0711909076', '54 Malindi', 2, 'secondary', 'Business Woman'),
(6, 0, 'Hellen Kamau', 'HKamau@yahoo.com', '0711876542', '45 Nairobi', 6, 'secondary', 'Air Hostess'),
(7, 0, 'Bitange Joseph', 'BJosey@gmail.com', '', '', 5, 'secondary', 'Journalist'),
(8, 0, 'Martina Chengo Garama', 'machess@gmail.com', '075787578', '80788', 2, 'primary', 'Air Hostess');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `batch_number` int(10) NOT NULL,
  `serial` int(10) NOT NULL,
  `detail_id` int(100) NOT NULL,
  `yr` int(10) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `term` int(5) NOT NULL,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `batch_number`, `serial`, `detail_id`, `yr`, `invoice_id`, `student_id`, `method`, `term`, `amount`, `timestamp`) VALUES
(19, 180412, 3, 6, 2018, 4, 4, '1', 1, '1500', '1522792800'),
(18, 180412, 3, 5, 2018, 4, 4, '1', 1, '4000', '1522792800'),
(17, 170305, 2, 3, 2017, 1, 1, '2', 1, '200', '1488495600'),
(15, 170305, 2, 1, 2017, 1, 1, '2', 1, '1800', '1488495600'),
(14, 170301, 1, 2, 2017, 1, 1, '1', 1, '500', '1488322800'),
(13, 170301, 1, 1, 2017, 1, 1, '1', 1, '1000', '1488322800'),
(16, 170305, 2, 2, 2017, 1, 1, '2', 1, '600', '1488495600'),
(20, 180412, 3, 7, 2018, 4, 4, '1', 1, '2000', '1522792800');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE `relationship` (
  `relationship_id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`relationship_id`, `name`) VALUES
(1, 'Father'),
(2, 'Mother'),
(3, 'Brother'),
(4, 'Sister'),
(5, 'Uncle'),
(6, 'Aunt');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `nick_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `name`, `nick_name`, `class_id`, `teacher_id`) VALUES
(1, 'Judah', 'Judah', 2, 1),
(2, 'Siloam', 'Siloam', 2, 1),
(3, 'Eastern', 'E', 1, 2),
(5, 'West', 'W', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'School Management System'),
(2, 'system_title', 'School Management System'),
(3, 'address', '80-80200 Malindi'),
(4, 'phone', '254764837462'),
(5, 'paypal_email', 'admin@techsys.com'),
(6, 'currency', 'Kes.'),
(7, 'system_email', 'mwambirenicodemus2017@gmail.com'),
(20, 'active_sms_service', 'disabled'),
(11, 'language', 'english'),
(12, 'text_align', 'left-to-right'),
(13, 'clickatell_user', ''),
(14, 'clickatell_password', ''),
(15, 'clickatell_api_id', ''),
(16, 'skin_colour', 'default'),
(17, 'twilio_account_sid', ''),
(18, 'twilio_auth_token', ''),
(19, 'twilio_sender_phone_number', ''),
(21, 'system_start_date', '2017-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `user_id` tinyint(10) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `religion` longtext COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `father_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mother_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `roll` longtext COLLATE utf8_unicode_ci NOT NULL,
  `transport_id` int(11) NOT NULL,
  `dormitory_id` int(11) NOT NULL,
  `dormitory_room_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `user_id`, `name`, `birthday`, `sex`, `religion`, `blood_group`, `address`, `phone`, `email`, `father_name`, `mother_name`, `class_id`, `section_id`, `parent_id`, `roll`, `transport_id`, `dormitory_id`, `dormitory_room_number`, `active`) VALUES
(1, 0, 'James Mulandi', '10/25/2005', 'male', '', '', 'Nairobi', '', 'nkmwambs@gmail.com', '', '', '1', 0, 1, 'VGS/01/2017', 0, 0, '', 1),
(2, 0, 'Nicodemus Karisa', '06/22/2009', 'male', '', '', 'Kiserian', '0722654372', 'mwambirekarisa@gmail.com', '', '', '1', 0, 2, 'VGC/24/2017', 1, 0, '', 1),
(3, 0, 'Joyce Ted', '02/02/2009', '', '', '', '2', '0722654376', 'nkmwambs@gmail.com', '', '', '1', 0, 1, 'VGS/242/2017', 0, 0, '', 1),
(4, 0, 'Beatrice Maina', '01/30/2014', 'female', '', '', '50', '0770978233', 'MEgelan@gmail.com', '', '', '2', 1, 3, 'BM/12/2018', 1, 0, '', 1),
(11, 0, 'Ben Karanja', '03/11/2010', 'male', '', '', '', '', '', '', '', '2', 1, 4, '34242', 0, 0, '', 1),
(12, 0, 'Brian Njogu', '', '', '', '', '', '', '', '', '', '2', 2, 4, '32423', 0, 0, '', 1),
(13, 0, 'Blessing Mvera', '06/04/2009', 'female', '', '', '1945 Karen Nairobi', '0711909076', 'nkmwambs@gmail.com', '', '', '2', 2, 2, '24542', 0, 0, '', 1),
(14, 0, 'Mapenzi Karani', '40211', 'female', '', '', '7672', '711897242', 'm.karani@gmail.com', '', '', '1', 0, 0, '543342', 0, 0, '', 0),
(15, 0, 'James Baya', '40731', 'male', '', '', '542', '723447845', 'j.baya@gmail.com', '', '', '1', 0, 0, '533234', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `name`, `class_id`, `teacher_id`) VALUES
(1, 'English', 2, 1),
(2, 'Maths', 1, 1),
(3, 'English', 1, 2),
(4, 'Science', 1, 2),
(6, 'Swahili', 1, 1),
(7, 'Swahili', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `user_id` tinyint(10) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `religion` longtext COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `user_id`, `name`, `birthday`, `sex`, `religion`, `blood_group`, `address`, `phone`, `email`) VALUES
(1, 0, 'Patty Kamau Karanja', '02/23/1981', 'female', '', '', 'Nairobi', '07206876543', 'purityKamau2018@gmail.com'),
(2, 0, 'Macmillan Ben ', '06/12/1979', 'male', '', '', '122 Nairobi', '0728367826', 'macben@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `terms_id` int(100) NOT NULL,
  `term_number` int(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`terms_id`, `term_number`, `name`) VALUES
(1, 1, 'One'),
(2, 2, 'Two'),
(3, 3, 'Three');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL,
  `route_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_vehicle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `route_fare` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`transport_id`, `route_name`, `number_of_vehicle`, `description`, `route_fare`) VALUES
(1, 'Ngong-Kiserian', '2', 'Term Payment', '7500');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(100) NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `login_type_id` tinyint(10) NOT NULL,
  `profile_id` tinyint(5) NOT NULL,
  `auth` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `login_type_id`, `profile_id`, `auth`) VALUES
(1, 'Nicodemus', 'Karisa', 'nkmwambs@gmail.com', 'compassion12', '254711808071', 1, 1, 1),
(2, 'Betty', 'Kanze', 'betty.kanze@gmail.com', 'compassion12', '254711808071', 2, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accounts_id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `activity_attendance`
--
ALTER TABLE `activity_attendance`
  ADD PRIMARY KEY (`activity_attendance_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`budget_id`);

--
-- Indexes for table `budget_schedule`
--
ALTER TABLE `budget_schedule`
  ADD PRIMARY KEY (`budget_schedule_id`);

--
-- Indexes for table `caregiver`
--
ALTER TABLE `caregiver`
  ADD PRIMARY KEY (`caregiver_id`);

--
-- Indexes for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`cashbook_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_routine`
--
ALTER TABLE `class_routine`
  ADD PRIMARY KEY (`class_routine_id`);

--
-- Indexes for table `class_routine_attendance`
--
ALTER TABLE `class_routine_attendance`
  ADD PRIMARY KEY (`class_routine_attendance_id`);

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`crud_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `dormitory`
--
ALTER TABLE `dormitory`
  ADD PRIMARY KEY (`dormitory_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`expense_category_id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`expense_details_id`);

--
-- Indexes for table `fees_structure`
--
ALTER TABLE `fees_structure`
  ADD PRIMARY KEY (`fees_id`);

--
-- Indexes for table `fees_structure_details`
--
ALTER TABLE `fees_structure_details`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`income_category_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`invoice_details_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `login_type`
--
ALTER TABLE `login_type`
  ADD PRIMARY KEY (`login_type_id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`mark_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `opening_balance`
--
ALTER TABLE `opening_balance`
  ADD PRIMARY KEY (`opening_balance_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `relationship`
--
ALTER TABLE `relationship`
  ADD PRIMARY KEY (`relationship_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`terms_id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accounts_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `activity_attendance`
--
ALTER TABLE `activity_attendance`
  MODIFY `activity_attendance_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `budget_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `budget_schedule`
--
ALTER TABLE `budget_schedule`
  MODIFY `budget_schedule_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `caregiver`
--
ALTER TABLE `caregiver`
  MODIFY `caregiver_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `cashbook_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `class_routine`
--
ALTER TABLE `class_routine`
  MODIFY `class_routine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `class_routine_attendance`
--
ALTER TABLE `class_routine_attendance`
  MODIFY `class_routine_attendance_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `crud_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory`
--
ALTER TABLE `dormitory`
  MODIFY `dormitory_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `expense_details_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `fees_structure`
--
ALTER TABLE `fees_structure`
  MODIFY `fees_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fees_structure_details`
--
ALTER TABLE `fees_structure_details`
  MODIFY `detail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `income_category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `invoice_details_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;
--
-- AUTO_INCREMENT for table `login_type`
--
ALTER TABLE `login_type`
  MODIFY `login_type_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `opening_balance`
--
ALTER TABLE `opening_balance`
  MODIFY `opening_balance_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `relationship`
--
ALTER TABLE `relationship`
  MODIFY `relationship_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `terms_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
