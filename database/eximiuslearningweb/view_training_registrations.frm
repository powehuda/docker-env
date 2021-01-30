TYPE=VIEW
query=select `r`.`id` AS `id`,`r`.`status` AS `status`,`r`.`created_at` AS `created_at`,`r`.`member_id` AS `member_id`,`m`.`name` AS `name`,`m`.`phone` AS `phone`,`m`.`email` AS `email`,`m`.`company` AS `company`,`m`.`position` AS `position`,`s`.`title` AS `training_title`,`s`.`training_type` AS `training_type`,`sc`.`schedule_date` AS `schedule_date` from (((`eximiuslearningweb`.`training_registrations` `r` left join `eximiuslearningweb`.`members` `m` on(`m`.`id` = `r`.`member_id`)) left join `eximiuslearningweb`.`trainings` `s` on(`s`.`id` = `r`.`training_id`)) left join `eximiuslearningweb`.`training_schedules` `sc` on(`sc`.`id` = `r`.`schedule_id`))
md5=f7eb4856829f1a158fb6e4e4902fe068
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2020-07-09 09:38:37
create-version=2
source=select `r`.`id` AS `id`,`r`.`status` AS `status`,`r`.`created_at` AS `created_at`,`r`.`member_id` AS `member_id`,`m`.`name` AS `name`,`m`.`phone` AS `phone`,`m`.`email` AS `email`,`m`.`company` AS `company`,`m`.`position` AS `position`,`s`.`title` AS `training_title`,`s`.`training_type` AS `training_type`,`sc`.`schedule_date` AS `schedule_date` from (((`training_registrations` `r` left join `members` `m` on((`m`.`id` = `r`.`member_id`))) left join `trainings` `s` on((`s`.`id` = `r`.`training_id`))) left join `training_schedules` `sc` on((`sc`.`id` = `r`.`schedule_id`)))
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `r`.`id` AS `id`,`r`.`status` AS `status`,`r`.`created_at` AS `created_at`,`r`.`member_id` AS `member_id`,`m`.`name` AS `name`,`m`.`phone` AS `phone`,`m`.`email` AS `email`,`m`.`company` AS `company`,`m`.`position` AS `position`,`s`.`title` AS `training_title`,`s`.`training_type` AS `training_type`,`sc`.`schedule_date` AS `schedule_date` from (((`eximiuslearningweb`.`training_registrations` `r` left join `eximiuslearningweb`.`members` `m` on(`m`.`id` = `r`.`member_id`)) left join `eximiuslearningweb`.`trainings` `s` on(`s`.`id` = `r`.`training_id`)) left join `eximiuslearningweb`.`training_schedules` `sc` on(`sc`.`id` = `r`.`schedule_id`))
mariadb-version=100504
