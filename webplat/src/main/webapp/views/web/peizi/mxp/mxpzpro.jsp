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
                	<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
					<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a> <span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <a href="ttpeizi.html" class="path_item">天天配</a> <span class="sep">&gt;</span> <span class="txt">方案进度</span></div>
        </div>
        <div class="w100bg">
            <div class="tjs_1108px center">
                <div class="pz_produce">
                    <img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>天天配 方案进度</b>
                </div>
                <div class="bgcolor">
                    <div class="programbox">
                        <h3>账号密码</h3>
                        <div class="pros_box">
                            <p>交易账户： <span class="color158">99787</span></p>
                            <p>交易密码： <span class="color158">2567</span>（为了您的资金安全，请妥善保管好密码）</p>
                            <p>重点提醒： 交易前请先阅读 <a href="#">天天配合作操盘协议</a></p>
                            <p>交易软件： <a href="rest/web/peizi/trade">进入交易软件下载页面</a>（恒生系统每晚20:00进行维护，这段时间无法进行操作）</p>
                        </div>
                        <h3>方案详情</h3>
                        <div class="pros_box">
                            <p>开始时间： 2015-8-18</p>
                            <p>预计到期时间： 2015-9-10 <a style="float:right" href="#">天天配合作操盘协议</a></p>
                        </div>
                        <table class="ty_tbl">
                            <tr>
                                <td class="color158 font26">免费体验</td>
                                <td><span class="colorf06 font26">2001</span> 元<br />总操盘金额</td>
                                <td style="width:10px"><b class="font26">=</b></td>
                                <td><span class="colorf06 font26">1</span> 元<br />投资本金</td>
                                <td style="width:10px"><b class="font26">+</b></td>
                                <td><span class="colorf06 font26">2000</span> 元<br />配资金额</td>
                            </tr>
                        </table>
                        <div class="pros_box bord_d">
                            <b class="color158 font26">操盘中</b>
                            <p class="pt10">热线电话：<span class="colorf06">4006-114-008</span></p>
                        </div>
                    </div>
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
            /*--操盘金额--*/
            var sum = 0;
            $(".cpbox1").each(function (i) {
                $(this).click(function () {
                    $(".cpbox1").removeClass("on")
                    $(this).addClass("on");
                    sum = $(".cpmoney:eq(" + i + ")").text();
                    $("#capital").text(sum);
                    $("#assure").text(sum * 0.25);
                    $("#loss").text(sum * 0.9);
                    $("#close").text(sum * 0.875);
                    $("#fee").text(sum * 0.00075);

                });
            });
            /*--/操盘金额--*/
            /*--QQ咨询--*/
            $(".about_box1:eq(2)").hover(function () {
                $(".qq").attr("src", "assets/img/peizi/qqhove.png");
                $(".zx").css("color", "#1682CA");
            }, function () {
                $(".qq").attr("src", "assets/img/peizi/qq.png");
                $(".zx").css("color", "#8c969d");
            })
            /*--/QQ咨询--*/
            //--自定义下拉框--
            $(".sel_wrap").click(function () {
                var money = "7.5";
                $(".select").toggle();
                $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
                $(".select>li").each(function (index) {
                    $(this).click(function () {
                        var opt = $(this).html();
                        $(".lbl").html(opt);
                        var num = opt.substring(0, 1);
                        $("#manageFee").text(num * money);
                    })
                })
            })
            //--/自定义下拉框--
        })
        function alertbox() {
            alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
        }
    </script>
</body>
</html>
