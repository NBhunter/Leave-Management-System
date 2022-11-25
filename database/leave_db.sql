-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 25, 2022 lúc 03:05 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `leave_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `makh` int(11) NOT NULL,
  `tenkh` varchar(50) NOT NULL,
  `diachi` longtext NOT NULL,
  `qlkhuvuc` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`makh`, `tenkh`, `diachi`, `qlkhuvuc`) VALUES
(1, 'Nguyễn Băng', 'Mỹ Phước, Long Xuyên, an Giang', '0'),
(2, 'Ngọc Nhi', 'Mỹ Phước, Long Xuyên, An Giang', NULL),
(3, 'Hoài Linh', 'Phú Tân, An Giang\r\n', NULL),
(5, 'Đức Giàu', 'TP.HCM', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `head_id` int(30) NOT NULL,
  `superintendent_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`id`, `name`, `head_id`, `superintendent_id`) VALUES
(1, 'IT', 0, 0),
(2, 'Marketing', 0, 0),
(3, 'Nhân sự', 0, 0),
(4, 'Kế toán', 0, 0),
(5, 'Kinh doanh', 0, 0),
(6, 'BGĐ', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_details`
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
-- Đang đổ dữ liệu cho bảng `employee_details`
--

INSERT INTO `employee_details` (`id`, `user_id`, `employee_id`, `lastname`, `firstname`, `middlename`, `address`, `contact`, `department_id`, `position_id`, `type`, `manager_id`, `supervisor_id`) VALUES
(2, 5, '51842843', 'Smith', 'John', 'C', 'Sample', '123246548798', 1, 1, 2, 0, 0),
(3, 7, '97558385', 'Wilson', 'George', 'D', 'Sample Address', '+0123456789', 1, 2, 3, 0, 0),
(4, 2, '39303658', 'Blake', 'Claire', 'E', 'Sample', '065465425', 1, 5, 5, 3, 6),
(5, 4, '83534061', 'Martin', 'Ben', 'C', 'Sample', 'Sample', 1, 5, 5, 3, 0),
(6, 6, '69930211', 'Williams', 'Mike', 'B', 'Sample', '45621', 1, 6, 4, 3, 0),
(7, 3, '05785111', 'Link', 'Jackie', 'S', 'Sample', '1324347', 3, 7, 1, 0, 0),
(8, 9, '46858358', 'Giàu', 'Đinh', 'Đức', 'aaaa', '098978941', 2, 4, 3, 0, 0),
(9, 10, '01235535', 'Chúc', 'Nguyễn', 'Văn', 'aaaa', '45452', 4, 9, 3, 0, 0),
(10, 11, '62277935', 'Van', 'Cao', 'Thuy', 'aaa', '5120', 4, 8, 5, 9, 0),
(11, 12, '72275214', 'Hân', 'Dương', 'Lạc', 'aaa', '09099', 6, 10, 1, 0, 0),
(12, 13, '28946244', 'Tu', 'Ly ', 'Thi Cam', 'aaaa', '0909000', 6, 11, 1, 0, 0),
(13, 14, '23403024', 'Thoa', 'Ly', 'Thi Kim', 'aaa', '09095657', 6, 12, 1, 0, 0),
(14, 15, '55206317', 'Yen', 'Ly', 'Thi Hai', 'aaa', '090999999', 6, 14, 1, 0, 0),
(15, 16, '54111043', 'Hoa', 'Ly', 'Thuy', 'aaa', '09999999', 6, 13, 1, 0, 0),
(16, 17, '04112302', 'Thong', 'Tiet', 'Hoang', 'aaa', '0999999', 6, 15, 1, 0, 0),
(17, 18, '47608211', 'Thuy', 'Vu', 'Thi Anh', 'aaa', '0666666', 4, 8, 5, 9, 0),
(18, 19, '53564274', 'Dung', 'Ta ', 'Thi Ngoc', 'aaa', '06866666', 4, 8, 5, 9, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_credits`
--

CREATE TABLE `leave_credits` (
  `id` int(30) NOT NULL,
  `leave_type_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `credits` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `leave_credits`
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
(20, 1, 3, 10),
(21, 1, 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_list`
--

CREATE TABLE `leave_list` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `leave_type_id` int(30) NOT NULL,
  `date_from` date NOT NULL,
  `money` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Thu, 2= Chi KH, 3 = Chi NCC, 4 = Chi',
  `reason` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= approved,2 = disapproved',
  `approved_by` int(30) NOT NULL,
  `date_approved` date NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `quy` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `leave_list`
--

INSERT INTO `leave_list` (`id`, `employee_id`, `customer_id`, `supplier_id`, `leave_type_id`, `date_from`, `money`, `type`, `reason`, `status`, `approved_by`, `date_approved`, `date_created`, `quy`) VALUES
(2, 4, 0, 0, 1, '2020-10-19', 0, 1, 'Sample Only', 1, 2, '2022-11-18', '2020-10-12', 1000000),
(15, 5, 0, 0, 4, '2022-11-12', 500000, 1, 'hi', 1, 2, '2022-11-18', '2022-11-18', 0),
(16, 5, 0, 0, 4, '2022-11-19', 500000, 1, '1', 1, 2, '2022-11-18', '2022-11-18', 0),
(24, 5, 0, 0, 3, '2022-11-10', 100900, 1, '111', 1, 2, '2022-11-18', '2022-11-18', 0),
(33, 2, 0, 0, 1, '2022-11-26', 500000, 1, 'a00', 0, 0, '0000-00-00', '2022-11-18', NULL),
(34, 5, 0, 0, 4, '2022-11-18', 500000, 2, 'aaa', 1, 2, '2022-11-18', '2022-11-18', NULL),
(35, 2, 0, 0, 1, '2022-11-19', 500000, 2, 'a', 0, 0, '0000-00-00', '2022-11-18', NULL),
(36, 5, 0, 0, 1, '2022-11-19', 500000, 2, 'aa', 1, 2, '2022-11-18', '2022-11-18', NULL),
(37, 5, 0, 0, 1, '2022-11-19', 50000, 1, 'aaa', 1, 2, '2022-11-18', '2022-11-18', NULL),
(39, 5, 0, 0, 3, '2023-01-01', 89000000, 3, 'abc', 0, 0, '0000-00-00', '2022-11-23', NULL),
(41, 5, 0, 0, 4, '2023-01-02', 500000, 2, 'customer', 2, 0, '0000-00-00', '2022-11-23', NULL),
(42, 5, 0, 0, 3, '2023-01-15', 90000, 0, 'test2', 0, 0, '0000-00-00', '2022-11-23', NULL),
(47, 5, 0, 0, 3, '2023-01-01', 9000000, 0, 'non', 0, 0, '0000-00-00', '2022-11-24', NULL),
(50, 5, 14, 0, 4, '2023-02-12', 123456, 2, '123456', 1, 2, '2022-11-23', '2022-11-24', NULL),
(51, 5, 1, 0, 3, '2023-01-11', 50000, 2, 'test2002', 0, 0, '0000-00-00', '2022-11-24', NULL),
(52, 5, 0, 0, 4, '2023-02-02', 150000, 2, 'test123213', 0, 0, '0000-00-00', '2022-11-24', NULL),
(53, 5, 0, 1, 3, '2023-01-12', 50000, 3, 'van chuyen hang', 0, 0, '0000-00-00', '2022-11-25', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_type`
--

CREATE TABLE `leave_type` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `is_payable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= not payable, 1 = payable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `leave_type`
--

INSERT INTO `leave_type` (`id`, `name`, `description`, `is_payable`) VALUES
(1, '11/2022', '', 0),
(2, '12/2022', '', 0),
(3, '01/2023', '', 0),
(4, '02/2023', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `note_credits`
--

CREATE TABLE `note_credits` (
  `id` int(11) NOT NULL,
  `note_type_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `credits` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `note_credits`
--

INSERT INTO `note_credits` (`id`, `note_type_id`, `employee_id`, `credits`) VALUES
(1, 1, 9, 1000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `note_list`
--

CREATE TABLE `note_list` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `note_type_id` int(30) NOT NULL,
  `date` date NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Phiếu Chi, 2= Phiếu Thu',
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=pending,1= approved,2 = disapproved	',
  `approved_by` int(11) NOT NULL,
  `date_approved` date NOT NULL,
  `date_create` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `note_type`
--

CREATE TABLE `note_type` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `note_type`
--

INSERT INTO `note_type` (`id`, `name`, `description`) VALUES
(1, 'hihi', 'hihi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offer_credits`
--

CREATE TABLE `offer_credits` (
  `id` int(30) NOT NULL,
  `offer_type_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `credits` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `offer_credits`
--

INSERT INTO `offer_credits` (`id`, `offer_type_id`, `employee_id`, `credits`) VALUES
(1, 1, 8, 0),
(2, 1, 5, 10),
(3, 1, 4, 10),
(4, 2, 4, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offer_list`
--

CREATE TABLE `offer_list` (
  `id` int(30) NOT NULL,
  `employeed_id` int(30) NOT NULL,
  `offer_type_id` int(30) NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `soluong` int(11) NOT NULL,
  `donvitinh` text COLLATE utf8_unicode_ci NOT NULL,
  `sotien` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=pending,1= approved,2 = disapproved',
  `approved_by` int(30) NOT NULL,
  `date_approved` date NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offer_type`
--

CREATE TABLE `offer_type` (
  `id` int(30) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `offer_type`
--

INSERT INTO `offer_type` (`id`, `name`, `description`) VALUES
(1, 'Mua mới', 'phụ tùng, vật tư'),
(2, 'Sửa chữa', 'Vật tư, máy móc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `position`
--

CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `department_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `position`
--

INSERT INTO `position` (`id`, `name`, `department_id`) VALUES
(1, 'Trưởng phòng', 1),
(2, 'Người quản lí', 1),
(3, 'Trưởng phòng', 2),
(4, 'Người quản lí', 2),
(5, 'Lập trình viên', 1),
(6, 'Giám đốc', 1),
(7, 'Trưởng phòng', 3),
(8, 'Nhân viên', 4),
(9, 'Trưởng phòng', 4),
(10, 'Thư Kí', 6),
(11, 'Chủ tịch', 6),
(12, 'Thủ quỹ', 6),
(13, 'Giám đốc Điều Hành', 6),
(14, 'Giám đốc kinh doanh', 6),
(15, 'Giám đốc sản xuất', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `sup_name` varchar(50) NOT NULL,
  `sup_address` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`id`, `sup_name`, `sup_address`) VALUES
(1, 'CTY van chuyen ABC', 'TP.HCM'),
(2, 'CTY van chuyen Bắc  Nam', 'TP.HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `username`, `password`, `auto_generated`) VALUES
(1, 'Administrator', 1, 'admin', '0192023a7bbd73250516f069df18b500', ''),
(2, 'Claire Blake', 2, 'CBlake_39303658', 'a06d46beed6a0968520950e25a281e34', ''),
(3, 'Kho1', 2, 'Kho1', '202cb962ac59075b964b07152d234b70', ''),
(4, 'Ben Martin', 2, 'BMar', '202cb962ac59075b964b07152d234b70', ''),
(5, 'John Smith', 2, 'giau1', '202cb962ac59075b964b07152d234b70', ''),
(6, 'Mike Williams', 2, 'MWilliams_69930211', '563a60169e3bf2ca437dd384edcbdd03', ''),
(7, 'Kho2', 2, 'kho2', '202cb962ac59075b964b07152d234b70', ''),
(9, 'Đinh Giàu', 2, 'Giau', '202cb962ac59075b964b07152d234b70', ''),
(10, 'Nguyễn Chúc', 2, 'vanchuc', '202cb962ac59075b964b07152d234b70', ''),
(11, 'Cao Van', 2, 'vancao', '202cb962ac59075b964b07152d234b70', ''),
(12, 'Dương Hân', 2, 'lachan', '202cb962ac59075b964b07152d234b70', ''),
(13, 'Ly  Tu', 2, 'camtu', '202cb962ac59075b964b07152d234b70', ''),
(14, 'Ly Thoa', 2, 'LThoa_23403024', '0350f77e79bc44dfc5a4cc2aa1ccb2e6', ''),
(15, 'Ly Yen', 2, 'LYen_55206317', 'c32de2cce838a925e082fa7b40099676', ''),
(16, 'Ly Hoa', 2, 'LHoa_54111043', 'b036608ccf6520b332b410cd9e7d6dd5', ''),
(17, 'Tiet Thong', 2, 'TThong_04112302', '17a07301218588bb335aa1856c271fc0', ''),
(18, 'Vu Thuy', 2, 'VThuy_47608211', '5c202583b86d616cf64187499bde48c6', ''),
(19, 'Ta  Dung', 2, 'TDung_53564274', '218f99c0d1ffbaee45f089a100b675b7', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`makh`);

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leave_credits`
--
ALTER TABLE `leave_credits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leave_list`
--
ALTER TABLE `leave_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `note_credits`
--
ALTER TABLE `note_credits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `note_list`
--
ALTER TABLE `note_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `note_type`
--
ALTER TABLE `note_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `offer_credits`
--
ALTER TABLE `offer_credits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `offer_list`
--
ALTER TABLE `offer_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `offer_type`
--
ALTER TABLE `offer_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `makh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `leave_credits`
--
ALTER TABLE `leave_credits`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `leave_list`
--
ALTER TABLE `leave_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `note_credits`
--
ALTER TABLE `note_credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `note_list`
--
ALTER TABLE `note_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `note_type`
--
ALTER TABLE `note_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `offer_credits`
--
ALTER TABLE `offer_credits`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `offer_list`
--
ALTER TABLE `offer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `offer_type`
--
ALTER TABLE `offer_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `position`
--
ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
