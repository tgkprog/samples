-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2015 at 02:04 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mohRoles`
--
CREATE DATABASE IF NOT EXISTS `mohRoles` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mohRoles`;

-- --------------------------------------------------------

--
-- Table structure for table `privilidges`
--

DROP TABLE IF EXISTS `privilidges`;
CREATE TABLE IF NOT EXISTS `privilidges` (
`prv_id` int(11) NOT NULL,
  `prv` varchar(245) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilidges`
--

INSERT INTO `privilidges` (`prv_id`, `prv`) VALUES
(1, 'admin_user_add'),
(3, 'admin_user_del'),
(2, 'admin_user_edit'),
(4, 'user_home');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
`role_id` int(11) NOT NULL,
  `role` varchar(245) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `roles_privilidges`
--

DROP TABLE IF EXISTS `roles_privilidges`;
CREATE TABLE IF NOT EXISTS `roles_privilidges` (
`role_prv_id` int(11) NOT NULL,
  `role` varchar(245) NOT NULL,
  `prv` varchar(245) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_privilidges`
--

INSERT INTO `roles_privilidges` (`role_prv_id`, `role`, `prv`) VALUES
(1, 'ROLE_ADMIN', 'admin_user_add'),
(2, 'ROLE_ADMIN', 'admin_user_edit'),
(3, 'ROLE_USER', 'user_home');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('alex', 'dada', 1),
('tushar', 'wert', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
`user_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(245) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(2, 'tushar', 'ROLE_ADMIN'),
(3, 'alex', 'ROLE_USER'),
(1, 'tushar', 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `privilidges`
--
ALTER TABLE `privilidges`
 ADD PRIMARY KEY (`prv_id`), ADD UNIQUE KEY `uni_privilidges_prv` (`prv`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`role_id`), ADD UNIQUE KEY `roles_role` (`role`);

--
-- Indexes for table `roles_privilidges`
--
ALTER TABLE `roles_privilidges`
 ADD PRIMARY KEY (`role_prv_id`), ADD UNIQUE KEY `roles_privilidges_role_p` (`role`,`prv`), ADD KEY `fk_roles_priv_fk` (`prv`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
 ADD PRIMARY KEY (`user_role_id`), ADD UNIQUE KEY `uni_username_role` (`role`,`username`), ADD KEY `fk_username_idx` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `privilidges`
--
ALTER TABLE `privilidges`
MODIFY `prv_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles_privilidges`
--
ALTER TABLE `roles_privilidges`
MODIFY `role_prv_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `roles_privilidges`
--
ALTER TABLE `roles_privilidges`
ADD CONSTRAINT `fk_roles_priv_fk` FOREIGN KEY (`prv`) REFERENCES `privilidges` (`prv`),
ADD CONSTRAINT `fk_roles_role_fk` FOREIGN KEY (`role`) REFERENCES `roles` (`role`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
