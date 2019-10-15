/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : byb

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-10-15 17:34:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chu_user
-- ----------------------------
DROP TABLE IF EXISTS `chu_user`;
CREATE TABLE `chu_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `UPW` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `ROLE` int(11) DEFAULT NULL COMMENT '角色类型',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `PHONE` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `BM_ID` int(11) DEFAULT NULL COMMENT '与部门表对应',
  `RYLX` int(11) DEFAULT NULL COMMENT '业务员0，送货员1，收货人2',
  `JC` varchar(255) DEFAULT '' COMMENT '首字母的缩写',
  `XS` int(3) unsigned zerofill DEFAULT '000' COMMENT '销售的单数，用来生成销售单号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chu_user
-- ----------------------------
INSERT INTO `chu_user` VALUES ('1', 'wenchen', '3EAE24F429DEAD060334275C71B152B7', '1', '文臣', '123456789', '0', '0', 'wc', '002');
INSERT INTO `chu_user` VALUES ('2', 'hehaishui', '1ACF597D5CF8F06C4BB30E1634CD88FD', '1', '何海水', '123456789', '0', '0', 'hhs', '000');
INSERT INTO `chu_user` VALUES ('3', 'admin', 'A66ABB5684C45962D887564F08346E8D', '2', '管理员', '123456789', '0', '1', 'gly', '000');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户唯一标识',
  `UNAME` varchar(255) DEFAULT NULL COMMENT '客户用户名',
  `NAME` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `PHONE` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '送货地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'ddfd', '习经平', '110', '国务院');
INSERT INTO `customer` VALUES ('2', 'dafad', '稳架包', '120', '中南海');
INSERT INTO `customer` VALUES ('3', 'wenc', '弯沉', '15071451506', '湖北第二师范学院');
INSERT INTO `customer` VALUES ('4', 'hehai', '嘿嘿书', '1501505015', '湖北第二师范学院');
INSERT INTO `customer` VALUES ('5', '12dad', 'dfa放到', '15113156', '发的反馈来了贷款');
INSERT INTO `customer` VALUES ('6', 'fdf', 'ffdas发的', '013210320', '发手打发的');
INSERT INTO `customer` VALUES ('7', '21fza', '地方', '04616131', '腹内时代峻峰');
INSERT INTO `customer` VALUES ('8', 'hhhh富士', '文臣', '15071451506', '回家风格化法国富甲一方');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `MC` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '打印出EXCEL时要显示的标题',
  `PIC_URL` varchar(255) DEFAULT NULL COMMENT '部门图片在服务器上的地址',
  `REMARK` varchar(512) DEFAULT NULL COMMENT '打印出EXCEL时最后面要追加的说明',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('0', '湖北白云边酒业', '湖北白云边酒业产品朔源单', null, null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `NAME` varchar(255) DEFAULT '' COMMENT '菜单名称',
  `URL` varchar(255) DEFAULT '' COMMENT '访问地址',
  `ICON` varchar(255) DEFAULT '' COMMENT '菜单图标',
  `PID` int(11) DEFAULT NULL COMMENT '父菜单的ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('10', '数据字典', '/data', '', '0');
INSERT INTO `menu` VALUES ('20', '订单业务', '/order', '', '0');
INSERT INTO `menu` VALUES ('101', '客户管理', '/data/customerUI', '', '10');
INSERT INTO `menu` VALUES ('102', '酒品管理', '/data/wineUI', '', '10');
INSERT INTO `menu` VALUES ('103', '内部人员管理', '/data/nbryUI', '', '10');
INSERT INTO `menu` VALUES ('201', '数据录入', '/order/importUI', '', '20');
INSERT INTO `menu` VALUES ('202', '订单管理', '/order/queryUI', '', '20');
INSERT INTO `menu` VALUES ('203', '报表打印', '/order/reportUI', '', '20');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MID` int(11) DEFAULT NULL COMMENT '菜单对应的ID',
  `RID` int(11) DEFAULT NULL COMMENT '角色对应的ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '10', '1');
INSERT INTO `menu_role` VALUES ('2', '101', '1');
INSERT INTO `menu_role` VALUES ('3', '102', '1');
INSERT INTO `menu_role` VALUES ('4', '20', '1');
INSERT INTO `menu_role` VALUES ('5', '201', '1');
INSERT INTO `menu_role` VALUES ('6', '202', '1');
INSERT INTO `menu_role` VALUES ('8', '10', '2');
INSERT INTO `menu_role` VALUES ('9', '101', '2');
INSERT INTO `menu_role` VALUES ('10', '102', '2');
INSERT INTO `menu_role` VALUES ('11', '103', '2');
INSERT INTO `menu_role` VALUES ('12', '20', '2');
INSERT INTO `menu_role` VALUES ('13', '201', '2');
INSERT INTO `menu_role` VALUES ('14', '202', '2');
INSERT INTO `menu_role` VALUES ('15', '203', '2');
INSERT INTO `menu_role` VALUES ('16', '203', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单的唯一标识',
  `TXM` varchar(255) DEFAULT NULL COMMENT '条形码',
  `XSDH` varchar(255) DEFAULT '' COMMENT '销售单号',
  `WINE_ID` int(11) DEFAULT NULL COMMENT '酒的ID',
  `SHY` varchar(255) DEFAULT NULL COMMENT '送货员',
  `YWY` varchar(255) DEFAULT NULL COMMENT '业务员',
  `SHZ` varchar(255) DEFAULT NULL COMMENT '收货者,与客户表关联',
  `KDR` varchar(255) DEFAULT NULL COMMENT '开单人',
  `DATE` date DEFAULT NULL COMMENT '开单日期',
  `REMARK` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '000000001000000041', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('2', '000000001000000042', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('3', '000000001000000043', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('4', '000000001000000044', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('5', '000000001000000045', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('6', '000000001000000046', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('7', '000000001000000047', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('8', '000000001000000048', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('9', '000000001000000049', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('10', '000000001000000050', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('11', '000000001000000051', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('12', '000000001000000052', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('13', '000000001000000053', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('14', '000000001000000054', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('15', '000000001000000055', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('16', '000000001000000056', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('17', '000000001000000057', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('18', '000000001000000058', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('19', '000000001000000059', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('20', '000000001000000060', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('21', '000000001000000061', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('22', '000000001000000062', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('23', '000000001000000063', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('24', '000000001000000064', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('25', '000000001000000065', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('26', '000000001000000066', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('27', '000000001000000067', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('28', '000000001000000068', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('29', '000000001000000069', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('30', '000000001000000070', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('31', '000000001000000071', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('32', '000000001000000072', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('33', '000000001000000073', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('34', '000000001000000074', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('35', '000000001000000075', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('36', '000000001000000076', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('37', '000000001000000077', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('38', '000000001000000078', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('39', '000000001000000079', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('40', '000000001000000080', 'XSD-20180106-wc002', '2', 'hehaishui', 'wenchen', 'wenc', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('41', '000000001000000001', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('42', '000000001000000002', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('43', '000000001000000003', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('44', '000000001000000004', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('45', '000000001000000005', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('46', '000000001000000006', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('47', '000000001000000007', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('48', '000000001000000008', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('49', '000000001000000009', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('50', '000000001000000010', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('51', '000000001000000011', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('52', '000000001000000012', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('53', '000000001000000013', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('54', '000000001000000014', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('55', '000000001000000015', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('56', '000000001000000016', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('57', '000000001000000017', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('58', '000000001000000018', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('59', '000000001000000019', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('60', '000000001000000020', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('61', '000000001000000021', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('62', '000000001000000022', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('63', '000000001000000023', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('64', '000000001000000024', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('65', '000000001000000025', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('66', '000000001000000026', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('67', '000000001000000027', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('68', '000000001000000028', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('69', '000000001000000029', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('70', '000000001000000030', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('71', '000000001000000031', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('72', '000000001000000032', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('73', '000000001000000033', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('74', '000000001000000034', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('75', '000000001000000035', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('76', '000000001000000036', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('77', '000000001000000037', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('78', '000000001000000038', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('79', '000000001000000039', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('80', '000000001000000040', 'XSD-20180106-hhs001', '4', 'wenchen', 'hehaishui', 'hehai', 'wenchen', '2018-01-06', null);
INSERT INTO `orders` VALUES ('200', '000000004000000001', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('201', '000000004000000002', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('202', '000000004000000003', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('203', '000000004000000004', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('204', '000000004000000005', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('205', '000000004000000006', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('206', '000000004000000007', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('207', '000000004000000008', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('208', '000000004000000009', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('209', '000000004000000010', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('210', '000000004000000011', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('211', '000000004000000012', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('212', '000000004000000013', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('213', '000000004000000014', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('214', '000000004000000015', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('215', '000000004000000016', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('216', '000000004000000017', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('217', '000000004000000018', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('218', '000000004000000019', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('219', '000000004000000020', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('220', '000000004000000021', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('221', '000000004000000022', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('222', '000000004000000023', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('223', '000000004000000024', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('224', '000000004000000025', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('225', '000000004000000026', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('226', '000000004000000027', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('227', '000000004000000028', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('228', '000000004000000029', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('229', '000000004000000030', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('230', '000000004000000031', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('231', '000000004000000032', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('232', '000000004000000033', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('233', '000000004000000034', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('234', '000000004000000035', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('235', '000000004000000036', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('236', '000000004000000037', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('237', '000000004000000038', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('238', '000000004000000039', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('239', '000000004000000040', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('240', '000000004000000041', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('241', '000000004000000042', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('242', '000000004000000043', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('243', '000000004000000044', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('244', '000000004000000045', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('245', '000000004000000046', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('246', '000000004000000047', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('247', '000000004000000048', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('248', '000000004000000049', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('249', '000000004000000050', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('250', '000000004000000051', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('251', '000000004000000052', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('252', '000000004000000053', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('253', '000000004000000054', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('254', '000000004000000055', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('255', '000000004000000056', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('256', '000000004000000057', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('257', '000000004000000058', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('258', '000000004000000059', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('259', '000000004000000060', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('260', '000000004000000061', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('261', '000000004000000062', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('262', '000000004000000063', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('263', '000000004000000064', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('264', '000000004000000065', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('265', '000000004000000066', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('266', '000000004000000067', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('267', '000000004000000068', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('268', '000000004000000069', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('269', '000000004000000070', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('270', '000000004000000071', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('271', '000000004000000072', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('272', '000000004000000073', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('273', '000000004000000074', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('274', '000000004000000075', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('275', '000000004000000076', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('276', '000000004000000077', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('277', '000000004000000078', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('278', '000000004000000079', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('279', '000000004000000080', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('280', '000000004000000081', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('281', '000000004000000082', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('282', '000000004000000083', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('283', '000000004000000084', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('284', '000000004000000085', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('285', '000000004000000086', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('286', '000000004000000087', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('287', '000000004000000088', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('288', '000000004000000089', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('289', '000000004000000090', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('290', '000000004000000091', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('291', '000000004000000092', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('292', '000000004000000093', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('293', '000000004000000094', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('294', '000000004000000095', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('295', '000000004000000096', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('296', '000000004000000097', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('297', '000000004000000098', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('298', '000000004000000099', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('299', '000000004000000100', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('300', '000000004000000101', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('301', '000000004000000102', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('302', '000000004000000103', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('303', '000000004000000104', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('304', '000000004000000105', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('305', '000000004000000106', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('306', '000000004000000107', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('307', '000000004000000108', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('308', '000000004000000109', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('309', '000000004000000110', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('310', '000000004000000111', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('311', '000000004000000112', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('312', '000000004000000113', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('313', '000000004000000114', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('314', '000000004000000115', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);
INSERT INTO `orders` VALUES ('315', '000000004000000116', 'XSD-20180120-wc002', '4', 'hehaishui', 'wenchen', '12dad', 'wenchen', '2018-01-20', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '内部员工');
INSERT INTO `role` VALUES ('2', '超级管理员');

-- ----------------------------
-- Table structure for wine
-- ----------------------------
DROP TABLE IF EXISTS `wine`;
CREATE TABLE `wine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒的ID，唯一标识',
  `MC` varchar(255) DEFAULT NULL COMMENT '商品酒的名称',
  `PRICE` int(11) DEFAULT NULL COMMENT '价格',
  `DATE` date DEFAULT NULL COMMENT '出厂日期',
  `REMARK` varchar(512) DEFAULT NULL COMMENT '对该商品酒的备注说明',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wine
-- ----------------------------
INSERT INTO `wine` VALUES ('1', '金龙泉啤酒', '3', '2018-01-03', 'fazfdfdsfdsfdsfsda');
INSERT INTO `wine` VALUES ('2', '雪花啤酒', '3', '2018-01-03', 'dfvfefefe');
INSERT INTO `wine` VALUES ('3', '青岛啤酒', '3', '2018-01-02', 'rewrere');
INSERT INTO `wine` VALUES ('4', '台湾啤酒', '3', '2018-01-03', 'babadasd 参数的菜单发生的');

-- ----------------------------
-- View structure for v_order
-- ----------------------------
DROP VIEW IF EXISTS `v_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_order` AS (select `o`.`ID` AS `ORDER_ID`,`o`.`TXM` AS `TXM`,`o`.`XSDH` AS `XSDH`,`w`.`MC` AS `WINE_MC`,`u1`.`NAME` AS `SHY`,`u2`.`NAME` AS `YWY`,`u3`.`NAME` AS `KDR`,`c`.`NAME` AS `SHZ`,`c`.`PHONE` AS `KHDH`,`c`.`ADDRESS` AS `SHDZ`,`o`.`DATE` AS `DATE`,`d`.`MC` AS `BMMC`,`d`.`TITLE` AS `BM_TITLE`,`d`.`PIC_URL` AS `PIC_URL`,`o`.`REMARK` AS `REMARK` from ((((((`orders` `o` join `wine` `w` on((`w`.`ID` = `o`.`WINE_ID`))) join `chu_user` `u1` on((`u1`.`UNAME` = `o`.`SHY`))) join `chu_user` `u2` on((`u2`.`UNAME` = `o`.`YWY`))) join `chu_user` `u3` on((`u3`.`UNAME` = `o`.`KDR`))) join `customer` `c` on((`c`.`UNAME` = `o`.`SHZ`))) join `dept` `d` on((`d`.`ID` = `u3`.`BM_ID`)))) ;
