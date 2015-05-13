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
						<li><a href="rest/web/pe/peIndexProduct"><span>私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexRate"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span
								class="simu_on">私募经理</span></a></li>
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
					class="sep">&gt;</span> <a href="" class="path_item">私募经理</a> <span
					class="sep">&gt;</span> <span class="txt">全部私募经理</span>
			</div>
		</div>


		<!-- container -->

		<div class="tjs_1108px center">
			<div class="ml0" style="min-height: 300px;">
				<div class="tjs_right_titlediv fontcolor fontxuncolor">
					<img class="tjs_img_diamond" src="assets/img/ui2/xun.png" />明细私募经理
				</div>
				<div class="tjs_coloreddiv ml0 bgxuncolor"></div>
				<table class="simujingli_box">
					<tr>
						<td colspan="2" class="simujingli_box_top bluecolor_font"><a
							href="rest/web/pe/peIndexMDetail">罗林正</a>&nbsp;&nbsp;泽熙二期</td>
					</tr>
					<tr>
						<td class="font_tc pd_bottom"><img width="105"
							src="assets/img/ui/user01.png" alt="" /></td>
						<td class="pd_left pd_bottom"><p>
								基金经理：<span class="bluecolor_font">罗林正</span>
							</p>
							<p>
								代&nbsp;表&nbsp;作：<span class="bluecolor_font">泽熙二期</span>
							</p>
							<p>
								累计收益<br />
								<span class="num_big">486.</span><span class="small small_color">67%</span>
							</p></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="br_top jingli_miaoxu">
								<img style="vertical-align: middle" src="assets/img/ui2/dianping.png"
									alt="" />&nbsp;私募一哥，风格犀利，踩点精准，业绩遥遥领先!
							</div>
						</td>
					</tr>
				</table>
				<table class="simujingli_box">
					<tr>
						<td colspan="2" class="simujingli_box_top bluecolor_font">罗林正&nbsp;&nbsp;泽熙二期</td>
					</tr>
					<tr>
						<td class="font_tc pd_bottom"><img width="105"
							src="assets/img/ui/user01.png" alt="" /></td>
						<td class="pd_left pd_bottom"><p>
								基金经理：<span class="bluecolor_font">罗林正</span>
							</p>
							<p>
								代&nbsp;表&nbsp;作：<span class="bluecolor_font">泽熙二期</span>
							</p>
							<p>
								累计收益<br />
								<span class="num_big">486.</span><span class="small small_color">67%</span>
							</p></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="br_top jingli_miaoxu">
								<img style="vertical-align: middle" src="assets/img/ui2/dianping.png"
									alt="" />&nbsp;私募一哥，风格犀利，踩点精准，业绩遥遥领先!
							</div>
						</td>
					</tr>
				</table>
				<table class="simujingli_box br_right">
					<tr>
						<td colspan="2" class="simujingli_box_top bluecolor_font">罗林正&nbsp;&nbsp;泽熙二期</td>
					</tr>
					<tr>
						<td class="font_tc pd_bottom"><img width="105"
							src="assets/img/ui/user01.png" alt="" /></td>
						<td class="pd_left pd_bottom"><p>
								基金经理：<span class="bluecolor_font">罗林正</span>
							</p>
							<p>
								代&nbsp;表&nbsp;作：<span class="bluecolor_font">泽熙二期</span>
							</p>
							<p>
								累计收益<br />
								<span class="num_big">486.</span><span class="small small_color">67%</span>
							</p></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="br_top jingli_miaoxu">
								<img style="vertical-align: middle" src="assets/img/ui2/dianping.png"
									alt="" />&nbsp;私募一哥，风格犀利，踩点精准，业绩遥遥领先!
							</div>
						</td>
					</tr>
				</table>
				<div class="clear"></div>
				<div class="tjs_right_titlediv fcolor">
					<img class="tjs_img_diamond" style="top: 10px;"
						src="assets/img/ui2/all.png" />全部私募经理<span
						style="position: absolute; top: 13px"><input
						class="input_txt1" type="text" /><a class="input_btn1" href=""><img
							src="assets/img/ui/searchbig.png" alt="" /></a></span>
				</div>
				<div class="simuchanpin_liebiao"></div>
				<table class="simu_pro_tb_2 tjs_simu_tbl font_color mg_bottom"
					width="100%">
					<thead>
						<tr>
							<td class="tjs_tbl_td_brm">基金经理</td>
							<td class="tjs_tbl_td_bm td_width">代表作品</td>
							<td class="tjs_tbl_td_brm"><a class="uc_sort"
								href="javascript:void(0)">累计收益<em></em></a></td>
							<td class="tjs_tbl_td_bm td_width">私募公司</td>
							<td class="tjs_tbl_td_bm"><a class="uc_sort"
								href="javascript:void(0)">在售产品数<em></em></a></td>
							<td class="tjs_tbl_td_bm">从业年限</td>
							<td class="tjs_tbl_td_brm">从业背景</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tjs_tbl_td_br"><span class="bluecolor_font">徐翔</span></td>
							<td>金手指一号</td>
							<td class="tjs_tbl_td_br">534.88%</td>
							<td>泽熙投资</td>
							<td>5</td>
							<td>---</td>
							<td>劵商</td>
						</tr>
						<tr>
							<td class="tjs_tbl_td_br"><span class="bluecolor_font">徐翔</span></td>
							<td>金手指一号</td>
							<td class="tjs_tbl_td_br">534.88%</td>
							<td>泽熙投资</td>
							<td>5</td>
							<td>---</td>
							<td>劵商</td>
						</tr>
						<tr>
							<td class="tjs_tbl_td_br"><span class="bluecolor_font">徐翔</span></td>
							<td>金手指一号</td>
							<td class="tjs_tbl_td_br">534.88%</td>
							<td>泽熙投资</td>
							<td>5</td>
							<td>---</td>
							<td>劵商</td>
						</tr>
						<tr>
							<td colspan="13" class="foot_page"><a href="#"><em>|</em><</a><a
								class="pagingnum" href="#"><</a><a class="pagingnum page_on"
								href="#">1</a><a class="pagingnum" href="#">2</a><a
								class="pagingnum" href="#">></a><a href="#">><em>|</em></a></td>
						</tr>

					</tbody>
				</table>

			</div>

		</div>

		<div class="clear"></div>
		<!-- container end -->


		<%@ include file="/views/web/footer.jsp"%>
	</div>

	<!-- /home_all -->
	<script>
		window.onload = function () {
	        //--排行图标--
	        $(".uc_sort").each(function (index) {
	            $(".uc_sort>em").addClass("sort_desc");
	            $(this).click(function () {
	                var s = $(".uc_sort>em:eq(" + index + ")").hasClass("sort_desc");
	                $(".uc_sort>em").removeClass("sort_d sort_u");
	                $(".uc_sort>em").addClass("sort_desc");
	                if (s) {
	                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_desc sort_u");
	                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
	                } else {
	                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_d");
	                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
	                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
	                }
	            });
	
	        })
	        //--/排行图标--
	    }
        
    </script>




</body>
</html>




















