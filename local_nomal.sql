/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : local_nomal

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/07/2020 10:30:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent` int(10) DEFAULT '0' COMMENT '上级分类',
  `name` varchar(16) NOT NULL COMMENT '分类名称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '分类关键词，用于搜索',
  `description` text COMMENT '分类介绍',
  `ico` varchar(32) DEFAULT NULL COMMENT '分类图标',
  `images` text COMMENT '分类广告大图,多图情况下轮播',
  `rules` text COMMENT '用户发布本类规则',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  FULLTEXT KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='家政目录';

-- ----------------------------
-- Records of cates
-- ----------------------------
BEGIN;
INSERT INTO `cates` VALUES (1, 0, '保洁', NULL, NULL, NULL, NULL, '{\"score\":10}', 0, 1, NULL, '2020-07-10 18:15:47');
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` smallint(6) NOT NULL DEFAULT '0' COMMENT '配置所属组',
  `key` varchar(16) NOT NULL COMMENT '配置的键名',
  `name` varchar(64) NOT NULL COMMENT '配置的名称',
  `descript` text COMMENT '配置的介绍',
  `content` longtext COMMENT '配置的内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '配置的状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统配置表';

-- ----------------------------
-- Table structure for demands
-- ----------------------------
DROP TABLE IF EXISTS `demands`;
CREATE TABLE `demands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `cate` int(10) NOT NULL COMMENT '分类',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词，搜索用',
  `description` text COMMENT '需求介绍',
  `images` text COMMENT '图集',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系电话，默认使用用户电话',
  `min` decimal(10,2) DEFAULT NULL COMMENT '最小价格',
  `max` decimal(10,2) DEFAULT NULL COMMENT '最大价格',
  `unit` varchar(8) DEFAULT NULL COMMENT '单位',
  `sort` smallint(4) DEFAULT NULL COMMENT '置顶',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `keyword` (`keyword`),
  KEY `uid` (`uid`),
  KEY `cate` (`cate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户需求表';

-- ----------------------------
-- Records of demands
-- ----------------------------
BEGIN;
INSERT INTO `demands` VALUES (1, 1, 1, 'ssss', NULL, NULL, NULL, NULL, NULL, NULL, '平方', NULL, 1, '2020-07-10 16:48:33', '2020-07-10 16:48:33');
INSERT INTO `demands` VALUES (2, 1, 1, 'ssss', NULL, NULL, NULL, NULL, 10.21, 99.99, '平方', NULL, 1, '2020-07-10 16:48:54', '2020-07-10 16:48:54');
COMMIT;

-- ----------------------------
-- Table structure for releases
-- ----------------------------
DROP TABLE IF EXISTS `releases`;
CREATE TABLE `releases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '发布者id',
  `title` varchar(255) NOT NULL COMMENT '发布内容的标题',
  `cate` int(10) NOT NULL COMMENT '所属的分类',
  `images` text COMMENT '照片',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话,没有则使用用户默认手机号',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` text COMMENT '服务内容介绍',
  `price` decimal(10,2) DEFAULT NULL COMMENT '服务价格',
  `unit` varchar(8) DEFAULT NULL COMMENT '服务单位',
  `sort` smallint(5) DEFAULT NULL COMMENT '排序',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '发布状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `title` (`title`),
  KEY `keyword` (`keyword`),
  KEY `cate` (`cate`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='服务方发布的服务项目';

-- ----------------------------
-- Records of releases
-- ----------------------------
BEGIN;
INSERT INTO `releases` VALUES (1, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 04:43:13', '2020-07-10 04:43:13', 1);
INSERT INTO `releases` VALUES (2, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 04:43:38', '2020-07-10 04:43:38', 1);
INSERT INTO `releases` VALUES (3, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 04:44:01', '2020-07-10 04:44:01', 1);
INSERT INTO `releases` VALUES (4, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 04:48:40', '2020-07-10 04:48:40', 0);
INSERT INTO `releases` VALUES (5, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 04:49:23', '2020-07-10 04:49:23', 0);
INSERT INTO `releases` VALUES (6, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 07:57:51', '2020-07-10 07:57:51', 0);
INSERT INTO `releases` VALUES (7, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 07:58:57', '2020-07-10 07:58:57', 0);
INSERT INTO `releases` VALUES (8, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 07:59:43', '2020-07-10 07:59:43', 0);
INSERT INTO `releases` VALUES (9, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:00:47', '2020-07-10 16:00:47', 0);
INSERT INTO `releases` VALUES (10, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:01:41', '2020-07-10 16:01:41', 0);
INSERT INTO `releases` VALUES (11, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:03:55', '2020-07-10 16:03:55', 0);
INSERT INTO `releases` VALUES (12, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:04:13', '2020-07-10 16:04:13', 0);
INSERT INTO `releases` VALUES (13, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:04:46', '2020-07-10 16:04:46', 0);
INSERT INTO `releases` VALUES (14, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:07:45', '2020-07-10 16:07:45', 0);
INSERT INTO `releases` VALUES (15, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:10:28', '2020-07-10 16:10:28', 0);
INSERT INTO `releases` VALUES (16, 1, 'ssss', 1, NULL, NULL, NULL, NULL, 10.00, '平方', NULL, '2020-07-10 16:21:12', '2020-07-10 16:21:12', 0);
INSERT INTO `releases` VALUES (17, 1, 'ssss', 1, NULL, NULL, NULL, NULL, NULL, '平方', NULL, '2020-07-10 16:48:07', '2020-07-10 16:48:07', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
