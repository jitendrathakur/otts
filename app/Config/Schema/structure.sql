-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 22, 2012 at 04:47 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `otts`
--

-- --------------------------------------------------------

--
-- Table structure for table `acos`
--

CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'ALL', 1, 200),
(2, 1, NULL, NULL, 'Acm', 2, 3),
(3, 1, NULL, NULL, 'Boards', 4, 23),
(4, 3, NULL, NULL, 'Boards::add', 5, 6),
(5, 3, NULL, NULL, 'Boards::admin_add', 7, 8),
(6, 3, NULL, NULL, 'Boards::admin_delete', 9, 10),
(7, 3, NULL, NULL, 'Boards::admin_edit', 11, 12),
(8, 3, NULL, NULL, 'Boards::admin_index', 13, 14),
(9, 3, NULL, NULL, 'Boards::admin_view', 15, 16),
(10, 3, NULL, NULL, 'Boards::delete', 17, 18),
(11, 3, NULL, NULL, 'Boards::edit', 19, 20),
(12, 3, NULL, NULL, 'Boards::student_index', 21, 22),
(13, 1, NULL, NULL, 'Candidates', 24, 33),
(14, 13, NULL, NULL, 'Candidates::add', 25, 26),
(15, 13, NULL, NULL, 'Candidates::delete', 27, 28),
(16, 13, NULL, NULL, 'Candidates::edit', 29, 30),
(17, 13, NULL, NULL, 'Candidates::view', 31, 32),
(18, 1, NULL, NULL, 'Courses', 34, 53),
(19, 18, NULL, NULL, 'Courses::add', 35, 36),
(20, 18, NULL, NULL, 'Courses::admin_add', 37, 38),
(21, 18, NULL, NULL, 'Courses::admin_delete', 39, 40),
(22, 18, NULL, NULL, 'Courses::admin_edit', 41, 42),
(23, 18, NULL, NULL, 'Courses::admin_index', 43, 44),
(24, 18, NULL, NULL, 'Courses::admin_view', 45, 46),
(25, 18, NULL, NULL, 'Courses::delete', 47, 48),
(26, 18, NULL, NULL, 'Courses::edit', 49, 50),
(27, 18, NULL, NULL, 'Courses::view', 51, 52),
(28, 1, NULL, NULL, 'Images', 54, 59),
(29, 28, NULL, NULL, 'Images::add', 55, 56),
(30, 28, NULL, NULL, 'Images::edit', 57, 58),
(31, 1, NULL, NULL, 'Pages', 60, 63),
(32, 31, NULL, NULL, 'Pages::display', 61, 62),
(33, 1, NULL, NULL, 'Questions', 64, 77),
(34, 33, NULL, NULL, 'Questions::admin_add', 65, 66),
(35, 33, NULL, NULL, 'Questions::admin_delete', 67, 68),
(36, 33, NULL, NULL, 'Questions::admin_edit', 69, 70),
(37, 33, NULL, NULL, 'Questions::admin_edit_question_image', 71, 72),
(38, 33, NULL, NULL, 'Questions::admin_index', 73, 74),
(39, 33, NULL, NULL, 'Questions::admin_view', 75, 76),
(40, 1, NULL, NULL, 'Subjects', 78, 89),
(41, 40, NULL, NULL, 'Subjects::admin_add', 79, 80),
(42, 40, NULL, NULL, 'Subjects::admin_delete', 81, 82),
(43, 40, NULL, NULL, 'Subjects::admin_edit', 83, 84),
(44, 40, NULL, NULL, 'Subjects::admin_index', 85, 86),
(45, 40, NULL, NULL, 'Subjects::admin_view', 87, 88),
(46, 1, NULL, NULL, 'TestQuestions', 90, 99),
(47, 46, NULL, NULL, 'TestQuestions::add', 91, 92),
(48, 46, NULL, NULL, 'TestQuestions::delete', 93, 94),
(49, 46, NULL, NULL, 'TestQuestions::edit', 95, 96),
(50, 46, NULL, NULL, 'TestQuestions::view', 97, 98),
(51, 1, NULL, NULL, 'Tests', 100, 129),
(52, 51, NULL, NULL, 'Tests::admin_add', 101, 102),
(53, 51, NULL, NULL, 'Tests::admin_delete', 103, 104),
(54, 51, NULL, NULL, 'Tests::admin_index', 105, 106),
(55, 51, NULL, NULL, 'Tests::auto_review', 107, 108),
(56, 51, NULL, NULL, 'Tests::get_last_question', 109, 110),
(57, 51, NULL, NULL, 'Tests::question', 111, 112),
(58, 51, NULL, NULL, 'Tests::review', 113, 114),
(59, 51, NULL, NULL, 'Tests::student_index', 115, 116),
(60, 51, NULL, NULL, 'Tests::student_quiz', 117, 118),
(61, 51, NULL, NULL, 'Tests::student_result', 119, 120),
(62, 51, NULL, NULL, 'Tests::student_test', 121, 122),
(63, 51, NULL, NULL, 'Tests::take_test', 123, 124),
(64, 51, NULL, NULL, 'Tests::view', 125, 126),
(65, 51, NULL, NULL, 'Tests::view_score', 127, 128),
(66, 1, NULL, NULL, 'Tutorials', 130, 147),
(67, 66, NULL, NULL, 'Tutorials::admin_add', 131, 132),
(68, 66, NULL, NULL, 'Tutorials::admin_delete', 133, 134),
(69, 66, NULL, NULL, 'Tutorials::admin_edit', 135, 136),
(70, 66, NULL, NULL, 'Tutorials::admin_edit_tutorial_image', 137, 138),
(71, 66, NULL, NULL, 'Tutorials::admin_index', 139, 140),
(72, 66, NULL, NULL, 'Tutorials::admin_view', 141, 142),
(73, 66, NULL, NULL, 'Tutorials::student_index', 143, 144),
(74, 66, NULL, NULL, 'Tutorials::student_view', 145, 146),
(75, 1, NULL, NULL, 'Users', 148, 187),
(76, 75, NULL, NULL, 'Users::account', 149, 150),
(77, 75, NULL, NULL, 'Users::admin_add', 151, 152),
(78, 75, NULL, NULL, 'Users::admin_approve_student', 153, 154),
(79, 75, NULL, NULL, 'Users::admin_delete', 155, 156),
(80, 75, NULL, NULL, 'Users::admin_edit', 157, 158),
(81, 75, NULL, NULL, 'Users::admin_employee', 159, 160),
(82, 75, NULL, NULL, 'Users::admin_employee_add', 161, 162),
(83, 75, NULL, NULL, 'Users::admin_index', 163, 164),
(84, 75, NULL, NULL, 'Users::admin_student', 165, 166),
(85, 75, NULL, NULL, 'Users::admin_student_edit', 167, 168),
(86, 75, NULL, NULL, 'Users::admin_student_view', 169, 170),
(87, 75, NULL, NULL, 'Users::admin_view', 171, 172),
(88, 75, NULL, NULL, 'Users::edit', 173, 174),
(89, 75, NULL, NULL, 'Users::login', 175, 176),
(90, 75, NULL, NULL, 'Users::logout', 177, 178),
(91, 75, NULL, NULL, 'Users::profile', 179, 180),
(92, 75, NULL, NULL, 'Users::signup', 181, 182),
(93, 75, NULL, NULL, 'Users::student_home', 183, 184),
(94, 75, NULL, NULL, 'Users::view', 185, 186),
(95, 1, NULL, NULL, 'Advertises', 188, 199),
(96, 95, NULL, NULL, 'Advertises::admin_add', 189, 190),
(97, 95, NULL, NULL, 'Advertises::admin_delete', 191, 192),
(98, 95, NULL, NULL, 'Advertises::admin_edit', 193, 194),
(99, 95, NULL, NULL, 'Advertises::admin_edit_Advertise_image', 195, 196),
(100, 95, NULL, NULL, 'Advertises::admin_index', 197, 198);

-- --------------------------------------------------------

--
-- Table structure for table `advertises`
--

CREATE TABLE IF NOT EXISTS `advertises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `advertises`
--

INSERT INTO `advertises` (`id`, `link`, `created`, `modified`) VALUES
(5, 'hello', '2012-07-21 15:38:49', '2012-07-21 15:38:49'),
(6, 'gfdgf', '2012-07-21 15:47:21', '2012-07-21 15:47:21'),
(7, 'hjkhkhhk', '2012-07-21 15:47:52', '2012-07-21 15:47:52'),
(8, 'knknn', '2012-07-21 15:48:14', '2012-07-21 15:48:14'),
(9, 'http://jitendrathakur.com', '2012-07-22 09:15:30', '2012-07-22 09:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `aros`
--

CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'Admin', 1, 8),
(2, NULL, NULL, NULL, 'Anonymous', 9, 56),
(3, 2, NULL, NULL, 'Student', 10, 41),
(4, 2, NULL, NULL, 'Teacher', 42, 43),
(5, 2, NULL, NULL, 'Employee', 44, 55),
(6, 1, NULL, 1, 'User::1', 2, 3),
(7, 3, NULL, 2, 'User::2', 11, 12),
(8, 3, NULL, 3, 'User::3', 13, 14),
(9, 3, NULL, 4, 'User::4', 15, 16),
(10, 1, NULL, 5, 'User::5', 4, 5),
(11, 5, NULL, 6, 'User::6', 47, 48),
(12, 5, NULL, 7, 'User::7', 49, 50),
(13, 1, NULL, 8, 'User::8', 6, 7),
(14, 5, NULL, 9, 'User::9', 51, 52),
(15, 3, NULL, 10, 'User::10', 17, 18),
(16, 3, NULL, 11, 'User::11', 19, 20),
(17, 3, NULL, 12, 'User::12', 21, 22),
(18, 3, NULL, 13, 'User::13', 23, 24),
(19, 5, NULL, 14, 'User::14', 53, 54),
(20, 3, NULL, 15, 'User::15', 25, 26),
(21, 3, NULL, 16, 'User::16', 27, 28),
(22, 3, NULL, 17, 'User::17', 29, 30),
(23, 3, NULL, 18, 'User::18', 31, 32),
(24, 3, NULL, 19, 'User::19', 33, 34),
(25, 3, NULL, 20, 'User::20', 35, 36),
(26, 3, NULL, 21, 'User::21', 37, 38),
(27, 3, NULL, 22, 'User::22', 39, 40);

-- --------------------------------------------------------

--
-- Table structure for table `aros_acos`
--

CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(1, 1, 1, '1', '1', '1', '1'),
(2, 2, 92, '1', '1', '1', '1'),
(3, 2, 89, '1', '1', '1', '1'),
(4, 3, 90, '1', '1', '1', '1'),
(5, 3, 93, '1', '1', '1', '1'),
(6, 3, 74, '1', '1', '1', '1'),
(7, 3, 73, '1', '1', '1', '1'),
(8, 3, 62, '1', '1', '1', '1'),
(9, 3, 61, '1', '1', '1', '1'),
(10, 3, 60, '1', '1', '1', '1'),
(11, 3, 59, '1', '1', '1', '1'),
(12, 3, 12, '1', '1', '1', '1'),
(13, 3, 76, '1', '1', '1', '1'),
(14, 3, 91, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE IF NOT EXISTS `boards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Maharashtra', '2012-05-06 14:02:57', '2012-05-14 22:11:27'),
(2, 'test', '2012-05-14 18:53:13', '2012-05-14 19:29:26'),
(3, 'Punjab', '2012-05-15 21:37:52', '2012-05-15 21:53:39'),
(4, 'Quiz', '2012-06-30 22:44:19', '2012-06-30 22:44:19'),
(5, 'jitz_test', '2012-07-01 16:12:22', '2012-07-01 16:12:22'),
(6, 'MP', '2012-07-01 19:47:23', '2012-07-01 19:47:34'),
(8, 'Maharashtra ', '2012-07-02 13:42:37', '2012-07-02 13:42:37'),
(9, 'kerala', '2012-07-02 13:50:42', '2012-07-02 13:50:42'),
(10, 'Gujrat', '2012-07-03 13:26:09', '2012-07-03 13:26:28'),
(11, 'Himachal Pradesh', '2012-07-03 14:57:11', '2012-07-03 14:57:26'),
(12, 'punjab new', '2012-07-03 15:08:10', '2012-07-03 15:08:10'),
(13, 'tamil nadu', '2012-07-03 15:09:55', '2012-07-03 15:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE IF NOT EXISTS `candidates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `experience_months` smallint(6) DEFAULT NULL,
  `experience_years` smallint(6) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `email`, `experience_months`, `experience_years`, `created`, `modified`) VALUES
(4, 'Amitabh Bachchan', 'amitabh@bachchan.com', 2, 4, '2012-01-03 11:55:28', '2012-01-03 11:55:28'),
(3, 'Amir Khan', 'amir@khan.com', 3, 5, '2012-01-03 09:38:43', '2012-01-04 16:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `board_id`, `name`, `created`, `modified`) VALUES
(1, 3, 'test', '2012-05-14 19:11:07', '2012-06-02 11:33:08'),
(2, 2, 'test', '2012-05-14 19:15:46', '2012-06-02 11:33:00'),
(3, 3, 'PET', '2012-05-14 19:30:00', '2012-06-02 11:32:51'),
(4, 1, 'BE', '2012-05-15 22:11:03', '2012-06-02 10:21:57'),
(5, 1, 'CBSC 12', '2012-06-02 10:17:23', '2012-06-02 10:17:23'),
(6, 4, 'Quiz', '2012-06-30 22:44:32', '2012-06-30 22:44:32'),
(7, 5, 'jitz_course', '2012-07-01 16:12:50', '2012-07-01 16:12:50'),
(8, 6, '12th', '2012-07-01 19:48:06', '2012-07-01 19:48:06'),
(12, 9, '12 CBSE Sci', '2012-07-02 13:51:09', '2012-07-02 13:51:09'),
(11, 8, '12 CBSE Sci', '2012-07-02 13:43:41', '2012-07-02 13:43:53'),
(24, 13, '12th sci cbse', '2012-07-03 15:10:14', '2012-07-03 15:10:14'),
(14, 11, '12 CBSE Sci', '2012-07-03 14:58:24', '2012-07-03 14:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `tutorial_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `advertise_id` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `image_of` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `filename`, `tutorial_id`, `question_id`, `advertise_id`, `pos`, `image_of`, `created`, `modified`) VALUES
(1, 'rakesh_thumb_orig_13.jpg', NULL, 52, NULL, NULL, 'option_4', '2012-05-27 14:31:27', '2012-05-27 14:31:42'),
(2, '4.jpg', NULL, 99, NULL, NULL, 'question', '2012-07-01 16:20:50', '2012-07-01 16:20:50'),
(3, 'kar48h.jpg', NULL, 99, NULL, NULL, 'option_1', '2012-07-01 16:26:07', '2012-07-01 16:26:07'),
(4, 'emraan3.jpg', NULL, 99, NULL, NULL, 'option_2', '2012-07-01 16:26:42', '2012-07-01 16:26:42'),
(5, 'LONDONBR.JPG', NULL, 99, NULL, NULL, 'option_3', '2012-07-01 16:32:33', '2012-07-01 16:32:33'),
(6, '7.jpg', NULL, 99, NULL, NULL, 'option_4', '2012-07-01 16:33:12', '2012-07-01 16:33:12'),
(7, '07Sea.jpg', NULL, 100, NULL, NULL, 'question', '2012-07-01 16:55:45', '2012-07-01 16:55:45'),
(8, 'Priyanka-Chopra24.jpg', NULL, 100, NULL, NULL, 'option_1', '2012-07-01 16:56:27', '2012-07-01 16:56:27'),
(9, 'sunidhi_chauhan-1-650x700-2008-12-15.jpg', NULL, 100, NULL, NULL, 'option_2', '2012-07-01 16:57:07', '2012-07-01 16:57:07'),
(10, 'Z1m4h5f71.jpg', NULL, 100, NULL, NULL, 'option_3', '2012-07-01 17:05:57', '2012-07-01 17:05:57'),
(11, 'Zwhly5e1.jpg', NULL, 100, NULL, NULL, 'option_4', '2012-07-01 17:06:23', '2012-07-01 17:06:23'),
(12, 'Bluehills.jpg', NULL, 101, NULL, NULL, 'question', '2012-07-01 19:50:05', '2012-07-01 19:50:05'),
(13, 'Winter_2.jpg', NULL, 101, NULL, NULL, 'option_1', '2012-07-01 19:54:40', '2012-07-01 19:54:40'),
(14, 'Winter_3.jpg', NULL, 103, NULL, NULL, 'question', '2012-07-02 13:45:37', '2012-07-02 13:45:37'),
(15, 'Waterlilies.jpg', NULL, 103, NULL, NULL, 'option_1', '2012-07-02 13:45:51', '2012-07-02 13:45:51'),
(16, 'Waterlilies_2.jpg', NULL, 103, NULL, NULL, 'option_3', '2012-07-02 13:46:21', '2012-07-02 13:46:21'),
(17, 'Bluehills_2.jpg', NULL, 103, NULL, NULL, 'option_4', '2012-07-02 13:46:31', '2012-07-02 13:46:31'),
(18, 'Sunset.jpg', NULL, 103, NULL, NULL, 'option_2', '2012-07-02 13:47:31', '2012-07-02 13:47:31'),
(19, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-02 13:47:41', '2012-07-02 13:47:41'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-03 15:12:33', '2012-07-03 15:12:33'),
(21, '70017.JPG', NULL, 105, NULL, NULL, 'question', '2012-07-14 16:38:00', '2012-07-14 16:38:00'),
(22, '75076.JPG', NULL, 105, NULL, NULL, 'option_1', '2012-07-14 16:53:50', '2012-07-14 16:53:50'),
(23, '163061.JPG', NULL, 105, NULL, NULL, 'option_2', '2012-07-14 16:57:32', '2012-07-14 16:57:32'),
(24, '268022.JPG', NULL, 105, NULL, NULL, 'option_3', '2012-07-14 16:57:52', '2012-07-14 16:57:52'),
(25, '268081.JPG', NULL, 105, NULL, NULL, 'option_4', '2012-07-14 16:58:10', '2012-07-14 16:58:10'),
(26, 'mahimera.png', NULL, NULL, NULL, NULL, 'Advertise', '2012-07-21 15:09:21', '2012-07-21 15:09:21'),
(27, 'Desert.jpg', NULL, NULL, 3, NULL, 'Advertise', '2012-07-21 15:14:01', '2012-07-21 15:14:01'),
(30, 'Koala.jpg', NULL, NULL, 6, NULL, 'Advertise', '2012-07-21 15:47:21', '2012-07-21 15:47:21'),
(29, 'Tulips.jpg', NULL, NULL, 5, NULL, 'Advertise', '2012-07-21 15:38:49', '2012-07-21 15:38:49'),
(31, 'Desert_2.jpg', NULL, NULL, 7, NULL, 'Advertise', '2012-07-21 15:47:52', '2012-07-21 15:47:52'),
(32, 'mahimera_2.png', NULL, NULL, 8, NULL, 'Advertise', '2012-07-21 15:48:14', '2012-07-21 15:48:14'),
(33, 'Jellyfish.jpg', NULL, NULL, 9, NULL, 'Advertise', '2012-07-22 09:15:30', '2012-07-22 09:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'it''s a teacher id',
  `title` text,
  `option_1` text NOT NULL,
  `option_2` text NOT NULL,
  `option_3` text NOT NULL,
  `option_4` text NOT NULL,
  `answer` text NOT NULL,
  `paid_enable` tinyint(4) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject_id`, `user_id`, `title`, `option_1`, `option_2`, `option_3`, `option_4`, `answer`, `paid_enable`, `created`, `modified`) VALUES
(52, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-18 23:07:24', '2012-05-26 15:32:21'),
(105, 16, NULL, 'Who is cricketer', 'salman', 'priyanka', 'sachin', 'manmohan', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', 0, '2012-07-14 16:37:13', '2012-07-14 16:37:13'),
(51, 12, NULL, 'test que', 'test1', 'test2', 'test3', 'test4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-18 22:27:21', '2012-05-18 22:50:52'),
(53, 13, NULL, 'this is physics', '123', '456', '789', '001', 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"0";}', 0, '2012-05-19 00:52:22', '2012-05-19 00:56:18'),
(54, 13, NULL, 'image test', 'one', 'two two', 'three', 'Four', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-19 11:17:24', '2012-05-19 11:47:58'),
(55, 13, NULL, 'physics question', 'test', 'test2', '', '', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:13:43', '2012-05-26 10:13:43'),
(56, 12, NULL, 'chemistry question', 'chem 1', 'chem2', 'chem 3', 'chem 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:15:15', '2012-05-26 10:15:15'),
(57, 12, NULL, 'chemistry question', 'chem 1', 'chem2', 'chem 3', 'chem 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:17:03', '2012-05-26 10:17:03'),
(58, 12, NULL, 'chemistry question', 'chem 1', 'chem2', 'chem 3', 'chem 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:20:31', '2012-05-26 10:20:31'),
(59, 12, NULL, 'chemistry question', 'chem 1', 'chem2', 'chem 3', 'chem 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:21:15', '2012-05-26 10:21:15'),
(60, 12, NULL, 'chemistry question', 'chem 1', 'chem2', 'chem 3', 'chem 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 10:22:55', '2012-05-26 10:22:55'),
(61, 13, NULL, 'physics image upload test', 'some option', 'option 2', 'three ', 'ofur', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 11:01:47', '2012-05-26 11:01:47'),
(62, 13, NULL, 'physics image upload test', 'some option', 'option 2', 'three ', 'ofur', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 11:16:47', '2012-05-26 11:16:47'),
(63, 13, NULL, 'physics image upload test', 'some option', 'option 2', 'three ', 'ofur', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 11:17:07', '2012-05-26 11:17:07'),
(64, 13, NULL, 'physics image upload test', 'some option', 'option 2', 'three ', 'ofur', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 11:59:38', '2012-05-26 11:59:38'),
(65, 13, NULL, 'physics image upload test', 'some option', 'option 2', 'three ', 'ofur', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 12:03:10', '2012-05-26 12:03:10'),
(66, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 12:04:04', '2012-05-26 12:04:04'),
(67, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 12:08:28', '2012-05-26 12:08:28'),
(68, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 13:11:56', '2012-05-26 13:11:56'),
(69, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 13:53:14', '2012-05-26 13:53:14'),
(70, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 13:53:55', '2012-05-26 13:53:55'),
(71, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 13:57:42', '2012-05-26 13:57:42'),
(72, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 13:58:50', '2012-05-26 13:58:50'),
(73, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 13:59:44', '2012-05-26 13:59:44'),
(74, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:04:43', '2012-05-26 14:04:43'),
(75, 12, NULL, 'test que', 'test1', 'test2', 'test3', 'test4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:04:57', '2012-05-26 14:04:57'),
(76, 12, NULL, 'test que', 'test1', 'test2', 'test3', 'test4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:08:13', '2012-05-26 14:08:13'),
(77, 12, NULL, 'test que', 'test1', 'test2', 'test3', 'test4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:12:26', '2012-05-26 14:12:26'),
(78, 13, NULL, 'test', 'option 1', 'option 2', 'there', 'dfou', 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:22:55', '2012-05-26 14:22:55'),
(79, 11, NULL, 'asdfa', 'sd', 'adf', 'adf', 'asdf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:24:11', '2012-05-26 14:24:11'),
(80, 11, NULL, 'asdfa', 'sd', 'adf', 'adf', 'asdf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:25:32', '2012-05-26 14:25:32'),
(81, 11, NULL, 'asdfa', 'sd', 'adf', 'adf', 'asdf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:25:50', '2012-05-26 14:25:50'),
(82, 11, NULL, 'asdfa', 'sd', 'adf', 'adf', 'asdf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:26:17', '2012-05-26 14:26:17'),
(83, 12, NULL, 'asdf', 'asdf', 'adsf', 'asdf', 'adf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:26:52', '2012-05-26 14:26:52'),
(84, 12, NULL, 'adsf', 'asdf', 'adsf', 'asdfa', 'sdf', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:27:25', '2012-05-26 14:27:25'),
(85, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:29:48', '2012-05-26 14:29:48'),
(86, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:30:27', '2012-05-26 14:30:27'),
(87, 13, NULL, 'hj', 'ghghjh', 'vhv', 'hvh', 'vhv', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-26 14:30:40', '2012-05-26 14:30:40'),
(88, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:31:25', '2012-05-26 14:31:25'),
(89, 13, NULL, 'this is physics', '123', '456', '789', '001', 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"0";}', 0, '2012-05-26 14:33:33', '2012-05-26 14:33:33'),
(90, 13, NULL, 'this is physics', '123', '456', '789', '001', 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"0";}', 0, '2012-05-26 14:35:01', '2012-05-26 14:35:01'),
(91, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:39:25', '2012-05-26 14:39:25'),
(92, 13, NULL, 'This is some physics question', 'First thing first', 'Second thing after first', 'And now third', 'And finally the fourth', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 14:40:44', '2012-05-26 14:40:44'),
(93, 11, NULL, 'test', 'some option', 'test', 'test', 'test', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 15:37:25', '2012-05-26 15:37:25'),
(94, 14, NULL, 'bio test', 'opt 1', 'opt 2', 'opt 3', 'opt 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-26 23:51:30', '2012-05-26 23:51:30'),
(95, 15, NULL, 'mechanical', 'm1', 'm2', 'm3', 'm4', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-05-27 00:01:45', '2012-05-27 00:01:45'),
(96, 15, NULL, 'test', 'test', 'test', 'test', 'test', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-05-27 00:09:19', '2012-05-27 00:09:19'),
(97, 15, NULL, 'this is test que', 'hghghg', '1223', '', '545454', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-06-02 12:37:48', '2012-06-02 12:37:48'),
(98, 16, NULL, 'This is 1st question for quiz', 'quiz1', 'quiz2', 'quiz3', 'quiz4', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-06-30 22:46:21', '2012-06-30 22:46:21'),
(99, 17, NULL, 'who is jitendra', 'ye h', 'kya ye h', 'ye h kya', 'ye to h na', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-07-01 16:15:36', '2012-07-01 16:15:36'),
(100, 17, NULL, 'who is hot', 'lady 1', 'lady 2', 'lady 3', 'lady 4', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', 0, '2012-07-01 16:46:07', '2012-07-01 16:46:07'),
(101, 18, NULL, 'what is nh3', 'amonia', 'sulpher', 'corben', 'oxigon', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-07-01 19:49:34', '2012-07-01 19:49:34'),
(102, 18, NULL, 'what is chem', 'tet1', 'test2', 'test3', 'test4', 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-07-01 19:56:19', '2012-07-01 19:56:19'),
(103, 19, NULL, 'what is iopac name of iodine?', 'abc', 'xyz', 'pqr', 'ans', 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', 0, '2012-07-02 13:45:15', '2012-07-02 13:47:41'),
(104, 24, NULL, 'd/dx x2', '2x', '3x', '4x', 'x', 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', 0, '2012-07-03 15:12:24', '2012-07-03 15:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `test_id`, `score`, `created`, `modified`) VALUES
(1, 3, 5, 3, '2012-06-10 18:23:15', '2012-06-10 18:23:15'),
(2, 3, 3, 0, '2012-06-16 10:47:10', '2012-06-16 10:47:10'),
(3, 12, 7, 1, '2012-07-01 17:45:41', '2012-07-01 17:45:41'),
(4, 13, 8, 1, '2012-07-01 20:05:49', '2012-07-01 20:05:49'),
(5, 13, 6, 0, '2012-07-01 20:10:12', '2012-07-01 20:10:12'),
(6, 12, 10, 0, '2012-07-14 15:23:17', '2012-07-14 15:23:17'),
(7, 12, 11, 1, '2012-07-14 17:22:55', '2012-07-14 17:22:55'),
(8, 12, 11, 1, '2012-07-15 12:47:47', '2012-07-15 12:47:47'),
(9, 12, 11, 0, '2012-07-15 14:18:32', '2012-07-15 14:18:32'),
(10, 12, 11, 0, '2012-07-15 14:35:14', '2012-07-15 14:35:14'),
(11, 12, 11, 0, '2012-07-16 17:24:18', '2012-07-16 17:24:18'),
(12, 12, 11, 0, '2012-07-16 17:25:28', '2012-07-16 17:25:28'),
(13, 15, 11, 0, '2012-07-16 17:31:28', '2012-07-16 17:31:28'),
(14, 15, 11, 0, '2012-07-16 17:32:00', '2012-07-16 17:32:00'),
(15, 15, 11, 0, '2012-07-16 17:35:22', '2012-07-16 17:35:22'),
(16, 15, 11, 0, '2012-07-16 17:35:51', '2012-07-16 17:35:51'),
(17, 15, 11, 0, '2012-07-16 17:49:58', '2012-07-16 17:49:58'),
(18, 12, 11, 0, '2012-07-17 16:45:19', '2012-07-17 16:45:19'),
(19, 15, 11, 0, '2012-07-17 16:55:14', '2012-07-17 16:55:14'),
(20, 12, 11, 0, '2012-07-17 16:56:53', '2012-07-17 16:56:53'),
(21, 15, 11, 0, '2012-07-17 17:00:26', '2012-07-17 17:00:26'),
(22, 15, 11, 0, '2012-07-17 17:04:21', '2012-07-17 17:04:21'),
(23, 15, 11, 0, '2012-07-17 17:11:53', '2012-07-17 17:11:53'),
(24, 15, 11, 0, '2012-07-17 17:40:53', '2012-07-17 17:40:53'),
(25, 12, 11, 0, '2012-07-22 09:25:42', '2012-07-22 09:25:42'),
(26, 12, 11, 0, '2012-07-22 10:10:58', '2012-07-22 10:10:58'),
(27, 12, 11, 0, '2012-07-22 10:12:00', '2012-07-22 10:12:00'),
(28, 12, 11, 0, '2012-07-22 10:15:32', '2012-07-22 10:15:32'),
(29, 12, 11, 0, '2012-07-22 10:16:12', '2012-07-22 10:16:12'),
(30, 12, 11, 0, '2012-07-22 10:17:14', '2012-07-22 10:17:14'),
(31, 12, 11, 0, '2012-07-22 10:19:05', '2012-07-22 10:19:05'),
(32, 3, 11, 0, '2012-08-02 03:06:30', '2012-08-02 03:06:30'),
(33, 3, 11, 0, '2012-08-02 03:13:12', '2012-08-02 03:13:12'),
(34, 22, 11, 0, '2012-08-11 10:33:29', '2012-08-11 10:33:29'),
(35, 2, 11, 0, '2012-08-29 19:21:42', '2012-08-29 19:21:42'),
(36, 3, 11, 0, '2012-08-30 16:51:56', '2012-08-30 16:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `course_id`, `created`, `modified`) VALUES
(13, 'physics', 3, '2012-05-14 22:16:27', '2012-05-18 22:58:02'),
(11, 'test', 1, '2012-05-14 19:12:05', '2012-05-14 19:12:05'),
(12, 'chemistry', 1, '2012-05-14 19:31:53', '2012-05-14 19:31:53'),
(14, 'bio', 3, '2012-05-14 22:23:18', '2012-05-14 22:23:18'),
(15, 'BME', 4, '2012-05-15 22:26:43', '2012-05-15 22:45:22'),
(16, 'Quiz', 6, '2012-06-30 22:45:28', '2012-06-30 22:45:37'),
(17, 'jitz_subject', 7, '2012-07-01 16:14:07', '2012-07-01 16:14:07'),
(18, 'Chemistry1', 8, '2012-07-01 19:48:49', '2012-07-01 19:48:49'),
(19, 'maths 1', 11, '2012-07-02 13:44:18', '2012-07-02 13:44:18'),
(20, 'Maths 1', 12, '2012-07-02 13:52:13', '2012-07-02 13:52:13'),
(21, 'maths 2', 12, '2012-07-02 13:52:27', '2012-07-02 13:52:27'),
(22, 'chemistry 1', 12, '2012-07-02 13:52:42', '2012-07-02 13:52:42'),
(23, 'chemsitry 2', 12, '2012-07-02 13:53:05', '2012-07-02 13:53:05'),
(24, 'maths 1', 8, '2012-07-03 13:27:19', '2012-07-10 19:11:16'),
(25, 'maths 2', 8, '2012-07-03 13:27:34', '2012-07-10 19:11:53'),
(26, 'phy 1', 11, '2012-07-03 13:27:48', '2012-07-10 19:12:09'),
(27, 'Maths1', 14, '2012-07-03 14:58:57', '2012-07-03 14:58:57'),
(28, 'maths 2', 14, '2012-07-03 14:59:16', '2012-07-03 14:59:16'),
(29, 'chem 1', 14, '2012-07-03 15:00:42', '2012-07-03 15:00:42'),
(30, 'chem2', 14, '2012-07-03 15:00:52', '2012-07-03 15:00:52'),
(31, 'bio 1', 14, '2012-07-03 15:01:02', '2012-07-03 15:01:02'),
(32, 'bio2', 14, '2012-07-03 15:01:12', '2012-07-03 15:01:12'),
(33, 'english', 14, '2012-07-03 15:01:38', '2012-07-03 15:01:38'),
(34, 'hindi', 14, '2012-07-03 15:02:13', '2012-07-03 15:02:13'),
(35, 'organic chemistry', 14, '2012-07-03 15:03:38', '2012-07-03 15:03:38'),
(36, 'inorganic chemistry', 14, '2012-07-03 15:03:55', '2012-07-03 15:03:55'),
(37, 'maths 1', 24, '2012-07-03 15:10:38', '2012-07-03 15:10:38'),
(38, 'maths 2', 24, '2012-07-03 15:11:05', '2012-07-03 15:11:05'),
(39, 'bio 1', 24, '2012-07-03 15:11:38', '2012-07-03 15:11:38'),
(40, 'bio1', 3, '2012-07-03 15:22:19', '2012-07-03 15:22:19'),
(41, 'bio2', 3, '2012-07-03 15:22:38', '2012-07-03 15:22:38'),
(42, 'maths1', 3, '2012-07-03 15:23:58', '2012-07-03 15:23:58'),
(43, 'maths2', 3, '2012-07-03 15:24:41', '2012-07-03 15:24:41'),
(44, 'HINDI', 8, '2012-07-12 16:43:04', '2012-07-12 16:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `subjects_users`
--

CREATE TABLE IF NOT EXISTS `subjects_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `subjects_users`
--

INSERT INTO `subjects_users` (`id`, `user_id`, `subject_id`, `created`, `modified`) VALUES
(14, 3, 11, '2012-06-10 13:01:17', '2012-06-10 13:01:17'),
(13, 3, 13, '2012-06-10 13:01:17', '2012-06-10 13:01:17'),
(12, 3, 15, '2012-06-10 13:01:17', '2012-06-10 13:01:17'),
(16, 13, 18, '2012-07-01 20:03:29', '2012-07-01 20:03:29'),
(19, 12, 17, '2012-07-14 07:33:51', '2012-07-14 07:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`, `subject_id`, `code`, `created`, `modified`) VALUES
(2, 'half yearly', 13, 'PyIa', '2012-05-27 16:23:53', '2012-05-27 16:23:53'),
(3, 'final', 13, 'ntqY', '2012-05-27 16:24:49', '2012-05-27 16:24:49'),
(4, NULL, 14, 'R9mN', '2012-06-03 17:01:10', '2012-06-03 17:01:10'),
(5, 'terminal', 13, 'Uu8a', '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(11, 'Quiz', 16, 'oMGd', '2012-07-14 16:59:06', '2012-07-14 16:59:06'),
(7, 'jitz_test', 17, 'ymHn', '2012-07-01 17:07:04', '2012-07-01 17:07:04'),
(8, 'quiz 1/7/2012', 18, '9zLK', '2012-07-01 19:58:37', '2012-07-01 19:58:37'),
(9, 'quiz maker ', 13, 'GyPY', '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(12, 'Quiz', 12, 'RSov', '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(13, 'Quiz', 13, 'WWx4', '2012-08-02 03:11:53', '2012-08-02 03:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `tests_users`
--

CREATE TABLE IF NOT EXISTS `tests_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `tests_users`
--

INSERT INTO `tests_users` (`id`, `user_id`, `test_id`, `question_id`, `answer`, `created`, `modified`) VALUES
(1, 3, 5, 71, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:41:55', '2012-06-10 17:42:29'),
(2, 3, 5, 85, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:42:07', '2012-06-10 17:42:41'),
(3, 3, 5, 52, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:42:11', '2012-06-10 17:42:43'),
(4, 3, 5, 53, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', '2012-06-10 17:42:14', '2012-06-10 17:42:46'),
(5, 3, 5, 65, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', '2012-06-10 17:42:16', '2012-06-10 17:42:48'),
(6, 3, 5, 66, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:42:18', '2012-06-10 17:43:17'),
(7, 3, 5, 50, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:43:27', '2012-06-10 17:43:27'),
(8, 3, 5, 61, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:43:33', '2012-06-10 17:43:53'),
(9, 3, 5, 87, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:43:45', '2012-06-10 17:43:56'),
(10, 3, 5, 68, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:44:08', '2012-06-10 17:44:08'),
(11, 3, 5, 92, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:44:11', '2012-06-10 17:44:11'),
(12, 3, 5, 90, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:44:14', '2012-06-10 17:44:14'),
(13, 3, 5, 78, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:44:17', '2012-06-10 17:44:17'),
(14, 3, 5, 73, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:44:27', '2012-06-10 17:44:27'),
(15, 3, 5, 55, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:44:31', '2012-06-10 17:44:31'),
(16, 3, 5, 69, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:44:34', '2012-06-10 17:44:34'),
(17, 3, 5, 63, 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:44:37', '2012-06-10 17:44:37'),
(18, 3, 5, 54, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-10 17:44:41', '2012-06-10 17:49:18'),
(19, 3, 5, 70, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"1";}', '2012-06-10 17:44:52', '2012-06-10 18:15:33'),
(20, 3, 5, 91, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"1";i:4;s:1:"0";}', '2012-06-10 17:49:05', '2012-06-10 18:15:30'),
(21, 3, 3, 85, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-16 10:47:01', '2012-06-16 10:47:01'),
(22, 3, 3, 62, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-16 10:47:05', '2012-06-16 10:47:05'),
(23, 3, 3, 68, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', '2012-06-16 10:47:07', '2012-06-16 10:47:07'),
(24, 12, 7, 99, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', '2012-07-01 17:45:16', '2012-07-01 17:45:16'),
(25, 13, 8, 102, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-07-01 20:05:10', '2012-07-01 20:05:10'),
(26, 12, 11, 105, 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"1";i:4;s:1:"1";}', '2012-07-14 17:22:46', '2012-08-24 19:08:09'),
(27, 12, 11, 98, 'a:4:{i:1;s:1:"0";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-07-15 14:34:52', '2012-08-24 19:08:24'),
(28, 15, 11, 105, 'a:4:{i:1;s:1:"1";i:2;s:1:"1";i:3;s:1:"0";i:4;s:1:"0";}', '2012-07-16 17:28:10', '2012-07-17 17:47:34'),
(29, 3, 11, 105, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', '2012-08-02 03:06:25', '2012-08-30 16:51:53'),
(30, 22, 11, 105, 'a:4:{i:1;s:1:"1";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";}', '2012-08-11 10:33:23', '2012-08-11 10:33:23'),
(31, 2, 11, 105, 'a:4:{i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"1";}', '2012-08-29 19:20:50', '2012-08-29 19:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE IF NOT EXISTS `test_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned DEFAULT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `test_id`, `question_id`, `subject_id`, `created`, `modified`) VALUES
(8, 2, 68, 13, '2012-05-27 16:23:53', '2012-05-27 16:23:53'),
(7, 2, 63, 13, '2012-05-27 16:23:53', '2012-05-27 16:23:53'),
(6, 2, 69, 13, '2012-05-27 16:23:53', '2012-05-27 16:23:53'),
(5, 2, 78, 13, '2012-05-27 16:23:53', '2012-05-27 16:23:53'),
(9, 3, 85, 13, '2012-05-27 16:24:49', '2012-05-27 16:24:49'),
(10, 3, 62, 13, '2012-05-27 16:24:49', '2012-05-27 16:24:49'),
(11, 3, 68, 13, '2012-05-27 16:24:49', '2012-05-27 16:24:49'),
(12, 3, 92, 13, '2012-05-27 16:24:49', '2012-05-27 16:24:49'),
(13, 4, 94, 14, '2012-06-03 17:01:10', '2012-06-03 17:01:10'),
(14, 5, 71, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(15, 5, 85, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(16, 5, 52, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(17, 5, 53, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(18, 5, 65, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(19, 5, 66, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(20, 5, 50, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(21, 5, 61, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(22, 5, 87, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(23, 5, 68, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(24, 5, 92, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(25, 5, 90, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(26, 5, 78, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(27, 5, 73, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(28, 5, 55, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(29, 5, 69, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(30, 5, 63, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(31, 5, 54, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(32, 5, 70, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(33, 5, 91, 13, '2012-06-09 18:54:02', '2012-06-09 18:54:02'),
(34, 6, 98, 16, '2012-06-30 22:50:00', '2012-06-30 22:50:00'),
(35, 7, 99, 17, '2012-07-01 17:07:04', '2012-07-01 17:07:04'),
(36, 7, 100, 17, '2012-07-01 17:07:04', '2012-07-01 17:07:04'),
(37, 8, 102, 18, '2012-07-01 19:58:37', '2012-07-01 19:58:37'),
(38, 8, 101, 18, '2012-07-01 19:58:37', '2012-07-01 19:58:37'),
(39, 9, 86, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(40, 9, 78, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(41, 9, 71, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(42, 9, 61, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(43, 9, 50, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(44, 9, 62, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(45, 9, 74, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(46, 9, 70, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(47, 9, 89, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(48, 9, 92, 13, '2012-07-03 15:14:05', '2012-07-03 15:14:05'),
(49, 10, 98, 16, '2012-07-14 07:41:06', '2012-07-14 07:41:06'),
(50, 11, 105, 16, '2012-07-14 16:59:06', '2012-07-14 16:59:06'),
(51, 11, 98, 16, '2012-07-14 16:59:06', '2012-07-14 16:59:06'),
(52, 12, 76, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(53, 12, 56, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(54, 12, 77, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(55, 12, 83, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(56, 12, 75, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(57, 12, 57, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(58, 12, 59, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(59, 12, 51, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(60, 12, 60, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(61, 12, 58, 12, '2012-08-02 03:10:11', '2012-08-02 03:10:11'),
(62, 13, 89, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(63, 13, 71, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(64, 13, 72, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(65, 13, 87, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(66, 13, 53, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(67, 13, 78, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(68, 13, 61, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(69, 13, 65, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(70, 13, 69, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(71, 13, 91, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(72, 13, 54, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(73, 13, 74, 13, '2012-08-02 03:11:53', '2012-08-02 03:11:53'),
(74, 14, 98, 16, '2012-08-02 03:12:43', '2012-08-02 03:12:43'),
(75, 14, 105, 16, '2012-08-02 03:12:43', '2012-08-02 03:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE IF NOT EXISTS `tutorials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `image` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `subject_id`, `name`, `content`, `image`, `created`, `modified`) VALUES
(4, 15, 'chapter 2', '<span style="font-weight: bold;">what the huck</span><br><br><span style="color: rgb(51, 51, 51); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; display: inline ! important; float: none;">he nicEditors.allTextareas() function the below example replaces all 3 textareas on the page with nicEditors. NicEditors will match the size of the editor window with the size of the textarea it replaced.<br><br><br></span>', '', '2012-06-02 15:23:51', '2012-06-02 15:23:51'),
(3, 15, 'chapter 1 ', 'this is my test box<br>', '', '2012-06-02 14:51:25', '2012-06-02 14:51:25'),
(5, 11, 'Chapter 3 and bla bla title', 'This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;<div><br></div><div><img src="http://greenobles.com/data_images/priyanka-chopra/priyanka-chopra-02.jpg" alt="test test" align="right">This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;This is some tutorial and some thing else.&nbsp;<br></div><div><br></div><div>some more text. test test.</div>', '', '2012-06-10 17:43:13', '2012-06-10 18:24:48'),
(6, 18, 'organic', 'this is organic related content', '', '2012-07-01 20:11:24', '2012-07-01 20:11:24'),
(7, 13, 'odd one', 'This is a demo test ...made just for testing<br>', '', '2012-07-03 13:28:47', '2012-07-03 13:28:47'),
(8, 11, 'organic chemistry', 'compounds and semiconductor''s...<br><br><br>', '', '2012-07-03 15:13:11', '2012-07-03 15:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `address` text,
  `mobile` varchar(11) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `tnt` tinyint(1) NOT NULL DEFAULT '0',
  `quiz` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `dob`, `address`, `mobile`, `pincode`, `tnt`, `quiz`, `last_ip`, `created`, `modified`) VALUES
(1, 'admin', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'admin@otts.com', 'Vishal', 'genx', '1983-05-27 00:00:00', '275/5\r\nSbi Colony\r\nJabalpur', '2147483647', 482002, 0, 0, NULL, '2012-05-26 10:56:19', '2012-05-27 17:01:16'),
(2, 'student', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'student@otts.com', 'Narendra', 'S', '1994-05-27 00:00:00', '', '2147483647', NULL, 0, 1, NULL, '2012-05-26 12:24:34', '2012-06-09 12:47:43'),
(3, 'ritu', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'ritu@otts.com', 'Ritu', 'Dubey', '1988-05-27 00:00:00', 'hg\r\nghghgh\r\nhgfgfh\r\n`123456', '8783186350', 123456, 1, 1, NULL, '2012-05-26 22:08:01', '2012-08-02 03:08:15'),
(4, 'richa', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'richa@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2012-05-26 22:15:17', '2012-08-11 07:38:16'),
(8, 'rakesh', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'rakesh@otts.com', 'Rakesh', 'Tembhurne', '1985-05-27 00:00:00', '', '2147483647', NULL, 0, 0, NULL, '2012-05-27 14:39:06', '2012-05-27 17:17:28'),
(6, 'genx', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'genx@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2012-05-26 22:55:55', '2012-05-26 22:55:55'),
(7, 'genx1', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'genx1@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2012-05-26 22:57:05', '2012-05-26 22:57:05'),
(10, 'pooja', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'pooja@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2012-05-27 17:38:10', '2012-08-04 15:23:36'),
(12, 'jitendra', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'mail@jitendrathakur.com', 'jitendra', 'thakur', '1994-07-01 00:00:00', '', '2147483647', NULL, 1, 1, NULL, '2012-07-01 17:10:42', '2012-07-14 07:33:51'),
(13, 'nick1', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'nick@otts.com', 'nick', 'buddy', '1994-07-01 00:00:00', '', '2147483647', NULL, 0, 1, NULL, '2012-07-01 19:59:50', '2012-08-11 08:33:06'),
(14, 'vishal', '411f381725428abf414ae7be9dfd13492a3d3d7e', 'vishal@genxstudy.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2012-07-03 15:18:31', '2012-07-03 15:18:31'),
(15, 'nisha', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'nisha@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2012-07-16 17:26:22', '2012-08-11 08:33:02'),
(16, 'niljeet', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'niljeet@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2012-07-22 10:33:28', '2012-08-11 08:33:21'),
(17, 'rakesht', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'rakesh@tembhurne.com', 'Rakesh', 'Tembhurne', '1994-07-22 00:00:00', '', '80552', NULL, 0, 1, NULL, '2012-07-22 10:39:04', '2012-08-29 16:44:14'),
(18, 'kanha', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'kanha@otts.com', 'kanha', 'pogo', '1988-06-08 00:00:00', 'hi i am kanha', '8793196350', 482002, 0, 1, NULL, '2012-08-04 14:51:12', '2012-08-11 08:33:20'),
(22, 'tanya', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'tanya@otts.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2012-08-11 09:49:25', '2012-08-11 10:25:28'),
(19, 'papa', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'papa@papa.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2012-08-04 15:16:08', '2012-08-11 08:07:11'),
(20, 'mummy', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'mummy@papa.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2012-08-04 15:16:39', '2012-08-11 08:27:52'),
(21, 'preeti', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'preeti@papa.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2012-08-04 15:16:59', '2012-08-11 08:28:00');
