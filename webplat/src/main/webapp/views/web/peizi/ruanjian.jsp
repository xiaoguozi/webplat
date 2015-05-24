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
	<title>淘金山-配资首页</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
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
                        <li><a href="rest/web/peizi/index"><span>首页</span></a></li>
                        <li><a href="rest/web/peizi/activity"><span>淘金活动</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <li><a href="rest/web/peizi/raise"><span>淘金募集</span></a></li>
                        <li><a href="rest/web/peizi/self"><span>淘金自营</span></a></li>
                        <li><a href="rest/web/peizi/personalCenter"><span>个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span class="simu_on">交易软件下载</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">交易软件下载</span> </div>
        </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="pz_produce">
				<img src="assets/img/peizi/ruanjian.png" alt=""><b>股票交易软件下载</b>
			</div>            
            <div class="bgcolor">
                <div class="jybox" style="width: 488px;">
                    <img src="assets/img/peizi/rjlogo.jpg" alt="" />
                    <ul class="czimg">
                        <li><a href="#" style="color:#474747"><img class="dnxz" src="assets/img/peizi/down.png" width="106" alt="" /><br />电脑下载</a></li>
                        <li><img src="assets/img/peizi/iPhone.png" width="106" alt="" /><br />iPhone版下载</li>
                        <li style="padding-right:0px;"><img src="assets/img/peizi/Android.png" width="106" alt="" /><br />Android版下载</li>
                    </ul>
                </div>
                <div class="jybox_right">
                    <h1 class="color158">HOMS交易软件</h1>
                    <p class="font_box">恒生电子（股票交易代码：600570）是中国最专业的证券交易系统服务商，其系统与各大证券公司进行了无缝对接。 2014年04月04日马云33亿入主恒生电子扩张金融版图， 增财易与恒生电子股份有限公司强强联合，为客户提供更加专业、高效、安全的投资管理服务。增财易的客户可通过下载恒生电子提供的客户端进行股票交易，交易单子通过恒生电子交易系统实时进入合作券商在市场上成交。</p>
                </div>
            </div>
        </div>
        <hr class="pc"/>
    </div>
    
<!-- 配资页尾 -->
<footer>
<div class="footer_bg">
	<div class="tjs_1108px center">
		<div class="foot_menu">
			<p class="menu_title">关于我们</p>
			<ul class="foot_menu1">
				<li><a href="">><span>公司简介</span></a></li>
				<li><a href="">><span>股东背景</span></a></li>
				<li><a href="">><span>媒体报道</span></a></li>
				<li><a href="">><span>最新动态</span></a></li>
			</ul>
		</div>
		<div class="foot_menu">
			<p class="menu_title">帮助中心</p>
			<ul class="foot_menu1">
				<li><a href="">><span>新手入门</span></a></li>
				<li><a href="">><span>理财问答</span></a></li>
				<li><a href="">><span>试用帮助</span></a></li>
			</ul>
		</div>
		<div class="foot_menu">
			<p class="menu_title">关注我们</p>
			<ul class="foot_menu1">
				<img src="assets/img/peizi/aboutimg.png" alt=""/>
			</ul>
		</div>
		<div class="foot_about_box">
			<ul class="about_box1">
				<li><img class="addr_home" src="assets/img/peizi/home.png" alt=""></li><li><span>联系地址</span></li><li class="w217">深圳文化创意园A座605，地铁坐到益田站D出口，直行大约500米。</li>
			</ul>
			<ul class="about_box1">
				<li><img class="addr_home" src="assets/img/peizi/phone.png" alt=""></li><li><span>热线电话</span></li><li class="w217 lh40">4006-114-088</li>
			</ul>
			<ul class="about_box1">
				<li><img class="addr_home qq" src="assets/img/peizi/qq.png" alt=""></li><li><span class="zx">在线咨询</span></li><li class="w217 lh40">08:00-23:00</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="footers">
	<p class="pt25">投资有风险，理财需谨慎</p>
	<p>淘金山互联网在线理财 版权所有 © 2015-2018 粤ICP备 15026551号-1</p>
</div>
</footer>
<!-- 配资页尾 结束 -->
<script type="text/javascript">
    $(document).ready(function () {
        $(".dnxz").hover(function () {
            $(this).attr("src", "assets/img/peizi/down1.png");
        }, function () {
            $(this).attr("src", "assets/img/peizi/down.png");
        });
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