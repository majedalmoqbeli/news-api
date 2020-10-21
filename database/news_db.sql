-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 10:54 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_news` ()  NO SQL
BEGIN

SELECT news_id, news_title, news_info, news_lat, news_lng,news_date,news_image, 
news.user_id , user.u_name , user.u_image
FROM news
INNER JOIN user ON news.user_id = user.u_id 
WHERE news_active = 1 and user.u_active = 1

ORDER BY news_id DESC
LIMIT 5;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_news_by_last_id` (IN `last_id` INT(11))  NO SQL
BEGIN

SELECT news_id, news_title, news_info, news_lat, news_lng,news_date, news_image,
news.user_id , user.u_name , user.u_image
FROM news
INNER JOIN user ON news.user_id = user.u_id 
WHERE news_active = 1 and user.u_active = 1
and news_id < last_id 
ORDER BY news_id DESC
LIMIT 5;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_info` text NOT NULL,
  `news_lat` double NOT NULL,
  `news_lng` double NOT NULL,
  `news_date` varchar(255) NOT NULL,
  `news_image` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `news_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_info`, `news_lat`, `news_lng`, `news_date`, `news_image`, `user_id`, `news_active`) VALUES
(1, 'This is title well change  ', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish ', 15.307469, 44.185884, '2020-03-29T22:58:29+00:00', '345434535443.jpg', 2, 1),
(2, 'This is title well change', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish ', 15.30766, 44.189774, '2020-03-29T22:58:29+00:00', '34545645534345.jpg', 1, 1),
(3, 'This is title well change', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish ', 15.306947, 44.189346, '2020-03-29T22:58:29+00:00', '23345354443543.jpg', 2, 1),
(4, 'This is title well change with tilte', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish ', 0, 0, '2020-03-29T22:58:29+00:00', '2324545434556656445.jpg', 1, 1),
(5, 'Any title for testing', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish', 15.305584, 44.186357, '2020-04-04T22:58:29+00:00', '34545645534345.jpg', 1, 1),
(6, 'Any title for testing', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish', 15.301123, 44.186432, '2020-05-05T22:58:29+00:00', NULL, 1, 1),
(7, 'Any title for testing', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish', 16.301123, 44.186432, '2020-05-05T22:58:29+00:00', '23345354443543.jpg', 2, 1),
(8, 'Any title for testing', 'This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish This is title well change with the real news after publish', 17.301123, 44.186432, '2020-10-21T19:33:21+00:00', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_image` varchar(255) NOT NULL,
  `u_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_image`, `u_active`) VALUES
(1, 'Majed Al-Moqbeli', '8987538490938539.jpg', 1),
(2, 'Jon Cozart', '23455667456456740.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
