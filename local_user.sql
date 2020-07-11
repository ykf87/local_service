/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : local_user

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/07/2020 10:30:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_levels
-- ----------------------------
DROP TABLE IF EXISTS `user_levels`;
CREATE TABLE `user_levels` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `min` int(10) NOT NULL DEFAULT '0' COMMENT '最小积分',
  `max` int(10) NOT NULL COMMENT '最大积分',
  `level` tinyint(2) DEFAULT '1' COMMENT '达到条件后的等级',
  `remark` text COMMENT '会员权益',
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户会员等级定义';

-- ----------------------------
-- Records of user_levels
-- ----------------------------
BEGIN;
INSERT INTO `user_levels` VALUES (1, 0, 10, 1, NULL, 1, NULL, NULL);
INSERT INTO `user_levels` VALUES (2, 10, 300, 2, NULL, 1, NULL, NULL);
INSERT INTO `user_levels` VALUES (3, 300, 1000, 3, NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_positions
-- ----------------------------
DROP TABLE IF EXISTS `user_positions`;
CREATE TABLE `user_positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `lat` varchar(64) NOT NULL COMMENT '用户纬度',
  `lon` varchar(64) NOT NULL COMMENT '用户经度',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户定位历史记录';

-- ----------------------------
-- Table structure for user_scores
-- ----------------------------
DROP TABLE IF EXISTS `user_scores`;
CREATE TABLE `user_scores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `group` smallint(5) DEFAULT '0' COMMENT '得分原因分组,1-签到',
  `score` smallint(6) NOT NULL COMMENT '本次得分',
  `score_before` int(10) NOT NULL COMMENT '变化前分数',
  `score_after` int(10) NOT NULL COMMENT '变化后分数',
  `remark` varchar(64) NOT NULL COMMENT '得分备注',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户积分明细表';

-- ----------------------------
-- Records of user_scores
-- ----------------------------
BEGIN;
INSERT INTO `user_scores` VALUES (1, 1, 1, 10, 10, 20, '签到积分 {score}', '2020-07-09 09:31:27', '2020-07-09 09:31:27');
INSERT INTO `user_scores` VALUES (2, 1, 1, 20, 20, 40, '签到积分 {score}', '2020-07-09 10:10:13', '2020-07-09 10:10:13');
INSERT INTO `user_scores` VALUES (3, 1, 1, 10, 40, 50, '签到积分 {score}', '2020-07-09 10:10:38', '2020-07-09 10:10:38');
INSERT INTO `user_scores` VALUES (4, 1, 1, 10, 50, 60, '签到积分 {score}', '2020-07-09 10:10:47', '2020-07-09 10:10:47');
INSERT INTO `user_scores` VALUES (5, 1, 1, 10, 60, 70, '签到积分 {score}', '2020-07-09 10:11:05', '2020-07-09 10:11:05');
INSERT INTO `user_scores` VALUES (6, 1, 1, 10, 70, 80, '签到积分 {score}', '2020-07-09 10:11:19', '2020-07-09 10:11:19');
INSERT INTO `user_scores` VALUES (7, 1, 1, 10, 80, 90, '签到积分 {score}', '2020-07-09 10:11:32', '2020-07-09 10:11:32');
INSERT INTO `user_scores` VALUES (8, 1, 1, 100, 90, 190, '签到积分 {score}', '2020-07-09 10:11:41', '2020-07-09 10:11:41');
INSERT INTO `user_scores` VALUES (9, 1, 1, 10, 190, 200, '签到积分 {score}', '2020-07-09 10:12:38', '2020-07-09 10:12:38');
INSERT INTO `user_scores` VALUES (10, 1, 1, 100, 200, 300, '签到积分 {score}', '2020-07-09 10:12:59', '2020-07-09 10:12:59');
INSERT INTO `user_scores` VALUES (11, 1, 1, 100, 300, 400, '签到积分', '2020-07-09 11:17:47', '2020-07-09 11:17:47');
INSERT INTO `user_scores` VALUES (12, 1, 1, 10, 400, 410, '签到积分', '2020-07-09 11:44:43', '2020-07-09 11:44:43');
INSERT INTO `user_scores` VALUES (13, 1, 1, 10, 400, 410, '签到积分', '2020-07-09 11:45:11', '2020-07-09 11:45:11');
INSERT INTO `user_scores` VALUES (14, 1, 1, 10, 410, 420, '签到积分', '2020-07-09 11:48:20', '2020-07-09 11:48:20');
INSERT INTO `user_scores` VALUES (15, 1, 1, 10, 420, 430, '签到积分', '2020-07-09 11:50:23', '2020-07-09 11:50:23');
INSERT INTO `user_scores` VALUES (16, 1, 1, 100, 430, 530, '签到积分', '2020-07-09 12:49:43', '2020-07-09 12:49:43');
INSERT INTO `user_scores` VALUES (17, 1, 1, 10, 530, 540, '签到积分', '2020-07-09 12:50:29', '2020-07-09 12:50:29');
INSERT INTO `user_scores` VALUES (18, 1, 1, 20, 540, 560, '签到积分', '2020-07-09 12:50:37', '2020-07-09 12:50:37');
INSERT INTO `user_scores` VALUES (19, 1, 1, 10, 560, 570, '签到积分', '2020-07-09 12:50:38', '2020-07-09 12:50:38');
INSERT INTO `user_scores` VALUES (20, 1, 1, 10, 570, 580, '签到积分', '2020-07-09 15:31:48', '2020-07-09 15:31:48');
INSERT INTO `user_scores` VALUES (21, 1, 1, 10, 580, 590, '发布家政服务', '2020-07-10 04:44:01', '2020-07-10 04:44:01');
INSERT INTO `user_scores` VALUES (22, 1, 1, 20, 590, 610, '签到积分', '2020-07-10 04:44:58', '2020-07-10 04:44:58');
INSERT INTO `user_scores` VALUES (23, 1, 1, 10, 610, 620, '发布需求', '2020-07-10 16:48:33', '2020-07-10 16:48:33');
INSERT INTO `user_scores` VALUES (24, 1, 1, 10, 620, 630, '发布需求', '2020-07-10 16:48:54', '2020-07-10 16:48:54');
COMMIT;

-- ----------------------------
-- Table structure for user_signs
-- ----------------------------
DROP TABLE IF EXISTS `user_signs`;
CREATE TABLE `user_signs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `score` smallint(5) NOT NULL COMMENT '签到增加的积分',
  `created_at` datetime DEFAULT NULL COMMENT '签到时间',
  `updated_at` datetime DEFAULT NULL,
  `end` tinyint(1) DEFAULT '0' COMMENT '是否是第七天',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='用户签到表';

-- ----------------------------
-- Records of user_signs
-- ----------------------------
BEGIN;
INSERT INTO `user_signs` VALUES (1, 1, 10, '2020-07-02 09:31:27', '2020-07-09 09:31:27', 0);
INSERT INTO `user_signs` VALUES (2, 1, 20, '2020-07-03 10:10:13', '2020-07-09 10:10:13', 0);
INSERT INTO `user_signs` VALUES (3, 1, 30, '2020-07-04 10:10:38', '2020-07-09 10:10:38', 0);
INSERT INTO `user_signs` VALUES (4, 1, 40, '2020-07-05 10:10:47', '2020-07-09 10:10:47', 0);
INSERT INTO `user_signs` VALUES (6, 1, 60, '2020-07-07 10:11:19', '2020-07-09 10:11:19', 0);
INSERT INTO `user_signs` VALUES (9, 1, 60, '2020-07-08 10:12:38', '2020-07-09 10:12:38', 1);
INSERT INTO `user_signs` VALUES (10, 1, 100, '2020-07-06 10:12:59', '2020-07-09 10:12:59', 0);
INSERT INTO `user_signs` VALUES (20, 1, 10, '2020-07-09 15:31:48', '2020-07-09 15:31:48', 0);
INSERT INTO `user_signs` VALUES (21, 1, 20, '2020-07-10 04:44:58', '2020-07-10 04:44:58', 0);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0' COMMENT '推荐人',
  `chain` text COMMENT '链表关系',
  `openid` varchar(128) DEFAULT NULL COMMENT '微信公众号id',
  `level` smallint(5) DEFAULT '1' COMMENT '用户等级',
  `score` int(10) DEFAULT '0' COMMENT '用户积分',
  `name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(128) DEFAULT NULL COMMENT '用户密码(小程序估计用不上)',
  `avatar` varchar(128) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '性别',
  `telphone` varchar(16) DEFAULT NULL COMMENT '电话(考虑支付宝登录电话会重复)',
  `norelease` datetime DEFAULT NULL COMMENT '用户被禁止发布截止时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '账号状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 0, NULL, 'sdflkjwerjwksfiwuiruwer', 3, 630, '叶子🍃', '秋末', NULL, NULL, 0, NULL, NULL, 1, '2020-06-30 00:00:00', '2020-07-10 16:48:54');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
