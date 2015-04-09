/*create Table sql */
CREATE TABLE `private_placement_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `logo` varchar(45) DEFAULT NULL COMMENT '公司LOGO',
  `name` varchar(45) DEFAULT NULL COMMENT '公司名称',
  `setup_time` datetime DEFAULT NULL COMMENT '成立时间',
  `management_scale` varchar(45) DEFAULT NULL COMMENT '管理规模',
  `area` varchar(45) DEFAULT NULL COMMENT '所在区域',
  `investment_number` varchar(20) DEFAULT NULL COMMENT '投研人数',
  `manager` varchar(45) DEFAULT NULL COMMENT '旗下经理',
  `product_line` varchar(45) DEFAULT NULL COMMENT '产品线',
  `review` varchar(45) DEFAULT NULL COMMENT '点评',
  `core_character` varchar(1000) DEFAULT NULL COMMENT '核心人物',
  `investment_philosophy` varchar(1000) DEFAULT NULL COMMENT '投资理念',
  `investment_team` varchar(1000) DEFAULT NULL COMMENT '投研团队',
  `company_profile` varchar(1000) DEFAULT NULL COMMENT '公司简介',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='私募公司';


CREATE TABLE `tjs_product_xtcp` (
  `xtcp_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '信托产品流水号',
  `xtcp_log` varchar(200) DEFAULT NULL COMMENT '信托产品LOGO',
  `xtcp_fullname` varchar(200) DEFAULT NULL COMMENT '信托全称',
  `xtcp_gszhname` varchar(200) DEFAULT NULL COMMENT '信托公司名称',
  `xtcp_gsId` bigint(20) DEFAULT NULL COMMENT '系统公司ID',
  `xtcp_fxgm` varchar(200) DEFAULT NULL COMMENT '预计发行规模',
  `xtcp_nsyl` varchar(200) DEFAULT NULL COMMENT '预期年收益率',
  `xtcp_lxfp` varchar(200) DEFAULT NULL COMMENT '利息分配',
  `xtcp_cxq` varchar(200) DEFAULT NULL COMMENT '存续期',
  `xtcp_xtlx` varchar(45) DEFAULT NULL COMMENT '信托类型',
  `xtcp_zdrgje` decimal(18,2) DEFAULT NULL COMMENT '最低认购金额',
  `xtcp_dyl` varchar(200) DEFAULT NULL COMMENT '抵押率',
  `xtcp_tzly` varchar(200) DEFAULT NULL COMMENT '投资领域',
  `xtcp_dyw` varchar(200) DEFAULT NULL COMMENT '抵押物',
  `xtcp_sysm` varchar(200) DEFAULT NULL COMMENT '收益说明',
  `xtcp_mjzh` varchar(500) DEFAULT NULL COMMENT '募集进度/账号',
  `xtcp_rzf` varchar(100) DEFAULT NULL COMMENT '融资方',
  `xtcp_zjyt` varchar(500) DEFAULT NULL COMMENT '资金用途',
  `xtcp_hkly` varchar(200) DEFAULT NULL COMMENT '还款来源',
  `xtcp_fkcs` varchar(1000) DEFAULT NULL COMMENT '风控措施',
  `xtcp_zcglr` varchar(100) DEFAULT NULL COMMENT '资产管理人',
  `xtcp_dp` varchar(1000) DEFAULT NULL COMMENT '点评',
  `xtcp_hd` varchar(1000) DEFAULT NULL COMMENT '活动',
  `xtcp_status` varchar(45) DEFAULT NULL COMMENT '状态',
  `xtcp_tjw` varchar(45) DEFAULT NULL COMMENT '推荐位',
  `xtcp_tjno` bigint(20) DEFAULT NULL COMMENT '推荐序号',
  `xtcp_createDate` date DEFAULT NULL COMMENT '产品上架时间',
  `xtcp_modifyDate` date DEFAULT NULL COMMENT '产品修改时间',
  `xtcp_userId` varchar(50) DEFAULT NULL COMMENT '创建人Id ',
  `xtcp_username` varchar(50) DEFAULT NULL COMMENT '创建人name',
  `xtcp_validstatus` varchar(50) DEFAULT '1' COMMENT '有效状态1：有效，2：无效',
  PRIMARY KEY (`xtcp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='信托产品';



CREATE TABLE `tjs_product_xtgs` (
  `xtgs_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `xtgs_code` varchar(200) DEFAULT NULL COMMENT '公司编码',
  `xtgs_log` varchar(500) DEFAULT NULL COMMENT '公司LOGO',
  `xgts_zhname` varchar(500) DEFAULT NULL COMMENT '公司中文名称',
  `xgts_enname` varchar(200) DEFAULT NULL COMMENT '公司英文名称 ',
  `xgts_splname` varchar(200) DEFAULT NULL COMMENT '公司简称',
  `xgts_createdate` date DEFAULT NULL COMMENT '成立日期',
  `xgts_zczb` float(18,2) DEFAULT NULL COMMENT '注册资本',
  `xgts_city` varchar(200) DEFAULT NULL COMMENT '所在城市',
  `xgts_gsz` varchar(200) DEFAULT NULL COMMENT '董事长',
  `xgts_zjl` varchar(200) DEFAULT NULL COMMENT '总经理',
  `xgts_frdb` varchar(200) DEFAULT NULL COMMENT '法人代表',
  `xgts_dgd` varchar(200) DEFAULT NULL COMMENT '大股东',
  `xgts_ss` varchar(45) DEFAULT NULL COMMENT '是否上市',
  `xgts_gsxz` varchar(45) NOT NULL COMMENT '公司性质',
  `xgts_zcglgm` varchar(2000) DEFAULT NULL COMMENT '公司管理规模',
  `xgts_gsjj` varchar(2000) DEFAULT NULL COMMENT '公司简介',
  `xgts_status` varchar(5) DEFAULT NULL COMMENT '状态',
  `xgts_tjw` varchar(5) DEFAULT NULL COMMENT '推荐位',
  `xgts_tjno` bigint(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`xtgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='信托公司';


