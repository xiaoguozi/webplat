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
                        <li><a href="rest/web/peizi/activity"><span class="simu_on">淘金活动</span></a></li>
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
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/lowCapital">低息配</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a><span class="sep">&gt;</span> <a href="rest/web/peizi/activity" class="path_item">淘金活动</a> <span class="sep">&gt;</span> <span class="txt">淘金详情</span> </div>
        </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="pz_produce">
				<img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>免费赠送10000元 配资申请</b>
			</div>
            <div class="bgcolor">
                <div class="w945">
                    <span class="under_font">选择配资方案</span>
                    <span class="under_font l411">确认并付款</span>
                    <span class="under_font l773">完成配资申请</span>
                    <div class="clear"></div>                    
                </div>
                <table class="tbl_w500">
                    <tr>
                        <td style="width:200px;"><img src="assets/img/peizi/icon06.png" alt="" /></td>
                        <td class="tbl_w500_b t-left"><b class="color158">首次注册</b>的用户有一次体验机会</td>
                    </tr>
                    <tr>
                        <td><img src="assets/img/peizi/icon05.png" alt="" /></td>
                        <td class="tbl_w500_b t-left">淘金山掏出<b class="color158">10000 元</b>（完全免费）</td>
                    </tr>
                    <tr>
                        <td><img src="assets/img/peizi/icon04.png" alt="" /></td>
                        <td class="tbl_w500_b t-left">您交<b class="color158">0 元</b>（体验费，结束后全额退还给您）</td>
                    </tr>
                    <tr>
                        <td><img src="assets/img/peizi/icon03.png" alt="" /></td>
                        <td class="tbl_w500_b t-left">总共<b class="color158">10000 元</b>（由您操盘）</td>
                    </tr>
                    <tr>
                        <td><img src="assets/img/peizi/icon02.png" alt="" /></td>
                        <td class="tbl_w500_b t-left">交易<b class="color158">2 天</b></td>
                    </tr>
                    <tr>
                        <td><img src="assets/img/peizi/icon01.png" alt="" /></td>
                        <td class="tbl_w500_b t-left">盈利全归你，亏损算我们！</td>
                    </tr>
                </table>

                <hr class="pc"/>
                <div class="xuyaopeizibox">
                    免费体验“股票交易账户”会在下个交易日9点30分前开出<br />
                   <!--   <a class="tjs_btn" style="margin-top:30px;" href="rest/web/peizi/freeNextActivity">免费体验</a>-->
                   <c:if test="${result==-1}">
                   		<span style="color: red;">今日名额已满，请改日再体验</span>
                   		<br/>
                   		<a class="tjs_btn disabled" style="margin-top:10px;" href="javascript:void(0);">免费体验</a>
                   </c:if>
                   <c:if test="${result!=-1}">
                   		<a class="tjs_btn" style="margin-top:30px;" href="rest/web/peizi/freeNextActivity">免费体验</a>
                   </c:if>
                </div>
            </div>
            <div class="pz_produce">
				<img src="assets/img/peizi/pzxuzi.png" width="34" alt=""><b>配资须知</b>
			</div>
            <div class="bgcolor">
                <ul class="pzxuzhi">
                    <li><img src="assets/img/peizi/fine.png" alt="" /><br />收益最大可放大5倍</li>
                    <li><img src="assets/img/peizi/true.png" alt="" /><br />100%真实的实盘交易</li>
                    <li class="pdr0"><img src="assets/img/peizi/bz.png" alt="" /><br />严格止损，控制资金风险</li>
                </ul>
                <div class="clear"></div>
                <div class="peizhibox">
                    <b class="color158 font18">配资须知 <img src="assets/img/peizi/peizhixz.png" alt="" /></b>
                    <p>1、全程只需向理财人每月支付利息，无其他任何费用，股市有风险，投资需谨慎！市场风险莫测，务请谨慎行事！</p>
                    <p>2、您的投资本金：您自己投资股票的资金，最少3千，最多500万，必须是1000元的倍数；</p>
                    <p>3、资金使用期限：按自然月计算，如使用1个月，1月8日到2月8日，当月日期没有按当月日期的最后一天计算，日期为自然日，即包含各类节假日；</p>
                    <p>4、每月利息支付：每月月初支付利息，如1月8日配资，1月8日支付第1个月利息，2月8日支付第2个月利息，以此类推；</p>
                    <p>5、亏损警告线：当总操盘资金低于警戒线以下时，只能平仓不能建仓，我们将有权把您的股票最多减仓到操盘资金的50%；</p>
                    <p>6、亏损平仓线：当总操盘资金低于平仓线以下时，我们将有权把您的股票进行平仓，为避免平仓发生，请时刻关注本金是否充足；</p>
                    <p>7、开始交易时间：一般选择下个交易日，如看中行情急需交易，可直接选择今天交易（今天开始计算利息）。</p>
                    <table class="peiztbl">
                        <tr>
                            <td>借款月利率表</td>
                            <td>借款50万以下</td>
                            <td>借款50万到100万以下</td>
                            <td> 借款100万或以上</td>
                        </tr>
                        <tr>
                            <td>借款1-2个月</td>
                            <td>1.75分</td>
                            <td>1.65分</td>
                            <td>1.6分</td>
                        </tr>
                        <tr>
                            <td>借款3-6个月</td>
                            <td>1.7分</td>
                            <td>1.6分</td>
                            <td> 1.55分</td>
                        </tr>                        
                    </table>
                    <p>注：月利率1.6分，就是每月支付借款资金的1.6%的利息，如借款1万，每月利息160元</p>
                    <hr class="pc"/>
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

	})
</script>
</body>
</html>