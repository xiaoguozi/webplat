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
                    <a href="">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                        <li><a href="rest/web/peizi/index" target="_blank"><span>配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital" target="_blank"><span class="simu_on">淘金配资</span></a></li>
                        <!--  
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                        -->
                        <li><a href="rest/web/peizi/usercenter/ttpUserCenter"><span>个人中心</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a><span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">天天配</span> </div>
        </div>
     
  
    <div class="w100bg">
      <form id="modalForm" action="rest/web/peizi/ttp/dayNextCapital" method="post" >
        <div class="tjs_1108px center">
        
            <div class="pz_produce">
				<img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>天天配 配资申请</b>
			</div>
			
			<input type="hidden" name="dataId" value="${peizi.dataId}"/>
			<input type="hidden" name="dataType" value="${peizi.dataType }"/>
			<input type="hidden" name="dataZfglf" value="<fmt:formatNumber value="${peiziRule.ruleZhglf}" pattern="########.##" />"/>
			<input type="hidden" name="dataYll" value=""/>
			<input type="hidden" name="dataNll" value=""/>
			<input type="hidden" name="dataRulePcx" value=""/>
			<input type="hidden" name="dataRuleJjx" value=""/>
			<input type="hidden" name="dataTypeSylx" value="${peiziRule.ruleGlsyType}"/>
			
			<input type="hidden" name="dataZcpzj" value="<fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" />"/>
			<input type="hidden" name="dataPzje" value="<fmt:formatNumber value="${peizi.dataPzje }" pattern="########.##" />"/>
			<input type="hidden" name="dataTzbzj" value="<fmt:formatNumber value="${peizi.dataTzbzj }" pattern="########.##" />"/>
			<input type="hidden" name="dataJjx" value="<fmt:formatNumber value="${peizi.dataJjx }" pattern="########.##" />"/>
			<input type="hidden" name="dataPcx" value="<fmt:formatNumber value="${peizi.dataPcx }" pattern="########.##" />"/>
			<input type="hidden" name="dataJklxTotal" value="${peizi.dataJklxTotal }"/>
			<input type="hidden" name="dataZjsyqx" value="${peizi.dataZjsyqx }"/>
			
									
            <div class="bgcolor">
                <div class="w945">
                    <span class="under_font">选择配资方案</span>
                    <span class="under_font l411">确认并付款</span>
                    <span class="under_font l773">完成配资申请</span>
                    <div class="clear"></div>                    
                </div>
                
                <hr class="pc"/> 
                <div class="caopanjine">
                    <span class="box1">1</span><div class="font_word18">选择您的总操盘金额<span class="font_word16">（3倍杠杆）</span></div>
                    <div class="caopanbox">
                        <div class="cpbox1 on">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />">10000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <div class="cpbox1">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />">20000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <div class="cpbox1">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />" >30000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <div class="clear"></div> 
                        <div class="cpbox1">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />">40000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <div class="cpbox1">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />">50000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <div class="cpbox1">
                            <span class="cpmoney" pcx="<fmt:formatNumber value="${peiziRule.rulePcx3}" pattern="########.##" />" jjx="<fmt:formatNumber value="${peiziRule.ruleJjx3}" pattern="########.##" />">60000</span><br />总操盘金额
                            <div class="goubox"></div>
                        </div>
                        <hr class="pc"/>
                    </div>
                    <span class="box1">2</span><div class="font_word18">支付配资管理费</div>
                    <div class="qixian">
                        <span class="fleft">期限：</span><div class="sel_wrap fleft">
                                <label class="lbl" day="${peizi.dataZjsyqx}">${peizi.dataZjsyqx}天</label>
                                <ul class="select" style="filter: alpha(opacity=100);">
                                    <li day="2">2天</li>
                                    <li day="3">3天</li>
                                    <li day="5">5天</li>
                                    <li day="10">10天</li>
                                    <li day="15">15天</li>
                                    <li day="20">20天</li>
                                </ul>
                            </div>
                        <div class=" lh20 pl220">总账户管理费：<span id="manageFee" class="colorf06 font26">${peizi.dataJklxTotal}</span>元</div>
                        <div class="clear"></div>
                        <div class="mt30 qcimg"><img src="assets/img/peizi/qcmark.png" alt="" />按天收取，周末、节假日免费。到期后，如账户余额充足，默认自动延期；如不需要自动续约，可以在方案详情中关闭该功能。</div>
                    </div>
                </div>  
                <div class="caopanjine1">
                    <span class="box1">3</span><div class="font_word18">确认操盘信息</div>
                    <ul class="cpxinxi">
                        <li>总操盘资金<img class="curser" src="assets/img/peizi/qcmark.png" title="投资本金+配资金额" alt="" />：<span id="capital" class="colorf06 font26 mlr5"></span>元</li>
                        <li>投资保证金<img class="curser" src="assets/img/peizi/qcmark.png" title="投资本金" alt="" />：<span id="assure" class="colorf06 font26 mlr5"></span>元</li>
                        <li>亏损警告线<img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于亏损警戒线以下时，只能平仓不能建仓，需要尽快补充投资本金，以免低于亏损平仓线被平仓" alt="" />：<span id="loss" class="colorf06 font26 mlr5"></span>元</li>
                        <li>亏损平仓线<img class="curser" src="assets/img/peizi/qcmark.png" title="当总操盘资金低于平仓线以下时，我们将有权把您的股票进行平仓，为避免平仓发生，请时刻关注投资本金是否充足。" alt="" />：<span id="close" class="colorf06 font26 mlr5"></span>元</li>
                        <li>账户管理费<img class="curser" src="assets/img/peizi/qcmark.png" title="每天需要支付的管理费" alt="" />：<span id="fee" class="colorf06 font26 mlr5">${peizi.dataZfglf}</span>元/天</li>
                        <li style="position:relative">开始交易时间<img class="curser" title="一般选择下个交易日，如看中行情急需交易，可直接选择今天开始。14:40以后只能选择下个交易日" src="assets/img/peizi/qcmark.png" alt="" />：<span class="nextday"><input id="Radio1" name="dataJyksDate" value="1" type="radio" <c:if test="${peizi.dataJyksDate== '1'}">checked="checked"</c:if>/>今天<br />
                            <input name="dataJyksDate" id="Radio2" value="2" type="radio" <c:if test="${peizi.dataJyksDate== '2'}">checked="checked"</c:if> />下一个交易日</span></li>
                    </ul>
                </div>
                <hr class="pc"/>
                <div class="xuyaopeizibox">
                	<div style="height:85px">
                  	  如您不清楚规则，或有其他疑问，请联系客服：4006-114-088<br />
                    <input id="Checkbox1" type="checkbox" checked="checked" />&nbsp;我已阅读并同意 <a href="javascript:openAgree('<%=basePath%>');">《合作操盘协议》</a><br/>
                    <span  id="renzheng" style="color:red;display:none">请先<a href="rest/web/userCenter/index" target="_self">实名认证</a>再参与该活动</span><br/>  
                    </div>                                                        
                    <a class="tjs_btn <c:if test='${peiziRule.ruleEnable==20}'>disabled</c:if> ">我要配资</a>                  
                </div>
            </div>
            
           <%@ include file="/views/web/peizi/peizixz.jsp"%>  
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
        
        /*--操盘金额--*/
        var sum = ${peizi.dataZcpzj==null?0:peizi.dataZcpzj};
        $(".cpbox1").each(function (i) {
            $(this).click(function () {            	
                $(".cpbox1").removeClass("on")
                $(this).addClass("on");
                sum = parseFloat($(".cpmoney:eq(" + i + ")").text());
                $("#capital").text(sum);
                $("#assure").text(sum * 0.25);
                
                var pcx = parseFloat($('.on .cpmoney').attr('pcx'));
                var jjx = parseFloat($('.on .cpmoney').attr('jjx'));               
                $("#loss").text((sum*0.75*jjx/100).toFixed(0));
                $("#close").text((sum*0.75*pcx/100).toFixed(0));
                $("#fee").text(((sum/10000)*$('input[name=dataZfglf]').val()).toFixed(2));
                var syqx=parseInt($('.lbl').attr("day"));
				$("#manageFee").text(((sum/10000)*$('input[name=dataZfglf]').val()*syqx).toFixed(2));
                
            });
        });
        /*--/操盘金额--*/

	    //--自定义下拉框--
		$(".sel_wrap").click(function () {
		    var money = $("input[name=dataZfglf]").val();
		    $(".select").toggle();
		    $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
		    $(".select>li").each(function (index) {
		        $(this).click(function () {
		            var opt = $(this).html();
		            $(".lbl").html(opt);
		            $(".lbl").attr("day",$(this).attr("day"))
		            var syqx=parseInt($('.lbl').attr("day"));
		            $("#manageFee").text(((sum/10000)*$('input[name=dataZfglf]').val()*syqx).toFixed(2));
		        })
		    })
		});
		
		 //--/自定义下拉框--
		 
		 
		//--配资按钮--
		$(".tjs_btn:not(.disabled)").click(function(event){
			event.preventDefault();	
			var resulut="${result}";
			var islogin="${islogin}";
			if(islogin=='true'&&resulut=='-3'){
				$("#renzheng").css("display","block");
				return;
			}
			
			if($('#Checkbox1').attr("checked")){
				$("input[name=dataZcpzj]").val($("#capital").text());
				$("input[name=dataTzbzj]").val($("#assure").text());
				$("input[name=dataJjx]").val($("#loss").text());
				$("input[name=dataPcx]").val($("#close").text());
				$("input[name=dataJklxTotal]").val($("#manageFee").text());
				$("input[name=dataZjsyqx]").val($('.lbl').attr("day"));										
				$("input[name=dataRulePcx]").val($('.on .cpmoney').attr('pcx'));			
				$("input[name=dataRuleJjx]").val($('.on .cpmoney').attr('jjx'));								
				$("#modalForm").submit();				
			}else{
				errTip("请先阅读并同意《合作操盘协议》", 1);
			}
		});
		//--配资按钮---
		
		 //--默认选中1：1--	
		var index=0;
		if($('input[name=dataZcpzj]').val()!=''){
			index=parseInt($('input[name=dataZcpzj]').val())/10000-1;		
		}		
		$('.cpbox1:eq('+index+')').click();
		//--/自定义下拉框--	                 
	})
	
</script>
</body>
</html>