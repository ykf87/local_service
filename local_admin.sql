/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : local_admin

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/07/2020 10:30:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, '控制台', 'fa-bar-chart', '/', NULL, NULL, '2020-07-01 00:53:18');
INSERT INTO `admin_menu` VALUES (2, 0, 7, '管理员', 'fa-tasks', NULL, NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (3, 2, 8, '管理员列表', 'fa-users', 'auth/users', NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (4, 2, 9, '角色列表', 'fa-user', 'auth/roles', NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (5, 2, 10, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (6, 2, 11, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (7, 2, 12, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (8, 2, 13, '文件查看', 'fa-file', 'media', NULL, '2020-07-01 01:29:02', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (9, 2, 14, 'Redis 管理', 'fa-database', 'redis', NULL, '2020-07-01 02:33:55', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (10, 2, 15, '错误日志', 'fa-database', 'logs', NULL, '2020-07-02 02:04:45', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (11, 0, 2, '家政服务', 'fa-ambulance', 'service', NULL, '2020-07-10 09:21:35', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (12, 11, 3, '首页配置', 'fa-forumbee', 'service/config', NULL, '2020-07-10 09:22:28', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (13, 11, 4, '分类设置', 'fa-sitemap', 'service/cate', NULL, '2020-07-10 09:26:27', '2020-07-10 10:04:45');
INSERT INTO `admin_menu` VALUES (14, 11, 5, '需求管理', 'fa-user-plus', 'service/demand', NULL, '2020-07-10 09:27:37', '2020-07-10 09:31:31');
INSERT INTO `admin_menu` VALUES (15, 11, 6, '服务管理', 'fa-cut', 'service/release', NULL, '2020-07-10 09:29:09', '2020-07-10 09:31:31');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-09 03:38:36', '2020-07-09 03:38:36');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-09 04:08:02', '2020-07-09 04:08:02');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-10 03:47:28', '2020-07-10 03:47:28');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-10 09:14:19', '2020-07-10 09:14:19');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 09:14:31', '2020-07-10 09:14:31');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 09:14:39', '2020-07-10 09:14:39');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 09:20:22', '2020-07-10 09:20:22');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5bb6\\u653f\\u670d\\u52a1\",\"icon\":\"fa-ambulance\",\"uri\":\"service\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\"}', '2020-07-10 09:21:35', '2020-07-10 09:21:35');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:21:35', '2020-07-10 09:21:35');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:21:37', '2020-07-10 09:21:37');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u9996\\u9875\\u914d\\u7f6e\",\"icon\":\"fa-forumbee\",\"uri\":\"service\\/config\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\"}', '2020-07-10 09:22:28', '2020-07-10 09:22:28');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:22:28', '2020-07-10 09:22:28');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:22:30', '2020-07-10 09:22:30');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u5206\\u7c7b\\u8bbe\\u7f6e\",\"icon\":\"fa-sitemap\",\"uri\":\"service\\/cates\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\"}', '2020-07-10 09:26:27', '2020-07-10 09:26:27');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:26:27', '2020-07-10 09:26:27');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:26:28', '2020-07-10 09:26:28');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u670d\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-user-plus\",\"uri\":\"service\\/damend\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\"}', '2020-07-10 09:27:37', '2020-07-10 09:27:37');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:27:37', '2020-07-10 09:27:37');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u670d\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-cut\",\"uri\":\"service\\/release\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\"}', '2020-07-10 09:29:09', '2020-07-10 09:29:09');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:29:09', '2020-07-10 09:29:09');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 09:29:12', '2020-07-10 09:29:12');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u9700\\u6c42\\u7ba1\\u7406\",\"icon\":\"fa-user-plus\",\"uri\":\"service\\/demand\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/auth\\/menu\"}', '2020-07-10 09:29:28', '2020-07-10 09:29:28');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:29:29', '2020-07-10 09:29:29');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:29:34', '2020-07-10 09:29:34');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10}]}]\"}', '2020-07-10 09:31:31', '2020-07-10 09:31:31');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 09:31:31', '2020-07-10 09:31:31');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 09:31:34', '2020-07-10 09:31:34');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2020-07-10 10:04:40', '2020-07-10 10:04:40');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u5206\\u7c7b\\u8bbe\\u7f6e\",\"icon\":\"fa-sitemap\",\"uri\":\"service\\/cate\",\"roles\":[null],\"permission\":null,\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/auth\\/menu\"}', '2020-07-10 10:04:45', '2020-07-10 10:04:45');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 10:04:45', '2020-07-10 10:04:45');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-10 10:04:48', '2020-07-10 10:04:48');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 10:11:24', '2020-07-10 10:11:24');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/service/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:12:03', '2020-07-10 10:12:03');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/service/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:12:34', '2020-07-10 10:12:34');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/service/cate/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"\\u4fdd\\u6d01\",\"keyword\":null,\"description\":null,\"ico\":null,\"images\":null,\"rules\":\"{\\\"score\\\":10}\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/service\\/cate\"}', '2020-07-10 10:12:36', '2020-07-10 10:12:36');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 10:12:37', '2020-07-10 10:12:37');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/service/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:12:43', '2020-07-10 10:12:43');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/service/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:13:09', '2020-07-10 10:13:09');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/service/cate/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"\\u4fdd\\u6d01\",\"keyword\":null,\"description\":null,\"ico\":null,\"images\":null,\"rules\":\"{\\\"score\\\":10}\",\"sort\":\"0\",\"status\":\"off\",\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/service\\/cate\"}', '2020-07-10 10:13:31', '2020-07-10 10:13:31');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 10:13:31', '2020-07-10 10:13:31');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/service/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:13:37', '2020-07-10 10:13:37');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/service/cate/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"\\u4fdd\\u6d01\",\"keyword\":null,\"description\":null,\"ico\":null,\"images\":null,\"rules\":\"{\\\"score\\\":10}\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/service\\/cate\"}', '2020-07-10 10:13:40', '2020-07-10 10:13:40');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 10:13:40', '2020-07-10 10:13:40');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/service/cate', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 10:15:17', '2020-07-10 10:15:17');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/service/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 18:15:37', '2020-07-10 18:15:37');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/service/cate/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"\\u4fdd\\u6d01\",\"keyword\":null,\"description\":null,\"ico\":null,\"images\":null,\"rules\":\"{\\\"score\\\":10}\",\"sort\":\"0\",\"status\":\"off\",\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/service\\/cate\"}', '2020-07-10 18:15:40', '2020-07-10 18:15:40');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 18:15:40', '2020-07-10 18:15:40');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/service/cate/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-10 18:15:44', '2020-07-10 18:15:44');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/service/cate/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"\\u4fdd\\u6d01\",\"keyword\":null,\"description\":null,\"ico\":null,\"images\":null,\"rules\":\"{\\\"score\\\":10}\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"TF3uARPg6xSYFSRalTI23f6Qr1rSQPaLvPER5juG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:9380\\/admin\\/service\\/cate\"}', '2020-07-10 18:15:47', '2020-07-10 18:15:47');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/service/cate', 'GET', '127.0.0.1', '[]', '2020-07-10 18:15:47', '2020-07-10 18:15:47');
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Media manager', 'ext.media-manager', '', '/media*', '2020-07-01 01:29:02', '2020-07-01 01:29:02');
INSERT INTO `admin_permissions` VALUES (7, 'Redis Manager', 'ext.redis-manager', '', '/redis*', '2020-07-01 02:33:55', '2020-07-01 02:33:55');
INSERT INTO `admin_permissions` VALUES (8, 'Logs', 'ext.log-viewer', '', '/logs*', '2020-07-02 02:04:45', '2020-07-02 02:04:45');
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-07-01 00:41:14', '2020-07-01 00:41:14');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$j1eLFp8Xq5e5jT3iNwWRV.bTvUnSE.vmHLZTq7shQ93pzwVKF5.J2', 'Administrator', NULL, 'dx3fVl7An0FxREILn9PZ4oC0LfeL8Xm2vVyPEy6YjmLKD5OVAVmZEDwH6Jzm', '2020-07-01 00:41:14', '2020-07-01 00:41:14');
COMMIT;

-- ----------------------------
-- Table structure for cnarea_2019
-- ----------------------------
DROP TABLE IF EXISTS `cnarea_2019`;
CREATE TABLE `cnarea_2019` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) unsigned NOT NULL COMMENT '层级',
  `parent_code` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '父级行政代码',
  `area_code` bigint(14) unsigned NOT NULL DEFAULT '0' COMMENT '行政代码',
  `zip_code` mediumint(6) unsigned zerofill NOT NULL DEFAULT '000000' COMMENT '邮政编码',
  `city_code` char(6) NOT NULL DEFAULT '' COMMENT '区号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '简称',
  `merger_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组合名',
  `pinyin` varchar(30) NOT NULL DEFAULT '' COMMENT '拼音',
  `lng` decimal(10,6) NOT NULL DEFAULT '0.000000' COMMENT '经度',
  `lat` decimal(10,6) NOT NULL DEFAULT '0.000000' COMMENT '纬度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`area_code`) USING BTREE,
  KEY `idx_parent_code` (`parent_code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=783563 DEFAULT CHARSET=utf8 COMMENT='中国行政地区表';

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
