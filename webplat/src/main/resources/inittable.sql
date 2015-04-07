/*create Table sql */
CREATE TABLE `private_placement_company` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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


CREATE TABLE `tjs`.`pe_product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(45) NULL COMMENT '基金名称',
  `simple_name` VARCHAR(45) NULL COMMENT '基金简称',
  `net_worth` VARCHAR(45) NULL COMMENT '最新净值',
  `accumulated_income` VARCHAR(45) NULL COMMENT '累计收益',
  `net_worth_time` DATETIME NULL COMMENT '净值日期',
  `setup_time` DATETIME NULL COMMENT '成立日期',
  `run_time` VARCHAR(45) NULL COMMENT '运行时间',
  `now_rate` VARCHAR(45) NULL COMMENT '今年以来收益率',
  `tow_rate` VARCHAR(45) NULL COMMENT '近2年收益率',
  `one_rate` VARCHAR(45) NULL COMMENT '近1年收益率',
  `year_rate` VARCHAR(45) NULL COMMENT '年化收益率',
  `fund_type` INT NULL COMMENT '基金类型:1:股票、2:期货基金、3:股票量化、4:债券型、5:定向增发、6:宏观对冲、7:组合基金、8:其他',
  `product_level` INT NULL COMMENT '产品等级:1、一级，2、二级，3、三级， 4、四级，5、五级',
  `distribution_platform` VARCHAR(45) NULL COMMENT '发行平台',
  `custodian_bank` VARCHAR(45) NULL COMMENT '托管银行',
  `stockbrokers` VARCHAR(45) NULL COMMENT '证券经纪',
  `fund_property` INT NULL COMMENT '基金性质:1、主基金，2、子基金',
  `whether_structure` VARCHAR(45) NULL COMMENT '是否结构化',
  `open_time` DATETIME NULL COMMENT '开放日期 ',
  `subscrip_start` VARCHAR(45) NULL COMMENT '认购起点',
  `subscrip_fee` VARCHAR(45) NULL COMMENT '认 购 费',
  `exit_fee` VARCHAR(45) NULL COMMENT '退出费用',
  `management_fee` VARCHAR(45) NULL COMMENT '浮动管理费',
  `recommend_reason` VARCHAR(100) NULL COMMENT '推荐理由',
  `create_date` DATETIME NULL,
  `last_modify_date` DATETIME NULL,
  `creater_id` BIGINT(20) NULL COMMENT '创建人ID',
  `creater_name` VARCHAR(45) NULL COMMENT '创建人姓名',
  `recommend_location` INT NULL COMMENT '推荐位',
  `recommend_sequence` INT NULL COMMENT '推荐顺序',
  `status` INT NULL COMMENT '产品状态:1、上线，2、运行中, 3、下线',
  `pecompany_id` BIGINT(20) NULL COMMENT '私募公司ID',
  `pecompany_name` VARCHAR(45) NULL COMMENT '私募公司名称',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '私募产品';




drop table if exists t_user_info;
create table t_user_info
(
   id bigint(20) not null AUTO_INCREMENT comment 'ID',
   user_id bigint(20) comment '用户唯一标识',
   nick_name varchar(64) comment '用户昵称',
   mobile_no varchar(16) comment '手机号',
   qq_no varchar(16) comment 'QQ号',
   wechat_no varchar(16) comment '微信号',
   email varchar(128) comment '邮箱',
   reg_time datetime comment '注册时间',
   primary key (id)
) DEFAULT CHARSET=utf8 comment='用户信息';


drop table if exists t_web_log;
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

