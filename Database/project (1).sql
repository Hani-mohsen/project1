-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- المزود: localhost
-- أنشئ في: 29 يوليو 2017 الساعة 00:21
-- إصدارة المزود: 5.6.12-log
-- PHP إصدارة: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- قاعدة البيانات: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- بنية الجدول `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `p_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- إرجاع أو استيراد بيانات الجدول `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `user_id`, `p_name`, `qty`, `price`) VALUES
(2, 6, 9, 'Title 5', 1, 91),
(3, 7, 9, 'Title 6', 1, 97),
(4, 1, 9, 'This is title no. 1 ', 1, 99),
(5, 7, 9, 'Title 6', 1, 97);

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'New category'),
(2, 'cateee'),
(3, 'Dell'),
(5, 'Toshiba'),
(6, 'Fujitsu'),
(7, 'Lenovo'),
(8, 'PC'),
(9, 'Test'),
(10, 'This is space test');

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `transaction` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- بنية الجدول `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- إرجاع أو استيراد بيانات الجدول `products`
--

INSERT INTO `products` (`id`, `category_id`, `user_id`, `title`, `image`, `description`, `price`, `keywords`) VALUES
(1, 1, 9, 'This is title no. 1 ', '1.jpg', 'Hello this is the description number one ....', '99.00', 'laptop, core i7, laptops, dell'),
(2, 1, 10, 'This is title no. 2 ', '2.jpg', 'Hello this is the description number 2 ..........', '91.00', 'PC, PC''s, personal, core i5, samsung, desktop'),
(3, 2, 10, 'Title 3', '4.jpg', 'Hello This is description number three ..........................', '99.00', 'laptop, core i5, toshiba '),
(4, 2, 10, 'Title 4', '3.jpg', 'Hello this is description number four .......................', '100.00', 'core i7, laptops'),
(5, 2, 10, 'Title 5', '5.jpg', 'Hello this is description number five', '91.00', 'tablet'),
(6, 1, 9, 'Title 5', '5.jpg', 'Hello this is description number five', '91.00', ''),
(7, 2, 9, 'Title 6', '6.jpg', 'Hello this is description number six .....................', '97.00', ''),
(8, 1, 10, 'Title 7', '3.jpg', 'Hello this is description number seven ..........................', '81.00', ''),
(9, 2, 9, 'aaaaaaaaaaaaaaa', '5.jpg', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '99.00', ''),
(10, 1, 10, 'asnanana', '6.jpg', 'anananana', '77.00', ''),
(12, 2, 10, 'Amro', '20170213_112521.jpg', 'hey there ', '90.30', ''),
(13, 1, 9, 'This is a new title ', '2 (27).jpg', 'Description by amr', '100.20', ''),
(14, 1, 9, 'This is a new title ', '2 (27).jpg', 'Description by amr', '100.20', ''),
(15, 2, 9, '11111111111', '1428359816631.jpg', '222222222222222222', '23.00', ''),
(16, 0, 10, '11111111111', '1428359816631.jpg', '222222222222222222', '23.00', ''),
(19, 0, 9, 'My name is amr', '&#1634;&#1632;&#1633;&#1636;&#1633;&#1632;&#1634;&#1637;_&#1632;&#1635;&#1635;&#1633;&#1636;&#1638;.', 'hello this is me ', '10.20', ''),
(20, 2, 10, 'aaa', 'd3c4278b3fef3b71d221f9cd017bd29e', '                                                aaa                                        ', '222.00', '');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` int(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `join_date`, `admin`, `active`) VALUES
(9, 'Amr', 'Alazazi', 'alazaziamr@gmail.com', 'amro', 'b27a0b59d0a608014fbfbb6fded0de68', '2017-07-27 09:19:46', 1, 1),
(10, 'Ali', 'Alazazi', 'ali@gmail.com', 'ali', 'b27a0b59d0a608014fbfbb6fded0de68', '2017-07-27 09:29:43', 0, 1);

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `PID` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `UID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
