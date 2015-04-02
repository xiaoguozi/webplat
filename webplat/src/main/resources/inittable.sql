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


