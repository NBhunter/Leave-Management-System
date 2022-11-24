-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2020 at 10:45 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `head_id` int(30) NOT NULL,
  `superintendent_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `head_id`, `superintendent_id`) VALUES
(1, 'Information Technology', 0, 0),
(2, 'Marketing', 0, 0),
(3, 'HR', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lastname` text NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `department_id` int(30) NOT NULL,
  `position_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 5 COMMENT '1=Pricipal, 2=  Department Head , 3=Manager, 4 = supervisor,5 = regular',
  `manager_id` int(30) NOT NULL,
  `supervisor_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `user_id`, `employee_id`, `lastname`, `firstname`, `middlename`, `address`, `contact`, `department_id`, `position_id`, `type`, `manager_id`, `supervisor_id`) VALUES
(2, 5, '51842843', 'Smith', 'John', 'C', 'Sample', '123246548798', 1, 1, 2, 0, 0),
(3, 7, '97558385', 'Wilson', 'George', 'D', 'Sample Address', '+0123456789', 1, 2, 3, 0, 0),
(4, 2, '39303658', 'Blake', 'Claire', 'E', 'Sample', '065465425', 1, 5, 5, 3, 6),
(5, 4, '83534061', 'Martin', 'Ben', 'C', 'Sample', 'Sample', 1, 5, 5, 3, 0),
(6, 6, '69930211', 'Williams', 'Mike', 'B', 'Sample', '45621', 1, 6, 4, 3, 0),
(7, 3, '05785111', 'Link', 'Jackie', 'S', 'Sample', '1324347', 3, 7, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave_credits`
--

CREATE TABLE `leave_credits` (
  `id` int(30) NOT NULL,
  `leave_type_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `credits` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_credits`
--

INSERT INTO `leave_credits` (`id`, `leave_type_id`, `employee_id`, `credits`) VALUES
(1, 3, 4, 10),
(2, 4, 4, 10),
(3, 2, 4, 10),
(4, 1, 4, 10),
(5, 3, 5, 10),
(6, 4, 5, 10),
(7, 2, 5, 10),
(8, 1, 5, 10),
(9, 3, 2, 10),
(10, 4, 2, 10),
(11, 2, 2, 10),
(12, 1, 2, 10),
(13, 3, 6, 10),
(14, 4, 6, 10),
(15, 2, 6, 10),
(16, 1, 6, 10),
(17, 3, 3, 10),
(18, 4, 3, 10),
(19, 2, 3, 10),
(20, 1, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `leave_list`
--

CREATE TABLE `leave_list` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `leave_type_id` int(30) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Whole Day, 2= Half Day',
  `reason` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= approved,2 = disapproved',
  `approved_by` int(30) NOT NULL,
  `date_approved` date NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_list`
--

INSERT INTO `leave_list` (`id`, `employee_id`, `leave_type_id`, `date_from`, `date_to`, `type`, `reason`, `status`, `approved_by`, `date_approved`, `date_created`) VALUES
(2, 4, 1, '2020-10-19', '2020-10-22', 1, 'Sample Only', 1, 2, '2020-10-12', '2020-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `is_payable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= not payable, 1 = payable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`id`, `name`, `description`, `is_payable`) VALUES
(1, 'Vacation Leave (VL)', 'Vacation Leave', 1),
(2, 'SL', 'Sick Leave', 1),
(3, 'EL', 'Emergency Leave', 0),
(4, 'LWOP', 'Leave without pay', 0);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `department_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`, `department_id`) VALUES
(1, 'Department Head', 1),
(2, 'Manager', 1),
(3, 'Department Head', 2),
(4, 'Manager', 2),
(5, 'Programmer', 1),
(6, 'Lead Developer', 1),
(7, 'Department Head', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = Admin, 2=employee',
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `auto_generated` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `username`, `password`, `auto_generated`) VALUES
(1, 'Administrator', 1, 'admin', '0192023a7bbd73250516f069df18b500', ''),
(2, 'Claire Blake', 2, 'CBlake_39303658', 'a06d46beed6a0968520950e25a281e34', ''),
(3, 'Jackie Link', 2, 'JLink_05785111', '37f1d137d0f21f1745737611a92da605', ''),
(4, 'Ben Martin', 2, 'BMartin_83534061', '4149d4d9dc154634c8ee00c2606ec51e', ''),
(5, 'John Smith', 2, 'JSmith_51842843', 'e16897e0ffe77b91694adb95e0ed6b80', ''),
(6, 'Mike Williams', 2, 'MWilliams_69930211', '563a60169e3bf2ca437dd384edcbdd03', ''),
(7, 'George Wilson', 2, 'GWilson_97558385', '92186b07f90bec4a14aae103bd6e22ed', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_credits`
--
ALTER TABLE `leave_credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_list`
--
ALTER TABLE `leave_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `leave_credits`
--
ALTER TABLE `leave_credits`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `leave_list`
--
ALTER TABLE `leave_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
