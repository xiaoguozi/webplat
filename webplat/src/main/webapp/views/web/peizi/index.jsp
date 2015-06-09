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
<meta name="keywords" content="淘金配资,配资网,股票配资,配资公司,期货配资,配资平台,配资炒股" />
<meta name="description" content="淘金配资网为您提供安全、可靠、高效的股票配资平台，新人注册免费配，优惠活动免息配，不同的体验低息配、天天配、月月配，月息低至1.2%,专业的投资达人为您 	
在线配资" />
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
                        <li><a href="rest/web/peizi/index"><span class="simu_on">配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
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
                	<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
					<li><a href="rest/web/peizi/mxp/dayCapital">免息配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div id="slideBox" class="slideBox">
            <div class="hd">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <li><a class="inter_cutimg" href="javascript:void(0)"></a></li>
                    <li><a class="inter_cutimg img02" href="javascript:void(0)"></a></li>
                    <li><a class="inter_cutimg img03" href="javascript:void(0)"></a></li>
                </ul>
            </div>
            <div class="tjs_nav_box"><a class="prev" href="javascript:void(0)"></a><a class="next" href="javascript:void(0)"></a></div>
        </div>
        <script type="text/javascript">
            jQuery(".slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, delayTime: 500 });
        </script>
        <!-- 焦点广告 结束 -->
                            

        <div class="tjs_liuchengbg"></div>
        <div class="tjs_1108px center">
        	<!-- 新手导航 -->
            <div class="tjs_liucheng">
            </div>
            <div class="peizi_data_box">
            	<span class="data_box1">
            		<img src="assets/img/peizi/help.png" alt=""><p>新手指引<br/><span class="font14">一分钟了解配资</span></p>
            	</span>
            	<span class="data_box1">
            		<img src="assets/img/peizi/safety.png" alt=""><p>安全保障<br/><span class="font14">最安全的网上配资</span></p>
            	</span>
            	<span class="data_box2">
            		<em>5.8</em>万位<br/><span class="font14">已累计服务投资人</span>
            	</span>
            	<span class="data_box2">
            		<em>8</em>亿元<br/><span class="font14">送出实盘操盘资金</span>
            	</span>
            	<span class="data_box2">
            		<em>0.8</em>亿元<br/><span class="font14">为投资人赚取收益</span>
            	</span>
            </div>
			<!-- 新手导航 结束 -->    
                            
			<!-- 配资产品 -->
			<div class="pz_produce">
				<img src="assets/img/peizi/pro_ico.png" alt=""><b>配资产品</b>
			</div>
            <div style="position:relative;display:block;height:1125px;">
			<div class="pro_box ml0 top20">
				<h1 class="pro_title">淘金活动</h1>
				<p class="wbl pt80"><b class="colorf06">免费赠送10000元</b> 实盘资金</p>
				<p><b class="colorf06">盈利全归您</b> 亏损算我们</p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/mfp/freeActivity">我要爽</a>
				
			</div>
			<div class="pro_box top20" style="left:349px;">
				<h1 class="pro_title">淘金活动</h1>
				<p class="wbl pt20"><b class="colorf06">免息配</b>日息为 <span class="colorf06"><b class="fsize">0</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">15天</span>免利息</p>
				<p class="w230">最高<span class="colorf06"> 3倍 </span>杠杆，最高可配<span class="colorf06">3万</span></p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/mxp/monthCapital">我要爽</a>
			</div>
			<div class="pro_box top20" style="left:728px;">
				<h1 class="pro_title">天天配</h1>
				<p class="wbl pt20"><b class="colorf06">10000</b>元起配，日息低至 <span class="colorf06"><b class="fsize">0.1</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">2~30天</span>任意配</p>
				<p class="w230">最高<span class="colorf06"> 5倍 </span>杠杆，最高可配<span class="colorf06"> 500万</span></p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/ttp/dayCapital">我要配资</a>
			</div>
            <div class="clear"></div>
			<div class="pro_box ml0 top380 top370">
				<h1 class="pro_title">月月配</h1>
				<p class="wbl pt20"><b class="colorf06">2000</b>元起配，月息低至 <span class="colorf06"><b class="fsize"> 1.3</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">1~6个月</span>配资时长</p>
				<p class="w230">最高<span class="colorf06"> 5倍 </span>杠杆，最高可配<span class="colorf06"> 500万</span></p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/yyp/monthCapital">我要配资</a>
			</div>
			<div class="pro_box top380 top370" style="left:349px;">
				<h1 class="pro_title">低息1配1</h1>
				<p class="wbl pt20"><b class="colorf06">20000</b>元起配，月息低至 <span class="colorf06"><b class="fsize">0.69</b>%</span></p>
				<p class="wbl lh30"><span class="colorf06">3个月</span>起配</p>
				<p class="w230">最高<span class="colorf06"> 1倍 </span>杠杆，风险超低</p>
				<a class="tjs_btn mtb54" href="rest/web/peizi/dxp/lowCapital">我要配资</a>
			</div>
			<div class="pro_box top380 top370"style="left:728px;">
				<h1 class="pro_title">淘金募集</h1>
				<p class="wbl pt20"><span class="color158">淘金山一号<span><span class="colorf06"> <span class="fsize">10</span>.89%</span></p>
				<p class="wbl lh30">门槛：<b class="colorf06">100万 </b> |  期限：<b class="colorf06">18个月</b></p>
				<p class="w230">一年半期限，高收益，还款来源足，风控完善，交易对手强劲！</p>
				<!--  <a class="tjs_btn mtb29" href="rest/web/peizi/recommandRaise">我要预约</a> -->
				<a class="tjs_btn mtb29">我要预约</a>
			</div>
			<div class="clear"></div>
			<div class="pro_box ml0 top760 top750">
				<h1 class="pro_title">淘金自营</h1>
				<p class="wbl pt20"><span class="color158">淘金山二号<span><span class="colorf06"> <span class="fsize">528</span>.00%</span></p>
				<p class="wbl lh30">基金经理：<b class="colorf06">100万 </b> |  期限：<b class="colorf06">18个月</b></p>
				<p class="w230">擅长趋势投资策略，精研个股，风控严谨产品回撤幅度小！</p>
				<!--  <a class="tjs_btn mtb29" href="rest/web/peizi/recommandSelf">我要预约</a>-->
				<a class="tjs_btn mtb29">我要预约</a>
			</div>
			
           </div>
			<hr class="pc"/>
			<!-- 配资产品 结束 -->
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