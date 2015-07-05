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
                    <a href="">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                        <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span class="simu_on">淘金配资</span></a></li>
                        <!-- 
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                         -->
                        <li><a href="rest/web/peizi/usercenter/mfp"><span>个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                	<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
					<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
					<li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>                    
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/userCenter/index" class="path_item">个人中心</a> <span class="sep">&gt;</span> <span class="txt">淘金详情</span> </div>
        </div>
        <div class="w100bg">
            <div class="tjs_1108px center">
               <div style="background-color: #FFF; width: 1108px; height: 500px; ">
               		<div style="background-color: #FFF;  width: 1048px; height: 30px; margin-right:30px; margin-left: 30px; ">
               		
               		</div>
               		<div style="background-color: #F8FFEB;  width: 1048px; height: 150px; margin-right:30px; margin-left: 30px; padding-top:10px; border: #F8F9F1 solid 1px;">
               				<div style="width: 1048px; height:30px;"></div>
               				<div style="width: 1048px; height:40px;">
               					<span style="margin-left: 423px;"><img src="assets/img/zhifu/pay_done.png" align="middle"/><span> 您已成功充值￥<span style="color: red; font-size: 17pt;">${amount}</span>&nbsp;元</span></span>
               				</div>
               				<div style="width: 1048px; height:30px;">
               					<span style="margin-left: 459px;">账户余额：<span style="color: green;">${totalAmount}</span>&nbsp;元</span>
               				</div>
               				<div style="width: 1048px; height:30px; text-align: center;">
               					<span>
               						  您可能需要 &nbsp;<a href="rest/web/userCenter/zhifu/enterCur">继续充值</a>&nbsp;|&nbsp;<a href="rest/web/userCenter/zhifu/rechargeHistory">查看充值记录</a>&nbsp;|&nbsp;<a href="" style="cursor: pointer;">返回淘金山首页</a>
               					</span>
               				</div>
               		</div>
               </div>
        </div>
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
            $(".about_box1:eq(2)").hover(function () {
                $(".qq").attr("src", "assets/img/peizi/qqhove.png");
                $(".zx").css("color", "#1682CA");
            }, function () {
                $(".qq").attr("src", "assets/img/peizi/qq.png");
                $(".zx").css("color", "#8c969d");
            })
            /*--/QQ咨询--*/
        })
    </script>
</body>
</html>
