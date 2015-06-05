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
                        <li><span>淘金自营</span></a></li>
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
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
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
                            <span class="bor_dashed"><a href="rest/web/peizi/ttp/dayCapital">天天配</a></span>
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
                <b class="my_tit c333"><a href="rest/web/peizi/recharge" class="on">网银充值</a> | <a href="rest/web/peizi/alipay">支付宝充值</a> | <a href="rest/web/peizi/offLinePay">线下充值</a> | <a href="rest/web/peizi/rechargeRecord">充值记录</a></b>
                <div class="cz_box">
                    <h3 class="cz_tit">选择充值银行<span class="tit_tishi">温馨提示：请先确认您的银行卡已经开通了网银支付功能。</span></h3>
                    <ul class="ul_bank">
                        <li class="on">
                            <input name="rdo" class="rdo" id="Radio1" type="radio" checked />
                            <img src="assets/img/peizi/gongshang.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" class="rdo" id="Radio2" type="radio" />
                            <img src="assets/img/peizi/zhaoshang.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" class="rdo" id="Radio3" type="radio" />
                            <img src="assets/img/peizi/jianshe.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio4" type="radio" />
                            <img src="assets/img/peizi/nongye.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio5" type="radio" />
                            <img src="assets/img/peizi/zhongguoyh.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio6" type="radio" />
                            <img src="assets/img/peizi/guangda.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio7" type="radio" />
                            <img src="assets/img/peizi/zhongxin.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio8" type="radio" />
                            <img src="assets/img/peizi/pingan.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio9" type="radio" />
                            <img src="assets/img/peizi/youzheng.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio10" type="radio" />
                            <img src="assets/img/peizi/pufa.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio11" type="radio" />
                            <img src="assets/img/peizi/huasha.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio12" type="radio" />
                            <img src="assets/img/peizi/minsheng.jpg" alt="" />
                        </li>
                        <li>
                            <input name="rdo" id="Radio13" type="radio" />
                            <img src="assets/img/peizi/guangfa.jpg" alt="" />
                        </li>
                    </ul>
                    <hr class="pc" />
                    <h3 class="cz_tit">填写充值金额</h3>
                    <table class="my_tbl4">
                        <tr>
                            <td>账号余额：</td>
                            <td class="t-left"><span class="colorf06">0.00</span> 元</td>
                        </tr>
                        <tr>
                            <td>充值金额：</td>
                            <td class="t-left"><input type="text" class="input_txt2" />元</td>
                       </tr>
                        <tr>
                            <td colspan="2"><a class="tjs_next_btn" href="#">去充值</a></td>
                        </tr>
                    </table>
                    <h3 class="cz_tit">温馨提示</h3>
                    <div class="tishi_p">
                    <p>1、为了您的资金安全，您的账户资金将由第三方银行托管；</p>
                    <p>2、充值前请注意您的银行卡充值限制，以免造成不便；</p>
                    <p>3、禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户的使用；</p>
                    <p>4、为了您的资金安全，建议充值前进行实名认证、手机绑定、设置提现密码；</p>
                    <p>5、如果充值遇到任何问题，请联系客服：4006-114-088。</p>
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