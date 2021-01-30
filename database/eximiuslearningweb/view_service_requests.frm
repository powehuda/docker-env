TYPE=VIEW
query=select `sr`.`id` AS `id`,`sr`.`member_id` AS `member_id`,`sr`.`name` AS `name`,`sr`.`email` AS `email`,`sr`.`phone` AS `phone`,`sr`.`company` AS `company`,`sr`.`position` AS `position`,`sr`.`company_phone` AS `company_phone`,`sr`.`company_fax` AS `company_fax`,`sr`.`company_address` AS `company_address`,`sr`.`company_city` AS `company_city`,`sr`.`company_zipcode` AS `company_zipcode`,`sr`.`service_id` AS `service_id`,`s`.`title` AS `title`,`sr`.`service_modules` AS `service_modules`,`sr`.`service_type` AS `service_type`,`sr`.`service_option` AS `service_option`,`sr`.`meeting_date` AS `meeting_date`,`sr`.`meeting_location` AS `meeting_location`,`sr`.`note` AS `note`,`sr`.`status` AS `status`,`sr`.`created_at` AS `created_at`,`sr`.`last_update` AS `last_update` from (`eximiuslearningweb`.`service_requests` `sr` left join `eximiuslearningweb`.`services` `s` on(`s`.`id` = `sr`.`service_id`))
md5=34ffc2ba29d5feecf6b2ab51b3949df5
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2020-07-09 09:38:37
create-version=2
source=select `sr`.`id` AS `id`,`sr`.`member_id` AS `member_id`,`sr`.`name` AS `name`,`sr`.`email` AS `email`,`sr`.`phone` AS `phone`,`sr`.`company` AS `company`,`sr`.`position` AS `position`,`sr`.`company_phone` AS `company_phone`,`sr`.`company_fax` AS `company_fax`,`sr`.`company_address` AS `company_address`,`sr`.`company_city` AS `company_city`,`sr`.`company_zipcode` AS `company_zipcode`,`sr`.`service_id` AS `service_id`,`s`.`title` AS `title`,`sr`.`service_modules` AS `service_modules`,`sr`.`service_type` AS `service_type`,`sr`.`service_option` AS `service_option`,`sr`.`meeting_date` AS `meeting_date`,`sr`.`meeting_location` AS `meeting_location`,`sr`.`note` AS `note`,`sr`.`status` AS `status`,`sr`.`created_at` AS `created_at`,`sr`.`last_update` AS `last_update` from (`service_requests` `sr` left join `services` `s` on((`s`.`id` = `sr`.`service_id`)))
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `sr`.`id` AS `id`,`sr`.`member_id` AS `member_id`,`sr`.`name` AS `name`,`sr`.`email` AS `email`,`sr`.`phone` AS `phone`,`sr`.`company` AS `company`,`sr`.`position` AS `position`,`sr`.`company_phone` AS `company_phone`,`sr`.`company_fax` AS `company_fax`,`sr`.`company_address` AS `company_address`,`sr`.`company_city` AS `company_city`,`sr`.`company_zipcode` AS `company_zipcode`,`sr`.`service_id` AS `service_id`,`s`.`title` AS `title`,`sr`.`service_modules` AS `service_modules`,`sr`.`service_type` AS `service_type`,`sr`.`service_option` AS `service_option`,`sr`.`meeting_date` AS `meeting_date`,`sr`.`meeting_location` AS `meeting_location`,`sr`.`note` AS `note`,`sr`.`status` AS `status`,`sr`.`created_at` AS `created_at`,`sr`.`last_update` AS `last_update` from (`eximiuslearningweb`.`service_requests` `sr` left join `eximiuslearningweb`.`services` `s` on(`s`.`id` = `sr`.`service_id`))
mariadb-version=100504
