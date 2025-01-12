-- Database: `wordpress_db`

CREATE DATABASE IF NOT EXISTS `wordpress_db`;
USE `wordpress_db`;

-- Table structure for table `wp_users`
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_nicename` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_login` (`user_login`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_users`
INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_registered`) VALUES
(1, 'admin', '$P$B7r9z8f9z8f9z8f9z8f9z8f9z8f9z8f', 'admin', 'admin@example.com', '2024-01-01 00:00:00'),
(2, 'user1', '$P$B7r9z8f9z8f9z8f9z8f9z8f9z8f9z8f', 'user1', 'user1@example.com', '2024-01-02 00:00:00');

-- Table structure for table `wp_posts`
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL,
  `post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_posts`
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_content`, `post_title`, `post_status`) VALUES
(1, 1, '2024-01-01 00:00:00', 'Welcome to WordPress!', 'Hello World!', 'publish'),
(2, 2, '2024-01-02 00:00:00', 'This is a sample post.', 'Sample Post', 'publish');

-- Table structure for table `wp_comments`
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_comments`
INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_content`, `comment_date`) VALUES
(1, 1, 'User1', 'Great post!', '2024-01-01 12:00:00'),
(2, 2, 'User2', 'Nice work!', '2024-01-02 12:00:00');

-- Table structure for table `wp_bus_routes`
CREATE TABLE IF NOT EXISTS `wp_bus_routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(255) NOT NULL,
  `start_station` varchar(255) NOT NULL,
  `end_station` varchar(255) NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_bus_routes`
INSERT INTO `wp_bus_routes` (`route_id`, `route_name`, `start_station`, `end_station`) VALUES
(1, 'Route 1', 'Station A', 'Station B'),
(2, 'Route 2', 'Station C', 'Station D');

-- Table structure for table `wp_bus_schedules`
CREATE TABLE IF NOT EXISTS `wp_bus_schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_bus_schedules`
INSERT INTO `wp_bus_schedules` (`schedule_id`, `route_id`, `departure_time`, `arrival_time`) VALUES
(1, 1, '08:00:00', '09:00:00'),
(2, 2, '10:00:00', '11:00:00');

-- Table structure for table `wp_bus_tickets`
CREATE TABLE IF NOT EXISTS `wp_bus_tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `route_id` int(11) NOT NULL,
  `purchase_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `wp_bus_tickets`
INSERT INTO `wp_bus_tickets` (`ticket_id`, `user_id`, `route_id`, `purchase_date`) VALUES
(1, 1, 1, '2024-01-01 12:00:00'),
(2, 2, 2, '2024-01-02 12:00:00');