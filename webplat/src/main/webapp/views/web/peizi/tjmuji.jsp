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
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <!-- 
                        <li><span class="simu_on">淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                        -->
                        <li><a href="rest/web/peizi/usercenter/pzzhongxin"><span>个人中心</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">淘金募集</span> </div>
        </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="pz_produce">
				<img src="assets/img/peizi/jxtuijuan.png" alt=""><b>精选推荐</b>
			</div>
            <div class="bgcolor">
                <div class="mjproduce">
                    <h1 class="h1bg"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>                
                <div class="mjproduce">
                    <h1 class="h1bg"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>
                <div class="mjproduce">
                    <h1 class="h1bg"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>
                <div class="mjproduce">
                    <h1 class="h1bg" style="width:100%;"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdln">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>
            </div>
            <div class="pz_produce bdcolor">
			    <img src="assets/img/peizi/all.png" alt=""><b>全部募集产品</b>
		    </div>
            <div class="bgcolor bdleft">
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div> 
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
                    </div>
                </div>           
                <div class="mjproduce bder">
                    <h1 class="h1bg bgnone"><a href="tjmujimingxi.html">镇江交投</a></h1>
                    <div class="mjproduce_cont bdernone">
                        <b class="colorf06">10<span class="font18">.50%</span></b>
                        <p class="bbtom">门槛：<strong class="colorf06">100万</strong> | 期限：<strong class="colorf06">18个月</strong></p>
                        <p class="cont_ms">一年期半年限，高收益，还款来源足，风控完善，交易对手强劲！</p>
                        <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">我要预约</a>
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
			$(".qq").attr("src","images/qqhove.png");
			$(".zx").css("color","#1682CA");
		},function(){
			$(".qq").attr("src","images/qq.png");
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