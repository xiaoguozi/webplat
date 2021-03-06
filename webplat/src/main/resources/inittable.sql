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
  `open_time` varchar(100) DEFAULT NULL COMMENT '开放时间',
  `subscrip_start` decimal(18,2) DEFAULT NULL COMMENT '认购起点',
  `subscrip_fee` varchar(50) DEFAULT NULL COMMENT '认 购 费',
  `exit_fee` varchar(50) DEFAULT NULL COMMENT '退出费用',
  `management_fee` varchar(50) DEFAULT NULL COMMENT '浮动管理费',
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
CHANGE COLUMN `xtcp_hkly` `xtcp_hkly` VARCHAR(2000) NULL DEFAULT NULL COMMENT '还款来源' ;



CREATE TABLE `free_peizi_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配资活动主键',
  `peizi_date` date NOT NULL COMMENT '配资活动日期',
  `peizi_type` int(2) NOT NULL DEFAULT '1' COMMENT '配资类型',
  `peizi_count` int(8) unsigned NOT NULL COMMENT '配资计数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='配资活动计数表';


CREATE TABLE `user_info_extend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned DEFAULT '0' COMMENT '用户id',
  `peizi_type` int(2) unsigned DEFAULT '1' COMMENT '配资类型：1、免费配；2、免息配',
  `is_used` int(2) unsigned DEFAULT '0' COMMENT '是否已经使用过：0为未使用过；1为使用过',
  `is_own_resource` int(2) unsigned DEFAULT '0' COMMENT '用户点击免费体验的时候占有一个活动名额计数，默认为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表（参加活动记录）';



CREATE TABLE `tjs_peizi_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '业务流水号',
  `data_zcpzj` decimal(18,2) DEFAULT NULL COMMENT '总超盘资金',
  `data_tzbzj` decimal(18,2) DEFAULT NULL COMMENT '投资保证金',
  `data_pzje` decimal(18,2) DEFAULT NULL COMMENT '配资金额',
  `data_jjx` decimal(18,2) DEFAULT NULL COMMENT '警戒线',
  `data_pcx` decimal(18,2) DEFAULT NULL COMMENT '平仓线',
  `data_type` varchar(45) DEFAULT NULL COMMENT '配资类型：10 配资活动 20 天天配 30 月月配 40 低息配',
  `data_type_sylx` varchar(45) DEFAULT NULL COMMENT '收益类型：10借款账户管理费/天\n                    20借款月利率\n                    30借款年利率',
  `data_zjsyqx` int(11) DEFAULT NULL COMMENT '资金使用期限 ：根据收益类型（data_type_sylx）\n10借款账户管理费/天\n20借款月利率 存月\n 30借款年利率  存月',
  `data_zfglf` decimal(18,2) DEFAULT NULL COMMENT '每天账户管理费',
  `data_yll` decimal(18,2) DEFAULT NULL COMMENT '月利率',
  `data_nll` decimal(18,2) DEFAULT NULL COMMENT '年利率',
  `data_jklx_total` decimal(18,2) DEFAULT NULL COMMENT '借款利息\n如果是账户管理费用：   借款利息 =资金使用期限 *每天账户管理费\n如果是月利率     借款利息 = 资金使用期限*月利率*配资金额\n如果是年利率     借款利息 =  资金使用期限/12*年利率*配资金额\n\n',
  `data_submit_date` datetime DEFAULT NULL COMMENT '配资提交时间',
  `data_jyks_date` varchar(45) DEFAULT NULL COMMENT '1：当天；2下一个交易日',
  `data_step` varchar(3) DEFAULT '1' COMMENT '步骤',
  `data_create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `data_modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `data_use_name` varchar(200) DEFAULT NULL COMMENT '用户名称',
  `data_user_id` bigint(20) DEFAULT NULL COMMENT 'user的流水号',
  `data_user_tel` varchar(45) DEFAULT NULL COMMENT '用户电话',
  `data_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `data_opera_status` varchar(45) DEFAULT NULL COMMENT '处理状态',
  `data_opera_user_id` bigint(20) DEFAULT NULL COMMENT '处理人ID',
  `data_opera_user_name` varchar(200) DEFAULT NULL COMMENT '处理人名称',
  `data_rule_pcx` decimal(18,2) DEFAULT NULL COMMENT '平仓线',
  `data_rule_jjx` decimal(18,2) DEFAULT NULL COMMENT '警戒线',
  `data_jyzf` varchar(100) DEFAULT NULL COMMENT '恒生账户',
  `data_jymm` varchar(100) DEFAULT NULL COMMENT '恒生密码',
  `data_jyzf_date` datetime DEFAULT NULL COMMENT '发送恒生账户时间',
  `data_jyfc_date` datetime DEFAULT NULL COMMENT '操盘完成时间',
  `data_order_code` varchar(50) DEFAULT NULL COMMENT '订单编码',
  `data_profit` decimal(18,2) DEFAULT NULL COMMENT '配资收益',
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='配资业务表';





CREATE TABLE `tjs_peizi_rule` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `rule_type` varchar(5) NOT NULL COMMENT '规则类型：1：配置活动，例如：免费配\n                     2：天天配\n                     3：月月配\n                     4：低息配\n',
  `rule_zjsyqx` int(11) DEFAULT NULL COMMENT '资金使用期限',
  `rule_glsy_type` varchar(3) DEFAULT NULL COMMENT '配资管理收益：\n 1：借款账户管理费/天\n 2：借款月利率\n 3：借款年利率',
  `rule_zhglf` decimal(6,2) DEFAULT NULL COMMENT '配资借款收益：\n1.如果是天天陪，单位是元\n2.如果是',
  `rule_nll` decimal(6,2) DEFAULT NULL COMMENT '年利率',
  `rule_yll` decimal(6,2) DEFAULT NULL COMMENT '月利率\n一倍杠杆',
  `rule_pcx` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n一倍杠杆',
  `rule_jjx` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n一倍杠杆',
  `rule_yll2` decimal(5,2) DEFAULT NULL COMMENT '月利率\n2倍杠杆',
  `rule_yll3` decimal(5,2) DEFAULT NULL COMMENT '月利率\n3倍杠杆',
  `rule_yll4` decimal(5,2) DEFAULT NULL COMMENT '月利率\n4倍杠杆',
  `rule_yll5` decimal(5,2) DEFAULT NULL COMMENT '月利率\n5倍杠杆',
  `rule_yll6` decimal(5,2) DEFAULT NULL COMMENT '月利率\n6倍杠杆',
  `rule_pcx2` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n2倍杠杆',
  `rule_pcx3` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n3倍杠杆',
  `rule_pcx4` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n4倍杠杆',
  `rule_pcx5` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n5倍杠杆',
  `rule_pcx6` decimal(5,2) DEFAULT NULL COMMENT '平仓线(%)，为零或者空为不需要警戒线 \n6倍杠杆',
  `rule_jjx2` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n2倍杠杆',
  `rule_jjx3` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n3倍杠杆',
  `rule_jjx4` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n4倍杠杆',
  `rule_jjx5` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n5倍杠杆',
  `rule_jjx6` decimal(5,2) DEFAULT NULL COMMENT '警戒线(%)，为零或者空为不需要警戒线\n6倍杠杆',
  `rule_enable` varchar(2) DEFAULT '10' COMMENT '配资开关10：可以操作，20：不能操作',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置规则';


CREATE TABLE `t_cust_identity` (
  `identify_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户序号',
  `identify_type` smallint(2) DEFAULT '0' COMMENT '证件类型 0 身份证 1 其他',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `card_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `valid_type` smallint(1) DEFAULT NULL COMMENT '验证方式(0 自动 1 手动)',
  `status` smallint(1) DEFAULT NULL COMMENT '状态(0 待审核 1 正确 2 不正确 )',
  `audit_by` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_desc` varchar(1000) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`identify_id`),
  KEY `IDX_cust_identity_CustID` (`customer_id`) USING BTREE,
  KEY `IDX_cust_identify_cardNo` (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


alter table t_user_info add  name varchar(64) comment '姓名';
alter table t_user_info add  cert_id varchar(20) comment '身份证明信息';
alter table t_user_info add  is_validate int(2) DEFAULT 0 COMMENT '是否已实名认证：0、未实名认证；1、已实名认证';


CREATE TABLE `tjs_cust_bank` (
  `bank_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` bigint(20) NOT NULL COMMENT '用户序号',
  `card_from` smallint(2) DEFAULT '0' COMMENT '卡来源(0 电脑 1手机)',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名字',
  `bank_code` varchar(20) DEFAULT NULL COMMENT '银行代号',
  `card_no` varchar(30) DEFAULT NULL COMMENT '卡号',
  `bank_province` varchar(30) DEFAULT NULL COMMENT '省份',
  `bank_city` varchar(250) DEFAULT NULL COMMENT '所属城市',
  `is_quick` smallint(1) DEFAULT '0' COMMENT '是否快捷支付',
  `branch_name` varchar(250) DEFAULT NULL COMMENT '所属分行',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`bank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8 COMMENT='银行卡表';





CREATE TABLE `tjs_recharge` (
  `recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户序号',
  `fund_type` varchar(20) DEFAULT NULL COMMENT '充值类型',
  `amount` decimal(18,2) DEFAULT NULL COMMENT '充值金额',
  `status` smallint(1) DEFAULT NULL COMMENT '充值状态(0 未完成 1 成功 2 失败)',
  `paynumber` varchar(100) DEFAULT NULL COMMENT '`充值流水号',
  `card_no` varchar(50) DEFAULT NULL COMMENT '充值账号',
  `record_desc` varchar(1000) DEFAULT NULL COMMENT '充值描述',
  `request_ip` varchar(60) DEFAULT NULL COMMENT '请求IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `audit_by` varchar(50) DEFAULT NULL COMMENT '如果有线下充值，可以通过后台管理加值的',
  `update_time` datetime DEFAULT NULL COMMENT '成功时间',
  `lockid` int(4) DEFAULT '1' COMMENT '锁',
  PRIMARY KEY (`recharge_id`),
  KEY `IDX_recharge_cust_id` (`customer_id`) USING BTREE,
  KEY `IDX_recharge_createtime` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录表';


CREATE TABLE `tjs_withdraw` (
  `withdraw_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` bigint(20) NOT NULL COMMENT '用户序号',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '银行名字eg:工商银行',
  `bank_code` varchar(20) DEFAULT NULL COMMENT '银行',
  `card_from` smallint(1) DEFAULT '0' COMMENT '卡来源(0 电脑 1手机)',
  `card_no` varchar(30) DEFAULT NULL COMMENT '提现账号',
  `bank_province` varchar(10) DEFAULT NULL COMMENT '所属省',
  `bank_city` varchar(30) DEFAULT NULL COMMENT '所属城市',
  `amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `poundage_amount` decimal(20,2) NOT NULL COMMENT '手续费',
  `branch_name` varchar(150) DEFAULT NULL COMMENT '所属分行',
  `request_ip` varchar(60) DEFAULT NULL COMMENT '请求IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `status` smallint(2) DEFAULT NULL COMMENT '提现状态(0 待审核 1 待确定 2 完成 3 取消)',
  `audit_by` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_desc` varchar(200) DEFAULT NULL COMMENT '审核描述',
  `check_by` varchar(50) DEFAULT NULL COMMENT '确定人',
  `check_time` datetime DEFAULT NULL COMMENT '确定时间',
  `lockid` int(4) DEFAULT '1' COMMENT '业务锁',
  PRIMARY KEY (`withdraw_id`),
  KEY `IDX_withdraw_cust_id` (`customer_id`) USING BTREE,
  KEY `IDX_withdraw_createtime` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现记录申请表';



CREATE TABLE `tjs_customer_fund` (
  `customer_fund_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '个人账户流水号',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客服ID',
  `total_fund` decimal(18,2) DEFAULT '0.00' COMMENT '账户总额',
  `usable_fund` decimal(18,2) DEFAULT '0.00' COMMENT '可用金额',
  `peizi_fund` decimal(18,2) DEFAULT '0.00',
  `fxbz_fund` decimal(18,2) DEFAULT '0.00' COMMENT '风险保证金',
  `dongjie_fund` decimal(18,2) DEFAULT '0.00' COMMENT '冻结金额',
  `lock_Id` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`customer_fund_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人资金账户';



CREATE TABLE `tjs_fund_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` bigint(20) NOT NULL COMMENT '用户序号',
  `fund_type` varchar(20) DEFAULT NULL COMMENT '资金类型10:充值,20配资风险保证金,30借款利息,40配资收益,50,提现',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '操作金额',
  `usable_amount` decimal(20,2) DEFAULT NULL COMMENT '可用金额',
  `business_id` varchar(100) DEFAULT NULL COMMENT '业务序号(提现对应提现的id 充值对应充值的ID)',
  `record_desc` varchar(300) DEFAULT NULL COMMENT '操作描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`record_id`),
  KEY `IDX_FUND_RECORD_CUST` (`customer_id`) USING BTREE,
  KEY `IDX_FUND_RECORD_CREATETIME` (`create_time`) USING BTREE,
  KEY `IDX_FUND_RECORD_TYPE` (`fund_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50622 DEFAULT CHARSET=utf8 COMMENT='资金流水';


CREATE TABLE `tjs_area` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `temp_pcode` varchar(10) DEFAULT NULL,
  `name_cn` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `display_order` int(255) DEFAULT NULL,
  `status` smallint(2) DEFAULT NULL,
  `level` smallint(2) DEFAULT NULL,
  `privince_area` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `IDX_AREA_CODE` (`code`) USING BTREE,
  KEY `IDX_AREA_TEMP_PCODE` (`temp_pcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tjs_bank` (
  `bank_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `bank_code` varchar(45) DEFAULT NULL COMMENT '银行编码',
  `bank_name` varchar(45) DEFAULT NULL COMMENT '银行名字',
  `bank_img` varchar(45) DEFAULT NULL COMMENT '银行图片',
  PRIMARY KEY (`bank_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='淘金山支持的银行';


ALTER TABLE `tjs_peizi_data` 
CHANGE COLUMN `data_opera_user_id` `data_opera_user_id` BIGINT(20) NULL DEFAULT NULL COMMENT '验证ID' ,
CHANGE COLUMN `data_opera_user_name` `data_opera_user_name` VARCHAR(200) NULL DEFAULT NULL COMMENT '操盘完成' ,
ADD COLUMN `data_audit_by` VARCHAR(100) NULL COMMENT '操盘完成' AFTER `data_profit`;


ALTER TABLE `tjs_peizi_data` 
ADD COLUMN `lock_id` INT NULL COMMENT '版本控制' AFTER `data_audit_by`;


ALTER TABLE `tjs_peizi_data` 
ADD COLUMN `data_cpf_date` DATETIME NULL COMMENT '操盘完成时间' AFTER `lock_id`;


CREATE TABLE `tjs_wx_tick` (
  `tick_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `tick_name` varchar(200) DEFAULT NULL COMMENT 'tick_name',
  `tick_date` bigint(20) DEFAULT NULL COMMENT '请求到时间秒',
  `token_date` bigint(20) DEFAULT NULL COMMENT 'token 请求时间',
  `tick_interval` bigint(20) DEFAULT NULL COMMENT '过期时间，单位秒',
  PRIMARY KEY (`tick_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信分享朋友圈调用凭证缓存';


ALTER TABLE `tjs_product_xtcp`;
ADD COLUMN `xtcp_url` VARCHAR(100) NULL COMMENT '文件地址' AFTER `xtcp_tzfs`;

ALTER TABLE USER ADD COLUMN reg_from VARCHAR(10) COMMENT '注册来源：0或null--PC端；1--手机端；10--高铁';
ALTER TABLE USER ADD COLUMN parent BIGINT(20) COMMENT '推荐人';



















