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
<link href="assets/css/ui/simu.css" rel="stylesheet" />

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
					<a href="#"> <img
						src="assets/img/ui/tjs_logo.png" width="338" height="94"
						align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu menu">
					<ul>
						<li><a href="rest/web/pe/peIndex"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct"><span>私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexRate"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span
								class="simu_on">私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="#" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item">私募</a> <span
					class="sep">&gt;</span> <a href="rest/web/pe/peIndexManager" class="path_item">私募经理</a> <span
					class="sep">&gt;</span> <span class="txt">经理明细</span>
			</div>
		</div>

		<!-- container -->
		<div class="simu_prodetail_container simu_side_nav_main">

			<!-- hot -->
			<div id="detail_info" class="layout_n simu_side_nav_box">
				<div class="simu_detailtop_box clearfix box_top_color">
					<div class="detail_box_1">
						<span class="box_tit"> <a target="_blank" href=""><img
								width="35" height="35" src="assets/img/ui2/txicon.png" alt="" /> 徐翔</a><span
							class="small_fontcolor"> - 好运来巨牛一号 </span></span>
					</div>
					<div class="detail_box_2">
						<ul class="attr_list clearfix">
							<!-- 无收益 -->
							<!-- 有收益 -->
							<li class="attr_item">
								<table class="jinglixinxi">
									<tr>
										<td>产品盈利占比：</td>
										<td class="txt_a_left"><span class="font_color_y">62.50%</span></td>
									</tr>
									<tr>
										<td>管理基金：</td>
										<td class="txt_a_left"><span class="font_color_b">8只</span></td>
									</tr>
									<tr>
										<td>产品盈利：</td>
										<td class="txt_a_left"><span class="font_color_b">5只</span></td>
									</tr>
								</table>
							</li>
							<li class="attr_item">
								<table class="jinglixinxi">
									<tr>
										<td>带便产品：</td>
										<td class="txt_a_left"><span class="bluecolor_font">泽熙三期</span></td>
									</tr>
									<tr>
										<td>累计收益：</td>
										<td class="txt_a_left"><span class="font_color_b">534.88%</span></td>
									</tr>
									<tr>
										<td>净值日期：</td>
										<td class="txt_a_left"><span class="font_color_b">2015-4-20</span></td>
									</tr>
								</table>
							</li>
							<li class="attr_item attr_item_last"
								style="border-right: 1px solid #d3d3d3;">
								<table class="jinglixinxi">
									<tr>
										<td>所在公司：</td>
										<td class="txt_a_left"><span class="bluecolor_font">泽熙投资</span></td>
									</tr>
									<tr>
										<td>从业年限：</td>
										<td class="txt_a_left"><span class="font_color_b">--</span></td>
									</tr>
									<tr>
										<td>从业背景：</td>
										<td class="txt_a_left"><span class="font_color_b">券</span></td>
									</tr>
								</table>
							</li>
						</ul>
					</div>
					<div class="detail_box_3">
						<form action="/public/rsv" class="detail_form"
							id="simu_detail_rsv_form">
							<div class="form_bd">
								<div class="submit_wrap">
									<div class="input_control">
										<b style="color: #FF6600; font-size: 26px;">400-888-896</b>
									</div>
									<div class="input_control">
										<a class="input_btn tjsinput_btn" href="javascript:void(0)"
											onclick="alertbox(this)"><img class="clockicon"
											src="assets/img/ui2/clock.png" />立即预约</a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="clear"></div>
					<div class="jingli_txt">
						<img style="vertical-align: middle" src="assets/img/ui2/dianping.png"
							alt="" />&nbsp;私募一哥，风格犀利，踩点精准，业绩遥遥领先!
					</div>
				</div>


				<div style="display: block; float: left;">
					<div id="detail_manager"
						class="mod_left_item tab simu_left_tab simu_side_nav_box">
						<div class="left_hd tab_hd clearfix">
							<em class="ui_titico ui_titico_7"><img
								src="assets/img/ui2/txico.png" width="35" height="35" alt="" /></em>
							<ul class="tab_control">
								<li class="tab_control_item active">基金经理</li>
								<li class="sep"></li>
								<li class="tab_control_item">私募公司</li>
							</ul>
						</div>
						<div class="simu_detailwrap tab_bd" id="product_detail_div">
							<!-- tc_1 -->
							<div class="tab_con active">
								<!-- 基金经理 -->
								<div class="tab_mgr_wrap clearfix">
									<div class="mgr_img ">
										<img class="auto_wh" src="assets/img/ui2/morentxicon.png" alt="">
									</div>
									<div class="mgr_con mgr_con_color">1993年毕业于大连理工大学工程力学系，93年进入股票市场，2008年
										开始专职投资股票，经历了四次特大的起落，对市场有深刻的经历和理解，综合政策面、基本面、板块、市场热点、市场心态、技术图形、主力资金、概率、盘感去
										把握市场的机会。比较成功的经历95年2月全仓买入000035转配股到2000年2月上市卖出赚了20倍
										，2003年11月95%资金买入000638到2009年复牌上市第一天冲高时卖出赚了7倍，短线最成功的经历是2008年6月时在20天内资金翻了一
										倍，2009年赚了约一倍，2010年四倍，2011年近一倍。2011底到2014年初主要研究和投资股指期货。</div>
								</div>
								<div class="tab_mgr_wrap clearfix dp_none">
									<div class="mgr_con_color">1993年毕业于大连理工大学工程力学系，93年进入股票市场，2008年
										开始专职投资股票，经历了四次特大的起落，对市场有深刻的经历和理解，综合政策面、基本面、板块、市场热点、市场心态、技术图形、主力资金、概率、盘感去
										把握市场的机会。比较成功的经历95年2月全仓买入000035转配股到2000年2月上市卖出赚了20倍
										，2003年11月95%资金买入000638到2009年复牌上市第一天冲高时卖出赚了7倍，短线最成功的经历是2008年6月时在20天内资金翻了一
										倍，2009年赚了约一倍，2010年四倍，2011年近一倍。2011底到2014年初主要研究和投资股指期货。</div>
								</div>
							</div>
							<!-- tc_4 -->
						</div>

					</div>
					<div class="clear"></div>
				</div>
				<div class="tjs_detail_manager_right" style="margin-top: 2px;">
					<h2 class="simu_goumailiucheng">私募购买流程</h2>
					<div class="goumailiucheng_img">
						<img src="assets/img/ui2/goumailiucheng.png" alt="" />
					</div>
					<div class="liuchengxinxi">
						<ul>
							<li><span>在线预约</span><br />或拨打400-888-896</li>
							<li><span>确定意向</span><br />额度和打款时间</li>
							<li><span>完成打款</span><br />制定监管账号</li>
							<li><span>成功购买</span><br />按签署合同收取返现</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>

				<div class="layout_n clearfix">
					<div class="mod_left_wrap">
						<!-- 推荐理由 -->
						<!-- 基金收益 -->
						<div class="mod_left_item simu_side_nav_box">
							<div class="left_hd clearfix">
								<span class="txt"> </span> <span class="txt"> <em
									class="ui_titico ui_titico_6"><img src="assets/img/ui2/zoushi.jpg"
										style="margin-top: 10px;" alt="" /></em>徐翔代表作
								</span><span class="dbzuo_fc">泽熙三期</span>
							</div>
							<div class="simu_detailwrap_2 simu_detailwrap">
								<div class="sub_item">
									<div class="sub_hd f_s14">收益测算</div>
									<div class="sub_bd_1">
										<div class="tit">
											历史业绩来看，以投入一年，100万元为例 ( <span class="f_f60">赚8377400元</span> ~
											<span class="f_f60">赚8377400元</span> )
										</div>
										<table class="detail_tb_2 tjstbl" width="80%">
											<thead>
												<tr>
													<th width="20%">收益</th>
													<th width="20%">今年以来</th>
													<th width="20%">2014年</th>
													<th width="20%">2013年</th>
													<th width="20%">2012年</th>
												</tr>
											</thead>
											<tbody>
												<tr class="f_f70">
													<td>赚</td>
													<td>8377400</td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr class="f_090">
													<td>亏</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="sub_item">
									<div class="sub_hd f_s14">净值走势</div>
									<div class="sub_bd_1">
										<img src="images/zoushi.jpg" alt="Alternate Text" />
									</div>
								</div>
								<div class="sub_item">
									<div class="sub_hd clearfix">
										<div class="sub_hd_left f_s14">收益排名</div>
										<div class="sub_hd_right f_s14">净值</div>
									</div>
									<div class="sub_bd_3 clearfix">
										<div class="sub_left">
											<table class="detail_tb_2" width="100%">
												<thead>
													<tr>
														<th width="75">年度</th>
														<th width="75">期间收益</th>
														<th width="75">行业平均</th>
														<th width="75">沪深300</th>
														<th width="75">排名</th>
														<th width="*">排名区间</th>
													</tr>
												</thead>
											</table>
											<div class="detail_tb_oyb">
												<table class="detail_tb_2" width="100%">
													<tbody>
														<tr>
															<td width="75">近一月</td>
															<td width="75">70.30%</td>
															<td width="75">---</td>
															<td width="75">---</td>
															<td width="75">5/8781</td>
															<td width="*">1%</td>
														</tr>
														<tr>
															<td width="75">2015年</td>
															<td width="75">837.74%</td>
															<td width="75">---</td>
															<td width="75">35.82%</td>
															<td width="75">2/5888</td>
															<td width="*">1%</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="sub_right">
											<table class="detail_tb_2" width="100%">
												<thead>
													<tr>
														<th width="125">净值时间</th>
														<th width="125">单位净值</th>
														<th width="125">累计净值</th>
														<th width="*">增长率</th>
													</tr>
												</thead>
											</table>
											<div class="detail_tb_oyb">
												<table class="detail_tb_2" width="100%">
													<tbody>
														<tr class="even">
															<td width="125">2015.04.21</td>
															<td width="125">9.3774</td>
															<td width="125">9.3774</td>
															<td width="*">70.3%</td>
														</tr>
														<tr class="odd">
															<td width="125">2015.03.31</td>
															<td width="125">5.5064</td>
															<td width="125">5.5064</td>
															<td width="*">-0.49%</td>
														</tr>
														<tr class="even">
															<td width="125">2015.03.02</td>
															<td width="125">5.5337</td>
															<td width="125">5.5337</td>
															<td width="*">23.53%</td>
														</tr>
														<tr class="odd">
															<td width="125">2015.02.27</td>
															<td width="125">4.4796</td>
															<td width="125">4.4796</td>
															<td width="*">52.79%</td>
														</tr>
														<tr class="even">
															<td width="125">2015.01.30</td>
															<td width="125">2.9318</td>
															<td width="125">2.9318</td>
															<td width="*">193.18%</td>
														</tr>
														<tr class="odd">
															<td width="125">2015.01.12</td>
															<td width="125">1</td>
															<td width="125">1</td>
															<td width="*">0%</td>
														</tr>
														<tr class="even">
															<td width="125">2015.01.02</td>
															<td width="125">1</td>
															<td width="125">1</td>
															<td width="*">0.00%</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 基金经理、私募公司、投资理念、投研团队 -->

						<!-- 通栏结构 -->
						<div id="detail_under" class="layout_n simu_side_nav_box mg_btm">
							<!-- 旗下产品收益率	 -->
							<div class="mod_box_item">
								<div class="box_hd clearfix">
									<span class="txt"><em class="ui_titico ui_titico_9"><img
											width="35" height="35" src="assets/img/ui2/shouyiicon.png" alt="" /></em>旗下产品收益</span>
								</div>
								<div class="box_bd">
									<table class="simu_pro_tb_2" width="100%">
										<thead>
											<tr>
												<th class="c_l c_b">基金简称</th>
												<th class="c_l c_b">最新净值</th>
												<th class="c_r c_b">累计收益</th>
												<th class="c_c c_b">运行时间</th>
												<th class="c_r c_b">今年以来收益率</th>
												<th class="c_r c_b">近2年收益率</th>
												<th class="c_r c_b">近1年收益率</th>
												<th class="c_r c_b">年化收益</th>
												<th class="c_c">基金类型</th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd">
												<td class="c_l c_b"><a href="" target="_blank"
													title="好运来巨牛一号"> 好运来巨牛一号 </a></td>
												<td class="c_l c_b">9.38</td>
												<td class="c_r c_b">837.74%</td>
												<td class="c_c c_b">3月</td>
												<td class="c_r c_b">837.74%</td>
												<td class="c_r c_b">---</td>
												<td class="c_r c_b">---</td>
												<td class="c_r c_b">374.22%</td>
												<td class="c_c">股票策略</td>
											</tr>
											<tr class="even">
												<td class="c_l c_b"><a href="" target="_blank"
													title="巨牛保盈1号"> 巨牛保盈1号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">3月</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">管理期货</td>
											</tr>
											<tr class="odd">
												<td class="c_l c_b"><a href="" target="_blank"
													title="巨牛天字一号"> 巨牛天字一号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">3月</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">管理期货</td>
											</tr>
											<tr class="even">
												<td class="c_l c_b"><a href="" target="_blank"
													title="天子期货1号"> 天子期货1号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">1月</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">组合基金</td>
											</tr>
											<tr class="odd">
												<td class="c_l c_b"><a href="" target="_blank"
													title="巨牛天子国际期货1号"> 巨牛天子国际期货1号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">2月</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">组合基金</td>
											</tr>
											<tr class="even">
												<td class="c_l c_b"><a href="" target="_blank"
													title="巨牛天子港股一号"> 巨牛天子港股一号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">---</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">股票策略</td>
											</tr>
											<tr class="odd">
												<td class="c_l c_b"><a href="" target="_blank"
													title="巨牛华南一号"> 巨牛华南一号 </a></td>
												<td class="c_l c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_c c_b">1月</td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b"></td>
												<td class="c_r c_b">%</td>
												<td class="c_c">股票策略</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- hot product-->
						</div>
					</div>
				</div>
			</div>

			<div class="clear"></div>
			<!-- container end -->


			<%@ include file="/views/web/footer.jsp"%>
		</div>

		<!-- /home_all -->
		<script>
			//切换经理，公司
		    window.onload = function () {
		        $(".tab_control_item").each(function (index) {
		            $(this).click(function () {
		                $(".tab_control_item").removeClass("active");
		                $(this).addClass("active");
		                $(".tab_mgr_wrap").hide();
		                $(".tab_mgr_wrap:eq(" + index + ")").show();
		            });
		        });
		    }
		    //--预约--
		    function alertbox() {
		        alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
		    }
		    //--/预约--
        
    </script>
</body>
</html>




















