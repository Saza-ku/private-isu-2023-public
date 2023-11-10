/* SELECT table_name, engine, table_rows, avg_row_length, floor((data_length+index_length)/1024/1024) as allMB, floor((data_length)/1024/1024) as dMB, floor((index_length)/1024/1024) as iMB FROM information_schema.tables WHERE table_schema=database() ORDER BY (data_length+index_length) DESC; 
*/
/*
ALTER TABLE `comments` ADD INDEX `comments_post_id_index` (`post_id` ASC, `created_at` DESC);
*/
/*
ALTER TABLE `posts` ADD INDEX `posts_created_at_index` (`created_at` DESC);
*/

/*
CREATE TABLE IF NOT EXISTS `posts_without_imgdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `mime` varchar(64) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_without_imgdata_created_at_index` (`created_at` DESC)
);
*/

/*
INSERT INTO `posts_without_imgdata` (`id`, `user_id`, `mime`, `body`, `created_at`)
  SELECT `id`, `user_id`, `mime`, `body`, `created_at` FROM `posts`;
*/

/*
CREATE TABLE IF NOT EXISTS `not_banned_posts_without_imgdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `mime` varchar(64) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_without_imgdata_created_at_index` (`created_at` DESC)
);
*/

/*
ALTER TABLE `comments` ADD INDEX `comments_user_id_index` (`user_id` ASC);
*/
/*
ALTER TABLE `not_banned_posts_without_imgdata` ADD INDEX `not_banned_posts_user_id_created_at_index` (`user_id`, `created_at` DESC);
/*
