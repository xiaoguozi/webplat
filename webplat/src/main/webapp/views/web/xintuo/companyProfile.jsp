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
<title>淘金山—跟我淘金山</title>
<script src="assets/scripts/ui/jquery-1.10.2.min.js" type="text/javascript"></script> 
<link href="assets/css/ui/alertMessage.css" rel="stylesheet" />
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<style>
body{ width:100%; height:100%;font-family: "Microsoft YaHei" !important;font-size: 14px; background-color:#f5f5f5;}
html{ width:100%; height:100%;background:#f5f5f5;}
</style>



</head>

<body>
<div class="tis_trust_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href=""><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustSafeguard" target="_blank">安全保障</a></li>
    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="">首页</a> &gt;<a href="rest/web/xintuo/trust/trustIndex">信托</a>&gt; <a href="rest/web/xintuo/trust/trustCompany">信托公司</a> &gt; ${productXtgs.xgtsSplname}</div></div>

<!-- 产品基本信息 开始-->

<div class="tjs_1108px center">
<div style=" height:30px; width:100%;"></div>

<div class="tjs_pfe_box tjs_234border">
<div class="tjs_product_coloreddiv"></div>

<div class="tjs_pfe_title center"><span class="tjs_pfe_img"><img src="assets/img/xintuo/small/${productXtgs.xtgsLog}" width="36" height="30" /></span>${productXtgs.xgtsSplname}</div>
<div class="tjs_pfe_text tjs_padding_height16px">
<ul>
<li class="tjs_right_2border"><span style="font-size:32px; color:#ff6600; margin-top:20px; font-weight:bold;display:inline-block;">${productXtgs.xgtsGsxz}</span><br />股东背景</li>
<li class="tjs_right_2border"><span style="font-size:32px; color:#ff6600; margin-top:20px; font-weight:bold;display:inline-block;"><fmt:formatNumber value="${productXtgs.xgtsZczb}" pattern="#0.####"/>万</span><br />注册资本</li>
<li><span style="font-size:32px; color:#ff6600; margin-top:20px; font-weight:bold;display:inline-block;">${productXtgs.xgtsZcglgm}</span><br />资产管理规模</li>
</ul>
</div>
</div>
<!--// tjs_pfe_box 01-->
<div style=" height:30px; width:100%; font-size:0px;"></div> 

<div class="tjs_recommend_title tjs_companyico">公司简介</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>

<div class="tjs_pfe_box">
<table border="0" cellpadding="0" cellspacing="1" width="100%" style="background-color:#E1E1E1;">
<tbody>
  <tr>
      <td width="16%" height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">公司名称：</td>
      <td width="35%" bgcolor="#FFFFFF" class="tjs_pcs_textevenbg">${productXtgs.xgtsZhname}</td>
      <td width="16%" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">公司简称：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg">${productXtgs.xgtsSplname}</td>
  </tr>
  <tr class="even">
      <td width="16%" height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">英文名称：</td>
      <td width="35%" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsEnname}</td>
      <td width="16%" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">法人代表：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsFrdb}</td>
            
  </tr>
  <tr>
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">成立日期：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg"><fmt:formatDate value="${productXtgs.xgtsCreatedate}" pattern="yyyy-MM"/></td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">注册资本(万元)：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg"><fmt:formatNumber value="${productXtgs.xgtsZczb}" pattern="#0.####"/></td>
  </tr>
  <tr class="even">
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">所在城市：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsCity}</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">董事长：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsGsz}</td>
  </tr>
  <tr>
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">大股东：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg">${productXtgs.xgtsDgd}</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">是否上市：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg"><c:if test="${productXtgs.xgtsSs== '1'}">是</c:if><c:if test="${productXtgs.xgtsSs== '2'}">否</c:if></td>
  </tr>
</tbody>		
</table>
</div>

<!-- /tjs_pfe_box 02-->
<div style=" height:30px; width:100%; font-size:0px;"></div>
<div class="tjs_pfe_box">
<table border="0" cellpadding="0" cellspacing="1" width="100%" style="background-color:#E1E1E1;">
<tbody>
  <tr>
      <td width="67" height="50" bgcolor="#FFFFFF" class="tjs_pcs_tabletitle">公司简介</td>
      </tr>
  <tr>
    <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_textevenbg tjs_padding_height16px"><div class="tjs_pfe_about">
    ${productXtgs.xgtsGsjj}
</div>
    </td>
    </tr>
</tbody>		
</table>
</div>
<!-- /tjs_pfe_box 03 -->
<div style=" height:30px; width:100%; font-size:0px;"></div>
<div class="tjs_recommend_title tjs_belongico">旗下产品<span style="display: inline-block;font-size:14px; margin-right:20px;float:right;"><a href="rest/web/xintuo/trust/trustProduct">更多...</a></span></div>

<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>


<div class="tjs_trust_tabbox">

<c:forEach items="${lstProductXtcp}" var="productXtcp" varStatus="status">
<div class="tjs_trust_content <c:if test="${status.index%2==0}">tjs_bg_gray</c:if>">
<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="rest/web/xintuo/trust/trustParticulars?id=${productXtcp.xtcpId}"><img src="assets/img/xintuo/middle/${productXtcp.xtcpLog}" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width320px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="rest/web/xintuo/trust/trustParticulars?id=${productXtcp.xtcpId}">${productXtcp.xtcpSplname}</a></div>
<div class="tjs_trust_bonus">${productXtcp.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${productXtcp.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width270px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;"><fmt:formatNumber value="${productXtcp.xtcpZdrgje}" pattern="#0.####"/>万</span><br />
投资期限：<span style="color:#666;">${productXtcp.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">${productXtcp.xtcpTzly}</span></div>
</div>
<div class="tjs_float_left tjs_width340px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${productXtcp.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<c:choose>  
    <c:when test="${productXtcp.xtcpStatus=='30'}">
    	<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn_disable" data_id="${productXtcp.xtcpId}">立即预约</a></div>
    </c:when>    
    <c:otherwise>        
		<<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn" data_id="${productXtcp.xtcpId}">立即预约</a></div>
    </c:otherwise>  
</c:choose>

</div>
</div>

</div>
</c:forEach>	
</div>

</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 产品基本信息 结束-->

<div class="tjs_pcs_flow">
<div class="tjs_1108px center">
<div style=" height:30px; width:100%; font-size:0px;"></div>

<div class="tjs_pcs_title">信托购买流程<a name="F" id="A6"></a></div>

<div class="tjs_flowdiv">
<ul>
<li>
<strong>在线预约</strong><br />
 <span style=" color:#9d9d9d;">或拨打4006-114-088</span>
</li>
<li class="tjs_margin_L45px">
<strong>确定意向</strong><br />
 <span style=" color:#9d9d9d;">额度和打款时间</span>
</li>
<li class="tjs_margin_L45px">
<strong>完成打款</strong><br />
 <span style=" color:#9d9d9d;">指定监管帐号</span>
</li>
<li class="tjs_margin_L45px">
<strong>成功购买</strong><br />
 <span style=" color:#9d9d9d;">按签署合同收取返现</span>
</li>

</ul>
</div>
<!--// tjs_pcs_box 05-->

<div class="clearfloat"></div>
</div>
</div>
<!--//tjs_pcs_flow -->




<%@ include file="/views/web/footer.jsp"%>
<!-- /footer tjs_1108px -->
</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/xintuo/trust/orderProduct";
$(function () {                   
    //--预约--                   
	$("a.tjs_btn").click(function(event){	
		event.preventDefault();
		 alertMsg($(this).attr("data_id"),'10', 1);  	
			if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
		        $('[placeholder]').focus(function() {
		            var input = $(this);
		            if (input.val() == input.attr('placeholder')) {
		                input.val('');
		                input.removeClass('placeholder');
		            }
		        }).blur(function() {
		            var input = $(this);
		            if (input.val() == '' || input.val() == input.attr('placeholder')) {
		                input.addClass('placeholder');
		                input.val(input.attr('placeholder'));
		            }
		        }).blur();
		    };
	});
    
	 //--预约--                   
	$("a.tjs_btn_disable").click(function(event){	
		event.preventDefault();		
	});
	  

	    		       
}); 

function placeholderSupport() {
    return 'placeholder' in document.createElement('input');
}

</SCRIPT>
</body>
</html>
