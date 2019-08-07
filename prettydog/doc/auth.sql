/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-07-25 18:19:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_power
-- ----------------------------
DROP TABLE IF EXISTS `c_power`;
CREATE TABLE `c_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `power_name` varchar(20) DEFAULT NULL COMMENT '权限名',
  `tybz` int(11) NOT NULL DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_power
-- ----------------------------

-- ----------------------------
-- Table structure for c_resources
-- ----------------------------
DROP TABLE IF EXISTS `c_resources`;
CREATE TABLE `c_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `resource_name` varchar(100) DEFAULT NULL COMMENT '资源名',
  `tybz` int(11) DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_resources
-- ----------------------------

-- ----------------------------
-- Table structure for c_role
-- ----------------------------
DROP TABLE IF EXISTS `c_role`;
CREATE TABLE `c_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `role_name` varchar(50) DEFAULT NULL COMMENT '权限名',
  `tybz` int(11) NOT NULL DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_role
-- ----------------------------

-- ----------------------------
-- Table structure for c_sequence
-- ----------------------------
DROP TABLE IF EXISTS `c_sequence`;
CREATE TABLE `c_sequence` (
  `seq_no` varchar(31) NOT NULL COMMENT '流水标志',
  `step_sz` int(11) DEFAULT NULL COMMENT '增长步长',
  `seq_rule` varchar(63) DEFAULT NULL COMMENT '流水号的生成前缀',
  `max_val` int(11) DEFAULT NULL COMMENT '数字部分自增最大值',
  `cache_sz` int(11) DEFAULT NULL COMMENT '单次缓存的数量',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `upwd` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `tybz` int(11) DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('1', null, 'wenchen', '$2a$10$HIs.hsz8TesoSB2P4bhfFO/i.rts1dBlvbWXdBY09fd7n0c1WhebS', '文臣', '男', '0');

-- ----------------------------
-- Table structure for r_power_resources
-- ----------------------------
DROP TABLE IF EXISTS `r_power_resources`;
CREATE TABLE `r_power_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `power_id` int(11) NOT NULL COMMENT '权限id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  `tybz` int(11) NOT NULL DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_power_resources
-- ----------------------------

-- ----------------------------
-- Table structure for r_role_power
-- ----------------------------
DROP TABLE IF EXISTS `r_role_power`;
CREATE TABLE `r_role_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标志',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `power_id` int(11) NOT NULL COMMENT '权限id',
  `tybz` int(11) NOT NULL DEFAULT '0' COMMENT '停用标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_role_power
-- ----------------------------
