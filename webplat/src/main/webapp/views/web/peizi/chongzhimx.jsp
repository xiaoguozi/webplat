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
	<title>淘金山-跟我淘金山</title>
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />
	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />
	
	<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
	<script type="text/javascript" src="assets/scripts/slide.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
	<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="home_all">
       <%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="http://www.taojinshan.com.cn">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                        <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li><a href="rest/web/peizi/activity"><span>淘金活动</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                        <li><span class="simu_on">个人中心</span></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                    <li><a href="rest/web/peizi/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/lowCapital">低息配</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
        </div>
    <div class="w100bg">
        <hr class="pc"/>
        <div class="tjs_1108px center">
            <div class="bgcolor">
                <div class="mycenter_left">
                    <ul class="mc_lbox">
                        <li>可用余额</li>
                        <li class="colorf06 font18 lh10 ">0.00元</li>
                        <li><a class="tjs_btn pzbtn" href="chongzhi.html"><b>¥</b> 充值</a></li>
                        <li class="wypz">我的配资</li>
                        <div class="ttp wypz_div">
                            <span class="bor_dashed"><a href="zhongxin.html">天天配</a></span>
                            <span class="bor_dashed"><a href="yyzhongxin.html">月月配</a></span>
                            <span><a href="dxzhongxin.html">低息配</a></span>
                        </div>
                        <li class="wdzj">我的资金</li>
                        <div class="bor_dashed moneymx"><a href="zijinmx.html">资金明细</a></div>
                    </ul>
                </div>
                <script>
                    $(function () {
                        $(".wypz").click(function () {
                            $(".ttp").slideToggle(500);
                        });
                        $(".wdzj").click(function () {
                            $(".moneymx").slideToggle(300);
                        });
                    })
                </script>
            <div class="mycenter_right">
                <b class="my_tit">资产总览</b>
                <table class="my_tbl1">
                    <thead>
                    <tr>
                        <td>账户总资产<span>(元)</span></td>
                        <td>配资金额<span>(元)</span></td>
                        <td>投资本金<span>(元)</span></td>
                        <td>账户余额<span>(元)</span></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="colorf06">0.00</td>
                        <td>0.00</td>
                        <td>0.00</td>
                        <td style="border:none;">0.00</td>
                    </tr>
                    </tbody>
                </table>
                <b class="my_tit tit1 c333"><a href="zijinmx.html">总资金明细</a> | <a class="on" href="chongzhimx.html">充值提款</a> | <a href="peizimx.html">配资明细</a> | <a href="liximx.html">利息明细</a></b>
                <div class="zijinbox">
                    <table width="80%">
                        <tr>
                            <td>
                                <select class="slt1" id="Select1">
                                    <option>全部明细</option>
                                    <option>配资支出</option>
                                    <option>配资撤回</option>
                                    <option>配资回款</option>
                                </select>
                            </td>
                            <td>
                                <input class="laydate-icon" onClick="laydate()" type="text" />-<input class="laydate-icon" onClick="laydate()" type="text" /></td>
                            <td><a class="tjs_btn" style="width:80px;height:30px;line-height:30px;" href="#">查询</a></td>
                        </tr>
                    </table>
                    <p class="gjsum">共计 <span class="colorf06">收入</span>：0笔 共0.00元 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="color158">支出</span>：0笔 共：0.00元</p>
                    <table class="my_tbl3">
                        <thead>
                            <tr>
                                <td>时间</td>
                                <td>类型</td>
                                <td>收入</td>
                                <td>支出</td>
                                <td>余额</td>
                                <td>详情</td>
                            </tr>
                       </thead>

                        <tbody>   
                            <tr>
                                <td class="font18 t-center colorf06" colspan="6">
                                    暂无记录
                                </td>
                            </tr>                             
                            <!--<tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>-->
                        </tbody>
                    </table>
                </div>
            </div>

            </div>
        </div>
        <hr class="pc"/>
    </div>
<!-- 配资页尾 -->
<%@ include file="/views/web/footer.jsp"%>
<!-- 配资页尾 结束 -->
<script type="text/javascript">
    $(document).ready(function () {
        /*-二级导航-*/
        $(".tjpz").hover(function () {
            $(".nav_menu").show();
            $(".tjpz>a>span").addClass("tspan");
        }, function () {
            $(".nav_menu").hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
        $(".nav_menu").hover(function () {
            $(this).show();
            $(".tjpz>a>span").addClass("tspan");
        });
        $(".nav_menu").mouseleave(function () {
            $(this).hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
        
	/*--QQ咨询--*/
		$(".about_box1:eq(2)").hover(function (){
			$(".qq").attr("src","assets/img/peizi/qqhove.png");
			$(".zx").css("color","#1682CA");
		},function(){
			$(".qq").attr("src","assets/img/peizi/qq.png");
			$(".zx").css("color","#8c969d");
		})
	/*--/QQ咨询--*/
	    
	})
</script>
</body>
</html>