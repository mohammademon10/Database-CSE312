-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2026 at 07:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `campus_id` int(11) NOT NULL,
  `campus_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `university_id`) VALUES
(1, 'CSE', 1),
(2, 'EEE', 1),
(3, 'ME', 2),
(4, 'CE', 3),
(5, 'BBA', 4),
(6, 'CSE', 5),
(7, 'CSE', 6),
(8, 'Pharmacy', 7),
(9, 'Law', 8);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `name`, `designation`, `salary`, `department_id`) VALUES
(1, 'Dr. Kamal Hossain', 'Professor', 120000.00, 1),
(2, 'Dr. Rezaul Karim', 'Associate Professor', 100000.00, 1),
(3, 'Engr. Shafiq Ahmed', 'Assistant Professor', 80000.00, 2),
(4, 'Dr. Laila Parvin', 'Professor', 115000.00, 3),
(5, 'Dr. Mizanur Rahman', 'Associate Professor', 95000.00, 3),
(6, 'Engr. Tanvir Islam', 'Lecturer', 60000.00, 4),
(7, 'Dr. Nusrat Chowdhury', 'Professor', 110000.00, 5),
(8, 'Mr. Asif Mahmud', 'Lecturer', 55000.00, 5),
(9, 'Dr. Farhan Zaman', 'Associate Professor', 90000.00, 6),
(10, 'Ms. Sadia Rahman', 'Lecturer', 50000.00, 6),
(11, 'Dr. Hasan Imam', 'Professor', 105000.00, 7),
(12, 'Mr. Arif Hossain', 'Lecturer', 52000.00, 7),
(13, 'Dr. Sharmin Akter', 'Associate Professor', 92000.00, 8),
(14, 'Mr. Imran Khan', 'Lecturer', 48000.00, 8),
(15, 'Dr. Tariq Aziz', 'Professor', 125000.00, 9),
(16, 'Ms. Nabila Yasmin', 'Lecturer', 53000.00, 9);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `date_of_birth`, `department_id`, `university_id`) VALUES
(1, 'Rahim Uddin', 'rahim@buet.ac.bd', '2000-02-10', 1, 1),
(2, 'Karim Hasan', 'karim@cuet.ac.bd', '1999-06-15', 3, 2),
(3, 'Nusrat Jahan', 'nusrat@bracu.ac.bd', '2001-01-20', 5, 4),
(4, 'Tanvir Ahmed', 'tanvir@uiu.ac.bd', '2000-09-12', 6, 5),
(5, 'Sadia Islam', 'sadia@diu.edu.bd', '2002-03-05', 7, 6),
(6, 'Arafat Hossain', 'arafat@buet.ac.bd', '2000-04-12', 1, 1),
(7, 'Mehedi Hasan', 'mehedi@buet.ac.bd', '1999-11-23', 2, 1),
(8, 'Sabbir Rahman', 'sabbir@cuet.ac.bd', '2000-07-19', 3, 2),
(9, 'Farzana Akter', 'farzana@cuet.ac.bd', '2001-02-14', 3, 2),
(10, 'Rakibul Islam', 'rakib@ruet.ac.bd', '1999-08-09', 4, 3),
(11, 'Tania Sultana', 'tania@ruet.ac.bd', '2000-12-01', 4, 3),
(12, 'Nayeem Chowdhury', 'nayeem@bracu.ac.bd', '2001-06-30', 5, 4),
(13, 'Ishrat Jahan', 'ishrat@bracu.ac.bd', '2002-03-11', 5, 4),
(14, 'Shakib Ahmed', 'shakib@uiu.ac.bd', '2000-05-21', 6, 5),
(15, 'Mim Akter', 'mim@uiu.ac.bd', '2001-09-18', 6, 5),
(16, 'Hasan Mahmud', 'hasan@diu.edu.bd', '2002-01-25', 7, 6),
(17, 'Jannatul Ferdous', 'jannat@diu.edu.bd', '2001-07-07', 7, 6),
(18, 'Rifat Karim', 'rifat@ewubd.edu', '1999-10-10', 8, 7),
(19, 'Sumaiya Islam', 'sumaiya@ewubd.edu', '2000-03-03', 8, 7),
(20, 'Fahim Rahman', 'fahim@nsu.edu', '2001-11-15', 9, 8),
(21, 'Tasnia Ahmed', 'tasnia@nsu.edu', '2002-08-28', 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `established_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`university_id`, `name`, `location`, `established_year`) VALUES
(1, 'BUET', 'Dhaka', 1962),
(2, 'CUET', 'Chattogram', 1968),
(3, 'RUET', 'Rajshahi', 1964),
(4, 'BRAC University', 'Dhaka', 2001),
(5, 'United International University (UIU)', 'Dhaka', 2003),
(6, 'Daffodil International University (DIU)', 'Dhaka', 2002),
(7, 'East West University (EWU)', 'Dhaka', 1996),
(8, 'North South University (NSU)', 'Dhaka', 1992);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`campus_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`university_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `campus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `campus_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
