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
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" 	media="screen" type="text/css" />
	
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
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a><span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">免息配</span> </div>
        </div>
    <div class="w100bg">
      <form id="modalForm" action="rest/web/peizi/mxp/monthLastCapital" method="post">
        <div class="tjs_1108px center">          
           <input type="hidden" name="dataId" value="${peizi.dataId}"/>
			<input type="hidden" name="dataType" value="${peizi.dataType }"/>
			<input type="hidden" name="dataZfglf" value="<fmt:formatNumber value="${peizi.dataZfglf}" pattern="########.##" />"/>
			<input type="hidden" name="dataYll" value="<fmt:formatNumber value="${peizi.dataYll}" pattern="########.##" />"/>
			<input type="hidden" name="dataNll" value="<fmt:formatNumber value="${peizi.dataNll}" pattern="########.##" />"/>
			<input type="hidden" name="dataRulePcx" value="<fmt:formatNumber value="${peizi.dataRulePcx }" pattern="########.##" />"/>
			<input type="hidden" name="dataRuleJjx" value="<fmt:formatNumber value="${peizi.dataRuleJjx }" pattern="########.##" />""/>
			<input type="hidden" name="dataTypeSylx" value="${peizi.dataTypeSylx }"/>
			
			<input type="hidden" name="dataZcpzj" value="<fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" />"/>
			<input type="hidden" name="dataPzje" value="<fmt:formatNumber value="${peizi.dataPzje }" pattern="########.##" />"/>
			<input type="hidden" name="dataTzbzj" value="<fmt:formatNumber value="${peizi.dataTzbzj }" pattern="########.##" />"/>
			<input type="hidden" name="dataJjx" value="<fmt:formatNumber value="${peizi.dataJjx }" pattern="########.##" />"/>
			<input type="hidden" name="dataPcx" value="<fmt:formatNumber value="${peizi.dataPcx }" pattern="########.##" />"/>
			<input type="hidden" name="dataJklxTotal" value="${peizi.dataJklxTotal }"/>
			<input type="hidden" name="dataZjsyqx" value="${peizi.dataZjsyqx }"/>
			
			
        	
            <div class="pz_produce">
				<img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>免息配 配资申请</b>
			</div>
            <div class="bgcolor">
                <div class="w945 step2">
                    <span class="under_font">选择配资方案</span>
                    <span class="under_font l411" style="color:#fff;">确认并付款</span>
                    <span class="under_font l773">完成配资申请</span>
                    <div class="clear"></div>                    
                </div>
                
                <hr class="pc"/> 
                <div class="caopanjine nbox">
                    <p class="color158 font18">配资信息</p>
                    <div class="peizidata_box">
                        <div class="line_d">
                            <p><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" /></span> 元<b class="bigfuhao"> = </b><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataTzbzj}" pattern="######.##" /></span> 元<b class="bigfuhao"> + </b><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataPzje}" pattern="######.##" /></span>元</p>
                            <p><span class="pl10">总操盘基金</span><span class="pl97">投资本金</span><span class="pl106">配资金额</span></p>
                        </div>
                        <table class="pz_tbl">
                            <tr>
                                <td>总操盘资金 <img class="curser" src="assets/img/peizi/qcmark.png" title="投资本金+配资金额" alt="" />：<span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" /></span> 元</td>
                                <td>亏损平仓线 <img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于平仓线以下时，我们将有权把您的股票进行平仓，为避免平仓发生，请时刻关注投资本金是否充足。" alt="" />：<span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataPcx}" pattern="######.##" /></span> 元</td>
                            </tr>
                            <tr>
                                <td>亏损警告线 <img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于亏损警戒线以下时，只能平仓不能建仓，需要尽快补充投资本金，以免低于亏损平仓线被平仓" alt="" />：<span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataJjx}" pattern="######.##" /></span> 元</td>
                                <td>资金使用期限 <img class="curser" src="assets/img/peizi/qcmark.png" title="按30天计算，如使用1个月，12月16日到1月15日" alt="" />：${peizi.dataZjsyqx }天 </td>
                            </tr>
                            <tr>
                                <td>月息 <img class="curser" src="assets/img/peizi/qcmark.png" title="每月需要支付的利息" alt="" />：<span class="colorf06 font26">0</span> %/月</td>
                                <td>开始交易时间 <img class="curser" src="assets/img/peizi/qcmark.png" title="一般选择下个交易日，如看中行情急需交易，可直接选择今天开始交易。14:40以后只能选择下个交易日" alt="" />：
                                	<c:if test="${peizi.dataJyksDate=='1'}" >今日</c:if>
                              		<c:if test="${peizi.dataJyksDate=='2'}" >下个交易日   </c:if>  
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="caopanjine1">
                    <p class="color158 font18">您需支付</p>
                    <div class="zhifu_box">
                        <table class="zhifu_boxtbl">
                            <tr>
                                <td class="t-left">投资本金：</td>
                                <td class="t-right"><fmt:formatNumber value="${peizi.dataTzbzj}" pattern="########.##" /> 元</td>
                            </tr>
                            <tr style="display: none;">
                                <td class="t-left">预存0个月账户管理费</td>
                                <td class="t-right">0元</td>
                            </tr>
                            <tr>
                                <td class="t-left">总金额</td>
                                <td class="colorf06 font26 t-right"><fmt:formatNumber value="${peizi.zfzje}" pattern="########.##" />元</td>
                            </tr>
                        </table>
                        <a class="tjs_btndiv btnbox" href="">重选操盘方案</a>
                    </div>
                    <a class="tjs_next_btn mbl" href="">确定配资</a>
                    <!-- 
                    <p class="t-right ptr">您的账户余额：<span class="colorf06">0.00</span>，本次支付还差<span class="colorf06">2522.5</span>元，请先<a href="rest/web/peizi/recharge">充值</a></p>
                     -->
                </div>
                <hr class="pc"/>
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
        
        </form>
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
       

        //--确定配资--
		$(".tjs_next_btn").click(function (event) {
			event.preventDefault();	
			$("#modalForm").attr("action","rest/web/peizi/mxp/monthLastCapital");
			$("#modalForm").submit();			   
		})
	    //--确定配资--
	    
	    
	     //--返回上一步--
		$(".tjs_btndiv").click(function (event) {
			event.preventDefault();
			$("#modalForm").attr("action","rest/web/peizi/mxp/monthCapital");
			$("#modalForm").submit();			   
		})
	    //--确定配资--
	})

</script>
</body>
</html>