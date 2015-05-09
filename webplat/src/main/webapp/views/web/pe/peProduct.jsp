<%@ include file="/views/web/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘金山—跟我淘金山</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet"
	media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

<!--私募页面样式-->
<link href="assets/css/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/scripts-bottom-min.js"></script>

<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>

</head>

<body>

	<div class="home_all">

		<%@ include file="/views/web/header.jsp"%>
		<!-- /header_top -->

		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
				<div class="logo_wrap">
					<a href="http://www.taojinshan.com.cn"> <img
						src="assets/img/ui/tjs_logo.png" width="338" height="94"
						align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu menu">
					<ul>
						<li><a href="rest/web/pe/peIndex"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct"><span class="simu_on">私募产品</span></a></li>
						<li><a href="simuchanpinpaihang.html"><span>私募排行</span></a></li>
						<li><a href="simuchanpinjingli.html"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="" class="path_item">私募</a> <span
					class="sep">&gt;</span> <a href="" class="path_item">私募产品</a> <span
					class="sep">&gt;</span> <span class="txt">筛选条件</span>
			</div>
		</div>
		<!-- container -->
		<div class="simu_pro_container">
			<!-- hot product-->
			<div class="layout_n">
				<div class="mod_box_item simu_hot_box">
					<div class="tjs_right_titlediv fontcolor">
						<img class="tjs_img_diamond" src="assets/img/ui/diamond.png" />顶级私募产品
					</div>
					<div class="box_bd">
						<ul class="simu_hotpro_list clearfix">
							<li class="hotpro_item bg_hover">
								<div class="hotpro_hd">
									<a href="" target="_blank"><span class="txt_1">徐翔</span>&nbsp;
										<span class="txt_2">泽熙3期</span> </a>
								</div>
								<div class="hotpro_income">
									<span class="income_tit">累计收益</span><br /> <span class="money">534.<em
										class="small">88%</em>
									</span>
								</div>
								<div class="hotpro_comment">
									<span class="comment_tit"></span>私募一哥，风格犀利，踩点精准，业绩遥遥领先！
								</div>
								<div class="hotpro_control">
									<a class="uc_btn_primary uc_btn simu_reserve_btn"
										href="javascript:void(0)" onclick="alertbox(this)"> <img
										src="assets/img/ui/clock.png" />立即预约
									</a>
								</div>
							</li>
							<li class="hotpro_item bg_hover">
								<div class="hotpro_hd">
									<a href="" target="_blank"><span class="txt_1">张小川</span>&nbsp;
										<span class="txt_2">清水源1号</span> </a>
								</div>
								<div class="hotpro_income">
									<span class="income_tit">累计收益</span> <br /> <span
										class="money">672.<em class="small">89%</em>
									</span>
								</div>
								<div class="hotpro_comment">
									<span class="comment_tit"></span>擅长趋势投资策略，风控严谨产品回撤幅度小！
								</div>
								<div class="hotpro_control">
									<a class="uc_btn_primary uc_btn simu_reserve_btn"
										href="javascript:void(0)" onclick="alertbox(this)"> <img
										src="assets/img/ui/clock.png" />立即预约
									</a>
								</div>
							</li>
							<li class="hotpro_item bg_hover">
								<div class="hotpro_hd">
									<a href="" target="_blank"><span class="txt_1">赵军</span>&nbsp;
										<span class="txt_2">淡水泉成长一期</span> </a>
								</div>
								<div class="hotpro_income">
									<span class="income_tit">累计收益</span><br /> <span class="money">358.<em
										class="small">86%</em>
									</span>
								</div>
								<div class="hotpro_comment">
									<span class="comment_tit"></span>老牌大型私募，业绩持续稳定，管理规模排名前三！
								</div>
								<div class="hotpro_control">
									<a class="uc_btn_primary uc_btn simu_reserve_btn"
										href="javascript:void(0)" onclick="alertbox(this)"> <img
										src="assets/img/ui/clock.png" />立即预约
									</a>
								</div>
							</li>
							<li class="hotpro_item bg_hover"
								style="border-right: 1px solid #e1e1e1">
								<div class="hotpro_hd">
									<a href="" target="_blank"><span class="txt_1">张高</span>&nbsp;
										<span class="txt_2">鼎锋成长一期</span> </a>
								</div>
								<div class="hotpro_income">
									<span class="income_tit">累计收益</span><br /> <span class="money">312.<em
										class="small">70%</em>
									</span>
								</div>
								<div class="hotpro_comment">
									<span class="comment_tit"></span>专注成长投资+主题博弈，累计收益已破290%！
								</div>
								<div class="hotpro_control">
									<a class="uc_btn_primary uc_btn simu_reserve_btn"
										href="javascript:void(0)" onclick="alertbox(this)"> <img
										src="assets/img/ui/clock.png" />立即预约
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="mod_box_item simu_mainprolist_box">
					<div class="tjs_right_titlediv fcolor">
						<img class="tjs_img_diamond" src="assets/img/ui/ranklist.png" />全部私募产品
					</div>
					<div class="simuchanpin_liebiao">
						<div class="simu_mainprolist_mult clearfix">
							<div class="mult_item">
								<div class="mult_name">基金经理：</div>
								<div class="mult_con">
									<a href="" class="mult_lk mult_checked">不限</a> <a
										class="mult_lk" href="">艾亮</a> <a id="tjs_more"
										class="mult_more">&gt; 更多</a>
									<div class="mult_more_wrap" style="display: none;">
										<ul class="more_wrap_hd">
											<li class="active"><a href="">A</a></li>
											<li><a href="">B</a></li>
											<li><a href="">C</a></li>
											<li><a href="">D</a></li>
											<li><a href="">E</a></li>
											<li><a href="">F</a></li>
											<li><a href="">G</a></li>
											<li><a href="">H</a></li>
											<li><a href="">I</a></li>
											<li><a href="">J</a></li>
											<li><a href="">K</a></li>
											<li><a href="">L</a></li>
											<li><a href="">M</a></li>
											<li><a href="">N</a></li>
											<li><a href="">O</a></li>
											<li><a href="">P</a></li>
											<li><a href="">Q</a></li>
											<li><a href="">R</a></li>
											<li><a href="">S</a></li>
											<li><a href="">T</a></li>
											<li><a href="">U</a></li>
											<li><a href="">V</a></li>
											<li><a href="">W</a></li>
											<li><a href="">X</a></li>
											<li><a href="">Y</a></li>
											<li><a href="">Z</a></li>
										</ul>
										<div class="more_wrap_bd">
											<ul class="more_lk_list">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">安农</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">艾亮</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">安亚林</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">艾亮</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">安俊杰</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="l" class="mult_lk">包周荣</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">陈子木</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">曹素生</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">段文胜</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">段成玉</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">耳頔</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">付英杰</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">冯志坚</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">甘华</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">郭振宇</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">何震</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">胡慧珍</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">吉建晔</a> </label></li>
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">姜德取</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">康道志</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">鲁轶</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">梅琳燕</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">宁金山</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="l" class="mult_lk">欧阳苗伟</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">潘静</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">齐士扬</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">饶向辉</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">孙志洪</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">涂忠华</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">万桦</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">徐胜广</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">杨欢</a> </label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk">周枫</a> </label></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="mult_item">
								<div class="mult_name">基金公司：</div>
								<div class="mult_con">
									<a href="" class="mult_lk mult_checked">不限</a> <a href="l"
										class="mult_lk">泽熙投资</a> <a href="" class="mult_lk">创势翔投资</a>
									<a href="" class="mult_lk">清水源</a> <a href="" class="mult_lk">重阳投资</a>
									<a href="" class="mult_lk">淡水泉</a> <a href="" class="mult_lk">鼎锋资产</a>
									<a href="" class="mult_lk">北京和聚投资</a> <a href=""
										class="mult_lk">淘利资产</a> <a id="tjs_mores" class="mult_more">&gt;
										更多</a>
									<div class="mult_more_wrap" style="display: none;">
										<ul class="more_wrap_hd">
											<li class="active"><a href="">A</a></li>
											<li><a href="">B</a></li>
											<li><a href="">C</a></li>
											<li><a href="">D</a></li>
											<li><a href="">E</a></li>
											<li><a href="">F</a></li>
											<li><a href="">G</a></li>
											<li><a href="">H</a></li>
											<li><a href="">I</a></li>
											<li><a href="">J</a></li>
											<li><a href="">K</a></li>
											<li><a href="">L</a></li>
											<li><a href="">M</a></li>
											<li><a href="">N</a></li>
											<li><a href="">O</a></li>
											<li><a href="">P</a></li>
											<li><a href="">Q</a></li>
											<li><a href="">R</a></li>
											<li><a href="">S</a></li>
											<li><a href="">T</a></li>
											<li><a href="">U</a></li>
											<li><a href="">V</a></li>
											<li><a href="">W</a></li>
											<li><a href="">X</a></li>
											<li><a href="">Y</a></li>
											<li><a href="">Z</a></li>

										</ul>
										<div class="more_wrap_bd">
											<ul class="more_lk_list">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk"></a></label></li>
											</ul>
											<ul class="more_lk_list" style="display: none;">
												<li class="lk_item"><label class="lk_lbl"><a
														href="" class="mult_lk"></a></label></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="mult_item">
								<div class="mult_name">基金类型：</div>
								<div class="mult_con">
									<a class="mult_lk mult_checked" href="">不限</a> <a
										class="mult_lk" href="">股票策略</a> <a href="#" class="mult_more"></a>
								</div>
							</div>
							<div class="mult_item">
								<div class="mult_name">年化收益：</div>
								<div class="mult_con">
									<a class="mult_lk mult_checked" href="">不限</a> <a
										class="mult_lk" href="">50%以上</a> <a class="mult_lk" href="">30%-50%</a>
									<a class="mult_lk" href="">10%-30%</a> <a class="mult_lk"
										href="">0%-10%</a> <a class="mult_lk" href="">0%以下</a>
								</div>
							</div>
							<div class="mult_item mult_item_search">
								<div class="mult_name">关&nbsp;&nbsp;键&nbsp;&nbsp;词：</div>
								<div class="mult_con">
									<div class="uc_boxhd_search skin_1">
										<input class="input_txt" style="border-right: none;"
											type="text"> <a id="simu_product_list_search" href=""
											class="input_search"></a>
									</div>
									<div class="fast_search">
										<a target="_blank" href="">泽熙3期</a> <a target="_blank" href="">清水源1号</a>
										<a target="_blank" href="">淡水泉成长一期</a>
									</div>
								</div>
							</div>
							<div class="mult_item mult_item_checked">
								<div class="mult_name">已选条件：</div>
								<div class="mult_con">
									<span class="checked_info">共 <em class="num">888</em>
										款产品满足条件
									</span> <label class="checked_condition">
										在售&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										class="input_check" checked="checked" type="checkbox">
									</label>
								</div>
							</div>
						</div>
						<div class="simu_mainprolist_result">
							<table class="simu_pro_tb_2" id="tjs_tbl" width="100%">
								<thead class="rowspan_2">
									<tr class="row_1">
										<th class="c_c c_b c_first_control" width="50"></th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金概况</p>
										</th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金净值</p>
										</th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金收益率</p>
										</th>
										<th class="c_c c_b" width="*"></th>
										<th class="c_c" width="*"></th>
									</tr>
									<tr class="row_2 tr_bgcolor">
										<td class="c_c c_b c_first_control">对比</td>
										<td class="c_l">基金简称</td>
										<td class="c_l">基金经理</td>
										<td class="c_c c_b">基金公司</td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)">最新净值<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)">累计收益<em></em></a></td>
										<td class="c_c_s c_b"><a class="uc_sort"
											href="javascript:void(0)">运行时间<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)">近2年<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)">近1年<em></em></a></td>
										<td class="c_r_s c_b"><a class="uc_sort"
											href="javascript:void(0)">年化收益<em></em></a></td>
										<td class="c_r_s c_b">净值走势</td>
										<td class="c_c">预约</td>
									</tr>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="simuchanpinmingxi.html">翼虎成长5期</a></td>
										<td class="c_l">余定恒</td>
										<td class="c_c_s c_b">翼虎投资</td>
										<td class="c_r_s"><span>99.92</span></td>
										<td class="c_r_s"><span class="f_f80 ">392.00%</span></td>
										<td class="c_c_s c_b">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s c_b ">380.00%</td>
										<td class="c_b">
											<div class="trend_viewer">
												<div class="trend_viewer_hd">
													<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
												</div>
												<div class="details_show">
													<em class="left_icon"></em>
													<div class="details_boxes"></div>
												</div>
											</div>
										</td>
										<td class="c_c"><a
											class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
									</tr>
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="simuchanpinmingxi.html">翼虎成长5期</a></td>
										<td class="c_l">余定恒</td>
										<td class="c_c_s c_b">翼虎投资</td>
										<td class="c_r_s"><span>99.92</span></td>
										<td class="c_r_s"><span class="f_f80 ">392.00%</span></td>
										<td class="c_c_s c_b">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s c_b ">380.00%</td>
										<td class="c_b">
											<div class="trend_viewer">
												<div class="trend_viewer_hd">
													<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
												</div>
												<div class="details_show">
													<em class="left_icon"></em>
													<div class="details_boxes"></div>
												</div>
											</div>
										</td>
										<td class="c_c"><a
											class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
									</tr>
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="simuchanpinmingxi.html">翼虎成长5期</a></td>
										<td class="c_l">余定恒</td>
										<td class="c_c_s c_b">翼虎投资</td>
										<td class="c_r_s"><span>99.92</span></td>
										<td class="c_r_s"><span class="f_f80 ">392.00%</span></td>
										<td class="c_c_s c_b">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s c_b ">380.00%</td>
										<td class="c_b">
											<div class="trend_viewer">
												<div class="trend_viewer_hd">
													<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
												</div>
												<div class="details_show">
													<em class="left_icon"></em>
													<div class="details_boxes"></div>
												</div>
											</div>
										</td>
										<td class="c_c"><a
											class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
									</tr>
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="simuchanpinmingxi.html">翼虎成长5期</a></td>
										<td class="c_l">余定恒</td>
										<td class="c_c_s c_b">翼虎投资</td>
										<td class="c_r_s"><span>99.92</span></td>
										<td class="c_r_s"><span class="f_f80 ">392.00%</span></td>
										<td class="c_c_s c_b">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s c_b ">380.00%</td>
										<td class="c_b">
											<div class="trend_viewer">
												<div class="trend_viewer_hd">
													<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
												</div>
												<div class="details_show">
													<em class="left_icon"></em>
													<div class="details_boxes"></div>
												</div>
											</div>
										</td>
										<td class="c_c"><a
											class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
									</tr>
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="simuchanpinmingxi.html">翼虎成长5期</a></td>
										<td class="c_l">余定恒</td>
										<td class="c_c_s c_b">翼虎投资</td>
										<td class="c_r_s"><span>99.92</span></td>
										<td class="c_r_s"><span class="f_f80 ">392.00%</span></td>
										<td class="c_c_s c_b">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s">---</td>
										<td class="c_r_s c_b ">380.00%</td>
										<td class="c_b">
											<div class="trend_viewer">
												<div class="trend_viewer_hd">
													<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
												</div>
												<div class="details_show">
													<em class="left_icon"></em>
													<div class="details_boxes"></div>
												</div>
											</div>
										</td>
										<td class="c_c"><a
											class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
									</tr>
									<tr>
										<td colspan="12" class="foot_page" style="text-align: center;">
											<a href="#"><em>|</em><</a><a class="pagingnum" href="#"><</a><a
											class="pagingnum page_on" href="#">1</a><a class="pagingnum"
											href="#">2</a><a class="pagingnum" href="#">></a><a href="#">><em>|</em></a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- container end -->
		</div>
		<!-- 产品对比 -->
		<div class="simu_compare_container">
			<div class="compare_container">
				<div class="compare_container_title">
					<h3 class="compare_products">产品对比栏</h3>
					<div class="close_compare">
						<img src="images/close_compareicon.png" alt="" />隐藏
					</div>
				</div>
				<div class="compare_container_contents">
					<img class="del_compare" src="images/close_compare.png" alt="" />
					<div class="clear"></div>
					<p>金手指三号</p>
					<p>累计收益</p>
					<p class="tjs_products_title">
						1920.<span>55%</span>
					</p>
				</div>
				<div class="compare_container_contents">
					<img class="del_compare" src="images/close_compare.png" alt="" />
					<div class="clear"></div>
					<p>金手指三号</p>
					<p>累计收益</p>
					<p class="tjs_products_title">
						1920.<span>55%</span>
					</p>
				</div>
				<div class="compare_container_contents">
					<p class="moren_font">你还可以继续添加</p>
				</div>
				<div class="tjs_comparing">
					<a class="uc_btn compare_btn" href="simuchanpinduibi.html">对&nbsp;&nbsp;&nbsp;&nbsp;比</a>
					<a id="clear_duibi" class="uc_btn compare_btn">清空对比栏</a>
				</div>
			</div>
		</div>
		<!-- 产品对比 end -->
		<div class="clear"></div>

		<!-- /tjs_product_div -->
		<!-- 私募板块结束 -->
		
		<%@ include file="/views/web/footer.jsp"%>
	</div>
	
	<!-- /home_all -->
	<script>
        window.onload = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            //--/轮播按钮--
            //--自定义下拉框--
            $(".sel_wrap").on("change", function () {
                var o;
                var opt = $(this).find('option');
                opt.each(function (i) {
                    if (opt[i].selected == true) {
                        o = opt[i].innerHTML;
                    }
                })
                $(this).find('label').html(o);
            }).trigger('change');
            //--/自定义下拉框--
            //--表格单行变色--
            $("tr:even").css("background", "#EEEDEB");
            //--/表格单行变色--
        }
        
      //--预约--
        function alertbox() {
            alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
        }
        //--/预约--
    </script>


    

</body>
</html>




















