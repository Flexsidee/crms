-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2024 at 09:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action_type_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `action_type`
--

CREATE TABLE `action_type` (
  `action_type_id` int(11) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `action_type`
--

INSERT INTO `action_type` (`action_type_id`, `action_name`, `timestamp`) VALUES
(1, 'Added course', '2024-04-28 04:45:37'),
(2, 'Added Student', '2024-04-28 04:45:38'),
(3, 'Added Lecturer', '2024-04-28 04:45:38'),
(4, 'Assign lecturer to course', '2024-04-28 04:45:38'),
(5, 'Approved result', '2024-04-28 04:45:38'),
(6, 'Change student password', '2024-04-28 04:45:38'),
(7, 'Changed lecturer password', '2024-04-28 04:45:38'),
(8, 'Make admin', '2024-04-28 04:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `title_id` int(11) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `othername` varchar(25) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `time_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `user_id`, `role_id`, `staff_id`, `title_id`, `surname`, `firstname`, `othername`, `gender_id`, `tel`, `email`, `time_created`) VALUES
(1, 201, 2, 'staff0699', 1, 'Safell', 'Natalie', 'Lianne', 2, '+86 232 112 8753', 'lsafell0@answers.com', '2023-11-07 20:56:09'),
(2, 202, 2, 'staff3253', 5, 'McEwan', 'Teirtza', 'Nikola', 1, '+62 385 568 1579', 'nmcewan1@msu.edu', '2024-03-08 16:18:46'),
(3, 203, 1, 'staff6400', 1, 'Elvin', 'Keith', 'Wilhelmine', 2, '+48 250 875 7640', 'welvin2@smugmug.com', '2024-02-25 15:38:40'),
(4, 204, 2, 'staff7427', 6, 'Dinsmore', 'Gib', 'Burr', 2, '+351 622 420 7523', 'bdinsmore3@barnesandnoble.com', '2023-10-22 20:54:05'),
(5, 205, 2, 'staff6363', 3, 'Oliphant', 'Hank', 'Ivar', 2, '+1 346 990 9638', 'ioliphant4@samsung.com', '2024-02-22 22:00:46'),
(6, 206, 1, 'staff4575', 4, 'Poulett', 'Willette', 'Addie', 2, '+62 312 751 6428', 'apoulett5@edublogs.org', '2024-02-14 20:06:33'),
(7, 207, 2, 'staff7607', 1, 'Pentlow', 'Mariellen', 'Terri', 1, '+86 893 910 2919', 'tpentlow6@boston.com', '2024-02-25 18:06:58'),
(8, 208, 1, 'staff3901', 2, 'Lismore', 'Johnny', 'Mychal', 2, '+63 137 528 0201', 'mlismore7@spotify.com', '2023-10-16 08:06:08'),
(9, 209, 2, 'staff5744', 5, 'Trobridge', 'Dino', 'Myles', 2, '+62 721 414 4863', 'mtrobridge8@geocities.com', '2024-01-05 09:59:37'),
(10, 210, 2, 'staff9210', 5, 'Cicci', 'Quinton', 'Humbert', 2, '+7 819 664 3124', 'hcicci9@boston.com', '2023-07-06 20:24:12'),
(11, 1, 1, 'staff0001', 1, 'Odeniyi', 'Adeniyi', 'Uche', 1, '09000000000', 'odeniyi.adeniyi@calebuniversity.edu.ng', '2024-05-09 15:26:52');

-- --------------------------------------------------------

--
-- Stand-in structure for view `admins_view`
-- (See below for the actual view)
--
CREATE TABLE `admins_view` (
`admin_id` int(11)
,`user_id` int(11)
,`staff_id` varchar(10)
,`role_name` varchar(15)
,`title_alias` varchar(10)
,`gender_name` varchar(10)
,`surname` varchar(25)
,`firstname` varchar(25)
,`othername` varchar(25)
,`email` varchar(50)
,`tel` varchar(20)
,`time_created` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_title` varchar(200) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_unit` int(11) NOT NULL,
  `requirements` varchar(2) NOT NULL,
  `department_id` int(11) NOT NULL,
  `semester_id` int(1) NOT NULL,
  `level_id` int(1) NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_title`, `course_code`, `course_unit`, `requirements`, `department_id`, `semester_id`, `level_id`, `time_added`) VALUES
(1, 'erat vestibulum sed magna', 'lvj 222', 2, 'C', 4, 2, 3, '2023-06-22 19:22:48'),
(2, 'magnis dis parturient', 'dor 589', 2, 'E', 3, 1, 4, '2024-02-17 06:46:42'),
(3, 'at turpis donec posuere', 'fbc 760', 3, 'E', 4, 2, 1, '2023-08-26 06:24:41'),
(4, 'vivamus in felis', 'uwo 418', 1, 'E', 5, 1, 4, '2023-06-28 15:44:58'),
(5, 'quam suspendisse potenti nullam', 'orl 055', 1, 'C', 2, 1, 3, '2023-07-16 03:08:22'),
(6, 'iaculis justo in', 'ywt 049', 1, '|', 5, 1, 2, '2023-07-13 12:33:01'),
(7, 'blandit lacinia erat vestibulum sed', 'lfk 361', 2, 'C', 5, 1, 3, '2024-01-19 18:08:18'),
(8, 'mattis nibh ligula nec', 'icn 877', 3, 'E', 5, 1, 4, '2024-02-15 20:21:11'),
(9, 'elit proin risus praesent lectus', 'epb 395', 2, '|', 5, 1, 4, '2023-11-06 19:19:19'),
(10, 'amet erat nulla tempus', 'ixc 167', 1, 'C', 4, 2, 3, '2023-07-01 10:20:27'),
(11, 'cubilia curae donec', 'hmn 656', 2, 'C', 1, 2, 3, '2023-07-26 13:08:25'),
(12, 'non interdum in ante vestibulum', 'ukb 993', 2, '|', 1, 1, 3, '2024-04-24 02:44:24'),
(13, 'metus aenean fermentum donec', 'isl 593', 3, 'C', 2, 1, 3, '2023-11-20 13:59:53'),
(14, 'nulla neque libero convallis', 'ajw 385', 3, '|', 5, 1, 2, '2023-11-08 00:56:26'),
(15, 'duis bibendum felis sed interdum', 'szl 785', 1, 'C', 1, 2, 3, '2024-01-05 00:05:21'),
(16, 'in tempor turpis nec euismod', 'fwg 991', 3, '|', 3, 2, 2, '2023-07-05 15:36:42'),
(17, 'tortor sollicitudin mi sit amet', 'rve 799', 1, '|', 4, 2, 2, '2023-12-28 23:13:12'),
(18, 'nunc vestibulum ante', 'dyb 451', 2, 'E', 1, 1, 3, '2023-05-14 06:48:54'),
(19, 'nec dui luctus rutrum nulla', 'svd 430', 3, '|', 5, 1, 1, '2024-02-02 19:03:33'),
(20, 'sociis natoque penatibus et magnis dis', 'bgx 017', 3, 'E', 2, 1, 4, '2024-01-21 18:21:21'),
(21, 'purus phasellus in felis donec semper', 'jye 054', 2, 'E', 4, 1, 1, '2023-09-13 06:33:56'),
(22, 'mauris viverra diam', 'qir 244', 3, 'C', 5, 2, 1, '2024-01-04 23:49:37'),
(23, 'ante vestibulum ante ipsum primis in', 'euc 880', 2, '|', 4, 1, 1, '2023-12-01 20:03:08'),
(24, 'luctus rutrum nulla tellus', 'hef 401', 3, 'C', 3, 2, 4, '2023-10-16 08:32:53'),
(25, 'eget nunc donec', 'yuk 563', 1, 'E', 1, 1, 3, '2023-10-21 16:37:42'),
(26, 'pede ullamcorper augue a', 'rnc 474', 1, '|', 2, 2, 3, '2023-11-16 07:09:46'),
(27, 'orci nullam molestie nibh', 'vow 016', 2, 'E', 1, 2, 4, '2024-02-22 18:01:03'),
(28, 'amet erat nulla tempus vivamus in', 'edk 191', 3, 'E', 4, 1, 4, '2024-02-01 06:40:00'),
(29, 'id mauris vulputate elementum nullam', 'kjp 193', 1, 'C', 3, 2, 1, '2024-01-11 04:44:00'),
(30, 'sapien varius ut', 'fyf 963', 1, '|', 2, 1, 2, '2023-08-11 00:30:02'),
(31, 'semper interdum mauris ullamcorper', 'oyw 422', 1, 'C', 1, 2, 1, '2024-03-26 20:26:50'),
(32, 'pellentesque volutpat dui', 'mej 003', 2, '|', 3, 2, 1, '2023-10-07 17:55:50'),
(33, 'quis augue luctus', 'vbs 157', 3, 'E', 4, 1, 3, '2024-04-18 02:52:50'),
(34, 'amet eleifend pede libero quis', 'yey 698', 3, 'C', 5, 2, 2, '2024-04-05 17:06:36'),
(35, 'id lobortis convallis tortor risus dapibus', 'zpq 134', 2, 'E', 3, 1, 3, '2024-04-26 16:54:10'),
(36, 'ultrices phasellus id sapien in sapien', 'mwx 031', 3, '|', 5, 2, 3, '2023-11-25 21:46:13'),
(37, 'ut massa quis augue luctus tincidunt', 'gws 806', 3, 'E', 1, 2, 4, '2024-03-11 12:20:03'),
(38, 'non sodales sed tincidunt eu felis', 'bnn 660', 3, 'E', 1, 1, 3, '2023-05-24 18:57:58'),
(39, 'amet consectetuer adipiscing elit proin risus', 'uwj 764', 3, 'E', 4, 2, 1, '2023-12-16 17:06:38'),
(40, 'justo lacinia eget tincidunt eget tempus', 'gor 079', 3, 'E', 2, 1, 3, '2024-04-07 01:01:11'),
(41, 'potenti cras in', 'xte 766', 1, 'E', 5, 2, 1, '2023-10-27 02:48:58'),
(42, 'etiam vel augue vestibulum rutrum rutrum', 'pfh 205', 3, '|', 5, 1, 2, '2023-08-07 14:47:11'),
(43, 'luctus tincidunt nulla', 'asz 000', 1, '|', 3, 1, 4, '2023-07-01 23:52:51'),
(44, 'tempor turpis nec euismod', 'zfi 109', 2, 'E', 3, 2, 2, '2023-09-26 12:52:39'),
(45, 'sapien iaculis congue', 'uni 504', 3, '|', 1, 1, 2, '2024-02-28 02:14:50'),
(46, 'proin eu mi', 'xhk 088', 2, 'E', 5, 1, 2, '2023-08-13 03:53:10'),
(47, 'dictumst morbi vestibulum velit id', 'kpa 595', 3, 'C', 1, 1, 4, '2024-03-26 20:13:03'),
(48, 'proin at turpis a', 'vmc 007', 2, '|', 1, 1, 4, '2023-05-12 10:56:55'),
(49, 'et tempus semper', 'moo 146', 2, 'E', 3, 2, 3, '2023-09-25 09:34:37'),
(50, 'pretium iaculis justo in', 'xlw 314', 1, 'C', 1, 1, 4, '2024-01-18 19:23:05'),
(51, 'vitae mattis nibh', 'lrj 764', 2, '|', 2, 2, 4, '2023-08-01 06:08:22'),
(52, 'massa donec dapibus duis', 'kqn 273', 1, 'E', 3, 1, 4, '2024-03-06 03:55:30'),
(53, 'dis parturient montes nascetur', 'mgx 484', 1, 'C', 3, 2, 3, '2023-12-27 04:26:09'),
(54, 'non quam nec dui luctus rutrum', 'hpu 135', 2, '|', 1, 2, 3, '2023-11-14 03:47:57'),
(55, 'quam sapien varius ut', 'mpj 940', 3, 'E', 2, 1, 1, '2024-02-03 19:32:26'),
(56, 'in lectus pellentesque at nulla suspendisse', 'udk 422', 2, '|', 3, 1, 2, '2023-05-23 18:46:59'),
(57, 'turpis elementum ligula vehicula consequat morbi', 'xrm 387', 1, '|', 1, 1, 3, '2023-07-07 04:02:21'),
(58, 'mauris sit amet', 'ulh 915', 1, 'E', 4, 2, 2, '2023-11-02 07:55:45'),
(59, 'convallis eget eleifend luctus', 'qlt 663', 3, '|', 5, 1, 4, '2024-02-06 17:22:12'),
(60, 'sagittis sapien cum sociis', 'ufn 800', 3, 'E', 3, 1, 3, '2023-07-25 13:27:55'),
(61, 'rutrum neque aenean auctor gravida', 'aub 996', 1, 'C', 1, 2, 1, '2024-03-09 23:00:16'),
(62, 'penatibus et magnis dis', 'utz 884', 1, 'C', 1, 1, 4, '2023-09-21 07:59:42'),
(63, 'vel pede morbi porttitor', 'cye 337', 1, '|', 3, 1, 2, '2024-02-18 04:32:32'),
(64, 'diam in magna bibendum imperdiet nullam', 'bzd 079', 3, '|', 4, 2, 3, '2023-11-19 23:36:51'),
(65, 'mollis molestie lorem', 'hvr 305', 1, '|', 4, 2, 2, '2023-08-17 00:11:27'),
(66, 'diam erat fermentum justo nec', 'pdr 550', 2, '|', 4, 1, 1, '2023-11-23 09:57:27'),
(67, 'ac neque duis bibendum morbi non', 'mzu 235', 1, 'C', 5, 1, 4, '2023-12-18 22:43:38'),
(68, 'dictumst etiam faucibus cursus urna ut', 'vtl 514', 3, '|', 2, 2, 1, '2023-10-01 00:48:24'),
(69, 'amet nunc viverra dapibus nulla', 'pgd 842', 2, 'E', 3, 2, 3, '2024-01-11 13:16:27'),
(70, 'tincidunt lacus at', 'hqf 046', 2, 'E', 5, 1, 3, '2023-12-26 13:27:12'),
(71, 'dictumst morbi vestibulum', 'zrb 820', 1, 'E', 2, 1, 2, '2024-04-18 01:28:33'),
(72, 'sapien non mi integer ac', 'kpj 112', 2, 'E', 2, 1, 1, '2023-12-08 02:05:35'),
(73, 'pretium quis lectus suspendisse', 'vlr 951', 2, 'E', 5, 2, 4, '2024-03-18 02:08:18'),
(74, 'massa id lobortis convallis', 'deq 374', 2, 'C', 4, 2, 1, '2023-06-16 22:00:45'),
(75, 'at ipsum ac tellus', 'rwl 246', 2, '|', 5, 2, 1, '2023-06-24 21:08:22'),
(76, 'in congue etiam justo etiam', 'yds 386', 1, 'E', 4, 2, 4, '2023-09-25 04:12:41'),
(77, 'justo morbi ut odio cras', 'nqq 951', 1, 'C', 3, 2, 3, '2024-02-03 04:05:19'),
(78, 'semper interdum mauris ullamcorper purus sit', 'ahh 577', 1, 'C', 5, 1, 3, '2023-08-21 22:31:32'),
(79, 'varius integer ac leo pellentesque', 'mcy 407', 1, 'E', 3, 2, 2, '2024-01-26 17:37:50'),
(80, 'posuere metus vitae ipsum aliquam non', 'swc 253', 3, '|', 1, 2, 3, '2024-04-21 00:27:09'),
(81, 'enim in tempor', 'fbv 923', 1, 'C', 1, 2, 1, '2024-03-26 11:54:13'),
(82, 'ullamcorper augue a suscipit nulla elit', 'ucu 492', 3, 'C', 1, 1, 2, '2024-03-02 23:37:37'),
(83, 'pretium iaculis diam', 'kwh 500', 2, 'E', 5, 2, 4, '2024-04-12 11:33:31'),
(84, 'pulvinar nulla pede ullamcorper augue a', 'cxb 690', 3, 'E', 3, 2, 1, '2024-04-11 04:33:23'),
(85, 'magna bibendum imperdiet nullam orci pede', 'tux 058', 1, '|', 5, 2, 3, '2023-05-09 19:07:10'),
(86, 'ligula nec sem', 'fuo 866', 1, 'E', 4, 1, 3, '2023-08-03 05:01:23'),
(87, 'tortor risus dapibus', 'anj 916', 3, '|', 4, 2, 1, '2023-06-26 07:28:41'),
(88, 'vestibulum eget vulputate ut', 'lek 320', 1, 'C', 3, 2, 2, '2023-11-27 06:07:32'),
(89, 'quam sollicitudin vitae consectetuer eget', 'udv 956', 2, '|', 3, 1, 1, '2023-08-19 04:48:52'),
(90, 'id luctus nec molestie sed', 'bsd 596', 3, '|', 2, 2, 1, '2023-08-07 19:09:11'),
(91, 'sem fusce consequat nulla nisl', 'dvr 050', 2, 'C', 5, 1, 2, '2023-09-11 21:14:17'),
(92, 'massa quis augue luctus', 'vns 562', 3, 'C', 4, 1, 1, '2024-01-23 05:24:28'),
(93, 'erat quisque erat eros viverra', 'upn 709', 1, 'E', 5, 2, 1, '2024-02-23 12:10:13'),
(94, 'accumsan felis ut', 'jyt 987', 1, 'E', 5, 2, 3, '2024-02-17 15:15:21'),
(95, 'consequat dui nec', 'rqd 275', 1, 'E', 3, 2, 2, '2023-11-08 18:08:09'),
(96, 'amet erat nulla tempus', 'lfa 023', 2, '|', 3, 2, 2, '2023-11-04 08:23:06'),
(97, 'pede venenatis non', 'xol 371', 1, 'E', 4, 1, 2, '2023-11-26 06:45:58'),
(98, 'felis sed lacus', 'awi 928', 1, 'C', 5, 1, 1, '2023-07-25 16:12:50'),
(99, 'praesent blandit lacinia', 'ksk 140', 2, '|', 3, 1, 2, '2023-09-12 21:14:41'),
(100, 'ac enim in tempor turpis', 'mof 300', 3, 'C', 5, 1, 2, '2023-12-03 08:16:34'),
(101, 'Operation research', 'CSC401', 3, 'C', 1, 2, 4, '2024-05-07 11:51:38'),
(102, 'testing', 'tst 101', 4, 'C', 1, 1, 1, '2024-05-09 12:34:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `courses_view`
-- (See below for the actual view)
--
CREATE TABLE `courses_view` (
`course_id` int(11)
,`course_title` varchar(200)
,`course_code` varchar(10)
,`course_unit` int(11)
,`requirements` varchar(2)
,`department_name` varchar(50)
,`department_code` varchar(10)
,`semester_name` varchar(20)
,`level_name` int(11)
,`time_added` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_code` varchar(10) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_code`, `faculty_id`, `time_added`) VALUES
(1, 'Computer Science', 'CSC', 1, '2024-04-28 12:47:36'),
(2, 'Cybersecurity', 'CYB', 1, '2024-04-28 12:47:36'),
(3, 'Microbiology', 'MCB', 1, '2024-04-28 12:47:36'),
(4, 'Biochemistry', 'BCH', 1, '2024-04-28 12:47:36'),
(5, 'Industrial Chemistry', 'ICH', 1, '2024-04-28 12:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `facutly_name` varchar(50) NOT NULL,
  `faculty_code` varchar(10) NOT NULL,
  `time_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `facutly_name`, `faculty_code`, `time_created`) VALUES
(1, 'College of Pure and Applied Sciences', 'COPAS', '2024-04-28 12:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_data` longblob NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_name`, `date_created`) VALUES
(1, 'Male', '2024-04-27 22:48:55'),
(2, 'Female', '2024-04-27 22:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `title_id` int(11) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `othername` varchar(30) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `user_id`, `role_id`, `staff_id`, `title_id`, `surname`, `firstname`, `othername`, `gender_id`, `email`, `tel`, `time_added`) VALUES
(1, 101, 3, 'staff256', 3, 'Dyzart', 'Spencer', 'Win', 2, 'wdyzart0@smh.com.au', '425-821-7427', '2023-06-16 16:55:47'),
(2, 102, 3, 'staff488', 3, 'Gregol', 'Bee', 'Meagan', 2, 'mgregol1@census.gov', '475-695-3706', '2023-07-22 19:18:39'),
(3, 103, 3, 'staff091', 2, 'Landal', 'Vinnie', 'Nicola', 1, 'nlandal2@hc360.com', '290-560-5225', '2024-02-18 21:06:37'),
(4, 104, 3, 'staff580', 3, 'Benoy', 'Rici', 'Georgy', 1, 'gbenoy3@godaddy.com', '324-451-0698', '2023-12-12 16:06:44'),
(5, 105, 3, 'staff947', 1, 'Kensy', 'Andras', 'Dion', 2, 'dkensy4@dmoz.org', '242-846-0546', '2024-04-28 20:28:27'),
(6, 106, 3, 'staff133', 6, 'Quest', 'Eveleen', 'Budd', 2, 'bquest5@mayoclinic.com', '604-460-0917', '2024-01-06 15:21:56'),
(7, 107, 3, 'staff115', 2, 'Blackeby', 'Krystle', 'Kacey', 2, 'kblackeby6@oracle.com', '485-614-2408', '2023-09-29 17:24:45'),
(8, 108, 3, 'staff774', 1, 'Hexter', 'Dulcia', 'Pavia', 1, 'phexter7@hugedomains.com', '626-733-9478', '2023-08-19 03:34:00'),
(9, 109, 3, 'staff460', 4, 'Nussii', 'Jere', 'Mathew', 1, 'mnussii8@theguardian.com', '840-408-3925', '2024-04-11 00:32:53'),
(10, 110, 3, 'staff861', 5, 'Hazeldene', 'Hailee', 'Ariel', 1, 'ahazeldene9@aol.com', '722-945-8547', '2024-03-12 06:27:41'),
(11, 111, 3, 'staff826', 5, 'Kures', 'Sharlene', 'Tate', 2, 'tkuresa@linkedin.com', '905-812-4740', '2023-05-29 18:59:34'),
(12, 112, 3, 'staff617', 2, 'Shafe', 'Tallie', 'Herschel', 1, 'hshafeb@w3.org', '800-790-9106', '2023-12-15 08:00:21'),
(13, 113, 3, 'staff235', 6, 'Forber', 'Zarah', 'Teddi', 1, 'tforberc@home.pl', '149-635-5414', '2024-01-28 15:27:50'),
(14, 114, 3, 'staff533', 5, 'Maddy', 'Timothee', 'Elga', 1, 'emaddyd@dailymotion.com', '560-343-6603', '2023-12-11 10:37:08'),
(15, 115, 3, 'staff779', 2, 'Huson', 'Sibby', 'Kristal', 1, 'khusone@devhub.com', '916-835-0258', '2024-04-12 11:59:36'),
(16, 116, 3, 'staff179', 6, 'Munkley', 'Jacky', 'Evangelina', 2, 'emunkleyf@dot.gov', '310-656-9129', '2023-09-08 16:37:48'),
(17, 117, 3, 'staff542', 2, 'Houston', 'Raynell', 'Aldus', 1, 'ahoustong@nbcnews.com', '248-960-6044', '2023-05-08 12:58:23'),
(18, 118, 3, 'staff583', 3, 'Desesquelle', 'Leslie', 'Sabina', 1, 'sdesesquelleh@blog.com', '892-465-2907', '2023-09-17 12:47:18'),
(19, 119, 3, 'staff383', 5, 'Annesley', 'Elfie', 'Tana', 1, 'tannesleyi@cbsnews.com', '298-853-3901', '2023-07-06 14:05:16'),
(20, 120, 3, 'staff149', 6, 'Robarts', 'Shina', 'Willey', 1, 'wrobartsj@biglobe.ne.jp', '423-141-3577', '2024-01-13 09:45:18'),
(21, 121, 3, 'staff489', 2, 'Couser', 'Melanie', 'Gusty', 1, 'gcouserk@pbs.org', '981-642-8218', '2024-02-21 21:41:38'),
(22, 122, 3, 'staff673', 3, 'Goddman', 'Pierette', 'Eleanore', 2, 'egoddmanl@ocn.ne.jp', '368-304-0838', '2023-09-13 09:48:06'),
(23, 123, 3, 'staff851', 1, 'Nickell', 'Sybil', 'Marilin', 1, 'mnickellm@weebly.com', '644-681-2353', '2023-08-08 11:54:49'),
(24, 124, 3, 'staff284', 4, 'Doughartie', 'Georgette', 'Thornton', 2, 'tdoughartien@flavors.me', '879-904-5322', '2023-10-04 10:02:24'),
(25, 125, 3, 'staff629', 2, 'Gland', 'Burl', 'Vallie', 2, 'vglando@merriam-webster.com', '726-261-7677', '2023-09-29 01:08:18'),
(26, 126, 3, 'staff686', 1, 'Crossgrove', 'Thomasina', 'Creighton', 1, 'ccrossgrovep@dropbox.com', '843-760-1072', '2023-12-25 06:28:23'),
(27, 127, 3, 'staff717', 1, 'Wettern', 'Isaiah', 'Kin', 1, 'kwetternq@europa.eu', '374-491-5843', '2024-01-17 16:36:55'),
(28, 128, 3, 'staff963', 3, 'Hullah', 'Bent', 'Diena', 1, 'dhullahr@house.gov', '628-544-5466', '2023-10-14 03:35:00'),
(29, 129, 3, 'staff819', 1, 'Son', 'Sonia', 'Saxe', 2, 'ssons@booking.com', '332-312-7909', '2023-10-09 12:16:50'),
(30, 130, 3, 'staff790', 2, 'Harrald', 'Dani', 'Raymund', 1, 'rharraldt@is.gd', '801-117-6748', '2024-04-05 18:05:46'),
(31, 131, 3, 'staff658', 1, 'Jacobowicz', 'Bertrand', 'Danell', 1, 'djacobowiczu@goodreads.com', '620-886-7347', '2024-02-03 04:13:24'),
(32, 132, 3, 'staff164', 1, 'Hubble', 'Ira', 'Fanchette', 1, 'fhubblev@apache.org', '294-216-2854', '2024-04-29 11:08:03'),
(33, 133, 3, 'staff171', 5, 'Grishechkin', 'Dorena', 'Homere', 2, 'hgrishechkinw@businessinsider.com', '405-148-9643', '2023-05-11 09:24:05'),
(34, 134, 3, 'staff456', 2, 'Treble', 'Loree', 'Zora', 2, 'ztreblex@un.org', '912-813-3620', '2023-11-10 20:54:06'),
(35, 135, 3, 'staff314', 2, 'Rippon', 'Casey', 'Alex', 2, 'arippony@exblog.jp', '819-488-9333', '2024-03-06 18:47:47'),
(36, 136, 3, 'staff945', 4, 'Dudley', 'Ad', 'Jori', 1, 'jdudleyz@msn.com', '417-263-4791', '2023-07-31 04:07:36'),
(37, 137, 3, 'staff299', 3, 'Fritschmann', 'Esme', 'Nonnah', 1, 'nfritschmann10@com.com', '284-239-8062', '2023-04-30 01:21:48'),
(38, 138, 3, 'staff393', 1, 'Longshaw', 'Phip', 'Clemmy', 2, 'clongshaw11@ebay.co.uk', '169-602-9211', '2023-05-20 05:47:43'),
(39, 139, 3, 'staff874', 2, 'Vignaux', 'Ursa', 'Archie', 1, 'avignaux12@prnewswire.com', '436-512-6676', '2023-06-29 15:30:34'),
(40, 140, 3, 'staff804', 6, 'Caras', 'Elisa', 'Catie', 1, 'ccaras13@github.com', '944-633-7495', '2023-07-28 06:34:55'),
(41, 141, 3, 'staff367', 1, 'D\'Antonio', 'Marin', 'Rowney', 1, 'rdantonio14@netlog.com', '209-363-8228', '2023-08-20 03:34:20'),
(42, 142, 3, 'staff350', 5, 'Trewhella', 'Rube', 'Nicoli', 1, 'ntrewhella15@nih.gov', '855-135-6172', '2024-03-02 14:14:44'),
(43, 143, 3, 'staff263', 6, 'Lemmens', 'Jervis', 'Biddy', 1, 'blemmens16@hp.com', '767-901-5296', '2023-09-12 00:43:40'),
(44, 144, 3, 'staff318', 3, 'Chesshyre', 'Charity', 'Karoly', 2, 'kchesshyre17@nationalgeographic.com', '900-986-6734', '2024-01-04 22:38:47'),
(45, 145, 3, 'staff345', 4, 'Barling', 'Chickie', 'Ilario', 2, 'ibarling18@foxnews.com', '559-221-3263', '2023-08-18 20:27:22'),
(46, 146, 3, 'staff140', 3, 'Dunkerley', 'Biron', 'Jessee', 2, 'jdunkerley19@biblegateway.com', '764-351-8108', '2023-08-30 14:49:40'),
(47, 147, 3, 'staff521', 6, 'Spellsworth', 'Norina', 'Nara', 1, 'nspellsworth1a@t-online.de', '578-147-5222', '2024-04-17 16:38:10'),
(48, 148, 3, 'staff033', 5, 'Hargate', 'Christophe', 'Dominique', 1, 'dhargate1b@mail.ru', '831-562-6783', '2024-03-27 02:12:59'),
(49, 149, 3, 'staff841', 4, 'Beccero', 'Ardyth', 'Cathi', 1, 'cbeccero1c@spotify.com', '720-323-3692', '2023-05-23 19:58:25'),
(50, 150, 3, 'staff174', 2, 'Mulrenan', 'Eli', 'Inglis', 1, 'imulrenan1d@wordpress.org', '935-100-7037', '2023-08-23 02:08:22'),
(51, 151, 3, 'staff877', 1, 'Constantine', 'Kissiah', 'Delbert', 1, 'dconstantine1e@aol.com', '266-653-2543', '2023-10-25 06:42:57'),
(52, 152, 3, 'staff188', 3, 'MacCosty', 'Seth', 'Camille', 1, 'cmaccosty1f@usa.gov', '148-413-1878', '2023-11-22 13:24:42'),
(53, 153, 3, 'staff626', 2, 'Klasen', 'Merl', 'Gavrielle', 1, 'gklasen1g@soundcloud.com', '390-451-9379', '2023-11-25 00:18:25'),
(54, 154, 3, 'staff791', 1, 'Brockton', 'Egan', 'Stearne', 1, 'sbrockton1h@ebay.co.uk', '506-881-3556', '2023-09-09 01:09:32'),
(55, 155, 3, 'staff550', 2, 'Libbis', 'Allix', 'Nicol', 2, 'nlibbis1i@ft.com', '245-663-4158', '2023-08-13 04:56:46'),
(56, 156, 3, 'staff127', 6, 'Kennett', 'Filip', 'Brand', 1, 'bkennett1j@cloudflare.com', '637-368-2053', '2023-11-04 04:48:32'),
(57, 157, 3, 'staff953', 4, 'Monger', 'Gerald', 'Kettie', 1, 'kmonger1k@house.gov', '748-313-9036', '2023-10-26 02:54:08'),
(58, 158, 3, 'staff984', 3, 'Sword', 'Fonzie', 'Whit', 2, 'wsword1l@storify.com', '143-770-2528', '2023-10-18 19:15:51'),
(59, 159, 3, 'staff319', 5, 'Braley', 'Dion', 'Ilyse', 2, 'ibraley1m@epa.gov', '467-191-7639', '2023-07-20 17:24:39'),
(60, 160, 3, 'staff651', 4, 'Down', 'Dori', 'Ashlie', 1, 'adown1n@odnoklassniki.ru', '372-215-5803', '2023-05-03 08:16:41'),
(61, 161, 3, 'staff657', 1, 'Pickworth', 'Earle', 'Colette', 1, 'cpickworth1o@github.io', '227-396-6634', '2023-07-22 10:16:04'),
(62, 162, 3, 'staff062', 4, 'Goddard', 'Jozef', 'Andee', 1, 'agoddard1p@mapquest.com', '263-737-9938', '2023-10-26 17:39:34'),
(63, 163, 3, 'staff597', 3, 'Mozzetti', 'Starlene', 'Nigel', 1, 'nmozzetti1q@tinyurl.com', '956-926-1528', '2023-07-14 07:45:40'),
(64, 164, 3, 'staff735', 3, 'Lougheed', 'Raychel', 'Nana', 1, 'nlougheed1r@admin.ch', '852-276-7423', '2023-12-17 09:16:16'),
(65, 165, 3, 'staff406', 3, 'Toyer', 'Malinde', 'Lori', 1, 'ltoyer1s@ehow.com', '501-373-4312', '2023-06-09 17:26:54'),
(66, 166, 3, 'staff992', 6, 'Pedrollo', 'Kaspar', 'Earle', 2, 'epedrollo1t@springer.com', '382-186-9828', '2023-10-06 19:01:25'),
(67, 167, 3, 'staff615', 1, 'Millom', 'Kenneth', 'Freddi', 1, 'fmillom1u@ustream.tv', '715-754-5299', '2024-01-05 15:58:15'),
(68, 168, 3, 'staff687', 3, 'Gammell', 'Nydia', 'Domingo', 1, 'dgammell1v@fastcompany.com', '465-422-6075', '2024-02-11 22:22:31'),
(69, 169, 3, 'staff146', 5, 'Venus', 'Vail', 'Antonietta', 1, 'avenus1w@google.co.jp', '129-573-6346', '2024-01-29 22:08:03'),
(71, 171, 3, 'staff041', 5, 'Mawford', 'Janith', 'Veriee', 1, 'vmawford1y@google.com.hk', '496-659-7638', '2024-04-08 12:22:32');

-- --------------------------------------------------------

--
-- Stand-in structure for view `lecturers_view`
-- (See below for the actual view)
--
CREATE TABLE `lecturers_view` (
`lecturer_id` int(11)
,`user_id` int(11)
,`staff_id` varchar(20)
,`role_name` varchar(15)
,`title_alias` varchar(10)
,`gender_name` varchar(10)
,`surname` varchar(30)
,`firstname` varchar(30)
,`othername` varchar(30)
,`email` varchar(60)
,`tel` varchar(15)
,`time_added` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_name` int(11) NOT NULL,
  `time_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`, `time_created`) VALUES
(1, 100, '2024-04-28 12:52:37'),
(2, 200, '2024-04-28 12:52:37'),
(3, 300, '2024-04-28 12:52:37'),
(4, 400, '2024-04-28 12:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `mode_of_entry`
--

CREATE TABLE `mode_of_entry` (
  `mode_id` int(11) NOT NULL,
  `mode_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mode_of_entry`
--

INSERT INTO `mode_of_entry` (`mode_id`, `mode_name`) VALUES
(1, 'UME'),
(2, 'DE');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `ca` int(11) NOT NULL,
  `exam` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`result_id`, `session_id`, `course_id`, `student_id`, `ca`, `exam`, `total`, `grade`, `time_added`) VALUES
(1, 4, 72, 33, 25, 37, 62, 4, '2024-02-24 16:40:39'),
(2, 3, 91, 18, 20, 58, 78, 5, '2024-02-29 09:22:38'),
(3, 2, 7, 18, 30, 12, 42, 0, '2024-02-02 06:50:38'),
(4, 3, 93, 18, 30, 28, 58, 3, '2024-04-03 12:43:56'),
(5, 3, 62, 37, 23, 25, 48, 2, '2023-07-05 09:37:13'),
(6, 3, 53, 2, 10, 23, 33, 0, '2023-10-01 18:32:00'),
(7, 2, 22, 2, 38, 45, 83, 5, '2023-07-04 13:49:01'),
(8, 3, 23, 35, 29, 27, 56, 3, '2023-06-19 22:51:58'),
(9, 4, 88, 4, 50, 19, 69, 4, '2024-02-23 23:18:46'),
(10, 4, 64, 13, 30, 20, 50, 3, '2024-04-15 12:28:12'),
(11, 4, 2, 40, 31, 13, 44, 0, '2023-09-03 02:47:39'),
(12, 1, 50, 37, 17, 53, 70, 5, '2023-11-15 17:07:32'),
(13, 4, 49, 29, 33, 47, 80, 5, '2023-10-23 16:37:27'),
(14, 1, 73, 13, 40, 38, 78, 5, '2024-01-03 03:47:53'),
(15, 4, 74, 13, 30, 52, 82, 5, '2023-05-29 03:29:28'),
(16, 4, 16, 6, 33, 54, 87, 5, '2023-09-27 00:24:12'),
(17, 2, 11, 5, 13, 15, 28, 0, '2023-12-19 08:06:18'),
(18, 4, 99, 39, 9, 32, 41, 0, '2024-01-25 15:03:36'),
(19, 2, 65, 8, 32, 1, 33, 0, '2024-03-03 22:44:33'),
(20, 4, 45, 7, 8, 23, 31, 0, '2024-01-14 02:23:29'),
(21, 3, 22, 14, 7, 37, 44, 0, '2024-03-29 00:27:28'),
(22, 4, 37, 20, 48, 49, 97, 5, '2023-11-10 05:37:15'),
(23, 3, 13, 33, 9, 51, 60, 4, '2024-02-25 22:51:50'),
(24, 1, 77, 9, 41, 54, 95, 5, '2023-09-15 04:21:46'),
(25, 4, 51, 45, 39, 19, 58, 3, '2023-06-20 00:14:49'),
(26, 2, 85, 40, 20, 16, 36, 0, '2023-10-03 15:48:58'),
(27, 4, 65, 16, 24, 34, 58, 3, '2024-02-09 07:57:23'),
(28, 3, 40, 45, 12, 40, 52, 3, '2024-03-14 05:12:20'),
(29, 4, 88, 2, 31, 14, 45, 2, '2023-05-16 04:00:59'),
(30, 3, 55, 13, 13, 6, 19, 0, '2023-09-16 08:31:28'),
(31, 3, 52, 2, 29, 55, 84, 5, '2023-06-02 16:51:10'),
(32, 1, 34, 44, 35, 23, 58, 3, '2023-06-01 05:33:30'),
(33, 3, 16, 41, 19, 8, 27, 0, '2024-03-18 02:44:16'),
(34, 4, 78, 14, 39, 27, 66, 4, '2023-06-23 06:00:38'),
(35, 4, 67, 26, 17, 32, 49, 2, '2023-10-25 22:34:14'),
(36, 1, 4, 36, 48, 48, 96, 5, '2023-06-10 05:15:43'),
(37, 2, 85, 15, 20, 22, 42, 0, '2023-11-23 18:19:33'),
(38, 2, 85, 25, 41, 58, 99, 5, '2024-03-02 21:26:06'),
(39, 1, 9, 18, 37, 53, 90, 5, '2023-08-20 07:12:50'),
(40, 2, 27, 21, 38, 34, 72, 5, '2023-07-10 03:49:18'),
(41, 1, 94, 8, 17, 41, 58, 3, '2023-06-13 14:54:42'),
(42, 1, 26, 39, 27, 13, 40, 0, '2023-05-21 20:41:25'),
(43, 4, 67, 30, 41, 52, 93, 5, '2023-06-12 05:45:37'),
(44, 1, 45, 46, 41, 42, 83, 5, '2023-10-08 02:56:33'),
(45, 2, 64, 6, 24, 11, 35, 0, '2023-07-26 23:19:14'),
(46, 4, 25, 12, 45, 7, 52, 3, '2023-06-06 19:51:57'),
(47, 1, 92, 49, 37, 21, 58, 3, '2023-09-29 12:20:45'),
(48, 3, 79, 6, 19, 44, 63, 4, '2024-01-20 11:44:06'),
(49, 3, 27, 37, 30, 34, 64, 4, '2024-01-08 22:35:28'),
(50, 1, 51, 2, 39, 13, 52, 3, '2024-02-23 10:36:09'),
(51, 4, 19, 16, 15, 46, 61, 4, '2023-10-26 22:02:56'),
(52, 2, 97, 16, 31, 18, 49, 2, '2024-03-14 07:22:01'),
(53, 2, 23, 8, 16, 59, 75, 5, '2023-09-16 14:04:49'),
(54, 1, 98, 41, 45, 47, 92, 5, '2023-05-09 22:39:58'),
(55, 4, 76, 27, 6, 17, 23, 0, '2023-09-01 08:27:21'),
(56, 3, 87, 24, 16, 27, 43, 0, '2024-04-27 14:18:25'),
(57, 2, 84, 48, 29, 34, 63, 4, '2024-04-18 10:09:55'),
(58, 4, 33, 35, 11, 45, 56, 3, '2023-10-09 14:17:58'),
(59, 1, 19, 43, 27, 21, 48, 2, '2023-08-20 07:02:50'),
(60, 2, 84, 22, 22, 51, 73, 5, '2024-01-02 05:17:03'),
(61, 1, 53, 49, 42, 18, 60, 4, '2024-03-26 18:04:08'),
(62, 4, 43, 31, 43, 5, 48, 2, '2023-10-21 14:28:31'),
(63, 4, 24, 37, 41, 39, 80, 5, '2023-11-15 12:03:58'),
(64, 1, 33, 11, 49, 29, 78, 5, '2024-04-09 00:57:43'),
(65, 2, 28, 10, 34, 11, 45, 2, '2023-05-01 11:35:56'),
(66, 1, 26, 19, 25, 54, 79, 5, '2023-12-11 14:02:35'),
(67, 2, 49, 14, 24, 49, 73, 5, '2024-04-04 16:37:52'),
(68, 3, 7, 38, 44, 9, 53, 3, '2023-06-07 02:18:48'),
(69, 4, 65, 40, 30, 12, 42, 0, '2023-07-17 13:36:34'),
(70, 3, 9, 12, 20, 22, 42, 0, '2023-11-21 10:38:41'),
(71, 2, 60, 15, 5, 22, 27, 0, '2023-07-04 15:31:34'),
(72, 3, 69, 32, 26, 52, 78, 5, '2024-03-06 03:38:42'),
(73, 2, 1, 37, 44, 51, 95, 5, '2023-08-26 21:52:21'),
(74, 3, 97, 12, 38, 29, 67, 4, '2023-06-22 15:15:36'),
(75, 3, 56, 4, 15, 23, 38, 0, '2023-05-05 03:21:19'),
(76, 3, 97, 36, 27, 18, 45, 2, '2023-07-30 06:18:46'),
(77, 3, 16, 46, 29, 33, 62, 4, '2023-07-31 10:07:59'),
(78, 2, 58, 47, 12, 59, 71, 5, '2023-12-01 19:26:24'),
(79, 2, 63, 4, 33, 41, 74, 5, '2024-02-24 03:21:24'),
(80, 4, 73, 21, 30, 9, 39, 0, '2023-06-18 18:18:53'),
(81, 2, 17, 25, 31, 31, 62, 4, '2023-08-04 02:59:46'),
(82, 3, 73, 34, 14, 44, 58, 3, '2023-07-21 17:05:36'),
(83, 2, 79, 34, 15, 8, 23, 0, '2024-02-12 02:53:02'),
(84, 4, 30, 24, 21, 22, 43, 0, '2024-01-08 06:29:12'),
(85, 2, 90, 37, 32, 39, 71, 5, '2023-05-07 09:16:16'),
(86, 3, 41, 19, 9, 43, 52, 3, '2023-11-27 03:52:48'),
(87, 1, 68, 25, 22, 21, 43, 0, '2023-07-05 14:43:00'),
(88, 4, 32, 8, 10, 5, 15, 0, '2023-07-08 03:51:22'),
(89, 3, 48, 5, 5, 7, 12, 0, '2023-05-05 20:30:37'),
(90, 1, 27, 40, 35, 13, 48, 2, '2024-03-18 22:54:10'),
(91, 2, 24, 3, 30, 47, 77, 5, '2023-11-17 05:25:53'),
(92, 3, 7, 40, 42, 32, 74, 5, '2023-09-03 00:32:44'),
(93, 1, 67, 8, 17, 2, 19, 0, '2023-06-28 00:18:19'),
(94, 2, 67, 29, 41, 40, 81, 5, '2023-05-11 16:24:14'),
(95, 4, 21, 23, 14, 45, 59, 3, '2023-08-11 20:43:21'),
(96, 4, 63, 31, 24, 23, 47, 2, '2024-02-28 10:50:30'),
(97, 2, 35, 48, 36, 8, 44, 0, '2023-08-22 19:41:55'),
(98, 1, 21, 16, 44, 27, 71, 5, '2023-09-02 07:22:35'),
(99, 1, 40, 27, 18, 14, 32, 0, '2023-07-23 12:19:49'),
(100, 3, 92, 44, 16, 31, 47, 2, '2023-10-02 11:10:23'),
(101, 2, 9, 9, 50, 11, 61, 4, '2023-12-17 01:38:19'),
(102, 4, 24, 36, 9, 9, 18, 0, '2023-06-25 20:40:32'),
(103, 2, 84, 11, 18, 57, 75, 5, '2023-07-26 08:19:20'),
(104, 3, 84, 23, 17, 16, 33, 0, '2024-03-06 03:52:43'),
(105, 4, 7, 25, 30, 26, 56, 3, '2024-03-31 14:46:16'),
(106, 4, 29, 6, 22, 37, 59, 3, '2023-08-09 14:55:54'),
(107, 2, 18, 35, 16, 31, 47, 2, '2023-10-03 15:02:57'),
(108, 2, 1, 41, 10, 60, 70, 5, '2023-10-28 14:23:13'),
(109, 1, 28, 29, 17, 20, 37, 0, '2023-05-11 18:05:27'),
(110, 1, 9, 48, 46, 44, 90, 5, '2023-09-05 14:28:48'),
(111, 2, 82, 14, 35, 19, 54, 3, '2023-09-11 21:32:57'),
(112, 4, 17, 39, 33, 12, 45, 2, '2023-06-09 01:33:44'),
(113, 1, 40, 11, 45, 28, 73, 5, '2023-07-07 23:00:55'),
(114, 4, 18, 32, 29, 39, 68, 4, '2023-07-25 06:07:44'),
(115, 4, 88, 40, 33, 34, 67, 4, '2023-07-05 21:21:25'),
(116, 1, 51, 45, 5, 57, 62, 4, '2023-05-26 04:23:56'),
(117, 4, 76, 29, 31, 58, 89, 5, '2023-07-15 22:32:39'),
(118, 1, 59, 49, 49, 37, 86, 5, '2024-04-23 01:36:47'),
(119, 2, 86, 3, 46, 23, 69, 4, '2024-03-31 10:39:40'),
(120, 2, 5, 12, 24, 33, 57, 3, '2023-09-20 05:31:33'),
(121, 1, 33, 11, 12, 9, 21, 0, '2023-07-07 03:20:11'),
(122, 2, 5, 16, 32, 24, 56, 3, '2024-02-27 01:51:07'),
(123, 4, 6, 26, 17, 45, 62, 4, '2024-04-13 20:16:32'),
(124, 3, 51, 14, 41, 7, 48, 2, '2023-10-10 01:36:06'),
(125, 3, 8, 17, 29, 17, 46, 2, '2024-02-14 16:22:52'),
(126, 3, 13, 40, 28, 8, 36, 0, '2024-03-12 06:14:04'),
(127, 3, 46, 6, 5, 6, 11, 0, '2023-12-04 01:16:46'),
(128, 1, 51, 24, 36, 33, 69, 4, '2024-02-12 16:32:19'),
(129, 2, 87, 31, 15, 54, 69, 4, '2023-10-28 21:39:51'),
(130, 2, 95, 38, 5, 51, 56, 3, '2023-08-14 12:35:28'),
(131, 4, 77, 27, 21, 42, 63, 4, '2024-01-21 00:11:44'),
(132, 2, 27, 30, 21, 41, 62, 4, '2023-06-25 21:44:51'),
(133, 2, 27, 42, 43, 7, 50, 3, '2023-06-05 22:53:08'),
(134, 3, 31, 4, 34, 16, 50, 3, '2024-01-31 21:41:47'),
(135, 3, 55, 19, 20, 13, 33, 0, '2024-04-05 13:30:56'),
(136, 4, 97, 8, 20, 6, 26, 0, '2023-10-03 04:22:11'),
(137, 1, 10, 32, 20, 47, 67, 4, '2023-10-24 17:02:03'),
(138, 1, 69, 29, 17, 17, 34, 0, '2023-10-02 23:55:45'),
(139, 3, 98, 47, 34, 1, 35, 0, '2023-09-01 10:26:33'),
(140, 3, 83, 11, 21, 44, 65, 4, '2024-04-03 20:26:03'),
(141, 3, 28, 17, 40, 56, 96, 5, '2023-06-19 06:07:49'),
(142, 4, 71, 35, 34, 37, 71, 5, '2023-10-23 07:34:08'),
(143, 1, 9, 6, 12, 3, 15, 0, '2023-06-05 13:42:53'),
(144, 1, 91, 21, 28, 58, 86, 5, '2024-03-23 03:03:58'),
(145, 3, 53, 46, 44, 39, 83, 5, '2023-09-16 10:22:05'),
(146, 1, 9, 42, 43, 53, 96, 5, '2023-06-20 08:00:43'),
(147, 1, 28, 31, 36, 29, 65, 4, '2023-09-19 09:08:31'),
(148, 1, 99, 8, 43, 35, 78, 5, '2024-04-12 23:41:20'),
(149, 2, 68, 24, 14, 22, 36, 0, '2023-05-14 20:25:30'),
(150, 2, 80, 45, 32, 11, 43, 0, '2023-12-13 10:41:55'),
(151, 3, 38, 28, 27, 43, 70, 5, '2023-08-24 17:41:35'),
(152, 2, 11, 42, 48, 27, 75, 5, '2023-09-26 06:50:48'),
(153, 4, 83, 48, 43, 58, 101, 5, '2023-06-16 20:09:00'),
(154, 3, 34, 14, 14, 17, 31, 0, '2023-11-22 23:50:28'),
(155, 2, 7, 44, 38, 38, 76, 5, '2024-03-23 02:01:08'),
(156, 2, 66, 49, 12, 39, 51, 3, '2023-06-22 08:50:33'),
(157, 1, 69, 4, 14, 50, 64, 4, '2024-01-12 17:58:30'),
(158, 1, 54, 47, 18, 58, 76, 5, '2023-12-31 20:53:21'),
(159, 3, 58, 34, 13, 23, 36, 0, '2023-08-02 15:36:38'),
(160, 2, 4, 17, 40, 57, 97, 5, '2023-07-21 21:35:02'),
(161, 1, 75, 1, 23, 17, 40, 0, '2023-06-19 16:23:07'),
(162, 1, 71, 9, 13, 34, 47, 2, '2023-05-19 11:02:47'),
(163, 4, 62, 32, 48, 40, 88, 5, '2024-03-25 18:33:47'),
(164, 2, 72, 22, 14, 51, 65, 4, '2023-05-16 21:02:28'),
(165, 3, 61, 6, 9, 23, 32, 0, '2023-07-02 17:28:23'),
(166, 2, 89, 3, 25, 1, 26, 0, '2023-11-08 10:05:43'),
(167, 4, 16, 42, 50, 19, 69, 4, '2023-11-26 05:36:13'),
(168, 4, 5, 25, 9, 8, 17, 0, '2023-10-27 03:00:56'),
(169, 1, 46, 35, 49, 54, 103, 5, '2023-09-25 14:30:20'),
(170, 3, 46, 21, 13, 51, 64, 4, '2023-09-08 05:27:45'),
(171, 2, 99, 47, 42, 55, 97, 5, '2023-07-16 03:28:40'),
(172, 4, 75, 18, 13, 13, 26, 0, '2024-01-05 20:13:34'),
(173, 4, 91, 19, 18, 14, 32, 0, '2023-06-15 09:07:52'),
(174, 3, 22, 13, 8, 44, 52, 3, '2023-06-01 14:10:54'),
(175, 1, 12, 34, 20, 16, 36, 0, '2023-05-23 10:28:16'),
(176, 2, 8, 38, 37, 35, 72, 5, '2023-09-23 09:07:10'),
(177, 2, 15, 48, 33, 34, 67, 4, '2023-08-18 06:23:37'),
(178, 1, 61, 18, 11, 21, 32, 0, '2023-10-07 11:28:02'),
(179, 3, 10, 11, 32, 17, 49, 2, '2023-11-07 01:51:22'),
(180, 3, 57, 19, 29, 6, 35, 0, '2023-06-25 17:39:11'),
(181, 2, 2, 42, 19, 17, 36, 0, '2024-01-21 01:47:56'),
(182, 2, 7, 39, 30, 37, 67, 4, '2023-10-24 12:29:17'),
(183, 2, 34, 47, 28, 1, 29, 0, '2023-06-02 05:47:09'),
(184, 1, 86, 17, 8, 19, 27, 0, '2024-01-26 06:17:00'),
(185, 3, 26, 47, 19, 16, 35, 0, '2023-05-26 13:05:17'),
(186, 3, 93, 35, 36, 60, 96, 5, '2024-01-21 13:54:25'),
(187, 4, 83, 10, 32, 26, 58, 3, '2024-03-11 02:16:40'),
(188, 4, 67, 27, 16, 33, 49, 2, '2024-02-28 09:43:40'),
(189, 2, 73, 19, 16, 29, 45, 2, '2023-11-25 19:03:02'),
(190, 1, 9, 15, 7, 18, 25, 0, '2023-11-10 01:08:13'),
(191, 3, 55, 9, 48, 24, 72, 5, '2023-11-30 23:28:12'),
(192, 2, 87, 40, 46, 45, 91, 5, '2023-06-13 20:16:35'),
(193, 4, 30, 23, 23, 47, 70, 5, '2023-07-18 14:26:41'),
(194, 1, 39, 23, 29, 37, 66, 4, '2024-01-24 12:15:57'),
(195, 3, 7, 9, 41, 38, 79, 5, '2023-07-24 04:16:05'),
(196, 3, 25, 4, 23, 54, 77, 5, '2023-05-25 14:53:33'),
(197, 2, 87, 20, 28, 19, 47, 2, '2024-01-04 01:33:35'),
(198, 1, 69, 44, 26, 42, 68, 4, '2023-06-20 09:36:02'),
(199, 3, 71, 21, 39, 35, 74, 5, '2023-11-15 23:36:20'),
(200, 1, 22, 40, 13, 32, 45, 2, '2023-05-22 21:26:38'),
(201, 3, 78, 38, 17, 45, 62, 4, '2023-11-27 14:34:02'),
(202, 4, 87, 23, 28, 20, 48, 2, '2024-01-06 22:47:35'),
(203, 3, 47, 11, 23, 35, 58, 3, '2023-09-06 01:15:35'),
(204, 4, 30, 14, 8, 35, 43, 0, '2023-10-27 22:19:25'),
(205, 2, 70, 3, 16, 18, 34, 0, '2024-03-27 03:51:33'),
(206, 4, 99, 4, 44, 30, 74, 5, '2024-02-26 10:16:12'),
(207, 2, 20, 29, 26, 58, 84, 5, '2023-11-04 01:36:51'),
(208, 1, 54, 14, 36, 52, 88, 5, '2023-11-10 20:44:39'),
(209, 3, 20, 15, 11, 1, 12, 0, '2024-02-11 08:37:26'),
(210, 1, 73, 12, 22, 43, 65, 4, '2023-08-12 14:37:42'),
(211, 4, 53, 34, 32, 47, 79, 5, '2023-09-20 00:06:42'),
(212, 1, 39, 35, 18, 54, 72, 5, '2023-06-04 04:28:48'),
(213, 4, 90, 20, 19, 6, 25, 0, '2023-08-18 16:06:25'),
(214, 3, 84, 20, 40, 5, 45, 2, '2023-09-15 04:56:18'),
(215, 4, 76, 48, 23, 25, 48, 2, '2023-11-04 02:58:55'),
(216, 3, 60, 45, 21, 9, 30, 0, '2023-07-09 02:31:51'),
(217, 1, 33, 37, 25, 15, 40, 0, '2023-12-14 07:35:19'),
(218, 2, 100, 5, 12, 29, 41, 0, '2023-11-05 16:21:56'),
(219, 3, 73, 49, 33, 11, 44, 0, '2023-12-06 19:05:20'),
(220, 2, 24, 11, 35, 41, 76, 5, '2023-10-24 01:47:10'),
(221, 2, 44, 35, 28, 50, 78, 5, '2023-06-26 04:30:14'),
(222, 1, 35, 8, 48, 38, 86, 5, '2023-12-13 20:52:26'),
(223, 2, 54, 20, 49, 2, 51, 3, '2024-03-24 13:36:36'),
(224, 4, 38, 23, 9, 23, 32, 0, '2024-01-18 23:29:05'),
(225, 2, 32, 11, 34, 44, 78, 5, '2024-03-06 01:27:23'),
(226, 3, 82, 36, 39, 48, 87, 5, '2023-10-16 11:13:00'),
(227, 4, 94, 47, 38, 43, 81, 5, '2023-08-28 19:06:42'),
(228, 1, 83, 1, 12, 25, 37, 0, '2023-12-28 20:32:17'),
(229, 3, 35, 40, 13, 59, 72, 5, '2024-03-28 06:57:30'),
(230, 1, 65, 35, 20, 19, 39, 0, '2023-12-08 16:22:23'),
(231, 4, 43, 50, 12, 30, 42, 0, '2024-01-02 00:27:00'),
(232, 3, 20, 23, 28, 25, 53, 3, '2024-01-12 14:20:38'),
(233, 1, 83, 7, 31, 44, 75, 5, '2023-11-03 15:47:26'),
(234, 1, 17, 41, 46, 24, 70, 5, '2024-04-13 08:25:20'),
(235, 1, 76, 22, 24, 54, 78, 5, '2024-02-13 14:29:11'),
(236, 3, 77, 8, 42, 29, 71, 5, '2023-12-15 12:34:52'),
(237, 2, 96, 50, 14, 50, 64, 4, '2023-12-20 22:45:36'),
(238, 3, 88, 40, 26, 58, 84, 5, '2023-12-08 09:05:13'),
(239, 2, 89, 34, 23, 59, 82, 5, '2023-09-02 06:07:27'),
(240, 1, 95, 48, 32, 8, 40, 0, '2023-06-14 20:43:34'),
(241, 3, 46, 37, 5, 40, 45, 2, '2024-03-28 12:14:21'),
(242, 3, 66, 3, 43, 37, 80, 5, '2024-03-04 10:00:36'),
(243, 4, 22, 23, 12, 30, 42, 0, '2024-02-18 20:20:00'),
(244, 4, 99, 14, 44, 26, 70, 5, '2023-05-17 14:50:38'),
(245, 3, 74, 44, 7, 42, 49, 2, '2024-04-13 21:43:27'),
(246, 3, 12, 4, 42, 17, 59, 3, '2023-06-27 18:47:44'),
(247, 2, 94, 2, 38, 54, 92, 5, '2023-11-17 23:00:16'),
(248, 4, 48, 2, 45, 9, 54, 3, '2024-01-29 22:45:44'),
(249, 4, 48, 25, 36, 3, 39, 0, '2024-01-20 18:04:07'),
(250, 4, 72, 6, 22, 36, 58, 3, '2023-11-03 08:58:11'),
(251, 4, 89, 10, 22, 46, 68, 4, '2024-03-20 00:57:14'),
(252, 1, 61, 47, 9, 55, 64, 4, '2023-05-02 13:55:22'),
(253, 2, 24, 48, 7, 59, 66, 4, '2023-06-28 07:05:54'),
(254, 2, 46, 35, 22, 11, 33, 0, '2023-12-31 07:09:00'),
(255, 4, 52, 48, 6, 20, 26, 0, '2023-09-20 16:43:49'),
(256, 1, 75, 45, 50, 56, 106, 5, '2023-12-25 06:40:12'),
(257, 3, 53, 34, 10, 17, 27, 0, '2023-10-25 20:32:45'),
(258, 1, 1, 18, 31, 25, 56, 3, '2023-09-22 17:01:07'),
(259, 2, 5, 30, 10, 8, 18, 0, '2023-09-30 19:10:55'),
(260, 2, 85, 13, 17, 16, 33, 0, '2024-02-07 18:16:28'),
(261, 3, 56, 33, 8, 17, 25, 0, '2023-07-25 14:55:01'),
(262, 4, 86, 50, 23, 50, 73, 5, '2023-10-07 12:17:56'),
(263, 1, 2, 10, 45, 17, 62, 4, '2023-08-30 00:48:37'),
(264, 1, 84, 3, 11, 29, 40, 0, '2024-03-20 12:57:32'),
(265, 3, 66, 34, 26, 51, 77, 5, '2023-11-26 13:18:15'),
(266, 1, 98, 23, 13, 25, 38, 0, '2023-12-03 16:45:32'),
(267, 3, 63, 15, 19, 56, 75, 5, '2023-10-12 03:47:14'),
(268, 2, 12, 17, 20, 11, 31, 0, '2024-01-25 14:40:30'),
(269, 2, 48, 42, 27, 8, 35, 0, '2024-04-29 12:45:12'),
(270, 2, 1, 15, 46, 50, 96, 5, '2024-02-07 21:11:08'),
(271, 1, 51, 19, 29, 22, 51, 3, '2023-08-01 03:27:28'),
(272, 2, 5, 23, 11, 53, 64, 4, '2023-10-02 14:42:57'),
(273, 1, 62, 7, 9, 41, 50, 3, '2023-05-21 12:11:21'),
(274, 1, 15, 5, 29, 43, 72, 5, '2023-12-27 02:30:40'),
(275, 4, 17, 8, 8, 21, 29, 0, '2023-09-26 08:40:22'),
(276, 1, 19, 36, 47, 25, 72, 5, '2023-07-15 05:04:12'),
(277, 2, 45, 5, 27, 23, 50, 3, '2023-09-20 12:11:50'),
(278, 4, 52, 1, 34, 52, 86, 5, '2023-10-27 01:05:00'),
(279, 4, 61, 20, 42, 13, 55, 3, '2023-11-24 15:22:15'),
(280, 3, 77, 31, 30, 18, 48, 2, '2023-12-01 10:30:22'),
(281, 3, 31, 33, 5, 18, 23, 0, '2023-11-10 09:30:38'),
(282, 3, 64, 5, 21, 9, 30, 0, '2023-08-10 21:45:59'),
(283, 1, 61, 38, 34, 4, 38, 0, '2024-03-10 03:14:41'),
(284, 1, 78, 2, 8, 14, 22, 0, '2024-04-21 12:20:13'),
(285, 3, 62, 48, 6, 13, 19, 0, '2023-05-05 14:30:14'),
(286, 3, 38, 38, 6, 37, 43, 0, '2023-11-08 23:04:56'),
(287, 2, 1, 13, 32, 41, 73, 5, '2023-09-13 01:16:22'),
(288, 3, 59, 20, 38, 26, 64, 4, '2023-05-05 12:01:39'),
(289, 2, 86, 31, 11, 53, 64, 4, '2024-04-11 13:21:51'),
(290, 2, 67, 50, 16, 43, 59, 3, '2024-01-11 11:46:30'),
(291, 3, 72, 6, 19, 40, 59, 3, '2023-10-11 18:59:00'),
(292, 2, 16, 21, 45, 45, 90, 5, '2023-09-14 05:52:39'),
(293, 3, 78, 22, 34, 38, 72, 5, '2023-06-29 10:12:06'),
(294, 4, 83, 42, 44, 7, 51, 3, '2023-05-29 10:58:50'),
(295, 1, 91, 23, 35, 18, 53, 3, '2024-03-02 07:14:28'),
(296, 4, 17, 49, 25, 43, 68, 4, '2023-11-21 21:36:05'),
(297, 4, 13, 50, 9, 35, 44, 0, '2023-10-08 00:12:57'),
(298, 4, 84, 8, 17, 27, 44, 0, '2023-06-29 04:24:33'),
(299, 1, 73, 37, 35, 32, 67, 4, '2024-01-31 20:53:04'),
(300, 1, 99, 31, 5, 42, 47, 2, '2023-08-18 12:13:47'),
(301, 2, 98, 45, 24, 43, 67, 4, '2024-02-19 13:14:35'),
(302, 4, 86, 9, 37, 22, 59, 3, '2023-08-01 18:42:24'),
(303, 1, 50, 2, 40, 39, 79, 5, '2023-07-06 01:22:52'),
(304, 1, 76, 37, 46, 16, 62, 4, '2023-07-15 10:54:12'),
(305, 2, 98, 45, 39, 11, 50, 3, '2023-07-14 14:01:08'),
(306, 3, 84, 34, 21, 37, 58, 3, '2024-04-28 02:29:31'),
(307, 1, 76, 29, 20, 58, 78, 5, '2023-06-14 00:22:21'),
(308, 3, 20, 7, 41, 57, 98, 5, '2023-06-11 01:41:37'),
(309, 2, 48, 35, 21, 42, 63, 4, '2023-12-09 23:35:32'),
(310, 1, 3, 31, 39, 31, 70, 5, '2023-05-04 08:14:32'),
(311, 4, 7, 42, 7, 24, 31, 0, '2024-01-01 17:02:30'),
(312, 2, 81, 32, 17, 30, 47, 2, '2024-01-25 07:27:18'),
(313, 2, 4, 28, 24, 44, 68, 4, '2023-07-12 17:51:14'),
(314, 2, 35, 46, 36, 12, 48, 2, '2023-07-02 14:03:15'),
(315, 4, 71, 43, 36, 48, 84, 5, '2023-12-06 18:08:42'),
(316, 2, 79, 50, 32, 29, 61, 4, '2023-06-04 18:08:22'),
(317, 1, 65, 11, 26, 7, 33, 0, '2024-04-28 00:49:24'),
(318, 2, 23, 14, 23, 41, 64, 4, '2024-01-06 01:05:00'),
(319, 3, 83, 45, 25, 29, 54, 3, '2024-03-11 21:12:02'),
(320, 4, 21, 9, 44, 38, 82, 5, '2023-11-23 14:31:22'),
(321, 3, 6, 44, 16, 60, 76, 5, '2023-06-01 19:52:12'),
(322, 3, 78, 27, 36, 2, 38, 0, '2023-10-06 03:03:22'),
(323, 4, 25, 26, 39, 13, 52, 3, '2023-06-10 01:45:28'),
(324, 1, 98, 23, 36, 21, 57, 3, '2023-12-04 12:49:12'),
(325, 2, 84, 28, 46, 28, 74, 5, '2024-04-04 16:17:28'),
(326, 4, 65, 32, 21, 34, 55, 3, '2023-06-22 15:34:41'),
(327, 3, 40, 2, 50, 46, 96, 5, '2023-12-20 23:04:48'),
(328, 2, 20, 45, 40, 12, 52, 3, '2023-06-16 12:03:55'),
(329, 1, 2, 24, 27, 40, 67, 4, '2024-01-13 01:11:42'),
(330, 4, 37, 23, 32, 45, 77, 5, '2024-01-23 07:27:24'),
(331, 3, 78, 30, 45, 20, 65, 4, '2023-08-14 12:05:09'),
(332, 4, 47, 49, 7, 45, 52, 3, '2023-11-26 18:52:48'),
(333, 3, 19, 43, 21, 23, 44, 0, '2023-05-05 19:02:17'),
(334, 2, 37, 7, 35, 23, 58, 3, '2024-02-25 21:40:02'),
(335, 2, 49, 33, 19, 50, 69, 4, '2024-02-14 18:30:44'),
(336, 4, 19, 34, 33, 48, 81, 5, '2023-08-20 01:28:46'),
(337, 1, 14, 23, 14, 41, 55, 3, '2024-02-15 13:35:59'),
(338, 3, 64, 29, 28, 35, 63, 4, '2023-12-27 02:49:08'),
(339, 1, 42, 34, 18, 7, 25, 0, '2023-05-11 12:09:20'),
(340, 2, 67, 9, 22, 19, 41, 0, '2023-06-10 13:19:17'),
(341, 1, 58, 38, 33, 34, 67, 4, '2024-01-23 02:25:07'),
(342, 2, 68, 35, 16, 49, 65, 4, '2023-12-29 03:47:03'),
(343, 3, 23, 6, 18, 54, 72, 5, '2023-05-25 21:08:49'),
(344, 4, 70, 6, 30, 55, 85, 5, '2023-05-06 04:18:12'),
(345, 1, 4, 48, 18, 23, 41, 0, '2023-06-24 22:26:28'),
(346, 3, 55, 47, 17, 14, 31, 0, '2023-11-24 19:43:49'),
(347, 2, 50, 3, 13, 55, 68, 4, '2023-12-28 10:33:20'),
(348, 4, 56, 7, 50, 35, 85, 5, '2023-05-29 09:42:10'),
(349, 1, 71, 38, 14, 12, 26, 0, '2023-11-09 05:56:52'),
(350, 3, 88, 2, 20, 37, 57, 3, '2023-08-26 06:59:51'),
(351, 4, 69, 29, 8, 21, 29, 0, '2023-08-18 20:43:46'),
(352, 2, 60, 13, 26, 44, 70, 5, '2023-06-06 09:50:56'),
(353, 2, 59, 38, 20, 25, 45, 2, '2023-06-23 13:08:25'),
(354, 1, 42, 7, 47, 48, 95, 5, '2023-08-11 15:23:06'),
(355, 3, 33, 50, 44, 42, 86, 5, '2024-02-25 08:17:25'),
(356, 1, 84, 31, 29, 31, 60, 4, '2023-07-30 14:02:58'),
(357, 2, 71, 33, 29, 35, 64, 4, '2023-12-04 17:47:25'),
(358, 1, 86, 39, 15, 34, 49, 2, '2023-10-16 01:42:49'),
(359, 2, 25, 9, 8, 34, 42, 0, '2023-10-23 12:38:57'),
(360, 4, 40, 20, 15, 35, 50, 3, '2023-05-14 05:06:26'),
(361, 3, 6, 47, 19, 15, 34, 0, '2023-12-15 07:31:26'),
(362, 3, 86, 1, 48, 35, 83, 5, '2024-01-17 06:47:19'),
(363, 3, 25, 10, 8, 4, 12, 0, '2024-03-07 04:59:30'),
(364, 1, 78, 26, 29, 24, 53, 3, '2023-12-11 02:20:34'),
(365, 4, 29, 19, 40, 39, 79, 5, '2023-05-09 17:11:14'),
(366, 1, 18, 50, 33, 56, 89, 5, '2023-10-29 03:11:14'),
(367, 1, 3, 19, 9, 54, 63, 4, '2024-04-05 02:28:46'),
(368, 2, 69, 19, 31, 31, 62, 4, '2024-03-05 05:07:44'),
(369, 1, 18, 43, 11, 17, 28, 0, '2023-06-21 03:00:23'),
(370, 1, 43, 6, 13, 14, 27, 0, '2023-05-27 16:40:06'),
(371, 4, 62, 5, 31, 34, 65, 4, '2023-06-28 21:56:56'),
(372, 4, 22, 19, 7, 34, 41, 0, '2023-12-24 12:34:37'),
(373, 3, 58, 3, 10, 58, 68, 4, '2023-08-04 20:17:34'),
(374, 2, 33, 41, 24, 53, 77, 5, '2023-08-23 11:39:15'),
(375, 2, 40, 30, 8, 20, 28, 0, '2023-12-14 06:11:32'),
(376, 2, 93, 46, 9, 44, 53, 3, '2024-03-10 18:45:28'),
(377, 4, 87, 27, 32, 29, 61, 4, '2024-03-14 22:59:29'),
(378, 4, 20, 48, 14, 11, 25, 0, '2023-11-17 13:28:13'),
(379, 4, 73, 20, 8, 36, 44, 0, '2023-05-16 19:37:53'),
(380, 4, 26, 28, 8, 58, 66, 4, '2023-11-19 14:59:31'),
(381, 3, 12, 12, 15, 58, 73, 5, '2023-05-24 16:17:38'),
(382, 2, 25, 43, 27, 37, 64, 4, '2023-10-26 19:45:39'),
(383, 2, 68, 36, 36, 9, 45, 2, '2023-06-10 06:49:30'),
(384, 3, 32, 35, 44, 4, 48, 2, '2024-01-05 12:57:59'),
(385, 3, 50, 20, 24, 36, 60, 4, '2023-07-06 17:42:36'),
(386, 2, 78, 35, 21, 30, 51, 3, '2023-11-07 04:21:49'),
(387, 3, 68, 46, 48, 52, 100, 5, '2023-08-15 17:18:51'),
(388, 4, 3, 20, 45, 16, 61, 4, '2024-03-28 10:54:40'),
(389, 2, 94, 36, 48, 14, 62, 4, '2023-07-12 15:39:13'),
(390, 2, 48, 34, 46, 36, 82, 5, '2023-06-04 10:40:35'),
(391, 2, 26, 2, 35, 39, 74, 5, '2024-01-27 21:11:38'),
(392, 2, 76, 31, 35, 1, 36, 0, '2023-11-28 01:17:58'),
(393, 2, 56, 7, 46, 55, 101, 5, '2023-12-07 00:25:39'),
(394, 3, 64, 43, 44, 26, 70, 5, '2024-02-26 19:16:19'),
(395, 3, 25, 44, 24, 46, 70, 5, '2024-02-25 10:02:03'),
(396, 1, 42, 32, 45, 23, 68, 4, '2023-05-02 18:23:11'),
(397, 2, 74, 37, 16, 8, 24, 0, '2024-03-30 09:46:51'),
(398, 2, 35, 13, 47, 54, 101, 5, '2024-01-20 02:28:49'),
(399, 1, 20, 31, 31, 33, 64, 4, '2023-06-29 23:18:23'),
(400, 1, 18, 14, 47, 57, 104, 5, '2024-01-11 01:04:59'),
(401, 4, 5, 24, 16, 30, 46, 2, '2024-03-01 19:12:54'),
(402, 3, 28, 19, 21, 39, 60, 4, '2023-05-07 21:56:14'),
(403, 3, 37, 24, 35, 56, 91, 5, '2023-12-14 13:36:02'),
(404, 2, 13, 4, 14, 11, 25, 0, '2024-01-21 14:28:33'),
(405, 4, 49, 4, 37, 10, 47, 2, '2024-01-20 16:26:20'),
(406, 4, 64, 48, 31, 2, 33, 0, '2023-11-17 02:48:27'),
(407, 2, 38, 46, 41, 38, 79, 5, '2023-07-07 17:49:15'),
(408, 1, 95, 19, 15, 55, 70, 5, '2023-12-10 04:08:23'),
(409, 3, 61, 21, 11, 45, 56, 3, '2024-03-01 00:03:47'),
(410, 4, 43, 19, 17, 55, 72, 5, '2023-08-27 16:37:07'),
(411, 1, 96, 31, 25, 1, 26, 0, '2023-12-16 11:01:28'),
(412, 3, 64, 33, 35, 9, 44, 0, '2023-11-13 08:42:34'),
(413, 1, 19, 42, 17, 39, 56, 3, '2023-07-25 21:47:34'),
(414, 3, 53, 18, 46, 5, 51, 3, '2023-09-13 08:39:15'),
(415, 2, 49, 30, 22, 36, 58, 3, '2023-08-03 03:56:52'),
(416, 2, 57, 46, 13, 56, 69, 4, '2023-12-02 13:03:19'),
(417, 4, 40, 36, 18, 43, 61, 4, '2023-05-26 22:31:28'),
(418, 2, 24, 9, 48, 44, 92, 5, '2023-05-21 10:57:04'),
(419, 2, 91, 49, 15, 46, 61, 4, '2023-07-16 06:34:18'),
(420, 4, 83, 34, 49, 53, 102, 5, '2023-12-24 22:42:27'),
(421, 2, 74, 28, 24, 20, 44, 0, '2023-09-10 01:48:40'),
(422, 4, 56, 41, 44, 55, 99, 5, '2024-03-22 16:31:48'),
(423, 1, 76, 45, 48, 34, 82, 5, '2024-02-24 00:09:16'),
(424, 3, 62, 10, 23, 16, 39, 0, '2023-11-10 19:46:29'),
(425, 4, 51, 32, 43, 51, 94, 5, '2023-06-18 06:14:10'),
(426, 3, 19, 36, 33, 44, 77, 5, '2024-03-05 23:07:17'),
(427, 3, 65, 31, 19, 19, 38, 0, '2023-05-15 19:09:33'),
(428, 3, 32, 8, 23, 5, 28, 0, '2023-12-01 02:32:58'),
(429, 4, 6, 27, 28, 4, 32, 0, '2023-11-21 08:16:18'),
(430, 4, 79, 42, 24, 43, 67, 4, '2023-11-03 23:06:15'),
(431, 2, 94, 25, 42, 41, 83, 5, '2024-02-29 02:32:41'),
(432, 3, 85, 39, 16, 58, 74, 5, '2023-06-30 05:56:59'),
(433, 4, 12, 40, 24, 11, 35, 0, '2023-05-06 02:34:20'),
(434, 3, 16, 26, 10, 11, 21, 0, '2023-08-16 16:40:53'),
(435, 2, 48, 5, 32, 48, 80, 5, '2023-10-08 03:54:12'),
(436, 4, 53, 9, 40, 23, 63, 4, '2024-03-11 13:45:17'),
(437, 3, 85, 43, 44, 33, 77, 5, '2023-09-03 23:25:46'),
(438, 4, 98, 41, 38, 43, 81, 5, '2023-07-19 10:05:58'),
(439, 3, 40, 23, 20, 60, 80, 5, '2024-03-03 18:49:58'),
(440, 3, 72, 15, 23, 39, 62, 4, '2023-07-24 05:05:13'),
(441, 2, 31, 14, 48, 45, 93, 5, '2023-06-28 04:57:10'),
(442, 3, 97, 39, 44, 51, 95, 5, '2024-02-07 01:58:43'),
(443, 4, 70, 29, 9, 44, 53, 3, '2023-05-18 00:42:08'),
(444, 3, 99, 34, 35, 29, 64, 4, '2023-05-13 11:25:49'),
(445, 2, 37, 43, 46, 13, 59, 3, '2024-04-13 09:05:50'),
(446, 1, 57, 6, 26, 29, 55, 3, '2024-03-06 09:01:59'),
(447, 2, 1, 35, 17, 22, 39, 0, '2024-01-20 19:26:37'),
(448, 2, 62, 47, 37, 58, 95, 5, '2023-08-13 17:32:45'),
(449, 4, 57, 8, 39, 39, 78, 5, '2023-12-31 23:13:03'),
(450, 4, 27, 22, 36, 48, 84, 5, '2023-10-27 23:44:39'),
(451, 4, 28, 22, 17, 29, 46, 2, '2024-02-23 12:43:42'),
(452, 2, 79, 15, 45, 29, 74, 5, '2023-05-27 15:26:20'),
(453, 2, 8, 1, 33, 43, 76, 5, '2023-07-04 10:22:30'),
(454, 3, 16, 9, 8, 2, 10, 0, '2023-11-14 20:17:16'),
(455, 3, 66, 22, 50, 4, 54, 3, '2023-06-23 12:13:48'),
(456, 4, 63, 22, 43, 35, 78, 5, '2024-01-25 17:49:51'),
(457, 2, 55, 49, 41, 22, 63, 4, '2024-01-23 11:34:10'),
(458, 2, 81, 20, 42, 38, 80, 5, '2023-05-30 00:55:53'),
(459, 4, 69, 18, 45, 45, 90, 5, '2024-03-05 06:23:39'),
(460, 1, 26, 39, 8, 35, 43, 0, '2023-05-27 07:03:55'),
(461, 4, 79, 39, 6, 49, 55, 3, '2024-02-02 05:53:16'),
(462, 2, 84, 37, 45, 52, 97, 5, '2024-01-02 11:47:40'),
(463, 1, 24, 11, 15, 52, 67, 4, '2023-11-11 18:24:38'),
(464, 2, 6, 33, 10, 3, 13, 0, '2024-04-19 05:09:13'),
(465, 3, 84, 21, 20, 14, 34, 0, '2023-05-15 20:15:49'),
(466, 1, 41, 21, 39, 46, 85, 5, '2023-07-11 16:00:07'),
(467, 4, 35, 41, 30, 57, 87, 5, '2023-10-18 08:20:10'),
(468, 4, 7, 7, 29, 43, 72, 5, '2023-09-19 01:58:12'),
(469, 2, 75, 49, 7, 5, 12, 0, '2024-01-01 07:05:33'),
(470, 3, 42, 34, 48, 8, 56, 3, '2024-02-11 09:21:12'),
(471, 3, 58, 14, 26, 24, 50, 3, '2024-01-22 21:22:13'),
(472, 2, 55, 7, 33, 52, 85, 5, '2024-02-04 05:46:34'),
(473, 1, 20, 46, 45, 54, 99, 5, '2024-01-27 06:31:24'),
(474, 4, 10, 45, 7, 37, 44, 0, '2023-09-11 22:49:49'),
(475, 1, 14, 14, 34, 59, 93, 5, '2023-10-12 02:03:07'),
(476, 3, 26, 8, 17, 6, 23, 0, '2023-10-12 00:02:08'),
(477, 1, 15, 39, 30, 46, 76, 5, '2023-08-26 06:39:55'),
(478, 1, 87, 23, 37, 45, 82, 5, '2023-09-05 20:47:47'),
(479, 2, 95, 42, 18, 52, 70, 5, '2023-12-11 15:41:32'),
(480, 1, 74, 49, 38, 3, 41, 0, '2023-05-17 15:09:08'),
(481, 1, 2, 18, 26, 12, 38, 0, '2024-04-03 21:47:28'),
(482, 2, 46, 38, 29, 24, 53, 3, '2024-03-21 23:10:08'),
(483, 4, 46, 34, 14, 57, 71, 5, '2023-07-31 00:36:57'),
(484, 1, 46, 44, 8, 38, 46, 2, '2023-07-02 19:36:28'),
(485, 1, 44, 38, 17, 43, 60, 4, '2023-12-16 18:15:37'),
(486, 3, 57, 44, 36, 40, 76, 5, '2023-08-29 11:01:18'),
(487, 1, 19, 50, 49, 25, 74, 5, '2023-08-27 07:22:41'),
(488, 2, 7, 10, 31, 18, 49, 2, '2023-12-16 09:39:19'),
(489, 4, 62, 47, 7, 46, 53, 3, '2023-11-09 00:11:02'),
(490, 2, 19, 43, 35, 60, 95, 5, '2023-05-19 01:02:28'),
(491, 4, 48, 18, 19, 58, 77, 5, '2023-05-07 03:56:30'),
(492, 2, 2, 41, 25, 24, 49, 2, '2024-04-24 11:51:39'),
(493, 4, 25, 49, 43, 45, 88, 5, '2024-02-21 22:20:07'),
(494, 3, 8, 29, 40, 30, 70, 5, '2023-10-18 14:36:38'),
(495, 1, 10, 33, 25, 15, 40, 0, '2023-11-23 07:18:11'),
(496, 3, 47, 3, 5, 4, 9, 0, '2024-03-01 03:36:12'),
(497, 4, 5, 45, 16, 37, 53, 3, '2023-06-14 14:41:16'),
(498, 4, 93, 27, 18, 5, 23, 0, '2023-09-28 15:17:01'),
(499, 3, 13, 7, 20, 44, 64, 4, '2024-02-12 10:13:40'),
(500, 3, 4, 26, 30, 32, 62, 4, '2023-09-07 07:17:18'),
(501, 1, 2, 29, 36, 24, 60, 4, '2024-01-13 02:53:10'),
(502, 3, 26, 21, 47, 40, 87, 5, '2023-08-13 06:49:59'),
(503, 3, 10, 41, 14, 15, 29, 0, '2023-11-30 05:58:49'),
(504, 3, 71, 25, 45, 26, 71, 5, '2023-10-10 14:59:00'),
(505, 4, 91, 31, 14, 53, 67, 4, '2024-03-24 00:48:27'),
(506, 1, 87, 48, 32, 44, 76, 5, '2024-01-17 05:01:36'),
(507, 4, 68, 16, 24, 54, 78, 5, '2023-06-21 13:07:19'),
(508, 2, 36, 41, 50, 51, 101, 5, '2024-04-16 09:05:05'),
(509, 3, 40, 32, 42, 31, 73, 5, '2024-02-23 08:15:23'),
(510, 3, 28, 32, 50, 59, 109, 5, '2023-12-13 16:32:54'),
(511, 2, 24, 6, 11, 13, 24, 0, '2024-04-16 20:46:39'),
(512, 3, 6, 22, 17, 55, 72, 5, '2023-10-22 11:14:48'),
(513, 4, 56, 15, 36, 35, 71, 5, '2023-10-08 02:43:30'),
(514, 4, 59, 4, 20, 55, 75, 5, '2024-02-29 05:49:15'),
(515, 3, 48, 37, 15, 43, 58, 3, '2024-01-08 05:01:31'),
(516, 2, 31, 6, 47, 5, 52, 3, '2023-10-16 23:01:02'),
(517, 3, 40, 13, 25, 8, 33, 0, '2024-04-11 15:11:29'),
(518, 2, 47, 4, 33, 36, 69, 4, '2023-06-20 11:05:32'),
(519, 4, 31, 44, 7, 18, 25, 0, '2024-01-08 17:17:30'),
(520, 3, 52, 35, 9, 54, 63, 4, '2023-05-30 00:18:38'),
(521, 2, 8, 3, 33, 55, 88, 5, '2023-10-09 17:51:18'),
(522, 1, 62, 41, 48, 45, 93, 5, '2024-03-20 20:05:02'),
(523, 4, 32, 42, 29, 52, 81, 5, '2023-11-21 16:10:49'),
(524, 4, 96, 21, 14, 58, 72, 5, '2023-11-16 12:51:15'),
(525, 3, 6, 48, 17, 41, 58, 3, '2024-04-06 13:17:43'),
(526, 3, 30, 15, 11, 58, 69, 4, '2024-03-24 13:53:07'),
(527, 4, 82, 16, 21, 2, 23, 0, '2023-07-13 09:27:31'),
(528, 1, 11, 47, 15, 40, 55, 3, '2023-12-13 14:51:32'),
(529, 4, 12, 33, 34, 24, 58, 3, '2024-03-22 05:52:47'),
(530, 3, 56, 40, 19, 55, 74, 5, '2024-04-12 02:32:44'),
(531, 3, 60, 40, 45, 52, 97, 5, '2023-06-07 22:42:12'),
(532, 1, 75, 19, 30, 51, 81, 5, '2023-05-17 18:03:04'),
(533, 1, 72, 30, 6, 46, 52, 3, '2023-10-25 13:12:09'),
(534, 1, 65, 48, 22, 34, 56, 3, '2023-09-10 09:10:25'),
(535, 1, 54, 1, 38, 24, 62, 4, '2024-03-17 09:50:53'),
(536, 2, 27, 35, 41, 19, 60, 4, '2024-01-11 16:43:33'),
(537, 2, 48, 19, 20, 19, 39, 0, '2023-08-03 15:39:10'),
(538, 3, 90, 26, 42, 14, 56, 3, '2023-05-22 22:17:14'),
(539, 1, 83, 14, 12, 51, 63, 4, '2024-02-16 00:29:19'),
(540, 3, 10, 6, 21, 35, 56, 3, '2023-06-21 04:23:40'),
(541, 3, 6, 41, 6, 17, 23, 0, '2024-04-15 13:11:58'),
(542, 3, 1, 16, 43, 26, 69, 4, '2023-07-04 05:18:44'),
(543, 3, 36, 19, 14, 60, 74, 5, '2024-04-05 16:46:22'),
(544, 3, 65, 32, 29, 11, 40, 0, '2023-10-31 03:46:14'),
(545, 1, 16, 18, 6, 16, 22, 0, '2023-12-01 10:04:21'),
(546, 1, 89, 42, 18, 34, 52, 3, '2023-09-02 22:25:11'),
(547, 4, 22, 7, 14, 40, 54, 3, '2023-05-23 22:24:16'),
(548, 4, 66, 2, 13, 23, 36, 0, '2023-06-09 04:11:32'),
(549, 2, 39, 24, 5, 60, 65, 4, '2023-07-25 14:01:14'),
(550, 3, 64, 38, 43, 22, 65, 4, '2023-05-10 04:12:42'),
(551, 1, 27, 37, 37, 46, 83, 5, '2023-08-20 13:16:05'),
(552, 4, 70, 19, 30, 31, 61, 4, '2023-07-01 07:23:14'),
(553, 4, 99, 50, 33, 58, 91, 5, '2024-01-11 14:01:43'),
(554, 4, 57, 8, 17, 21, 38, 0, '2023-09-17 09:16:32'),
(555, 4, 75, 46, 11, 36, 47, 2, '2024-01-05 08:19:14'),
(556, 4, 62, 37, 47, 57, 104, 5, '2024-03-22 18:54:28'),
(557, 1, 85, 29, 22, 5, 27, 0, '2023-10-30 01:39:20'),
(558, 1, 69, 8, 37, 25, 62, 4, '2023-10-03 11:46:11'),
(559, 2, 90, 45, 35, 14, 49, 2, '2023-12-17 13:17:14'),
(560, 2, 87, 10, 33, 26, 59, 3, '2023-11-17 02:37:32'),
(561, 3, 54, 6, 29, 53, 82, 5, '2023-05-10 09:18:01'),
(562, 2, 8, 20, 24, 56, 80, 5, '2023-11-05 11:08:06'),
(563, 4, 24, 34, 23, 41, 64, 4, '2023-10-17 09:20:42'),
(564, 2, 23, 46, 13, 46, 59, 3, '2024-01-24 13:26:41'),
(565, 1, 17, 42, 26, 27, 53, 3, '2023-09-08 14:30:14'),
(566, 3, 71, 27, 6, 38, 44, 0, '2023-09-23 01:15:06'),
(567, 3, 95, 9, 50, 37, 87, 5, '2023-10-29 21:50:53'),
(568, 3, 56, 40, 45, 50, 95, 5, '2023-07-26 21:15:01'),
(569, 1, 36, 9, 23, 54, 77, 5, '2023-07-16 00:31:27'),
(570, 4, 34, 18, 33, 29, 62, 4, '2024-02-28 02:13:54'),
(571, 2, 91, 45, 23, 24, 47, 2, '2024-02-12 20:15:01'),
(572, 2, 49, 36, 40, 49, 89, 5, '2024-03-27 13:34:59'),
(573, 1, 62, 19, 19, 33, 52, 3, '2023-06-30 13:03:56'),
(574, 4, 60, 47, 22, 51, 73, 5, '2023-07-12 09:23:40'),
(575, 4, 49, 6, 31, 42, 73, 5, '2024-02-10 06:57:55'),
(576, 4, 77, 50, 35, 59, 94, 5, '2023-11-19 10:28:58'),
(577, 2, 88, 45, 22, 7, 29, 0, '2024-01-08 03:07:59'),
(578, 4, 27, 43, 44, 45, 89, 5, '2023-07-07 11:46:28'),
(579, 4, 62, 1, 6, 30, 36, 0, '2024-04-19 00:52:47'),
(580, 4, 25, 45, 46, 53, 99, 5, '2023-06-06 18:51:33'),
(581, 2, 63, 24, 20, 12, 32, 0, '2024-03-14 14:20:37'),
(582, 1, 34, 30, 41, 27, 68, 4, '2023-05-17 08:47:41'),
(583, 1, 99, 8, 25, 48, 73, 5, '2023-10-26 19:38:22'),
(584, 1, 87, 3, 37, 1, 38, 0, '2023-09-19 00:45:23'),
(585, 1, 1, 6, 5, 32, 37, 0, '2024-04-05 09:17:17'),
(586, 1, 80, 22, 37, 19, 56, 3, '2023-05-11 00:43:41'),
(587, 2, 27, 26, 35, 6, 41, 0, '2023-08-10 19:14:25'),
(588, 1, 60, 41, 34, 25, 59, 3, '2023-07-03 14:35:59'),
(589, 3, 15, 38, 41, 11, 52, 3, '2023-07-07 07:55:44'),
(590, 4, 76, 24, 20, 10, 30, 0, '2024-01-15 16:38:07'),
(591, 3, 89, 16, 34, 23, 57, 3, '2023-09-24 03:59:14'),
(592, 1, 17, 13, 32, 44, 76, 5, '2023-05-28 19:23:45'),
(593, 2, 81, 4, 25, 38, 63, 4, '2024-04-17 14:21:25'),
(594, 1, 10, 8, 35, 49, 84, 5, '2023-06-08 07:49:12'),
(595, 4, 62, 11, 29, 24, 53, 3, '2023-10-24 15:31:39'),
(596, 1, 56, 34, 6, 33, 39, 0, '2024-01-02 06:02:12'),
(597, 3, 12, 48, 8, 31, 39, 0, '2024-03-08 05:28:30'),
(598, 3, 10, 15, 30, 6, 36, 0, '2024-03-22 13:24:16'),
(599, 3, 88, 22, 50, 48, 98, 5, '2024-03-08 18:11:46'),
(600, 2, 85, 3, 26, 20, 46, 2, '2023-06-10 14:03:36'),
(601, 4, 10, 7, 38, 1, 39, 0, '2023-11-08 09:54:41'),
(602, 1, 53, 50, 10, 51, 61, 4, '2023-10-17 23:55:46'),
(603, 4, 54, 23, 32, 42, 74, 5, '2024-04-25 23:56:52'),
(604, 1, 68, 8, 39, 22, 61, 4, '2023-09-02 18:36:28'),
(605, 2, 84, 48, 21, 17, 38, 0, '2023-09-25 09:41:18'),
(606, 3, 72, 1, 30, 55, 85, 5, '2023-09-30 20:14:11'),
(607, 2, 56, 43, 49, 34, 83, 5, '2023-11-08 08:07:42'),
(608, 1, 76, 34, 7, 50, 57, 3, '2023-11-09 15:32:03'),
(609, 3, 11, 48, 49, 4, 53, 3, '2023-11-25 21:22:14'),
(610, 3, 34, 46, 43, 26, 69, 4, '2023-05-05 18:41:36'),
(611, 1, 6, 43, 37, 24, 61, 4, '2023-06-13 16:05:42'),
(612, 1, 76, 4, 7, 5, 12, 0, '2024-02-20 21:12:15'),
(613, 2, 18, 9, 50, 23, 73, 5, '2023-12-01 10:26:38'),
(614, 3, 24, 30, 33, 7, 40, 0, '2023-12-22 22:43:28'),
(615, 4, 87, 43, 36, 11, 47, 2, '2023-12-19 17:25:14'),
(616, 4, 56, 2, 21, 37, 58, 3, '2024-01-28 02:15:50'),
(617, 4, 40, 31, 45, 55, 100, 5, '2023-07-04 01:55:27'),
(618, 4, 66, 50, 19, 17, 36, 0, '2024-04-08 06:35:34'),
(619, 1, 56, 20, 18, 2, 20, 0, '2023-11-05 01:23:34'),
(620, 4, 27, 42, 26, 20, 46, 2, '2023-11-07 16:39:13'),
(621, 3, 53, 18, 26, 31, 57, 3, '2024-02-21 14:20:31'),
(622, 2, 64, 14, 31, 40, 71, 5, '2023-12-24 15:41:15'),
(623, 4, 49, 1, 28, 59, 87, 5, '2023-11-23 11:07:28'),
(624, 2, 51, 25, 40, 9, 49, 2, '2024-03-13 03:01:37'),
(625, 2, 58, 14, 31, 1, 32, 0, '2023-07-13 07:13:16'),
(626, 2, 64, 16, 11, 29, 40, 0, '2023-10-08 05:55:47'),
(627, 1, 46, 11, 7, 47, 54, 3, '2024-03-16 09:48:25'),
(628, 1, 99, 48, 36, 44, 80, 5, '2023-08-29 17:26:39'),
(629, 2, 18, 41, 21, 20, 41, 0, '2023-09-01 09:25:53'),
(630, 3, 95, 3, 10, 36, 46, 2, '2024-01-03 04:08:03'),
(631, 1, 30, 36, 7, 1, 8, 0, '2024-03-04 22:35:06'),
(632, 3, 92, 25, 44, 58, 102, 5, '2023-11-08 11:06:49'),
(633, 1, 97, 5, 48, 10, 58, 3, '2024-02-01 22:55:21'),
(634, 4, 6, 17, 17, 40, 57, 3, '2023-11-11 19:18:18'),
(635, 1, 45, 18, 11, 48, 59, 3, '2024-01-11 05:59:55'),
(636, 2, 19, 39, 6, 43, 49, 2, '2024-03-14 23:38:08'),
(637, 1, 10, 6, 5, 11, 16, 0, '2024-03-14 11:56:21'),
(638, 1, 96, 2, 46, 4, 50, 3, '2024-03-23 12:15:33'),
(639, 2, 16, 19, 47, 17, 64, 4, '2023-12-12 07:42:41'),
(640, 4, 61, 24, 31, 22, 53, 3, '2024-02-13 21:18:24'),
(641, 2, 81, 19, 5, 45, 50, 3, '2023-05-05 23:38:28'),
(642, 2, 86, 38, 16, 53, 69, 4, '2023-09-27 01:27:38'),
(643, 3, 94, 45, 26, 11, 37, 0, '2023-08-13 14:08:37'),
(644, 3, 64, 22, 32, 23, 55, 3, '2024-01-31 21:06:43'),
(645, 3, 94, 44, 35, 6, 41, 0, '2023-08-02 02:13:41'),
(646, 2, 16, 46, 22, 1, 23, 0, '2023-12-05 18:56:36'),
(647, 3, 6, 3, 25, 38, 63, 4, '2024-01-25 08:54:50'),
(648, 2, 31, 22, 5, 3, 8, 0, '2023-12-13 17:53:36'),
(649, 3, 95, 31, 44, 10, 54, 3, '2023-07-01 09:39:35'),
(650, 4, 23, 24, 33, 1, 34, 0, '2024-04-22 12:06:02'),
(651, 1, 20, 17, 25, 37, 62, 4, '2023-11-22 04:12:14'),
(652, 2, 5, 6, 23, 5, 28, 0, '2023-11-20 17:04:54'),
(653, 1, 12, 20, 6, 34, 40, 0, '2024-02-07 03:27:50'),
(654, 4, 91, 5, 15, 16, 31, 0, '2024-04-07 13:18:39'),
(655, 4, 91, 31, 14, 21, 35, 0, '2024-04-25 08:38:01'),
(656, 4, 63, 28, 44, 23, 67, 4, '2023-08-05 04:40:05'),
(657, 2, 69, 14, 13, 56, 69, 4, '2023-10-05 22:54:18'),
(658, 1, 92, 45, 7, 48, 55, 3, '2023-05-26 18:28:36'),
(659, 1, 3, 44, 44, 45, 89, 5, '2024-01-18 07:02:47'),
(660, 2, 33, 16, 38, 38, 76, 5, '2023-11-17 05:19:05'),
(661, 4, 75, 27, 9, 11, 20, 0, '2023-09-28 07:42:26'),
(662, 4, 76, 30, 21, 28, 49, 2, '2024-03-11 02:17:35'),
(663, 3, 28, 4, 5, 46, 51, 3, '2024-01-01 23:34:29'),
(664, 2, 58, 13, 35, 55, 90, 5, '2023-10-07 21:07:16'),
(665, 2, 42, 13, 18, 30, 48, 2, '2024-03-20 04:03:03'),
(666, 3, 13, 46, 42, 11, 53, 3, '2023-05-31 10:34:47'),
(667, 3, 73, 7, 49, 58, 107, 5, '2024-04-03 03:51:41'),
(668, 1, 60, 33, 18, 31, 49, 2, '2023-10-25 21:31:50'),
(669, 3, 54, 8, 50, 54, 104, 5, '2024-01-24 23:34:58'),
(670, 1, 4, 10, 38, 29, 67, 4, '2024-01-27 01:42:56'),
(671, 4, 74, 47, 38, 47, 85, 5, '2023-09-12 16:33:37'),
(672, 4, 17, 24, 14, 60, 74, 5, '2023-12-04 09:40:34'),
(673, 4, 40, 35, 26, 57, 83, 5, '2023-08-23 23:07:01'),
(674, 1, 36, 34, 14, 4, 18, 0, '2023-05-28 17:34:05'),
(675, 4, 6, 20, 25, 4, 29, 0, '2023-09-18 08:38:10'),
(676, 2, 82, 5, 29, 58, 87, 5, '2023-08-26 11:38:27'),
(677, 1, 81, 42, 38, 57, 95, 5, '2023-12-01 02:24:26'),
(678, 2, 62, 50, 43, 19, 62, 4, '2023-05-23 12:29:45'),
(679, 3, 41, 44, 14, 12, 26, 0, '2023-09-03 08:06:54'),
(680, 4, 46, 3, 42, 30, 72, 5, '2024-02-02 09:36:20'),
(681, 1, 54, 1, 28, 27, 55, 3, '2024-02-23 18:28:14'),
(682, 1, 18, 21, 35, 23, 58, 3, '2023-05-24 05:00:07'),
(683, 4, 66, 26, 44, 6, 50, 3, '2024-01-08 01:08:04'),
(684, 4, 33, 41, 20, 38, 58, 3, '2023-05-22 02:21:48'),
(685, 2, 37, 42, 13, 18, 31, 0, '2023-05-31 10:20:49'),
(686, 4, 46, 37, 10, 21, 31, 0, '2024-01-27 02:58:17'),
(687, 3, 48, 49, 31, 14, 45, 2, '2024-04-28 12:19:36'),
(688, 4, 32, 48, 41, 29, 70, 5, '2023-09-24 00:43:07'),
(689, 1, 75, 31, 35, 36, 71, 5, '2024-01-22 05:23:38'),
(690, 1, 17, 25, 14, 60, 74, 5, '2024-02-13 19:05:05'),
(691, 3, 14, 26, 38, 2, 40, 0, '2023-08-11 03:17:57'),
(692, 2, 76, 20, 31, 21, 52, 3, '2023-10-01 06:45:44'),
(693, 1, 40, 38, 21, 24, 45, 2, '2023-07-19 13:30:03'),
(694, 3, 32, 29, 19, 24, 43, 0, '2023-07-11 10:31:22'),
(695, 1, 93, 5, 8, 11, 19, 0, '2024-03-27 09:20:08'),
(696, 3, 71, 21, 29, 53, 82, 5, '2024-01-03 23:54:10'),
(697, 2, 30, 36, 24, 56, 80, 5, '2023-05-16 15:25:07'),
(698, 3, 82, 18, 37, 8, 45, 2, '2023-10-10 05:43:42'),
(699, 4, 56, 48, 45, 22, 67, 4, '2023-11-27 20:00:28'),
(700, 4, 8, 14, 13, 29, 42, 0, '2023-10-28 22:12:54'),
(701, 3, 82, 5, 16, 4, 20, 0, '2024-04-16 21:46:39'),
(702, 3, 98, 1, 31, 27, 58, 3, '2023-10-24 01:42:30'),
(703, 1, 75, 33, 31, 26, 57, 3, '2023-10-05 01:43:49'),
(704, 2, 90, 11, 35, 34, 69, 4, '2024-01-03 14:51:16'),
(705, 3, 95, 35, 34, 29, 63, 4, '2023-06-26 04:11:08'),
(706, 1, 49, 31, 15, 22, 37, 0, '2023-10-03 23:20:43'),
(707, 4, 82, 4, 6, 27, 33, 0, '2023-05-05 06:01:36'),
(708, 3, 35, 28, 5, 45, 50, 3, '2024-02-17 20:19:58'),
(709, 4, 34, 9, 24, 38, 62, 4, '2023-07-19 14:30:47'),
(710, 3, 65, 31, 21, 24, 45, 2, '2023-12-30 21:49:36'),
(711, 3, 77, 7, 20, 20, 40, 0, '2023-09-04 00:06:04'),
(712, 2, 37, 42, 28, 51, 79, 5, '2023-09-10 11:29:23'),
(713, 3, 84, 40, 15, 50, 65, 4, '2023-04-30 19:33:23'),
(714, 3, 48, 7, 32, 29, 61, 4, '2023-07-24 06:54:43'),
(715, 3, 48, 20, 11, 3, 14, 0, '2023-06-13 18:33:35'),
(716, 2, 88, 18, 31, 58, 89, 5, '2023-11-20 18:00:51'),
(717, 2, 8, 4, 21, 48, 69, 4, '2023-12-05 16:29:04'),
(718, 1, 71, 21, 41, 44, 85, 5, '2023-10-25 11:19:41'),
(719, 4, 32, 33, 19, 47, 66, 4, '2023-08-10 07:15:03'),
(720, 2, 22, 49, 47, 29, 76, 5, '2023-12-04 00:14:47'),
(721, 3, 68, 46, 6, 60, 66, 4, '2023-05-27 07:38:11'),
(722, 3, 3, 48, 37, 30, 67, 4, '2023-07-26 12:45:41'),
(723, 4, 75, 42, 49, 21, 70, 5, '2023-09-07 15:21:33'),
(724, 4, 58, 6, 38, 38, 76, 5, '2024-03-02 05:07:53'),
(725, 1, 2, 16, 41, 54, 95, 5, '2023-07-09 06:20:42'),
(726, 2, 87, 4, 26, 60, 86, 5, '2023-11-21 08:39:05'),
(727, 3, 38, 43, 49, 2, 51, 3, '2023-07-03 04:18:12'),
(728, 2, 49, 12, 37, 58, 95, 5, '2023-12-30 23:01:25'),
(729, 3, 51, 3, 50, 2, 52, 3, '2023-08-13 00:27:11'),
(730, 4, 86, 24, 19, 5, 24, 0, '2023-07-06 01:31:42'),
(731, 4, 83, 33, 19, 4, 23, 0, '2023-05-15 14:22:35'),
(732, 2, 7, 22, 36, 24, 60, 4, '2024-01-24 20:09:51'),
(733, 2, 59, 44, 34, 12, 46, 2, '2024-02-19 05:10:19'),
(734, 1, 47, 29, 42, 56, 98, 5, '2024-03-31 11:53:58'),
(735, 3, 33, 19, 7, 34, 41, 0, '2023-08-14 22:03:28'),
(736, 3, 54, 15, 29, 59, 88, 5, '2023-11-02 22:04:35'),
(737, 1, 87, 22, 50, 59, 109, 5, '2023-11-17 02:57:46'),
(738, 4, 61, 29, 37, 21, 58, 3, '2023-09-14 23:49:02'),
(739, 4, 34, 50, 12, 28, 40, 0, '2023-07-24 11:57:50'),
(740, 3, 72, 19, 38, 23, 61, 4, '2023-11-03 07:07:24'),
(741, 1, 85, 47, 9, 52, 61, 4, '2024-02-12 17:53:54'),
(742, 3, 83, 4, 12, 11, 23, 0, '2023-05-30 04:31:38'),
(743, 1, 24, 49, 21, 23, 44, 0, '2023-11-14 18:29:45'),
(744, 3, 63, 28, 22, 57, 79, 5, '2024-02-14 17:14:11'),
(745, 3, 93, 35, 18, 59, 77, 5, '2023-06-26 13:57:57'),
(746, 2, 80, 23, 46, 2, 48, 2, '2023-08-18 05:49:07'),
(747, 1, 31, 29, 38, 36, 74, 5, '2023-09-14 07:25:35'),
(748, 2, 53, 31, 8, 14, 22, 0, '2024-04-21 19:23:19'),
(749, 2, 15, 12, 17, 44, 61, 4, '2023-06-13 05:19:15'),
(750, 3, 96, 15, 11, 14, 25, 0, '2023-05-27 04:56:52'),
(751, 2, 49, 1, 41, 29, 70, 5, '2024-01-31 14:23:39'),
(752, 2, 23, 20, 11, 2, 13, 0, '2023-12-19 08:07:32'),
(753, 4, 2, 24, 32, 36, 68, 4, '2024-03-10 06:47:20'),
(754, 2, 37, 2, 15, 50, 65, 4, '2023-11-23 13:57:50'),
(755, 1, 63, 48, 41, 44, 85, 5, '2023-06-07 16:23:54'),
(756, 1, 29, 7, 7, 47, 54, 3, '2023-09-18 02:05:45'),
(757, 4, 56, 14, 19, 54, 73, 5, '2023-08-07 12:56:16'),
(758, 2, 13, 48, 6, 44, 50, 3, '2023-09-13 05:33:46'),
(759, 2, 12, 38, 16, 9, 25, 0, '2023-08-26 02:15:56'),
(760, 4, 20, 19, 20, 15, 35, 0, '2023-12-12 22:53:32'),
(761, 3, 30, 29, 31, 21, 52, 3, '2023-10-29 11:15:22'),
(762, 2, 30, 23, 20, 54, 74, 5, '2023-09-23 20:38:02'),
(763, 2, 21, 46, 5, 55, 60, 4, '2024-02-19 14:52:13'),
(764, 3, 3, 49, 29, 27, 56, 3, '2023-12-16 13:23:37'),
(765, 1, 68, 22, 7, 57, 64, 4, '2023-06-30 01:57:51'),
(766, 4, 91, 7, 30, 55, 85, 5, '2023-12-27 18:04:01'),
(767, 4, 19, 38, 26, 47, 73, 5, '2023-05-20 02:01:21'),
(768, 3, 18, 36, 41, 15, 56, 3, '2023-06-07 01:15:47'),
(769, 1, 42, 15, 50, 11, 61, 4, '2024-03-12 18:03:40'),
(770, 3, 87, 41, 10, 21, 31, 0, '2023-06-08 09:13:10'),
(771, 4, 5, 13, 42, 24, 66, 4, '2024-02-22 13:54:59'),
(772, 2, 68, 6, 23, 32, 55, 3, '2024-03-15 16:14:27'),
(773, 1, 59, 28, 50, 20, 70, 5, '2023-07-28 09:13:08'),
(774, 2, 8, 15, 22, 43, 65, 4, '2024-04-17 12:11:02'),
(775, 4, 95, 1, 41, 31, 72, 5, '2024-04-27 08:52:32'),
(776, 3, 24, 24, 40, 33, 73, 5, '2023-12-03 01:59:04'),
(777, 2, 90, 28, 22, 24, 46, 2, '2023-07-09 15:35:56'),
(778, 3, 88, 15, 35, 3, 38, 0, '2023-11-16 10:53:39'),
(779, 3, 8, 17, 24, 51, 75, 5, '2023-09-14 21:20:10'),
(780, 3, 38, 17, 36, 44, 80, 5, '2023-05-13 18:41:09'),
(781, 2, 51, 4, 45, 39, 84, 5, '2023-09-05 19:00:35'),
(782, 1, 95, 46, 11, 16, 27, 0, '2023-08-01 01:42:10'),
(783, 3, 16, 14, 36, 20, 56, 3, '2023-12-03 00:00:10'),
(784, 1, 96, 39, 24, 2, 26, 0, '2023-05-13 15:10:29'),
(785, 3, 45, 31, 17, 10, 27, 0, '2023-09-07 09:22:04'),
(786, 2, 14, 16, 16, 41, 57, 3, '2023-10-21 16:37:00'),
(787, 3, 26, 50, 24, 6, 30, 0, '2023-10-10 05:04:56'),
(788, 2, 85, 27, 11, 33, 44, 0, '2023-05-17 00:26:15'),
(789, 4, 89, 30, 42, 30, 72, 5, '2023-08-02 22:41:13'),
(790, 2, 88, 22, 8, 44, 52, 3, '2023-09-17 06:34:54'),
(791, 4, 98, 7, 47, 2, 49, 2, '2024-01-09 13:33:53'),
(792, 1, 8, 21, 48, 15, 63, 4, '2024-01-17 09:08:20'),
(793, 3, 58, 33, 37, 8, 45, 2, '2023-07-18 00:05:44'),
(794, 1, 20, 2, 50, 53, 103, 5, '2023-05-09 07:49:56'),
(795, 3, 85, 6, 14, 59, 73, 5, '2023-09-19 13:38:02'),
(796, 4, 91, 30, 44, 19, 63, 4, '2023-08-06 01:35:07'),
(797, 2, 65, 43, 44, 31, 75, 5, '2024-01-26 22:30:26'),
(798, 4, 38, 42, 26, 55, 81, 5, '2023-07-11 14:08:31'),
(799, 4, 9, 7, 15, 21, 36, 0, '2024-01-30 22:26:15'),
(800, 1, 52, 21, 16, 46, 62, 4, '2024-02-02 07:07:29'),
(801, 4, 21, 18, 46, 40, 86, 5, '2023-05-28 19:13:39'),
(802, 1, 59, 9, 11, 60, 71, 5, '2023-06-30 05:36:24'),
(803, 1, 22, 41, 31, 56, 87, 5, '2023-12-31 13:11:45'),
(804, 1, 25, 32, 49, 21, 70, 5, '2023-05-17 01:02:05'),
(805, 1, 96, 30, 27, 43, 70, 5, '2024-04-26 06:54:26'),
(806, 2, 50, 44, 19, 52, 71, 5, '2023-10-04 18:12:28'),
(807, 2, 14, 23, 6, 56, 62, 4, '2023-11-27 00:56:37'),
(808, 3, 20, 42, 42, 14, 56, 3, '2024-03-08 18:31:14'),
(809, 1, 41, 35, 38, 38, 76, 5, '2023-09-04 10:45:52'),
(810, 1, 50, 32, 5, 53, 58, 3, '2024-01-02 14:12:20'),
(811, 1, 65, 12, 37, 52, 89, 5, '2023-10-28 20:27:16'),
(812, 3, 41, 4, 19, 44, 63, 4, '2023-08-13 06:59:27'),
(813, 3, 59, 20, 5, 20, 25, 0, '2023-09-27 13:10:40'),
(814, 3, 37, 30, 49, 59, 108, 5, '2023-07-04 00:15:33'),
(815, 3, 56, 18, 38, 18, 56, 3, '2023-07-31 20:06:37'),
(816, 4, 60, 24, 38, 48, 86, 5, '2024-04-02 04:25:01'),
(817, 1, 39, 6, 17, 13, 30, 0, '2024-04-12 19:49:36'),
(818, 3, 44, 9, 7, 57, 64, 4, '2024-01-21 20:12:50'),
(819, 3, 21, 17, 35, 3, 38, 0, '2023-12-18 23:55:15'),
(820, 2, 52, 27, 15, 28, 43, 0, '2024-02-28 13:48:49'),
(821, 3, 6, 14, 27, 18, 45, 2, '2023-12-18 03:02:12'),
(822, 4, 76, 37, 32, 48, 80, 5, '2023-08-02 06:59:57'),
(823, 1, 66, 6, 42, 44, 86, 5, '2024-02-14 21:05:42'),
(824, 4, 28, 5, 22, 19, 41, 0, '2023-09-05 21:42:43'),
(825, 3, 64, 48, 39, 59, 98, 5, '2023-09-19 00:28:38'),
(826, 3, 17, 26, 30, 16, 46, 2, '2023-09-19 08:20:07'),
(827, 2, 60, 10, 38, 37, 75, 5, '2023-08-17 19:32:07'),
(828, 4, 31, 4, 37, 38, 75, 5, '2023-11-15 12:34:22'),
(829, 2, 21, 47, 8, 2, 10, 0, '2024-03-08 11:43:34'),
(830, 4, 33, 7, 7, 45, 52, 3, '2023-07-03 15:32:38'),
(831, 1, 2, 25, 45, 34, 79, 5, '2023-10-28 04:56:09'),
(832, 1, 29, 6, 24, 49, 73, 5, '2024-02-22 07:06:27'),
(833, 2, 34, 22, 18, 13, 31, 0, '2023-12-13 06:22:28'),
(834, 2, 82, 10, 38, 41, 79, 5, '2023-08-20 06:43:01'),
(835, 2, 19, 15, 44, 14, 58, 3, '2024-04-29 02:41:42'),
(836, 4, 38, 40, 43, 51, 94, 5, '2023-05-02 08:10:57'),
(837, 3, 43, 8, 16, 19, 35, 0, '2023-12-25 14:54:01'),
(838, 4, 33, 27, 42, 32, 74, 5, '2023-10-11 23:47:28'),
(839, 3, 30, 37, 23, 36, 59, 3, '2024-02-24 19:34:19'),
(840, 1, 28, 9, 50, 25, 75, 5, '2023-10-24 04:59:41'),
(841, 4, 36, 4, 36, 56, 92, 5, '2023-12-22 01:07:24'),
(842, 4, 66, 46, 28, 55, 83, 5, '2023-08-24 14:12:27'),
(843, 2, 91, 28, 45, 59, 104, 5, '2024-03-15 17:19:15'),
(844, 4, 97, 17, 9, 30, 39, 0, '2024-02-02 17:15:54'),
(845, 1, 53, 9, 34, 52, 86, 5, '2023-11-13 20:05:12'),
(846, 3, 28, 16, 18, 34, 52, 3, '2024-03-12 18:48:38'),
(847, 4, 56, 49, 47, 48, 95, 5, '2024-03-19 19:13:45'),
(848, 1, 36, 24, 27, 22, 49, 2, '2023-10-04 22:56:38'),
(849, 4, 12, 3, 26, 48, 74, 5, '2023-05-29 03:18:41'),
(850, 4, 19, 47, 26, 2, 28, 0, '2024-01-08 16:39:50'),
(851, 1, 25, 41, 44, 55, 99, 5, '2023-09-30 17:59:25'),
(852, 2, 43, 1, 10, 42, 52, 3, '2024-04-04 05:35:58'),
(853, 3, 25, 12, 24, 45, 69, 4, '2023-10-20 22:36:58'),
(854, 4, 21, 1, 44, 55, 99, 5, '2023-10-15 12:42:41'),
(855, 2, 52, 45, 12, 21, 33, 0, '2024-04-05 21:19:06'),
(856, 4, 39, 18, 31, 33, 64, 4, '2023-11-22 22:01:22'),
(857, 4, 88, 3, 31, 6, 37, 0, '2023-05-19 19:17:53'),
(858, 4, 41, 2, 8, 17, 25, 0, '2023-10-21 02:10:09'),
(859, 1, 23, 4, 33, 56, 89, 5, '2023-12-08 23:16:57'),
(860, 4, 79, 44, 36, 16, 52, 3, '2024-01-16 08:51:21'),
(861, 1, 51, 41, 23, 18, 41, 0, '2023-08-25 17:50:21'),
(862, 1, 72, 16, 31, 20, 51, 3, '2024-03-04 11:42:03'),
(863, 2, 86, 26, 43, 30, 73, 5, '2023-04-30 15:12:42'),
(864, 1, 75, 44, 39, 56, 95, 5, '2024-03-13 03:17:35'),
(865, 4, 44, 1, 48, 8, 56, 3, '2024-01-14 02:02:02'),
(866, 1, 62, 4, 5, 52, 57, 3, '2024-01-10 09:41:31'),
(867, 3, 77, 31, 7, 39, 46, 2, '2024-03-24 12:39:55'),
(868, 3, 68, 38, 28, 41, 69, 4, '2024-02-15 08:11:49'),
(869, 2, 83, 4, 8, 13, 21, 0, '2023-12-10 11:29:39'),
(870, 3, 67, 43, 40, 21, 61, 4, '2024-01-08 00:35:34'),
(871, 3, 30, 45, 8, 43, 51, 3, '2023-07-24 23:22:11'),
(872, 3, 66, 35, 23, 46, 69, 4, '2023-06-23 08:41:51'),
(873, 2, 88, 45, 11, 8, 19, 0, '2023-05-31 01:16:17'),
(874, 3, 39, 22, 41, 24, 65, 4, '2023-07-11 05:47:26'),
(875, 2, 95, 44, 10, 54, 64, 4, '2023-08-22 12:30:00'),
(876, 2, 51, 19, 37, 3, 40, 0, '2023-09-21 03:22:32'),
(877, 2, 29, 28, 41, 4, 45, 2, '2023-06-23 07:31:51'),
(878, 1, 98, 23, 33, 52, 85, 5, '2023-12-12 09:49:40'),
(879, 4, 43, 17, 31, 27, 58, 3, '2023-12-19 16:30:07'),
(880, 1, 55, 33, 27, 31, 58, 3, '2023-11-26 02:36:40'),
(881, 3, 28, 36, 14, 19, 33, 0, '2023-06-26 14:40:46'),
(882, 1, 31, 46, 17, 57, 74, 5, '2023-10-21 03:06:54'),
(883, 4, 23, 4, 8, 34, 42, 0, '2024-03-10 03:39:30'),
(884, 4, 37, 9, 38, 7, 45, 2, '2024-02-23 18:53:50'),
(885, 2, 72, 25, 30, 24, 54, 3, '2023-08-15 04:23:23'),
(886, 1, 43, 11, 26, 55, 81, 5, '2023-08-18 13:37:37'),
(887, 3, 52, 45, 43, 36, 79, 5, '2023-12-25 07:02:23'),
(888, 1, 76, 45, 31, 23, 54, 3, '2024-03-17 03:55:40'),
(889, 4, 82, 25, 17, 51, 68, 4, '2023-07-19 00:40:46'),
(890, 4, 2, 4, 29, 50, 79, 5, '2024-03-04 09:05:25'),
(891, 3, 85, 39, 32, 43, 75, 5, '2023-08-03 13:02:51'),
(892, 3, 51, 19, 29, 48, 77, 5, '2023-06-05 16:36:30'),
(893, 4, 38, 43, 14, 50, 64, 4, '2024-04-10 03:48:29'),
(894, 3, 23, 17, 46, 29, 75, 5, '2023-09-25 10:47:07'),
(895, 4, 1, 37, 41, 48, 89, 5, '2024-04-02 02:43:16'),
(896, 1, 46, 13, 44, 28, 72, 5, '2023-05-10 01:46:36'),
(897, 2, 83, 24, 42, 24, 66, 4, '2024-02-23 01:27:17'),
(898, 4, 32, 45, 8, 33, 41, 0, '2024-01-18 21:08:09'),
(899, 1, 2, 49, 47, 25, 72, 5, '2023-08-18 06:09:33'),
(900, 2, 98, 22, 33, 25, 58, 3, '2023-05-18 09:32:45'),
(901, 4, 74, 38, 22, 37, 59, 3, '2024-04-28 02:03:51'),
(902, 1, 32, 29, 26, 47, 73, 5, '2023-08-02 07:42:39'),
(903, 3, 75, 26, 29, 50, 79, 5, '2024-02-14 11:29:17'),
(904, 4, 17, 4, 15, 56, 71, 5, '2023-11-02 14:40:46'),
(905, 1, 11, 10, 35, 9, 44, 0, '2023-05-01 08:26:32'),
(906, 3, 96, 9, 25, 21, 46, 2, '2023-10-15 08:18:47'),
(907, 2, 1, 6, 40, 55, 95, 5, '2024-03-10 19:27:45'),
(908, 1, 89, 25, 41, 3, 44, 0, '2024-04-12 16:19:20'),
(909, 1, 44, 31, 20, 5, 25, 0, '2023-05-28 11:22:04'),
(910, 3, 66, 12, 45, 57, 102, 5, '2023-09-24 07:09:30'),
(911, 3, 54, 40, 43, 56, 99, 5, '2024-01-05 06:23:56'),
(912, 2, 46, 30, 32, 23, 55, 3, '2023-07-15 12:43:57'),
(913, 4, 84, 15, 18, 45, 63, 4, '2024-04-21 04:15:19'),
(914, 2, 18, 37, 29, 18, 47, 2, '2023-11-12 07:40:08'),
(915, 4, 66, 7, 34, 24, 58, 3, '2023-09-13 02:09:31'),
(916, 3, 27, 49, 45, 51, 96, 5, '2023-11-13 03:21:23'),
(917, 4, 90, 1, 40, 11, 51, 3, '2023-10-10 03:05:39'),
(918, 3, 92, 2, 6, 33, 39, 0, '2023-09-29 06:20:11'),
(919, 2, 87, 6, 13, 60, 73, 5, '2024-01-12 05:25:16'),
(920, 3, 38, 41, 29, 21, 50, 3, '2024-01-02 19:52:01'),
(921, 3, 66, 33, 34, 47, 81, 5, '2023-11-08 22:17:08'),
(922, 2, 58, 38, 34, 47, 81, 5, '2023-08-28 10:34:10'),
(923, 2, 76, 29, 16, 57, 73, 5, '2024-01-15 17:21:30'),
(924, 1, 27, 25, 21, 34, 55, 3, '2023-12-30 18:30:46'),
(925, 2, 26, 20, 29, 43, 72, 5, '2024-04-02 16:51:46'),
(926, 1, 43, 15, 39, 19, 58, 3, '2024-04-13 06:06:36'),
(927, 4, 23, 50, 13, 1, 14, 0, '2024-04-03 15:17:29'),
(928, 3, 30, 3, 50, 27, 77, 5, '2023-05-27 19:36:48'),
(929, 3, 64, 10, 9, 49, 58, 3, '2024-01-12 15:33:32'),
(930, 1, 92, 15, 34, 17, 51, 3, '2024-04-01 19:11:47'),
(931, 4, 28, 38, 13, 28, 41, 0, '2023-11-24 23:54:47'),
(932, 2, 81, 49, 5, 42, 47, 2, '2023-09-18 23:55:13'),
(933, 3, 71, 36, 43, 15, 58, 3, '2023-10-14 07:12:59'),
(934, 4, 55, 5, 44, 4, 48, 2, '2023-12-12 15:46:47');
INSERT INTO `results` (`result_id`, `session_id`, `course_id`, `student_id`, `ca`, `exam`, `total`, `grade`, `time_added`) VALUES
(935, 3, 94, 16, 13, 54, 67, 4, '2024-03-27 10:35:27'),
(936, 3, 10, 45, 23, 30, 53, 3, '2024-01-26 05:28:11'),
(937, 2, 32, 26, 14, 53, 67, 4, '2024-04-15 03:40:49'),
(938, 3, 35, 1, 49, 35, 84, 5, '2024-03-01 18:40:06'),
(939, 1, 66, 9, 27, 19, 46, 2, '2023-05-11 13:37:57'),
(940, 4, 8, 37, 40, 5, 45, 2, '2024-04-27 22:48:48'),
(941, 2, 98, 22, 41, 18, 59, 3, '2023-08-29 21:00:54'),
(942, 2, 1, 4, 13, 29, 42, 0, '2023-09-26 15:53:05'),
(943, 2, 13, 39, 39, 60, 99, 5, '2023-08-11 21:30:56'),
(944, 2, 10, 7, 44, 9, 53, 3, '2024-04-11 12:31:34'),
(945, 4, 8, 32, 6, 38, 44, 0, '2023-05-10 00:31:19'),
(946, 3, 99, 30, 17, 42, 59, 3, '2023-08-23 20:29:09'),
(947, 3, 62, 42, 30, 53, 83, 5, '2023-08-19 05:00:25'),
(948, 4, 13, 24, 31, 30, 61, 4, '2023-12-20 20:06:35'),
(949, 3, 8, 14, 36, 2, 38, 0, '2024-03-05 06:40:21'),
(950, 1, 51, 32, 44, 25, 69, 4, '2023-09-12 09:53:08'),
(951, 4, 93, 4, 18, 3, 21, 0, '2023-10-20 13:07:33'),
(952, 3, 5, 34, 33, 12, 45, 2, '2023-08-06 10:09:58'),
(953, 1, 54, 13, 44, 4, 48, 2, '2023-08-08 07:05:50'),
(954, 2, 13, 31, 28, 4, 32, 0, '2023-05-14 02:37:23'),
(955, 2, 92, 37, 14, 38, 52, 3, '2023-10-08 05:14:50'),
(956, 3, 19, 9, 36, 24, 60, 4, '2023-09-01 15:54:15'),
(957, 1, 8, 44, 14, 11, 25, 0, '2024-02-15 03:57:11'),
(958, 4, 44, 7, 37, 35, 72, 5, '2023-05-23 04:46:53'),
(959, 1, 58, 22, 24, 44, 68, 4, '2023-11-21 17:14:47'),
(960, 1, 29, 28, 30, 31, 61, 4, '2024-03-30 07:38:40'),
(961, 2, 69, 33, 16, 16, 32, 0, '2023-10-08 01:57:33'),
(962, 2, 63, 40, 28, 31, 59, 3, '2023-05-02 19:10:22'),
(963, 1, 79, 15, 22, 37, 59, 3, '2023-05-26 23:45:54'),
(964, 4, 91, 24, 32, 30, 62, 4, '2024-01-23 14:39:31'),
(965, 4, 62, 36, 9, 9, 18, 0, '2024-01-16 12:52:52'),
(966, 1, 76, 3, 32, 46, 78, 5, '2023-12-16 17:56:19'),
(967, 3, 35, 21, 26, 52, 78, 5, '2023-05-21 09:54:16'),
(968, 3, 96, 19, 7, 12, 19, 0, '2023-11-21 19:39:42'),
(969, 4, 79, 44, 46, 1, 47, 2, '2024-04-06 07:26:34'),
(970, 4, 82, 38, 19, 46, 65, 4, '2023-05-10 11:22:00'),
(971, 1, 66, 33, 7, 54, 61, 4, '2024-03-11 09:23:24'),
(972, 1, 56, 25, 50, 25, 75, 5, '2024-02-25 10:44:33'),
(973, 4, 56, 35, 49, 34, 83, 5, '2024-02-04 19:25:02'),
(974, 2, 35, 8, 32, 55, 87, 5, '2024-03-17 20:04:47'),
(975, 2, 65, 42, 13, 6, 19, 0, '2024-01-04 08:49:34'),
(976, 4, 2, 6, 8, 13, 21, 0, '2024-04-03 13:37:14'),
(977, 1, 92, 16, 26, 10, 36, 0, '2023-05-19 07:12:15'),
(978, 1, 77, 27, 12, 50, 62, 4, '2023-11-01 12:33:55'),
(979, 2, 77, 5, 5, 51, 56, 3, '2023-11-24 01:15:05'),
(980, 1, 29, 32, 36, 28, 64, 4, '2023-08-14 02:17:37'),
(981, 1, 91, 31, 33, 7, 40, 0, '2023-07-15 14:19:07'),
(982, 1, 4, 32, 33, 13, 46, 2, '2023-07-26 02:43:27'),
(983, 3, 97, 6, 11, 39, 50, 3, '2023-06-06 14:06:34'),
(984, 2, 13, 41, 9, 6, 15, 0, '2023-05-02 13:17:23'),
(985, 4, 29, 34, 41, 15, 56, 3, '2023-06-18 17:45:04'),
(986, 4, 12, 8, 25, 53, 78, 5, '2023-07-21 15:39:20'),
(987, 2, 85, 21, 20, 27, 47, 2, '2023-08-22 07:12:06'),
(988, 3, 86, 40, 29, 13, 42, 0, '2023-07-28 07:49:23'),
(989, 1, 79, 19, 22, 56, 78, 5, '2023-08-29 07:32:37'),
(990, 1, 81, 36, 21, 23, 44, 0, '2023-08-10 04:30:25'),
(991, 3, 89, 50, 49, 49, 98, 5, '2023-12-21 13:39:08'),
(992, 1, 57, 3, 11, 15, 26, 0, '2023-10-23 03:12:04'),
(993, 4, 36, 50, 24, 15, 39, 0, '2023-12-25 15:10:32'),
(994, 1, 51, 8, 39, 38, 77, 5, '2023-10-13 04:03:18'),
(995, 4, 91, 14, 12, 49, 61, 4, '2023-09-24 12:33:15'),
(996, 2, 29, 43, 20, 8, 28, 0, '2023-10-06 19:24:24'),
(997, 2, 13, 16, 49, 9, 58, 3, '2023-10-31 06:28:37'),
(998, 3, 47, 39, 12, 57, 69, 4, '2023-11-11 23:29:15'),
(999, 4, 65, 24, 20, 44, 64, 4, '2023-11-02 11:58:37'),
(1000, 1, 7, 8, 16, 51, 67, 4, '2023-11-21 22:46:30'),
(1001, 4, 48, 1, 20, 40, 60, 4, '2024-05-02 19:43:47');

-- --------------------------------------------------------

--
-- Stand-in structure for view `results_view`
-- (See below for the actual view)
--
CREATE TABLE `results_view` (
`result_id` int(11)
,`session_id` int(11)
,`session_name` varchar(20)
,`semester_id` int(1)
,`semester_name` varchar(20)
,`level_id` int(1)
,`level_name` int(11)
,`department_id` int(11)
,`department_name` varchar(50)
,`student_id` int(11)
,`matric_no` varchar(15)
,`firstname` varchar(30)
,`surname` varchar(30)
,`othername` varchar(30)
,`mode_of_entry` int(11)
,`mode_name` varchar(10)
,`course_ids` mediumtext
,`scores` mediumtext
);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'super admin'),
(2, 'admin'),
(3, 'lecturer'),
(4, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `semester_name` varchar(20) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester_name`, `timestamp`) VALUES
(1, 'First', '2024-04-28 12:47:09'),
(2, 'Second', '2024-04-28 12:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` int(11) NOT NULL,
  `session_name` varchar(20) NOT NULL,
  `start_year` varchar(4) NOT NULL,
  `end_year` varchar(4) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `session_name`, `start_year`, `end_year`, `timestamp`) VALUES
(1, '20/21', '2020', '2021', '2024-04-30 23:05:13'),
(2, '21/22', '2021', '2022', '2024-04-30 23:05:13'),
(3, '22/23', '2022', '2023', '2024-04-30 23:05:13'),
(4, '23/24', '2023', '2024', '2024-04-30 23:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `matric_no` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `othername` varchar(30) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `department_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `mode_of_entry` int(11) NOT NULL,
  `time_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `matric_no`, `user_id`, `role_id`, `surname`, `firstname`, `othername`, `gender_id`, `email`, `tel`, `department_id`, `level_id`, `mode_of_entry`, `time_created`) VALUES
(1, '09/6250', 1, 4, 'Feke', 'Bobbi', 'Ami', 2, 'amagson0@blogger.com', '796-855-7718', 5, 2, 2, '2024-02-17 10:24:13'),
(2, '51/5393', 2, 4, 'Bradney', 'Nonah', 'Red', 1, 'rdebischop1@amazon.co.jp', '647-806-1168', 2, 3, 2, '2024-04-08 20:57:02'),
(3, '20/5649', 3, 4, 'Devonne', 'Diarmid', 'Emera', 2, 'ebream2@4shared.com', '144-916-7759', 3, 1, 1, '2024-04-22 10:45:16'),
(4, '68/5042', 4, 4, 'Angil', 'Maurice', 'Lucretia', 1, 'lhuckel3@loc.gov', '298-336-8126', 5, 1, 2, '2023-07-07 11:45:28'),
(5, '06/4211', 5, 4, 'Mendie', 'Ann-marie', 'Joel', 1, 'jjan4@unblog.fr', '385-284-4983', 1, 4, 1, '2023-05-21 02:37:49'),
(6, '58/7767', 6, 4, 'Beulah', 'Cammy', 'Lester', 2, 'lfoort5@cbslocal.com', '735-125-4338', 2, 2, 1, '2023-10-11 01:52:56'),
(7, '20/4132', 7, 4, 'Esta', 'Stephani', 'Manuel', 2, 'mremer6@aboutads.info', '731-734-6369', 2, 2, 2, '2023-10-10 10:27:06'),
(8, '23/9356', 8, 4, 'Ree', 'Willyt', 'Rosamond', 1, 'rsabin7@nih.gov', '861-280-3795', 5, 4, 1, '2023-08-29 06:34:37'),
(9, '68/9749', 9, 4, 'Derrick', 'Letta', 'Carlee', 2, 'ckiera8@scientificamerican.com', '752-967-2843', 3, 2, 1, '2023-09-17 21:08:08'),
(10, '28/6157', 10, 4, 'Billi', 'Orazio', 'Perceval', 2, 'pberic9@google.es', '604-745-3542', 5, 1, 1, '2023-11-01 23:55:27'),
(11, '71/9695', 11, 4, 'Phaedra', 'Orv', 'Sunny', 1, 'scornila@army.mil', '401-830-9245', 3, 2, 1, '2024-03-28 01:48:28'),
(12, '97/0033', 12, 4, 'Augie', 'Janifer', 'Boothe', 2, 'bblurtonb@ameblo.jp', '361-600-4783', 1, 4, 2, '2023-05-18 20:53:41'),
(13, '54/4284', 13, 4, 'Eadmund', 'Jsandye', 'Artus', 1, 'adeweyc@symantec.com', '598-848-8295', 4, 3, 2, '2024-01-17 07:12:52'),
(14, '52/4537', 14, 4, 'Lurleen', 'Virge', 'Emlyn', 1, 'evandaled@bbb.org', '400-620-9110', 3, 3, 2, '2023-05-09 15:49:22'),
(15, '34/9918', 15, 4, 'Brigg', 'Aubrey', 'Kendall', 2, 'khoodlasse@fotki.com', '451-174-7084', 4, 2, 2, '2023-10-12 07:55:16'),
(16, '46/1654', 16, 4, 'Lucio', 'Fraze', 'Neil', 2, 'nregardsoef@behance.net', '790-430-8170', 4, 1, 2, '2023-06-30 18:14:28'),
(17, '97/3864', 17, 4, 'Minne', 'Adams', 'Noe', 2, 'nmynerg@google.cn', '817-620-5037', 1, 3, 2, '2023-05-19 03:30:02'),
(18, '06/4049', 18, 4, 'Evin', 'Magdalene', 'Nickolas', 2, 'nloinesh@deliciousdays.com', '241-772-9405', 5, 1, 1, '2023-12-10 02:10:02'),
(19, '15/6272', 19, 4, 'Louie', 'Quinn', 'Delia', 1, 'dcochi@usatoday.com', '129-817-7102', 5, 1, 1, '2023-09-12 19:47:37'),
(20, '56/0977', 20, 4, 'Meryl', 'Alleen', 'Shurlocke', 2, 'sfothergillj@wunderground.com', '868-825-7813', 1, 4, 2, '2023-11-07 14:01:23'),
(21, '65/5739', 21, 4, 'Amberly', 'Oralee', 'Dev', 1, 'dsiviterk@cnn.com', '522-160-2393', 3, 2, 2, '2023-07-15 20:27:56'),
(22, '21/1632', 22, 4, 'Karlan', 'Berry', 'Angelica', 2, 'ablagburnl@sciencedirect.com', '806-628-3605', 4, 3, 2, '2024-04-11 17:05:24'),
(23, '97/8696', 23, 4, 'Barb', 'Cece', 'Shayna', 1, 'sfoulism@senate.gov', '811-113-8908', 5, 2, 2, '2023-06-03 23:42:44'),
(24, '67/9339', 24, 4, 'Alison', 'Chip', 'Emili', 1, 'elangmeadn@is.gd', '441-189-4204', 5, 1, 2, '2024-02-13 14:38:12'),
(25, '99/5254', 25, 4, 'Ansell', 'Hilarius', 'Electra', 2, 'emoorheado@t-online.de', '168-601-9918', 2, 4, 2, '2023-05-31 21:13:46'),
(26, '73/6146', 26, 4, 'Gabriellia', 'Kattie', 'Alric', 2, 'aavramowp@blinklist.com', '551-234-7261', 1, 4, 2, '2024-03-06 08:18:18'),
(27, '32/6357', 27, 4, 'Karel', 'Ara', 'Ernaline', 2, 'emunseyq@hc360.com', '997-604-8562', 2, 3, 2, '2024-02-10 23:51:52'),
(28, '46/1333', 28, 4, 'Maura', 'Christye', 'Ringo', 1, 'rrodsonr@virginia.edu', '140-113-7849', 1, 1, 2, '2023-08-10 18:27:16'),
(29, '97/7477', 29, 4, 'Danni', 'Ozzie', 'Pavla', 1, 'ppriestners@wordpress.com', '577-207-2240', 4, 4, 2, '2023-05-28 16:16:33'),
(30, '54/3530', 30, 4, 'Augusto', 'Daryn', 'Hilario', 1, 'hdraynt@digg.com', '493-986-4752', 5, 1, 1, '2024-03-02 09:57:52'),
(31, '30/7525', 31, 4, 'Perle', 'Elenore', 'Becka', 1, 'bchristofidesu@seesaa.net', '476-587-8285', 1, 4, 2, '2023-08-06 10:29:52'),
(32, '49/8969', 32, 4, 'Major', 'Shaughn', 'Annnora', 2, 'agroucuttv@google.com.au', '791-735-1777', 3, 2, 1, '2023-10-13 18:47:59'),
(33, '34/2174', 33, 4, 'Honoria', 'Mose', 'Maude', 2, 'mpiercew@dailymotion.com', '287-891-9612', 4, 4, 1, '2023-12-14 07:55:01'),
(34, '30/6403', 34, 4, 'Brandise', 'Ariella', 'Tish', 1, 'tbranscombx@bbb.org', '921-461-1963', 4, 4, 1, '2024-02-04 07:32:31'),
(35, '30/7583', 35, 4, 'Jermaine', 'Haley', 'Timoteo', 1, 'tkingsnorthy@newyorker.com', '247-809-4994', 2, 3, 2, '2023-10-25 11:26:28'),
(36, '65/9247', 36, 4, 'Blake', 'Guss', 'Dalis', 2, 'dorromz@paginegialle.it', '996-520-6750', 5, 4, 2, '2023-12-04 04:05:34'),
(37, '65/6086', 37, 4, 'Ursuline', 'Brendon', 'Carny', 1, 'chabbijam10@chron.com', '328-867-9275', 4, 1, 1, '2024-04-07 18:12:41'),
(38, '57/7691', 38, 4, 'Cosetta', 'Salomon', 'Christin', 2, 'cbeston11@mayoclinic.com', '193-296-5692', 2, 4, 1, '2024-03-14 18:05:30'),
(39, '67/1897', 39, 4, 'Daisey', 'Roy', 'Wynn', 1, 'wstedell12@discuz.net', '340-501-1240', 5, 4, 1, '2023-05-04 04:09:54'),
(40, '78/2879', 40, 4, 'Marti', 'Erik', 'Cornie', 1, 'cstandall13@ox.ac.uk', '776-805-3547', 3, 3, 1, '2023-07-05 17:44:29'),
(41, '92/1377', 41, 4, 'Harlin', 'Pierce', 'Charlena', 1, 'cbridgeman14@usa.gov', '309-363-4136', 1, 1, 2, '2024-02-11 02:54:49'),
(42, '98/9069', 42, 4, 'Merwin', 'Miquela', 'Nana', 1, 'ncage15@sphinn.com', '431-369-4935', 5, 2, 2, '2023-11-25 13:35:39'),
(43, '00/4742', 43, 4, 'Gilli', 'Franky', 'Irwinn', 1, 'iquenby16@furl.net', '908-676-5604', 4, 4, 2, '2023-06-25 00:50:57'),
(44, '07/7202', 44, 4, 'Carmon', 'Alair', 'Cordie', 1, 'candres17@tumblr.com', '319-255-4277', 2, 4, 2, '2023-07-08 16:27:22'),
(45, '67/0881', 45, 4, 'Maitilde', 'Modesta', 'Tally', 1, 'thardistry18@cbsnews.com', '676-364-0061', 4, 3, 1, '2023-09-17 18:05:30'),
(46, '06/9371', 46, 4, 'Lenna', 'Traci', 'Paulo', 1, 'pmacfadin19@ftc.gov', '725-260-1861', 2, 2, 2, '2023-05-09 08:51:27'),
(47, '97/7694', 47, 4, 'Briney', 'Rooney', 'Christan', 2, 'charby1a@un.org', '585-620-4323', 5, 2, 2, '2024-01-05 21:14:23'),
(48, '68/6636', 48, 4, 'Garrett', 'Minny', 'Iormina', 2, 'iwrennall1b@zdnet.com', '684-694-8808', 4, 4, 1, '2023-06-15 21:41:50'),
(49, '07/9795', 49, 4, 'Bent', 'Jerry', 'Gibb', 1, 'gbenduhn1c@phoca.cz', '730-848-4223', 4, 4, 2, '2023-07-10 07:14:50'),
(50, '04/9657', 50, 4, 'Odey', 'Kennith', 'Jeannine', 2, 'jommundsen1d@samsung.com', '959-597-6683', 2, 4, 1, '2024-03-06 18:50:56'),
(51, '11/1307', 51, 4, 'Darsie', 'Cirillo', 'Leticia', 2, 'lbrahams1e@usatoday.com', '852-144-7762', 5, 1, 1, '2023-10-10 05:08:39'),
(52, '14/4897', 52, 4, 'Gareth', 'Alicea', 'Joana', 1, 'jkollaschek1f@howstuffworks.com', '829-949-4604', 1, 2, 2, '2024-02-04 05:38:32'),
(53, '48/9587', 53, 4, 'Barney', 'Temple', 'Alberto', 2, 'adrain1g@photobucket.com', '729-438-7554', 4, 1, 2, '2024-03-15 14:31:02'),
(54, '85/5777', 54, 4, 'Karine', 'Billie', 'Goddard', 1, 'gfarady1h@ask.com', '652-919-9718', 5, 2, 2, '2023-10-28 21:49:03'),
(55, '00/5700', 55, 4, 'Johnny', 'Nicky', 'Anabel', 2, 'abardey1i@geocities.com', '741-499-9689', 4, 3, 2, '2024-03-25 02:57:01'),
(56, '64/0107', 56, 4, 'Saunderson', 'Melva', 'Ettore', 2, 'egonning1j@is.gd', '805-154-7916', 3, 1, 1, '2024-04-11 23:22:50'),
(57, '95/4530', 57, 4, 'Ranna', 'Jone', 'Smitty', 1, 'sbusek1k@wufoo.com', '896-183-8640', 1, 2, 2, '2023-08-30 07:10:28'),
(58, '83/1830', 58, 4, 'Gavrielle', 'Ninnetta', 'Dalia', 1, 'dcosgrive1l@skype.com', '278-311-5908', 5, 4, 2, '2023-07-08 13:00:08'),
(59, '52/1929', 59, 4, 'Sib', 'Gary', 'Page', 2, 'pfloat1m@ameblo.jp', '628-991-9766', 5, 1, 1, '2024-01-14 02:17:52'),
(60, '20/8436', 60, 4, 'Marcus', 'Diarmid', 'Drucie', 2, 'ddeatta1n@blog.com', '675-926-4639', 5, 1, 1, '2023-05-26 10:23:55'),
(61, '11/6467', 61, 4, 'Flossy', 'Lenette', 'Karil', 2, 'kblees1o@friendfeed.com', '350-848-2718', 2, 3, 1, '2024-04-06 04:34:34'),
(62, '15/3556', 62, 4, 'Dru', 'Annnora', 'Vale', 2, 'vkiddye1p@example.com', '977-337-8645', 2, 1, 2, '2023-09-07 22:03:41'),
(63, '77/5264', 63, 4, 'Lu', 'Lena', 'Katharina', 1, 'kyokel1q@ameblo.jp', '172-659-8112', 2, 3, 2, '2023-12-08 08:59:12'),
(64, '94/7383', 64, 4, 'Tatiana', 'Ellswerth', 'Simone', 2, 'srodder1r@weebly.com', '134-886-3893', 5, 4, 1, '2023-07-18 04:03:07'),
(65, '61/9310', 65, 4, 'Kit', 'Lauree', 'Salli', 2, 'sbramich1s@smugmug.com', '927-719-3958', 2, 2, 1, '2023-08-03 03:15:16'),
(66, '19/4033', 66, 4, 'Vidovic', 'Francklyn', 'Kristo', 2, 'kmonni1t@nydailynews.com', '470-525-1564', 2, 1, 2, '2023-10-02 15:19:05'),
(67, '45/2247', 67, 4, 'Kipp', 'Giovanna', 'Kahaleel', 2, 'khuston1u@myspace.com', '622-479-0714', 3, 3, 2, '2023-05-31 23:32:16'),
(68, '57/4490', 68, 4, 'Gregorius', 'Ainslee', 'Wynnie', 2, 'wsheekey1v@pen.io', '157-847-0145', 2, 2, 1, '2023-12-17 13:01:26'),
(69, '70/6617', 69, 4, 'Joseito', 'Gregory', 'Burl', 2, 'bpallesen1w@uol.com.br', '577-289-1811', 2, 1, 1, '2023-10-24 16:30:57'),
(70, '17/4043', 70, 4, 'Evangelin', 'Lyndell', 'Charlene', 1, 'ckerwick1x@moonfruit.com', '700-607-4597', 4, 4, 2, '2024-02-04 02:01:05'),
(71, '71/3397', 71, 4, 'Aurore', 'Carie', 'Isac', 1, 'idefont1y@nhs.uk', '530-948-9939', 2, 4, 1, '2023-12-23 13:56:48'),
(72, '72/5414', 72, 4, 'Shane', 'Lucretia', 'Leonardo', 1, 'lbrandt1z@washington.edu', '178-673-1578', 5, 4, 1, '2024-02-08 14:34:40'),
(73, '76/9230', 73, 4, 'Riley', 'Moria', 'Libbie', 1, 'lcaveau20@unesco.org', '865-558-9762', 4, 2, 2, '2023-05-27 12:43:23'),
(74, '96/4279', 74, 4, 'Wade', 'Stormy', 'Richardo', 2, 'rcorbet21@technorati.com', '507-411-4139', 5, 3, 2, '2023-05-06 02:43:09'),
(75, '80/2432', 75, 4, 'Bert', 'Margaret', 'Bernard', 1, 'bstorr22@angelfire.com', '661-738-3848', 1, 4, 2, '2023-06-23 10:05:04'),
(76, '33/3423', 76, 4, 'Clifford', 'Germayne', 'Sadie', 1, 'sdillestone23@marriott.com', '764-229-7880', 2, 1, 2, '2024-02-25 04:15:45'),
(77, '59/2784', 77, 4, 'Riobard', 'Mimi', 'Lori', 1, 'ldobbing24@google.de', '409-773-6782', 3, 2, 1, '2023-05-02 06:40:15'),
(78, '59/7470', 78, 4, 'Allianora', 'Stillman', 'Neddie', 1, 'nandrolli25@howstuffworks.com', '377-533-4064', 1, 2, 1, '2024-03-03 19:20:33'),
(79, '63/7012', 79, 4, 'Cozmo', 'Sarajane', 'Isaac', 2, 'ibolsover26@cbsnews.com', '130-871-4437', 3, 1, 1, '2023-11-16 16:19:11'),
(80, '09/9132', 80, 4, 'Ignatius', 'Alexa', 'Heall', 2, 'hneligan27@meetup.com', '478-470-4468', 1, 1, 1, '2023-12-23 16:57:54'),
(81, '72/9864', 81, 4, 'Jacquenette', 'Sandi', 'Gladi', 2, 'garnke28@scribd.com', '160-823-3573', 2, 2, 2, '2024-04-17 22:33:51'),
(82, '97/4534', 82, 4, 'Benedikta', 'Lynna', 'Windy', 2, 'wlurcock29@paginegialle.it', '890-545-0436', 5, 1, 2, '2023-10-29 13:52:01'),
(83, '50/7881', 83, 4, 'Angelita', 'Ange', 'Hazel', 1, 'hwassell2a@dion.ne.jp', '599-569-4947', 2, 3, 2, '2024-04-09 23:21:11'),
(84, '68/0717', 84, 4, 'Sherlock', 'Ralina', 'Zea', 2, 'zseedman2b@nytimes.com', '607-207-8258', 1, 2, 2, '2024-01-21 13:55:34'),
(85, '76/2351', 85, 4, 'Debera', 'Rhona', 'Boycie', 1, 'bsabben2c@illinois.edu', '710-687-4391', 3, 2, 1, '2024-02-19 14:50:42'),
(86, '96/1127', 86, 4, 'Ermengarde', 'Morton', 'Duffy', 1, 'dreina2d@typepad.com', '692-757-5835', 2, 3, 2, '2023-11-27 09:42:35'),
(87, '84/9266', 87, 4, 'Ros', 'Noelyn', 'Cross', 2, 'cmottley2e@mozilla.org', '467-994-6993', 4, 4, 1, '2023-12-18 09:35:53'),
(88, '23/6056', 88, 4, 'Sunny', 'Shandee', 'Jamill', 2, 'jstamp2f@wordpress.org', '745-375-2102', 4, 4, 2, '2023-08-05 15:33:41'),
(89, '14/1496', 89, 4, 'Levin', 'Gregorius', 'Vaughan', 1, 'vcrayk2g@people.com.cn', '656-457-2550', 5, 2, 2, '2023-10-22 21:07:12'),
(90, '83/9124', 90, 4, 'Jessika', 'Ambrosio', 'Emelia', 1, 'esiely2h@amazonaws.com', '893-774-3554', 1, 4, 1, '2024-02-23 06:11:54'),
(91, '66/5455', 91, 4, 'Kirsten', 'Emmey', 'Kenna', 2, 'kmolines2i@nymag.com', '382-380-3710', 4, 4, 1, '2023-06-06 06:07:14'),
(92, '34/3458', 92, 4, 'Petronille', 'Editha', 'Corissa', 1, 'cgrinikhin2j@godaddy.com', '579-345-4169', 4, 1, 2, '2023-10-25 21:28:00'),
(93, '94/8528', 93, 4, 'Ephrayim', 'Darrin', 'Verile', 2, 'vkellock2k@bravesites.com', '780-839-9082', 2, 1, 2, '2024-03-26 09:35:04'),
(94, '42/4855', 94, 4, 'Stacie', 'Kimberlee', 'Garvin', 1, 'ghayhurst2l@mapquest.com', '129-846-2617', 4, 4, 2, '2024-03-21 16:06:23'),
(95, '81/2006', 95, 4, 'Tatum', 'Miriam', 'Hunfredo', 2, 'hconibere2m@paginegialle.it', '470-895-2307', 1, 4, 2, '2024-02-16 09:56:59'),
(96, '61/7866', 96, 4, 'Octavia', 'Ryann', 'Gene', 1, 'gconnikie2n@tripod.com', '529-320-4469', 5, 1, 2, '2023-07-10 12:20:10'),
(97, '10/5381', 97, 4, 'Dunstan', 'Winifield', 'Tadeo', 1, 'tties2o@jalbum.net', '321-206-3011', 2, 4, 1, '2023-09-27 00:04:11'),
(98, '46/8667', 98, 4, 'Margie', 'Kiele', 'Anica', 1, 'akeele2p@washington.edu', '399-584-6996', 4, 4, 2, '2024-03-23 17:37:48'),
(99, '35/8542', 99, 4, 'Abbey', 'Charmaine', 'Gilbertina', 2, 'gmaslen2q@gov.uk', '381-246-9955', 4, 4, 1, '2023-06-04 03:02:17'),
(100, '46/3743', 100, 4, 'Sallyann', 'Eloise', 'Lazarus', 2, 'loneil2r@wisc.edu', '596-276-7567', 2, 2, 2, '2023-09-12 17:48:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `students_view`
-- (See below for the actual view)
--
CREATE TABLE `students_view` (
`student_id` int(11)
,`matric_no` varchar(15)
,`user_id` int(11)
,`role_name` varchar(15)
,`surname` varchar(30)
,`firstname` varchar(30)
,`othername` varchar(30)
,`gender_name` varchar(10)
,`department_name` varchar(50)
,`level_name` int(11)
,`email` varchar(50)
,`tel` varchar(15)
,`mode_name` varchar(10)
,`time_created` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL,
  `title_name` varchar(20) NOT NULL,
  `title_alias` varchar(10) NOT NULL,
  `time_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `title_name`, `title_alias`, `time_created`) VALUES
(1, 'Mr', 'Mr', '2024-04-28 12:53:22'),
(2, 'Mrs', 'Mrs', '2024-04-28 12:53:22'),
(3, 'Miss', 'Miss', '2024-04-28 12:53:22'),
(4, 'Doctor', 'Dr', '2024-04-28 12:53:22'),
(5, 'Professor', 'Prof', '2024-04-28 12:53:22'),
(6, 'Engineer', 'Engr', '2024-04-28 12:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `username`, `password`, `timestamp`) VALUES
(1, 1, 'superadmin', 'superadmin', '2024-04-28 08:56:48'),
(2, 2, 'admin1', 'admin1', '2024-04-28 09:32:07'),
(3, 3, 'lecturer1', 'lecturer1', '2024-04-28 09:32:07'),
(4, 4, 'student1', 'student1', '2024-04-28 09:32:07'),
(5, 4, 'sgerauld4', 'iQ8=@7X$eC\"', '2024-01-17 10:57:17'),
(6, 4, 'vtemplar5', 'rC8}`2(!3/GE<', '2023-06-13 05:23:42'),
(7, 4, 'rbroadbury6', 'hP4)$jEcG', '2023-09-14 08:26:34'),
(8, 4, 'bitscowicz7', 'qT6+%quyA$+9Rt', '2024-01-30 07:10:05'),
(9, 4, 'vmalkinson8', 'yX2_+xgbRdrpJ', '2023-05-16 06:57:50'),
(10, 4, 'ifarmar9', 'eN5#}Op$|kTgTYR', '2024-04-15 05:15:14'),
(11, 4, 'rtellinga', 'tS3+>!_OgsQZ', '2023-09-21 07:31:55'),
(12, 4, 'coscroftb', 'qW6`\'rmLC<', '2023-09-09 05:26:57'),
(13, 4, 'gfigguresc', 'cZ8(gBQkRlqA)u', '2024-04-21 01:11:35'),
(14, 4, 'toend', 'fR0`)rK1O?', '2024-04-03 14:18:23'),
(15, 4, 'owynesse', 'oK2\"$L1hQ85dg8', '2023-07-28 15:29:17'),
(16, 4, 'ismidmoorf', 'mR8#<fF\'O)SRw', '2024-04-24 14:51:15'),
(17, 4, 'panselmg', 'eS9/f5>N/&q<b7N{', '2023-11-02 17:54:28'),
(18, 4, 'kmullissh', 'yY5\"8ukD', '2024-01-16 07:35:35'),
(19, 4, 'ecrawcouri', 'eC3`|+e&!h.R', '2024-04-08 08:02:02'),
(20, 4, 'vfurmongerj', 'lW2>%jIn', '2024-01-05 05:35:48'),
(21, 4, 'fdawdaryk', 'dP7+jF?X&*i~hFa#', '2023-07-16 18:54:41'),
(22, 4, 'ukainel', 'yR2)i}iHhMP0Dm', '2023-06-02 19:29:24'),
(23, 4, 'vcorrem', 'fA1{Uf3Sj,', '2023-05-10 19:16:57'),
(24, 4, 'mtruelockn', 'lT0<=X6WGv2m', '2024-01-27 21:34:53'),
(25, 4, 'gsheekeyo', 'rM1,~M/xNOImCyN', '2023-09-16 20:20:22'),
(26, 4, 'imethamp', 'lP5(l2uw(>u', '2023-09-30 21:24:44'),
(27, 4, 'nmartlandq', 'kT5<C0I9+yxxE', '2023-05-09 19:31:22'),
(28, 4, 'apolglazer', 'pG8>,KkZC<&ajb&', '2023-09-25 06:45:43'),
(29, 4, 'rtheodoriss', 'yI7$1=yXzJ', '2023-06-04 07:07:28'),
(30, 4, 'asemmencet', 'aT7|7l!\"a6@gMv', '2024-04-09 20:25:22'),
(31, 4, 'credhouseu', 'vK0*\'RI`mf~Cmr$2', '2023-05-15 18:19:16'),
(32, 4, 'dsarsfieldv', 'sU4`Y5P+~DV.!', '2023-08-25 02:13:51'),
(33, 4, 'ogentryw', 'wM3{&,L#gC0l7HBG', '2024-02-26 17:34:11'),
(34, 4, 'ashillumx', 'uS5$K(eL', '2023-11-03 22:44:24'),
(35, 4, 'bayrey', 'pW8>\",$b?>>?', '2023-07-25 13:18:04'),
(36, 4, 'nlowrez', 'yE8_lzs?', '2023-07-27 04:14:51'),
(37, 4, 'jcoger10', 'cM3+fiLjnzzLe', '2023-08-29 12:41:47'),
(38, 4, 'mhairsnape11', 'tY4*G+$udWo+Q', '2024-01-15 23:31:40'),
(39, 4, 'rmcgrorty12', 'qW0=w\rsV', '2023-05-30 16:55:27'),
(40, 4, 'bbucktharp13', 'rF4&LY9JOp%Gjh', '2023-11-20 13:39:57'),
(41, 4, 'bsmaile14', 'eL8$bNkA', '2023-06-16 01:54:17'),
(42, 4, 'elemerie15', 'bM3_z3)Yfer%SXoS', '2023-12-11 07:32:22'),
(43, 4, 'dstanway16', 'bC4>aC$#', '2024-02-28 19:07:18'),
(44, 4, 'bodonegan17', 'uD6,k>|D>oq(', '2023-11-14 05:16:29'),
(45, 4, 'vpethybridge18', 'jK5}p$5#Af6nXb', '2023-07-18 00:27:49'),
(46, 4, 'dargontt19', 'iP6@&b\'Ub?', '2024-01-20 17:42:30'),
(47, 4, 'sstaining1a', 'pJ2\'8.7Y', '2023-12-09 05:16:27'),
(48, 4, 'rcarette1b', 'eP7|tf|P%0', '2023-10-06 21:51:26'),
(49, 4, 'lgroundwater1c', 'oW5`Y>s#LC', '2023-10-24 11:47:01'),
(50, 4, 'bmadle1d', 'dE1`lH\"k', '2024-03-25 11:04:57'),
(51, 4, 'wcongram1e', 'lH9)CrGG4f0,', '2023-07-29 13:53:41'),
(52, 4, 'pthurlby1f', 'oC1+,0|0UkxmI1=F', '2023-06-21 14:27:53'),
(53, 4, 'nmorse1g', 'gP8`N&Y9e4MSU0', '2023-08-23 12:32:12'),
(54, 4, 'asilk1h', 'tP0*pqt5%kI~P', '2023-09-03 10:54:57'),
(55, 4, 'dorbell1i', 'nN7|g\'\'2AM8Ov*', '2024-04-08 14:38:30'),
(56, 4, 'ahartgill1j', 'sL1{%R|6U6v4', '2023-08-29 02:23:39'),
(57, 4, 'lwhisson1k', 'jV7\"jDyN(10`!', '2023-08-15 21:37:02'),
(58, 4, 'ileming1l', 'sW2`Y8aTgY\'', '2024-04-04 20:49:03'),
(59, 4, 'fradki1m', 'hW7,E,MHt', '2024-02-06 14:54:25'),
(60, 4, 'cleborgne1n', 'sM8.sZhaN', '2024-04-10 00:15:42'),
(61, 4, 'dhitzschke1o', 'eH5.Xv32)NTH+7q', '2023-07-04 08:31:26'),
(62, 4, 'vdeddum1p', 'kQ0.0e(&&`W%_', '2023-09-20 18:56:47'),
(63, 4, 'bstallworthy1q', 'hW9,Gz$<vg@yt?', '2023-05-27 23:02:47'),
(64, 4, 'neastgate1r', 'kK4?GRhQ\"7`', '2023-10-03 11:37:31'),
(65, 4, 'tdawidowitsch1s', 'eE0?yE3$RwmmQK', '2024-04-13 23:49:53'),
(66, 4, 'zwittier1t', 'nK4(L1p_\'5le', '2024-01-01 07:33:36'),
(67, 4, 'abampfield1u', 'dO0$LD7ij', '2023-12-26 13:36:31'),
(68, 4, 'mlepruvost1v', 'iC9(mV`<6<OSVzx', '2023-09-28 19:14:37'),
(69, 4, 'jpischof1w', 'iX6.SIM\"}0', '2023-05-02 21:39:56'),
(70, 4, 'lslowley1x', 'uZ0\'`*J=OdPp0>', '2023-08-16 11:06:33'),
(71, 4, 'ckilby1y', 'pT5/0#/%\'=!y', '2023-12-24 20:03:11'),
(72, 4, 'igraysmark1z', 'gJ4|Sfl!Pwl0O<J', '2023-10-29 21:42:24'),
(73, 4, 'tshawyer20', 'oP8@G+)KG', '2023-08-11 20:41:46'),
(74, 4, 'eallport21', 'nF2~vb~|9_d%.e\')', '2023-11-22 10:21:32'),
(75, 4, 'pblease22', 'wF3@{fcG&I5#YI', '2023-07-23 23:14:44'),
(76, 4, 'jromney23', 'cY3\"Q}NawwxE}eE9', '2023-12-08 17:41:38'),
(77, 4, 'vverring24', 'dM7=!#.ec|', '2023-10-31 21:35:30'),
(78, 4, 'bfleeman25', 'tQ7.=E95N', '2023-10-18 13:42:58'),
(79, 4, 'vconstant26', 'mA0*5CNK{|q?o', '2023-10-07 23:17:53'),
(80, 4, 'tcordet27', 'rD8&{SI/?X!O', '2023-05-02 14:50:00'),
(81, 4, 'kmeekin28', 'bJ2+8IT5r~Td', '2023-10-19 04:54:18'),
(82, 4, 'hscrivener29', 'mN3)\"(Rz4?', '2023-07-12 19:44:19'),
(83, 4, 'lleverage2a', 'yK1?tvka.?Z', '2023-07-05 04:08:53'),
(84, 4, 'hreinhard2b', 'gL3${V/Nr44', '2024-02-15 21:05:35'),
(85, 4, 'aferronet2c', 'lL9<E~Ih%', '2023-11-24 18:46:56'),
(86, 4, 'wmylechreest2d', 'eR7&r*=9eCZWe&A', '2024-04-27 17:18:00'),
(87, 4, 'cscouller2e', 'xD4=vCbPWZWUP', '2024-04-05 12:44:38'),
(88, 4, 'lnatte2f', 'qS1?JkU{&0,C', '2024-04-12 11:52:08'),
(89, 4, 'ckinnen2g', 'kD5=MBP.Kb', '2023-11-18 22:17:54'),
(90, 4, 'hashlee2h', 'pE6&YevE_>X)0kZ', '2023-08-16 21:57:25'),
(91, 4, 'apoplee2i', 'vB3!J<+?&T5T,hfF', '2023-06-14 04:00:38'),
(92, 4, 'cdekeyser2j', 'uG0>#.a>cQx5', '2024-03-05 18:33:06'),
(93, 4, 'mbeggin2k', 'vV0#h`GQTp', '2023-12-03 03:04:05'),
(94, 4, 'rfuller2l', 'pC1yEs@', '2023-08-10 06:57:02'),
(95, 4, 'eduro2m', 'kX0{0>GzX', '2023-11-26 10:11:00'),
(96, 4, 'gkornes2n', 'yB3$)nujUek50_h8', '2023-10-03 23:25:36'),
(100, 4, 'dcockman2r', 'vQ8_1jXh<%67Z', '2024-01-16 03:57:25'),
(102, 3, 'nashcroft7', 'iG7!Du|8E$~/wN@|', '2023-09-19 04:22:46'),
(103, 3, 'hhindmoor1a', 'jM2>x?ESTAx', '2023-11-03 23:30:59'),
(104, 3, 'mpelmanv', 'jE6(8gMZQ4+RQ4f', '2023-05-19 11:40:41'),
(105, 3, 'kbrendish1d', 'iC7{lZQkMg', '2023-07-16 16:00:10'),
(107, 3, 'ygennyu', 'lQ6%fdI{zG\'Ti1', '2023-10-27 03:16:06'),
(109, 3, 'nwilloughway10', 'iG9&yvdFk	8\"', '2024-04-25 05:42:50'),
(110, 3, 'mcaird8', 'sV2=eU5OV9', '2024-01-11 00:07:53'),
(112, 3, 'achalfante', 'zU9!F!k@.*_B{@`', '2023-07-29 08:20:16'),
(114, 3, 'swraggsw', 'xA2%Gl2m0i', '2024-01-10 03:19:55'),
(116, 3, 'ngoodfielda', 'sO2&Z0xa', '2024-04-22 18:27:13'),
(119, 3, 'ocaress5', 'wZ3?sM|ze{9,', '2024-01-18 02:58:32'),
(122, 3, 'omorrishk', 'rB0~gu/geQL{', '2024-02-11 16:13:51'),
(124, 3, 'tauger1', 'dP1\'30\'BBzJn&y=', '2023-11-12 17:04:08'),
(126, 3, 'cscamadinq', 'sZ6#r\"@\'G<yT}(R', '2023-11-29 03:21:18'),
(129, 3, 'mstrevens3', 'xC8$\'!$jc`/|', '2023-05-21 22:45:55'),
(130, 3, 'cmackniely17', 'tS1~J?+r4pf.hP', '2023-08-15 07:01:47'),
(132, 3, 'mdomengue1e', 'cQ7\'|0a}', '2023-10-03 09:01:11'),
(133, 3, 'jmclagan14', 'yG0~zr=Bc@8e4', '2023-05-22 11:42:59'),
(135, 3, 'cospillane19', 'xC7<k0*xRNa', '2023-05-14 09:25:21'),
(136, 3, 'bhouseago0', 'tA2~yniIrs', '2023-10-25 07:39:36'),
(145, 3, 'mpellr', 'wX2~gT2XC8ug$', '2023-12-29 12:37:05'),
(153, 3, 'ltriplows', 'wL9*{{Fs4i', '2023-09-19 08:01:04'),
(157, 3, 'kmarnsi', 'cX4?W~=AuQ!Beut', '2024-02-29 12:02:00'),
(161, 3, 'cyesenev15', 'qM3)A(KxB', '2023-08-20 15:01:45'),
(163, 3, 'lyurenevn', 'qW3`/ZQ3fNp_', '2023-10-28 09:11:46'),
(166, 3, 'mquinced', 'jG7!n97{yCtwQ', '2024-02-24 01:34:39'),
(169, 3, 'cmathevetz', 'fI7odqhv.}0t0mp', '2024-04-28 20:17:52'),
(171, 3, 'fkirkland6', 'kU2@!>P{+D\"hn', '2023-05-25 01:24:43'),
(172, 3, 'jlowrel', 'fN8&\'e~1Nqhc&N', '2023-04-30 01:10:15'),
(174, 3, 'agossart4', 'pN9}eORoZ', '2024-03-30 06:46:19'),
(175, 3, 'anunesnabarrof', 'xS1~/6VBfNywY', '2024-02-16 06:21:35'),
(178, 3, 'hhanwright16', 'oG6~i0BEuq<tO', '2024-04-19 05:28:06'),
(180, 3, 'jburrowo', 'xZ0_!Ldkc3|{Yc`$', '2023-10-13 08:43:34'),
(181, 3, 'dtimckej', 'hB2*/VcbSrwnpV{', '2023-10-19 23:27:28'),
(182, 3, 'lkeyme2', 'oH3>N0YR.Gr0R', '2024-04-25 19:36:43'),
(183, 3, 'ivedishchevx', 'iT8}b`ST>rOUV%', '2023-05-31 02:38:03'),
(185, 3, 'amanserh', 'lZ3=ovjJG*\'', '2023-05-12 15:18:13'),
(192, 3, 'osoar11', 'sI7\"r++ubd`', '2023-10-11 13:06:29'),
(194, 3, 'dsummerelly', 'sC7)c=H`Cncq', '2023-06-29 11:42:22'),
(196, 3, 'jpopley9', 'cG2!wvhyc/dp', '2024-02-25 08:34:24'),
(198, 3, 'nfinlatorc', 'mQ2/>DW{v|5C\'~', '2024-04-18 02:16:27'),
(199, 3, 'otrevorrowm', 'jW5(xm9\'y', '2024-04-19 00:18:40'),
(203, 2, 'malessandretti3', 'zF9.2dFaTJ', '2023-09-22 05:51:26'),
(207, 2, 'sbarnish1', 'tI9(=K_L\rCQy', '2024-02-01 11:29:54'),
(209, 2, 'mbarroux0', 'dK9=,/7#.q+', '2023-07-28 05:17:53'),
(210, 1, 'dglenny2', 'zD9_@$Yj', '2023-10-04 23:15:23');

-- --------------------------------------------------------

--
-- Structure for view `admins_view`
--
DROP TABLE IF EXISTS `admins_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admins_view`  AS SELECT `t1`.`admin_id` AS `admin_id`, `t1`.`user_id` AS `user_id`, `t1`.`staff_id` AS `staff_id`, `t2`.`role_name` AS `role_name`, `t3`.`title_alias` AS `title_alias`, `t4`.`gender_name` AS `gender_name`, `t1`.`surname` AS `surname`, `t1`.`firstname` AS `firstname`, `t1`.`othername` AS `othername`, `t1`.`email` AS `email`, `t1`.`tel` AS `tel`, `t1`.`time_created` AS `time_created` FROM (((`admins` `t1` left join `roles` `t2` on(`t1`.`role_id` = `t2`.`role_id`)) left join `titles` `t3` on(`t1`.`title_id` = `t3`.`title_id`)) left join `gender` `t4` on(`t1`.`gender_id` = `t4`.`gender_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `courses_view`
--
DROP TABLE IF EXISTS `courses_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `courses_view`  AS SELECT `t1`.`course_id` AS `course_id`, `t1`.`course_title` AS `course_title`, `t1`.`course_code` AS `course_code`, `t1`.`course_unit` AS `course_unit`, `t1`.`requirements` AS `requirements`, `t2`.`department_name` AS `department_name`, `t2`.`department_code` AS `department_code`, `t3`.`semester_name` AS `semester_name`, `t4`.`level_name` AS `level_name`, `t1`.`time_added` AS `time_added` FROM (((`courses` `t1` left join `departments` `t2` on(`t1`.`department_id` = `t2`.`department_id`)) left join `semester` `t3` on(`t1`.`semester_id` = `t3`.`semester_id`)) left join `level` `t4` on(`t1`.`level_id` = `t4`.`level_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `lecturers_view`
--
DROP TABLE IF EXISTS `lecturers_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lecturers_view`  AS SELECT `t1`.`lecturer_id` AS `lecturer_id`, `t1`.`user_id` AS `user_id`, `t1`.`staff_id` AS `staff_id`, `t2`.`role_name` AS `role_name`, `t3`.`title_alias` AS `title_alias`, `t4`.`gender_name` AS `gender_name`, `t1`.`surname` AS `surname`, `t1`.`firstname` AS `firstname`, `t1`.`othername` AS `othername`, `t1`.`email` AS `email`, `t1`.`tel` AS `tel`, `t1`.`time_added` AS `time_added` FROM (((`lecturers` `t1` left join `roles` `t2` on(`t1`.`role_id` = `t2`.`role_id`)) left join `titles` `t3` on(`t1`.`title_id` = `t3`.`title_id`)) left join `gender` `t4` on(`t1`.`gender_id` = `t4`.`gender_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `results_view`
--
DROP TABLE IF EXISTS `results_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `results_view`  AS SELECT `t1`.`result_id` AS `result_id`, `t1`.`session_id` AS `session_id`, `t7`.`session_name` AS `session_name`, `t2`.`semester_id` AS `semester_id`, `t5`.`semester_name` AS `semester_name`, `t2`.`level_id` AS `level_id`, `t4`.`level_name` AS `level_name`, `t2`.`department_id` AS `department_id`, `t6`.`department_name` AS `department_name`, `t1`.`student_id` AS `student_id`, `t3`.`matric_no` AS `matric_no`, `t3`.`firstname` AS `firstname`, `t3`.`surname` AS `surname`, `t3`.`othername` AS `othername`, `t3`.`mode_of_entry` AS `mode_of_entry`, `t8`.`mode_name` AS `mode_name`, group_concat(`t2`.`course_id` separator ',') AS `course_ids`, group_concat(`t1`.`total` separator ',') AS `scores` FROM (((((((`results` `t1` left join `courses` `t2` on(`t1`.`course_id` = `t2`.`course_id`)) left join `students` `t3` on(`t1`.`student_id` = `t3`.`student_id`)) left join `level` `t4` on(`t2`.`level_id` = `t4`.`level_id`)) left join `semester` `t5` on(`t2`.`semester_id` = `t5`.`semester_id`)) left join `departments` `t6` on(`t2`.`department_id` = `t6`.`department_id`)) left join `session` `t7` on(`t1`.`session_id` = `t7`.`session_id`)) left join `mode_of_entry` `t8` on(`t3`.`mode_of_entry` = `t8`.`mode_id`)) WHERE `t1`.`total` is not null GROUP BY `t1`.`student_id` ;

-- --------------------------------------------------------

--
-- Structure for view `students_view`
--
DROP TABLE IF EXISTS `students_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `students_view`  AS SELECT `t1`.`student_id` AS `student_id`, `t1`.`matric_no` AS `matric_no`, `t1`.`user_id` AS `user_id`, `t5`.`role_name` AS `role_name`, `t1`.`surname` AS `surname`, `t1`.`firstname` AS `firstname`, `t1`.`othername` AS `othername`, `t2`.`gender_name` AS `gender_name`, `t3`.`department_name` AS `department_name`, `t4`.`level_name` AS `level_name`, `t1`.`email` AS `email`, `t1`.`tel` AS `tel`, `t6`.`mode_name` AS `mode_name`, `t1`.`time_created` AS `time_created` FROM (((((`students` `t1` left join `gender` `t2` on(`t1`.`gender_id` = `t2`.`gender_id`)) left join `departments` `t3` on(`t1`.`department_id` = `t3`.`department_id`)) left join `level` `t4` on(`t1`.`level_id` = `t4`.`level_id`)) left join `roles` `t5` on(`t1`.`role_id` = `t5`.`role_id`)) left join `mode_of_entry` `t6` on(`t1`.`mode_of_entry` = `t6`.`mode_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `action_type`
--
ALTER TABLE `action_type`
  ADD PRIMARY KEY (`action_type_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `title_id` (`title_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `title_id` (`title_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `mode_of_entry`
--
ALTER TABLE `mode_of_entry`
  ADD PRIMARY KEY (`mode_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `matric_no` (`matric_no`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `mode_of_entry` (`mode_of_entry`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `action_type`
--
ALTER TABLE `action_type`
  MODIFY `action_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mode_of_entry`
--
ALTER TABLE `mode_of_entry`
  MODIFY `mode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `admins_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `admins_ibfk_3` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`);

--
-- Constraints for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `lecturers_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  ADD CONSTRAINT `lecturers_ibfk_3` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  ADD CONSTRAINT `results_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`),
  ADD CONSTRAINT `students_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `students_ibfk_5` FOREIGN KEY (`mode_of_entry`) REFERENCES `mode_of_entry` (`mode_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
