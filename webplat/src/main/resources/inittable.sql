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
  `xgts_pjsyl` decimal(10,2) DEFAULT NULL COMMENT '平均收益率',
  `xgts_cpdfbl` decimal(10,2) DEFAULT NULL COMMENT '产品兑付比例',
  PRIMARY KEY (`xtgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='信托公司';


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
  `xtcp_area` varchar(100) DEFAULT NULL COMMENT '所在区域',
  `xtcp_city` varchar(100) DEFAULT NULL COMMENT '所在城市',
  PRIMARY KEY (`xtcp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='信托产品';




CREATE TABLE `tjs_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_user_id` bigint(20) DEFAULT NULL COMMENT '订单提交人ID',
  `order_user_name` varchar(200) DEFAULT NULL COMMENT '订单人名称',
  `order_telphone` varchar(45) DEFAULT NULL COMMENT '订单人电话',
  `order_product_id` bigint(20) DEFAULT NULL COMMENT '订单产品ID',
  `order_product_name` varchar(500) DEFAULT NULL COMMENT '订单产品名称',
  `order_product_type` varchar(10) DEFAULT NULL COMMENT '订单产品类型',
  `order_operate_status` varchar(45) DEFAULT NULL COMMENT '订单处理状态',
  `order_operate_ID` bigint(20) DEFAULT NULL COMMENT '订单处理人ID',
  `order_operate_name` varchar(200) DEFAULT NULL COMMENT '订单处理人',
  `order_create_date` date DEFAULT NULL COMMENT '订单创建时间',
  `order_operate_date` date DEFAULT NULL COMMENT '订单处理时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定信息表';

