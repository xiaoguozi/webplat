<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
                        <li><a href="rest/web/peizi/usercenter/mxp"><span>个人中心</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a><span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">免息配</span> </div>
        </div>
        <div class="w100bg">
         <input type="hidden" name="dataId" value="${peizi.dataId}"/>
            <div class="tjs_1108px center">
                <div class="pz_produce">
                    <img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>免息配 配资申请</b>
                </div>
                <div class="bgcolor">
                	<form name="payForm" class="hform" id="payForm" action="rest/web/peizi/mxp/monthPay"  method="post">
              			<input type="hidden" name="peizi.dataTzbzj" value="${peizi.dataTzbzj}"/>
              			<input type="hidden" name="peizi.dataPzje" value="${peizi.dataPzje}"/>
              			<input type="hidden" name="peizi.dataId" value="${peizi.dataId}"/>
              		</form>
                    <div class="w945 step2">
                        <span class="under_font">选择配资方案</span>
                        <span class="under_font l411" style="color: #fff;">确认并付款</span>
                        <span class="under_font l773" style="color: #fff;">完成配资申请</span>
                        <div class="clear"></div>
                    </div>
                    <div style="background: #F9F9F9; border: 2px solid #F0F0F0; width: 985px; height: 100px; margin-top:30px; margin-left: 55px;">
                        <h1 class="color54a" style="font-size: 16px; margin-top:20px; color: #FF7022; text-align: center;">订单提交成功，请尽快支付</h1>
                        <p class="pt10" style="text-align: center;"><span style="color: #C5C6C5;">购买产品：</span><span>免息配资方案，方案
                        <fmt:formatNumber value="${peizi.dataTzbzj}" pattern="########.##" />&nbsp;配
                        <fmt:formatNumber value="${peizi.dataPzje}" pattern="########.##" />
                        </span><span style="margin-left: 35px; color: #C5C6C5;">订单金额：<span style="color: #FF996F; font-weight: bold;"><fmt:formatNumber value="${peizi.dataTzbzj}" pattern="########.##" /></span>元</span></p>
                    </div>
                  	<div style="border: 2px solid #C3E1F6; width: 985px; margin-left: 55px; height: 40px; line-height: 40px; margin-top: 20px;">
                  		<div style="float: left; "><span style="margin-left: 20px;">账户余额：<span style="color: #FF996F; font-weight: bold;"><fmt:formatNumber value="${customerFund.usebleFund}" pattern="########.##" /></span>&nbsp;元</span></div>
                  		<div style="float: right;"><span style="margin-right: 20px;">支付：<span style="color: #FF996F; font-weight: bold;"> <fmt:formatNumber value="${peizi.dataTzbzj}" pattern="########.##" /></span>元</span></div> 
                  	</div>
                  	<c:if test="${customerFund.usebleFund<peizi.dataTzbzj}">
                  		<div style="height: 50px; line-height:50px; text-align: center; margin-top: 20px;">
	                  		<span style="color: red;">请先<a href="rest/web/userCenter/zhifu/enterCur" target="_self">充值</a>，再到“我的配资”中进行付款</span>
                  		</div>
                  		<div style="height: 50px; line-height:50px; text-align: center; margin-top: 20px;">
	                  		<a class="tjs_btn disabled" href="javascript:void(0);">确定付款</a>
                  		</div>
                  	</c:if>
                  	<c:if test="${customerFund.usebleFund>=peizi.dataTzbzj}">
                  		<div style="height: 60px; line-height:60px; margin-top:40px; text-align: center; ">
		                    <c:if test="${peizi.dataOperaStatus=='1'}">
			                    <a class="tjs_next_btn" href="">确定付款</a>
		                    </c:if>
		                    <c:if test="${peizi.dataOperaStatus=='10'}">
		                    	<b class="color158 font18">已支付，正在验资......</b>
		                    </c:if>
	                  	</div>
                  	</c:if>
                  	
                    <hr class="pc" />                                        
                </div>
            <hr class="pc" />
             <%@ include file="/views/web/peizi/peizixz.jsp"%> 
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
         
         	$(".tjs_next_btn:not(.disabled)").click(function(e){
         		e.preventDefault();
         		$("#payForm").submit();
         	});
        })
       
    </script>
</body>
</html>
