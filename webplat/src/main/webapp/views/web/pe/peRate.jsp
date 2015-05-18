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
						<li><a href="rest/web/pe/peIndexRate"><span class="simu_on">私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="#" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item">私募</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndexRate" class="path_item">私募排行</a> <span class="sep">&gt;</span> <span class="txt">筛选条件</span> </div>
        </div>
		
		
		<!-- container -->
        <div class="simu_pro_container">
            <!-- hot product-->
            <div class="layout_n">
                <div class="mod_box_item simu_mainprolist_box">
                    <div class="tjs_right_titlediv fcolor">
                        <img class="tjs_img_diamond" style="top: 10px;" src="assets/img/ui2/all.png" />私募分类排行 </div>
                    <div class="simuchanpin_liebiao">
                        <div class="simu_mainprolist_mult clearfix">
                            <div class="mult_item">
                                <div class="mult_name">年度收益排名</div>
                                <div class="mult_con">
                                    <a href="" class="mult_lk">不限</a> <a class="mult_lk mult_checked" href="">今年</a> <a class="mult_lk" href="">2014</a> <a class="mult_lk" href="">2013</a> <a class="mult_lk" href="">2012</a> <a class="mult_lk" href="">2011</a> <a class="mult_lk" href="">2010</a> <a class="mult_lk" href="">2009</a>  <a class="mult_lk" href="">2008</a>  <a class="mult_lk" href="">2007</a>  <a class="mult_lk" href="">2006</a>
                                </div>
                            </div>
                            <div class="mult_item">
                                <div class="mult_name">中长期业绩排名</div>
                                <div class="mult_con">
                                    <a href="" class="mult_lk mult_checked">不限</a> <a class="mult_lk" href="">最近一年</a><a class="mult_lk" href="">最近两年</a>
                                </div>
                            </div>
                            <div class="mult_item">
                                <div class="mult_name">短期业绩排名</div>
                                <div class="mult_con">
                                    <a href="" class="mult_lk mult_checked">不限</a> <a class="mult_lk" href="">近一个月</a><a class="mult_lk" href="">近三个月</a><a class="mult_lk" href="">近六个月</a>
                                </div>
                            </div>
                            <div class="mult_item">
                                <div class="mult_name">按基金类型排名</div>
                                <div class="mult_con"><a class="mult_lk mult_checked" href="">不限</a> <a class="mult_lk" href="">股票策略</a> <a href="#" class="mult_more"></a></div>
                            </div>
                            <div class="mult_item mult_item_search">
                                <div class="mult_name">关&nbsp;&nbsp;键&nbsp;&nbsp;词：</div>
                                <div class="mult_con">
                                    <div class="uc_boxhd_search skin_1">
                                        <input class="input_txt" id="simu_product_list_search_input" style="border-right: none;" type="text">
                                        <a id="simu_product_list_search" href="" data-href="" class="input_search"></a>
                                    </div>
                                    <div class="fast_search"><a target="_blank" href="">泽熙3期</a> <a target="_blank" href="">清水源1号</a> <a target="_blank" href="">淡水泉成长一期</a> </div>
                                </div>
                            </div>
                            <div class="mult_item mult_item_checked">
                                <div class="mult_name">已选条件：</div>
                                <div class="mult_con">
                                    <a class="select_data" href="#">今年<span>×</span></a> <a class="clrar_condition" href="#">清空条件</a><span class="checked_info">共 <em class="num">8744</em> 款产品满足条件</span>
                                    <label class="checked_condition">
                                        在售&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="input_check" checked="checked" type="checkbox">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="simu_mainprolist_result">
                            <table class="simu_pro_tb_2 tjs_simu_tbl" width="100%">
                                <thead>
                                    <tr>
                                        <td class="tjs_tbl_td_brm">对比</td>
                                        <td class="tjs_tbl_td_brm">排行</td>
                                        <td class="tjs_tbl_td_bm">基金简称</td>
                                        <td class="tjs_tbl_td_bm">基金经理</td>
                                        <td class="tjs_tbl_td_bm">基金公司</td>
                                        <td class="tjs_tbl_td_brm">基金类型</td>
                                        <td class="tjs_tbl_td_bm">最新净值</td>
                                        <td class="tjs_tbl_td_bm">累计收益</td>
                                        <td class="tjs_tbl_td_bm">今年收益</td>
                                        <td class="tjs_tbl_td_bm">近一年</td>
                                        <td class="tjs_tbl_td_bm">近二年</td>
                                        <td class="tjs_tbl_td_brm">净值走势</td>
                                        <td class="tjs_tbl_td_bm">预约</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd">
                                        <td class="c_c c_b c_first_control">
                                            <div class="lb_wrap">
                                                <span class="lb_b"></span>
                                                <input class="tb_chk" type="checkbox">
                                            </div>
                                        </td>
                                        <td class="tjs_tbl_td_br"><span class="orangecolor">1</span></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br">
                                            <div class="trend_viewer">
                                                <div class="trend_viewer_hd"><a href="" title="点击查看详情"><em class="uc_trend"></em></a></div>
                                                <div class="details_show">
                                                    <em class="left_icon"></em>
                                                    <div class="details_boxes">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="c_c"><a class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td class="c_c c_b c_first_control">
                                            <div class="lb_wrap">
                                                <span class="lb_b"></span>
                                                <input class="tb_chk" type="checkbox">
                                            </div>
                                        </td>
                                        <td class="tjs_tbl_td_br"><span class="orangecolor">2</span></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br">
                                            <div class="trend_viewer">
                                                <div class="trend_viewer_hd"><a href="" title="点击查看详情"><em class="uc_trend"></em></a></div>
                                                <div class="details_show">
                                                    <em class="left_icon"></em>
                                                    <div class="details_boxes">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="c_c"><a class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td class="c_c c_b c_first_control">
                                            <div class="lb_wrap">
                                                <span class="lb_b"></span>
                                                <input class="tb_chk" type="checkbox">
                                            </div>
                                        </td>
                                        <td class="tjs_tbl_td_br"><span class="orangecolor">3</span></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br">
                                            <div class="trend_viewer">
                                                <div class="trend_viewer_hd"><a href="" title="点击查看详情"><em class="uc_trend"></em></a></div>
                                                <div class="details_show">
                                                    <em class="left_icon"></em>
                                                    <div class="details_boxes">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="c_c"><a class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td class="c_c c_b c_first_control">
                                            <div class="lb_wrap">
                                                <span class="lb_b"></span>
                                                <input class="tb_chk" type="checkbox">
                                            </div>
                                        </td>
                                        <td class="tjs_tbl_td_br"><span class="graycolor">4</span></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="tjs_tbl_td_br">
                                            <div class="trend_viewer">
                                                <div class="trend_viewer_hd"><a href="" title="点击查看详情"><em class="uc_trend"></em></a></div>
                                                <div class="details_show">
                                                    <em class="left_icon"></em>
                                                    <div class="details_boxes">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="c_c"><a class="tb_btn tb_btn_primary simu_reserve_btn" href="">预约</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="13" class="foot_page"><a href="#"><em>|</em><</a><a class="pagingnum" href="#"><</a><a class="pagingnum page_on" href="#">1</a><a class="pagingnum" href="#">2</a><a class="pagingnum" href="#">></a><a href="#">><em>|</em></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- 产品对比 -->
        <div class="simu_compare_container">
            <div class="compare_container">
                <div class="compare_container_title">
                    <h3 class="compare_products">产品对比栏</h3>
                    <div class="close_compare">
                        <img src="assets/img/ui2/close_compareicon.png" alt="" />隐藏</div>
                </div>
                <div class="compare_container_contents">
                    <img class="del_compare" src="assets/img/ui2/close_compare.png" alt="" />
                    <div class="clear"></div>
                    <p>金手指三号</p>
                    <p>累计收益</p>
                    <p class="tjs_products_title">1920.<span>55%</span></p>
                </div>
                <div class="compare_container_contents">
                    <img class="del_compare" src="assets/img/ui2/close_compare.png" alt="" />
                    <div class="clear"></div>
                    <p>金手指三号</p>
                    <p>累计收益</p>
                    <p class="tjs_products_title">1920.<span>55%</span></p>
                </div>
                <div class="compare_container_contents">
                    <p class="moren_font">你还可以继续添加</p>
                </div>
                <div class="tjs_comparing">
                    <a class="uc_btn compare_btn" href="rest/web/pe/peIndexCompare">对&nbsp;&nbsp;&nbsp;&nbsp;比</a>
                    <a id="clear_duibi" class="uc_btn compare_btn">清空对比栏</a>
                </div>
            </div>
        </div>
        <!-- 产品对比 end -->
        <div class="clear"></div>
        <!-- container end -->
		
		
		<%@ include file="/views/web/footer.jsp"%>
	</div>
	
	<!-- /home_all -->
	<script>
		window.onload = function () {
	        //--对比框--
	        var sum = 0;
	        $(".close_compare").click(function () {
	            $(".simu_compare_container").hide();
	        })
	        $("#clear_duibi").click(function () {
	            $(".tb_chk").removeAttr("checked");
	            $(".simu_compare_container").hide();
	            sum = 0;
	        });
	
	        $(".tb_chk").each(function (index) {
	            $(".tb_chk").removeAttr("checked");
	            $(this).click(function () {
	                if ($(this).is(':checked')) {
	                    sum += 1;
	                } else {
	                    sum -= 1;
	                }
	                if (sum > 3) {
	                    sum = 3;
	                    $(this).removeAttr("checked");
	                    alert("最多只能选三个进行对比！")
	                }
	                sum > 0 ? $(".simu_compare_container").show() : $(".simu_compare_container").hide();
	            });
	        });
	        $(".del_compare").each(function (index) {
	            $(this).click(function () {
	                $(".compare_container_contents:eq(" + index + ")").html(" <p class='moren_font'>你还可以继续添加</p>");
	            });
	        })
	        //--对比框--
	        //--详情框--
	        $(".trend_viewer").each(function (index) {
	            $(this).hover(function () {
	                $(".details_show:eq(" + index + ")").show();
	            }, function () {
	                $(".details_show:eq(" + index + ")").hide();
	            });
	        });
	        //--详情框--
	    }
        
    </script>


    

</body>
</html>




















