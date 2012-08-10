-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2012 at 12:28 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'ALL', 1, 188),
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
(94, 75, NULL, NULL, 'Users::view', 185, 186);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'Admin', 1, 8),
(2, NULL, NULL, NULL, 'Anonymous', 9, 42),
(3, 2, NULL, NULL, 'Student', 10, 27),
(4, 2, NULL, NULL, 'Teacher', 28, 29),
(5, 2, NULL, NULL, 'Employee', 30, 41),
(6, 1, NULL, 1, 'User::1', 2, 3),
(7, 3, NULL, 2, 'User::2', 11, 12),
(8, 3, NULL, 3, 'User::3', 13, 14),
(9, 3, NULL, 4, 'User::4', 15, 16),
(10, 1, NULL, 5, 'User::5', 4, 5),
(11, 5, NULL, 6, 'User::6', 33, 34),
(12, 5, NULL, 7, 'User::7', 35, 36),
(13, 1, NULL, 8, 'User::8', 6, 7),
(14, 5, NULL, 9, 'User::9', 37, 38),
(15, 3, NULL, 10, 'User::10', 17, 18),
(16, 3, NULL, 11, 'User::11', 19, 20),
(17, 3, NULL, 12, 'User::12', 21, 22),
(18, 3, NULL, 13, 'User::13', 23, 24),
(19, 5, NULL, 14, 'User::14', 39, 40),
(20, 3, NULL, 15, 'User::15', 25, 26);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

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
(12, 3, 12, '1', '1', '1', '1');

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

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `tutorial_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `image_of` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `images`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `results`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tests`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `tests_users`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `test_questions`
--


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
  `mobile` int(11) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `tnt` tinyint(1) NOT NULL DEFAULT '0',
  `quiz` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `dob`, `address`, `mobile`, `pincode`, `tnt`, `quiz`, `last_ip`, `created`, `modified`) VALUES
(1, 'admin', '8b86551f7cd3f9d2225a43934ec491934c49199e', 'admin@otts.com', 'Vishal', 'genx', '1983-05-27 00:00:00', '275/5\r\nSbi Colony\r\nJabalpur', 2147483647, 482002, 0, 0, NULL, '2012-05-26 10:56:19', '2012-05-27 17:01:16');
