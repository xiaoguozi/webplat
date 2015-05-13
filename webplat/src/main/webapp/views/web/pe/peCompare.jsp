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
						<li><a href="rest/web/pe/peIndexRate"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="" class="path_item">私募</a><span
					class="sep">&gt;</span> <a href="" class="path_item">私募产品</a> <span
					class="sep">&gt;</span> <span class="txt">私募产品对比</span>
			</div>
		</div>

		<!-- 私募对比 -->
		<div class="tjs_1108px center">
			<div class="ml0" style="height: 145px;">
				<div class="tjs_right_titlediv fontcolor">
					<img class="tjs_img_diamond" src="assets/img/ui2/comparing.png" />私募产品对比
				</div>
				<div class="tjs_coloreddiv ml0 bgcolor"></div>
				<div class="tjs_compare_box">
					金手指一号 <img width="25" height="25" class="tjs_compare_cl"
						src="assets/img/ui2/close_compare.png" alt="" />
				</div>
				<div class="tjs_compare_box">
					金手指一号 <img width="25" height="25" class="tjs_compare_cl"
						src="assets/img/ui2/close_compare.png" alt="" />
				</div>
				<div class="tjs_compare_box">
					<span>你可以继续添加</span><img width="25" height="25"
						class="tjs_compare_cl" src="assets/img/ui2/compare_add.png" alt="" />
				</div>
				<div class="go_compare_product">
					<a class="uc_btn duibi_btn" href="#">对&nbsp;&nbsp;比</a><br />
					<span>*最多对比三个</span>
				</div>
			</div>
			<div class="mod_left_item simu_side_nav_box">
				<div class="left_hd clearfix">
					<span class="txt"> <em class="ui_titico ui_titico_6"><img
							src="assets/img/ui2/zoushi.jpg" style="margin-top: 10px;" alt="" /></em>收益大比拼
					</span>
				</div>
				<div class="simu_detailwrap_2 simu_detailwrap">
					<div class="sub_item">
						<div class="sub_hd">历史收益对比</div>
						<div class="sub_bd_1">
							<table class="detail_tb_2 tjstbl" style="margin-top: 30px;"
								width="80%">
								<thead>
									<tr>
										<td width="14.23%"></td>
										<td width="14.23%">今年以来</td>
										<td width="14.23%">年化收益</td>
										<td width="14.23%">2015年</td>
										<td width="14.23%">2014年</td>
										<td width="14.23%">2013年</td>
										<td width="14.23%">2012年</td>
									</tr>
								</thead>
								<tbody>
									<tr class="f_f60">
										<td class="f_090">金手指一号</td>
										<td>8377400</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="f_f60">
										<td class="f_090">金手指二号</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="f_f60">
										<td class="f_090"></td>
										<td></td>
										<td></td>
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
						<div class="sub_hd">净值走势对比</div>
						<div class="sub_bd_1">
							<img src="images/zoushi.jpg" alt="Alternate Text" />
						</div>
					</div>
				</div>
				<div class="left_hd clearfix border_color_blue">
					<span class="txt txtcolor"> <em
						class="ui_titico ui_titico_6"><img src="assets/img/ui2/stact.png"
							alt="" /></em>私募全面对比
					</span>
				</div>
				<table class="tjs_tbl_compare_all">
					<thead>
						<tr>
							<td></td>
							<td class="tdbgcolor pos_r"><span
								class="product_title_color">金手指一号</span><img width="30"
								height="30" class="tjs_compare_cl" style="top: 10px"
								src="assets/img/ui2/close_compare.png" alt="" /></td>
							<td class="pos_r"><span class="product_title_color">金手指二号</span><img
								width="30" height="30" class="tjs_compare_cl" style="top: 10px"
								src="assets/img/ui2/close_compare.png" alt="" /></td>
							<td class="tdbgcolor pos_r"><span
								class="product_addtitle_color">你还可以继续添加</span><img width="30"
								height="30" class="tjs_compare_cl" style="top: 10px;"
								src="assets/img/ui2/compare_add.png" alt="" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tjs_tbl_compare_all_tb1 txt_align_left"><b
								class="bfont_color">基金净值</b></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">最新净值:</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">累计净值:</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">运行时长:</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><b class="bfont_color">基金费用</b></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="txt_align_left"><b class="bfont_color">基金风险</b></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">基金类型：</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><b class="bfont_color">基金经理</b></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">基金经理：</span></td>
							<td class="tdbgcolor txt_fcolor">郭建军</td>
							<td class="txt_fcolor">郭建军</td>
							<td class="tdbgcolor txt_fcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">管理产品数：</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">产品赢利占比：</span></td>
							<td class="tdbgcolor"></td>
							<td></td>
							<td class="tdbgcolor"></td>
						</tr>
						<tr>
							<td class="txt_align_left"><span class="sfont_color">所在公司：</span></td>
							<td class="tdbgcolor txt_zcolor">柯林资产</td>
							<td class="txt_zcolor">柯林资产</td>
							<td class="tdbgcolor txt_zcolor"></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

		<div class="clear"></div>


		<%@ include file="/views/web/footer.jsp"%>
	</div>

	<!-- /home_all -->
	<script>
		
        
    </script>




</body>
</html>




















