/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : mrblog

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-11 22:23:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bk_access`
-- ----------------------------
DROP TABLE IF EXISTS `bk_access`;
CREATE TABLE `bk_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色的ID',
  `permission_id` int(11) NOT NULL COMMENT '节点的ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识是用户组还是用户1为用户组2为用户,默认为用户组',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `node_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8 COMMENT='权限表_by_jiang';

-- ----------------------------
-- Records of bk_access
-- ----------------------------
INSERT INTO `bk_access` VALUES ('394', '2', '1', '1');
INSERT INTO `bk_access` VALUES ('395', '2', '43', '1');
INSERT INTO `bk_access` VALUES ('396', '2', '55', '1');
INSERT INTO `bk_access` VALUES ('397', '2', '73', '1');
INSERT INTO `bk_access` VALUES ('398', '2', '56', '1');
INSERT INTO `bk_access` VALUES ('399', '2', '57', '1');
INSERT INTO `bk_access` VALUES ('400', '2', '58', '1');
INSERT INTO `bk_access` VALUES ('401', '2', '59', '1');
INSERT INTO `bk_access` VALUES ('402', '2', '60', '1');
INSERT INTO `bk_access` VALUES ('403', '2', '61', '1');
INSERT INTO `bk_access` VALUES ('404', '2', '62', '1');
INSERT INTO `bk_access` VALUES ('405', '2', '63', '1');
INSERT INTO `bk_access` VALUES ('406', '2', '67', '1');
INSERT INTO `bk_access` VALUES ('407', '2', '4', '1');
INSERT INTO `bk_access` VALUES ('408', '2', '20', '1');
INSERT INTO `bk_access` VALUES ('409', '2', '27', '1');
INSERT INTO `bk_access` VALUES ('410', '2', '28', '1');
INSERT INTO `bk_access` VALUES ('411', '2', '29', '1');
INSERT INTO `bk_access` VALUES ('412', '2', '2', '1');
INSERT INTO `bk_access` VALUES ('413', '2', '23', '1');
INSERT INTO `bk_access` VALUES ('414', '2', '24', '1');
INSERT INTO `bk_access` VALUES ('415', '2', '25', '1');
INSERT INTO `bk_access` VALUES ('416', '2', '26', '1');
INSERT INTO `bk_access` VALUES ('417', '2', '3', '1');
INSERT INTO `bk_access` VALUES ('418', '2', '30', '1');
INSERT INTO `bk_access` VALUES ('419', '2', '31', '1');
INSERT INTO `bk_access` VALUES ('420', '2', '32', '1');
INSERT INTO `bk_access` VALUES ('421', '2', '33', '1');
INSERT INTO `bk_access` VALUES ('422', '2', '68', '1');
INSERT INTO `bk_access` VALUES ('423', '2', '53', '1');
INSERT INTO `bk_access` VALUES ('424', '2', '34', '1');
INSERT INTO `bk_access` VALUES ('425', '2', '69', '1');
INSERT INTO `bk_access` VALUES ('426', '2', '36', '1');
INSERT INTO `bk_access` VALUES ('427', '2', '35', '1');
INSERT INTO `bk_access` VALUES ('428', '2', '48', '1');
INSERT INTO `bk_access` VALUES ('429', '2', '49', '1');
INSERT INTO `bk_access` VALUES ('430', '2', '37', '1');
INSERT INTO `bk_access` VALUES ('431', '2', '45', '1');
INSERT INTO `bk_access` VALUES ('432', '2', '46', '1');
INSERT INTO `bk_access` VALUES ('433', '2', '47', '1');
INSERT INTO `bk_access` VALUES ('434', '2', '42', '1');
INSERT INTO `bk_access` VALUES ('435', '2', '50', '1');
INSERT INTO `bk_access` VALUES ('436', '2', '51', '1');
INSERT INTO `bk_access` VALUES ('437', '2', '52', '1');
INSERT INTO `bk_access` VALUES ('438', '2', '66', '1');
INSERT INTO `bk_access` VALUES ('439', '2', '44', '1');
INSERT INTO `bk_access` VALUES ('517', '2', '1', '2');
INSERT INTO `bk_access` VALUES ('518', '2', '43', '2');
INSERT INTO `bk_access` VALUES ('519', '2', '55', '2');
INSERT INTO `bk_access` VALUES ('520', '2', '73', '2');
INSERT INTO `bk_access` VALUES ('521', '2', '59', '2');
INSERT INTO `bk_access` VALUES ('522', '2', '67', '2');
INSERT INTO `bk_access` VALUES ('523', '2', '4', '2');
INSERT INTO `bk_access` VALUES ('524', '2', '2', '2');
INSERT INTO `bk_access` VALUES ('525', '2', '3', '2');
INSERT INTO `bk_access` VALUES ('526', '2', '68', '2');
INSERT INTO `bk_access` VALUES ('527', '2', '53', '2');

-- ----------------------------
-- Table structure for `bk_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `bk_action_log`;
CREATE TABLE `bk_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '登录的用户名',
  `user_id` int(11) NOT NULL COMMENT '登录的用户ID',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_adress` varchar(255) NOT NULL COMMENT 'ip所属的地区',
  `add_time` int(11) NOT NULL,
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `content` text NOT NULL COMMENT '记录的内容',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `addtime` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_action_log
-- ----------------------------
INSERT INTO `bk_action_log` VALUES ('1', 'admin', '1', '127.0.0.1', '', '1433318628', '管理员', '');
INSERT INTO `bk_action_log` VALUES ('2', 'admin', '1', '127.0.0.1', '', '1433319059', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('3', 'admin', '1', '127.0.0.1', '', '1433319146', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('4', 'test', '2', '127.0.0.1', '', '1433323585', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('5', 'admin', '1', '127.0.0.1', '', '1433323596', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('6', 'test', '2', '127.0.0.1', '', '1433387021', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('7', 'admin', '1', '127.0.0.1', '', '1433387092', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('8', 'admin', '1', '127.0.0.1', '', '1433387394', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('9', 'admin', '1', '127.0.0.1', '', '1433387489', '管理员', '增加了新的系统用户：test1231231123');
INSERT INTO `bk_action_log` VALUES ('10', 'admin', '1', '127.0.0.1', '', '1433388058', '管理员', '编辑了系统用户：test1231231123');
INSERT INTO `bk_action_log` VALUES ('11', 'admin', '1', '127.0.0.1', '', '1433389439', '管理员', '增加了新的系统用户：123123aab');
INSERT INTO `bk_action_log` VALUES ('12', 'admin', '1', '127.0.0.1', '', '1433389488', '管理员', '增加了新的系统用户：12313123123');
INSERT INTO `bk_action_log` VALUES ('13', 'admin', '1', '127.0.0.1', '', '1433389702', '管理员', '增加了新的系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('14', 'admin', '1', '127.0.0.1', '', '1433389728', '管理员', '增加了新的系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('15', 'admin', '1', '127.0.0.1', '', '1433390103', '管理员', '删除了系统用户：12313123123');
INSERT INTO `bk_action_log` VALUES ('16', 'admin', '1', '127.0.0.1', '', '1433390300', '管理员', '删除了系统用户：123123aab');
INSERT INTO `bk_action_log` VALUES ('17', 'admin', '1', '127.0.0.1', '', '1433390407', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('18', 'test', '2', '127.0.0.1', '', '1433390430', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('19', 'admin', '1', '127.0.0.1', '', '1433397520', '管理员', '增加了新的用户组：sdfasf');
INSERT INTO `bk_action_log` VALUES ('20', 'admin', '1', '127.0.0.1', '', '1433398047', '管理员', '编辑了用户组：sdfasf');
INSERT INTO `bk_action_log` VALUES ('21', 'admin', '1', '127.0.0.1', '', '1433398364', '管理员', '删除了系统用户：sdfasf');
INSERT INTO `bk_action_log` VALUES ('22', 'admin', '1', '127.0.0.1', '', '1433398384', '管理员', '删除了用户组：test123');
INSERT INTO `bk_action_log` VALUES ('23', 'admin', '1', '127.0.0.1', '', '1433398933', '管理员', '增加了新的用户组：:groupname');
INSERT INTO `bk_action_log` VALUES ('24', 'admin', '1', '127.0.0.1', '', '1433398963', '管理员', '改变了用户组的权限：测试用户组');
INSERT INTO `bk_action_log` VALUES ('25', 'admin', '1', '127.0.0.1', '', '1433399098', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('26', 'admin', '1', '127.0.0.1', '', '1433400975', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('27', 'admin', '1', '127.0.0.1', '', '1433408366', '管理员', '增加了新的系统用户：test123');
INSERT INTO `bk_action_log` VALUES ('28', 'admin', '1', '127.0.0.1', '', '1433408371', '管理员', '删除了系统用户：test123');
INSERT INTO `bk_action_log` VALUES ('29', 'admin', '1', '127.0.0.1', '', '1433408376', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('30', 'admin', '1', '127.0.0.1', '', '1433904485', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('31', 'admin', '1', '127.0.0.1', '', '1433904731', '管理员', '增加了新的用户组：1123');
INSERT INTO `bk_action_log` VALUES ('32', 'admin', '1', '127.0.0.1', '', '1433904744', '管理员', '删除了用户组：1123');
INSERT INTO `bk_action_log` VALUES ('33', 'test', '2', '127.0.0.1', '', '1433905009', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('34', 'admin', '1', '127.0.0.1', '', '1433907007', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('35', 'admin', '1', '127.0.0.1', '', '1433909004', '管理员', '增加了新的用户组：1123');
INSERT INTO `bk_action_log` VALUES ('36', 'admin', '1', '127.0.0.1', '', '1433985688', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('37', 'admin', '1', '127.0.0.1', '', '1434093122', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('38', 'admin', '1', '127.0.0.1', '', '1434094731', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('39', 'admin', '1', '127.0.0.1', '', '1434333022', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('40', 'admin', '1', '127.0.0.1', '', '1434333284', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('41', 'admin', '1', '127.0.0.1', '', '1434334022', '管理员', '增加了新的用户组：123123ssss');
INSERT INTO `bk_action_log` VALUES ('42', 'admin', '1', '127.0.0.1', '', '1434334039', '管理员', '编辑了用户组：123123ssssa');
INSERT INTO `bk_action_log` VALUES ('43', 'admin', '1', '127.0.0.1', '', '1434334965', '管理员', '删除了用户组：123123ssssa');
INSERT INTO `bk_action_log` VALUES ('44', 'admin', '1', '127.0.0.1', '', '1434334970', '管理员', '删除了用户组：1123');
INSERT INTO `bk_action_log` VALUES ('45', 'admin', '1', '127.0.0.1', '', '1434335101', '管理员', '增加了新的工作流：工作流2');
INSERT INTO `bk_action_log` VALUES ('46', 'admin', '1', '127.0.0.1', '', '1434335308', '管理员', '增加了新的工作流：工作流3');
INSERT INTO `bk_action_log` VALUES ('47', 'admin', '1', '127.0.0.1', '', '1434336740', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('48', 'admin', '1', '127.0.0.1', '', '1434337228', '管理员', '编辑了工作流：工作流11');
INSERT INTO `bk_action_log` VALUES ('49', 'admin', '1', '127.0.0.1', '', '1434337255', '管理员', '增加了新的工作流：123123');
INSERT INTO `bk_action_log` VALUES ('50', 'admin', '1', '127.0.0.1', '', '1434338302', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('51', 'admin', '1', '127.0.0.1', '', '1434338514', '管理员', '删除了工作流：工作流2');
INSERT INTO `bk_action_log` VALUES ('52', 'admin', '1', '127.0.0.1', '', '1434339359', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('53', 'admin', '1', '127.0.0.1', '', '1434339370', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('54', 'admin', '1', '127.0.0.1', '', '1434339391', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('55', 'admin', '1', '127.0.0.1', '', '1434339412', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('56', 'admin', '1', '127.0.0.1', '', '1434339442', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('57', 'admin', '1', '127.0.0.1', '', '1434339604', '管理员', '增加了新的系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('58', 'admin', '1', '127.0.0.1', '', '1434339625', '管理员', '改变了用户的权限：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('59', 'admin', '1', '127.0.0.1', '', '1434339648', '管理员', '删除了系统用户：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('60', 'admin', '1', '127.0.0.1', '', '1434339672', '管理员', '改变了用户组的权限：测试用户组');
INSERT INTO `bk_action_log` VALUES ('61', 'admin', '1', '127.0.0.1', '', '1434339687', '管理员', '增加了新的系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('62', 'admin', '1', '127.0.0.1', '', '1434339703', '管理员', '改变了用户的权限：123123gg');
INSERT INTO `bk_action_log` VALUES ('63', 'admin', '1', '127.0.0.1', '', '1434339721', '管理员', '删除了系统用户：123123gg');
INSERT INTO `bk_action_log` VALUES ('64', 'admin', '1', '127.0.0.1', '', '1434339734', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('65', 'admin', '1', '127.0.0.1', '', '1434339747', '管理员', '删除了用户组：测试用户组');
INSERT INTO `bk_action_log` VALUES ('66', 'admin', '1', '127.0.0.1', '', '1434341772', '管理员', '编辑了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('67', 'admin', '1', '127.0.0.1', '', '1434345134', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('68', 'admin', '1', '127.0.0.1', '', '1434347265', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('69', 'admin', '1', '127.0.0.1', '', '1434349496', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('70', 'admin', '1', '127.0.0.1', '', '1434352541', '管理员', '增加了新的工作流步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('71', 'admin', '1', '127.0.0.1', '', '1434352641', '管理员', '增加了新的工作流步骤：公司复责人审核');
INSERT INTO `bk_action_log` VALUES ('72', 'admin', '1', '127.0.0.1', '', '1434353123', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('73', 'admin', '1', '127.0.0.1', '', '1434354662', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('74', 'admin', '1', '127.0.0.1', '', '1434354730', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('75', 'admin', '1', '127.0.0.1', '', '1434354742', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('76', 'admin', '1', '127.0.0.1', '', '1434354752', '管理员', '编辑了工作流步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('77', 'admin', '1', '127.0.0.1', '', '1434354837', '管理员', '增加了新的工作流步骤：xx');
INSERT INTO `bk_action_log` VALUES ('78', 'admin', '1', '127.0.0.1', '', '1434354941', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('79', 'admin', '1', '127.0.0.1', '', '1434355261', '管理员', '删除了工作流步骤：xx');
INSERT INTO `bk_action_log` VALUES ('80', 'admin', '1', '127.0.0.1', '', '1434422513', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('81', 'admin', '1', '127.0.0.1', '', '1434441684', '管理员', '关联了用户test到工作流工作流1中的审核步骤财务审核');
INSERT INTO `bk_action_log` VALUES ('82', 'admin', '1', '127.0.0.1', '', '1434441764', '管理员', '关联了用户：test到工作流：工作流1中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('83', 'admin', '1', '127.0.0.1', '', '1434441764', '管理员', '关联了用户：管理员到工作流：工作流1中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('84', 'admin', '1', '127.0.0.1', '', '1434441789', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('85', 'admin', '1', '127.0.0.1', '', '1434441789', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('86', 'admin', '1', '127.0.0.1', '', '1434441843', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务审核');
INSERT INTO `bk_action_log` VALUES ('87', 'admin', '1', '127.0.0.1', '', '1434443074', '管理员', '增加了新的工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('88', 'admin', '1', '127.0.0.1', '', '1434443280', '管理员', '编辑了工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('89', 'admin', '1', '127.0.0.1', '', '1434443296', '管理员', '增加了新的工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('90', 'admin', '1', '127.0.0.1', '', '1434443311', '管理员', '增加了新的工作流步骤：ads');
INSERT INTO `bk_action_log` VALUES ('91', 'admin', '1', '127.0.0.1', '', '1434443332', '管理员', '关联了用户：test 到工作流：测试仪 中的审核步骤：123');
INSERT INTO `bk_action_log` VALUES ('92', 'admin', '1', '127.0.0.1', '', '1434443347', '管理员', '关联了用户：管理员 到工作流：测试仪 中的审核步骤：ads');
INSERT INTO `bk_action_log` VALUES ('93', 'admin', '1', '127.0.0.1', '', '1434443452', '管理员', '增加了新的工作流步骤：1231');
INSERT INTO `bk_action_log` VALUES ('94', 'admin', '1', '127.0.0.1', '', '1434443543', '管理员', '增加了新的工作流步骤：123123123');
INSERT INTO `bk_action_log` VALUES ('95', 'admin', '1', '127.0.0.1', '', '1434443554', '管理员', '删除了工作流步骤：123123123');
INSERT INTO `bk_action_log` VALUES ('96', 'admin', '1', '127.0.0.1', '', '1434443580', '管理员', '删除了工作流：测试仪');
INSERT INTO `bk_action_log` VALUES ('97', 'admin', '1', '127.0.0.1', '', '1434443792', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('98', 'admin', '1', '127.0.0.1', '', '1434443823', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('99', 'test', '2', '127.0.0.1', '', '1434443878', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('100', 'test', '2', '127.0.0.1', '', '1434444960', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('101', 'test', '2', '127.0.0.1', '', '1434444985', 'test', '增加了新的工作流：123');
INSERT INTO `bk_action_log` VALUES ('102', 'test', '2', '127.0.0.1', '', '1434444994', 'test', '编辑了工作流：123');
INSERT INTO `bk_action_log` VALUES ('103', 'test', '2', '127.0.0.1', '', '1434445001', 'test', '删除了工作流：123');
INSERT INTO `bk_action_log` VALUES ('104', 'admin', '1', '127.0.0.1', '', '1434445027', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('105', 'admin', '1', '127.0.0.1', '', '1434445038', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('106', 'admin', '1', '127.0.0.1', '', '1434507752', '管理员', '关联了用户：test 到工作流：工作流1 中的审核步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('107', 'admin', '1', '127.0.0.1', '', '1434507752', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：财务总监审核');
INSERT INTO `bk_action_log` VALUES ('108', 'admin', '1', '127.0.0.1', '', '1434507770', '管理员', '关联了用户：管理员 到工作流：工作流1 中的审核步骤：公司负责人审核');
INSERT INTO `bk_action_log` VALUES ('109', 'admin', '1', '127.0.0.1', '', '1434508916', '管理员', '增加了新的工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('110', 'admin', '1', '127.0.0.1', '', '1434508942', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('111', 'admin', '1', '127.0.0.1', '', '1434509294', '管理员', '编辑了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('112', 'admin', '1', '127.0.0.1', '', '1434509313', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('113', 'admin', '1', '127.0.0.1', '', '1434509520', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('114', 'admin', '1', '127.0.0.1', '', '1434516742', '管理员', '增加了新的工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('115', 'admin', '1', '127.0.0.1', '', '1434516769', '管理员', '增加了新的工作流步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('116', 'admin', '1', '127.0.0.1', '', '1434516774', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('117', 'admin', '1', '127.0.0.1', '', '1434516845', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('118', 'admin', '1', '127.0.0.1', '', '1434516853', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('119', 'admin', '1', '127.0.0.1', '', '1434516853', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('120', 'admin', '1', '127.0.0.1', '', '1434517331', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('121', 'admin', '1', '127.0.0.1', '', '1434520918', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('122', 'admin', '1', '127.0.0.1', '', '1434523410', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('123', 'admin', '1', '127.0.0.1', '', '1434523426', '管理员', '编辑了工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('124', 'admin', '1', '127.0.0.1', '', '1434523612', '管理员', '关联了用户：test 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('125', 'admin', '1', '127.0.0.1', '', '1434523635', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('126', 'test', '2', '127.0.0.1', '', '1434523662', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('127', 'test', '2', '127.0.0.1', '', '1434524881', 'test', '增加了新的工作流：xx');
INSERT INTO `bk_action_log` VALUES ('128', 'test', '2', '127.0.0.1', '', '1434524889', 'test', '删除了工作流：xx');
INSERT INTO `bk_action_log` VALUES ('129', 'test', '2', '127.0.0.1', '', '1434524895', 'test', '删除了工作流：工作流11');
INSERT INTO `bk_action_log` VALUES ('130', 'admin', '1', '127.0.0.1', '', '1435044773', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('131', 'admin', '1', '127.0.0.1', '', '1435114399', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('132', 'admin', '1', '127.0.0.1', '', '1435117746', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('133', 'admin', '1', '127.0.0.1', '', '1435117778', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('134', 'admin', '1', '127.0.0.1', '', '1435118579', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('135', 'admin', '1', '127.0.0.1', '', '1435118762', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('136', 'admin', '1', '127.0.0.1', '', '1435126625', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('137', 'admin', '1', '127.0.0.1', '', '1435127311', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('138', 'admin', '1', '127.0.0.1', '', '1435127360', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('139', 'admin', '1', '127.0.0.1', '', '1435129351', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('140', 'admin', '1', '127.0.0.1', '', '1435288666', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('141', 'admin', '1', '127.0.0.1', '', '1435304943', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('142', 'admin', '1', '127.0.0.1', '', '1435304988', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('143', 'admin', '1', '127.0.0.1', '', '1435305005', '管理员', '增加了新的用户组：123');
INSERT INTO `bk_action_log` VALUES ('144', 'admin', '1', '127.0.0.1', '', '1435305072', '管理员', '编辑了工作流：测试工作流');
INSERT INTO `bk_action_log` VALUES ('145', 'admin', '1', '127.0.0.1', '', '1435305087', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('146', 'admin', '1', '127.0.0.1', '', '1435305090', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('147', 'admin', '1', '127.0.0.1', '', '1435305093', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('148', 'admin', '1', '127.0.0.1', '', '1435305096', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('149', 'admin', '1', '127.0.0.1', '', '1435305098', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('150', 'admin', '1', '127.0.0.1', '', '1435305101', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('151', 'admin', '1', '127.0.0.1', '', '1435305104', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('152', 'admin', '1', '127.0.0.1', '', '1435305106', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('153', 'admin', '1', '127.0.0.1', '', '1435305109', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('154', 'admin', '1', '127.0.0.1', '', '1435305112', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('155', 'admin', '1', '127.0.0.1', '', '1435305114', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('156', 'admin', '1', '127.0.0.1', '', '1435305144', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('157', 'admin', '1', '127.0.0.1', '', '1435305194', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('158', 'admin', '1', '127.0.0.1', '', '1435543884', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('159', 'admin', '1', '127.0.0.1', '', '1435543919', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('160', 'admin', '1', '127.0.0.1', '', '1435543924', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('161', 'admin', '1', '127.0.0.1', '', '1435544846', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('162', 'admin', '1', '127.0.0.1', '', '1435544858', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('163', 'admin', '1', '127.0.0.1', '', '1435544905', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('164', 'admin', '1', '127.0.0.1', '', '1435544909', '管理员', '改变了用户组的权限：123');
INSERT INTO `bk_action_log` VALUES ('165', 'admin', '1', '127.0.0.1', '', '1435545169', '管理员', '删除了用户组：123');
INSERT INTO `bk_action_log` VALUES ('166', 'admin', '1', '127.0.0.1', '', '1435545229', '管理员', '删除了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('167', 'admin', '1', '127.0.0.1', '', '1435545383', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('168', 'admin', '1', '127.0.0.1', '', '1435545965', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('169', 'admin', '1', '127.0.0.1', '', '1435546040', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('170', 'admin', '1', '127.0.0.1', '', '1435546116', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('171', 'admin', '1', '127.0.0.1', '', '1435546127', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('172', 'admin', '1', '127.0.0.1', '', '1435546171', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('173', 'admin', '1', '127.0.0.1', '', '1435546175', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('174', 'admin', '1', '127.0.0.1', '', '1435548904', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('175', 'admin', '1', '127.0.0.1', '', '1435551384', '管理员', '关联了用户：管理员 到工作流：测试工作流 中的审核步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('176', 'admin', '1', '127.0.0.1', '', '1435551469', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('177', 'admin', '1', '127.0.0.1', '', '1435551480', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('178', 'admin', '1', '127.0.0.1', '', '1435551487', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('179', 'admin', '1', '127.0.0.1', '', '1435551491', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('180', 'admin', '1', '127.0.0.1', '', '1435551494', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('181', 'admin', '1', '127.0.0.1', '', '1435551504', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('182', 'admin', '1', '127.0.0.1', '', '1435563248', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('183', 'admin', '1', '127.0.0.1', '', '1435563266', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('184', 'admin', '1', '127.0.0.1', '', '1435563284', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('185', 'admin', '1', '127.0.0.1', '', '1435563326', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('186', 'admin', '1', '127.0.0.1', '', '1435563375', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('187', 'admin', '1', '127.0.0.1', '', '1435563479', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('188', 'admin', '1', '127.0.0.1', '', '1435563853', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('189', 'admin', '1', '127.0.0.1', '', '1435563866', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('190', 'admin', '1', '127.0.0.1', '', '1435568665', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('191', 'admin', '1', '127.0.0.1', '', '1435630315', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('192', 'admin', '1', '127.0.0.1', '', '1435631134', '管理员', '改变了用户的权限：admin');
INSERT INTO `bk_action_log` VALUES ('193', 'admin', '1', '127.0.0.1', '', '1435631327', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('194', 'admin', '1', '127.0.0.1', '', '1435632843', '管理员', '编辑了系统用户：admin');
INSERT INTO `bk_action_log` VALUES ('195', 'admin', '1', '127.0.0.1', '', '1435637075', '管理员', '编辑了用户组：超级用户组');
INSERT INTO `bk_action_log` VALUES ('196', 'admin', '1', '127.0.0.1', '', '1435638964', '管理员', '编辑了工作流步骤：测试1');
INSERT INTO `bk_action_log` VALUES ('197', 'admin', '1', '127.0.0.1', '', '1435649867', '管理员', '改变了用户组的权限：超级用户组');
INSERT INTO `bk_action_log` VALUES ('198', 'admin', '1', '127.0.0.1', '', '1435737120', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('199', 'admin', '1', '127.0.0.1', '', '1435738202', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('200', 'admin', '1', '127.0.0.1', '', '1436147586', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('201', 'admin', '1', '127.0.0.1', '', '1436147922', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('202', 'admin', '1', '127.0.0.1', '', '1436150023', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('203', 'admin', '1', '127.0.0.1', '', '1436150360', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('204', 'admin', '1', '127.0.0.1', '', '1436150536', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('205', 'admin', '1', '127.0.0.1', '', '1436152462', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('206', 'admin', '1', '127.0.0.1', '', '1436153673', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('207', 'admin', '1', '127.0.0.1', '', '1436153740', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('208', 'admin', '1', '127.0.0.1', '', '1436156479', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('209', 'admin', '1', '127.0.0.1', '', '1436169648', '管理员', '增加了新的系统用户：test');
INSERT INTO `bk_action_log` VALUES ('210', 'admin', '1', '127.0.0.1', '', '1436169666', '管理员', '增加了新的用户组：test');
INSERT INTO `bk_action_log` VALUES ('211', 'admin', '1', '127.0.0.1', '', '1436169678', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('212', 'admin', '1', '127.0.0.1', '', '1436169830', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('213', 'admin', '1', '127.0.0.1', '', '1436169901', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('214', 'admin', '1', '127.0.0.1', '', '1436169909', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('215', 'test', '2', '127.0.0.1', '', '1436169949', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('216', 'admin', '1', '127.0.0.1', '', '1436170007', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('217', 'test', '2', '127.0.0.1', '', '1436170015', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('218', 'admin', '1', '127.0.0.1', '', '1436170400', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('219', 'test', '2', '127.0.0.1', '', '1436170410', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('220', 'admin', '1', '127.0.0.1', '', '1436170781', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('221', 'test', '2', '127.0.0.1', '', '1436170792', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('222', 'test', '2', '127.0.0.1', '', '1436170892', 'test', '增加了新的用户组：test2');
INSERT INTO `bk_action_log` VALUES ('223', 'test', '2', '127.0.0.1', '', '1436170910', 'test', '增加了新的系统用户：test2');
INSERT INTO `bk_action_log` VALUES ('224', 'test', '2', '127.0.0.1', '', '1436171238', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('225', 'test', '2', '127.0.0.1', '', '1436171403', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('226', 'admin', '1', '127.0.0.1', '', '1436232722', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('227', 'admin', '1', '127.0.0.1', '', '1436237053', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('228', 'admin', '1', '127.0.0.1', '', '1436237105', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('229', 'test', '2', '127.0.0.1', '', '1436237162', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('230', 'admin', '1', '127.0.0.1', '', '1436237329', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('231', 'admin', '1', '127.0.0.1', '', '1436237524', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('232', 'admin', '1', '127.0.0.1', '', '1436237637', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('233', 'admin', '1', '127.0.0.1', '', '1436237837', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('234', 'test', '2', '127.0.0.1', '', '1436237855', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('235', 'admin', '1', '127.0.0.1', '', '1436237898', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('236', 'admin', '1', '127.0.0.1', '', '1436237901', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('237', 'admin', '1', '127.0.0.1', '', '1436237909', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('238', 'admin', '1', '127.0.0.1', '', '1436238450', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('239', 'admin', '1', '127.0.0.1', '', '1436238456', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('240', 'admin', '1', '127.0.0.1', '', '1436238502', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('241', 'admin', '1', '127.0.0.1', '', '1436238870', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('242', 'admin', '1', '127.0.0.1', '', '1436238871', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('243', 'admin', '1', '127.0.0.1', '', '1436239312', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('244', 'admin', '1', '127.0.0.1', '', '1436239313', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('245', 'admin', '1', '127.0.0.1', '', '1436239654', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('246', 'admin', '1', '127.0.0.1', '', '1436239658', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('247', 'admin', '1', '127.0.0.1', '', '1436239716', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('248', 'admin', '1', '127.0.0.1', '', '1436239767', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('249', 'admin', '1', '127.0.0.1', '', '1436239771', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('250', 'admin', '1', '127.0.0.1', '', '1436240071', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('251', 'admin', '1', '127.0.0.1', '', '1436240359', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('252', 'admin', '1', '127.0.0.1', '', '1436240365', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('253', 'admin', '1', '127.0.0.1', '', '1436240399', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('254', 'admin', '1', '127.0.0.1', '', '1436240488', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('255', 'admin', '1', '127.0.0.1', '', '1436240505', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('256', 'admin', '1', '127.0.0.1', '', '1436240705', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('257', 'admin', '1', '127.0.0.1', '', '1436240712', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('258', 'admin', '1', '127.0.0.1', '', '1436240856', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('259', 'admin', '1', '127.0.0.1', '', '1436241021', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('260', 'admin', '1', '127.0.0.1', '', '1436241046', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('261', 'admin', '1', '127.0.0.1', '', '1436241056', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('262', 'admin', '1', '127.0.0.1', '', '1436241060', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('263', 'admin', '1', '127.0.0.1', '', '1436241060', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('264', 'admin', '1', '127.0.0.1', '', '1436241253', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('265', 'admin', '1', '127.0.0.1', '', '1436241261', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('266', 'admin', '1', '127.0.0.1', '', '1436241264', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('267', 'admin', '1', '127.0.0.1', '', '1436241311', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('268', 'admin', '1', '127.0.0.1', '', '1436241317', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('269', 'admin', '1', '127.0.0.1', '', '1436241322', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('270', 'admin', '1', '127.0.0.1', '', '1436241338', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('271', 'admin', '1', '127.0.0.1', '', '1436241435', '管理员', '编辑了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('272', 'admin', '1', '127.0.0.1', '', '1436241449', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('273', 'admin', '1', '127.0.0.1', '', '1436241533', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('274', 'test', '2', '127.0.0.1', '', '1436241545', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('275', 'test', '2', '127.0.0.1', '', '1436241556', 'test', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('276', 'test', '2', '127.0.0.1', '', '1436241995', 'test', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('277', 'admin', '1', '127.0.0.1', '', '1436242006', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('278', 'admin', '1', '127.0.0.1', '', '1436242054', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('279', 'admin', '1', '127.0.0.1', '', '1436242083', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('280', 'admin', '1', '127.0.0.1', '', '1436242180', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('281', 'admin', '1', '127.0.0.1', '', '1436242954', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('282', 'admin', '1', '127.0.0.1', '', '1436242957', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('283', 'admin', '1', '127.0.0.1', '', '1436242960', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('284', 'admin', '1', '127.0.0.1', '', '1436242963', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('285', 'admin', '1', '127.0.0.1', '', '1436242986', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('286', 'admin', '1', '127.0.0.1', '', '1436242989', '管理员', '改变了用户组的权限：test2');
INSERT INTO `bk_action_log` VALUES ('287', 'admin', '1', '127.0.0.1', '', '1436244454', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('288', 'admin', '1', '127.0.0.1', '', '1436245828', '管理员', '编辑了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('289', 'admin', '1', '127.0.0.1', '', '1436246346', '管理员', '删除了用户组：test2');
INSERT INTO `bk_action_log` VALUES ('290', 'admin', '1', '127.0.0.1', '', '1436246373', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('291', 'admin', '1', '127.0.0.1', '', '1436247233', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('292', 'admin', '1', '127.0.0.1', '', '1436321211', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('293', 'admin', '1', '127.0.0.1', '', '1436325559', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('294', 'admin', '1', '127.0.0.1', '', '1436499013', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('295', 'admin', '1', '127.0.0.1', '', '1436500439', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('296', 'admin', '1', '127.0.0.1', '', '1436501830', '管理员', '增加了新的工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('297', 'admin', '1', '127.0.0.1', '', '1436501908', '管理员', '编辑了工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('298', 'admin', '1', '127.0.0.1', '', '1436504505', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('299', 'admin', '1', '127.0.0.1', '', '1436504716', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('300', 'admin', '1', '127.0.0.1', '', '1436504733', '管理员', '增加了新的工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('301', 'admin', '1', '127.0.0.1', '', '1436504748', '管理员', '编辑了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('302', 'admin', '1', '127.0.0.1', '', '1436504788', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('303', 'admin', '1', '127.0.0.1', '', '1436504811', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('304', 'admin', '1', '127.0.0.1', '', '1436504822', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('305', 'admin', '1', '127.0.0.1', '', '1436504830', '管理员', '编辑了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('306', 'admin', '1', '127.0.0.1', '', '1436504841', '管理员', '增加了新的工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('307', 'admin', '1', '127.0.0.1', '', '1436504850', '管理员', '编辑了工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('308', 'admin', '1', '127.0.0.1', '', '1436504859', '管理员', '删除了工作流步骤：123');
INSERT INTO `bk_action_log` VALUES ('309', 'admin', '1', '127.0.0.1', '', '1436504863', '管理员', '删除了工作流步骤：123123gg');
INSERT INTO `bk_action_log` VALUES ('310', 'admin', '1', '127.0.0.1', '', '1436504877', '管理员', '关联了用户：test 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('311', 'admin', '1', '127.0.0.1', '', '1436504877', '管理员', '关联了用户：管理员 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('312', 'admin', '1', '127.0.0.1', '', '1436504889', '管理员', '关联了用户：1 到工作流：测试辅助权限工作流 中的审核步骤：测试辅助权限工作流步骤2');
INSERT INTO `bk_action_log` VALUES ('313', 'admin', '1', '127.0.0.1', '', '1436509226', '管理员', '关联了用户：1 到工作流：测试工作流 中的审核步骤：测试2');
INSERT INTO `bk_action_log` VALUES ('314', 'admin', '1', '127.0.0.1', '', '1436510712', '管理员', '增加了新的工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('315', 'admin', '1', '127.0.0.1', '', '1436510726', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('316', 'admin', '1', '127.0.0.1', '', '1436510735', '管理员', '编辑了工作流：辅助权限测试2');
INSERT INTO `bk_action_log` VALUES ('317', 'admin', '1', '127.0.0.1', '', '1436510752', '管理员', '删除了工作流：测试辅助权限工作流');
INSERT INTO `bk_action_log` VALUES ('318', 'admin', '1', '127.0.0.1', '', '1436510782', '管理员', '增加了新的工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('319', 'admin', '1', '127.0.0.1', '', '1436510790', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('320', 'admin', '1', '127.0.0.1', '', '1436510821', '管理员', '增加了新的工作流步骤：234');
INSERT INTO `bk_action_log` VALUES ('321', 'admin', '1', '127.0.0.1', '', '1436510828', '管理员', '删除了工作流步骤：234');
INSERT INTO `bk_action_log` VALUES ('322', 'admin', '1', '127.0.0.1', '', '1436510854', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('323', 'admin', '1', '127.0.0.1', '', '1436510871', '管理员', '删除了工作流：工作流1');
INSERT INTO `bk_action_log` VALUES ('324', 'admin', '1', '127.0.0.1', '', '1436510894', '管理员', '增加了新的工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('325', 'admin', '1', '127.0.0.1', '', '1436510906', '管理员', '编辑了工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('326', 'admin', '1', '127.0.0.1', '', '1436510918', '管理员', '增加了新的工作流步骤：123123');
INSERT INTO `bk_action_log` VALUES ('327', 'admin', '1', '127.0.0.1', '', '1436510925', '管理员', '编辑了工作流步骤：123123');
INSERT INTO `bk_action_log` VALUES ('328', 'admin', '1', '127.0.0.1', '', '1436510933', '管理员', '关联了用户：管理员 到工作流：123123ffffffff 中的审核步骤：123123');
INSERT INTO `bk_action_log` VALUES ('329', 'admin', '1', '127.0.0.1', '', '1436510945', '管理员', '删除了工作流：123123ffffffff');
INSERT INTO `bk_action_log` VALUES ('330', 'admin', '1', '127.0.0.1', '', '1439442301', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('331', 'admin', '1', '127.0.0.1', '', '1439442348', '管理员', '改变了用户的权限：test2');
INSERT INTO `bk_action_log` VALUES ('332', 'admin', '1', '127.0.0.1', '', '1439881984', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('333', 'admin', '1', '127.0.0.1', '', '1439958807', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('334', 'admin', '1', '127.0.0.1', '', '1440127383', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('335', 'admin', '1', '127.0.0.1', '', '1440141329', '管理员', '编辑了用户组：test');
INSERT INTO `bk_action_log` VALUES ('336', 'admin', '1', '127.0.0.1', '', '1440141343', '管理员', '编辑了用户组：test');
INSERT INTO `bk_action_log` VALUES ('337', 'admin', '1', '127.0.0.1', '', '1440141382', '管理员', '改变了用户组的权限：test');
INSERT INTO `bk_action_log` VALUES ('338', 'admin', '1', '127.0.0.1', '', '1440141971', '管理员', '删除了系统用户：test2');
INSERT INTO `bk_action_log` VALUES ('339', 'admin', '1', '127.0.0.1', '', '1440142130', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('340', 'admin', '1', '127.0.0.1', '', '1440143103', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('341', 'admin', '1', '127.0.0.1', '', '1440144726', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('342', 'test', '2', '127.0.0.1', '', '1440400566', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('343', 'admin', '1', '127.0.0.1', '', '1440553533', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('344', 'admin', '1', '127.0.0.1', '', '1440732870', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('345', 'admin', '1', '127.0.0.1', '', '1440732901', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('346', 'admin', '1', '127.0.0.1', '', '1440733134', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('347', 'admin', '1', '127.0.0.1', '', '1440733178', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('348', 'admin', '1', '127.0.0.1', '', '1440733192', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('349', 'admin', '1', '127.0.0.1', '', '1440747027', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('350', 'admin', '1', '127.0.0.1', '', '1440752422', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('351', 'admin', '1', '127.0.0.1', '', '1440752521', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('352', 'admin', '1', '127.0.0.1', '', '1440986204', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('353', 'admin', '1', '127.0.0.1', '', '1440987027', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('354', 'admin', '1', '127.0.0.1', '', '1440987038', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('355', 'admin', '1', '127.0.0.1', '', '1440990388', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('356', 'admin', '1', '172.16.1.16', '', '1440996634', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('357', 'admin', '1', '172.16.1.29', '', '1440997574', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('358', 'admin', '1', '172.16.1.29', '', '1440998409', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('359', 'admin', '1', '172.16.1.16', '', '1441010130', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('360', 'admin', '1', '127.0.0.1', '', '1441072471', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('361', 'admin', '1', '127.0.0.1', '', '1441073024', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('362', 'admin', '1', '127.0.0.1', '', '1441076322', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('363', 'admin', '1', '127.0.0.1', '', '1441076696', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('364', 'admin', '1', '127.0.0.1', '', '1441076910', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('365', 'admin', '1', '127.0.0.1', '', '1441078414', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('366', 'admin', '1', '127.0.0.1', '', '1441078679', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('367', 'admin', '1', '127.0.0.1', '', '1441078735', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('368', 'admin', '1', '127.0.0.1', '', '1441078764', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('369', 'admin', '1', '127.0.0.1', '', '1441081431', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('370', 'admin', '1', '127.0.0.1', '', '1441089446', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('371', 'admin', '1', '127.0.0.1', '', '1441089832', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('372', 'admin', '1', '127.0.0.1', '', '1441091508', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('373', 'admin', '1', '127.0.0.1', '', '1441095278', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('374', 'admin', '1', '127.0.0.1', '', '1441095278', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('375', 'admin', '1', '127.0.0.1', '', '1441164748', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('376', 'admin', '1', '127.0.0.1', '', '1441165379', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('377', 'admin', '1', '127.0.0.1', '', '1441166728', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('378', 'admin', '1', '127.0.0.1', '', '1441182102', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('379', 'admin', '1', '127.0.0.1', '', '1441184294', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('380', 'test', '2', '127.0.0.1', '', '1441184308', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('381', 'admin', '1', '127.0.0.1', '', '1441184420', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('382', 'admin', '1', '127.0.0.1', '', '1441184455', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('383', 'test', '2', '127.0.0.1', '', '1441184462', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('384', 'admin', '1', '127.0.0.1', '', '1441504557', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('385', 'admin', '1', '127.0.0.1', '', '1441514297', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('386', 'admin', '1', '127.0.0.1', '', '1441520184', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('387', 'admin', '1', '127.0.0.1', '', '1441593767', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('388', 'admin', '1', '127.0.0.1', '', '1441593826', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('389', 'admin', '1', '127.0.0.1', '', '1441595735', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('390', 'admin', '1', '127.0.0.1', '', '1441596952', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('391', 'test', '2', '127.0.0.1', '', '1441596968', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('392', 'admin', '1', '127.0.0.1', '', '1441597272', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('393', 'test', '2', '127.0.0.1', '', '1441597346', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('394', 'admin', '1', '127.0.0.1', '', '1441598281', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('395', 'admin', '1', '127.0.0.1', '', '1441598300', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('396', 'test', '2', '127.0.0.1', '', '1441598310', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('397', 'admin', '1', '127.0.0.1', '', '1441598447', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('398', 'admin', '1', '127.0.0.1', '', '1441599182', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('399', 'admin', '1', '127.0.0.1', '', '1441599228', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('400', 'admin', '1', '127.0.0.1', '', '1441599787', '管理员', '增加了新的工作流步骤：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('401', 'admin', '1', '127.0.0.1', '', '1441599912', '管理员', '编辑了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('402', 'admin', '1', '127.0.0.1', '', '1441600083', '管理员', '编辑了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('403', 'admin', '1', '127.0.0.1', '', '1441600107', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('404', 'admin', '1', '127.0.0.1', '', '1441600410', '管理员', '删除了文章：测试日志记录');
INSERT INTO `bk_action_log` VALUES ('405', 'admin', '1', '127.0.0.1', '', '1441600410', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('406', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页金融头条');
INSERT INTO `bk_action_log` VALUES ('407', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('408', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页金融头条');
INSERT INTO `bk_action_log` VALUES ('409', 'admin', '1', '127.0.0.1', '', '1441600880', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('410', 'admin', '1', '127.0.0.1', '', '1441601038', '管理员', '关联了文章：[centos使用记录]如何启动多个php-fpm且互不影响？ 到推荐位 原创首页时尚头条');
INSERT INTO `bk_action_log` VALUES ('411', 'admin', '1', '127.0.0.1', '', '1441601038', '管理员', '关联了文章：sphinx全文搜索Php方面的处理 到推荐位 原创首页时尚头条');
INSERT INTO `bk_action_log` VALUES ('412', 'admin', '1', '127.0.0.1', '', '1441601584', '管理员', '增加了新的文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('413', 'admin', '1', '127.0.0.1', '', '1441601602', '管理员', '编辑了文章：:title');
INSERT INTO `bk_action_log` VALUES ('414', 'admin', '1', '127.0.0.1', '', '1441601627', '管理员', '编辑了文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('415', 'admin', '1', '127.0.0.1', '', '1441601838', '管理员', '删除了文章分类：测试文章分类');
INSERT INTO `bk_action_log` VALUES ('416', 'admin', '1', '127.0.0.1', '', '1441606229', '管理员', '增加了新的文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('417', 'admin', '1', '127.0.0.1', '', '1441606278', '管理员', '编辑了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('418', 'admin', '1', '127.0.0.1', '', '1441606421', '管理员', '编辑了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('419', 'admin', '1', '127.0.0.1', '', '1441606536', '管理员', '删除了文章推荐位：测试');
INSERT INTO `bk_action_log` VALUES ('420', 'admin', '1', '127.0.0.1', '', '1441607682', '管理员', '文章 [centos使用记录]如何启动多个php-fpm且互不影响？，推荐位：原创首页时尚头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('421', 'admin', '1', '127.0.0.1', '', '1441608226', '管理员', '排序了推荐位：原创首页移动互联网头条');
INSERT INTO `bk_action_log` VALUES ('422', 'admin', '1', '127.0.0.1', '', '1441608316', '管理员', '文章 sphinx全文搜索Php方面的处理，推荐位：原创首页移动互联网头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('423', 'admin', '1', '127.0.0.1', '', '1441608316', '管理员', '文章 [centos使用记录]如何启动多个php-fpm且互不影响？，推荐位：原创首页移动互联网头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('424', 'admin', '1', '127.0.0.1', '', '1441608652', '管理员', '删除了文章标签：123');
INSERT INTO `bk_action_log` VALUES ('425', 'admin', '1', '127.0.0.1', '', '1441608962', '管理员', '删除了文章标签：真的不错');
INSERT INTO `bk_action_log` VALUES ('426', 'admin', '1', '127.0.0.1', '', '1441608962', '管理员', '删除了文章标签：不错哦');
INSERT INTO `bk_action_log` VALUES ('427', 'admin', '1', '127.0.0.1', '', '1441608982', '管理员', '删除了文章评论：不错不错');
INSERT INTO `bk_action_log` VALUES ('428', 'admin', '1', '127.0.0.1', '', '1441608982', '管理员', '删除了文章评论：不错，楼主威武');
INSERT INTO `bk_action_log` VALUES ('429', 'admin', '1', '127.0.0.1', '', '1441610034', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('430', 'admin', '1', '127.0.0.1', '', '1441610141', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[123123]，回复内容为[123123]');
INSERT INTO `bk_action_log` VALUES ('431', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：牛B');
INSERT INTO `bk_action_log` VALUES ('432', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123');
INSERT INTO `bk_action_log` VALUES ('433', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('434', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('435', 'admin', '1', '127.0.0.1', '', '1441610191', '管理员', '删除了文章评论：123123');
INSERT INTO `bk_action_log` VALUES ('436', 'admin', '1', '127.0.0.1', '', '1441610218', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[谢谢，谢谢]，回复内容为[hi, Tomy，已经补上简单的配置。]');
INSERT INTO `bk_action_log` VALUES ('437', 'admin', '1', '127.0.0.1', '', '1441610277', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[谢谢，谢谢]，回复内容为[虎虎，好的。]');
INSERT INTO `bk_action_log` VALUES ('438', 'admin', '1', '127.0.0.1', '', '1441610309', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('439', 'test', '2', '127.0.0.1', '', '1441610467', 'test', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('440', 'admin', '1', '127.0.0.1', '', '1441612168', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('441', 'admin', '1', '127.0.0.1', '', '1441616855', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('442', 'admin', '1', '127.0.0.1', '', '1441617330', '管理员', '回复了文章[[centos软件安装]phpng的安装]的评论[不懂为什么用ab测试简单的一个脚本，phpng的比php5.5.x的慢了好几倍，为什么呢？]，回复内容为[你问我，我问谁啊]');
INSERT INTO `bk_action_log` VALUES ('443', 'admin', '1', '127.0.0.1', '', '1441685543', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('444', 'admin', '1', '127.0.0.1', '', '1441685675', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('445', 'admin', '1', '127.0.0.1', '', '1441687531', '管理员', '文章 ZeroClipboard插件如何批量初始化。，推荐位：测试推荐位，取消了关联');
INSERT INTO `bk_action_log` VALUES ('446', 'admin', '1', '127.0.0.1', '', '1441689658', '管理员', '增加了新的工作流：test');
INSERT INTO `bk_action_log` VALUES ('447', 'admin', '1', '127.0.0.1', '', '1441689668', '管理员', '编辑了工作流：test');
INSERT INTO `bk_action_log` VALUES ('448', 'admin', '1', '127.0.0.1', '', '1441689685', '管理员', '增加了新的工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('449', 'admin', '1', '127.0.0.1', '', '1441689708', '管理员', '增加了新的工作流步骤：23234');
INSERT INTO `bk_action_log` VALUES ('450', 'admin', '1', '127.0.0.1', '', '1441689718', '管理员', '编辑了工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('451', 'admin', '1', '127.0.0.1', '', '1441689729', '管理员', '关联了用户：test 到工作流：test 中的审核步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('452', 'admin', '1', '127.0.0.1', '', '1441689729', '管理员', '关联了用户：管理员 到工作流：test 中的审核步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('453', 'admin', '1', '127.0.0.1', '', '1441689737', '管理员', '删除了工作流步骤：test123123');
INSERT INTO `bk_action_log` VALUES ('454', 'admin', '1', '127.0.0.1', '', '1441689742', '管理员', '删除了工作流步骤：23234');
INSERT INTO `bk_action_log` VALUES ('455', 'admin', '1', '127.0.0.1', '', '1441689766', '管理员', '编辑了工作流：test');
INSERT INTO `bk_action_log` VALUES ('456', 'admin', '1', '127.0.0.1', '', '1441689776', '管理员', '删除了工作流：test');
INSERT INTO `bk_action_log` VALUES ('457', 'admin', '1', '127.0.0.1', '', '1441689806', '管理员', '增加了新的系统用户：123123');
INSERT INTO `bk_action_log` VALUES ('458', 'admin', '1', '127.0.0.1', '', '1441689820', '管理员', '改变了用户的权限：123123');
INSERT INTO `bk_action_log` VALUES ('459', 'admin', '1', '127.0.0.1', '', '1441689829', '管理员', '删除了系统用户：123123');
INSERT INTO `bk_action_log` VALUES ('460', 'admin', '1', '127.0.0.1', '', '1441689892', '管理员', '关联了文章：ZeroClipboard插件如何批量初始化。 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('461', 'admin', '1', '127.0.0.1', '', '1441689892', '管理员', '关联了文章：[centos软件安装]iftop的安装 到推荐位 原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('462', 'admin', '1', '127.0.0.1', '', '1441689946', '管理员', '排序了推荐位：原创首页汽车头条');
INSERT INTO `bk_action_log` VALUES ('463', 'admin', '1', '127.0.0.1', '', '1441689952', '管理员', '文章 [centos软件安装]iftop的安装，推荐位：原创首页汽车头条，取消了关联');
INSERT INTO `bk_action_log` VALUES ('464', 'admin', '1', '127.0.0.1', '', '1441689976', '管理员', '删除了文章评论：你问我，我问谁啊');
INSERT INTO `bk_action_log` VALUES ('465', 'admin', '1', '127.0.0.1', '', '1441689997', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[虎虎，好的。]，回复内容为[哈哈]');
INSERT INTO `bk_action_log` VALUES ('466', 'admin', '1', '127.0.0.1', '', '1441692588', '管理员', '删除了文章评论：哈哈');
INSERT INTO `bk_action_log` VALUES ('467', 'admin', '1', '127.0.0.1', '', '1441703310', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('468', 'admin', '1', '127.0.0.1', '', '1441763767', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('469', 'admin', '1', '127.0.0.1', '', '1441858886', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('470', 'admin', '1', '127.0.0.1', '', '1441874439', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('471', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：那是当然，我从来不骗人的。');
INSERT INTO `bk_action_log` VALUES ('472', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：谢谢，谢谢');
INSERT INTO `bk_action_log` VALUES ('473', 'admin', '1', '127.0.0.1', '', '1441874933', '管理员', '删除了文章评论：虎虎，好的。');
INSERT INTO `bk_action_log` VALUES ('474', 'admin', '1', '127.0.0.1', '', '1441874945', '管理员', '删除了文章评论：好的哦。');
INSERT INTO `bk_action_log` VALUES ('475', 'admin', '1', '127.0.0.1', '', '1441874983', '管理员', '回复了文章[[php扩展安装]opcache的安装]的评论[很好]，回复内容为[什么鬼东西]');
INSERT INTO `bk_action_log` VALUES ('476', 'admin', '1', '127.0.0.1', '', '1441936203', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('477', 'admin', '1', '127.0.0.1', '', '1441937322', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('478', 'admin', '1', '127.0.0.1', '', '1441937492', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('479', 'admin', '1', '127.0.0.1', '', '1441939999', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('480', 'admin', '1', '127.0.0.1', '', '1441940010', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('481', 'admin', '1', '127.0.0.1', '', '1441940588', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('482', 'admin', '1', '127.0.0.1', '', '1441940595', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('483', 'admin', '1', '127.0.0.1', '', '1441941493', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('484', 'admin', '1', '127.0.0.1', '', '1441941504', '管理员', '编辑了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('485', 'admin', '1', '127.0.0.1', '', '1441941509', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('486', 'admin', '1', '127.0.0.1', '', '1441942837', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('487', 'admin', '1', '127.0.0.1', '', '1441942844', '管理员', '编辑了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('488', 'admin', '1', '127.0.0.1', '', '1441942952', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('489', 'admin', '1', '127.0.0.1', '', '1441944088', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('490', 'admin', '1', '127.0.0.1', '', '1441944179', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('491', 'admin', '1', '127.0.0.1', '', '1441944205', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('492', 'admin', '1', '127.0.0.1', '', '1441944722', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('493', 'admin', '1', '127.0.0.1', '', '1441944754', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('494', 'admin', '1', '127.0.0.1', '', '1441944854', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('495', 'admin', '1', '127.0.0.1', '', '1441945875', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('496', 'admin', '1', '127.0.0.1', '', '1441947379', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('497', 'admin', '1', '127.0.0.1', '', '1441952605', '管理员', '增加了新的文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('498', 'admin', '1', '127.0.0.1', '', '1441952617', '管理员', '编辑了文章：subversion的编译安装');
INSERT INTO `bk_action_log` VALUES ('499', 'admin', '1', '127.0.0.1', '', '1441952629', '管理员', '编辑了文章：自动备份mysql数据库脚本');
INSERT INTO `bk_action_log` VALUES ('500', 'admin', '1', '127.0.0.1', '', '1441952636', '管理员', '编辑了文章：centos 使用过程中遇到的问题笔记');
INSERT INTO `bk_action_log` VALUES ('501', 'admin', '1', '127.0.0.1', '', '1441952644', '管理员', '编辑了文章：OpenVPN使用问题总结。');
INSERT INTO `bk_action_log` VALUES ('502', 'admin', '1', '127.0.0.1', '', '1441952683', '管理员', '编辑了文章：OpenVPN server端配置文件详细说明');
INSERT INTO `bk_action_log` VALUES ('503', 'admin', '1', '127.0.0.1', '', '1441952696', '管理员', '编辑了文章：How To Install OpenVPN On CentOS 7');
INSERT INTO `bk_action_log` VALUES ('504', 'admin', '1', '127.0.0.1', '', '1441952713', '管理员', '编辑了文章：[centos软件安装]openvpn的安装与配置');
INSERT INTO `bk_action_log` VALUES ('505', 'admin', '1', '127.0.0.1', '', '1441952756', '管理员', '编辑了文章：如何把网页生成imges,pdf？');
INSERT INTO `bk_action_log` VALUES ('506', 'admin', '1', '127.0.0.1', '', '1441952763', '管理员', '编辑了文章：[centos软件安装]phpng的安装');
INSERT INTO `bk_action_log` VALUES ('507', 'admin', '1', '127.0.0.1', '', '1441952772', '管理员', '编辑了文章：[php扩展安装]opcache的安装');
INSERT INTO `bk_action_log` VALUES ('508', 'admin', '1', '127.0.0.1', '', '1441952780', '管理员', '编辑了文章：[centos软件安装]如何独立安装apache的ab？');
INSERT INTO `bk_action_log` VALUES ('509', 'admin', '1', '127.0.0.1', '', '1441952788', '管理员', '编辑了文章：sphinx全文搜索Php方面的处理');
INSERT INTO `bk_action_log` VALUES ('510', 'admin', '1', '127.0.0.1', '', '1441952795', '管理员', '编辑了文章：[centos使用记录]如何启动多个php-fpm且互不影响？');
INSERT INTO `bk_action_log` VALUES ('511', 'admin', '1', '127.0.0.1', '', '1441952802', '管理员', '编辑了文章：[centos软件安装]iftop的安装');
INSERT INTO `bk_action_log` VALUES ('512', 'admin', '1', '127.0.0.1', '', '1441952813', '管理员', '编辑了文章：ZeroClipboard插件如何批量初始化。');
INSERT INTO `bk_action_log` VALUES ('513', 'admin', '1', '127.0.0.1', '', '1441952820', '管理员', '编辑了文章：[svn相关]使用记录');
INSERT INTO `bk_action_log` VALUES ('514', 'admin', '1', '127.0.0.1', '', '1441952842', '管理员', '编辑了文章：[centos问题集]yum install时报warning: rpmts_HdrFromFdno: Header V3 RSA/SHA256 Signature, key ID c105b9de: NOKEY');
INSERT INTO `bk_action_log` VALUES ('515', 'admin', '1', '127.0.0.1', '', '1441952855', '管理员', '编辑了文章：[问题集]重写session类的时候可能会导至nginx 502的问题的原因');
INSERT INTO `bk_action_log` VALUES ('516', 'admin', '1', '127.0.0.1', '', '1441952862', '管理员', '编辑了文章：[问题集]两个不同用户执行生成同一个文件所导至的读取权限问题。');
INSERT INTO `bk_action_log` VALUES ('517', 'admin', '1', '127.0.0.1', '', '1441952869', '管理员', '编辑了文章：[php扩展的安装]sphinx扩展的安装');
INSERT INTO `bk_action_log` VALUES ('518', 'admin', '1', '127.0.0.1', '', '1441952876', '管理员', '编辑了文章：[centos软件安装]sphinx的安装与配置以及php方面的处理');
INSERT INTO `bk_action_log` VALUES ('519', 'admin', '1', '127.0.0.1', '', '1441952883', '管理员', '编辑了文章：[centos软件安装]subversion的安装与多项目权限配置');
INSERT INTO `bk_action_log` VALUES ('520', 'admin', '1', '127.0.0.1', '', '1441952890', '管理员', '编辑了文章：[centos软件安装]安装memcached');
INSERT INTO `bk_action_log` VALUES ('521', 'admin', '1', '127.0.0.1', '', '1441952898', '管理员', '编辑了文章：[php扩展安装]为php安装memcached扩展');
INSERT INTO `bk_action_log` VALUES ('522', 'admin', '1', '127.0.0.1', '', '1441952905', '管理员', '编辑了文章：[php扩展安装]为php安装redis扩展');
INSERT INTO `bk_action_log` VALUES ('523', 'admin', '1', '127.0.0.1', '', '1441952911', '管理员', '编辑了文章：[Zephir官方文档翻译之一] 欢迎来到Zephir！');
INSERT INTO `bk_action_log` VALUES ('524', 'admin', '1', '127.0.0.1', '', '1441952919', '管理员', '编辑了文章：[Zephir官方文档翻译之二] 为什么选择 Zephir?');
INSERT INTO `bk_action_log` VALUES ('525', 'admin', '1', '127.0.0.1', '', '1441952925', '管理员', '编辑了文章：[Zephir官方文档翻译之三]  介绍 Zephir');
INSERT INTO `bk_action_log` VALUES ('526', 'admin', '1', '127.0.0.1', '', '1441952932', '管理员', '编辑了文章：[Zephir官方文档翻译之四] 安装Zephir');
INSERT INTO `bk_action_log` VALUES ('527', 'admin', '1', '127.0.0.1', '', '1441952964', '管理员', '编辑了文章：[Zephir官方文档翻译之五] 入门指导');
INSERT INTO `bk_action_log` VALUES ('528', 'admin', '1', '127.0.0.1', '', '1441969453', '管理员', '删除了文章：测试一下');
INSERT INTO `bk_action_log` VALUES ('529', 'admin', '1', '127.0.0.1', '', '1441980183', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('530', 'admin', '1', '127.0.0.1', '', '1441980743', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('531', 'admin', '1', '127.0.0.1', '', '1441980918', '管理员', '编辑了工作流步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('532', 'admin', '1', '127.0.0.1', '', '1441980921', '管理员', '关联了用户：test 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('533', 'admin', '1', '127.0.0.1', '', '1441980921', '管理员', '关联了用户：管理员 到工作流：辅助权限测试2 中的审核步骤：测试辅助权限工作流步骤');
INSERT INTO `bk_action_log` VALUES ('534', 'admin', '1', '127.0.0.1', '', '1441980928', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('535', 'admin', '1', '127.0.0.1', '', '1441980934', '管理员', '改变了用户的权限：test');
INSERT INTO `bk_action_log` VALUES ('536', 'admin', '1', '127.0.0.1', '', '1441981059', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('537', 'admin', '1', '127.0.0.1', '', '1441981172', '管理员', '登录系统成功');
INSERT INTO `bk_action_log` VALUES ('538', 'admin', '1', '127.0.0.1', '', '1441981184', '管理员', '编辑了系统用户：test');
INSERT INTO `bk_action_log` VALUES ('539', 'admin', '1', '127.0.0.1', '', '1441981188', '管理员', '改变了用户的权限：test');

-- ----------------------------
-- Table structure for `bk_group`
-- ----------------------------
DROP TABLE IF EXISTS `bk_group`;
CREATE TABLE `bk_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL COMMENT '用户组名',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户组等级，低等级的不能对高等级的用户做修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组表_by_jiang';

-- ----------------------------
-- Records of bk_group
-- ----------------------------
INSERT INTO `bk_group` VALUES ('1', '超级用户组', '123123a', '1', '1');
INSERT INTO `bk_group` VALUES ('2', 'test', '1 ', '1', '1');

-- ----------------------------
-- Table structure for `bk_permission`
-- ----------------------------
DROP TABLE IF EXISTS `bk_permission`;
CREATE TABLE `bk_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL COMMENT '模块',
  `class` varchar(255) NOT NULL COMMENT '类',
  `action` varchar(255) NOT NULL COMMENT '函数',
  `name` varchar(255) NOT NULL COMMENT '节点的名字',
  `display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为显示为菜单，0则不显示',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '节点的父节点，此值一般用于输出树形结构，0则为顶级',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '第几级菜单',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `add_time` bigint(20) NOT NULL COMMENT '增加的日期',
  PRIMARY KEY (`id`),
  KEY `module` (`module`) USING BTREE,
  KEY `class` (`class`) USING BTREE,
  KEY `action` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='权限节点表_by_jiang';

-- ----------------------------
-- Records of bk_permission
-- ----------------------------
INSERT INTO `bk_permission` VALUES ('1', 'foundation', '系统管理', '系统管理', '系统管理', '1', '0', '0', '1', '系统管理页面，不作权限验证，只用做菜单显示', '0');
INSERT INTO `bk_permission` VALUES ('2', 'foundation', 'group', 'index', '用户组管理', '1', '67', '2', '3', '用户组管理页面', '0');
INSERT INTO `bk_permission` VALUES ('3', 'foundation', 'acl', 'index', '功能管理', '1', '67', '1', '3', '功能管理页面', '0');
INSERT INTO `bk_permission` VALUES ('4', 'foundation', 'user', 'index', '用户管理', '1', '67', '3', '3', '用户管理页面', '0');
INSERT INTO `bk_permission` VALUES ('20', 'foundation', 'user', 'add', '增加用户', '0', '4', '0', '4', '增加一个用户', '0');
INSERT INTO `bk_permission` VALUES ('23', 'foundation', 'group', 'add', '增加用户组', '0', '2', '0', '4', '增加用户组', '1406882443');
INSERT INTO `bk_permission` VALUES ('24', 'foundation', 'group', 'edit', '用户组编辑', '0', '2', '0', '4', '用户组编辑', '1406882515');
INSERT INTO `bk_permission` VALUES ('25', 'foundation', 'group', 'delete', '用户组删除', '0', '2', '0', '4', '用户组删除、批量删除', '1406882542');
INSERT INTO `bk_permission` VALUES ('26', 'foundation', 'acl', 'group', '用户组权限管理', '0', '2', '0', '4', '用户组权限管理', '1406882568');
INSERT INTO `bk_permission` VALUES ('27', 'foundation', 'user', 'edit', '用户编辑', '0', '4', '0', '4', '用户编辑', '1406882640');
INSERT INTO `bk_permission` VALUES ('28', 'foundation', 'user', 'delete', '用户删除', '0', '4', '0', '4', '用户删除', '1406882664');
INSERT INTO `bk_permission` VALUES ('29', 'foundation', 'acl', 'user', '用户权限管理', '0', '4', '0', '4', '用户权限管理、设置用户权限', '1406882698');
INSERT INTO `bk_permission` VALUES ('30', 'foundation', 'acl', 'add', '增加功能菜单', '0', '3', '0', '4', '增加功能菜单', '1406882729');
INSERT INTO `bk_permission` VALUES ('31', 'foundation', 'acl', 'edit', '功能菜单编辑', '0', '3', '0', '4', '功能菜单编辑', '1406882754');
INSERT INTO `bk_permission` VALUES ('32', 'foundation', 'acl', 'delete', '功能菜单删除', '0', '3', '0', '4', '功能菜单删除', '1406882775');
INSERT INTO `bk_permission` VALUES ('33', 'foundation', 'acl', 'sort', '功能菜单排序', '0', '3', '0', '4', '功能菜单排序', '1406882815');
INSERT INTO `bk_permission` VALUES ('43', 'foundation', 'index', 'cs', '功能示例', '1', '1', '0', '2', '一些小功能的合集，可以用来加快开发的速度。', '1427788812');
INSERT INTO `bk_permission` VALUES ('44', 'foundation', 'upload', 'index', '弹出窗口上传', '0', '66', '0', '2', '通用的弹出窗口上传。', '1427790345');
INSERT INTO `bk_permission` VALUES ('53', 'foundation', 'log', 'action', '操作日志', '1', '68', '0', '3', '查看操作日志', '1433319136');
INSERT INTO `bk_permission` VALUES ('55', '工作流管理', '工作流管理', '工作流管理', '工作流管理', '1', '1', '0', '2', '', '1434093108');
INSERT INTO `bk_permission` VALUES ('56', 'workflow', 'index', 'add', '工作流增加', '0', '73', '0', '4', '增加新的工作流程', '1434333268');
INSERT INTO `bk_permission` VALUES ('57', 'workflow', 'index', 'edit', '工作流编辑', '0', '73', '0', '4', '修改工作流信息', '1434336714');
INSERT INTO `bk_permission` VALUES ('58', 'workflow', 'index', 'delete', '工作流删除', '0', '73', '0', '4', '删除工作流', '1434338279');
INSERT INTO `bk_permission` VALUES ('59', 'workflow', 'step', 'index', '工作流详情', '0', '55', '1', '3', '查看工作流详情', '1434345119');
INSERT INTO `bk_permission` VALUES ('60', 'workflow', 'step', 'add', '增加工作流步骤', '0', '59', '0', '4', '增加工作流步骤', '1434349481');
INSERT INTO `bk_permission` VALUES ('61', 'workflow', 'step', 'edit', '编辑工作流步骤', '0', '59', '0', '4', '编辑工作流步骤', '1434353110');
INSERT INTO `bk_permission` VALUES ('62', 'workflow', 'step', 'delete', '工作流步骤删除', '0', '59', '0', '4', '工作流步骤删除', '1434354926');
INSERT INTO `bk_permission` VALUES ('63', 'workflow', 'step', 'relation', '工作流设置关联人员', '0', '59', '0', '4', '工作流设置关联人员', '1434422499');
INSERT INTO `bk_permission` VALUES ('66', '通用功能', '通用功能', '通用功能', '通用功能', '0', '0', '0', '1', '通用功能，一般会开发这些功能给用户。', '1435545336');
INSERT INTO `bk_permission` VALUES ('67', '用户与权限管理', '用户与权限管理', '用户与权限管理', '用户与权限管理', '1', '1', '0', '2', '包括功能用户管理、用户组管理、功能管理，权限管理。', '1436147892');
INSERT INTO `bk_permission` VALUES ('68', '系统日志', '系统日志', '系统日志', '系统日志', '1', '1', '0', '2', '主要是各类的系统日志', '1436147908');
INSERT INTO `bk_permission` VALUES ('73', 'workflow', 'index', 'index', '工作流列表', '1', '55', '2', '3', '', '1436232634');

-- ----------------------------
-- Table structure for `bk_users`
-- ----------------------------
DROP TABLE IF EXISTS `bk_users`;
CREATE TABLE `bk_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `group_id` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实性名',
  `token` varchar(255) NOT NULL COMMENT '用户注册时的密钥',
  `add_time` bigint(20) NOT NULL COMMENT '用户注册的时间',
  `modify_time` bigint(20) NOT NULL COMMENT '用户信息所修改的时间',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户禁用0正常的1',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_ip` varchar(255) NOT NULL COMMENT '最后登录ip',
  `last_login_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表_by_jiang';

-- ----------------------------
-- Records of bk_users
-- ----------------------------
INSERT INTO `bk_users` VALUES ('1', 'admin', '6512bd43d9caa6e02c990b0a82652dca', '1', '管理员', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', '0', '0', '12', '1', '超级用户组', '127.0.0.1', '1441981172');
INSERT INTO `bk_users` VALUES ('2', 'test', 'c4ca4238a0b923820dcc509a6f75849b', '2', 'test', '', '1436169648', '0', '11', '1', '1', '127.0.0.1', '1441610467');

-- ----------------------------
-- Table structure for `bk_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow`;
CREATE TABLE `bk_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '工作流的名字',
  `description` text NOT NULL COMMENT '描述',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '数据插入的时间',
  `code` varchar(20) NOT NULL COMMENT '调用字符串，用于与程序结合',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '工作流的类型，1为多用户的类OA审核，2为辅助权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='工作流表';

-- ----------------------------
-- Records of bk_workflow
-- ----------------------------
INSERT INTO `bk_workflow` VALUES ('8', '测试工作流', '测试工作流2', '1434508916', 'W_sdfg', '1');
INSERT INTO `bk_workflow` VALUES ('10', '辅助权限测试2', '辅助权限测试2a', '1436510712', 'W_dd', '2');

-- ----------------------------
-- Table structure for `bk_workflow_step`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow_step`;
CREATE TABLE `bk_workflow_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL COMMENT '所属的工作流',
  `name` varchar(255) NOT NULL COMMENT '工作流步骤的名称',
  `description` text NOT NULL COMMENT '工作流步骤的描述',
  `step_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该工作流步骤所处的第几步,如果为99代表已经审核完成',
  `code` varchar(20) NOT NULL COMMENT '主要用于权限辅助调用',
  `addtime` int(11) NOT NULL COMMENT '数据增加的日期',
  PRIMARY KEY (`id`),
  KEY `workflow_id` (`workflow_id`) USING BTREE,
  KEY `step_level` (`step_level`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='工作流的详细步骤';

-- ----------------------------
-- Records of bk_workflow_step
-- ----------------------------
INSERT INTO `bk_workflow_step` VALUES ('9', '8', '测试1', '1', '1', '', '1434516742');
INSERT INTO `bk_workflow_step` VALUES ('10', '8', '测试2', '2', '2', '', '1434516769');
INSERT INTO `bk_workflow_step` VALUES ('15', '10', '测试辅助权限工作流步骤', '测试辅助权限工作流步骤a', '0', 'W_sdfsf', '1436510782');

-- ----------------------------
-- Table structure for `bk_workflow_user`
-- ----------------------------
DROP TABLE IF EXISTS `bk_workflow_user`;
CREATE TABLE `bk_workflow_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_step_id` int(11) NOT NULL COMMENT '工作流步骤的ID',
  `user_id` int(11) NOT NULL COMMENT '后台管理员的ID',
  `workflow_id` int(11) NOT NULL COMMENT '工作流ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `workflow_step_id` (`workflow_step_id`) USING BTREE,
  KEY `workflow_id` (`workflow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_workflow_user
-- ----------------------------
INSERT INTO `bk_workflow_user` VALUES ('19', '9', '1', '8');
INSERT INTO `bk_workflow_user` VALUES ('23', '10', '3', '8');
INSERT INTO `bk_workflow_user` VALUES ('27', '15', '2', '10');
INSERT INTO `bk_workflow_user` VALUES ('28', '15', '1', '10');
