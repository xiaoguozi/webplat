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

