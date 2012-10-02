

ALTER TABLE `tests` ADD `topic_id` INT NULL AFTER `subject_id`;


2-10-2012
ALTER TABLE `questions` ADD `topic_id` INT NULL AFTER `subject_id`;



ALTER TABLE `test_questions` CHANGE `subject_id` `topic_id` INT( 10 ) UNSIGNED NULL;

ALTER TABLE `questions` ADD `mode` VARCHAR( 255 ) NULL AFTER `user_id`;