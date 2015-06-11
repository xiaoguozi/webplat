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
    <script type="text/javascript" src="assets/scripts/ui/err_box.js"></script>
    <script type="text/javascript" src="assets/scripts/ui/peizi.js"></script>
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
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a><span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">低息1配1</span> </div>
        </div>
    <div class="w100bg">
    <form id="modalForm" action="rest/web/peizi/dxp/lowNextCapital" method="post" >
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
			<input type="hidden" name="dataJjx" value="<fmt:formatNumber value="${peizi.dataJjx }" pattern="########.##" />"/>
			<input type="hidden" name="dataPcx" value="<fmt:formatNumber value="${peizi.dataPcx }" pattern="########.##" />"/>
			<input type="hidden" name="dataJklxTotal" value="${peizi.dataJklxTotal }"/>
			<input type="hidden" name="dataZjsyqx" value="${peizi.dataZjsyqx }"/>
        <div class="tjs_1108px center">        
            <div class="pz_produce">
				<img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>低息1配1配资申请</b>
			</div>
            <div class="bgcolor">
                <div class="w945">
                    <span class="under_font">选择配资方案</span>
                    <span class="under_font l411">确认并付款</span>
                    <span class="under_font l773">完成配资申请</span>
                    <div class="clear"></div>                    
                </div>
                
                <hr class="pc"/> 
                <div class="caopanjine">
                    <span class="box1">1</span><div class="font_word18">输入您的投资保障金</div>
                    <input class="input_txt1" id="principal" onkeyup="arithmetic()" name="dataTzbzj" type="text" maxlength="7"  value="<fmt:formatNumber value="${peizi.dataTzbzj }" pattern="########" />"/><span class="pos_d">元</span>
                    <div class="clear"></div>
                    <span class="box1">2</span><div class="font_word18">选择您的配资期限</div>
                    <div class="caopanbox">
                        <div class="cpbox1 on" style="width:125px; height:72px;" month="3"><span>3</span>个月<div class="goubox"></div>
                        </div>
                        <div class="cpbox1" style="width:125px; height:72px;" month="6"><span>6</span>个月<div class="goubox"></div>
                        </div>
                        <div class="cpbox1" style="width:125px; height:72px;" month="9"><span>9</span>个月<div class="goubox"></div>
                        </div>
                        <div class="cpbox1" style="width:125px; height:72px;" month="12"><span>12</span>个月<div class="goubox"></div>
                        </div>
                        <hr class="pc"/> 
                        <p style="font-size:16px;">借款年利率<span class="colorf06"><fmt:formatNumber value="${peizi.dataNll}" pattern="########.00" />%</span>,借款利息 <span id="lixi" class="colorf06"></span> 元</p>
                        <hr class="pc"/>
                    </div>
                </div>  
                <div class="caopanjine1">
                    <span class="box1">3</span><div class="font_word18">确认操盘信息</div>
                    <ul class="cpxinxi">
                        <li>总操盘资金<img class="curser" src="assets/img/peizi/qcmark.png" title="投资本金+配资金额" alt="" />：<span id="capital" class="colorf06 font26 mlr5">0</span>元</li>
                        <li>亏损警告线<img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于亏损警戒线以下时，只能平仓不能建仓，需要尽快补充投资本金，以免低于亏损平仓线被平仓" alt="" />：<span id="loss" class="colorf06 font26 mlr5">0</span>元</li>
                        <li>亏损平仓线<img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于平仓线以下时，我们将有权把您的股票进行平仓，为避免平仓发生，请时刻关注投资本金是否充足。" alt="" />：<span id="close" class="colorf06 font26 mlr5">0</span>元</li>
                        <li style="position:relative">开始交易时间<img class="curser" src="assets/img/peizi/qcmark.png" title="一般选择下个交易日，如看中行情急需交易，可直接选择今天开始交易。14:40以后只能选择下个交易日" alt="" />：<span class="nextday"><input id="Radio1" name="dataJyksDate" value="1" type="radio" <c:if test="${peizi.dataJyksDate== '1'}">checked="checked"</c:if>/>今天<br />
                            <input name="dataJyksDate" id="Radio2" value="2" type="radio" <c:if test="${peizi.dataJyksDate== '2'}">checked="checked"</c:if> />下一个交易日
						</span></li>
                    </ul>
                </div>
                <hr class="pc"/>
                <div class="xuyaopeizibox">
                    如您不清楚规则，或有其他疑问，请联系客服：4006-114-088<br />
                    <input id="Checkbox1" type="checkbox" />&nbsp;我已阅读并同意 <a href="javascript:openAgree('<%=basePath%>');">《合作操盘协议》</a><br /><br />
                     <a class="tjs_btn" href="rest/web/peizi/dxp/lowNextCapital">我要配资</a>
                  
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
       </form>
        <hr class="pc"/>
    </div>
<!-- 配资页尾 -->
<%@ include file="/views/web/footer.jsp"%>
<!-- 配资页尾 结束 -->
<script type="text/javascript">
function arithmetic(){
	var strTzbzj=$.trim($("#principal").val()).replace('/,/g','');
	strTzbzj =(strTzbzj==''?'0':strTzbzj);
    if (isNaN(strTzbzj)) {
        $("#principal").val("0");
    }
    if (strTzbzj.substring(0, 1) == '0') {
        $("#principal").val("");
        strTzbzj = 0;
    }
    //--获取键盘输入的投资本金--
    var sum = parseInt(strTzbzj);
    if (sum==null||sum<0) {
        sum = 0;
    }
    //--年利率--
    var strlv = $('input[name=dataNll]').val();
    strlv=(strlv==''?'0':strlv);
    var lv = parseFloat(strlv);
    var rulejjx = parseFloat($('input[name=dataRuleJjx]').val());
	var rulepcx = parseFloat($('input[name=dataRulePcx]').val());

     var month = parseInt($('.on').attr('month'));   
     $("#lixi").text(((lv*sum*month)/(100*12)).toFixed(2)); 
     $("#capital").text(sum*2);
   	 $("#loss").text((sum*rulejjx/100).toFixed(2));
     $("#close").text((sum*rulepcx/100).toFixed(2));
}



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
    $(".cpbox1").each(function (i) {
        $(this).click(function () {            
            $(".cpbox1").removeClass("on")
            $(this).addClass("on");
           
            //--年利率--
            var strlv = $('input[name=dataNll]').val();
            strlv=(strlv==''?'0':strlv);
            var lv = parseFloat(strlv);
            var rulejjx = parseFloat($('input[name=dataRuleJjx]').val());
        	var rulepcx = parseFloat($('input[name=dataRulePcx]').val());
        	var month = parseInt($('.on').attr('month')); 
        	var strTzbzj=$.trim($("#principal").val()).replace('/,/g','');
        	strTzbzj =(strTzbzj==''?'0':strTzbzj);
        	var sum = parseInt(strTzbzj);
        	
            $("#lixi").text(((lv*sum*month)/(100*12)).toFixed(2)); 
            $("#capital").text(sum*2);
          	$("#loss").text((sum*rulejjx/100).toFixed(2));
            $("#close").text((sum*rulepcx/100).toFixed(2));
            
            
        });
    });
    /*--/操盘金额--*/
    
    //--配资按钮--
	$(".tjs_btn").click(function(event){
		event.preventDefault();	
		//判断投资保证金是否是1000的整数倍
		var strTzbzj= $.trim($("#principal").val()).replace('/,/g','');		
		if(strTzbzj==''){strTzbzj="0"}
		var iTzbzj = parseInt(strTzbzj,'10');
		
		if(iTzbzj<10000){
			errTip("保证金最低10000元 ", 1);
			return ;
		}

		if(iTzbzj%1000!=0){
			errTip("投资本金必须为1000的整数倍 ", 1);
			return;
		}
		
		if(!$('#Checkbox1').attr("checked")){
			errTip("请先阅读并同意《合作操盘协议》", 1);
			return ;
		}
	
		$("input[name=dataZcpzj]").val($("#capital").text());
		$("input[name=dataJjx]").val($("#loss").text());
		$("input[name=dataPcx]").val($("#close").text());
		$("input[name=dataJklxTotal]").val($("#lixi").text());
		$("input[name=dataZjsyqx]").val($('.on').attr('month'));
		$("#modalForm").submit();						
	});
    
	arithmetic();  
 
})
</script>
</body>
</html>