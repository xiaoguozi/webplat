/*create Table sql */

create table t_user_info
(
   id bigint(20) not null AUTO_INCREMENT comment 'ID',
   user_id bigint(20) comment '用户唯一标识',
   nick_name varchar(64) comment '用户昵称',
   mobile_no varchar(16) comment '手机号',
   qq_no varchar(16) comment 'QQ号',
   wechat_no varchar(16) comment '微信号',
   email varchar(128) comment '邮箱',
   user_status varchar(16) comment '用户状态',
   reg_time datetime comment '注册时间',
   primary key (id)
) DEFAULT CHARSET=utf8 comment='用户信息';

create table t_web_log
(
   id bigint(20) not null AUTO_INCREMENT comment 'ID',
   user_name varchar(32) comment 'username',
   op_code varchar(32) comment '操作码',
   op_result varchar(32) comment '操作结果',
   op_obj varchar(32) comment '操作对象',
   req_url varchar(256) comment '请求地址',
   req_ref varchar(256) comment '请求来源地址',
   req_ip varchar(32) comment '请求IP',
   op_time datetime comment '操作时间',
   log_time datetime comment '日志时间',
   primary key (id)
) DEFAULT CHARSET=utf8 comment='web日志';


DROP TABLE IF EXISTS `tjs_order`;
CREATE TABLE `tjs_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `order_user_id` bigint(20) DEFAULT NULL COMMENT '订单提交人ID',
  `order_user_name` varchar(200) DEFAULT NULL COMMENT '订单人名称',
  `order_telphone` varchar(45) DEFAULT NULL COMMENT '订单人电话',
  `order_product_id` bigint(20) DEFAULT NULL COMMENT '订单产品ID',
  `order_product_name` varchar(500) DEFAULT NULL COMMENT '订单产品名称',
  `order_product_type` varchar(10) DEFAULT NULL COMMENT '订单产品类型',
  `order_operate_status` varchar(45) DEFAULT NULL COMMENT '订单处理状态',
  `order_operate_ID` bigint(20) DEFAULT NULL COMMENT '订单处理人ID',
  `order_operate_name` varchar(200) DEFAULT NULL COMMENT '订单处理人',
  `order_create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `order_operate_date` datetime DEFAULT NULL COMMENT '订单处理时间',
  `order_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预定信息表';

DROP TABLE IF EXISTS `tjs_product_xtcp`;
CREATE TABLE `tjs_product_xtcp` (
  `xtcp_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '信托产品流水号',
  `xtcp_log` varchar(200) DEFAULT NULL COMMENT '信托产品LOGO',
  `xtcp_fullname` varchar(200) DEFAULT NULL COMMENT '信托全称',
  `xtcp_gszhname` varchar(200) DEFAULT NULL COMMENT '信托公司名称',
  `xtcp_gsId` bigint(20) DEFAULT NULL COMMENT '系统公司ID',
  `xtcp_fxgm` varchar(200) DEFAULT NULL COMMENT '预计发行规模',
  `xtcp_nsyl` decimal(18,2) DEFAULT NULL COMMENT '预期年收益率',
  `xtcp_lxfp` varchar(200) DEFAULT NULL COMMENT '利息分配',
  `xtcp_cxq` bigint(10) DEFAULT NULL COMMENT '存续期',
  `xtcp_xtlx` varchar(45) DEFAULT NULL COMMENT '信托类型',
  `xtcp_zdrgje` decimal(18,2) DEFAULT NULL COMMENT '最低认购金额',
  `xtcp_dyl` varchar(200) DEFAULT NULL COMMENT '抵押率',
  `xtcp_tzly` varchar(200) DEFAULT NULL COMMENT '投资领域',
  `xtcp_dyw` varchar(200) DEFAULT NULL COMMENT '抵押物',
  `xtcp_sysm` varchar(4000) DEFAULT NULL COMMENT '收益说明',
  `xtcp_mjzh` varchar(500) DEFAULT NULL COMMENT '募集进度/账号',
  `xtcp_rzf` varchar(4000) DEFAULT NULL COMMENT '融资方',
  `xtcp_zjyt` varchar(500) DEFAULT NULL COMMENT '资金用途',
  `xtcp_hkly` varchar(200) DEFAULT NULL COMMENT '还款来源',
  `xtcp_fkcs` varchar(1000) DEFAULT NULL COMMENT '风控措施',
  `xtcp_zcglr` varchar(4000) DEFAULT NULL COMMENT '资产管理人',
  `xtcp_dp` varchar(1000) DEFAULT NULL COMMENT '点评',
  `xtcp_hd` varchar(1000) DEFAULT NULL COMMENT '活动',
  `xtcp_status` varchar(45) DEFAULT NULL COMMENT '状态',
  `xtcp_tjw` varchar(45) DEFAULT NULL COMMENT '推荐位',
  `xtcp_tjno` bigint(20) DEFAULT NULL COMMENT '推荐序号',
  `xtcp_createDate` datetime DEFAULT NULL COMMENT '产品上架时间',
  `xtcp_modifyDate` datetime DEFAULT NULL COMMENT '产品修改时间',
  `xtcp_userId` varchar(50) DEFAULT NULL COMMENT '创建人Id ',
  `xtcp_username` varchar(50) DEFAULT NULL COMMENT '创建人name',
  `xtcp_validstatus` varchar(50) DEFAULT '1' COMMENT '有效状态1：有效，2：无效',
  `xtcp_area` varchar(100) DEFAULT NULL COMMENT '所在区域',
  `xtcp_city` varchar(100) DEFAULT NULL COMMENT '所在城市',
  `xtcp_splname` varchar(500) DEFAULT NULL COMMENT '产品简称',
  `xtcp_tzfs` varchar(100) DEFAULT NULL COMMENT '投资方式',
  PRIMARY KEY (`xtcp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='信托产品';


DROP TABLE IF EXISTS `tjs_product_xtgs`;
CREATE TABLE `tjs_product_xtgs` (
  `xtgs_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `xtgs_code` varchar(200) DEFAULT NULL COMMENT '公司编码',
  `xtgs_log` varchar(500) DEFAULT NULL COMMENT '公司LOGO',
  `xgts_zhname` varchar(500) DEFAULT NULL COMMENT '公司中文名称',
  `xgts_enname` varchar(200) DEFAULT NULL COMMENT '公司英文名称 ',
  `xgts_splname` varchar(200) DEFAULT NULL COMMENT '公司简称',
  `xgts_createdate` date DEFAULT NULL COMMENT '成立日期',
  `xgts_zczb` decimal(18,2) DEFAULT NULL COMMENT '注册资本',
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
  `xgts_pjsyl` decimal(10,2) DEFAULT NULL COMMENT '平均收益率',
  `xgts_cpdfbl` decimal(10,2) DEFAULT NULL COMMENT '产品兑付比例',
  PRIMARY KEY (`xtgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='信托公司';

DROP TABLE IF EXISTS `pe_company`;

CREATE TABLE `pe_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `logo` varchar(100) DEFAULT NULL COMMENT '公司LOGO',
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `setup_time` datetime DEFAULT NULL COMMENT '成立时间',
  `management_scale` varchar(100) DEFAULT NULL COMMENT '管理规模',
  `area` varchar(100) DEFAULT NULL COMMENT '所在区域',
  `investment_number` varchar(100) DEFAULT NULL COMMENT '投研人数',
  `product_line` varchar(100) DEFAULT NULL COMMENT '产品线',
  `review` varchar(100) DEFAULT NULL COMMENT '点评',
  `core_character` varchar(2000) DEFAULT NULL COMMENT '核心人物',
  `investment_philosophy` varchar(2000) DEFAULT NULL COMMENT '投资理念',
  `investment_team` varchar(2000) DEFAULT NULL COMMENT '投研团队',
  `company_profile` varchar(2000) DEFAULT NULL COMMENT '公司简介',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `recommend_location` varchar(100) DEFAULT NULL COMMENT '推荐位置',
  `recommend_sequence` varchar(100) DEFAULT NULL COMMENT '推荐顺序',
  `status` int(11) DEFAULT NULL COMMENT '公司状态:1、未上线，2、上线, 3、下线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募公司';


DROP TABLE IF EXISTS `pe_manager`;

CREATE TABLE `pe_manager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(100) DEFAULT NULL COMMENT '头像',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `education` varchar(100) DEFAULT NULL COMMENT '文化程度',
  `school` varchar(100) DEFAULT NULL COMMENT '毕业院校',
  `work_year` varchar(100) DEFAULT NULL COMMENT '从业年限',
  `background` varchar(100) DEFAULT NULL COMMENT '从业背景',
  `institution` varchar(100) DEFAULT NULL COMMENT '过往从业机构',
  `level` int(11) DEFAULT NULL COMMENT '经理评级: 1:一级、2:二级、3:三级、4:四级、5:五级',
  `manage_fund` bigint(20) DEFAULT NULL COMMENT '管理基金数',
  `profit_product` bigint(20) DEFAULT NULL COMMENT '盈利产品',
  `review` varchar(1000) DEFAULT NULL COMMENT '点评',
  `introduce` varchar(2000) DEFAULT NULL COMMENT '人物介绍',
  `recommend_location` varchar(100) DEFAULT NULL COMMENT '推荐位 ',
  `recommend_sequence` varchar(100) DEFAULT NULL COMMENT '推荐顺序',
  `status` int(11) DEFAULT NULL COMMENT '状态:1、未上线，2、上线, 3、下线 ',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募经理';


DROP TABLE IF EXISTS `pe_manager_product`;

CREATE TABLE `pe_manager_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `manager_id` bigint(20) DEFAULT NULL COMMENT '经理ID',
  `manager_name` varchar(100) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募经理产品关联表';


DROP TABLE IF EXISTS `pe_product`;
CREATE TABLE `pe_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '基金名称',
  `simple_name` varchar(100) DEFAULT NULL COMMENT '基金简称',
  `net_worth` decimal(18,2) DEFAULT NULL COMMENT '最新净值',
  `accumulated_income` decimal(18,2) DEFAULT NULL COMMENT '累计收益',
  `net_worth_time` datetime DEFAULT NULL COMMENT '净值日期',
  `setup_time` datetime DEFAULT NULL COMMENT '成立日期',
  `run_time` varchar(100) DEFAULT NULL COMMENT '运行时间',
  `now_rate` decimal(18,2) DEFAULT NULL COMMENT '今年以来收益率',
  `tow_rate` decimal(18,2) DEFAULT NULL COMMENT '近2年收益率',
  `one_rate` decimal(18,2) DEFAULT NULL COMMENT '近1年收益率',
  `year_rate` decimal(18,2) DEFAULT NULL COMMENT '年化收益率',
  `fund_type` int(11) DEFAULT NULL COMMENT '基金类型:1:股票、2:期货基金、3:股票量化、4:债券型、5:定向增发、6:宏观对冲、7:组合基金、8:其他',
  `product_level` int(11) DEFAULT NULL COMMENT '产品等级:1、一级，2、二级，3、三级， 4、四级，5、五级',
  `distribution_platform` varchar(100) DEFAULT NULL COMMENT '发行平台',
  `custodian_bank` varchar(100) DEFAULT NULL COMMENT '托管银行',
  `stockbrokers` varchar(100) DEFAULT NULL COMMENT '证券经纪',
  `fund_property` int(11) DEFAULT NULL COMMENT '基金性质:1、主基金，2、子基金',
  `whether_structure` varchar(100) DEFAULT NULL COMMENT '是否结构化',
  `open_time` datetime DEFAULT NULL COMMENT '开放日期 ',
  `subscrip_start` decimal(18,2) DEFAULT NULL COMMENT '认购起点',
  `subscrip_fee` decimal(18,2) DEFAULT NULL COMMENT '认 购 费',
  `exit_fee` decimal(18,2) DEFAULT NULL COMMENT '退出费用',
  `management_fee` decimal(18,2) DEFAULT NULL COMMENT '浮动管理费',
  `recommend_reason` varchar(200) DEFAULT NULL COMMENT '推荐理由',
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人姓名',
  `recommend_location` varchar(100) DEFAULT NULL COMMENT '推荐位',
  `recommend_sequence` varchar(100) DEFAULT NULL COMMENT '推荐顺序',
  `status` int(11) DEFAULT NULL COMMENT '产品状态:1、未上线，2、上线, 3、下线 ',
  `pecompany_id` bigint(20) DEFAULT NULL COMMENT '私募公司ID',
  `pecompany_name` varchar(100) DEFAULT NULL COMMENT '私募公司名称',
  `manager_id` bigint(20) DEFAULT NULL COMMENT '经理ID',
  `manager_name` varchar(100) DEFAULT NULL COMMENT '经理名称',
  `is_show` int(11) DEFAULT NULL COMMENT '是否代表作: 1:是,  2:否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募产品';

DROP TABLE IF EXISTS `pe_product_income`;

CREATE TABLE `pe_product_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `year` varchar(100) DEFAULT NULL COMMENT '年度',
  `duration_income` decimal(18,2) DEFAULT NULL COMMENT '期间收益',
  `industry_average` decimal(18,2) DEFAULT NULL COMMENT '行业平均',
  `hs_300` decimal(18,2) DEFAULT NULL COMMENT '沪深300',
  `rank` varchar(100) DEFAULT NULL COMMENT '排名',
  `rank_interval` decimal(18,2) DEFAULT NULL COMMENT '排名区间',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募产品收益排名表';

DROP TABLE IF EXISTS `pe_product_net`;

CREATE TABLE `pe_product_net` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `net_time` datetime DEFAULT NULL COMMENT '净值时间',
  `unit_net` decimal(18,2) DEFAULT NULL COMMENT '单位净值',
  `total_net` decimal(18,2) DEFAULT NULL COMMENT '累计净值',
  `increase_rate` decimal(18,2) DEFAULT NULL COMMENT '增长率',
  `product_id` bigint(20) DEFAULT NULL COMMENT '私募产品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '私募产品名称',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='私募产品净值表';


ALTER TABLE `tjs_product_xtcp` 
CHANGE COLUMN `xtcp_hkly` `xtcp_hkly` VARCHAR(4000) NULL DEFAULT NULL COMMENT '还款来源' ;









