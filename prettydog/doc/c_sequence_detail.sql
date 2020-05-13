/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-05-13 20:21:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_sequence_detail
-- ----------------------------
DROP TABLE IF EXISTS `c_sequence_detail`;
CREATE TABLE `c_sequence_detail` (
  `seq_no` varchar(128) DEFAULT NULL,
  `current_val` int(11) DEFAULT NULL COMMENT '当前值',
  `allocated` int(11) DEFAULT NULL COMMENT '已分配',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
