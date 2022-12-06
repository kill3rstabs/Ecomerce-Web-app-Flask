-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql6.freesqldatabase.com
-- Generation Time: Dec 06, 2022 at 08:36 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql6580129`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`userid`, `productid`, `quantity`) VALUES
(5, 3, 5),
(5, 4, 2),
(8, 3, 5),
(8, 4, 21),
(8, 17, 19);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `transactionid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`transactionid`, `userid`, `transaction_date`, `amount`) VALUES
(2, 5, '2022-12-06 14:34:03', '8945.0'),
(3, 5, '2022-12-06 14:39:16', '8945.0'),
(4, 5, '2022-12-06 14:40:47', '8945.0'),
(5, 5, '2022-12-06 15:25:12', '9945.0'),
(6, 5, '2022-12-06 15:34:55', '2495.0'),
(7, 5, '2022-12-06 15:35:13', '4990.0'),
(8, 5, '2022-12-06 15:35:25', '7485.0'),
(9, 5, '2022-12-06 15:35:31', '6986.0'),
(10, 5, '2022-12-06 15:47:39', '2495.0'),
(11, 5, '2022-12-06 15:50:51', '2495.0'),
(12, 5, '2022-12-06 17:06:21', '0.0'),
(13, 5, '2022-12-06 17:08:14', '4990.0'),
(14, 5, '2022-12-06 17:23:52', '4990.0'),
(15, 5, '2022-12-06 17:24:20', '34930.0'),
(16, 5, '2022-12-06 17:27:44', '22455.0'),
(17, 5, '2022-12-06 17:39:24', '22455.0'),
(18, 5, '2022-12-06 17:39:56', '22954.0'),
(19, 5, '2022-12-06 17:41:04', '23154.0'),
(20, 5, '2022-12-06 17:42:45', '33134.0'),
(21, 223, '2022-12-06 18:31:40', '4990.0'),
(22, 223, '2022-12-06 18:32:20', '11990.0'),
(23, 223, '2022-12-06 18:32:28', '11640.0'),
(24, 5, '2022-12-06 18:58:19', '44611.0'),
(25, 5, '2022-12-06 18:59:41', '44611.0'),
(26, 5, '2022-12-06 19:00:16', '45110.0'),
(27, 5, '2022-12-06 19:00:36', '44611.0'),
(28, 5, '2022-12-06 19:05:10', '49601.0'),
(29, 5, '2022-12-06 19:07:46', '49601.0'),
(30, 5, '2022-12-06 19:07:52', '49102.0'),
(31, 5, '2022-12-06 19:15:19', '48603.0'),
(32, 5, '2022-12-06 19:16:39', '51753.0'),
(33, 8, '2022-12-06 20:10:05', '15968.0'),
(34, 8, '2022-12-06 20:11:40', '27445.0'),
(35, 8, '2022-12-06 20:14:07', '26946.0'),
(36, 8, '2022-12-06 20:19:04', '26946.0'),
(37, 8, '2022-12-06 20:19:15', '26447.0'),
(38, 8, '2022-12-06 20:20:27', '25948.0'),
(39, 8, '2022-12-06 20:21:27', '25449.0'),
(40, 8, '2022-12-06 20:22:32', '24950.0'),
(41, 5, '2022-12-06 20:24:17', '0.0'),
(42, 5, '2022-12-06 20:24:36', '4990.0'),
(43, 5, '2022-12-06 20:24:54', '4491.0'),
(44, 5, '2022-12-06 20:24:58', '3992.0'),
(45, 5, '2022-12-06 20:25:06', '3493.0'),
(46, 5, '2022-12-06 20:27:23', '3493.0'),
(47, 5, '2022-12-06 20:27:52', '4491.0'),
(48, 5, '2022-12-06 20:28:39', '3992.0'),
(49, 5, '2022-12-06 20:28:52', '3493.0');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `userid` int(11) NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `expiry` varchar(10) NOT NULL,
  `cvc` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `quantity` int(5) NOT NULL,
  `discounted_price` decimal(10,1) NOT NULL DEFAULT '0.0',
  `regular_price` decimal(10,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `sku`, `product_name`, `description`, `image`, `quantity`, `discounted_price`, `regular_price`) VALUES
(2, '123', 'Iphone-X', 'Iphone-X', 'iphoneX.jpeg', 980, '499.0', '499.0'),
(3, '234', 'SamsungUHD', 'SAMSUNG UN43NU6900 43\" CLASS/42.5\" DIAG 4K UHD MR120 SMART TV HDR 10+ PUR COLOR', 'SamsungUHD.jpg', 970, '499.0', '499.0'),
(4, '456', 'SamsungS8', 'SamsungS8', 'SamsungS8.jpeg', 464, '599.0', '499.0'),
(5, '678', 'motorolaZ2-Force', 'motorolaZ2-Force', 'motorola.jpeg', 588, '999.0', '499.0'),
(9, '8910', 'SamsungCurved', '65\" Class Q8C Curved QLED 4K TV', 'samsung_curve.jpeg', 984, '699.0', '499.0'),
(14, '101112', 'Macbook', 'Macbook', 'macbook.jpeg', 988, '4999.0', '499.0'),
(17, '32434223', 'DellInspiron', 'Dell Inspiron', 'dell_inspiron.jpeg', 969, '4999.0', '499.0'),
(18, '34543345', 'Andriod Watch', 'Andriod Watch', 'android_watch.jpeg', 988, '4999.0', '499.0'),
(19, '32434534223', 'Huawei', 'Huawei', 'huawei.jpeg', 978, '999.0', '350.0'),
(43, '5776', 'ipad', 'apple ipad', 'ipad.jpeg', 991, '300.0', '320.0'),
(52, '123', 'tv remote', 'tv remote', 'remote.jpeg', 988, '12.0', '12.0'),
(59, '28954', 'balloons', 'balloons', 'balloons.jpeg', 185, '4999.0', '499.0'),
(60, '4456', 'gun', 'gun', 'gun.jpeg', 88, '200.0', '200.0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `fname` varchar(20) CHARACTER SET latin1 NOT NULL,
  `lname` varchar(120) CHARACTER SET latin1 NOT NULL,
  `password` varchar(60) CHARACTER SET latin1 NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(120) CHARACTER SET latin1 NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  `city` varchar(20) COLLATE utf8_bin NOT NULL,
  `country` varchar(20) COLLATE utf8_bin NOT NULL,
  `zipcode` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `fname`, `lname`, `password`, `active`, `email`, `created_on`, `address`, `city`, `country`, `zipcode`) VALUES
(1, 'Nikhil', 'Agrawal', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'nikhil.agrwl07@gmail.com', '2018-12-03 11:49:36', '', '', '', ''),
(4, 'User2', 'LastName2', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'nikhil.agrwl071@gmail.com', '2018-12-03 11:53:20', '', '', '', ''),
(5, 'nashit', 'budhwani', 'password', 1, '', '2022-12-06 12:44:50', '', '', '', ''),
(8, 'ali', 'hassan', 'password', 1, 'ali.hassan@gmail.com', '2022-12-06 12:44:50', '', '', '', ''),
(10, 'ali', 'hassan', 'password', 1, 'ali.hassa1n@gmail.com', '2022-12-06 12:44:50', '', '', '', ''),
(11, 'dam', 'nigga', 'kyliejeener', 1, 'communist@budhist.com', '2022-12-06 12:44:50', '', '', '', ''),
(12, 'sadsa', 'asdsa', 'asdsad', 1, 'nashiT@adasd', '2022-12-06 12:44:50', '', '', '', ''),
(15, 'nashit', 'budhwani', 'password', 1, 'nashiT@zasdasdasd', '2022-12-06 12:44:50', '', '', '', ''),
(17, 'nashit', 'budhwani', 'password', 1, 'nashiT@zasd', '2022-12-06 12:44:50', '', '', '', ''),
(18, 'nashit', 'budhwani', 'password', 1, 'ali@hassan.gmail.com', '2022-12-06 12:44:50', '', '', '', ''),
(19, 'dilon', 'ka shooter', 'password', 1, 'dilon@shooter.com', '2022-12-06 13:51:43', '', '', '', ''),
(21, 'dilon', 'ka shooter', 'password', 1, 'silon@shooter.com', '2022-12-06 13:56:29', '', '', '', ''),
(22, 'aslam', 'shaitaan', 'password', 1, 'aslamshaitan@yahoo.com', '2022-12-06 18:23:39', '', '', '', ''),
(223, 'aslam', 'shaitan', 'password', 1, 'aslamgandu@yahoo.com', '2022-12-06 18:30:42', 'jaleebi', 'hello', 'hello', '75950');

-- --------------------------------------------------------

--
-- Stand-in structure for view `userproduct`
-- (See below for the actual view)
--
CREATE TABLE `userproduct` (
`product_name` varchar(100)
,`description` varchar(100)
,`quantity` int(5)
,`image` varchar(100)
,`regular_price` decimal(10,1)
);

-- --------------------------------------------------------

--
-- Structure for view `userproduct`
--
DROP TABLE IF EXISTS `userproduct`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sql6580129`@`%` SQL SECURITY DEFINER VIEW `userproduct`  AS  select `product`.`product_name` AS `product_name`,`product`.`description` AS `description`,`product`.`quantity` AS `quantity`,`product`.`image` AS `image`,`product`.`regular_price` AS `regular_price` from `product` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userid`,`productid`),
  ADD KEY `cart_ibfk_2` (`productid`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`transactionid`),
  ADD KEY `sale_transaction_ibfk_1` (`userid`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `transactionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`);

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `sale_transaction_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_constraint` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
