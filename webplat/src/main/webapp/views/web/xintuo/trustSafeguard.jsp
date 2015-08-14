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
<meta name="keywords" content="淘金山信托保全保障" />
<meta name="description" content="淘金山最安全的互联网财富管理平台，产品审核双重防护八道工序，帮助您选出最安全的信托产品，并完成购买信托产品。" />
<title>安全保障-淘金山信托</title>
<script src="assets/scripts/ui/jquery-1.10.2.min.js" type="text/javascript"></script> 
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />
</head>

<body>
<div class="tis_pcs_all">

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
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustSafeguard" target="_blank"><span class="simu_on">安全保障</span></a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->




<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="">首页</a> &gt;<a href="rest/web/xintuo/trust/trustIndex">信托</a>&gt; 安全保障</div></div>

<!-- 产品审核 开始-->

<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div  class="trust_flowtitle"><span style="color:#418ac7">产品审核</span> 双重防护八道工序</div>
<div style=" height:20px; width:100%;"></div>
<div class="tjs_pct_unit"><img src="assets/img/ui/flow_img.png" width="1082" height="323" /></div>
<div class="trust_asc_div">
<div class="trust_asc_left">
<div class="trust_asc_lefttitle"><span style=" font-size:30px">过关斩将</span>&nbsp;&nbsp;&nbsp;一个信托项目的诞生</div>
<div style=" padding-left:65px;line-height:32px; color:#333;"><strong>第一道防护</strong>——信托公司严格审核</div>
<ul>
<li>尽职调查：至少两个月谨慎性调查，深入实地调研，风险点尽职报告</li>
<li>产品立项：撰写立项报告，可行性分析</li>
<li>尽职调查：至少两个月谨慎性调查，深入实地调研，风险点尽职报告</li>
<li>产品预审：合规部、风险管理部门审核，首席风险官一票否决</li>
<li>产品立项：撰写立项报告，可行性分析</li>
</ul>
</div>
<!--//trust_asc_left-->
<div class="trust_asc_right">
<div class="trust_asc_rtitle">
<span style=" font-size:30px;">百里挑一</span>&nbsp;&nbsp;&nbsp;我们是这样挑选产品的</div>
<div style=" padding-left:65px;line-height:32px; color:#333;"><strong>第二道防护</strong>——淘金山极致风控独立筛选</div>
<ul>
<li>看还款来源：还款来源明确，可充分覆盖信托本息</li>
<li>看风控措施：优质足值抵押，流动性强；担保方实力强</li>
<li>看融资企业：公司实力雄厚，资产优质，运营稳健，能保证项目顺利进行</li>
<li>看信托公司：发行方整体风控严密，过往兑付表现优异</li>
</ul>
</div>
<!--//trust_asc_right-->
<div class="clearfloat"></div>
<div style=" height:20px; width:100%;"></div>
<div style="line-height:32px; color:#2c6ea6; text-align:center;"><strong>再严格的审核，那么多的产品总有优次差别。淘金山只客观、独立地挑选安全、优质的产品</strong></div>
<div style=" height:30px; width:100%;"></div>
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 产品审核 结束-->


<!-- 投资管理 开始-->
<div class="tjs_pcs_flow">
<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div  class="trust_flowtitle"><span style="color:#418ac7">投资管理</span> 三级监管体系</div>
<div style="line-height:32px; color:#2c6ea6; text-align:center;"><strong>信托资金由客户直接汇入信托公司指定募集账户，淘金山不经手客户资金</strong></div>
<div class="tjs_pct_unit"><img src="assets/img/ui/strength_img.png" width="902" height="620" /></div>
</div>
<!-- /tjs_content_div tjs_1108px -->
</div>
<!-- 投资管理 结束-->
<!-- 实力保障 开始-->

<!-- 
<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div  class="trust_flowtitle"><span style="color:#418ac7">实力保障</span></div>
<div style=" height:20px; width:100%;"></div>
<div class="trust_asc_div">
<div class="trust_safety_left tjs_border_2">

</div>
<div class="trust_safety_right"><img src="assets/img/ui/strength_ico.png" width="525" height="383" /></div>
<div class="clearfloat"></div>
<div style=" height:20px; width:100%;"></div>
</div>
</div>
 -->
<!-- /tjs_content_div tjs_1108px -->

<!-- 实力保障 结束-->

<!-- 信息安全保障 开始-->
<!-- <div class="tjs_pcs_flow"> -->
<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div  class="trust_flowtitle"><span style="color:#418ac7">信息安全保障</span></div>
<div style="line-height:32px; color:#2c6ea6; text-align:center;"><strong>领先技术+严格流程管理=国家安全级别的信息保护</strong></div>
<div style=" height:20px; width:100%;"></div>
<div class="trust_asc_div">
<div class="trust_safety_left tjs_border_2">
<div style=" height:40px; width:100%;"></div>
<div class="trust_left_safetytitle">数据安全</div>
<div class="trust_left_message">淘金山拥有强大的IT团队，员工大部分来自国内各大银行和互联网公司，在信息安全和数据安全方面经验丰富。</div>
<div style=" height:30px; width:100%;"></div>
<ul>
<li>防火墙</li>
<li>加密技术</li>
<li>容灾备份</li>
<li>安全监测</li>

</ul>
</div>
<!--//trust_asc_left-->
<div class="trust_safety_right">
<div style=" height:40px; width:100%;"></div>
<div class="trust_safety_title">隐私保护</div>
<div class="trust_safety_message">淘金山有严格的客户信息操作规范，从流程上确保客户隐私安全。未经您的同意，我们永不会向任何第三方公司、组织和个人泄漏您的个人信息、账户信息以及交易信息（法律法规另有规定的除外）。</div>
<div style=" height:30px; width:100%;"></div>
<div class="trust_safety_message" style="color:#418ac7;">淘金山员工保密协议<br />客户个人信息保护规定</div>

</div>
<!--//trust_asc_right-->
<div class="clearfloat"></div>
<div style=" height:20px; width:100%;"></div>
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->
<!--  
</div>
-->
<!-- 信息安全保障 结束-->

<div class="clearfloat"></div>


<%@ include file="/views/web/footer.jsp"%>
</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
function selectTag(showContent,selfObj){
	// 
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
}
</SCRIPT>
</body>
</html>
