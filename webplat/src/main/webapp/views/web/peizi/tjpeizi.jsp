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
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span class="simu_on">淘金配资</span></a></li>
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                        <li><span>个人中心</span></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">淘金配资</span> </div>
        </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="pz_produce">
				<img src="assets/img/peizi/pro_ico.png" alt=""><b>配资产品</b>
			</div>
            <div class="bgcolor" style="position:relative;display:block;height:400px; overflow:inherit">
            <div class="pro_box ml0 bbn  top20">
				<h1 class="pro_title">天天配</h1>
				<p class="wbl pt20"><b class="colorf06">10000</b>元起配，日息低至 <span class="colorf06"><b class="fsize">0.1</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">2~30天</span>任意配</p>
				<p class="w230">最高<span class="colorf06"> 5倍 </span>杠杆，最高可配<span class="colorf06"> 500万</span></p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/dayCapital">我要配资</a>
			</div>
			<div class="pro_box bbn  top20" style="left:349px;">
				<h1 class="pro_title">月月配</h1>
				<p class="wbl pt20"><b class="colorf06">20000</b>元起配，日息低至 <span class="colorf06"><b class="fsize">1.25</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">1~6个月</span>配资时长</p>
				<p class="w230">最高<span class="colorf06"> 5倍 </span>杠杆，最高可配<span class="colorf06"> 500万</span></p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/monthCapital">我要配资</a>
			</div>
			<div class="pro_box bbn  top20" style="left:728px;">
				<h1 class="pro_title">低息配</h1>
				<p class="wbl pt20"><b class="colorf06">20000</b>元起配，日息低至 <span class="colorf06"><b class="fsize">0.69</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">3个月</span>起配</p>
				<p class="w230">最高<span class="colorf06"> 1倍 </span>杠杆，风险超低</p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/lowCapital">我要配资</a>
			</div>
            </div>
            <div class="pz_produce bdcolor">
				<img src="assets/img/peizi/cpnengshou.png" alt=""><b>操盘达人</b>
			</div>
            <table class="cptbl">
                <thead>
                    <tr>
                        <td>用户</td>
                        <td>操盘资金</td>
                        <td>风险保证金</td>
                        <td>赚取利润</td>
                        <td>盈利率</td>
                        <td>结束时间</td>
                    </tr>
                </thead>
                </table>
            <div class="txtMarquee-top">
			<div class="bd">
				<ul class="infoList">
					<li><span class="txt_left w185"><img class="people" src="assets/img/peizi/people.png" alt="" />x**</span>
                        <span class="txt_left w185"><b class="colorf06">0.24万</b></span>
                        <span class="txt_left w185">400.00元</span>
                        <span class="txt_left w185">64.47元</span>
                        <span class="txt_left1 w185"><b class="colorf06">3.00%</b></span>
                        <span class="t-center lh11">2015-04-15</span>
                        <div class="clear"></div>
					</li>
					<li><span class="txt_left w185"><img class="people" src="assets/img/peizi/people.png" alt="" />x**</span>
                        <span class="txt_left w185"><b class="colorf06">0.24万</b></span>
                        <span class="txt_left w185">400.00元</span>
                        <span class="txt_left w185">64.47元</span>
                        <span class="txt_left1 w185"><b class="colorf06">3.00%</b></span>
                        <span class="t-center lh11">2015-04-15</span>
                        <div class="clear"></div>
					</li>
					<li><span class="txt_left w185"><img class="people" src="assets/img/peizi/people.png" alt="" />x**</span>
                        <span class="txt_left w185"><b class="colorf06">0.24万</b></span>
                        <span class="txt_left w185">400.00元</span>
                        <span class="txt_left w185">64.47元</span>
                        <span class="txt_left1 w185"><b class="colorf06">3.00%</b></span>
                        <span class="t-center lh11">2015-04-15</span>
                        <div class="clear"></div>
					</li>
					<li><span class="txt_left w185"><img class="people" src="assets/img/peizi/people.png" alt="" />x**</span>
                        <span class="txt_left w185"><b class="colorf06">0.24万</b></span>
                        <span class="txt_left w185">400.00元</span>
                        <span class="txt_left w185">64.47元</span>
                        <span class="txt_left1 w185"><b class="colorf06">3.00%</b></span>
                        <span class="t-center lh11">2015-04-15</span>
                        <div class="clear"></div>
					</li>
                    <li style="display:none"></li>
				</ul>
			</div>
		    </div>
            <script type="text/javascript">
                jQuery(".txtMarquee-top").slide({ mainCell: ".bd ul", autoPlay: true, effect: "topMarquee", vis: 5, interTime: 50 });
		    </script>
<!--                <tbody>
                    <tr>
                        <td class="txt_left"><img class="people" src="assets/img/peizi/people.png" alt="" />x**</td>
                        <td class="txt_left"><b class="colorf06">0.24万</b></td>
                        <td class="txt_left">400.00元</td>
                        <td class="txt_left">64.47元</td>
                        <td class="txt_left1"><b class="colorf06">3.00%</b></td>
                        <td>2015-04-15</td>
                    </tr>
                    <tr>
                        <td class="txt_left"><img class="people" src="assets/img/peizi/people.png" alt="" />蔡**</td>
                        <td class="txt_left"><b class="colorf06">0.33万</b></td>
                        <td class="txt_left">300.00元</td>
                        <td class="txt_left">80.73元</td>
                        <td class="txt_left1"><b class="colorf06">2.00%</b></td>
                        <td>2015-05-11</td>
                    </tr>
                    <tr>
                        <td class="txt_left"><img class="people" src="assets/img/peizi/people.png" alt="" />蔡**</td>
                        <td class="txt_left"><b class="colorf06">0.33万</b></td>
                        <td class="txt_left">300.00元</td>
                        <td class="txt_left">80.73元</td>
                        <td class="txt_left1"><b class="colorf06">2.00%</b></td>
                        <td>2015-05-11</td>
                    </tr>
                    <tr>
                        <td class="txt_left"><img class="people" src="assets/img/peizi/people.png" alt="" />蔡**</td>
                        <td class="txt_left"><b class="colorf06">0.33万</b></td>
                        <td class="txt_left">300.00元</td>
                        <td class="txt_left">80.73元</td>
                        <td class="txt_left1"><b class="colorf06">2.00%</b></td>
                        <td>2015-05-11</td>
                    </tr>
                    <tr>
                        <td class="txt_left"><img class="people" src="assets/img/peizi/people.png" alt="" />蔡**</td>
                        <td class="txt_left"><b class="colorf06">0.33万</b></td>
                        <td class="txt_left">300.00元</td>
                        <td class="txt_left">80.73元</td>
                        <td class="txt_left1"><b class="colorf06">2.00%</b></td>
                        <td>2015-05-11</td>
                    </tr>
                </tbody>-->
            
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
	function alertbox() {
	    alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
	}
</script>
</body>
</html>