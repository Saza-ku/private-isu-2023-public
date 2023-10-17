/* SELECT table_name, engine, table_rows, avg_row_length, floor((data_length+index_length)/1024/1024) as allMB, floor((data_length)/1024/1024) as dMB, floor((index_length)/1024/1024) as iMB FROM information_schema.tables WHERE table_schema=database() ORDER BY (data_length+index_length) DESC; 
*/

/*ALTER TABLE `comments` ADD INDEX `comments_post_id_index` (`post_id` ASC, `created_at` DESC);
*/

/*LTER TABLE `posts` ADD INDEX `posts_created_at_index` (`created_at` DESC);
*/

CREATE VIEW `not_banned_posts` AS
SELECT posts.id, posts.user_id, posts.mime, posts.imgdata, posts.body, posts.created_at FROM
`posts` JOIN `users` ON `posts`.`user_id` = `users`.`id`
WHERE `users`.`del_flg` = 0;
