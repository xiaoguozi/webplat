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
                        <li><a class="tjs_btn pzbtn" href="rest/web/peizi/recharge"><b>¥</b> 充值</a></li>
                        <li class="wypz">我的配资</li>
                        <div class="ttp wypz_div">
                            <span class="bor_dashed"><a href="rest/web/peizi/dayCapital">天天配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/monthCapital">月月配</a></span>
                            <span><a href="rest/web/peizi/lowCapital">低息配</a></span>
                        </div>
                        <li class="wdzj">我的资金</li>
                        <div class="bor_dashed moneymx"><a href="rest/web/peizi/moneyDetail">资金明细</a></div>
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
                <b class="my_tit c333"><a href="rest/web/peizi/recharge">网银充值</a> | <a href="rest/web/peizi/alipay">支付宝充值</a> | <a class="on" href="rest/web/peizi/offLinePay">线下充值</a> | <a href="rest/web/peizi/rechargeRecord">充值记录</a></b>
                <div class="cz_box">
                    <p class="xx_tit">1.通过网上银行或银行柜台向金斧子转账（手续费最多一笔50元）</p>
                    <table class="xx_tbl1">
                        <tr>
                            <td rowspan="3" class="t-center">
                                <img src="assets/img/peizi/zhaoshangyh.jpg" alt="" /></td>
                            <td>帐号：6214 8375 5087 1333 </td>
                        </tr>
                        <tr>
                            <td>户名：张开兴</td>
                        </tr>
                        <tr>
                            <td>开户行：招商银行深圳分行深纺支行</td>
                        </tr>
                    </table>
                    <p class="xx_tit">2.提交您的转账信息，财务对账通过后会向您的账户划拔相应金额</p>
                    <table class="my_tbl4" style="padding-top:0;">
                        <tr>
                            <td>入账卡号：</td>
                            <td class="t-left"><input style="width:230px;" type="text" class="input_txt2" value="招商银行:6214 8375 5087 1333" /></td>
                        </tr>
                        <tr>
                            <td>您的银行卡号：</td>
                            <td class="t-left"><input style="width:230px;" type="text" class="input_txt2" /></td>
                       </tr>
                        <tr>
                            <td>充值金额：</td>
                            <td class="t-left"><input style="width:230px;" type="text" class="input_txt2" /></td>
                       </tr>
                        <tr>
                            <td colspan="2" class="colorf06 t-center">请务必完成线下转账后，再提交转账信息</td>
                       </tr>
                        <tr>
                            <td colspan="2"><a class="tjs_next_btn" href="#">去充值</a></td>
                        </tr>
                    </table>
                    <h3 class="cz_tit">温馨提示</h3>
                    <div class="tishi_p">
                        <table>
                            <tr>
                                <td style="height:60px;">工作日 09:00 - 18:00 （60分钟内到账），18:00 以后 （次日09:30前到账）<br />非工作日充值于下个工作日10:00前到帐</td>
                                <td rowspan="2"><a class="tjs_next_btn ml100" href="#">联系客服</a></td>  
                            </tr>
                            <tr>
                                <td>如长时间未到账，请联系客服亦可拨打客服电话：4006-114-088</td>
                            </tr>
                        </table>
                    </div>
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
        /*--bank--*/
        $(".ul_bank>li").each(function (i) {
            $(this).click(function () {
                $(".ul_bank>li").removeClass("on");
                $(this).addClass("on");
            });
        });
        /*--/bank--*/
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