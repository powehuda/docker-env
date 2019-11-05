/*
Navicat MySQL Data Transfer

Source Server         : docker_flarepoint
Source Server Version : 50725
Source Host           : 192.168.99.100:3306
Source Database       : flarepoint

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-02-13 23:50:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `ip_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `industry_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`),
  KEY `clients_user_id_foreign` (`user_id`),
  KEY `clients_industry_id_foreign` (`industry_id`),
  CONSTRAINT `clients_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`),
  CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clients
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `source_id` int(10) unsigned NOT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_source_id_source_type_index` (`source_id`,`source_type`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for department_user
-- ----------------------------
DROP TABLE IF EXISTS `department_user`;
CREATE TABLE `department_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_user_department_id_foreign` (`department_id`),
  KEY `department_user_user_id_foreign` (`user_id`),
  CONSTRAINT `department_user_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `department_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department_user
-- ----------------------------
INSERT INTO `department_user` VALUES ('1', '1', '1', null, null);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Managment', null, '2019-02-13 16:43:26', '2019-02-13 16:43:26');
INSERT INTO `departments` VALUES ('2', 'Nerds', null, '2019-02-13 16:36:52', '2019-02-13 16:36:52');
INSERT INTO `departments` VALUES ('3', 'Genius', null, '2019-02-13 16:36:52', '2019-02-13 16:36:52');

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_client_id_foreign` (`client_id`),
  CONSTRAINT `documents_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for industries
-- ----------------------------
DROP TABLE IF EXISTS `industries`;
CREATE TABLE `industries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of industries
-- ----------------------------
INSERT INTO `industries` VALUES ('1', 'Accommodations');
INSERT INTO `industries` VALUES ('2', 'Accounting');
INSERT INTO `industries` VALUES ('3', 'Auto');
INSERT INTO `industries` VALUES ('4', 'Beauty & Cosmetics');
INSERT INTO `industries` VALUES ('5', 'Carpenter');
INSERT INTO `industries` VALUES ('6', 'Communications');
INSERT INTO `industries` VALUES ('7', 'Computer & IT');
INSERT INTO `industries` VALUES ('8', 'Construction');
INSERT INTO `industries` VALUES ('9', 'Consulting');
INSERT INTO `industries` VALUES ('10', 'Education');
INSERT INTO `industries` VALUES ('11', 'Electronics');
INSERT INTO `industries` VALUES ('12', 'Entertainment');
INSERT INTO `industries` VALUES ('13', 'Food & Beverages');
INSERT INTO `industries` VALUES ('14', 'Legal Services');
INSERT INTO `industries` VALUES ('15', 'Marketing');
INSERT INTO `industries` VALUES ('16', 'Real Estate');
INSERT INTO `industries` VALUES ('17', 'Retail');
INSERT INTO `industries` VALUES ('18', 'Sports');
INSERT INTO `industries` VALUES ('19', 'Technology');
INSERT INTO `industries` VALUES ('20', 'Tourism');
INSERT INTO `industries` VALUES ('21', 'Transportation');
INSERT INTO `industries` VALUES ('22', 'Travel');
INSERT INTO `industries` VALUES ('23', 'Utilities');
INSERT INTO `industries` VALUES ('24', 'Web Services');
INSERT INTO `industries` VALUES ('25', 'Other');

-- ----------------------------
-- Table structure for integrations
-- ----------------------------
DROP TABLE IF EXISTS `integrations`;
CREATE TABLE `integrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_secret` int(11) DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of integrations
-- ----------------------------

-- ----------------------------
-- Table structure for invoice_lines
-- ----------------------------
DROP TABLE IF EXISTS `invoice_lines`;
CREATE TABLE `invoice_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_lines_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `invoice_lines_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of invoice_lines
-- ----------------------------

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `payment_received_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_client_id_foreign` (`client_id`),
  CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of invoices
-- ----------------------------

-- ----------------------------
-- Table structure for leads
-- ----------------------------
DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_assigned_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `user_created_id` int(10) unsigned NOT NULL,
  `contact_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_user_assigned_id_foreign` (`user_assigned_id`),
  KEY `leads_client_id_foreign` (`client_id`),
  KEY `leads_user_created_id_foreign` (`user_created_id`),
  CONSTRAINT `leads_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `leads_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `leads_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of leads
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2015_06_04_124835_create_industries_table', '1');
INSERT INTO `migrations` VALUES ('4', '2015_12_28_163028_create_clients_table', '1');
INSERT INTO `migrations` VALUES ('5', '2015_12_29_150049_create_invoice_table', '1');
INSERT INTO `migrations` VALUES ('6', '2015_12_29_204031_tasks_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_01_10_204413_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_01_18_113656_create_leads_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_01_23_144854_settings', '1');
INSERT INTO `migrations` VALUES ('10', '2016_01_26_003903_documents', '1');
INSERT INTO `migrations` VALUES ('11', '2016_01_31_211926_invoice_lines_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_03_21_171847_create_department_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_03_21_172416_create_department_user_table', '1');
INSERT INTO `migrations` VALUES ('14', '2016_04_06_230504_integrations', '1');
INSERT INTO `migrations` VALUES ('15', '2016_05_21_205532_create_activity_log_table', '1');
INSERT INTO `migrations` VALUES ('16', '2016_08_26_205017_entrust_setup_tables', '1');
INSERT INTO `migrations` VALUES ('17', '2016_11_04_200855_create_notifications_table', '1');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'user-create', 'Create user', 'Permission to create user', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('2', 'user-update', 'Update user', 'Permission to update user', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('3', 'user-delete', 'Delete user', 'Permission to update delete', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('4', 'client-create', 'Create client', 'Permission to create client', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('5', 'client-update', 'Update client', 'Permission to update client', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('6', 'client-delete', 'Delete client', 'Permission to delete client', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('7', 'task-create', 'Create task', 'Permission to create task', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('8', 'task-update', 'Update task', 'Permission to update task', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('9', 'lead-create', 'Create lead', 'Permission to create lead', '2019-02-13 16:43:27', '2019-02-13 16:43:27');
INSERT INTO `permissions` VALUES ('10', 'lead-update', 'Update lead', 'Permission to update lead', '2019-02-13 16:43:27', '2019-02-13 16:43:27');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'administrator', 'Administrator', 'System Administrator', '2019-02-13 16:43:28', '2019-02-13 16:43:28');
INSERT INTO `roles` VALUES ('2', 'manager', 'Manager', 'System Manager', '2019-02-13 16:43:28', '2019-02-13 16:43:28');
INSERT INTO `roles` VALUES ('3', 'employee', 'Employee', 'Employee', '2019-02-13 16:43:28', '2019-02-13 16:43:28');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_complete_allowed` int(11) NOT NULL,
  `task_assign_allowed` int(11) NOT NULL,
  `lead_complete_allowed` int(11) NOT NULL,
  `lead_assign_allowed` int(11) NOT NULL,
  `time_change_allowed` int(11) NOT NULL,
  `comment_allowed` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', '2', '2', '2', '2', '2', '2', 'en', 'Media', null, null);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_assigned_id` int(10) unsigned NOT NULL,
  `user_created_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `deadline` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_assigned_id_foreign` (`user_assigned_id`),
  KEY `tasks_user_created_id_foreign` (`user_created_id`),
  KEY `tasks_client_id_foreign` (`client_id`),
  KEY `tasks_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `tasks_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `tasks_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `tasks_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Admin', 'admin@admin.com', '$2y$10$j6b24lsrN7heXF0LCSWvs.wLzwZL0F/blRhq3lRhl18NCA6.b4RbC', '', '0', '0', '', 'l6KxhZ1ACP6qjBzFm0DD3xf267MlQt53CHogIGYfbcQZYoEJaVgXGGD8EXTC', '2016-06-04 13:42:19', '2016-06-04 13:42:19');
INSERT INTO `users` VALUES ('7', 'Eulalia Beer', 'marcella60@yahoo.com', '$2y$10$P/8h4wIHp2kaNyrNbbMAieRo77iUL2kAU7P2WYY2dDHS1qsAqDT0a', 'Suite 437', '56649335', '56051014', null, '9x2DraXR8K', '2019-02-13 16:46:03', '2019-02-13 16:46:03');
INSERT INTO `users` VALUES ('8', 'Tomas Daugherty', 'rau.maximo@gmail.com', '$2y$10$NpLLLJ0HpZeg2og0xd7AruCdOUxdmgNFJo3UidiKEAM8M1jBlA7Oi', 'Apt. 762', '43867966', '7662009', null, '7ruhLNwtum', '2019-02-13 16:46:03', '2019-02-13 16:46:03');
INSERT INTO `users` VALUES ('9', 'Corrine Flatley', 'morissette.dolores@hotmail.com', '$2y$10$m8C1XyNYS5Nc612dOteN6OfVGqCTyx7Ek2petRL2qbZt/q5Al8Nou', 'Suite 942', '66718754', '40782189', null, 'DGBu23UV0M', '2019-02-13 16:46:03', '2019-02-13 16:46:03');
INSERT INTO `users` VALUES ('10', 'Payton Hane Sr.', 'qoconnell@kulas.com', '$2y$10$ekrOEMxCoQihtNYtK6OndeAEKmjUih20gILnR6iPpyL1OJKU4Vtje', 'Apt. 030', '37648094', '18658559', null, 'PdDpC6ob09', '2019-02-13 16:46:03', '2019-02-13 16:46:03');
INSERT INTO `users` VALUES ('11', 'Mr. Savion Kulas IV', 'kemmer.jon@yahoo.com', '$2y$10$AQcO7iaY64MEgOghtpxtBufgnREXs4UzAulJTuC5aGqymYBDdy9ne', 'Suite 928', '64365951', '50549560', null, 'uD8dxJC2M8', '2019-02-13 16:46:03', '2019-02-13 16:46:03');
SET FOREIGN_KEY_CHECKS=1;
