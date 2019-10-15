/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : 6ha

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-10-15 17:34:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authory
-- ----------------------------
DROP TABLE IF EXISTS `authory`;
CREATE TABLE `authory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `power` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of authory
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `belongs` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '武汉市', '17');
INSERT INTO `city` VALUES ('2', '十堰市', '17');
INSERT INTO `city` VALUES ('3', '神农架区', '17');
INSERT INTO `city` VALUES ('4', '襄樊市', '17');
INSERT INTO `city` VALUES ('5', '随州市', '17');
INSERT INTO `city` VALUES ('6', '荆门市', '17');
INSERT INTO `city` VALUES ('7', '宜昌市', '17');
INSERT INTO `city` VALUES ('8', '恩施土家族苗族自治州', '17');
INSERT INTO `city` VALUES ('9', '荆州市', '17');
INSERT INTO `city` VALUES ('10', '潜江市', '17');
INSERT INTO `city` VALUES ('11', '仙桃市', '17');
INSERT INTO `city` VALUES ('12', '天门市', '17');
INSERT INTO `city` VALUES ('13', '孝感市', '17');
INSERT INTO `city` VALUES ('14', '黄冈市', '17');
INSERT INTO `city` VALUES ('15', '鄂州市', '17');
INSERT INTO `city` VALUES ('16', '黄石市', '17');
INSERT INTO `city` VALUES ('17', '咸宁市', '17');
INSERT INTO `city` VALUES ('18', '东城区', '1');
INSERT INTO `city` VALUES ('19', '西城区', '1');
INSERT INTO `city` VALUES ('20', '朝阳区', '1');
INSERT INTO `city` VALUES ('21', '丰台区', '1');
INSERT INTO `city` VALUES ('22', '石景山区', '1');
INSERT INTO `city` VALUES ('23', '海淀区', '1');
INSERT INTO `city` VALUES ('24', '门头沟区', '1');
INSERT INTO `city` VALUES ('25', '房山区', '1');
INSERT INTO `city` VALUES ('26', '通州区', '1');
INSERT INTO `city` VALUES ('27', '顺义区', '1');
INSERT INTO `city` VALUES ('28', '昌平区', '1');
INSERT INTO `city` VALUES ('29', '大兴区', '1');
INSERT INTO `city` VALUES ('30', '怀柔区', '1');
INSERT INTO `city` VALUES ('31', '平谷区', '1');
INSERT INTO `city` VALUES ('32', '密云区', '1');
INSERT INTO `city` VALUES ('33', '延庆区', '1');
INSERT INTO `city` VALUES ('34', '和平区', '2');
INSERT INTO `city` VALUES ('35', '河西区', '2');
INSERT INTO `city` VALUES ('36', '河东区', '2');
INSERT INTO `city` VALUES ('37', '河北区', '2');
INSERT INTO `city` VALUES ('38', '红桥区', '2');
INSERT INTO `city` VALUES ('39', '南开区', '2');
INSERT INTO `city` VALUES ('40', '黄浦区', '3');
INSERT INTO `city` VALUES ('41', '徐汇区', '3');
INSERT INTO `city` VALUES ('42', '长宁区', '3');
INSERT INTO `city` VALUES ('43', '静安区', '3');
INSERT INTO `city` VALUES ('44', '普陀区', '3');
INSERT INTO `city` VALUES ('45', '虹口区', '3');
INSERT INTO `city` VALUES ('46', '万州区', '4');
INSERT INTO `city` VALUES ('47', '涪陵区', '4');
INSERT INTO `city` VALUES ('48', '渝中区', '4');
INSERT INTO `city` VALUES ('49', '大渡口区', '4');
INSERT INTO `city` VALUES ('50', '江北区', '4');
INSERT INTO `city` VALUES ('51', '小店区', '6');
INSERT INTO `city` VALUES ('52', '城区', '6');
INSERT INTO `city` VALUES ('53', '矿区', '6');
INSERT INTO `city` VALUES ('54', '张家口', '5');
INSERT INTO `city` VALUES ('55', '承德', '5');
INSERT INTO `city` VALUES ('56', '石家庄', '5');
INSERT INTO `city` VALUES ('57', '保定', '5');
INSERT INTO `city` VALUES ('58', '邯郸', '5');
INSERT INTO `city` VALUES ('59', '邢台', '5');
INSERT INTO `city` VALUES ('60', '沈阳', '7');
INSERT INTO `city` VALUES ('61', '大连', '7');
INSERT INTO `city` VALUES ('62', '长春', '8');
INSERT INTO `city` VALUES ('63', '通化', '8');
INSERT INTO `city` VALUES ('64', '白山', '8');

-- ----------------------------
-- Table structure for c_group
-- ----------------------------
DROP TABLE IF EXISTS `c_group`;
CREATE TABLE `c_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(255) DEFAULT NULL,
  `fzr` varchar(255) DEFAULT NULL,
  `glr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_group
-- ----------------------------
INSERT INTO `c_group` VALUES ('1', '测试一组', 'songhao', 'wenchen');
INSERT INTO `c_group` VALUES ('2', '测试二组', 'wenchen', 'wenchen');
INSERT INTO `c_group` VALUES ('3', '测试三组', 'wenchen3', 'wenchen');
INSERT INTO `c_group` VALUES ('4', '测试四组', 'wenchen4', 'wenchen');
INSERT INTO `c_group` VALUES ('5', '测试五组', 'wenchen5', 'wenchen');
INSERT INTO `c_group` VALUES ('6', '测试六组', 'wenchen6', 'wenchen');

-- ----------------------------
-- Table structure for c_xwlx
-- ----------------------------
DROP TABLE IF EXISTS `c_xwlx`;
CREATE TABLE `c_xwlx` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lx_Id` int(11) DEFAULT NULL,
  `lx_Pid` int(11) DEFAULT '0',
  `lx_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_xwlx
-- ----------------------------
INSERT INTO `c_xwlx` VALUES ('1', '1001', '10', '日看点左侧新闻');
INSERT INTO `c_xwlx` VALUES ('2', '1002', '10', '日看点中部新闻');
INSERT INTO `c_xwlx` VALUES ('3', '1003', '10', '日看点右侧新闻');
INSERT INTO `c_xwlx` VALUES ('4', '20', '0', 'NEWS新闻');
INSERT INTO `c_xwlx` VALUES ('5', '10', '0', '游戏日看点');
INSERT INTO `c_xwlx` VALUES ('6', '2001', '20', 'NEWS滚动新闻');

-- ----------------------------
-- Table structure for eva
-- ----------------------------
DROP TABLE IF EXISTS `eva`;
CREATE TABLE `eva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eva_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eva
-- ----------------------------
INSERT INTO `eva` VALUES ('1', '个人用户星级评分');
INSERT INTO `eva` VALUES ('2', 'VIP用户星级评分');
INSERT INTO `eva` VALUES ('3', '管理员用户星级评分');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(11) DEFAULT NULL,
  `grade_level` int(11) DEFAULT NULL,
  `upgrade_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '非会员', '0', '1000');
INSERT INTO `grade` VALUES ('2', '心悦会员1', '1', '5000');
INSERT INTO `grade` VALUES ('3', '心悦会员2', '2', '10000');
INSERT INTO `grade` VALUES ('4', '心悦会员3', '3', '20000');
INSERT INTO `grade` VALUES ('5', '心悦会员4', '4', '40000');
INSERT INTO `grade` VALUES ('6', '心悦会员5', '5', '0');

-- ----------------------------
-- Table structure for j_news
-- ----------------------------
DROP TABLE IF EXISTS `j_news`;
CREATE TABLE `j_news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dm` varchar(255) DEFAULT NULL,
  `lx` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `sqr` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT '',
  `href` varchar(255) DEFAULT '',
  `date` varchar(255) DEFAULT '',
  `zt` int(2) DEFAULT NULL,
  `remark` blob,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_news
-- ----------------------------
INSERT INTO `j_news` VALUES ('1', '11001', '1001', 'CJ现场看大家如何花式玩VR', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('2', '21001', '1001', '蜗牛《方舟公园》获得NVIDIA针对性显卡优化', 'wenchen', '', 'http://news.17173.com/content/07282017/172907951.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('3', '31001', '1001', '英伟达发布全新GeForceExperience中国版', 'wenchen', '', 'http://news.17173.com/content/07282017/112031044.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('4', '41001', '1001', 'CJ新游抢先看:畅游《军团指挥官》独家解析', 'wenchen', '', 'http://news.17173.com/content/07272017/170826525.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('5', '51001', '1001', 'HTCVive八折优惠!《乖离性亚瑟王》正式上线', 'wenchen', '', 'http://news.17173.com/content/07272017/142028517.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('6', '61001', '1001', 'HYPEREAL第一届开发者大会在上海举行', 'wenchen', '', 'http://news.17173.com/content/07272017/101516498.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('7', '71001', '1001', '无所畏有所为!冰穹互娱未来航线及发布会落幕', 'wenchen', '', 'http://news.17173.com/content/07252017/172020525.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('8', '81001', '1001', 'CJ2017:HTCVIVE宣布推出中国版VIVE一体机', 'wenchen', '', 'http://news.17173.com/content/07272017/102626611.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('9', '91002', '1002', 'VR版疯兔亮相CJ', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/bfXNEnblvzvglgz.jpg', 'http://news.17173.com/content/07252017/112909481.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('10', '101002', '1002', '《罪与罚:末日机甲》', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SeQumyblvEoEdjj.jpg', 'http://news.17173.com/content/07252017/140034320.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('11', '111002', '1002', '《方舟公园》最新预告', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07252017/001011813.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('12', '121002', '1002', '《马赛克别闹》登PSVR', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GDIhCPblwbbhwzg.jpg', 'http://news.17173.com/content/07262017/174908517.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('13', '131003', '1003', '国产PSVR游戏《基因雨》', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AgRsIYblvCwoyAr.jpg', 'http://news.17173.com/content/07252017/150018016.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('14', '142001', '2001', '明星+电竞+二次元?Chinajoy这家展台全都有', 'wenchen', '', 'http://news.17173.com/content/08102017/153659607_1.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('15', '152001', '2001', '2017ChinaJoy“喔图”用图片直播完美呈现', 'wenchen', '', 'http://news.17173.com/content/08102017/115112180.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('16', '162001', '2001', '聚众互动携新品参展ChinaJoy中国数码娱乐行业扑克邀请赛圆满落幕', 'wenchen', '', 'http://news.17173.com/content/08102017/115017452.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('17', '172001', '2001', 'Chinajoy人气展台全回顾哪家才是你的菜?', 'wenchen', '', 'http://news.17173.com/content/08092017/115509741.shtml', '08-09', '3', '');
INSERT INTO `j_news` VALUES ('18', '182001', '2001', 'Chinajoy明星网红众生相音乐才子、国民老公引得迷妹尖叫', 'wenchen', '', 'http://news.17173.com/content/08092017/115331157.shtml', '08-09', '3', '');
INSERT INTO `j_news` VALUES ('19', '192001', '2001', '推出西瓜视频App的背后，今日头条想做什么事？', 'wenchen', '', 'http://news.17173.com/content/08052017/104541920_1.shtml', '08-05', '3', '');
INSERT INTO `j_news` VALUES ('20', '202001', '2001', '强安全重体验腾讯游戏渠道吸引众多游戏关注', 'wenchen', '', 'http://news.17173.com/content/08022017/153234205.shtml', '08-02', '3', '');
INSERT INTO `j_news` VALUES ('21', '212001', '2001', '不迎合小白、不向市场妥协：《战意》为啥要这么做？', 'wenchen', '', 'http://news.17173.com/content/08022017/095850672_1.shtml', '08-02', '3', '');
INSERT INTO `j_news` VALUES ('22', '222001', '2001', '《小米枪战》出击2017CJ萌妹,御姐同台竞技!', 'wenchen', '', 'http://news.17173.com/content/08012017/160755601.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('23', '232001', '2001', '完美落幕!2017CJ万代南梦宫（上海）展区精彩回顾', 'wenchen', '', 'http://news.17173.com/content/08012017/143347791.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('24', '242001', '2001', 'CJ花絮:两场另类精彩的“华山论剑”', 'wenchen', '', 'http://news.17173.com/content/08012017/111643574.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('25', '252001', '2001', '宝藏世界开发商：我们和《我的世界》完全不同', 'wenchen', '', 'http://news.17173.com/content/08012017/104947841.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('26', '262001', '2001', '盛大游戏成立了一个新工作室，到底想要做啥事？', 'wenchen', '', 'http://news.17173.com/content/08012017/104801217_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('27', '272001', '2001', 'MOBA如何做好世界观？《虚幻争霸》是这么做的', 'wenchen', '', 'http://news.17173.com/content/08012017/094309143.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('28', '282001', '2001', 'CDPR聊昆特牌:只要是好游戏玩家都愿意玩中国玩家也不例外', 'wenchen', '', 'http://news.17173.com/content/08012017/014919593_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('29', '292001', '2001', '问道手游将加入新玩法《不思议迷宫》迎来大更新', 'wenchen', '', 'http://news.17173.com/content/08012017/002913283_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('30', '302001', '2001', '细数在chinajoy上出现的明星和网红周杰伦、许嵩、五五开.....', 'wenchen', '', 'http://news.17173.com/content/07312017/170102203_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('31', '312001', '2001', '凯撒文化2017CJ精彩回顾:未来可期,感恩有你', 'wenchen', '', 'http://news.17173.com/content/07312017/162524603.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('32', '322001', '2001', '《神武2》CJ舞台众星袁成杰.许嵩.王尼玛加盟', 'wenchen', '', 'http://news.17173.com/content/07312017/162345437.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('33', '332001', '2001', '云更新2017ChinaJoy之行圆满收官', 'wenchen', '', 'http://news.17173.com/content/07312017/161935138.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('34', '342001', '2001', '极限竞速世界锦标赛ChinaJoy邀请赛圆满结束', 'wenchen', '', 'http://news.17173.com/content/07312017/160747094.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('35', '352001', '2001', '超游网络亮相Chinajoy自制自研作品人气爆棚', 'wenchen', '', 'http://news.17173.com/content/07312017/155901047.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('36', '362001', '2001', '聚光灯下的超美小姐姐!2017CJ高端器材下的极品SG第二弹', 'wenchen', '', 'http://news.17173.com/content/07312017/151624373_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('37', '372001', '2001', 'ChinaJoy4399展台美女云集海量照片来袭', 'wenchen', '', 'http://news.17173.com/content/07312017/144044362_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('38', '382001', '2001', '腾讯要出魔力宝贝手游经典IP在15年后有了什么变化', 'wenchen', '', 'http://news.17173.com/content/07312017/143426694_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('39', '392001', '2001', '没有抢到CJ的门票?这里有所有经典游戏的Cosplay', 'wenchen', '', 'http://news.17173.com/content/07312017/143412043.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('40', '402001', '2001', '竞技手游迎来爆发乐逗游戏多款手游产品亮相CJ', 'wenchen', '', 'http://news.17173.com/content/07312017/141525047.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('41', '412001', '2001', '身材更好的小橘子姐姐CJ《QQ飞车》手游试玩', 'wenchen', '', 'http://news.17173.com/content/07312017/140327940.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('42', '422001', '2001', '除了非常英雄完美还带来了3款沙盒般自由的单机', 'wenchen', '', 'http://news.17173.com/content/07312017/140159868_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('43', '432001', '2001', '网易旗舰IP《镇魔曲》手游CJ五大亮点引爆全场', 'wenchen', '', 'http://news.17173.com/content/07312017/135024360.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('44', '442001', '2001', '网易《秘境对决》亮相CJ试玩现场火热直击', 'wenchen', '', 'http://news.17173.com/content/07312017/134531642.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('45', '452001', '2001', '《三国杀》九周年狂欢夜2017ChinaJoy杀迷盛宴', 'wenchen', '', 'http://news.17173.com/content/07312017/123033235.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('46', '462001', '2001', '人气爆棚！ChinaJoy联通小沃燃情开展“包”你玩一夏', 'wenchen', '', 'http://news.17173.com/content/07312017/122821528.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('47', '472001', '2001', '一秒带你回三国《三国如龙传》嗨翻全场', 'wenchen', '', 'http://news.17173.com/content/07312017/120956169.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('48', '482001', '2001', '经典人物重现这很可能就是你想要的《轩辕剑》手游', 'wenchen', '', 'http://news.17173.com/content/07312017/112623584_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('49', '492001', '2001', '《灵魂武器》定名《超魂觉醒》360代理秋季首测', 'wenchen', '', 'http://news.17173.com/content/07312017/110757575.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('51', '511001', '1001', '2017-08-23 14:12:12插入的测试数据0', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('52', '521001', '1001', '2017-08-23 14:12:13插入的测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('53', '531001', '1001', '2017-08-23 14:12:13插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('54', '541001', '1001', '2017-08-23 14:12:13插入的测试数据3', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('55', '551001', '1001', '2017-08-23 14:12:13插入的测试数据4', 'wenchen9', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('56', '561001', '1001', '2017-08-23 14:12:54插入的测试数据0', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('57', '571001', '1001', '2017-08-23 14:12:55插入的测试数据1', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('58', '581001', '1001', '2017-08-23 14:12:55插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('59', '591001', '1001', '2017-08-23 14:12:55插入的测试数据3', 'wenchen1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('60', '601001', '1001', '2017-08-23 14:12:55插入的测试数据4', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('61', '611001', '1001', '2017-08-23 14:13:48插入的测试数据0', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('62', '621001', '1001', '2017-08-23 14:13:48插入的测试数据1', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('63', '631001', '1001', '2017-08-23 14:13:48插入的测试数据2', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('64', '641001', '1001', '2017-08-23 14:13:48插入的测试数据3', 'DSDS', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('65', '651001', '1001', '2017-08-23 14:13:48插入的测试数据4', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('66', '661001', '1001', '2017-08-23 14:14:36插入的测试数据0', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('67', '671001', '1001', '2017-08-23 14:14:36插入的测试数据1', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('68', '681001', '1001', '2017-08-23 14:14:36插入的测试数据2', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('69', '691001', '1001', '2017-08-23 14:14:36插入的测试数据3', 'wenchen7', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('70', '701001', '1001', '2017-08-23 14:14:36插入的测试数据4', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('71', '711003', '1003', '2017-08-24 11:19:40插入的测试数据0', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('72', '721003', '1003', '2017-08-24 11:19:40插入的测试数据1', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('73', '731003', '1003', '2017-08-24 11:19:40插入的测试数据2', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('74', '741003', '1003', '2017-08-24 11:19:40插入的测试数据3', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('75', '751003', '1003', '2017-08-24 11:19:40插入的测试数据4', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('76', '761003', '1003', '2017-08-24 11:19:54插入的测试数据0', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('77', '771003', '1003', '2017-08-24 11:19:54插入的测试数据1', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('78', '781003', '1003', '2017-08-24 11:19:54插入的测试数据2', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('79', '791003', '1003', '2017-08-24 11:19:54插入的测试数据3', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('80', '801003', '1003', '2017-08-24 11:19:54插入的测试数据4', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('81', '811003', '1003', '2017-08-24 11:20:08插入的测试数据0', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('82', '821003', '1003', '2017-08-24 11:20:08插入的测试数据1', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('83', '831003', '1003', '2017-08-24 11:20:08插入的测试数据2', 'wenchen2', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('84', '841003', '1003', '2017-08-24 11:20:09插入的测试数据3', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('85', '851003', '1003', '2017-08-24 11:20:09插入的测试数据4', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('86', '861003', '1003', '2017-08-24 11:20:21插入的测试数据0', 'wenjiabao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('87', '871003', '1003', '2017-08-24 11:20:21插入的测试数据1', 'adasz', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('88', '881003', '1003', '2017-08-24 11:20:21插入的测试数据2', 'dsdsdsa', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('89', '891003', '1003', '2017-08-24 11:20:21插入的测试数据3', 'wenchen9', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('90', '901003', '1003', '2017-08-24 11:20:21插入的测试数据4', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('91', '911003', '1003', '2017-08-24 11:20:32插入的测试数据0', 'wenchen12', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('92', '921003', '1003', '2017-08-24 11:20:32插入的测试数据1', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('93', '931003', '1003', '2017-08-24 11:20:32插入的测试数据2', 'wenchen11', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('94', '941003', '1003', '2017-08-24 11:20:32插入的测试数据3', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('95', '951003', '1003', '2017-08-24 11:20:32插入的测试数据4', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('96', '961003', '1003', '2017-08-24 11:21:42插入的测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('97', '971003', '1003', '2017-08-24 11:21:42插入的测试数据1', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('98', '981003', '1003', '2017-08-24 11:21:42插入的测试数据2', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('99', '991003', '1003', '2017-08-24 11:21:42插入的测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('100', '1001003', '1003', '2017-08-24 11:21:42插入的测试数据4', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('101', '1011003', '1003', '2017-08-24 12:03:41插入的测试数据0', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('102', '1021003', '1003', '2017-08-24 12:03:41插入的测试数据1', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('103', '1031003', '1003', '2017-08-24 12:03:41插入的测试数据2', 'xijinping', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('104', '1041003', '1003', '2017-08-24 12:03:41插入的测试数据3', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('105', '1051003', '1003', '2017-08-24 12:03:41插入的测试数据4', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('106', '1061003', '1003', '2017-08-24 12:07:06插入的测试数据0', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('107', '1071003', '1003', '2017-08-24 12:07:06插入的测试数据1', 'wenchen10', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('108', '1081003', '1003', '2017-08-24 12:07:06插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('109', '1091003', '1003', '2017-08-24 12:07:07插入的测试数据3', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('110', '1101003', '1003', '2017-08-24 12:07:07插入的测试数据4', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('111', '1111003', '1003', '2017-08-24 12:07:18插入的测试数据0', 'wenchen1112a', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('112', '1121003', '1003', '2017-08-24 12:07:18插入的测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('113', '1131003', '1003', '2017-08-24 12:07:19插入的测试数据2', 'gggg', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('114', '1141003', '1003', '2017-08-24 12:07:19插入的测试数据3', 'wenchen4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('115', '1151003', '1003', '2017-08-24 12:07:19插入的测试数据4', 'wenchen111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('116', '1161003', '1003', '2017-08-24 12:07:53插入的测试数据0', 'wenjiabao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('117', '1171003', '1003', '2017-08-24 12:07:53插入的测试数据1', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('118', '1181003', '1003', '2017-08-24 12:07:53插入的测试数据2', 'DSDS', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('119', '1191003', '1003', '2017-08-24 12:07:53插入的测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('120', '1201003', '1003', '2017-08-24 12:07:53插入的测试数据4', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('121', '1211003', '1003', '2017-08-24 12:08:28插入的测试数据0', 'wenchen3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('122', '1221003', '1003', '2017-08-24 12:08:28插入的测试数据1', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('123', '1231003', '1003', '2017-08-24 12:08:28插入的测试数据2', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('124', '1241003', '1003', '2017-08-24 12:08:28插入的测试数据3', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('125', '1251003', '1003', '2017-08-24 12:08:28插入的测试数据4', 'ds', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('126', '1261003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('127', '1271003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('128', '1281003', '1003', '2017-08-24 12:08:29插入的测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('129', '1291003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('130', '1301003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('131', '1311003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('132', '1321003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('133', '1331003', '1003', '2017-08-24 12:08:29插入的测试数据2', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('134', '1341003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('135', '1351003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'wenchen3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('136', '1361003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'xijinping', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('137', '1371003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('138', '1381003', '1003', '2017-08-24 12:08:29插入的测试数据2', '1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('139', '1391003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'baba', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('140', '1401003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('141', '1411003', '1003', '2017-08-24 12:09:04插入的测试数据0', 'wenchen1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('142', '1421003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('143', '1431003', '1003', '2017-08-24 12:09:05插入的测试数据2', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('144', '1441003', '1003', '2017-08-24 12:09:05插入的测试数据3', 'DSDS', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('145', '1451003', '1003', '2017-08-24 12:09:05插入的测试数据4', 'wenchen111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('146', '1461003', '1003', '2017-08-24 12:09:05插入的测试数据0', 'wenchen2', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('147', '1471003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('148', '1481003', '1003', '2017-08-24 12:09:05插入的测试数据2', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('149', '1491003', '1003', '2017-08-24 12:09:05插入的测试数据3', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('150', '1501003', '1003', '2017-08-24 12:09:05插入的测试数据4', 'wenchen8', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('151', '1511003', '1003', '2017-08-24 12:09:05插入的测试数据0', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('152', '1521003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('153', '1531003', '1003', '2017-08-24 12:09:06插入的测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('154', '1541003', '1003', '2017-08-24 12:09:06插入的测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('155', '1551003', '1003', '2017-08-24 12:09:06插入的测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('156', '1561003', '1003', '2017-08-24 12:09:06插入的测试数据0', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('157', '1571003', '1003', '2017-08-24 12:09:06插入的测试数据1', 'ds', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('158', '1581003', '1003', '2017-08-24 12:09:06插入的测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('159', '1591003', '1003', '2017-08-24 12:09:06插入的测试数据3', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('160', '1601003', '1003', '2017-08-24 12:09:06插入的测试数据4', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('161', '1611003', '1003', '2017-08-24 12:09:26插入的测试数据0', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('162', '1621003', '1003', '2017-08-24 12:09:26插入的测试数据1', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('163', '1631003', '1003', '2017-08-24 12:09:26插入的测试数据2', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('164', '1641003', '1003', '2017-08-24 12:09:26插入的测试数据3', 'wenchen5', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('165', '1651003', '1003', '2017-08-24 12:09:26插入的测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('166', '1661003', '1003', '2017-08-24 12:10:13插入的大图文测试数据0', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('167', '1671003', '1003', '2017-08-24 12:10:13插入的大图文测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('168', '1681003', '1003', '2017-08-24 12:10:13插入的大图文测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('169', '1691003', '1003', '2017-08-24 12:10:14插入的大图文测试数据3', 'dsdsdsa', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('170', '1701003', '1003', '2017-08-24 12:10:14插入的大图文测试数据4', 'wenchen11', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('181', '1811003', '1003', '沃日你妈卖批哦', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/pic/4415fffb0ffc45e491c156962a15bcdd.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/html/4415fffb0ffc45e491c156962a15bcdd.html', '', '7', '');
INSERT INTO `j_news` VALUES ('182', '1821003', '1003', '我日日日日日日日你你你您妈妈妈妈吗', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/pic/8266bf8291984de2a5da9d7141074e92.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/html/8266bf8291984de2a5da9d7141074e92.html', '', '7', 0x3C7020636C6173733D223139223E3C7370616E3EE983A8E997A8E69893E88097E59381E7AEA1E79086E59198E5AFB9E69CACE983A8E997A8E7AEA1E79086E79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE983A8E997A8E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D2231392220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE9A696E58588E69FA5E8AFA2E8AFA5E794A8E688B7E698AFE590A6E698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC9A3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C7370616E3E73656C656374203C2F7370616E3E3C7370616E3E69643C2F7370616E3E3C7370616E3E266E6273703B66726F6D20635F7A63676C2077686572652061707069643D3F20616E64203C2F7370616E3E3C7370616E3E667A723D3F3C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3EE5A682E69E9CE4B8BAE7A9BAEFBC8CE5BCB9E587BAE5AFB9E8AF9DE6A186EFBC9AE682A8E4B88DE698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC8CE697A0E6B395E5AE8CE68890E799BBE8AEB0E5B7A5E4BD9CE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E435A424D5F49443C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC89E4B8BAE4B88AE99DA23C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E69643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE79A84E6938DE4BD9CE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E676574424D4C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E637A626D5F646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE68C81E69C89E983A8E997A8EFBC883C2F666F6E743E646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE695B0E9878FEFBC883C2F666F6E743E6E756D3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E342E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E7B1BBE59E8B3C2F666F6E743E3C2F7370616E3E3C7370616E3EEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D224D736F4E6F726D616C223E3C7370616E3E3C627220636C6561723D22616C6C223E3C2F7370616E3E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3E3C666F6E7420666163653D22E6A5B7E4BD93223EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E69FA5E8AFA2E7958CE99DA2E8AEBEE8AEA13C2F666F6E743E203C666F6E7420666163653D22E6A5B7E4BD93223EEFBC883C2F666F6E743E4C5948504C69737455493C666F6E7420666163653D22E6A5B7E4BD93223EEFBC893C2F666F6E743E3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C7370616E3EE5908EE58BA4E7AEA1E79086E59198E5AFB9E695B4E4B8AAE4BC81E4B89AE79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D2231392220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3EE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C2F7370616E3E3C7370616E3EE6938DE4BD9CE983A8E997A8EFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E585858583C2F666F6E743E3C2F7370616E3E3C7370616E3E266E6273703B266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8BEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E6765744C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E093C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575844657074436F6E74726F6C6C65722E717565727957584465707455493C666F6E7420666163653D22E4BBBFE5AE8B223EE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E983A8E997A8EFBC8CE5908CE697B6E5B086E8AFA5E983A8E997A8E58F8AE585B6E68980E69C89E5AD90E983A8E997A8E59D87E7AD9BE98089E587BAE69DA5E380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE38082E794A8E688B7E98089E68BA9E788B6E7B1BBE59E8BEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E);
INSERT INTO `j_news` VALUES ('183', '1831003', '1003', 'fdasfdfdfadsfdsf', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/b8ec5dfd148946daa95b4fb1db53ff47.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/b8ec5dfd148946daa95b4fb1db53ff47.html', '', '7', 0x3C7020636C6173733D223230223E3C7370616E3EE983A8E997A8E69893E88097E59381E7AEA1E79086E59198E5AFB9E69CACE983A8E997A8E7AEA1E79086E79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE983A8E997A8E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D2232302220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223230223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE9A696E58588E69FA5E8AFA2E8AFA5E794A8E688B7E698AFE590A6E698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC9A3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C7370616E3E73656C656374203C2F7370616E3E3C7370616E3E69643C2F7370616E3E3C7370616E3E266E6273703B66726F6D20635F7A63676C2077686572652061707069643D3F20616E64203C2F7370616E3E3C7370616E3E667A723D3F3C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3EE5A682E69E9CE4B8BAE7A9BAEFBC8CE5BCB9E587BAE5AFB9E8AF9DE6A186EFBC9AE682A8E4B88DE698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC8CE697A0E6B395E5AE8CE68890E799BBE8AEB0E5B7A5E4BD9CE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E435A424D5F49443C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC89E4B8BAE4B88AE99DA23C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E69643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE79A84E6938DE4BD9CE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E676574424D4C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E637A626D5F646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE68C81E69C89E983A8E997A8EFBC883C2F666F6E743E646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE695B0E9878FEFBC883C2F666F6E743E6E756D3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E342E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E7B1BBE59E8B3C2F666F6E743E3C2F7370616E3E3C7370616E3EEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D224D736F4E6F726D616C223E3C7370616E3E3C627220636C6561723D22616C6C223E3C2F7370616E3E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3E3C666F6E7420666163653D22E6A5B7E4BD93223EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E69FA5E8AFA2E7958CE99DA2E8AEBEE8AEA13C2F666F6E743E203C666F6E7420666163653D22E6A5B7E4BD93223EEFBC883C2F666F6E743E4C5948504C69737455493C666F6E7420666163653D22E6A5B7E4BD93223EEFBC893C2F666F6E743E3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223230223E3C7370616E3EE5908EE58BA4E7AEA1E79086E59198E5AFB9E695B4E4B8AAE4BC81E4B89AE79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F66343431306634336663333934313066626533336563373462323335366665302E6A70672220616C743D226E756C6C223E3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D2232302220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3EE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C2F7370616E3E3C7370616E3EE6938DE4BD9CE983A8E997A8EFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E585858583C2F666F6E743E3C2F7370616E3E3C7370616E3E266E6273703B266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8BEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('190', '20170831145310', '1003', 'okokokokokokokokoko', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/45984aa510454b3b92c451d63c6a72a3.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/45984aa510454b3b92c451d63c6a72a3.html', '', '7', 0x3C703E242E616A6178287B3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E75726C3A20676574436F6E74657874506174682829202B20222F61646D696E2F6474772F64656C4474772E646F222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E747970653A2022706F7374222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E646174613A7B7477646D3A647477736A55495F64656C526F772E646D7D2C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E64617461547970653A226A736F6E222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E6173796E633A66616C73652C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E63616368653A66616C73652C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E737563636573733A66756E6374696F6E202872657329207B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E24282223647477736A55495F64676474774C69737422292E6461746167726964282772656C6F616427293B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E6966202821726573203D3D2022737563636573732229207B3C2F703E3C703E3C7370616E3E0909090909093C2F7370616E3E6C617965722E616C65727428726573756C742C7B7469746C653A27E58F91E7949FE4BA86E4B880E4B8AAE99499E8AFAF277D293B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E7D2C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E6572726F723A66756E6374696F6E202829207B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E616C6572742822416A6178206572726F722122293B3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7D293B3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F38613437313035353762336234663362383539343735646633653834333737352E6A70672220616C743D226E756C6C223E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F32362E6769662220616C743D225BE680925D223E3C62723E3C2F703E);
INSERT INTO `j_news` VALUES ('191', '20170831145648', '1003', 'ppqqpajakjfalk', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/ea8d185ef731427eb9045be123116056.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/ea8d185ef731427eb9045be123116056.html', '', '1', 0x3C703E6966202820726573756C74203D3D2022737563636573732229207B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E6C617965722E6D73672827E6938DE4BD9CE68890E58A9F272C7B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E09090909093C2F7370616E3E74696D653A20333030302C3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E09090909093C2F7370616E3E62746E3A5B27E79FA5E98193E595A6275D3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E7D293B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E0909093C2F7370616E3E7D20656C7365207B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E6C617965722E616C65727428726573756C742C7B7469746C653A27E58F91E7949FE4BA86E4B880E4B8AAE99499E8AFAF277D293B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E0909093C2F7370616E3E7D3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F36352E6769662220616C743D225BE5A881E6ADA65D223E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F31342E6769662220616C743D225BE4BAB2E4BAB25D223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F32352E6769662220616C743D225BE68AB1E68AB15D223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F66393366353863316431613634383538386336353333313433653639383561622E6A70672220616C743D226E756C6C223E3C62723E3C2F703E);
INSERT INTO `j_news` VALUES ('192', '20170919101245', '1003', 'gdgkldl', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-19/pic/3da45935a9734bf19bf27790ee6c7d57.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-19/html/3da45935a9734bf19bf27790ee6c7d57.html', '', '4', 0x3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673EE4BA8BE4BBB6E5908D3C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE58F82E695B03C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE68F8FE8BFB03C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4368616E67653C2F74643E0D0A3C74643E6E657756616C75652C206F6C6456616C75653C2F74643E0D0A3C74643EE59CA8E5AD97E6AEB5E580BCE69BB4E694B9E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E526573697A653C2F74643E0D0A3C74643E77696474682C206865696768743C2F74643E0D0A3C74643EE59CA8E69687E69CACE6A186E5A4A7E5B08FE694B9E58F98E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E436C69636B427574746F6E3C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE59CA8E794A8E688B7E782B9E587BBE68C89E992AEE79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E436C69636B49636F6E3C2F74643E0D0A3C74643E696E6465783C2F74643E0D0A3C74643EE59CA8E794A8E688B7E782B9E587BBE59BBEE6A087E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020616C69676E3D226C656674223E203C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE696B9E6B395E689A9E5B195E887AA203C6120687265663D22223E76616C6964617465626F783C2F613EEFBC8CE4BBA5E4B88BE698AFE696B0E5A29EE79A84E69687E69CACE6A186E696B9E6B395E380823C2F703E3C703E0D0A0D0A0D0A0D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673EE696B9E6B395E5908D3C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE696B9E6B395E5B19EE680A73C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE68F8FE8BFB03C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F7074696F6E733C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE5B19EE680A7E5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E74657874626F783C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE69687E69CACE6A186E5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E627574746F6E3C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE68C89E992AEE5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E64657374726F793C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE99480E6AF81E69687E69CACE6A186E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E726573697A653C2F74643E0D0A3C74643E77696474683C2F74643E0D0A3C74643EE8B083E695B4E69687E69CACE6A186E7BB84E4BBB6E5AEBDE5BAA6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E64697361626C653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE7A681E794A8E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E656E61626C653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE590AFE794A8E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E726561646F6E6C793C2F74643E0D0A3C74643E6D6F64653C2F74643E0D0A3C74643EE590AFE794A82FE7A681E794A8E58FAAE8AFBBE6A8A1E5BC8FE38082200D0A3C703EE4BBA3E7A081E7A4BAE4BE8BEFBC9A3C2F703E3C7072653E24282723746227292E74657874626F782827726561646F6E6C7927293B09202020202020202020202020202020202F2F20E590AFE794A8E58FAAE8AFBBE6A8A1E5BC8F0D0A24282723746227292E74657874626F782827726561646F6E6C79272C74727565293B092F2F20E590AFE794A8E58FAAE8AFBBE6A8A1E5BC8F0D0A24282723746227292E74657874626F782827726561646F6E6C79272C66616C7365293B092F2F20E7A681E794A8E58FAAE8AFBBE6A8A1E5BC8F3C2F7072653E3C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E636C6561723C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE6B885E999A4E7BB84E4BBB6E4B8ADE79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E72657365743C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE9878DE7BDAEE7BB84E4BBB6E4B8ADE79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E736574546578743C2F74643E0D0A3C74643E746578743C2F74643E0D0A3C74643EE8AEBEE7BDAEE698BEE7A4BAE79A84E69687E69CACE580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E676574546578743C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE88EB7E58F96E698BEE7A4BAE79A84E69687E69CACE580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E73657456616C75653C2F74643E0D0A3C74643E76616C75653C2F74643E0D0A3C74643EE8AEBEE7BDAEE7BB84E4BBB6E79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E67657456616C75653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE88EB7E58F96E7BB84E4BBB6E79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E67657449636F6E3C2F74643E0D0A3C74643E696E6465783C2F74643E0D0A3C74643EE88EB7E58F96E68C87E5AE9AE59BBEE6A087E5AFB9E8B1A1E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('194', '20170920102503', '1003', 'dsdsa', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-20/pic/228c96dad49f47d7bd2b478c3441a743.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-20/html/228c96dad49f47d7bd2b478c3441a743.html', '', '4', 0x3C703E616D65776F726B2E6A6462632E64617461736F757263652E44617461536F757263655574696C735D202D2052657475726E696E67204A44424320436F6E6E656374696F6E20746F2044617461536F757263653C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E52657175657374526573706F6E7365426F64794D6574686F6450726F636573736F725D202D205772697474656E205B6F72672E6C662E7574696C732E45617379756944617461677269644032633732633230645D20617320226170706C69636174696F6E2F6A736F6E3B636861727365743D5554462D3822207573696E67205B6F72672E737072696E676672616D65776F726B2E687474702E636F6E7665727465722E6A736F6E2E4D617070696E674A61636B736F6E32487474704D657373616765436F6E7665727465724035366633623036615D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D204E756C6C204D6F64656C416E64566965772072657475726E656420746F2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643273A20617373756D696E672048616E646C65724164617074657220636F6D706C6574656420726571756573742068616E646C696E673C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D205375636365737366756C6C7920636F6D706C6574656420726571756573743C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643272070726F63657373696E6720474554207265717565737420666F72205B2F61646D696E5F3668612F61646D696E2F7477736A2F61646444747755492E646F5D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C65724D617070696E675D202D204C6F6F6B696E672075702068616E646C6572206D6574686F6420666F722070617468202F61646D696E2F7477736A2F61646444747755492E646F3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C65724D617070696E675D202D2052657475726E696E672068616E646C6572206D6574686F64205B7075626C6963206A6176612E6C616E672E537472696E67206F72672E6C662E61646D696E2E616374696F6E2E7477736A2E5457534A436F6E74726F6C6C65722E616464447477554928295D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E6265616E732E666163746F72792E737570706F72742E44656661756C744C69737461626C654265616E466163746F72795D202D2052657475726E696E672063616368656420696E7374616E6365206F662073696E676C65746F6E206265616E20275457534A436F6E74726F6C6C6572273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D204C6173742D4D6F6469666965642076616C756520666F72205B2F61646D696E5F3668612F61646D696E2F7477736A2F61646444747755492E646F5D2069733A202D313C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E6265616E732E666163746F72792E737570706F72742E44656661756C744C69737461626C654265616E466163746F72795D202D20496E766F6B696E6720616674657250726F706572746965735365742829206F6E206265616E2077697468206E616D65202761646D696E2F74772F7477736A2F6474772F6164644474775549273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D2052656E646572696E672076696577205B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4A73746C566965773A206E616D65202761646D696E2F74772F7477736A2F6474772F6164644474775549273B2055524C205B2F5745422D494E462F61646D696E2F74772F7477736A2F6474772F61646444747755492E6A73705D5D20696E2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4A73746C566965775D202D20466F7277617264696E6720746F207265736F75726365205B2F5745422D494E462F61646D696E2F74772F7477736A2F6474772F61646444747755492E6A73705D20696E20496E7465726E616C5265736F7572636556696577202761646D696E2F74772F7477736A2F6474772F6164644474775549273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D205375636365737366756C6C7920636F6D706C6574656420726571756573743C2F703E);
INSERT INTO `j_news` VALUES ('265', '1506135840487', '1002', '2017-09-23 11:04:00插入的小图文测试数据0', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('266', '1506135840575', '1002', '2017-09-23 11:04:00插入的小图文测试数据1', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('267', '1506135840636', '1002', '2017-09-23 11:04:00插入的小图文测试数据2', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-10-10/pic/f8bed4c5fb5c4189a55c3d8397bb96ba.jpg', 'http://localhost:8080/admin_6ha/tw/xtw/2017-10-10/html/f8bed4c5fb5c4189a55c3d8397bb96ba.html', '', '5', 0x3C683420616C69676E3D226C656674223EE5B19EE680A73C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E5B19EE680A7E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E38082E4BE8BE5A682EFBC8CE5AFB9E8AF9DE6A186E5B19EE680A7E5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E6469616C6F673C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E4BA8BE4BBB6EFBC88E59B9EE8B083E587BDE695B0EFBC89E4B99FE983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE8B083E794A8E696B9E6B395E79A84E8AFADE6B395EFBC9A24282773656C6563746F7227292E706C7567696E28276D6574686F64272C20706172616D65746572293B203C2F703E3C7020616C69676E3D226C656674223EE8A7A3E9878AEFBC9A200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E73656C6563746F723C2F7370616E3E20E698AF6A51657279E5AFB9E8B1A1E98089E68BA9E599A8E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706C7567696E3C2F7370616E3E20E698AFE68F92E4BBB6E79A84E5908DE7A7B0E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E6D6574686F643C2F7370616E3E20E698AFE79BB8E5BA94E68F92E4BBB6E78EB0E69C89E79A84E696B9E6B395E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706172616D657465723C2F7370616E3E200D0AE698AFE58F82E695B0E5AFB9E8B1A1EFBC8CE58FAFE4BBA5E698AFE4B880E4B8AAE5AFB9E8B1A1E38081E5AD97E7ACA6E4B8B2E7AD89E380823C2F6469763E3C2F6C693E3C2F756C3E3C7020616C69676E3D226C656674223EE68980E69C89E696B9E6B395E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E6D6574686F6473E38082E6AF8FE4B8AAE696B9E6B395E983BDE69C8932E4B8AAE58F82E695B0EFBC9A6A71E5928C706172616DE38082E7ACACE4B880E4B8AAE58F82E695B0276A7127E698AFE5BF85E9A1BBE79A84EFBC8CE8BF99E698AFE68C87E79A846A5175657279E5AFB9E8B1A1E38082E7ACACE4BA8CE4B8AAE58F82E695B027706172616D27E698AFE68C87E4BCA0E585A5E696B9E6B395E79A84E5AE9EE99985E58F82E695B0E38082E4BE8BE5A682EFBC8CE4B8BA6469616C6F67E7BB84E4BBB6E689A9E5B195E4B880E4B8AAE696B9E6B395E5908DE4B8BA276D796D6F766527EFBC8CE4BBA3E7A081E5A682E4B88BEFBC9A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B202020200D0A3C2F6C693E3C6C693E202020206D796D6F76653A203C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E286A712C206E6577706F736974696F6E297B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7370616E20636C6173733D226B6579776F7264223E72657475726E3C2F7370616E3E206A712E65616368283C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E28297B202020200D0A3C2F6C693E3C6C693E20202020202020202020202024283C7370616E20636C6173733D226B6579776F7264223E746869733C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D6F7665273C2F7370616E3E2C206E6577706F736974696F6E293B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020207D293B202020200D0A3C2F6C693E3C6C693E202020207D202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E7D293B20203C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E3C64697620616C69676E3D226C656674223E3C70726520636C6173733D226A61766173637269707422206E616D653D22636F64652D77656C636F6D65223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B0D0A202020206D796D6F76653A2066756E6374696F6E286A712C206E6577706F736974696F6E297B0D0A202020202020202072657475726E206A712E656163682866756E6374696F6E28297B0D0A202020202020202020202020242874686973292E6469616C6F6728276D6F7665272C206E6577706F736974696F6E293B0D0A20202020202020207D293B0D0A202020207D0D0A7D293B0D0A3C2F7072653E3C2F6469763E3C7020616C69676E3D226C656674223EE78EB0E59CA8E4BDA0E58FAFE4BBA5E8B083E794A8276D796D6F766527E696B9E6B395E5B086E5AFB9E8AF9DE6A186E7A7BBE58AA8E588B0E68C87E5AE9AE4BD8DE7BDAEEFBC9A3C2F703E3C703E0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E24283C7370616E20636C6173733D22737472696E67223E27236464273C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D796D6F7665273C2F7370616E3E2C207B202020200D0A3C2F6C693E3C6C693E202020206C6566743A203230302C202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020746F703A20313030202020200D0A3C2F6C693E3C6C693E7D293B20266E6273703B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F35312E6769662220616C743D225BE58594E5AD905D223E3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E);
INSERT INTO `j_news` VALUES ('269', '1506135840769', '1002', '2017-09-23 11:04:00插入的小图文测试数据4', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('270', '1506135841127', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'wenchen7', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('272', '1506135841250', '1002', '2017-09-23 11:04:01插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('273', '1506135841310', '1002', '2017-09-23 11:04:01插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('274', '1506135841366', '1002', '2017-09-23 11:04:01插入的小图文测试数据4', 'wenchen8', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('275', '1506135841588', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('276', '1506135841641', '1002', '2017-09-23 11:04:01插入的小图文测试数据1', '1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('277', '1506135841702', '1002', '2017-09-23 11:04:01插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('278', '1506135841758', '1002', '2017-09-23 11:04:01插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('279', '1506135841819', '1002', '2017-09-23 11:04:01插入的小图文测试数据4', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('280', '1506135841926', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('281', '1506135842002', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('282', '1506135842066', '1002', '2017-09-23 11:04:02插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('283', '1506135842127', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('284', '1506135842183', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('286', '1506135842358', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('288', '1506135842474', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'wenchen9', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('289', '1506135842536', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('291', '1506135842702', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('292', '1506135842758', '1002', '2017-09-23 11:04:02插入的小图文测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('293', '1506135842844', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('294', '1506135842908', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('295', '1506135842991', '1002', '2017-09-23 11:04:02插入的小图文测试数据0', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('296', '1506135843049', '1002', '2017-09-23 11:04:03插入的小图文测试数据1', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('297', '1506135843136', '1002', '2017-09-23 11:04:03插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('298', '1506135843191', '1002', '2017-09-23 11:04:03插入的小图文测试数据3', 'wenchen1112a', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('299', '1506135843252', '1002', '2017-09-23 11:04:03插入的小图文测试数据4', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('301', '1507611151287', '1002', '2017年10月10日12:52:00测试数据0002——文臣', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-10-10/pic/8dd61f8172ff40a7906ad6d355b210da.jpg', 'http://localhost:8080/admin_6ha/tw/xtw/2017-10-10/html/8dd61f8172ff40a7906ad6d355b210da.html', '', '4', 0x3C683420616C69676E3D226C656674223EE5B19EE680A73C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E5B19EE680A7E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E38082E4BE8BE5A682EFBC8CE5AFB9E8AF9DE6A186E5B19EE680A7E5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E6469616C6F673C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E4BA8BE4BBB6EFBC88E59B9EE8B083E587BDE695B0EFBC89E4B99FE983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE8B083E794A8E696B9E6B395E79A84E8AFADE6B395EFBC9A24282773656C6563746F7227292E706C7567696E28276D6574686F64272C20706172616D65746572293B203C2F703E3C7020616C69676E3D226C656674223EE8A7A3E9878AEFBC9A200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E73656C6563746F723C2F7370616E3E20E698AF6A51657279E5AFB9E8B1A1E98089E68BA9E599A8E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706C7567696E3C2F7370616E3E20E698AFE68F92E4BBB6E79A84E5908DE7A7B0E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E6D6574686F643C2F7370616E3E20E698AFE79BB8E5BA94E68F92E4BBB6E78EB0E69C89E79A84E696B9E6B395E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706172616D657465723C2F7370616E3E200D0AE698AFE58F82E695B0E5AFB9E8B1A1EFBC8CE58FAFE4BBA5E698AFE4B880E4B8AAE5AFB9E8B1A1E38081E5AD97E7ACA6E4B8B2E7AD89E380823C2F6469763E3C2F6C693E3C2F756C3E3C7020616C69676E3D226C656674223EE68980E69C89E696B9E6B395E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E6D6574686F6473E38082E6AF8FE4B8AAE696B9E6B395E983BDE69C8932E4B8AAE58F82E695B0EFBC9A6A71E5928C706172616DE38082E7ACACE4B880E4B8AAE58F82E695B0276A7127E698AFE5BF85E9A1BBE79A84EFBC8CE8BF99E698AFE68C87E79A846A5175657279E5AFB9E8B1A1E38082E7ACACE4BA8CE4B8AAE58F82E695B027706172616D27E698AFE68C87E4BCA0E585A5E696B9E6B395E79A84E5AE9EE99985E58F82E695B0E38082E4BE8BE5A682EFBC8CE4B8BA6469616C6F67E7BB84E4BBB6E689A9E5B195E4B880E4B8AAE696B9E6B395E5908DE4B8BA276D796D6F766527EFBC8CE4BBA3E7A081E5A682E4B88BEFBC9A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B202020200D0A3C2F6C693E3C6C693E202020206D796D6F76653A203C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E286A712C206E6577706F736974696F6E297B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7370616E20636C6173733D226B6579776F7264223E72657475726E3C2F7370616E3E206A712E65616368283C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E28297B202020200D0A3C2F6C693E3C6C693E20202020202020202020202024283C7370616E20636C6173733D226B6579776F7264223E746869733C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D6F7665273C2F7370616E3E2C206E6577706F736974696F6E293B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020207D293B202020200D0A3C2F6C693E3C6C693E202020207D202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E7D293B20203C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E3C64697620616C69676E3D226C656674223E3C70726520636C6173733D226A61766173637269707422206E616D653D22636F64652D77656C636F6D65223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B0D0A202020206D796D6F76653A2066756E6374696F6E286A712C206E6577706F736974696F6E297B0D0A202020202020202072657475726E206A712E656163682866756E6374696F6E28297B0D0A202020202020202020202020242874686973292E6469616C6F6728276D6F7665272C206E6577706F736974696F6E293B0D0A20202020202020207D293B0D0A202020207D0D0A7D293B0D0A3C2F7072653E3C2F6469763E3C7020616C69676E3D226C656674223EE78EB0E59CA8E4BDA0E58FAFE4BBA5E8B083E794A8276D796D6F766527E696B9E6B395E5B086E5AFB9E8AF9DE6A186E7A7BBE58AA8E588B0E68C87E5AE9AE4BD8DE7BDAEEFBC9A3C2F703E3C703E0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E24283C7370616E20636C6173733D22737472696E67223E27236464273C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D796D6F7665273C2F7370616E3E2C207B202020200D0A3C2F6C693E3C6C693E202020206C6566743A203230302C202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020746F703A20313030202020200D0A3C2F6C693E3C2F6F6C3E3C703E3C6F6C20636C6173733D2264702D63223E3C6C693E7D293B3C2F6C693E3C2F6F6C3E3C2F703E3C683420616C69676E3D226C656674223EE5B19EE680A73C2F68343E3C6F6C20636C6173733D2264702D63223E3C6C693E0D0A3C7020616C69676E3D226C656674223EE68980E69C89E79A84E5B19EE680A7E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E38082E4BE8BE5A682EFBC8CE5AFB9E8AF9DE6A186E5B19EE680A7E5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E6469616C6F673C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E0D0A3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E0D0A3C7020616C69676E3D226C656674223EE68980E69C89E79A84E4BA8BE4BBB6EFBC88E59B9EE8B083E587BDE695B0EFBC89E4B99FE983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E0D0A3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E0D0A3C7020616C69676E3D226C656674223EE8B083E794A8E696B9E6B395E79A84E8AFADE6B395EFBC9A24282773656C6563746F7227292E706C7567696E28276D6574686F64272C20706172616D65746572293B203C2F703E0D0A3C7020616C69676E3D226C656674223EE8A7A3E9878AEFBC9A200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E73656C6563746F723C2F7370616E3E20E698AF6A51657279E5AFB9E8B1A1E98089E68BA9E599A8E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706C7567696E3C2F7370616E3E20E698AFE68F92E4BBB6E79A84E5908DE7A7B0E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E6D6574686F643C2F7370616E3E20E698AFE79BB8E5BA94E68F92E4BBB6E78EB0E69C89E79A84E696B9E6B395E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706172616D657465723C2F7370616E3E200D0AE698AFE58F82E695B0E5AFB9E8B1A1EFBC8CE58FAFE4BBA5E698AFE4B880E4B8AAE5AFB9E8B1A1E38081E5AD97E7ACA6E4B8B2E7AD89E380823C2F6469763E3C2F6C693E3C2F756C3E0D0A3C7020616C69676E3D226C656674223EE68980E69C89E696B9E6B395E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E6D6574686F6473E38082E6AF8FE4B8AAE696B9E6B395E983BDE69C8932E4B8AAE58F82E695B0EFBC9A6A71E5928C706172616DE38082E7ACACE4B880E4B8AAE58F82E695B0276A7127E698AFE5BF85E9A1BBE79A84EFBC8CE8BF99E698AFE68C87E79A846A5175657279E5AFB9E8B1A1E38082E7ACACE4BA8CE4B8AAE58F82E695B027706172616D27E698AFE68C87E4BCA0E585A5E696B9E6B395E79A84E5AE9EE99985E58F82E695B0E38082E4BE8BE5A682EFBC8CE4B8BA6469616C6F67E7BB84E4BBB6E689A9E5B195E4B880E4B8AAE696B9E6B395E5908DE4B8BA276D796D6F766527EFBC8CE4BBA3E7A081E5A682E4B88BEFBC9A3C2F703E0D0A3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B202020200D0A3C2F6C693E3C6C693E202020206D796D6F76653A203C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E286A712C206E6577706F736974696F6E297B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7370616E20636C6173733D226B6579776F7264223E72657475726E3C2F7370616E3E206A712E65616368283C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E28297B202020200D0A3C2F6C693E3C6C693E20202020202020202020202024283C7370616E20636C6173733D226B6579776F7264223E746869733C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D6F7665273C2F7370616E3E2C206E6577706F736974696F6E293B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020207D293B202020200D0A3C2F6C693E3C6C693E202020207D202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E7D293B20203C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E0D0A3C64697620616C69676E3D226C656674223E3C70726520636C6173733D226A61766173637269707422206E616D653D22636F64652D77656C636F6D65223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B0D0A202020206D796D6F76653A2066756E6374696F6E286A712C206E6577706F736974696F6E297B0D0A202020202020202072657475726E206A712E656163682866756E6374696F6E28297B0D0A202020202020202020202020242874686973292E6469616C6F6728276D6F7665272C206E6577706F736974696F6E293B0D0A20202020202020207D293B0D0A202020207D0D0A7D293B0D0A3C2F7072653E3C2F6469763E0D0A3C7020616C69676E3D226C656674223EE78EB0E59CA8E4BDA0E58FAFE4BBA5E8B083E794A8276D796D6F766527E696B9E6B395E5B086E5AFB9E8AF9DE6A186E7A7BBE58AA8E588B0E68C87E5AE9AE4BD8DE7BDAEEFBC9A3C2F703E0D0A3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E24283C7370616E20636C6173733D22737472696E67223E27236464273C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D796D6F7665273C2F7370616E3E2C207B202020200D0A3C2F6C693E3C6C693E202020206C6566743A203230302C202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020746F703A20313030202020200D0A3C2F6C693E3C6C693E7D293B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F34392E6769662220616C743D225BE78CAAE5A4B45D223E20266E6273703B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F34392E6769662220616C743D225BE78CAAE5A4B45D223E3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E266E6273703B266E6273703B3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E);
INSERT INTO `j_news` VALUES ('302', '1507618155749', '1002', '2017年10月10日14:48:47测试数据二——文臣', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-10-10/pic/9e5a7c6608874ce58c2dd2e9dd35493c.jpg', 'http://localhost:8080/admin_6ha/tw/xtw/2017-10-10/html/9e5a7c6608874ce58c2dd2e9dd35493c.html', '', '4', 0x3C683420616C69676E3D226C656674223EE5B19EE680A73C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E5B19EE680A7E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E38082E4BE8BE5A682EFBC8CE5AFB9E8AF9DE6A186E5B19EE680A7E5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E6469616C6F673C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E4BA8BE4BBB6EFBC88E59B9EE8B083E587BDE695B0EFBC89E4B99FE983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE8B083E794A8E696B9E6B395E79A84E8AFADE6B395EFBC9A24282773656C6563746F7227292E706C7567696E28276D6574686F64272C20706172616D65746572293B203C2F703E3C7020616C69676E3D226C656674223EE8A7A3E9878AEFBC9A200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E73656C6563746F723C2F7370616E3E20E698AF6A51657279E5AFB9E8B1A1E98089E68BA9E599A8E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706C7567696E3C2F7370616E3E20E698AFE68F92E4BBB6E79A84E5908DE7A7B0E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E6D6574686F643C2F7370616E3E20E698AFE79BB8E5BA94E68F92E4BBB6E78EB0E69C89E79A84E696B9E6B395E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706172616D657465723C2F7370616E3E200D0AE698AFE58F82E695B0E5AFB9E8B1A1EFBC8CE58FAFE4BBA5E698AFE4B880E4B8AAE5AFB9E8B1A1E38081E5AD97E7ACA6E4B8B2E7AD89E380823C2F6469763E3C2F6C693E3C2F756C3E3C7020616C69676E3D226C656674223EE68980E69C89E696B9E6B395E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E6D6574686F6473E38082E6AF8FE4B8AAE696B9E6B395E983BDE69C8932E4B8AAE58F82E695B0EFBC9A6A71E5928C706172616DE38082E7ACACE4B880E4B8AAE58F82E695B0276A7127E698AFE5BF85E9A1BBE79A84EFBC8CE8BF99E698AFE68C87E79A846A5175657279E5AFB9E8B1A1E38082E7ACACE4BA8CE4B8AAE58F82E695B027706172616D27E698AFE68C87E4BCA0E585A5E696B9E6B395E79A84E5AE9EE99985E58F82E695B0E38082E4BE8BE5A682EFBC8CE4B8BA6469616C6F67E7BB84E4BBB6E689A9E5B195E4B880E4B8AAE696B9E6B395E5908DE4B8BA276D796D6F766527EFBC8CE4BBA3E7A081E5A682E4B88BEFBC9A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B202020200D0A3C2F6C693E3C6C693E202020206D796D6F76653A203C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E286A712C206E6577706F736974696F6E297B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7370616E20636C6173733D226B6579776F7264223E72657475726E3C2F7370616E3E206A712E65616368283C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E28297B202020200D0A3C2F6C693E3C6C693E20202020202020202020202024283C7370616E20636C6173733D226B6579776F7264223E746869733C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D6F7665273C2F7370616E3E2C206E6577706F736974696F6E293B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020207D293B202020200D0A3C2F6C693E3C6C693E202020207D202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E7D293B20203C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E3C64697620616C69676E3D226C656674223E3C70726520636C6173733D226A61766173637269707422206E616D653D22636F64652D77656C636F6D65223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B0D0A202020206D796D6F76653A2066756E6374696F6E286A712C206E6577706F736974696F6E297B0D0A202020202020202072657475726E206A712E656163682866756E6374696F6E28297B0D0A202020202020202020202020242874686973292E6469616C6F6728276D6F7665272C206E6577706F736974696F6E293B0D0A20202020202020207D293B0D0A202020207D0D0A7D293B0D0A3C2F7072653E3C2F6469763E3C7020616C69676E3D226C656674223EE78EB0E59CA8E4BDA0E58FAFE4BBA5E8B083E794A8276D796D6F766527E696B9E6B395E5B086E5AFB9E8AF9DE6A186E7A7BBE58AA8E588B0E68C87E5AE9AE4BD8DE7BDAEEFBC9A3C2F703E3C703E0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E24283C7370616E20636C6173733D22737472696E67223E27236464273C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D796D6F7665273C2F7370616E3E2C207B202020200D0A3C2F6C693E3C6C693E202020206C6566743A203230302C202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020746F703A20313030202020200D0A3C2F6C693E3C6C693E7D293B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D31302D31302F7069632F63373463353865386333623834393766393165346637633336383034303865642E6A70672220616C743D226E756C6C223E20266E6273703B3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E);
INSERT INTO `j_news` VALUES ('303', '1507618693632', '1002', '2017年10月10日14:57:39测试数据三——文臣', 'wenchen', 'http://localhost:8080/admin_6ha/tw/xtw/2017-10-10/pic/e3117b7093aa4305aa6a11d8abe221ee.jpg', 'http://localhost:8080/admin_6ha/tw/xtw/2017-10-10/html/e3117b7093aa4305aa6a11d8abe221ee.html', '', '7', 0x3C683420616C69676E3D226C656674223EE5B19EE680A73C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E5B19EE680A7E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E38082E4BE8BE5A682EFBC8CE5AFB9E8AF9DE6A186E5B19EE680A7E5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E6469616C6F673C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E3C7020616C69676E3D226C656674223EE68980E69C89E79A84E4BA8BE4BBB6EFBC88E59B9EE8B083E587BDE695B0EFBC89E4B99FE983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E64656661756C7473E9878CE99DA2E380823C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE8B083E794A8E696B9E6B395E79A84E8AFADE6B395EFBC9A24282773656C6563746F7227292E706C7567696E28276D6574686F64272C20706172616D65746572293B203C2F703E3C7020616C69676E3D226C656674223EE8A7A3E9878AEFBC9A200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E73656C6563746F723C2F7370616E3E20E698AF6A51657279E5AFB9E8B1A1E98089E68BA9E599A8E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706C7567696E3C2F7370616E3E20E698AFE68F92E4BBB6E79A84E5908DE7A7B0E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E6D6574686F643C2F7370616E3E20E698AFE79BB8E5BA94E68F92E4BBB6E78EB0E69C89E79A84E696B9E6B395E380823C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C7370616E3E706172616D657465723C2F7370616E3E200D0AE698AFE58F82E695B0E5AFB9E8B1A1EFBC8CE58FAFE4BBA5E698AFE4B880E4B8AAE5AFB9E8B1A1E38081E5AD97E7ACA6E4B8B2E7AD89E380823C2F6469763E3C2F6C693E3C2F756C3E3C7020616C69676E3D226C656674223EE68980E69C89E696B9E6B395E983BDE5AE9AE4B989E59CA86A51756572792E666E2E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303030306666223E7B706C7567696E7D3C2F666F6E743E3C2F7374726F6E673E2E6D6574686F6473E38082E6AF8FE4B8AAE696B9E6B395E983BDE69C8932E4B8AAE58F82E695B0EFBC9A6A71E5928C706172616DE38082E7ACACE4B880E4B8AAE58F82E695B0276A7127E698AFE5BF85E9A1BBE79A84EFBC8CE8BF99E698AFE68C87E79A846A5175657279E5AFB9E8B1A1E38082E7ACACE4BA8CE4B8AAE58F82E695B027706172616D27E698AFE68C87E4BCA0E585A5E696B9E6B395E79A84E5AE9EE99985E58F82E695B0E38082E4BE8BE5A682EFBC8CE4B8BA6469616C6F67E7BB84E4BBB6E689A9E5B195E4B880E4B8AAE696B9E6B395E5908DE4B8BA276D796D6F766527EFBC8CE4BBA3E7A081E5A682E4B88BEFBC9A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B202020200D0A3C2F6C693E3C6C693E202020206D796D6F76653A203C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E286A712C206E6577706F736974696F6E297B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7370616E20636C6173733D226B6579776F7264223E72657475726E3C2F7370616E3E206A712E65616368283C7370616E20636C6173733D226B6579776F7264223E66756E6374696F6E3C2F7370616E3E28297B202020200D0A3C2F6C693E3C6C693E20202020202020202020202024283C7370616E20636C6173733D226B6579776F7264223E746869733C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D6F7665273C2F7370616E3E2C206E6577706F736974696F6E293B202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020207D293B202020200D0A3C2F6C693E3C6C693E202020207D202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E7D293B20203C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E3C64697620616C69676E3D226C656674223E3C70726520636C6173733D226A61766173637269707422206E616D653D22636F64652D77656C636F6D65223E242E657874656E6428242E666E2E6469616C6F672E6D6574686F64732C207B0D0A202020206D796D6F76653A2066756E6374696F6E286A712C206E6577706F736974696F6E297B0D0A202020202020202072657475726E206A712E656163682866756E6374696F6E28297B0D0A202020202020202020202020242874686973292E6469616C6F6728276D6F7665272C206E6577706F736974696F6E293B0D0A20202020202020207D293B0D0A202020207D0D0A7D293B0D0A3C2F7072653E3C2F6469763E3C7020616C69676E3D226C656674223EE78EB0E59CA8E4BDA0E58FAFE4BBA5E8B083E794A8276D796D6F766527E696B9E6B395E5B086E5AFB9E8AF9DE6A186E7A7BBE58AA8E588B0E68C87E5AE9AE4BD8DE7BDAEEFBC9A3C2F703E3C703E0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D63223E0D0A3C6C6920636C6173733D22616C74223E24283C7370616E20636C6173733D22737472696E67223E27236464273C2F7370616E3E292E6469616C6F67283C7370616E20636C6173733D22737472696E67223E276D796D6F7665273C2F7370616E3E2C207B202020200D0A3C2F6C693E3C6C693E202020206C6566743A203230302C202020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020746F703A20313030202020200D0A3C2F6C693E3C6C693E7D293B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F34392E6769662220616C743D225BE78CAAE5A4B45D223E20266E6273703B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F35302E6769662220616C743D225BE7868AE78CAB5D223E3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E);
INSERT INTO `j_news` VALUES ('304', '1507621942497', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据0', 'wenchen1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('305', '1507621942584', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据1', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('306', '1507621942640', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据2', 'adasz', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('307', '1507621942701', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据3', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('308', '1507621942757', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据4', 'wenchen7', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('309', '1507621942863', '2001', '2017-10-10 15:52:22插入的滚动新闻测试数据0', 'wenchen11', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('310', '1507621943012', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据1', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('311', '1507621943076', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据2', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('312', '1507621943131', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('313', '1507621943193', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据4', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('315', '1507621943351', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据1', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('316', '1507621943407', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据2', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('317', '1507621943468', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据3', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('318', '1507621943523', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据4', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('319', '1507621943607', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据0', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('320', '1507621943698', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据1', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('321', '1507621943760', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据2', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('322', '1507621943815', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据3', 'dsdsdsa', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('323', '1507621943876', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据4', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('324', '1507621943945', '2001', '2017-10-10 15:52:23插入的滚动新闻测试数据0', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('325', '1507621944026', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('326', '1507621944082', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据2', 'wenchen9', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('327', '1507621944143', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据3', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('328', '1507621944199', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据4', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('329', '1507621944287', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据0', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('330', '1507621944348', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据1', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('331', '1507621944426', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据2', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('332', '1507621944482', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据3', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('333', '1507621944543', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据4', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('334', '1507621944693', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据0', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('335', '1507621944768', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据1', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('336', '1507621944848', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据2', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('337', '1507621944943', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据3', 'xijinping', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('338', '1507621944998', '2001', '2017-10-10 15:52:24插入的滚动新闻测试数据4', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('339', '1507621945088', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('340', '1507621945140', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据1', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('341', '1507621945201', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据2', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('342', '1507621945282', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据3', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('343', '1507621945343', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据4', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('344', '1507621945412', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据0', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('345', '1507621945468', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据1', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('346', '1507621945523', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据2', 'ssdftw', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('347', '1507621945585', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据3', 'wenchen10', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('348', '1507621945665', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据4', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('349', '1507621945741', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据0', 'wenchen2', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('350', '1507621945807', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据1', 'qwqwq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('351', '1507621945876', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据2', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('352', '1507621945932', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据3', 'wenchen1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('353', '1507621945993', '2001', '2017-10-10 15:52:25插入的滚动新闻测试数据4', 'wenchen7', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('354', '1507621946097', '2001', '2017-10-10 15:52:26插入的滚动新闻测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('355', '1507621946159', '2001', '2017-10-10 15:52:26插入的滚动新闻测试数据1', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('356', '1507621946215', '2001', '2017-10-10 15:52:26插入的滚动新闻测试数据2', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('357', '1507621946410', '2001', '2017-10-10 15:52:26插入的滚动新闻测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('358', '1507621947166', '2001', '2017-10-10 15:52:27插入的滚动新闻测试数据4', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('359', '1507621947848', '2001', '2017-10-10 15:52:27插入的滚动新闻测试数据0', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('360', '1507621947991', '2001', '2017-10-10 15:52:27插入的滚动新闻测试数据1', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('361', '1507621948160', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据2', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('362', '1507621948215', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据3', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('363', '1507621948277', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据4', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-10/html/366aa4e9ce8247f891bed14dd122b7e5.html', '', '1', 0x3C703E706172616D706172616D706172616D706172616D3C2F703E);
INSERT INTO `j_news` VALUES ('364', '1507621948346', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据0', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('365', '1507621948426', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据1', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('367', '1507621948560', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据3', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('368', '1507621948615', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据4', 'wenjiabao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('369', '1507621948687', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据0', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('370', '1507621948740', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据1', 'ssdftw', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('371', '1507621948818', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据2', '1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('372', '1507621948874', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据3', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('373', '1507621948935', '2001', '2017-10-10 15:52:28插入的滚动新闻测试数据4', 'DSDS', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('376', '1507624839395', '2001', '2017年10月10日16:40:20滚动新闻测试数据0003——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-10/html/ae84976e84f04740ba92e1464e6b1337.html', '', '4', 0x3C683320616C69676E3D226C656674223E4D656E75EFBC88E88F9CE58D95EFBC893C2F68333E3C7020616C69676E3D226C656674223EE4BDBFE794A8242E666E2E6D656E752E64656661756C7473E9878DE58699E9BB98E8AEA4E580BCE5AFB9E8B1A1E380823C2F703E3C7020616C69676E3D226C656674223EE88F9CE58D95E7BB84E4BBB6E9809AE5B8B8E794A8E4BA8EE5BFABE68DB7E88F9CE58D95E38082E4BB96E698AFE69E84E5BBBAE585B6E4BB96E88F9CE58D95E7BB84E4BBB6E79A84E5BF85E5A487E59FBAE7A180E7BB84E4BBB6E38082E6AF94E5A682EFBC9A6D656E75627574746F6EE5928C73706C6974627574746F6EE38082E5AE83E8BF98E58FAFE4BBA5E794A8E4BA8EE5AFBCE888AAE5928CE689A7E8A18CE591BDE4BBA4E380823C2F703E3C7020616C69676E3D226C656674223E3C696D67207372633D22223E200D0A3C2F703E3C683420616C69676E3D226C656674223E203C2F68343E3C683420616C69676E3D226C656674223EE4BDBFE794A8E6A188E4BE8B3C2F68343E3C683520616C69676E3D226C656674223EE5889BE5BBBAE88F9CE58D953C2F68353E3C7020616C69676E3D226C656674223EE9809AE8BF87E6A087E7ADBEE5889BE5BBBAE88F9CE58D95EFBC8CE7BB993C2F703E3C6469763E3C2F6469763EE6A087E7ADBEE6B7BBE58AA0E4B880E4B8AAE5908DE4B8BA276561737975692D6D656E7527E79A84E7B1BB4944E38082E6AF8FE4B8AAE88F9CE58D95E9A1B9E983BDE9809AE8BF873C6469763E3C2F6469763EE6A087E7ADBEE5889BE5BBBAE38082E68891E4BBACE58FAFE4BBA5E6B7BBE58AA02769636F6E436C7327E5B19EE680A7E69DA5E7BB99E88F9CE58D95E9A1B9E5AE9AE4B989E4B880E4B8AAE59BBEE6A087E698BEE7A4BAE588B0E88F9CE58D95E9A1B9E79A84E5B7A6E4BEA7E38082E6B7BBE58AA0276D656E752D73657027E7B1BB4944E88F9CE58D95E9A1B9E5B086E4BC9AE7949FE68890E4B880E4B8AAE88F9CE58D95E58886E589B2E7BABFE380823C703E3C2F703E3C64697620616C69676E3D226C656674223E0D0A3C64697620636C6173733D2264702D686967686C696768746572223E0D0A3C64697620636C6173733D22626172223E0D0A3C64697620636C6173733D22746F6F6C73223E3C2F6469763E3C2F6469763E0D0A3C6F6C20636C6173733D2264702D786D6C223E0D0A3C6C6920636C6173733D22616C74223E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E69643C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E226D6D223C2F666F6E743E3C2F7370616E3E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E636C6173733C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E226561737975692D6D656E75223C2F666F6E743E3C2F7370616E3E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E7374796C653C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E2277696474683A31323070783B223C2F666F6E743E3C2F7370616E3E3C7370616E20636C6173733D22746167223E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E2667743B3C2F666F6E743E3C2F7374726F6E673E3C2F7370616E3E2020200D0A3C2F6C693E3C6C693E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E4E65773C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C693E20202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E7370616E3C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E4F70656E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E7370616E3C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E7374796C653C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E2277696474683A31353070783B223C2F666F6E743E3C2F7370616E3E3C7370616E20636C6173733D22746167223E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E2667743B3C2F666F6E743E3C2F7374726F6E673E3C2F7370616E3E2020200D0A3C2F6C693E3C6C693E2020202020202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E623C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E576F72643C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E623C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E2020202020202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E457863656C3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C693E2020202020202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E506F776572506F696E743C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E20202020202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C693E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E646174612D6F7074696F6E733C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E2269636F6E436C733A2769636F6E2D7361766527223C2F666F6E743E3C2F7370616E3E3C7370616E20636C6173733D22746167223E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E2667743B3C2F666F6E743E3C2F7374726F6E673E3C2F7370616E3E536176653C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C693E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E203C7370616E20636C6173733D22617474726962757465223E3C666F6E7420636F6C6F723D2223666630303030223E636C6173733C2F666F6E743E3C2F7370616E3E3D3C7370616E20636C6173733D226174747269627574652D76616C7565223E3C666F6E7420636F6C6F723D2223303030306666223E226D656E752D736570223C2F666F6E743E3C2F7370616E3E3C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E2020200D0A3C2F6C693E3C6C6920636C6173733D22616C74223E202020203C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E266C743B3C2F7370616E3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E457869743C7374726F6E673E3C666F6E7420636F6C6F723D2223303036363939223E3C7370616E20636C6173733D22746167223E3C212D2D3C2F7370616E2D2D3E3C7370616E20636C6173733D227461672D6E616D65223E6469763C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F36342E6769662220616C743D225BE59BB4E8A7825D223E3C2F7370616E3E3C2F7370616E3E3C2F666F6E743E3C2F7374726F6E673E3C2F6C693E3C2F6F6C3E3C2F6469763E3C2F6469763E);
INSERT INTO `j_news` VALUES ('377', '1507691173039', '2001', '2017年10月11日11:05:50滚动新闻测试数据001——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-11/html/e73e9c3cd953422cac11e1d057a2fcc9.html', '', '6', 0x3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673E4E616D653C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E506172616D65746572733C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E4465736372697074696F6E3C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4265666F7265447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E4B98BE5898DE8A7A6E58F91EFBC8CE8BF94E59B9E66616C7365E5B086E58F96E6B688E68B96E58AA8E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E5374617274447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E79BAEE6A087E5AFB9E8B1A1E5BC80E5A78BE8A2ABE68B96E58AA8E697B6E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E8BF87E7A88BE4B8ADE8A7A6E58F91EFBC8CE5BD93E4B88DE883BDE5868DE68B96E58AA8E697B6E8BF94E59B9E66616C7365E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E53746F70447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643E3C703EE59CA8E68B96E58AA8E5819CE6ADA2E697B6E8A7A6E58F913C2F703E3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673E4E616D653C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E506172616D65746572733C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E4465736372697074696F6E3C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4265666F7265447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E4B98BE5898DE8A7A6E58F91EFBC8CE8BF94E59B9E66616C7365E5B086E58F96E6B688E68B96E58AA8E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E5374617274447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E79BAEE6A087E5AFB9E8B1A1E5BC80E5A78BE8A2ABE68B96E58AA8E697B6E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E8BF87E7A88BE4B8ADE8A7A6E58F91EFBC8CE5BD93E4B88DE883BDE5868DE68B96E58AA8E697B6E8BF94E59B9E66616C7365E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E53746F70447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643E3C703EE59CA8E68B96E58AA8E5819CE6ADA2E697B6E8A7A6E58F913C2F703E3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673E4E616D653C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E506172616D65746572733C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673E4465736372697074696F6E3C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4265666F7265447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E4B98BE5898DE8A7A6E58F91EFBC8CE8BF94E59B9E66616C7365E5B086E58F96E6B688E68B96E58AA8E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E5374617274447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E79BAEE6A087E5AFB9E8B1A1E5BC80E5A78BE8A2ABE68B96E58AA8E697B6E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E8BF87E7A88BE4B8ADE8A7A6E58F91EFBC8CE5BD93E4B88DE883BDE5868DE68B96E58AA8E697B6E8BF94E59B9E66616C7365E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E53746F70447261673C2F74643E0D0A3C74643E653C2F74643E0D0A3C74643EE59CA8E68B96E58AA8E5819CE6ADA2E697B6E8A7A6E58F91E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C703EE380823C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C703EE380823C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('378', '1507698744739', '1001', '2017-10-11 13:12:24插入的日看点左侧新闻测试数据0', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('379', '1507698745069', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('380', '1507698745331', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据2', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('381', '1507698745447', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据3', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('382', '1507698745502', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据4', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('383', '1507698745591', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('384', '1507698745652', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据1', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('385', '1507698745713', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据2', 'wenchen7', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('386', '1507698745797', '1001', '2017-10-11 13:12:25插入的日看点左侧新闻测试数据3', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('387', '1507698746034', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据4', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('388', '1507698746124', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据0', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('389', '1507698746185', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('390', '1507698746247', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据2', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('391', '1507698746302', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据3', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('392', '1507698746380', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据4', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('393', '1507698746464', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据0', 'wenchen12', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('394', '1507698746521', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据1', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('395', '1507698746586', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据2', 'adasz', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('396', '1507698746655', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据3', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('397', '1507698746738', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据4', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('398', '1507698746821', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据0', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('399', '1507698746880', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据1', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('400', '1507698746935', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('401', '1507698746997', '1001', '2017-10-11 13:12:26插入的日看点左侧新闻测试数据3', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('402', '1507698747052', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据4', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('403', '1507698747158', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据0', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('404', '1507698747210', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据1', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('405', '1507698747272', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('406', '1507698747327', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据3', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('407', '1507698747388', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据4', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('408', '1507698747471', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据0', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('409', '1507698747555', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据1', '1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('410', '1507698747619', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据2', 'wenchen1111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('411', '1507698747688', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据3', 'wenchen10', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('412', '1507698747744', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据4', 'wenjiabao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('413', '1507698747832', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据0', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('414', '1507698747897', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据1', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('415', '1507698747952', '1001', '2017-10-11 13:12:27插入的日看点左侧新闻测试数据2', 'ssdftw', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('416', '1507698748013', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据3', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('417', '1507698748069', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据4', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('418', '1507698748152', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据0', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('419', '1507698748211', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据1', 'qwqwq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('420', '1507698748289', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据2', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('421', '1507698748485', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据3', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('422', '1507698748547', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据4', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('423', '1507698748616', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('424', '1507698748672', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('425', '1507698748735', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据2', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('426', '1507698748822', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('427', '1507698748877', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据4', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('428', '1507698748955', '1001', '2017-10-11 13:12:28插入的日看点左侧新闻测试数据0', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('429', '1507698749010', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据1', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('430', '1507698749071', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据2', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('431', '1507698749127', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('432', '1507698749355', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据4', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('433', '1507698749502', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据0', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('434', '1507698749647', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据1', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('435', '1507698749702', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据2', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('436', '1507698749899', '1001', '2017-10-11 13:12:29插入的日看点左侧新闻测试数据3', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('437', '1507698750633', '1001', '2017-10-11 13:12:30插入的日看点左侧新闻测试数据4', 'ssdftw', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('438', '1507698750772', '1001', '2017-10-11 13:12:30插入的日看点左侧新闻测试数据0', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('439', '1507698750830', '1001', '2017-10-11 13:12:30插入的日看点左侧新闻测试数据1', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('440', '1507698750886', '1001', '2017-10-11 13:12:30插入的日看点左侧新闻测试数据2', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('441', '1507698751030', '1001', '2017-10-11 13:12:31插入的日看点左侧新闻测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('442', '1507698751227', '1001', '2017-10-11 13:12:31插入的日看点左侧新闻测试数据4', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('443', '1507698751464', '1001', '2017-10-11 13:12:31插入的日看点左侧新闻测试数据0', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('445', '1507698751577', '1001', '2017-10-11 13:12:31插入的日看点左侧新闻测试数据2', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('447', '1507698751694', '1001', '2017-10-11 13:12:31插入的日看点左侧新闻测试数据4', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('448', '1507699492336', '2001', '2017年10月11日13:24:29滚动新闻车市.0004——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-11/html/89d5aed77df748889577a8d3503ece1e.html', '', '7', 0x3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E3C74626F64793E3C74723E0D0A3C74643E6F6E53656C656374506167653C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE794A8E688B7E98089E68BA9E4B880E4B8AAE696B0E9A1B5E99DA2E79A84E697B6E58099E8A7A6E58F91E38082E59B9EE8B083E587BDE695B0E58C85E590AB32E4B8AAE58F82E695B0EFBC9A3C62723E706167654E756D626572EFBC9AE696B0E79A84E9A1B5E695B0E380823C62723E7061676553697A653A20E9A1B5E99DA2E5A4A7E5B08FEFBC88E6AF8FE9A1B5E698BEE7A4BAE79A84E69DA1E695B0EFBC89E38082200D0A3C703EE4BBA3E7A081E7A4BAE4BE8BEFBC9A3C2F703E3C7072653E24282723707027292E706167696E6174696F6E287B0D0A096F6E53656C656374506167653A66756E6374696F6E28706167654E756D6265722C207061676553697A65297B0D0A0909242874686973292E706167696E6174696F6E28276C6F6164696E6727293B0D0A0909616C6572742827706167654E756D6265723A272B706167654E756D6265722B272C7061676553697A653A272B7061676553697A65293B0D0A0909242874686973292E706167696E6174696F6E28276C6F6164656427293B0D0A097D0D0A7D293B0D0A3C2F7072653E3C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4265666F7265526566726573683C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE59CA8E782B9E587BBE588B7E696B0E68C89E992AEE588B7E696B0E4B98BE5898DE8A7A6E58F91EFBC8CE8BF94E59B9E66616C7365E58FAFE4BBA5E58F96E6B688E588B7E696B0E58AA8E4BD9CE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E526566726573683C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE588B7E696B0E4B98BE5908EE8A7A6E58F91E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('449', '1507699623335', '2001', '2017年10月11日13:26:45滚动新闻测试数据0005——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-11/html/c79edf77a9124a8abe326215f68c9d45.html', '', '4', 0x3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E3C74626F64793E3C74723E0D0A3C74643E6F6E53656C656374506167653C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE794A8E688B7E98089E68BA9E4B880E4B8AAE696B0E9A1B5E99DA2E79A84E697B6E58099E8A7A6E58F91E38082E59B9EE8B083E587BDE695B0E58C85E590AB32E4B8AAE58F82E695B0EFBC9A3C62723E706167654E756D626572EFBC9AE696B0E79A84E9A1B5E695B0E380823C62723E7061676553697A653A20E9A1B5E99DA2E5A4A7E5B08FEFBC88E6AF8FE9A1B5E698BEE7A4BAE79A84E69DA1E695B0EFBC89E38082200D0A3C703EE4BBA3E7A081E7A4BAE4BE8BEFBC9A3C2F703E3C7072653E24282723707027292E706167696E6174696F6E287B0D0A096F6E53656C656374506167653A66756E6374696F6E28706167654E756D6265722C207061676553697A65297B0D0A0909242874686973292E706167696E6174696F6E28276C6F6164696E6727293B0D0A0909616C6572742827706167654E756D6265723A272B706167654E756D6265722B272C7061676553697A653A272B7061676553697A65293B0D0A0909242874686973292E706167696E6174696F6E28276C6F6164656427293B0D0A097D0D0A7D293B0D0A3C2F7072653E3C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4265666F7265526566726573683C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE59CA8E782B9E587BBE588B7E696B0E68C89E992AEE588B7E696B0E4B98BE5898DE8A7A6E58F91EFBC8CE8BF94E59B9E66616C7365E58FAFE4BBA5E58F96E6B688E588B7E696B0E58AA8E4BD9CE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E526566726573683C2F74643E0D0A3C74643E706167654E756D6265722C207061676553697A653C2F74643E0D0A3C74643EE588B7E696B0E4B98BE5908EE8A7A6E58F91E380823C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F36312E6769662220616C743D225BE59BA75D223E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('451', '1507700128894', '2001', '2017年10月11日13:35:00日看点新闻测试数据0001——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/gdxw/2017-10-11/html/13c7393dc45d4bb292e50b236c67346c.html', '', '7', 0x3C683420616C69676E3D226C656674223EE5AFBCE585A5E2809C64617461677269642D63656C6C65646974696E672E6A73E2809DE69687E4BBB63C2F68343E3C64697620616C69676E3D226C656674223E3C70726520636C6173733D227072657474797072696E74206C696E656E756D73207072657474797072696E74656422206E616D653D22636F6465223E3C6F6C20636C6173733D226C696E656E756D73223E3C6C6920636C6173733D224C30223E3C7370616E20636C6173733D22746167223E266C743B7363726970743C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E747970653C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E22746578742F6A617661736372697074223C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E7372633C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E2264617461677269642D63656C6C65646974696E672E6A73223C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B266C743B2F7363726970742667743B3C2F7370616E3E3C2F6C693E3C2F6F6C3E3C2F7072653E0D0A3C68343EE590AFE794A8E58D95E58583E6A0BCE7BC96E8BE91E599A83C2F68343E3C70726520636C6173733D227072657474797072696E74206C696E656E756D73207072657474797072696E74656422206E616D653D22636F6465223E3C6F6C20636C6173733D226C696E656E756D73223E3C6C6920636C6173733D224C30223E3C7370616E20636C6173733D22706C6E223E243C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D22737472223E27236467273C2F7370616E3E3C7370616E20636C6173733D2270756E223E292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E64617461677269643C2F7370616E3E3C7370616E20636C6173733D2270756E223E287B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C31223E3C7370616E20636C6173733D22706C6E223E20202020646174613C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E20646174613C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C32223E3C7370616E20636C6173733D2270756E223E7D292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E64617461677269643C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D22737472223E27656E61626C6543656C6C45646974696E67273C2F7370616E3E3C7370616E20636C6173733D2270756E223E292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E64617461677269643C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D22737472223E27676F746F43656C6C273C2F7370616E3E3C7370616E20636C6173733D2270756E223E2C3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2270756E223E7B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C33223E3C7370616E20636C6173733D22706C6E223E20202020696E6465783C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D226C6974223E303C2F7370616E3E3C7370616E20636C6173733D2270756E223E2C3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C34223E3C7370616E20636C6173733D22706C6E223E202020206669656C643C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D22737472223E2770726F647563746964273C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C35223E3C7370616E20636C6173733D2270756E223E7D293B3C2F7370616E3E3C2F6C693E3C2F6F6C3E3C2F7072653E3C2F6469763E3C683420616C69676E3D226C656674223EE4BA8BE4BBB63C2F68343E3C703E0D0A0D0AE4BA8BE4BBB6E689A9E5B195E887AA206461746167726964EFBC8C3C666F6E7420666163653D2256657264616E61223EE4BBA5E4B88BE698AFE69CACE68F92E4BBB6E696B0E5A29EE4BA8BE4BBB6E380823C2F666F6E743E200D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673EE4BA8BE4BBB6E5908D3C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE58F82E695B03C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE68F8FE8BFB03C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E3C7370616E3E6F6E43656C6C456469743C2F7370616E3E3C2F74643E0D0A3C74643E3C7370616E3E696E6465782C6669656C642C76616C75653C2F7370616E3E3C2F74643E0D0A3C74643EE59CA8E7BC96E8BE91E58D95E58583E6A0BCE79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C683420616C69676E3D226C656674223E203C2F68343E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C703E0D0A0D0A0D0A3C2F703E3C7020616C69676E3D226C656674223EE696B9E6B395E689A9E5B195E887AA206461746167726964EFBC8C3C666F6E7420666163653D2256657264616E61223EE4BBA5E4B88BE698AFE69CACE68F92E4BBB6E696B0E5A29EE696B9E6B395E380823C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F35302E6769662220616C743D225BE7868AE78CAB5D223E3C2F666F6E743E3C2F703E);
INSERT INTO `j_news` VALUES ('452', '1507700540190', '1001', '2017年10月11日13:41:47日看点新闻测试数据0002——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/rkdxw/2017-10-11/html/d9a277e648164bdba2d4a0cf26af3e88.html', '', '2', 0x3C703E2F2A2AE7BC96E8BE91E6BB9AE58AA8E696B0E997BB3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20312EE58588E5B086E69687E4BBB6E4B88AE4BCA0E588B0E69C8DE58AA1E599A83C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20322EE6A0B9E68DAE7477646DE69BB4E696B06A6E657773E4B8ADE79A84E4B880E69DA1E8AEB0E5BD953C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20332EE59CA86C5F6E657773E4B8ADE68F92E585A5E4B880E69DA1E8AEB0E5BD95EFBC9A3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20646DEFBC9A646D3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20637A723AE5BD93E5898DE794A8E688B73C2F703E3C703E3C7370616E3E093C2F7370616E3E202A206F6C645F7A743AE5BD93E5898DE78AB6E680813C2F703E3C703E3C7370616E3E093C2F7370616E3E202A206E65775F7A743AE5BD93E5898DE78AB6E680813C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2072656D61726B3AE5A4A7E59BBEE69687EFBC88266C743B646D2667743BEFBC89E4BA8E266C743BE7B3BBE7BB9FE697B6E997B42667743BE8A2AB266C743B637A722667743BE8BF9BE8A18CE4BFAEE694B9EFBC8CE78EB0E5A484E4BA8E266C743BE5BD93E5898DE78AB6E680812667743BE78AB6E68081E380823C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D2073657373696F6E3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D20637A723C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D207469746C653C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D20636F6E74656E743C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D2066696C653C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20407468726F777320494F457863657074696F6E3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20407468726F7773204F706572457863657074696F6E266E6273703B3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2F3C2F703E3C703E3C7370616E3E093C2F7370616E3E405472616E73616374696F6E616C28726F6C6C6261636B466F723D457863657074696F6E2E636C617373293C2F703E3C703E3C7370616E3E093C2F7370616E3E7075626C696320766F696420656469744764787720284874747053657373696F6E2073657373696F6E2C537472696E6720646D2C537472696E67207469746C652C537472696E6720637A722C537472696E6720636F6E74656E7429207468726F777320494F457863657074696F6E2C204F706572457863657074696F6E207B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E2F2FE5B086E59BBEE78987E4B88AE4BCA0EFBC8CE784B6E5908EE8BF94E59B9EE59BBEE78987E79A84E79BB8E585B3E4BFA1E681AF3C2F703E3C703E3C7370616E3E09093C2F7370616E3E557365722075736572203D2028557365722973657373696F6E2E67657441747472696275746528436F6E7374616E74732E41444D494E5F4C4F47494E5F494E464F293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E536572766C6574436F6E7465787420736572766C6574436F6E74657874203D2073657373696F6E2E676574536572766C6574436F6E7465787428293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E537472696E67207365727665725265616C50617468203D20736572766C6574436F6E746578742E6765745265616C50617468282222293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E2F2F68746D6CE79A84E8B7AFE5BE843C2F703E3C703E3C7370616E3E09093C2F7370616E3E537472696E672066696C6550617468203D20537472696E672E666F726D61742841646D696E50726F706572746965732E474458575F48544D4C5F544152474449522C207364662E666F726D6174286E65772044617465282929293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E2F2F68746D6CE79A84E5908DE5AD973C2F703E3C703E3C7370616E3E09093C2F7370616E3E537472696E672066696C654E616D65203D20537472696E675574696C732E67657453686F72745555494428292B222E68746D6C223B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E2F2FE7949FE68890E5AFB9E5BA94E79A8468746D6CE69687E4BBB63C2F703E3C703E3C7370616E3E09093C2F7370616E3E41646D696E5574696C732E67656E48746D6C28636F6E74656E742C207469746C652C207365727665725265616C506174682B66696C65506174682C2066696C654E616D65293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E747279207B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E2F2FE69BB4E696B06A6E6577733C2F703E3C703E3C7370616E3E0909093C2F7370616E3E4A4E657773207265636F7264203D206E6577204A4E65777328293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E736574446D28646D293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F7264203D206A4E65777344616F2E73656C656374287265636F7264293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E736574446D28646D293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E7365745469746C65287469746C65293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E73657453717228757365722E676574556E616D652829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E736574487265662841646D696E50726F706572746965732E5345525645525F55524C2B66696C65506174682B222F222B66696C654E616D65293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E73657452656D61726B28636F6E74656E742E676574427974657328227574662D382229293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6A4E65777344616F2E75706461746542795072696D6172794B657953656C656374697665287265636F7264293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E2F2FE59CA86C5F6E657773E4B8ADE68F92E585A5E4B880E69DA1E8AEB0E5BD953C2F703E3C703E3C7370616E3E0909093C2F7370616E3E4C4E657773206C6E6577733D206E6577204C4E65777328293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E736574446D28646D293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E736574437A7228637A72293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E7365744F6C645A74287265636F72642E6765745A742829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E7365744E65775A74287265636F72642E6765745A742829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E537472696E674275696C6465722072656D61726B5362203D206E657720537472696E674275696C64657228293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E72656D61726B53622E617070656E642822E6BB9AE58AA8E696B0E997BB22292E617070656E6428222822292E617070656E64287265636F72642E676574446D2829292E617070656E6428222922293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E72656D61726B53622E617070656E642822E4BA8E22292E617070656E6428446174655574696C732E746F537472696E67286E65772044617465282929292E617070656E642822E8A2AB22292E617070656E6428637A72293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E72656D61726B53622E617070656E642822E8BF9BE8A18CE4BFAEE694B9EFBC8CE78EB0E5A484E4BA8E22292E617070656E642858575A542E76616C75654F66287265636F72642E6765745A7428292D3129292E617070656E642822E78AB6E6808122293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E73657452656D61726B2872656D61726B53622E746F537472696E672829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C4E65777344616F2E696E7365727453656C656374697665286C6E657773293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E7D2063617463682028457863657074696F6E206529207B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E652E7072696E74537461636B547261636528293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7468726F77206E6577204F706572457863657074696F6E28E7BC96E8BE91E6BB9AE58AA8E696B0E997BBE5A4B1E8B4A5293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E09093C2F7370616E3E3C2F703E3C703E3C7370616E3E093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E093C2F7370616E3E3C2F703E3C703E3C7370616E3E093C2F7370616E3E2F2A2A3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20E6BB9AE58AA8E696B0E997BBE4B88AE69EB63C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D207477646D3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2040706172616D20637A723C2F703E3C703E3C7370616E3E093C2F7370616E3E202A204072657475726E3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A266E6273703B3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20312EE5B0866A5F6E657773E4B8ADE79A84E8AEB0E5BD95E79A84E78AB6E68081E58F98E4B8BAE4B880E5AEA1E4B8AD3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20322EE59CA86C5F6E657773E4B8ADE68F92E585A5E4B880E69DA1E8AEB0E5BD95EFBC9A3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20646174653A20E5BD93E5898DE7B3BBE7BB9FE697B6E997B43C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20646D20EFBC9A207477646D3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20637A723A20E5BD93E5898DE794A8E688B7E79A84756E616D65EFBC88637A72EFBC893C2F703E3C703E3C7370616E3E093C2F7370616E3E202A206F6C647A743A206E756C6C3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A206E65777A743A20E4B880E5AEA1E4B8AD3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2072656D61726B3AE6BB9AE58AA8E696B0E997BBEFBC88266C743B7477646D2667743BEFBC89E4B88E266C743BE7B3BBE7BB9FE697B6E997B42667743BE8A2ABE68F90E4BAA4EFBC8CE78EB0E5A484E4BA8EE4B880E5AEA1E4B8AD3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A20407468726F7773204F706572457863657074696F6E266E6273703B3C2F703E3C703E3C7370616E3E093C2F7370616E3E202A2F3C2F703E3C703E3C7370616E3E093C2F7370616E3E405472616E73616374696F6E616C28726F6C6C6261636B466F723D457863657074696F6E2E636C617373293C2F703E3C703E3C7370616E3E093C2F7370616E3E7075626C696320766F696420736A476478772028537472696E6720646D2C537472696E6720637A7229207468726F7773204F706572457863657074696F6E207B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E747279207B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E2F2FE5B0867A74E694B9E4B8BAE4B880E5AEA1E4B8AD3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E4A4E657773207265636F7264203D206E6577204A4E65777328293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E736574446D28646D293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F7264203D206A4E65777344616F2E73656C656374287265636F7264293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E4C4E657773206C6E657773203D6E6577204C4E65777328293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E7365744F6C645A74287265636F72642E6765745A742829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7265636F72642E7365745A742858575A542EE4B880E5AEA1E4B8AD2E67657456616C75652829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6A4E65777344616F2E75706461746542795072696D6172794B6579287265636F7264293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E2F2FE59CA86C5F7265636F7264E4B8ADE68F92E585A5E79BB8E585B3E8AEB0E5BD953C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E73657444617465286E657720446174652829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E736574446D28646D293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E736574437A7228637A72293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E7365744E65775A742858575A542EE4B880E5AEA1E4B8AD2E67657456616C75652829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E537472696E674275696C64657220726573756C745362203D206E657720537472696E674275696C64657228293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E726573756C7453622E617070656E642822E6BB9AE58AA8E696B0E997BBEFBC8822292E617070656E6428646D292E617070656E642822EFBC8922293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E726573756C7453622E617070656E642822E4BA8E22292E617070656E6428537472696E675574696C732E6765744375727254696D652829292E617070656E642822E8A2AB22292E617070656E6428637A72292E617070656E642822E68F90E4BAA4EFBC8CE78EB0E5A484E4BA8E22292E617070656E642858575A542EE4B880E5AEA1E4B8AD293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C6E6577732E73657452656D61726B28726573756C7453622E746F537472696E672829293B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E6C4E65777344616F2E696E7365727453656C656374697665286C6E657773293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E7D2063617463682028457863657074696F6E206529207B3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7468726F77206E6577204F706572457863657074696F6E28E4B88AE69EB6E6BB9AE58AA8E696B0E997BBE5A4B1E8B4A5293B3C2F703E3C703E3C7370616E3E09093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E09093C2F7370616E3E3C2F703E3C703E3C7370616E3E093C2F7370616E3E7D3C2F703E);
INSERT INTO `j_news` VALUES ('453', '1507701406508', '1001', '2017年10月11日13:56:20日看点新闻测试数据——文臣', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/rkdxw/2017-10-11/html/bad05deafb824a1bb1be404f4b835af1.html', '', '4', 0x3C683320616C69676E3D226C656674223E54616273EFBC88E98089E9A1B9E58DA1EFBC893C2F68333E3C7020616C69676E3D226C656674223EE4BDBFE794A8242E666E2E746162732E64656661756C7473E9878DE58699E9BB98E8AEA4E580BCE5AFB9E8B1A1E380823C2F703E3C7020616C69676E3D226C656674223EE98089E9A1B9E58DA1E698BEE7A4BAE4B880E689B9E99DA2E69DBFE38082E4BD86E59CA8E5908CE4B880E4B8AAE697B6E997B4E58FAAE4BC9AE698BEE7A4BAE4B880E4B8AAE99DA2E69DBFE38082E6AF8FE4B8AAE98089E9A1B9E58DA1E99DA2E69DBFE983BDE69C89E5A4B4E6A087E9A298E5928CE4B880E4BA9BE5B08FE79A84E68C89E992AEE5B7A5E585B7E88F9CE58D95EFBC8CE58C85E68BACE585B3E997ADE68C89E992AEE5928CE585B6E4BB96E887AAE5AE9AE4B989E68C89E992AEE380823C2F703E3C7020616C69676E3D226C656674223E3C696D67207372633D22223E200D0A3C2F703E3C683420616C69676E3D226C656674223E203C2F68343E3C683420616C69676E3D226C656674223EE4BE9DE8B596E585B3E7B3BB3C2F68343E3C756C3E0D0A3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C6120687265663D22223E70616E656C3C2F613E3C2F6469763E0D0A3C2F6C693E3C6C693E0D0A3C64697620616C69676E3D226C656674223E3C6120687265663D22223E6C696E6B627574746F6E3C2F613E3C2F6469763E3C2F6C693E3C2F756C3E3C683420616C69676E3D226C656674223E203C2F68343E3C683420616C69676E3D226C656674223EE4BDBFE794A8E6A188E4BE8B3C2F68343E3C683520616C69676E3D226C656674223EE5889BE5BBBAE99DA2E69DBF3C2F68353E3C7020616C69676E3D226C656674223E312E20E9809AE8BF87E6A087E7ADBEE5889BE5BBBAE98089E9A1B9E58DA13C2F703E3C703E0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A0D0A3C2F703E3C7020616C69676E3D226C656674223EE9809AE8BF87E6A087E7ADBEE58FAFE4BBA5E69BB4E5AEB9E69893E79A84E5889BE5BBBAE98089E9A1B9E58DA1EFBC8CE68891E4BBACE4B88DE99C80E8A681E58699E4BBBBE4BD954A617661736372697074E4BBA3E7A081E38082E58FAAE99C80E8A681E7BB99266C743B6469762F2667743BE6A087E7ADBEE6B7BBE58AA0E4B880E4B8AAE7B1BB4944276561737975692D7461627327E38082E6AF8FE4B8AAE98089E9A1B9E58DA1E99DA2E69DBFE983BDE9809AE8BF87E5AD90266C743B6469762F2667743BE6A087E7ADBEE8BF9BE8A18CE5889BE5BBBAEFBC8CE794A8E6B395E5928C70616E656C28E99DA2E69DBF29E79BB8E5908CE380823C2F703E);
INSERT INTO `j_news` VALUES ('454', '1523430321991', '1001', '车是测试好爱好', 'wenchen', '', 'http://localhost:8080/admin_6ha/xw/rkdxw/2018-04-11/html/aed03e895ebe4951b97edd82b4cc53f5.html', '', '4', 0x3C703E3C693EE8BDA6E698AFE6B58BE8AF953C2F693E3C2F703E3C703E3C693EE8BDA6E698AFE6B58BE8AF953C2F693E3C2F703E3C703E3C737472696B653EE8BDA6E698AFE6B58BE8AF95E8BDA63C2F737472696B653E3C753EE698AFE6B58BE8AF95E8BDA6E698AFE6B58BE8AF953C2F753E3C2F703E3C703E3C753E763C2F753E3C2F703E3C703EE8BDA6E698AFE6B58B3C623EE8AF95E8BDA6E698AFE6B58BE8AF95E8BDA63C2F623EE698AFE6B58BE8AF953C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F36342E6769662220616C743D225BE59BB4E8A7825D223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F74656D702F323031382D30342D31312F7069632F35623935326434663237346134646135623632316534646163346335653230352E6A70672220616C743D226E756C6C223E3C62723E3C2F703E);

-- ----------------------------
-- Table structure for j_pic
-- ----------------------------
DROP TABLE IF EXISTS `j_pic`;
CREATE TABLE `j_pic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(255) DEFAULT NULL,
  `yxlx` varchar(255) DEFAULT NULL,
  `pic_lx` int(11) DEFAULT NULL COMMENT '用于区分图片的类型',
  `num` int(11) DEFAULT '0',
  `imgUrl` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_pic
-- ----------------------------
INSERT INTO `j_pic` VALUES ('80', '光明大陆', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qBSIPrblulrDrfs.jpg', 'http://news.17173.com/content/07272017/070031706_1.shtml');
INSERT INTO `j_pic` VALUES ('81', 'CS:GO', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/xXLDryblvFisjhn.jpg', 'http://csgo.17173.com/');
INSERT INTO `j_pic` VALUES ('82', '黑暗与光明', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EWExwObluliyCtF.jpg', 'http://newgame.17173.com/game-info-11565.html');
INSERT INTO `j_pic` VALUES ('83', '初音速', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NosIBYbluggCrAs.jpg', 'http://news.17173.com/content/07272017/100032462_1.shtml');
INSERT INTO `j_pic` VALUES ('84', '萌王EX', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/TINFTnbluggCrtc.jpg', 'http://newgame.17173.com/game-info-4044757.html');
INSERT INTO `j_pic` VALUES ('85', '黑色沙漠', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GzburGbluljeofh.jpg', 'http://news.17173.com/content/07272017/113313368.shtml');
INSERT INTO `j_pic` VALUES ('86', '终结者2：审判日', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FgDniAbluggCrsD.jpg', 'http://newgame.17173.com/game-info-4047622.html');
INSERT INTO `j_pic` VALUES ('87', '超凡战纪', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kxxYqvblvFhxlcq.jpg', 'http://newgame.17173.com/game-info-1000568.html');
INSERT INTO `j_pic` VALUES ('88', '梦想世界3D', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hgiAsMblvFhDygi.jpg', 'http://newgame.17173.com/game-info-4046388.html');
INSERT INTO `j_pic` VALUES ('89', '泰坦黎明', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FSSmLXbluggCpCp.jpg', 'http://news.17173.com/content/07282017/143808681.shtml');
INSERT INTO `j_pic` VALUES ('90', '神之物语', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yMXHAxblvFhAhkF.jpg', 'http://newgame.17173.com/game-info-4052206.html');
INSERT INTO `j_pic` VALUES ('91', '剑网3重置版', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/wTYCTebluljlyAx.jpg', 'http://news.17173.com/content/07272017/164043916.shtml');
INSERT INTO `j_pic` VALUES ('92', '传奇永恒', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fvWRisblvFgjnaw.jpg', 'http://cqyh.17173.com/');
INSERT INTO `j_pic` VALUES ('93', '天启联盟', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qixMsrbluggCrBr.jpg', 'http://newgame.17173.com/game-info-4047431.html');
INSERT INTO `j_pic` VALUES ('94', '野良神：宿命', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/UuVMBtblwbmehyz.jpg', 'http://news.17173.com/content/07252017/095937018.shtml');
INSERT INTO `j_pic` VALUES ('95', '天堂2：誓言', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JIjOpoblugqqidj.jpg', 'http://newgame.17173.com/game-info-4048832.html');
INSERT INTO `j_pic` VALUES ('96', '我的恐龙GO', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yYSnESbluggCrta.jpg', 'http://newgame.17173.com/game-info-4047954.html');
INSERT INTO `j_pic` VALUES ('97', '拳皇命运', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/mEsbdsbluggCrsC.jpg', 'http://news.17173.com/content/07282017/165401495.shtml');
INSERT INTO `j_pic` VALUES ('98', '欢乐球吃球', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/OMGSRobluggCpEj.jpg', 'http://newgame.17173.com/game-info-4051945.html');
INSERT INTO `j_pic` VALUES ('99', '诛仙手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WWElRxblwdnAljp.jpg', 'http://newgame.17173.com/game-info-4042741.html');
INSERT INTO `j_pic` VALUES ('100', '石器时代手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QGgeOubluggCpzr.jpg', 'http://news.17173.com/content/07272017/152112174_1.shtml');
INSERT INTO `j_pic` VALUES ('101', '神无月', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eBNBewbluggCrta.jpg', 'http://news.17173.com/content/07302017/071153899.shtml');
INSERT INTO `j_pic` VALUES ('102', '第五人格', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/alPAIdbluggCrta.jpg', 'http://newgame.17173.com/game-info-4051732.html');
INSERT INTO `j_pic` VALUES ('103', '轩辕剑手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NAQrdnbluggCpta.jpg', 'http://newgame.17173.com/game-info-4051816.html');
INSERT INTO `j_pic` VALUES ('104', '轮回诀', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kczjLKbluggCpvc.jpg', 'http://news.17173.com/content/07292017/130529787_1.shtml');
INSERT INTO `j_pic` VALUES ('105', '黑暗与光明手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kAnkiQbluggCpuv.jpg', 'http://news.17173.com/content/07292017/140305892.shtml');
INSERT INTO `j_pic` VALUES ('106', null, null, '2', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/iulmWWblwivatvm.gif', 'http://news.17173.com/content/07302017/014000966_1.shtml');
INSERT INTO `j_pic` VALUES ('107', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SXCJJwblwgaAnuw.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml');
INSERT INTO `j_pic` VALUES ('108', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nftHyCblwgaBiBv.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml');
INSERT INTO `j_pic` VALUES ('109', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EnmluUblwgbhBzF.gif', 'http://news.17173.com/content/07292017/015958867_6.shtml');
INSERT INTO `j_pic` VALUES ('110', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GWikKlblwgbjbBs.gif', 'http://news.17173.com/content/07292017/015958867_4.shtml');
INSERT INTO `j_pic` VALUES ('111', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jckWTxblwgcwCwB.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml');
INSERT INTO `j_pic` VALUES ('112', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pwpuXgblwgcxvCo.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml');
INSERT INTO `j_pic` VALUES ('113', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/KhnYlpblwgdajwC.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml');
INSERT INTO `j_pic` VALUES ('114', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gTWLYablwgcyBdc.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml');
INSERT INTO `j_pic` VALUES ('115', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yxKFndblwgbkiEm.gif', 'http://news.17173.com/content/07292017/015958867_2.shtml');
INSERT INTO `j_pic` VALUES ('116', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pJLhwCblwgbnywc.gif', 'http://news.17173.com/content/07292017/015958867_7.shtml');
INSERT INTO `j_pic` VALUES ('117', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/lVgBBKblwgbrdAn.gif', 'http://news.17173.com/content/07292017/015958867_8.shtml');
INSERT INTO `j_pic` VALUES ('118', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WkUEKPblwgbuxmq.gif', 'http://news.17173.com/content/07292017/015958867_10.shtml');
INSERT INTO `j_pic` VALUES ('119', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/LyRrHxblwdrgAFz.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml');
INSERT INTO `j_pic` VALUES ('120', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zcMuMeblwdrulqp.gif', 'http://news.17173.com/content/07282017/013056606_12.shtml');
INSERT INTO `j_pic` VALUES ('121', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XTRVQyblwdrBizp.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml');
INSERT INTO `j_pic` VALUES ('122', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AaGQzNblwdsdflo.gif', 'http://news.17173.com/content/07282017/013056606_11.shtml');
INSERT INTO `j_pic` VALUES ('123', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/uYuXrTblwivoubs.gif', 'http://news.17173.com/content/07302017/014000966_3.shtml');
INSERT INTO `j_pic` VALUES ('124', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fsLXIVblwivjioq.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml');
INSERT INTO `j_pic` VALUES ('125', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WJoAAzblwivfAqE.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml');
INSERT INTO `j_pic` VALUES ('126', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/apKNLOblwdtezgz.gif', 'http://news.17173.com/content/07282017/013056606_10.shtml');
INSERT INTO `j_pic` VALUES ('127', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hxXxvpblwcpqDbg.jpg', 'http://news.17173.com/content/07272017/215124983_1.shtml');
INSERT INTO `j_pic` VALUES ('128', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QJYArRblwoqafza.jpg', 'http://news.17173.com/content/07312017/151624373_4.shtml');
INSERT INTO `j_pic` VALUES ('129', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/akypJsblwmejxaF.jpg', 'http://news.17173.com/content/07312017/151624373_2.shtml');
INSERT INTO `j_pic` VALUES ('130', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/BeTVGlblwmekCyd.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml');
INSERT INTO `j_pic` VALUES ('131', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qCkCaJblwmeitpg.jpg', 'http://news.17173.com/content/07312017/151624373_1.shtml');
INSERT INTO `j_pic` VALUES ('132', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/Xulcxrblwmepfjv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml');
INSERT INTO `j_pic` VALUES ('133', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dKzSXPblwmemadA.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml');
INSERT INTO `j_pic` VALUES ('134', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GUYApQblwmeqsmf.jpg', 'http://news.17173.com/content/07312017/151624373_7.shtml');
INSERT INTO `j_pic` VALUES ('135', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eilXkYblwmeoamv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml');
INSERT INTO `j_pic` VALUES ('136', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cuECOeblwfFewcB.jpg', 'http://news.17173.com/content/07292017/002210788_5.shtml');
INSERT INTO `j_pic` VALUES ('137', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aYhGXeblwfFBFFr.jpg', 'http://news.17173.com/content/07292017/023153162_4.shtml');
INSERT INTO `j_pic` VALUES ('138', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/immzzbblwbptuyo.jpg', 'http://news.17173.com/content/07272017/142306104_1.shtml');
INSERT INTO `j_pic` VALUES ('139', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/PxzJvrblwfFuEFB.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml');
INSERT INTO `j_pic` VALUES ('140', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JbBhydblwfFislu.jpg', 'http://news.17173.com/content/07292017/002210788_6.shtml');
INSERT INTO `j_pic` VALUES ('141', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cLROCTblwfFlkpw.jpg', 'http://news.17173.com/content/07292017/002210788_1.shtml');
INSERT INTO `j_pic` VALUES ('142', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eGwaxcblwgdqijD.jpg', 'http://news.17173.com/content/07282017/230846744_1.shtml');
INSERT INTO `j_pic` VALUES ('143', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QtONuCblwgdrxil.jpg', 'http://news.17173.com/content/07282017/230846744_2.shtml');
INSERT INTO `j_pic` VALUES ('144', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pOBrFXblwgdtlkp.jpg', 'http://news.17173.com/content/07282017/230846744_3.shtml');
INSERT INTO `j_pic` VALUES ('145', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jmbezFblwgdyjDs.jpg', 'http://news.17173.com/content/07282017/230846744_4.shtml');
INSERT INTO `j_pic` VALUES ('146', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/DKApYoblwgdAoiu.jpg', 'http://news.17173.com/content/07282017/230846744_6');
INSERT INTO `j_pic` VALUES ('147', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pfXsSkblwfFmmfq.jpg', 'http://news.17173.com/content/07292017/002210788_2.shtml');
INSERT INTO `j_pic` VALUES ('148', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nAUOlAblwfFpjto.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml');
INSERT INTO `j_pic` VALUES ('149', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WmnuJCblwcpyCEs.jpg', 'http://news.17173.com/content/07272017/165956729_6.shtml');
INSERT INTO `j_pic` VALUES ('150', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dqxWezblwfFwEak.jpg', 'http://news.17173.com/content/07292017/002210788_9.shtml');
INSERT INTO `j_pic` VALUES ('151', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aMHAFkblwcpsAbz.jpg', 'http://news.17173.com/content/07272017/215124983_2.shtml');
INSERT INTO `j_pic` VALUES ('152', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GoeNsNblwcpFehv.jpg', 'http://news.17173.com/content/07272017/165956729_7.shtml');
INSERT INTO `j_pic` VALUES ('153', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XvKCbcblwbpyupl.jpg', 'http://news.17173.com/content/07272017/104851923_3.shtml');
INSERT INTO `j_pic` VALUES ('154', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NtPaWablwbpBkCa.jpg', 'http://news.17173.com/content/07272017/104851923_7.shtml');
INSERT INTO `j_pic` VALUES ('155', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gDygbyblwbpCynn.jpg', 'http://news.17173.com/content/07272017/104851923_9.shtml');
INSERT INTO `j_pic` VALUES ('156', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/VMDugAblwbpEcEg.jpg', 'http://news.17173.com/content/07272017/104851923_11.shtml');
INSERT INTO `j_pic` VALUES ('157', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/rKJLVDblvFByaCe.png', 'http://news.17173.com/content/07242017/162505854_1.shtml');
INSERT INTO `j_pic` VALUES ('158', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FwANVQblvFBBgoC.png', 'http://news.17173.com/content/07242017/162505854_6.shtml');

-- ----------------------------
-- Table structure for j_tp
-- ----------------------------
DROP TABLE IF EXISTS `j_tp`;
CREATE TABLE `j_tp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dm` varchar(255) DEFAULT NULL,
  `lx` int(2) DEFAULT NULL COMMENT '这里用到的是枚举类TPLX中的值',
  `sqr` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '游戏的图片链接',
  `href` varchar(255) DEFAULT NULL COMMENT '游戏专题报道的链接',
  `zt` int(2) DEFAULT NULL COMMENT '图片状态，这里用枚举类XWZT中的值',
  `remark` blob COMMENT '图片说明，在审批的时候要用到',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_tp
-- ----------------------------
INSERT INTO `j_tp` VALUES ('1', '00001', '2', 'wenchen', '2018-04-11 15:11:42', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/iulmWWblwivatvm.gif', 'http://news.17173.com/content/07302017/014000966_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('2', '00002', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SXCJJwblwgaAnuw.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('3', '00003', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nftHyCblwgaBiBv.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('4', '00004', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EnmluUblwgbhBzF.gif', 'http://news.17173.com/content/07292017/015958867_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('5', '00005', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GWikKlblwgbjbBs.gif', 'http://news.17173.com/content/07292017/015958867_4.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('6', '00006', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jckWTxblwgcwCwB.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('7', '00007', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pwpuXgblwgcxvCo.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('8', '00008', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/KhnYlpblwgdajwC.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('9', '00009', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gTWLYablwgcyBdc.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('10', '000010', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yxKFndblwgbkiEm.gif', 'http://news.17173.com/content/07292017/015958867_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('11', '000011', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pJLhwCblwgbnywc.gif', 'http://news.17173.com/content/07292017/015958867_7.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('12', '000012', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/lVgBBKblwgbrdAn.gif', 'http://news.17173.com/content/07292017/015958867_8.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('13', '000013', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WkUEKPblwgbuxmq.gif', 'http://news.17173.com/content/07292017/015958867_10.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('14', '000014', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/LyRrHxblwdrgAFz.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('15', '000015', '3', 'wenchen', '2018-04-11 15:11:47', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zcMuMeblwdrulqp.gif', 'http://news.17173.com/content/07282017/013056606_12.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('16', '000016', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XTRVQyblwdrBizp.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('17', '000017', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AaGQzNblwdsdflo.gif', 'http://news.17173.com/content/07282017/013056606_11.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('18', '000018', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/uYuXrTblwivoubs.gif', 'http://news.17173.com/content/07302017/014000966_3.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('19', '000019', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fsLXIVblwivjioq.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('20', '000020', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WJoAAzblwivfAqE.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('21', '000021', '3', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/apKNLOblwdtezgz.gif', 'http://news.17173.com/content/07282017/013056606_10.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('22', '000022', '4', 'wenchen', '2018-04-11 15:09:18', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hxXxvpblwcpqDbg.jpg', 'http://news.17173.com/content/07272017/215124983_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('23', '000023', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QJYArRblwoqafza.jpg', 'http://news.17173.com/content/07312017/151624373_4.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('24', '000024', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/akypJsblwmejxaF.jpg', 'http://news.17173.com/content/07312017/151624373_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('25', '000025', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/BeTVGlblwmekCyd.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('26', '000026', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qCkCaJblwmeitpg.jpg', 'http://news.17173.com/content/07312017/151624373_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('27', '000027', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/Xulcxrblwmepfjv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('28', '000028', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dKzSXPblwmemadA.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('29', '000029', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GUYApQblwmeqsmf.jpg', 'http://news.17173.com/content/07312017/151624373_7.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('30', '000030', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eilXkYblwmeoamv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('31', '000031', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cuECOeblwfFewcB.jpg', 'http://news.17173.com/content/07292017/002210788_5.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('32', '000032', '4', 'wenchen', '2018-04-11 15:07:36', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aYhGXeblwfFBFFr.jpg', 'http://news.17173.com/content/07292017/023153162_4.shtml', '1', null);
INSERT INTO `j_tp` VALUES ('33', '000033', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/immzzbblwbptuyo.jpg', 'http://news.17173.com/content/07272017/142306104_1.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('34', '000034', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/PxzJvrblwfFuEFB.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('35', '000035', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JbBhydblwfFislu.jpg', 'http://news.17173.com/content/07292017/002210788_6.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('36', '000036', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cLROCTblwfFlkpw.jpg', 'http://news.17173.com/content/07292017/002210788_1.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('37', '000037', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eGwaxcblwgdqijD.jpg', 'http://news.17173.com/content/07282017/230846744_1.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('38', '000038', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QtONuCblwgdrxil.jpg', 'http://news.17173.com/content/07282017/230846744_2.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('39', '000039', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pOBrFXblwgdtlkp.jpg', 'http://news.17173.com/content/07282017/230846744_3.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('40', '000040', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jmbezFblwgdyjDs.jpg', 'http://news.17173.com/content/07282017/230846744_4.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('41', '000041', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/DKApYoblwgdAoiu.jpg', 'http://news.17173.com/content/07282017/230846744_6', '7', null);
INSERT INTO `j_tp` VALUES ('42', '000042', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pfXsSkblwfFmmfq.jpg', 'http://news.17173.com/content/07292017/002210788_2.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('43', '000043', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nAUOlAblwfFpjto.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('44', '000044', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WmnuJCblwcpyCEs.jpg', 'http://news.17173.com/content/07272017/165956729_6.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('45', '000045', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dqxWezblwfFwEak.jpg', 'http://news.17173.com/content/07292017/002210788_9.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('46', '000046', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aMHAFkblwcpsAbz.jpg', 'http://news.17173.com/content/07272017/215124983_2.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('47', '000047', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GoeNsNblwcpFehv.jpg', 'http://news.17173.com/content/07272017/165956729_7.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('48', '000048', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XvKCbcblwbpyupl.jpg', 'http://news.17173.com/content/07272017/104851923_3.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('49', '000049', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NtPaWablwbpBkCa.jpg', 'http://news.17173.com/content/07272017/104851923_7.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('50', '000050', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gDygbyblwbpCynn.jpg', 'http://news.17173.com/content/07272017/104851923_9.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('51', '000051', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/VMDugAblwbpEcEg.jpg', 'http://news.17173.com/content/07272017/104851923_11.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('52', '000052', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/rKJLVDblvFByaCe.png', 'http://news.17173.com/content/07242017/162505854_1.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('53', '000053', '4', 'wenchen', '2017-10-12 12:04:21', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FwANVQblvFBBgoC.png', 'http://news.17173.com/content/07242017/162505854_6.shtml', '7', null);
INSERT INTO `j_tp` VALUES ('54', '000054', '2', 'wenchen', '2017-10-12 12:04:21', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/pic/813a912d0fa94bfc933889f20796f13e.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/html/813a912d0fa94bfc933889f20796f13e.gif.html', '7', null);
INSERT INTO `j_tp` VALUES ('55', '000055', '2', 'wenchen', '2017-10-12 12:04:21', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/pic/81d59e130d1d4a70a57c6342f3bfeb8c.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/html/81d59e130d1d4a70a57c6342f3bfeb8c.gif.html', '1', null);
INSERT INTO `j_tp` VALUES ('56', '000056', '3', 'wenchen', '2017-10-12 12:04:21', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/pic/58d938bd20fb432984d682da573fc4ae.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/html/58d938bd20fb432984d682da573fc4ae.gif.html', '4', null);
INSERT INTO `j_tp` VALUES ('57', '000057', '2', 'wenchen', '2017-10-12 13:12:29', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/pic/3330965b1b774e2c9143c121ec66819c.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-11/html/3330965b1b774e2c9143c121ec66819c.gif.html', '2', null);
INSERT INTO `j_tp` VALUES ('62', '000062', '2', 'wenchen', '2017-10-12 13:38:00', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-12/pic/2f3e706f4db4425db5a6e3fea66ec53c.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-12/html/2f3e706f4db4425db5a6e3fea66ec53c.gif.html', '1', null);
INSERT INTO `j_tp` VALUES ('63', '1507786814970', '2', 'wenchen', '2017-10-12 13:40:22', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-12/pic/4474d1f1f5b54364afd0f00ca3f45017.gif', 'http://localhost:8080/admin_6ha/tp/dttp/2017-10-12/html/4474d1f1f5b54364afd0f00ca3f45017.gif.html', '4', 0x3C70726520636C6173733D227072657474797072696E74206C696E656E756D73207072657474797072696E74656422206E616D653D22636F6465223E3C6F6C20636C6173733D226C696E656E756D73223E3C6C6920636C6173733D224C30223E3C7370616E20636C6173733D22746167223E266C743B613C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E687265663C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E2223223C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E7469746C653C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E22546869732069732074686520746F6F6C746970206D6573736167652E223C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E636C6173733C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E226561737975692D746F6F6C746970223C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E486F766572206D653C2F7370616E3E3C7370616E20636C6173733D22746167223E266C743B2F612667743B3C2F7370616E3E3C2F6C693E3C2F6F6C3E3C2F7072653E3C703E322E20E9809AE8BF874A617661736372697074E5889BE5BBBAE68F90E7A4BAE6A186E380823C2F703E3C70726520636C6173733D227072657474797072696E74206C696E656E756D73207072657474797072696E74656422206E616D653D22636F6465223E3C6F6C20636C6173733D226C696E656E756D73223E3C6C6920636C6173733D224C30223E3C7370616E20636C6173733D22746167223E266C743B613C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E69643C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E226464223C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D2261746E223E687265663C2F7370616E3E3C7370616E20636C6173733D2270756E223E3D3C2F7370616E3E3C7370616E20636C6173733D22617476223E226A6176617363726970743A766F6964283029223C2F7370616E3E3C7370616E20636C6173733D22746167223E2667743B3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E436C69636B20686572653C2F7370616E3E3C7370616E20636C6173733D22746167223E266C743B2F612667743B3C2F7370616E3E3C2F6C693E3C2F6F6C3E3C2F7072653E3C70726520636C6173733D227072657474797072696E74206C696E656E756D73207072657474797072696E74656422206E616D653D22636F6465223E3C6F6C20636C6173733D226C696E656E756D73223E3C6C6920636C6173733D224C30223E3C7370616E20636C6173733D22706C6E223E243C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D22737472223E27236464273C2F7370616E3E3C7370616E20636C6173733D2270756E223E292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E746F6F6C7469703C2F7370616E3E3C7370616E20636C6173733D2270756E223E287B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C31223E3C7370616E20636C6173733D22706C6E223E20202020706F736974696F6E3C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D22737472223E277269676874273C2F7370616E3E3C7370616E20636C6173733D2270756E223E2C3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C32223E3C7370616E20636C6173733D22706C6E223E20202020636F6E74656E743C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D22737472223E27266C743B7370616E207374796C653D22636F6C6F723A23666666222667743B546869732069732074686520746F6F6C746970206D6573736167652E266C743B2F7370616E2667743B273C2F7370616E3E3C7370616E20636C6173733D2270756E223E2C3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C33223E3C7370616E20636C6173733D22706C6E223E202020206F6E53686F773C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D226B7764223E66756E6374696F6E3C2F7370616E3E3C7370616E20636C6173733D2270756E223E28297B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C34223E3C7370616E20636C6173733D22706C6E223E2020202020202020243C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D226B7764223E746869733C2F7370616E3E3C7370616E20636C6173733D2270756E223E292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E746F6F6C7469703C2F7370616E3E3C7370616E20636C6173733D2270756E223E283C2F7370616E3E3C7370616E20636C6173733D22737472223E27746970273C2F7370616E3E3C7370616E20636C6173733D2270756E223E292E3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E6373733C2F7370616E3E3C7370616E20636C6173733D2270756E223E287B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C35223E3C7370616E20636C6173733D22706C6E223E2020202020202020202020206261636B67726F756E64436F6C6F723C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D22737472223E2723363636273C2F7370616E3E3C7370616E20636C6173733D2270756E223E2C3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C36223E3C7370616E20636C6173733D22706C6E223E202020202020202020202020626F72646572436F6C6F723C2F7370616E3E3C7370616E20636C6173733D2270756E223E3A3C2F7370616E3E3C7370616E20636C6173733D22706C6E223E203C2F7370616E3E3C7370616E20636C6173733D22737472223E2723363636273C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C37223E3C7370616E20636C6173733D22706C6E223E20202020202020203C2F7370616E3E3C7370616E20636C6173733D2270756E223E7D293B3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C38223E3C7370616E20636C6173733D22706C6E223E202020203C2F7370616E3E3C7370616E20636C6173733D2270756E223E7D3C2F7370616E3E3C2F6C693E3C6C6920636C6173733D224C39223E3C7370616E20636C6173733D2270756E223E7D293B3C2F7370616E3E3C2F6C693E3C2F6F6C3E3C2F7072653E3C703E0D0A0D0A3C2F703E3C68343EE5B19EE680A73C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F34392E6769662220616C743D225BE78CAAE5A4B45D223E3C2F68343E);
INSERT INTO `j_tp` VALUES ('64', '1523430482946', '4', 'wenchen', '2018-04-11 15:08:38', 'http://localhost:8080/admin_6ha/tp/pttp/2018-04-11/pic/f468a44113f146d6ba517e92fa0d4097.jpg', 'http://localhost:8080/admin_6ha/tp/pttp/2018-04-11/html/f468a44113f146d6ba517e92fa0d4097.html', '4', 0x3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C703EE59388E59388E59388E59388E59388E593883C2F703E3C6469763E3C62723E3C2F6469763E);

-- ----------------------------
-- Table structure for j_yx
-- ----------------------------
DROP TABLE IF EXISTS `j_yx`;
CREATE TABLE `j_yx` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lx` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '游戏的名字',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '游戏的图片链接',
  `href` varchar(255) DEFAULT NULL COMMENT '游戏专题报道的链接',
  `count` int(11) DEFAULT NULL COMMENT '点赞的数量',
  `zt` int(2) DEFAULT NULL COMMENT '游戏状态，这里用枚举类XWZT中的值',
  `remark` varchar(255) DEFAULT NULL COMMENT '游戏说明，在审批的时候要用到',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_yx
-- ----------------------------
INSERT INTO `j_yx` VALUES ('1', 'phone', '光明大陆', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qBSIPrblulrDrfs.jpg', 'http://news.17173.com/content/07272017/070031706_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('2', 'pc', 'CS:GO', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/xXLDryblvFisjhn.jpg', 'http://csgo.17173.com/', '0', '3', null);
INSERT INTO `j_yx` VALUES ('3', 'pc', '黑暗与光明', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EWExwObluliyCtF.jpg', 'http://newgame.17173.com/game-info-11565.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('4', 'phone', '初音速', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NosIBYbluggCrAs.jpg', 'http://news.17173.com/content/07272017/100032462_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('5', 'phone', '萌王EX', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/TINFTnbluggCrtc.jpg', 'http://newgame.17173.com/game-info-4044757.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('6', 'pc', '黑色沙漠', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GzburGbluljeofh.jpg', 'http://news.17173.com/content/07272017/113313368.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('7', 'phone', '终结者2：审判日', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FgDniAbluggCrsD.jpg', 'http://newgame.17173.com/game-info-4047622.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('8', 'pc', '超凡战纪', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kxxYqvblvFhxlcq.jpg', 'http://newgame.17173.com/game-info-1000568.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('9', 'phone', '梦想世界3D', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hgiAsMblvFhDygi.jpg', 'http://newgame.17173.com/game-info-4046388.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('10', 'phone', '泰坦黎明', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FSSmLXbluggCpCp.jpg', 'http://news.17173.com/content/07282017/143808681.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('11', 'phone', '神之物语', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yMXHAxblvFhAhkF.jpg', 'http://newgame.17173.com/game-info-4052206.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('12', 'pc', '剑网3重置版', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/wTYCTebluljlyAx.jpg', 'http://news.17173.com/content/07272017/164043916.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('13', 'pc', '传奇永恒', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fvWRisblvFgjnaw.jpg', 'http://cqyh.17173.com/', '0', '3', null);
INSERT INTO `j_yx` VALUES ('14', 'phone', '天启联盟', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qixMsrbluggCrBr.jpg', 'http://newgame.17173.com/game-info-4047431.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('15', 'phone', '野良神：宿命', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/UuVMBtblwbmehyz.jpg', 'http://news.17173.com/content/07252017/095937018.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('16', 'phone', '天堂2：誓言', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JIjOpoblugqqidj.jpg', 'http://newgame.17173.com/game-info-4048832.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('17', 'phone', '我的恐龙GO', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yYSnESbluggCrta.jpg', 'http://newgame.17173.com/game-info-4047954.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('18', 'phone', '拳皇命运', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/mEsbdsbluggCrsC.jpg', 'http://news.17173.com/content/07282017/165401495.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('19', 'phone', '欢乐球吃球', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/OMGSRobluggCpEj.jpg', 'http://newgame.17173.com/game-info-4051945.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('20', 'phone', '诛仙手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WWElRxblwdnAljp.jpg', 'http://newgame.17173.com/game-info-4042741.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('21', 'phone', '石器时代手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QGgeOubluggCpzr.jpg', 'http://news.17173.com/content/07272017/152112174_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('22', 'phone', '神无月', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eBNBewbluggCrta.jpg', 'http://news.17173.com/content/07302017/071153899.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('23', 'phone', '第五人格', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/alPAIdbluggCrta.jpg', 'http://newgame.17173.com/game-info-4051732.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('24', 'phone', '轩辕剑手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NAQrdnbluggCpta.jpg', 'http://newgame.17173.com/game-info-4051816.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('25', 'phone', '轮回诀', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kczjLKbluggCpvc.jpg', 'http://news.17173.com/content/07292017/130529787_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('26', 'phone', '黑暗与光明手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kAnkiQbluggCpuv.jpg', 'http://news.17173.com/content/07292017/140305892.shtml', '0', '3', null);

-- ----------------------------
-- Table structure for l_news
-- ----------------------------
DROP TABLE IF EXISTS `l_news`;
CREATE TABLE `l_news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dm` varchar(255) DEFAULT NULL COMMENT 'news对应在表中的dm',
  `czr` varchar(255) DEFAULT NULL COMMENT '操作人',
  `old_zt` int(11) DEFAULT NULL COMMENT '老状态',
  `new_zt` int(11) DEFAULT NULL COMMENT '新状态',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '操作说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of l_news
-- ----------------------------
INSERT INTO `l_news` VALUES ('1', '20170831145648', 'wenchen', null, '1', '2017-08-31 16:58:53', '大图文（20170831145648）于2017-08-31 16:58:53被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('2', '991003', 'wenchen', null, '1', '2017-08-31 16:59:16', '大图文（991003）于2017-08-31 16:59:16被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('3', '20170919101245', 'wenchen', null, '1', '2017-09-19 10:12:57', '大图文（20170919101245）于2017-09-19 10:12:57被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('4', '20170919114145', 'wenchen', null, '1', '2017-09-19 11:41:49', '大图文（20170919114145）于2017-09-19 11:41:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('5', '20170920102503', 'wenchen', null, '1', '2017-09-20 11:08:57', '大图文（20170920102503）于2017-09-20 11:08:57被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('6', '20170919114145', 'wenchen', null, '1', '2017-09-21 14:31:45', '大图文（20170919114145）于2017-09-21 14:31:45被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('7', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:23:55', '大图文(20170920102503)于2017-09-21 15:23:55被wenchen提交进行一审，现处于一审未通过状态，驳回原因：212121aasasaff地方大');
INSERT INTO `l_news` VALUES ('8', '20170831145648', 'wenchen', '1', '5', '2017-09-21 15:24:39', '大图文(20170831145648)于2017-09-21 15:24:39被wenchen提交进行一审，现处于一审未通过状态，驳回原因：的萨达大厦');
INSERT INTO `l_news` VALUES ('9', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:25:16', '大图文（20170920102503）于2017-09-21 15:25:16被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('10', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:25:27', '大图文(20170920102503)于2017-09-21 15:25:27被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大萨达');
INSERT INTO `l_news` VALUES ('11', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:27:18', '大图文(20170919114145)于2017-09-21 15:27:18被wenchen提交进行一审，现处于一审未通过状态，驳回原因：打算的撒打算');
INSERT INTO `l_news` VALUES ('12', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:27:55', '大图文（20170919114145）于2017-09-21 15:27:55被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('13', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:27:58', '大图文（20170920102503）于2017-09-21 15:27:58被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('14', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:28:05', '大图文(20170920102503)于2017-09-21 15:28:05被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大叔大婶');
INSERT INTO `l_news` VALUES ('15', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:28:18', '大图文(20170919114145)于2017-09-21 15:28:18被wenchen提交进行一审，现处于一审未通过状态，驳回原因：21121');
INSERT INTO `l_news` VALUES ('16', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:28:49', '大图文（20170920102503）于2017-09-21 15:28:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('17', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:28:49', '大图文（20170920102503）于2017-09-21 15:28:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('18', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:28:51', '大图文（20170919114145）于2017-09-21 15:28:51被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('19', '20170831145648', 'wenchen', null, '1', '2017-09-21 15:28:55', '大图文（20170831145648）于2017-09-21 15:28:55被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('20', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:29:03', '大图文(20170920102503)于2017-09-21 15:29:03被wenchen提交进行一审，现处于一审未通过状态，驳回原因：法萨芬地方都是');
INSERT INTO `l_news` VALUES ('21', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:29:36', '大图文(20170919114145)于2017-09-21 15:29:36被wenchen提交进行一审，现处于一审未通过状态，驳回原因：广发');
INSERT INTO `l_news` VALUES ('22', '20170831145648', 'wenchen', '1', '5', '2017-09-21 15:29:42', '大图文(20170831145648)于2017-09-21 15:29:42被wenchen提交进行一审，现处于一审未通过状态，驳回原因：打撒打撒');
INSERT INTO `l_news` VALUES ('23', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:30:10', '大图文（20170919114145）于2017-09-21 15:30:10被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('24', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:30:12', '大图文（20170920102503）于2017-09-21 15:30:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('25', '20170831145648', 'wenchen', null, '1', '2017-09-21 15:30:14', '大图文（20170831145648）于2017-09-21 15:30:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('26', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:30:22', '大图文(20170920102503)于2017-09-21 15:30:22被wenchen提交进行一审，现处于一审未通过状态，驳回原因：独山大道');
INSERT INTO `l_news` VALUES ('27', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:30:28', '大图文(20170919114145)于2017-09-21 15:30:28被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大大是多少');
INSERT INTO `l_news` VALUES ('28', '20170831145648', 'wenchen', '1', '2', '2017-09-21 15:35:12', '大图文(20170831145648)于2017-09-21 15:35:12被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('29', '20170920102503', 'wenchen', '5', '1', '2017-09-21 15:40:42', '大图文（20170920102503）于2017-09-21 15:40:42被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('30', '20170919114145', 'wenchen', '5', '1', '2017-09-21 15:40:44', '大图文（20170919114145）于2017-09-21 15:40:44被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('31', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:40:59', '大图文(20170920102503)于2017-09-21 15:40:59被wenchen提交进行一审，现处于一审未通过状态，驳回原因：dsaasdasdas');
INSERT INTO `l_news` VALUES ('32', '20170919114145', 'wenchen', '1', '2', '2017-09-21 16:16:43', '大图文(20170919114145)于2017-09-21 16:16:43被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('33', '20170831145648', 'wenchen', '2', '6', '2017-09-21 16:25:47', '大图文(20170831145648)于2017-09-21 16:25:47被wenchen提交进行二审，现处于一审未通过状态，驳回原因：dasdasdas');
INSERT INTO `l_news` VALUES ('34', '20170831145648', 'wenchen', '6', '1', '2017-09-21 16:26:59', '大图文（20170831145648）于2017-09-21 16:26:59被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('35', '20170831145648', 'wenchen', '1', '5', '2017-09-21 16:27:06', '大图文(20170831145648)于2017-09-21 16:27:06被wenchen提交进行一审，现处于一审未通过状态，驳回原因：dsadsad');
INSERT INTO `l_news` VALUES ('36', '20170919114145', 'wenchen', '2', '3', '2017-09-21 16:32:44', '大图文(20170919114145)于2017-09-21 16:32:44被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('37', '131003', 'wenchen', '4', '1', '2017-09-21 16:40:10', '大图文（131003）于2017-09-21 16:40:10被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('38', '131003', 'wenchen', '1', '2', '2017-09-21 16:40:28', '大图文(131003)于2017-09-21 16:40:28被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('39', '131003', 'wenchen', '2', '3', '2017-09-21 16:44:40', '大图文(131003)于2017-09-21 16:44:40被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('40', '20170919114145', 'wenchen', '4', '1', '2017-09-21 16:50:12', '大图文（20170919114145）于2017-09-21 16:50:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('41', '20170919114145', 'wenchen', '1', '2', '2017-09-21 16:50:26', '大图文(20170919114145)于2017-09-21 16:50:26被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('42', '20170919114145', 'wenchen', '2', '3', '2017-09-21 16:50:37', '大图文(20170919114145)于2017-09-21 16:50:37被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('43', '131003', 'wenchen', '4', '1', '2017-09-21 17:03:14', '大图文（131003）于2017-09-21 17:03:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('44', '131003', 'wenchen', '1', '2', '2017-09-21 17:03:20', '大图文(131003)于2017-09-21 17:03:20被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('45', '131003', 'wenchen', '2', '3', '2017-09-21 17:03:26', '大图文(131003)于2017-09-21 17:03:26被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('46', '20170920102503', 'wenchen', '5', '1', '2017-09-23 10:27:12', '大图文（20170920102503）于2017-09-23 10:27:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('47', '20170919114145', 'wenchen', '4', '1', '2017-09-23 10:27:14', '大图文（20170919114145）于2017-09-23 10:27:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('48', '20170831145648', 'wenchen', '5', '1', '2017-09-23 10:27:23', '大图文（20170831145648）于2017-09-23 10:27:23被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('49', '20170919114145', 'wenchen', '1', '2', '2017-09-23 10:39:59', '大图文(20170919114145)于2017-09-23 10:39:59被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('50', '20170919114145', 'wenchen', '2', '6', '2017-09-23 10:40:24', '大图文(20170919114145)于2017-09-23 10:40:24被wenchen提交进行二审，现处于二审未通过状态，驳回原因：caonimas');
INSERT INTO `l_news` VALUES ('51', '20170919101245', 'wenchen', '2', '3', '2017-09-23 10:41:18', '大图文(20170919101245)于2017-09-23 10:41:18被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('52', '131003', 'wenchen', '4', '1', '2017-10-10 11:03:44', '大图文（131003）于2017-10-10 11:03:44被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('53', '131003', 'wenchen', '1', '2', '2017-10-10 11:04:04', '大图文(131003)于2017-10-10 11:04:04被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('54', '131003', 'wenchen', '2', '3', '2017-10-10 11:04:20', '大图文(131003)于2017-10-10 11:04:20被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('55', '1506135840636', 'wenchen', '6', '6', '2017-10-10 12:38:44', '小图文(1506135840636)于2017-10-10 12:38:41被wenchen进行修改，现处于二审未通过状态');
INSERT INTO `l_news` VALUES ('56', '1506135840636', 'wenchen', '6', '6', '2017-10-10 12:43:56', '小图文(1506135840636)于2017-10-10 12:43:56被wenchen进行修改，现处于二审未通过状态');
INSERT INTO `l_news` VALUES ('57', '1506135841702', 'wenchen', '5', '1', '2017-10-10 12:45:45', '小图文（1506135841702）于2017-10-10 12:45:45被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('58', '1506135841758', 'wenchen', '5', '1', '2017-10-10 12:45:51', '小图文（1506135841758）于2017-10-10 12:45:51被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('59', '1507610911066', 'wenchen', null, '7', '2017-10-10 12:48:31', null);
INSERT INTO `l_news` VALUES ('60', '1507611151287', 'wenchen', null, '7', '2017-10-10 12:52:31', '小图文(1507611151287)于2017-10-10 12:52:31被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('61', '1507611151287', 'wenchen', '7', '1', '2017-10-10 12:53:36', '小图文（1507611151287）于2017-10-10 12:53:36被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('62', '1506135841702', 'wenchen', '1', '5', '2017-10-10 13:29:07', '小图文(1506135841702)于2017-10-10 13:29:07被wenchen提交进行一审，现处于一审未通过状态，驳回原因：2121212121fdasd');
INSERT INTO `l_news` VALUES ('63', '1506135841758', 'wenchen', '1', '5', '2017-10-10 13:30:36', '小图文(1506135841758)于2017-10-10 13:30:36被wenchen驳回，现处于一审未通过状态，驳回原因：cdasdas阿达');
INSERT INTO `l_news` VALUES ('64', '1507611151287', 'wenchen', '1', '2', '2017-10-10 13:30:53', '小图文(1507611151287)于2017-10-10 13:30:53被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('65', '1506135841926', 'wenchen', '2', '6', '2017-10-10 13:43:52', '小图文(1506135841926)于2017-10-10 13:43:52被wenchen提交进行二审，现处于二审未通过状态，驳回原因：113xdg大宝贝');
INSERT INTO `l_news` VALUES ('66', '1506135842002', 'wenchen', '2', '6', '2017-10-10 13:44:51', '小图文(1506135842002)于2017-10-10 13:44:51被wenchen提交进行二审，现处于二审未通过状态，驳回原因：121·32风飞沙');
INSERT INTO `l_news` VALUES ('67', '1506135842066', 'wenchen', '2', '6', '2017-10-10 13:44:56', '小图文(1506135842066)于2017-10-10 13:44:56被wenchen提交进行二审，现处于二审未通过状态，驳回原因：阿迪达斯');
INSERT INTO `l_news` VALUES ('68', '1507611151287', 'wenchen', '2', '3', '2017-10-10 14:45:37', '大图文(1507611151287)于2017-10-10 14:45:37被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('69', '1507611151287', 'wenchen', '2', '3', '2017-10-10 14:45:37', '大图文(1507611151287)于2017-10-10 14:45:37经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('70', '121002', 'wenchen', '4', '1', '2017-10-10 14:46:29', '小图文（121002）于2017-10-10 14:46:29被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('71', '121002', 'wenchen', '1', '2', '2017-10-10 14:46:43', '小图文(121002)于2017-10-10 14:46:43经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('72', '121002', 'wenchen', '2', '3', '2017-10-10 14:46:55', '大图文(121002)于2017-10-10 14:46:55被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('73', '121002', 'wenchen', '2', '3', '2017-10-10 14:46:55', '大图文(121002)于2017-10-10 14:46:55经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('74', '1507618155749', 'wenchen', null, '7', '2017-10-10 14:49:15', '小图文(1507618155749)于2017-10-10 14:49:15被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('75', '1507618155749', 'wenchen', '7', '1', '2017-10-10 14:49:32', '小图文（1507618155749）于2017-10-10 14:49:32被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('76', '1507618693632', 'wenchen', null, '7', '2017-10-10 14:58:13', '小图文(1507618693632)于2017-10-10 14:58:13被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('77', '1507623931202', 'wenchen', null, '7', '2017-10-10 16:25:31', '滚动新闻(1507623931202)于2017-10-10 16:25:31被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('78', '1507624773593', 'wenchen', null, '7', '2017-10-10 16:39:34', '滚动新闻(1507624773593)于2017-10-10 16:39:34被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('79', '1507624839395', 'wenchen', null, '7', '2017-10-10 16:40:39', '滚动新闻(1507624839395)于2017-10-10 16:40:39被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('80', '1507624839395', 'wenchen', '7', '7', '2017-10-10 16:54:59', '滚动新闻(1507624839395)于2017-10-10 16:54:59被wenchen进行修改，现处于编辑中状态');
INSERT INTO `l_news` VALUES ('81', '1507621948277', 'wenchen', '4', '4', '2017-10-10 16:55:13', '滚动新闻(1507621948277)于2017-10-10 16:55:13被wenchen进行修改，现处于已过期状态');
INSERT INTO `l_news` VALUES ('82', '1507621948490', 'wenchen', '7', '7', '2017-10-11 11:03:08', '滚动新闻(1507621948490)于2017-10-11 11:03:08被wenchen进行修改，现处于编辑中状态');
INSERT INTO `l_news` VALUES ('83', '1507621948490', 'wenchen', '7', '7', '2017-10-11 11:03:55', '滚动新闻(1507621948490)于2017-10-11 11:03:55被wenchen进行修改，现处于编辑中状态');
INSERT INTO `l_news` VALUES ('84', '1507621948490', 'wenchen', '7', '7', '2017-10-11 11:04:18', '滚动新闻(1507621948490)于2017-10-11 11:04:18被wenchen进行修改，现处于编辑中状态');
INSERT INTO `l_news` VALUES ('85', '1507691173039', 'wenchen', null, '7', '2017-10-11 11:06:13', '滚动新闻(1507691173039)于2017-10-11 11:06:13被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('86', '1507691173039', 'wenchen', '7', '1', '2017-10-11 11:17:30', '滚动新闻（1507691173039）于2017-10-11 11:17:30被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('87', '1507624839395', 'wenchen', '7', '1', '2017-10-11 11:17:36', '滚动新闻（1507624839395）于2017-10-11 11:17:36被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('88', '1507621943351', 'wenchen', '5', '1', '2017-10-11 11:18:35', '滚动新闻（1507621943351）于2017-10-11 11:18:35被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('89', '1507621943131', 'wenchen', '4', '1', '2017-10-11 11:18:43', '滚动新闻（1507621943131）于2017-10-11 11:18:43被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('90', '1507621946159', 'wenchen', '4', '1', '2017-10-11 11:18:47', '滚动新闻（1507621946159）于2017-10-11 11:18:47被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('91', '1507691173039', 'wenchen', '1', '2', '2017-10-11 11:44:39', '滚动新闻(1507691173039)于2017-10-11 11:44:39经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('92', '1507621946159', 'wenchen', '1', '5', '2017-10-11 12:02:39', '滚动新闻(1507621946159)于2017-10-11 12:02:39被wenchen驳回，现处于一审未通过状态，驳回原因：啊啊啊啊啊啊啊');
INSERT INTO `l_news` VALUES ('93', '1507621946159', 'wenchen', '1', '5', '2017-10-11 12:02:48', '滚动新闻(1507621946159)于2017-10-11 12:02:48被wenchen驳回，现处于一审未通过状态，驳回原因：vcvcv');
INSERT INTO `l_news` VALUES ('94', '1507621945201', 'wenchen', '1', '5', '2017-10-11 12:03:32', '滚动新闻(1507621945201)于2017-10-11 12:03:32被wenchen驳回，现处于一审未通过状态，驳回原因：没骂你你们呢');
INSERT INTO `l_news` VALUES ('95', '1507624839395', 'wenchen', '1', '2', '2017-10-11 12:11:08', '滚动新闻（1507624839395）于2017-10-11 12:11:08经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('96', '1507621945140', 'wenchen', '1', '2', '2017-10-11 12:11:25', '滚动新闻（1507621945140）于2017-10-11 12:11:25经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('97', '1507621948277', 'wenchen', '4', '1', '2017-10-11 12:12:02', '滚动新闻（1507621948277）于2017-10-11 12:12:02被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('98', '1507621947848', 'wenchen', '4', '1', '2017-10-11 12:12:11', '滚动新闻（1507621947848）于2017-10-11 12:12:11被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('99', '1507691173039', 'wenchen', '2', '6', '2017-10-11 12:24:13', '滚动新闻(1507691173039)于2017-10-11 12:24:13被wenchen提交进行二审，现处于二审未通过状态，驳回原因：aabsfa 发多少');
INSERT INTO `l_news` VALUES ('100', '1506135842183', 'wenchen', '2', '6', '2017-10-11 12:33:30', '小图文(1506135842183)于2017-10-11 12:33:30被wenchen提交进行二审，现处于二审未通过状态，驳回原因：CAD谁打');
INSERT INTO `l_news` VALUES ('101', '1506135842127', 'wenchen', '2', '3', '2017-10-11 12:33:36', '大图文(1506135842127)于2017-10-11 12:33:36被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('102', '1506135842127', 'wenchen', '2', '3', '2017-10-11 12:33:37', '大图文(1506135842127)于2017-10-11 12:33:37经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('103', '121002', 'wenchen', '4', '1', '2017-10-11 12:34:27', '小图文（121002）于2017-10-11 12:34:27被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('104', '121002', 'wenchen', '1', '2', '2017-10-11 12:34:33', '小图文(121002)于2017-10-11 12:34:33经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('105', '121002', 'wenchen', '2', '3', '2017-10-11 12:34:40', '大图文(121002)于2017-10-11 12:34:40被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('106', '121002', 'wenchen', '2', '3', '2017-10-11 12:34:40', '大图文(121002)于2017-10-11 12:34:40经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('107', '1506135840636', 'wenchen', '6', '1', '2017-10-11 12:36:04', '小图文（1506135840636）于2017-10-11 12:36:04被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('108', '1506135840636', 'wenchen', '1', '1', '2017-10-11 12:36:04', '小图文（1506135840636）于2017-10-11 12:36:04被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('109', '1507618155749', 'wenchen', '1', '2', '2017-10-11 12:36:10', '小图文(1507618155749)于2017-10-11 12:36:10经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('110', '1507618155749', 'wenchen', '2', '3', '2017-10-11 12:36:16', '大图文(1507618155749)于2017-10-11 12:36:16被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('111', '1507618155749', 'wenchen', '2', '3', '2017-10-11 12:36:16', '大图文(1507618155749)于2017-10-11 12:36:16经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('112', '121002', 'wenchen', '4', '1', '2017-10-11 12:36:31', '小图文（121002）于2017-10-11 12:36:31被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('113', '121002', 'wenchen', '1', '2', '2017-10-11 12:36:36', '小图文(121002)于2017-10-11 12:36:36经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('114', '121002', 'wenchen', '2', '3', '2017-10-11 12:36:44', '大图文(121002)于2017-10-11 12:36:44被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('115', '121002', 'wenchen', '2', '3', '2017-10-11 12:36:44', '大图文(121002)于2017-10-11 12:36:44经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('116', '1507624839395', 'wenchen', '2', '3', '2017-10-11 12:42:10', '滚动新闻(1507624839395)于2017-10-11 12:42:10被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('117', '1507624839395', 'wenchen', '2', '3', '2017-10-11 12:42:10', '大图文(1507624839395)于2017-10-11 12:42:10经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('118', '142001', 'wenchen', '4', '1', '2017-10-11 13:06:09', '滚动新闻（142001）于2017-10-11 13:06:09被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('119', '142001', 'wenchen', '1', '2', '2017-10-11 13:06:24', '滚动新闻（142001）于2017-10-11 13:06:24经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('120', '142001', 'wenchen', '2', '3', '2017-10-11 13:06:42', '滚动新闻(142001)于2017-10-11 13:06:42被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('121', '142001', 'wenchen', '2', '3', '2017-10-11 13:06:42', '大图文(142001)于2017-10-11 13:06:42经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('122', '1507699492336', 'wenchen', null, '7', '2017-10-11 13:24:52', '滚动新闻(1507699492336)于2017-10-11 13:24:52被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('123', '1507699623335', 'wenchen', null, '7', '2017-10-11 13:27:03', '滚动新闻(1507699623335)于2017-10-11 13:27:03被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('124', '1507699737158', 'wenchen', null, '7', '2017-10-11 13:28:57', '滚动新闻(1507699737158)于2017-10-11 13:28:57被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('125', '1507699623335', 'wenchen', '7', '7', '2017-10-11 13:29:09', '滚动新闻(1507699623335)于2017-10-11 13:29:09被wenchen进行修改，现处于编辑中状态');
INSERT INTO `l_news` VALUES ('126', '1507699623335', 'wenchen', '7', '1', '2017-10-11 13:29:19', '滚动新闻（1507699623335）于2017-10-11 13:29:19被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('127', '1507699623335', 'wenchen', '1', '5', '2017-10-11 13:29:32', '滚动新闻(1507699623335)于2017-10-11 13:29:32被wenchen驳回，现处于一审未通过状态，驳回原因：的撒打算的撒的');
INSERT INTO `l_news` VALUES ('128', '1507699623335', 'wenchen', '5', '1', '2017-10-11 13:29:48', '滚动新闻（1507699623335）于2017-10-11 13:29:48被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('129', '1507699623335', 'wenchen', '1', '2', '2017-10-11 13:29:54', '滚动新闻（1507699623335）于2017-10-11 13:29:54经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('130', '1507699623335', 'wenchen', '2', '3', '2017-10-11 13:30:03', '滚动新闻(1507699623335)于2017-10-11 13:30:03被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('131', '1507699623335', 'wenchen', '2', '3', '2017-10-11 13:30:03', '大图文(1507699623335)于2017-10-11 13:30:03经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('132', '142001', 'wenchen', '4', '1', '2017-10-11 13:30:30', '滚动新闻（142001）于2017-10-11 13:30:30被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('133', '142001', 'wenchen', '1', '2', '2017-10-11 13:31:10', '滚动新闻（142001）于2017-10-11 13:31:10经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('134', '142001', 'wenchen', '2', '3', '2017-10-11 13:31:20', '滚动新闻(142001)于2017-10-11 13:31:20被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('135', '142001', 'wenchen', '2', '3', '2017-10-11 13:31:20', '大图文(142001)于2017-10-11 13:31:20经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('136', '1507700128894', 'wenchen', null, '7', '2017-10-11 13:35:29', '滚动新闻(1507700128894)于2017-10-11 13:35:29被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('137', '1507700540190', 'wenchen', null, '7', '2017-10-11 13:42:20', '日看点新闻(1507700540190)于2017-10-11 13:42:20被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('138', '1507700540190', 'wenchen', '7', '1', '2017-10-11 13:43:01', '日看点新闻（1507700540190）于2017-10-11 13:43:01被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('139', '1507698748547', 'wenchen', '6', '1', '2017-10-11 13:52:16', '日看点新闻（1507698748547）于2017-10-11 13:52:16被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('140', '1507698748955', 'wenchen', '4', '1', '2017-10-11 13:52:18', '日看点新闻（1507698748955）于2017-10-11 13:52:18被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('141', '1507698750772', 'wenchen', '7', '1', '2017-10-11 13:52:21', '日看点新闻（1507698750772）于2017-10-11 13:52:21被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('142', '1507698751030', 'wenchen', '7', '1', '2017-10-11 13:52:24', '日看点新闻（1507698751030）于2017-10-11 13:52:24被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('143', '1507700540190', 'wenchen', '1', '5', '2017-10-11 13:55:36', '日看点新闻(1507700540190)于2017-10-11 13:55:36被wenchen驳回，现处于一审未通过状态，驳回原因：aad大大大大');
INSERT INTO `l_news` VALUES ('144', '1507700540190', 'wenchen', '5', '1', '2017-10-11 13:56:16', '日看点新闻（1507700540190）于2017-10-11 13:56:16被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('145', '1507701406508', 'wenchen', null, '7', '2017-10-11 13:56:46', '日看点新闻(1507701406508)于2017-10-11 13:56:46被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('146', '1507701406508', 'wenchen', '7', '1', '2017-10-11 13:56:50', '日看点新闻（1507701406508）于2017-10-11 13:56:50被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('147', '1507701406508', 'wenchen', '1', '2', '2017-10-11 13:57:01', '日看点新闻（1507701406508）于2017-10-11 13:57:01经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('148', '1507700540190', 'wenchen', '1', '2', '2017-10-11 13:57:06', '日看点新闻（1507700540190）于2017-10-11 13:57:06经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('149', '1507701406508', 'wenchen', '2', '6', '2017-10-11 14:11:59', '日看点新闻(1507701406508)于2017-10-11 14:11:59被wenchen提交进行二审，现处于二审未通过状态，驳回原因：发达');
INSERT INTO `l_news` VALUES ('150', '1507701406508', 'wenchen', '6', '1', '2017-10-11 14:12:15', '日看点新闻（1507701406508）于2017-10-11 14:12:15被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('151', '1507701406508', 'wenchen', '1', '2', '2017-10-11 14:12:22', '日看点新闻（1507701406508）于2017-10-11 14:12:22经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('152', '1507701406508', 'wenchen', '2', '3', '2017-10-11 14:12:49', '日看点新闻(1507701406508)于2017-10-11 14:12:49被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('153', '1507701406508', 'wenchen', '2', '3', '2017-10-11 14:12:49', '日看点新闻(1507701406508)于2017-10-11 14:12:49经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('154', '11001', 'wenchen', '4', '1', '2017-10-11 14:13:05', '日看点新闻（11001）于2017-10-11 14:13:05被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('155', '11001', 'wenchen', '1', '2', '2017-10-11 14:13:13', '日看点新闻（11001）于2017-10-11 14:13:13经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('156', '11001', 'wenchen', '1', '2', '2017-10-11 14:13:14', '日看点新闻（11001）于2017-10-11 14:13:14经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('157', '11001', 'wenchen', '2', '3', '2017-10-11 14:13:25', '日看点新闻(11001)于2017-10-11 14:13:25被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('158', '11001', 'wenchen', '2', '3', '2017-10-11 14:13:25', '日看点新闻(11001)于2017-10-11 14:13:25经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('159', '58', 'wenchen', null, '7', '2017-10-11 17:32:03', '动态图片(58)于2017-10-11 17:32:03被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('160', '59', 'wenchen', null, '7', '2017-10-11 17:32:42', '动态图片(59)于2017-10-11 17:32:42被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('161', '60', 'wenchen', null, '7', '2017-10-11 17:33:25', '动态图片(60)于2017-10-11 17:33:25被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('162', '57', 'wenchen', null, '1', '2017-10-11 17:49:12', '动态图片（57）于2017-10-11 17:49:12被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('163', '56', 'wenchen', null, '1', '2017-10-11 17:49:34', '动态图片（56）于2017-10-11 17:49:34被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('164', '55', 'wenchen', null, '1', '2017-10-12 11:45:14', '动态图片（55）于2017-10-12 11:45:14被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('165', '000057', 'wenchen', '1', '5', '2017-10-12 13:12:02', '动态图片（000057）于2017-10-12 13:12:02被wenchen驳回，现处于一审未通过状态，驳回原因：fasasf ad vvzGVAV');
INSERT INTO `l_news` VALUES ('166', '57', 'wenchen', null, '1', '2017-10-12 13:12:29', '动态图片（57）于2017-10-12 13:12:29被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('167', '000057', 'wenchen', '1', '2', '2017-10-12 13:16:51', '动态图片（000057）于2017-10-12 13:16:51经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('168', '62', 'wenchen', null, '7', '2017-10-12 13:34:43', '动态图片(62)于2017-10-12 13:34:43被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('169', '62', 'wenchen', null, '1', '2017-10-12 13:34:48', '动态图片（62）于2017-10-12 13:34:48被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('170', '63', 'wenchen', null, '7', '2017-10-12 13:40:15', '动态图片(63)于2017-10-12 13:40:15被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('171', '63', 'wenchen', null, '1', '2017-10-12 13:40:22', '动态图片（63）于2017-10-12 13:40:22被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('172', '1506135841250', 'wenchen', '5', '1', '2018-04-11 15:00:00', '小图文（1506135841250）于2018-04-11 15:00:00被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('173', '1506135841250', 'wenchen', '1', '2', '2018-04-11 15:00:54', '小图文(1506135841250)于2018-04-11 15:00:54经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('174', '1506135840636', 'wenchen', '1', '5', '2018-04-11 15:01:11', '小图文(1506135840636)于2018-04-11 15:01:10被wenchen驳回，现处于一审未通过状态，驳回原因：太丑');
INSERT INTO `l_news` VALUES ('175', '1506135841250', 'wenchen', '2', '3', '2018-04-11 15:01:57', '小图文（1506135841250）于2018-04-11 15:01:57被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('176', '111002', 'wenchen', '2', '3', '2018-04-11 15:01:58', '小图文（1506135841250）于2018-04-11 15:01:57经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('177', '111002', 'wenchen', '4', '1', '2018-04-11 15:02:24', '小图文（111002）于2018-04-11 15:02:24被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('178', '111002', 'wenchen', '1', '2', '2018-04-11 15:02:30', '小图文(111002)于2018-04-11 15:02:29经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('179', '111002', 'wenchen', '2', '3', '2018-04-11 15:02:34', '小图文（111002）于2018-04-11 15:02:33被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('180', '1506135841250', 'wenchen', '2', '3', '2018-04-11 15:02:34', '小图文（111002）于2018-04-11 15:02:33经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('181', '20170920102503', 'wenchen', '1', '2', '2018-04-11 15:03:08', '大图文(20170920102503)于2018-04-11 15:03:07经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('182', '20170920102503', 'wenchen', '2', '3', '2018-04-11 15:03:22', '大图文(20170920102503)于2018-04-11 15:03:22被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('183', '131003', 'wenchen', '4', '1', '2018-04-11 15:03:45', '大图文（131003）于2018-04-11 15:03:44被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('184', '131003', 'wenchen', '1', '2', '2018-04-11 15:03:58', '大图文(131003)于2018-04-11 15:03:57经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('185', '131003', 'wenchen', '2', '3', '2018-04-11 15:04:05', '大图文(131003)于2018-04-11 15:04:05被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('186', '1523430321991', 'wenchen', null, '7', '2018-04-11 15:05:22', '日看点新闻(1523430321991)于2018-04-11 15:05:22被wenchen提交，现处于编辑中');
INSERT INTO `l_news` VALUES ('187', '1523430321991', 'wenchen', '7', '1', '2018-04-11 15:05:35', '日看点新闻（1523430321991）于2018-04-11 15:05:34被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('188', '1523430321991', 'wenchen', '1', '2', '2018-04-11 15:05:47', '日看点新闻（1523430321991）于2018-04-11 15:05:47经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('189', '1523430321991', 'wenchen', '2', '3', '2018-04-11 15:06:05', '日看点新闻（1523430321991）于2018-04-11 15:06:05被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('190', '61001', 'wenchen', '2', '3', '2018-04-11 15:06:05', '日看点新闻（1523430321991）于2018-04-11 15:06:05经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('191', '61001', 'wenchen', '4', '1', '2018-04-11 15:06:29', '日看点新闻（61001）于2018-04-11 15:06:29被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('192', '61001', 'wenchen', '1', '2', '2018-04-11 15:06:36', '日看点新闻（61001）于2018-04-11 15:06:35经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('193', '61001', 'wenchen', '2', '3', '2018-04-11 15:06:44', '日看点新闻（61001）于2018-04-11 15:06:44被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('194', '1523430321991', 'wenchen', '2', '3', '2018-04-11 15:06:44', '日看点新闻（61001）于2018-04-11 15:06:44经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('195', '32', 'wenchen', null, '1', '2018-04-11 15:07:37', '普通图片（32）于2018-04-11 15:07:36被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('196', '64', 'wenchen', null, '1', '2018-04-11 15:08:38', '普通图片（64）于2018-04-11 15:08:38被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('197', '1523430482946', 'wenchen', '1', '2', '2018-04-11 15:08:49', '普通图片（1523430482946）于2018-04-11 15:08:48经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('198', '1523430482946', 'wenchen', '2', '3', '2018-04-11 15:09:04', '普通图片（1523430482946）于2018-04-11 15:09:03被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('199', '000022', 'wenchen', '2', '3', '2018-04-11 15:09:04', '普通图片（1523430482946）于2018-04-11 15:09:03经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('200', '22', 'wenchen', null, '1', '2018-04-11 15:09:18', '普通图片（22）于2018-04-11 15:09:18被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('201', '000022', 'wenchen', '1', '2', '2018-04-11 15:09:28', '普通图片（000022）于2018-04-11 15:09:27经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('202', '000022', 'wenchen', '2', '3', '2018-04-11 15:09:36', '普通图片（000022）于2018-04-11 15:09:36被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('203', '1523430482946', 'wenchen', '2', '3', '2018-04-11 15:09:36', '普通图片（000022）于2018-04-11 15:09:36经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('204', '1507786814970', 'wenchen', '1', '2', '2018-04-11 15:10:47', '动态图片（1507786814970）于2018-04-11 15:10:46经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('205', '000056', 'wenchen', '1', '2', '2018-04-11 15:10:50', '动态图片（000056）于2018-04-11 15:10:49经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('206', '1507786814970', 'wenchen', '2', '3', '2018-04-11 15:11:11', '动态图片（1507786814970）于2018-04-11 15:11:10被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('207', '00001', 'wenchen', '2', '3', '2018-04-11 15:11:11', '动态图片（1507786814970）于2018-04-11 15:11:10经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('208', '000056', 'wenchen', '2', '3', '2018-04-11 15:11:28', '动态图片（000056）于2018-04-11 15:11:28被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('209', '000015', 'wenchen', '2', '3', '2018-04-11 15:11:28', '动态图片（000056）于2018-04-11 15:11:28经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('210', '1', 'wenchen', null, '1', '2018-04-11 15:11:43', '动态图片（1）于2018-04-11 15:11:42被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('211', '15', 'wenchen', null, '1', '2018-04-11 15:11:48', '动态图片（15）于2018-04-11 15:11:47被wenchen提交，现处于一审中');
INSERT INTO `l_news` VALUES ('212', '00001', 'wenchen', '1', '2', '2018-04-11 15:11:54', '动态图片（00001）于2018-04-11 15:11:54经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('213', '000015', 'wenchen', '1', '2', '2018-04-11 15:12:00', '动态图片（000015）于2018-04-11 15:12:00经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('214', '00001', 'wenchen', '2', '3', '2018-04-11 15:12:07', '动态图片（00001）于2018-04-11 15:12:06被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('215', '1507786814970', 'wenchen', '2', '3', '2018-04-11 15:12:07', '动态图片（00001）于2018-04-11 15:12:06经wenchen审批下架，现处于已过期');
INSERT INTO `l_news` VALUES ('216', '000015', 'wenchen', '2', '3', '2018-04-11 15:12:15', '动态图片（000015）于2018-04-11 15:12:14被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('217', '000056', 'wenchen', '2', '3', '2018-04-11 15:12:15', '动态图片（000015）于2018-04-11 15:12:14经wenchen审批下架，现处于已过期');

-- ----------------------------
-- Table structure for l_user_grade
-- ----------------------------
DROP TABLE IF EXISTS `l_user_grade`;
CREATE TABLE `l_user_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `old_grade` int(11) DEFAULT NULL,
  `new_grade` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `czsj` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of l_user_grade
-- ----------------------------
INSERT INTO `l_user_grade` VALUES ('1', 'wenchen', '1', '1', '100', '2017-07-17');
INSERT INTO `l_user_grade` VALUES ('2', 'wenchen', '1', '1', '100', '2017-07-13');
INSERT INTO `l_user_grade` VALUES ('3', 'wenchen', '1', '2', '800', '2017-07-20');
INSERT INTO `l_user_grade` VALUES ('4', 'wenchen', '2', '2', '1000', '2017-07-18');
INSERT INTO `l_user_grade` VALUES ('5', 'wenchen', '2', '2', '1000', '2017-07-17');
INSERT INTO `l_user_grade` VALUES ('6', 'wenchen', '2', '2', '1000', '2018-01-01');
INSERT INTO `l_user_grade` VALUES ('7', 'wenchen', '2', '2', '1000', '2018-02-01');
INSERT INTO `l_user_grade` VALUES ('8', 'wenchen', '2', '2', '600', '2018-02-11');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(66) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mennu_icon` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('10', '系统管理', '/system', '', '0');
INSERT INTO `menu` VALUES ('20', '图文上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('30', '新闻上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('40', '图片上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('50', '统计报表', '/system', '', '0');
INSERT INTO `menu` VALUES ('60', '详细资料 ', '/system', '', '0');
INSERT INTO `menu` VALUES ('101', '完善个人信息', '/admin/info/completeInfoUI.do', '', '10');
INSERT INTO `menu` VALUES ('102', '角色权限管理', '/admin/system/roleAuthoryUI.do', '', '10');
INSERT INTO `menu` VALUES ('103', '用户管理', '/admin/system/userCUI.do', '', '10');
INSERT INTO `menu` VALUES ('201', '小图文上架申请', '/admin/twsj/xtwsjUI.do', '', '20');
INSERT INTO `menu` VALUES ('202', '小图文上架初审', '/admin/twcs/xtwcsUI.do', '', '20');
INSERT INTO `menu` VALUES ('203', '小图文上架终审', '/admin/twzs/xtwzsUI.do', '', '20');
INSERT INTO `menu` VALUES ('204', '大图文上架申请', '/admin/twsj/dtwsjUI.do', '', '20');
INSERT INTO `menu` VALUES ('205', '大图文上架初审', '/admin/twcs/dtwcsUI.do', '', '20');
INSERT INTO `menu` VALUES ('206', '大图文上架终审', '/admin/twzs/dtwzsUI.do', '', '20');
INSERT INTO `menu` VALUES ('301', '日看点新闻上架申请', '/admin/xwsj/rkdxwsjUI.do', '', '30');
INSERT INTO `menu` VALUES ('302', '日看点新闻初审', '/admin/xwcs/rkdxwcsUI.do', '', '30');
INSERT INTO `menu` VALUES ('303', '日看点新闻终审', '/admin/xwzs/rkdxwzsUI.do', '', '30');
INSERT INTO `menu` VALUES ('304', '滚动新闻上架申请', '/admin/xwsj/gdxwsjUI.do', '', '30');
INSERT INTO `menu` VALUES ('305', '滚动新闻初审', '/admin/xwcs/gdxwcsUI.do', '', '30');
INSERT INTO `menu` VALUES ('306', '滚动新闻终审', '/admin/xwzs/gdxwzsUI.do', '', '30');
INSERT INTO `menu` VALUES ('401', '普通图片上架申请', '/admin/tpsj/pttpsjUI.do', '', '40');
INSERT INTO `menu` VALUES ('402', '普通图片初审', '/admin/tpcs/pttpcsUI.do', '', '40');
INSERT INTO `menu` VALUES ('403', '普通图片终审', '/admin/tpzs/pttpzsUI.do', '', '40');
INSERT INTO `menu` VALUES ('404', '动态图片上架申请', '/admin/tpsj/dttpsjUI.do', '', '40');
INSERT INTO `menu` VALUES ('405', '动态图片初审', '/admin/tpcs/dttpcsUI.do', '', '40');
INSERT INTO `menu` VALUES ('406', '动态图片终审', '/admin/tpzs/dttpzsUI.do', '', '40');
INSERT INTO `menu` VALUES ('501', '会员充值统计', '/admin/count/countRechargeUI.do', '', '50');
INSERT INTO `menu` VALUES ('502', '新闻上架统计', '', '', '50');
INSERT INTO `menu` VALUES ('503', '图片上架统计', '', '', '50');
INSERT INTO `menu` VALUES ('601', '普通用户查询', '/admin/detail/userDetailUI.do', '', '60');
INSERT INTO `menu` VALUES ('602', 'VIP用户查询', '/admin/detail/vipDetailUI.do', '', '60');
INSERT INTO `menu` VALUES ('603', '管理员用户查询', '/admin/detail/adminDetailUI.do', '', '60');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('28', '1', '10');
INSERT INTO `menu_role` VALUES ('29', '1', '101');
INSERT INTO `menu_role` VALUES ('30', '1', '20');
INSERT INTO `menu_role` VALUES ('31', '1', '201');
INSERT INTO `menu_role` VALUES ('32', '1', '202');
INSERT INTO `menu_role` VALUES ('33', '1', '30');
INSERT INTO `menu_role` VALUES ('34', '1', '301');
INSERT INTO `menu_role` VALUES ('35', '1', '302');
INSERT INTO `menu_role` VALUES ('36', '1', '40');
INSERT INTO `menu_role` VALUES ('37', '1', '401');
INSERT INTO `menu_role` VALUES ('38', '1', '402');
INSERT INTO `menu_role` VALUES ('39', '1', '50');
INSERT INTO `menu_role` VALUES ('40', '1', '502');
INSERT INTO `menu_role` VALUES ('41', '1', '503');
INSERT INTO `menu_role` VALUES ('42', '2', '10');
INSERT INTO `menu_role` VALUES ('43', '2', '101');
INSERT INTO `menu_role` VALUES ('44', '2', '20');
INSERT INTO `menu_role` VALUES ('45', '2', '201');
INSERT INTO `menu_role` VALUES ('46', '2', '202');
INSERT INTO `menu_role` VALUES ('47', '2', '203');
INSERT INTO `menu_role` VALUES ('48', '2', '204');
INSERT INTO `menu_role` VALUES ('49', '2', '30');
INSERT INTO `menu_role` VALUES ('50', '2', '301');
INSERT INTO `menu_role` VALUES ('51', '2', '302');
INSERT INTO `menu_role` VALUES ('52', '2', '303');
INSERT INTO `menu_role` VALUES ('53', '2', '304');
INSERT INTO `menu_role` VALUES ('54', '2', '40');
INSERT INTO `menu_role` VALUES ('55', '2', '401');
INSERT INTO `menu_role` VALUES ('56', '2', '402');
INSERT INTO `menu_role` VALUES ('57', '2', '403');
INSERT INTO `menu_role` VALUES ('58', '2', '404');
INSERT INTO `menu_role` VALUES ('59', '2', '50');
INSERT INTO `menu_role` VALUES ('60', '2', '502');
INSERT INTO `menu_role` VALUES ('61', '2', '503');
INSERT INTO `menu_role` VALUES ('62', '3', '10');
INSERT INTO `menu_role` VALUES ('63', '3', '101');
INSERT INTO `menu_role` VALUES ('64', '3', '20');
INSERT INTO `menu_role` VALUES ('65', '3', '201');
INSERT INTO `menu_role` VALUES ('66', '3', '202');
INSERT INTO `menu_role` VALUES ('67', '3', '203');
INSERT INTO `menu_role` VALUES ('68', '3', '204');
INSERT INTO `menu_role` VALUES ('69', '3', '30');
INSERT INTO `menu_role` VALUES ('70', '3', '301');
INSERT INTO `menu_role` VALUES ('71', '3', '302');
INSERT INTO `menu_role` VALUES ('72', '3', '303');
INSERT INTO `menu_role` VALUES ('73', '3', '304');
INSERT INTO `menu_role` VALUES ('74', '3', '40');
INSERT INTO `menu_role` VALUES ('75', '3', '401');
INSERT INTO `menu_role` VALUES ('76', '3', '402');
INSERT INTO `menu_role` VALUES ('77', '3', '403');
INSERT INTO `menu_role` VALUES ('78', '3', '404');
INSERT INTO `menu_role` VALUES ('79', '3', '50');
INSERT INTO `menu_role` VALUES ('80', '3', '502');
INSERT INTO `menu_role` VALUES ('81', '3', '503');
INSERT INTO `menu_role` VALUES ('82', '5', '10');
INSERT INTO `menu_role` VALUES ('83', '5', '101');
INSERT INTO `menu_role` VALUES ('84', '5', '20');
INSERT INTO `menu_role` VALUES ('85', '5', '201');
INSERT INTO `menu_role` VALUES ('86', '5', '202');
INSERT INTO `menu_role` VALUES ('87', '5', '203');
INSERT INTO `menu_role` VALUES ('88', '5', '204');
INSERT INTO `menu_role` VALUES ('89', '5', '30');
INSERT INTO `menu_role` VALUES ('90', '5', '301');
INSERT INTO `menu_role` VALUES ('91', '5', '302');
INSERT INTO `menu_role` VALUES ('92', '5', '303');
INSERT INTO `menu_role` VALUES ('93', '5', '304');
INSERT INTO `menu_role` VALUES ('94', '5', '40');
INSERT INTO `menu_role` VALUES ('95', '5', '401');
INSERT INTO `menu_role` VALUES ('96', '5', '402');
INSERT INTO `menu_role` VALUES ('97', '5', '403');
INSERT INTO `menu_role` VALUES ('98', '5', '404');
INSERT INTO `menu_role` VALUES ('99', '5', '50');
INSERT INTO `menu_role` VALUES ('100', '5', '502');
INSERT INTO `menu_role` VALUES ('101', '5', '503');
INSERT INTO `menu_role` VALUES ('102', '4', '10');
INSERT INTO `menu_role` VALUES ('103', '4', '20');
INSERT INTO `menu_role` VALUES ('104', '4', '30');
INSERT INTO `menu_role` VALUES ('105', '4', '40');
INSERT INTO `menu_role` VALUES ('106', '4', '50');
INSERT INTO `menu_role` VALUES ('107', '4', '60');
INSERT INTO `menu_role` VALUES ('108', '4', '101');
INSERT INTO `menu_role` VALUES ('109', '4', '102');
INSERT INTO `menu_role` VALUES ('110', '4', '103');
INSERT INTO `menu_role` VALUES ('111', '4', '201');
INSERT INTO `menu_role` VALUES ('112', '4', '202');
INSERT INTO `menu_role` VALUES ('113', '4', '203');
INSERT INTO `menu_role` VALUES ('114', '4', '204');
INSERT INTO `menu_role` VALUES ('115', '4', '205');
INSERT INTO `menu_role` VALUES ('116', '4', '206');
INSERT INTO `menu_role` VALUES ('117', '4', '301');
INSERT INTO `menu_role` VALUES ('118', '4', '302');
INSERT INTO `menu_role` VALUES ('119', '4', '303');
INSERT INTO `menu_role` VALUES ('120', '4', '304');
INSERT INTO `menu_role` VALUES ('121', '4', '305');
INSERT INTO `menu_role` VALUES ('122', '4', '306');
INSERT INTO `menu_role` VALUES ('123', '4', '401');
INSERT INTO `menu_role` VALUES ('124', '4', '402');
INSERT INTO `menu_role` VALUES ('125', '4', '403');
INSERT INTO `menu_role` VALUES ('126', '4', '404');
INSERT INTO `menu_role` VALUES ('127', '4', '405');
INSERT INTO `menu_role` VALUES ('128', '4', '406');
INSERT INTO `menu_role` VALUES ('129', '4', '501');
INSERT INTO `menu_role` VALUES ('130', '4', '502');
INSERT INTO `menu_role` VALUES ('131', '4', '503');
INSERT INTO `menu_role` VALUES ('132', '4', '601');
INSERT INTO `menu_role` VALUES ('133', '4', '602');
INSERT INTO `menu_role` VALUES ('134', '4', '603');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市');
INSERT INTO `province` VALUES ('2', '天津市');
INSERT INTO `province` VALUES ('3', '上海市');
INSERT INTO `province` VALUES ('4', '重庆市');
INSERT INTO `province` VALUES ('5', '河北省');
INSERT INTO `province` VALUES ('6', '山西省');
INSERT INTO `province` VALUES ('7', '辽宁省');
INSERT INTO `province` VALUES ('8', '吉林省');
INSERT INTO `province` VALUES ('9', '黑龙江省');
INSERT INTO `province` VALUES ('10', '江苏省');
INSERT INTO `province` VALUES ('11', '浙江省');
INSERT INTO `province` VALUES ('12', '安徽省');
INSERT INTO `province` VALUES ('13', '福建省');
INSERT INTO `province` VALUES ('14', '江西省');
INSERT INTO `province` VALUES ('15', '山东省');
INSERT INTO `province` VALUES ('16', '河南省');
INSERT INTO `province` VALUES ('17', '湖北省');
INSERT INTO `province` VALUES ('18', '湖南省');
INSERT INTO `province` VALUES ('19', '广东省');
INSERT INTO `province` VALUES ('20', '海南省');
INSERT INTO `province` VALUES ('21', '四川省');
INSERT INTO `province` VALUES ('22', '贵州省');
INSERT INTO `province` VALUES ('23', '云南省');
INSERT INTO `province` VALUES ('24', '山西省');
INSERT INTO `province` VALUES ('25', '甘肃省');
INSERT INTO `province` VALUES ('26', '青海省');
INSERT INTO `province` VALUES ('27', '台湾');
INSERT INTO `province` VALUES ('28', '内蒙古自治区');
INSERT INTO `province` VALUES ('29', '广西壮族自治区');
INSERT INTO `province` VALUES ('30', '西藏自治区');
INSERT INTO `province` VALUES ('31', '宁夏回族自治区');
INSERT INTO `province` VALUES ('32', '新疆维吾尔族自治区');
INSERT INTO `province` VALUES ('33', '香港特别行政区');
INSERT INTO `province` VALUES ('34', '澳门特别行政区');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '编辑');
INSERT INTO `role` VALUES ('2', '助理编辑');
INSERT INTO `role` VALUES ('3', '主任助理');
INSERT INTO `role` VALUES ('4', '超级管理员');
INSERT INTO `role` VALUES ('5', '主任编辑');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `uname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'password=toMD5(uname+密码)',
  `petname` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `age` int(11) DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否已经实名认证',
  `role` int(11) DEFAULT '0' COMMENT '角色类别',
  `groupId` int(11) DEFAULT '1' COMMENT '存放充值的总数',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'bbc994a0b6ac4c429c4b8f728b564fb2', '1', 'EEAFB716F93FA090D7716749A6EEFA72', 'W', '女', '22', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('2', 'fd63cf85ce7e4dabb509b76c6ae5b4dd', 'adasz', 'A378B43D8274631937EF177ACC059E6B', '111111', '男', '111', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('3', 'f3ef30f19db54b938a8813d548925a24', 'aqza', '1648638715E7B400F095E289A742B9B2', '11d', '男', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('4', '2f45c38763134f19b6c059bb0228c8c6', 'baba', 'F5387BA251B44DCC13632C1332BB716B', 'adfhu', '男', '21', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('5', '2d1be9a4a03941859d05a7bfb1e48c20', 'ds', 'BD9513C84A91C74B5F4415F95EF0F5F6', 'ds', '男', '1', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('6', '4ac49afbffbf4d8eb453e43fe5892ee6', 'dsd111', 'DCB887576796CEF76A8170388522B4AE', 'adss', '男', '12', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('7', '333e8d9c54ca44cf9b5d211ef7459253', 'DSDS', '4E005ADF36F296E7CA9B8EBF691022D6', 'AAA', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('8', 'ab0fe617861048a3991fa570d0533635', 'dsdsdsa', '0581A8E9CBCB79C5F1467F7F594EB8A9', '1121', '女', '1', '', '', '0', '3', '1');
INSERT INTO `user` VALUES ('9', '3dcb33a348d0447aa0dcdc31e4be9fc4', 'gggg', '805ED5716B31F26945DEDE70CDDB2405', '1121', '男', '43', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('10', '7a680e0b79f64f8aa960a733671cf491', 'hujintao', 'CEC0137264611F7999CD23E8B5767CCC', '胡进涛', '男', '50', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('11', 'd61d7a402295476c82a356bfe2499ab2', 'likeqiang', '53D3160DA5549040B367C934FA00EF4E', '李克强', '男', '50', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('12', 'aa70e35a0dad4c1ebcd3bb13b551213c', 'ms', '3376EC73E91EBD975D2AFFD02B68A262', '秘书', '女', '20', '', '', '0', '3', '1');
INSERT INTO `user` VALUES ('13', '90c22d6ce66a423eb8f18fa1a900d7e3', 'qwqwq', 'CE5D4F6CD3922D084A22DDC25DEF9FF9', '112as', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('14', '6a2425d9e6a84359a8cdb334d7536ce6', 'sd', 'D766EFB1DFCF3373895112F9C936D620', '1', '男', '1', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('15', '6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127', 'songhao', '70871D1F655F6266C54ADDAEADE4BCBC', '宋豪', '男', '20', '', '', '0', '4', '1');
INSERT INTO `user` VALUES ('16', '4e810c23b9c34633a21a83efbecb256f', 'ssdftw', 'AC182D1A70EEC2B0451921606C4B5038', '121', '男', '122', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('17', 'a351f617f77148d38bfc4ef64b1cdb39', 'weewq', '30D56682AC1EC33924648892CD58FDCC', 'ds', '男', '12', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('18', '8bb63fb4c60f4857af1c5b653bffba07', 'wenchen', '3EAE24F429DEAD060334275C71B152B7', '文臣', '男', '20', '437631891@qq.com', '15071451506', '1', '4', '2');
INSERT INTO `user` VALUES ('19', '49bb63e12b384283856c741eac2dec06', 'wenchen1', '4A717165D9873A4173DA5B48960B7A2E', '文臣', '女', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('20', '51f77905eaf84947a57beb8fc9c78992', 'wenchen10', '4B35A210F3C23DAC27A4F27E332C6FA4', '文臣10', '男', '3', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('21', '84a9f8d7873848ef9ebcb47cb1045fb1', 'wenchen11', '241E38C194059DB950DD504ED2D61C06', '文臣11', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('22', '798204b6b6e34f88ac06d7124c6cca23', 'wenchen111', 'E1B33A242C2D452EC874386406D3001A', 'wenc', '男', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('23', '0e568c53e0f54e638a95c4e4a074e8d8', 'wenchen1111', '331EA32985C585D0C228D8B36B8AEBE1', '文臣1111', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('24', '8ebc6e41f478431b9b7c36c0b3c1afd2', 'wenchen1112a', '77AD557816FB98FD1DE26F875203DC27', 'aa', '女', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('25', 'da9288f2048f4d58875d90bd816b3f7c', 'wenchen12', 'A9FE0D95D11A2D0AE8AD7B9713CC2D91', '文臣12', '男', '3', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('26', '2917a8e71bc54daf9d82b915762e74a9', 'wenchen2', '8A4B6FC981408BFB4A1AE74E063F90B9', '文臣2', '女', '41', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('27', '0927ca91313a4fe6983a15cdb22152f7', 'wenchen3', 'BC4B23665A6CBEB806A822AE9527376A', '文臣3', '男', '111', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('28', '95e5197f352146588cd062689e117404', 'wenchen4', 'E96AF3C7D33682CA636E322AA40739CB', '文臣4', '女', '21', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('29', '11fe6e4ee09c492aade363534929013f', 'wenchen5', '7B7D8230E1B0B400B09F35A640B85AE0', '文臣', '男', '32', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('30', '9c90b4e038da49719e6a6d67dbfe7da3', 'wenchen6', '450916D09FEA68E2E8945D8B1100C0ED', '文臣6', '男', '13', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('31', '767ec177b9dc4339bb785268908af30d', 'wenchen7', '5078778F5D50F2B610F35529132E1F25', '文臣7', '男', '1', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('32', '064006c6bf9a47ec95dcfaceecc79127', 'wenchen8', '595434DF3E580CB9E60DB9C595F8AF36', '文臣8', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('33', '2b00365771d44e49931c27e0f4838959', 'wenchen9', '395CA8D4FCC38C211CDE2222C9945507', '文臣9', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('34', '0cd39259c28e4fac9919674950176a9d', 'wenjiabao', 'wenjiabao123456', '稳架包', '女', '50', '434732@qq.com', '11464122', '0', '1', '1');
INSERT INTO `user` VALUES ('35', '513fabed237d48439da444d35d5e8fb6', 'xijinping', 'E1EC84D67E7C7D934DB5A873E471F47D', '习京平', '男', '50', '', '', '1', '2', '1');
INSERT INTO `user` VALUES ('36', '16fea50768d94ea0ba1650f6c1e71985', 'zhangjie', '4797D6402E91993A5B3C61CF93033B73', '张杰', '男', '20', '', '', '1', '1', '1');

-- ----------------------------
-- Table structure for user_authory
-- ----------------------------
DROP TABLE IF EXISTS `user_authory`;
CREATE TABLE `user_authory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `authory_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_authory
-- ----------------------------

-- ----------------------------
-- Table structure for user_eva
-- ----------------------------
DROP TABLE IF EXISTS `user_eva`;
CREATE TABLE `user_eva` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_eva
-- ----------------------------
INSERT INTO `user_eva` VALUES ('1', 'wenjiabao', '无良商家');
INSERT INTO `user_eva` VALUES ('2', 'xijinping', 'sssssssss无良商家');
INSERT INTO `user_eva` VALUES ('3', 'ms', 'fdsfsdfsdf无良商家fdfdsf');

-- ----------------------------
-- Table structure for validate
-- ----------------------------
DROP TABLE IF EXISTS `validate`;
CREATE TABLE `validate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8 DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `birthday` date DEFAULT '2000-01-01',
  `id_card` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  `city` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of validate
-- ----------------------------
INSERT INTO `validate` VALUES ('1', 'wenchen', '文臣', '1996-04-25', '420822199604256738', '17', '1');
INSERT INTO `validate` VALUES ('2', 'wenjiabao', '稳架包', '2017-05-31', '666666666666666666', '17', '1');
INSERT INTO `validate` VALUES ('3', 'xijinping', '习京平', '2000-01-01', '', '17', '1');
INSERT INTO `validate` VALUES ('4', 'likeqiang', '李克强', '2000-01-01', '', '1', '18');
INSERT INTO `validate` VALUES ('5', 'ms', '', '2000-01-01', '', '1', '18');

-- ----------------------------
-- Table structure for web_user
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT '',
  `age` int(2) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user
-- ----------------------------
INSERT INTO `web_user` VALUES ('1', 'wenchen', '3EAE24F429DEAD060334275C71B152B7', '', '0', null, null);
INSERT INTO `web_user` VALUES ('2', 'wenchen1', '4A717165D9873A4173DA5B48960B7A2E', '', '0', null, null);
INSERT INTO `web_user` VALUES ('4', 'wenchen2', '8A4B6FC981408BFB4A1AE74E063F90B9', '', '0', null, null);
INSERT INTO `web_user` VALUES ('5', 'wenchen3', 'BC4B23665A6CBEB806A822AE9527376A', '男', '0', 'dhasuid@qq.com', null);
INSERT INTO `web_user` VALUES ('6', 'wenchen4', 'E96AF3C7D33682CA636E322AA40739CB', '男', '0', '4123@qq.com', null);
INSERT INTO `web_user` VALUES ('7', 'wenchen5', '7B7D8230E1B0B400B09F35A640B85AE0', '男', '0', 'wenchkl@qq.com', null);
INSERT INTO `web_user` VALUES ('8', 'wenchen6', '450916D09FEA68E2E8945D8B1100C0ED', '女', '0', 'dasd2@sina.com', null);
INSERT INTO `web_user` VALUES ('9', '', 'D41D8CD98F00B204E9800998ECF8427E', '男', '0', '', null);
INSERT INTO `web_user` VALUES ('10', 'wenchena', 'F06AAE816472D757F0E52E9451781E64', '女', '0', 'hahah@qq.com', null);

-- ----------------------------
-- View structure for v_news
-- ----------------------------
DROP VIEW IF EXISTS `v_news`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_news` AS select `news`.`Id` AS `Id`,`news`.`dm` AS `dm`,`news`.`lx` AS `lx`,`news`.`title` AS `title`,`news`.`sqr` AS `sqr`,`news`.`imgUrl` AS `imgUrl`,`news`.`href` AS `href`,`news`.`date` AS `date`,`news`.`zt` AS `zt`,`news`.`remark` AS `remark`,`cg`.`fzr` AS `fzr`,`cg`.`glr` AS `glr` from ((`j_news` `news` join `user` `u` on((`u`.`uname` = `news`.`sqr`))) join `c_group` `cg` on((`cg`.`Id` = `u`.`groupId`))) ;

-- ----------------------------
-- View structure for v_tp
-- ----------------------------
DROP VIEW IF EXISTS `v_tp`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_tp` AS select `tp`.`Id` AS `Id`,`tp`.`dm` AS `dm`,`tp`.`lx` AS `lx`,`tp`.`sqr` AS `sqr`,`tp`.`imgUrl` AS `imgUrl`,`tp`.`href` AS `href`,`tp`.`date` AS `date`,`tp`.`zt` AS `zt`,`tp`.`remark` AS `remark`,`cg`.`fzr` AS `fzr`,`cg`.`glr` AS `glr` from ((`j_tp` `tp` join `user` `u` on((`u`.`uname` = `tp`.`sqr`))) join `c_group` `cg` on((`cg`.`Id` = `u`.`groupId`))) ;

-- ----------------------------
-- Procedure structure for privility
-- ----------------------------
DROP PROCEDURE IF EXISTS `privility`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `privility`(IN  role INT)
BEGIN
	DECLARE temp INT DEFAULT 0;
	DECLARE num INT DEFAULT 0;
	DECLARE row CURSOR FOR SELECT Id FROM menu;
	DECLARE EXIT HANDLER FOR NOT FOUND CLOSE row;
	SELECT count(*) INTO num FROM menu_role;
	OPEN row;
	REPEAT
		FETCH row INTO temp;
		INSERT INTO menu_role(role_id,menu_id) VALUES (role,temp);
		set num=num-1;
	UNTIL 0 END REPEAT;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for TEST
-- ----------------------------
DROP PROCEDURE IF EXISTS `TEST`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `TEST`()
BEGIN
	DECLARE temp_id INT;
	DECLARE temp_lx INT;
	DECLARE num INT;
	DECLARE row CURSOR FOR SELECT Id,lx FROM j_news;
	DECLARE EXIT HANDLER FOR NOT FOUND CLOSE row;
	SELECT COUNT(*) INTO num FROM j_news;
		OPEN row;
		REPEAT
			FETCH row INTO temp_id,temp_lx;
			UPDATE j_news SET dm=CONCAT(temp_id,temp_lx) WHERE Id=temp_id;
			SET num = num-1;
		UNTIL 0 END REPEAT;
		CLOSE row;
END
;;
DELIMITER ;
