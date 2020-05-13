/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-05-13 20:21:35
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `c_sequence` VALUES ('test', '1', null, '999999999', '100', '2020-05-13 20:03:38', '2019-07-26 08:33:13');
