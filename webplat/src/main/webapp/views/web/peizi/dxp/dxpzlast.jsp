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
                        <li><a href="rest/web/peizi/usercenter/dxpUserCenter"><span>个人中心</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a><span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">低息1配1</span> </div>
        </div>
        <div class="w100bg">
            <div class="tjs_1108px center">
                <div class="pz_produce">
                    <img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>低息1配1 配资申请</b>
                </div>
                 <input type="hidden" name="dataId" value="${peizi.dataId}"/>
                <div class="bgcolor">
                    <div class="w945 step3">
                        <span class="under_font">选择配资方案</span>
                        <span class="under_font l411" style="color: #fff;">确认并付款</span>
                        <span class="under_font l773" style="color: #fff;">完成配资申请</span>
                        <div class="clear"></div>
                    </div>
                    <div class="datastep3">
                        <h1 class="color54a">操盘申请成功！</h1>
                        <p class="pt10">股票交易账户会在下个交易日9:30前，交易账户开好后，我们将信息通知您！</p>
                    </div>
                    
                     <div class="datastep3" style="padding-top:2px;padding-bottom:40px;margin:0 auto" >
                         <div style="width:460px;text-align:center;margin:0 auto;font-size:18px">投资保证金付款账户</div> 
                         <div style="border-top:1px #d3d3d3 solid;width:460px;margin:0 auto;padding-top:10px;padding-bottom:10px">                                                                                         
                         <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">帐&nbsp;&nbsp;&nbsp;号：6226 2206 2134 5882</div>
                         <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">户&nbsp;&nbsp;&nbsp;名：吴&nbsp;田&nbsp;&nbsp;&nbsp;&nbsp;</div> 
                         <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">开户行：中国民生银行深圳分行营业部</div>                                                
                          </div> 
                          <a class="tjs_next_btn mt30" href="rest/web/peizi/dxp/lowScheduleCapital?dataId=${peizi.dataId}">查看方案进度</a>
                    </div>
                    <div class="w985">
                        <p class="color158 font18">配资进度</p>
                        <hr class="pc" />
                        <img src="assets/img/peizi/schedule.png" alt="" />
                    </div>
                    <p class="progress_bar">
                        <span>提交配资申请</span>
                        <span style="width:236px;">验资开户中<br />交易时间0.5天完成</span>
                        <span style="width:212px;">前往方案详情查看<br />操盘软件账号、密码</span>
                        <span style="width:232px;">下载并登录<br />HOMS操盘软件</span>
                        <span style="width:202px;">开始买卖股票</span>
                    </p>
                    <hr class="pc" />
                    
                  <%@ include file="/views/web/peizi/peizixz.jsp"%>  
                    
                </div>
            <hr class="pc" />
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
        })
     
    </script>
</body>
</html>
