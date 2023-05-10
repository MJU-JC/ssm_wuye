
-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_building` (
  `buildingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '¥��id',
  `buildingName` varchar(20)  NOT NULL COMMENT '¥������',
  `memo` varchar(50)  NOT NULL COMMENT '¥����ע',
  PRIMARY KEY (`buildingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_employee` (
  `employeeNo` varchar(20)  NOT NULL COMMENT 'employeeNo',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `positionName` varchar(20)  NOT NULL COMMENT 'ְλ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(60)  NOT NULL COMMENT '��ַ',
  `employeeDesc` varchar(200)  NOT NULL COMMENT 'Ա������',
  PRIMARY KEY (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_owner` (
  `ownerId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ҵ��id',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `buildingObj` int(11) NOT NULL COMMENT '¥������',
  `roomNo` varchar(20)  NOT NULL COMMENT '�����',
  `ownerName` varchar(20)  NOT NULL COMMENT '����',
  `area` varchar(20)  NOT NULL COMMENT '�������',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ��ʽ',
  `memo` varchar(500)  NULL COMMENT '��ע��Ϣ',
  PRIMARY KEY (`ownerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_parking` (
  `parkingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��λid',
  `parkingName` varchar(20)  NOT NULL COMMENT '��λ����',
  `plateNumber` varchar(20)  NOT NULL COMMENT '���ƺ�',
  `ownerObj` int(11) NOT NULL COMMENT '����',
  `opUser` varchar(20)  NOT NULL COMMENT '����Ա',
  PRIMARY KEY (`parkingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_repair` (
  `repairId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `ownerObj` int(11) NOT NULL COMMENT '�����û�',
  `repairDate` varchar(20)  NULL COMMENT '��������',
  `questionDesc` varchar(500)  NOT NULL COMMENT '��������',
  `repairState` varchar(20)  NOT NULL COMMENT '����״̬',
  `handleResult` varchar(500)  NULL COMMENT '������',
  PRIMARY KEY (`repairId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_feeType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���id',
  `typeName` varchar(20)  NOT NULL COMMENT '�������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_fee` (
  `feeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `feeTypeObj` int(11) NOT NULL COMMENT '�������',
  `ownerObj` int(11) NOT NULL COMMENT 'ס����Ϣ',
  `feeDate` varchar(20)  NULL COMMENT '�շ�ʱ��',
  `feeMoney` float NOT NULL COMMENT '�շѽ��',
  `feeContent` varchar(50)  NOT NULL COMMENT '�շ�����',
  `opUser` varchar(20)  NOT NULL COMMENT '����Ա',
  PRIMARY KEY (`feeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_facility` (
  `facilityId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��ʩid',
  `name` varchar(20)  NOT NULL COMMENT '��ʩ����',
  `count` int(11) NOT NULL COMMENT '����',
  `startTime` varchar(20)  NULL COMMENT '��ʼʹ��ʱ��',
  `facilityState` varchar(20)  NOT NULL COMMENT '��ʩ״̬',
  PRIMARY KEY (`facilityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_salary` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `employeeObj` varchar(20)  NOT NULL COMMENT 'Ա��',
  `year` varchar(20)  NOT NULL COMMENT '�������',
  `month` varchar(20)  NOT NULL COMMENT '�����·�',
  `salaryMoney` float NOT NULL COMMENT '���ʽ��',
  `fafang` varchar(20)  NOT NULL COMMENT '�Ƿ񷢷�',
  PRIMARY KEY (`salaryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveWord` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼id',
  `title` varchar(20)  NOT NULL COMMENT '����',
  `content` varchar(500)  NOT NULL COMMENT '����',
  `addTime` varchar(20)  NULL COMMENT '����ʱ��',
  `ownerObj` int(11) NOT NULL COMMENT '�ύס��',
  `replyContent` varchar(500)  NULL COMMENT '�ظ�����',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  `opUser` varchar(20)  NOT NULL COMMENT '�ظ���',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_manager` (
  `manageUserName` varchar(20)  NOT NULL COMMENT 'manageUserName',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `manageType` varchar(20)  NOT NULL COMMENT '����Ա���',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  PRIMARY KEY (`manageUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE t_owner ADD CONSTRAINT FOREIGN KEY (buildingObj) REFERENCES t_building(buildingId);
ALTER TABLE t_parking ADD CONSTRAINT FOREIGN KEY (ownerObj) REFERENCES t_owner(ownerId);
ALTER TABLE t_repair ADD CONSTRAINT FOREIGN KEY (ownerObj) REFERENCES t_owner(ownerId);
ALTER TABLE t_fee ADD CONSTRAINT FOREIGN KEY (feeTypeObj) REFERENCES t_feeType(typeId);
ALTER TABLE t_fee ADD CONSTRAINT FOREIGN KEY (ownerObj) REFERENCES t_owner(ownerId);
ALTER TABLE t_salary ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);
ALTER TABLE t_leaveWord ADD CONSTRAINT FOREIGN KEY (ownerObj) REFERENCES t_owner(ownerId);


