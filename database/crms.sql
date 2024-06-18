-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2024 at 11:39 PM
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
(1, 'Added course', '2024-06-11 04:45:37'),
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
(1, 'General Mathematics 1', 'MTH 101', 3, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(2, 'Introduction to Computer Science', 'CSC 101', 3, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(3, 'General physics 1', 'PHY 101', 3, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(4, 'General physics Laboratory 1', 'PHY 191', 1, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(5, 'Physical Chemistry 1', 'CHM 101', 3, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(6, 'Organisms & Environment', 'BIO 101', 3, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(7, 'Communication English 1', 'GST 101', 2, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(8, 'People Culture and Social Issues', 'GST 103', 2, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(9, 'Library skills & ICT', 'GST 107', 2, 'C', 1, 1, 1, '2024-06-11 04:45:37'),
(10, 'General Mathematics II', 'MTH 102', 3, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(11, 'Introduction to problem solving', 'CSC 104', 3, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(12, 'General physics II', 'PHY 102', 3, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(13, 'General physics Laboratory II', 'PHY 192', 1, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(14, 'General Mathematics III', 'MTH 106', 3, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(15, 'Communication English II', 'GST 102', 2, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(16, 'Digital marketing', 'GST 104', 2, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(17, 'Introduction to psychology mind and sexuality Education II', 'GST 106', 2, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(18, 'Logic, philosophy and human Existence', 'GST 108', 2, 'C', 1, 2, 1, '2024-06-11 04:45:37'),
(19, 'Mathematical Methods', 'MTH 201', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(20, 'Linear Algebra', 'MTH 203', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(21, 'Computer Hardware and Maintenance', 'CSC 213', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(22, 'Computer programming 1', 'CSC 201', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(23, 'Computer Operating System 1', 'CSC 203', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(24, 'Foundation of sequential Programming', 'CSC 205', 3, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(25, 'Environmenmt and Sustainable Development', 'GST 201', 2, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(26, 'Stastistical Computing', 'STA 201', 2, 'C', 1, 1, 2, '2024-06-11 04:45:37'),
(27, 'Computer Programming II', 'CSC 202', 3, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(28, 'Discrete structure', 'CSC 204', 2, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(29, 'Fundamentals of Datastructures', 'CSC 206', 3, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(30, 'System troubleshooting and repairs', 'CSC 208', 3, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(31, 'introduction to ordinary differential equations', 'MTH 202', 2, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(32, 'Electric Circuits and Electronics', 'PHY 214', 2, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(33, 'Numerical Analysis', 'MTH 204', 2, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(34, 'Elementary Modern Physiscs', 'PHY 202', 2, 'C', 1, 2, 2, '2024-06-11 04:45:37'),
(35, 'Basic Communication in French', 'GST 202', 2, '', 1, 2, 2, '2024-06-11 04:45:37'),
(36, 'Value Based Education 1', 'GST 204', 2, '', 1, 2, 2, '2024-06-11 04:45:37'),
(37, 'Architecture and organization 1', 'CSC 303', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(38, 'Structured programming', 'CSC 301', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(39, 'Object-oriented programming', 'CSC 335', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(40, 'System analysis and design', 'CSC 311', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(41, 'Survey of programming languages', 'CSC 305', 4, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(42, 'Data Management 1', 'CSC 331', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(43, 'Computational science and numerical methods', 'MTH 301', 3, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(44, 'Entrepreneurial skills 1', 'GST 301', 2, 'C', 1, 1, 3, '2024-06-11 04:45:37'),
(45, 'Architecture and organization II', 'CSC 302', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(46, 'Algorithms and Complexity Analysis', 'CSC 304', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(47, 'Computer operating system II', 'CSC 306', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(48, 'Formal Methods in software development', 'CSC 308', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(49, 'Industrial Attachment (SIWES)', 'CSC 310', 6, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(50, 'Special Topics in Computer Science', 'CSC 312', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(51, 'Entrepreneurial Skills II', 'GST 302', 3, 'C', 1, 2, 3, '2024-06-11 04:45:37'),
(52, 'Organization of programming language', 'CSC 411', 3, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(53, 'Human computer interface', 'CSC 433', 2, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(54, 'Artificial intelligence', 'CSC 405', 3, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(55, 'Software engineering', 'CSC 407', 4, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(56, 'Net-centric computing', 'CSC 439', 3, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(57, 'Computer graphics and visualization', 'CSC 413', 3, 'E', 1, 1, 4, '2024-06-11 04:45:37'),
(58, 'Computer system performance evaluation', 'CSC 415', 3, 'E', 1, 1, 4, '2024-06-11 04:45:37'),
(59, 'Modelling and simulation', 'CSC 417', 3, 'E', 1, 1, 4, '2024-06-11 04:45:37'),
(60, 'Leadership 1', 'GST 401', 3, 'C', 1, 1, 4, '2024-06-11 04:45:37'),
(61, 'Compiler Construction', 'CSC 402', 3, 'C', 1, 2, 4, '2024-06-11 04:45:37'),
(62, 'Computer networks and communications', 'CS 404', 3, 'C', 1, 2, 4, '2024-06-11 04:45:37'),
(63, 'Data management II', 'CSC 406', 3, 'C', 1, 2, 4, '2024-06-11 04:45:37'),
(64, 'Operations research', 'CSC 408', 3, 'C', 1, 2, 4, '2024-06-11 04:45:37'),
(65, 'Project', 'CSC 410', 6, 'C', 1, 2, 4, '2024-06-11 04:45:37'),
(66, 'Project Management', 'CSC 412', 3, 'E', 1, 2, 4, '2024-06-11 04:45:37'),
(67, 'Optimization Techniques', 'CSC 414', 3, 'E', 1, 2, 4, '2024-06-11 04:45:37');

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
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

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
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

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
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
