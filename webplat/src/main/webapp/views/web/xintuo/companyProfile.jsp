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
<title>五矿信托公司</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />

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

     <div class="logo_wrap"><a href="#"><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li><a href="rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li><a href="#" target="_blank">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="#">首页</a> > <a href="rest/web/xintuo/trust/trustCompany" target="_blank" >信托公司</a> > 五矿信托公司</div></div>

<!-- 产品基本信息 开始-->

<div class="tjs_1108px center">
<div style=" height:30px; width:100%;"></div>

<div class="tjs_pfe_box tjs_234border">
<div class="tjs_product_coloreddiv"></div>

<div class="tjs_pfe_title center"><span class="tjs_pfe_img"><img src="assets/img/ui/img_005.png" width="32" height="32" /></span>${productXtgs.xgtsSplname}</div>
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
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">英文名称：</td>
      <td colspan="3" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsEnname}</td>
  </tr>
  <tr>
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">成立日期：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg"><fmt:formatDate value="${productXtgs.xgtsCreatedate}" pattern="yyyy"/></td>
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
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">总经理：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg">${productXtgs.xgtsEnname}</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">法人代表：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_textevenbg">${productXtgs.xgtsFrdb}</td>
  </tr>
  <tr class="even">
      <td height="50" bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">大股东：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">${productXtgs.xgtsDgd}</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg">是否上市：</td>
      <td bgcolor="#FFFFFF" class="tjs_pcs_titleevenbg"><c:if test="${productXtgs.xgtsSs== '1'}">是</c:if><c:if test="${productXtgs.xgtsSs== '2'}">否</c:if></td>
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
<div class="tjs_trust_content tjs_bg_gray">

<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="images/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width320px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">五矿信托-通黔四号</a></div>
<div class="tjs_trust_bonus">返现 ￥6000</div>
<div class="tjs_trust_contentdiv">受托经营国务院有关部门批准证券承销业务</div>
</div>
<div class="tjs_float_left tjs_width270px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">100万</span><br />
投资期限：<span style="color:#666;">10个月</span><br />
投资方向：<span style="color:#666;">基础设施</span></div>
</div>
<div class="tjs_float_left tjs_width340px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px">8</span>.30%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>

</div>
<!--//tjs_trust_content 1 div-->	

<div class="tjs_trust_content">

<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="images/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width320px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">五矿信托-通黔四号</a></div>
<div class="tjs_trust_bonus">返现 ￥6000</div>
<div class="tjs_trust_contentdiv">受托经营国务院有关部门批准证券承销业务</div>
</div>
<div class="tjs_float_left tjs_width270px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">100万</span><br />
投资期限：<span style="color:#666;">10个月</span><br />
投资方向：<span style="color:#666;">基础设施</span></div>
</div>
<div class="tjs_float_left tjs_width340px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px">12</span>.60%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>

</div>
<!--//tjs_trust_content 2 div-->

<div class="tjs_trust_content tjs_bg_gray">

<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="images/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width320px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">五矿信托-通黔四号</a></div>
<div class="tjs_trust_bonus">返现 ￥6000</div>
<div class="tjs_trust_contentdiv">受托经营国务院有关部门批准证券承销业务</div>
</div>
<div class="tjs_float_left tjs_width270px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">100万</span><br />
投资期限：<span style="color:#666;">10个月</span><br />
投资方向：<span style="color:#666;">基础设施</span></div>
</div>
<div class="tjs_float_left tjs_width340px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px">6</span>.20%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>

</div>
<!--//tjs_trust_content 3 div-->	

<div class="tjs_trust_content">

<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="images/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width320px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">五矿信托-通黔四号</a></div>
<div class="tjs_trust_bonus">返现 ￥6000</div>
<div class="tjs_trust_contentdiv">受托经营国务院有关部门批准证券承销业务</div>
</div>
<div class="tjs_float_left tjs_width270px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">100万</span><br />
投资期限：<span style="color:#666;">10个月</span><br />
投资方向：<span style="color:#666;">基础设施</span></div>
</div>
<div class="tjs_float_left tjs_width340px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px">10</span>.50%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>

</div>
<!--//tjs_trust_content 4 div-->	
</div>
<!--//tjs_trust_tabbox div-->	

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
 <span style=" color:#9d9d9d;">或拨打4000-181-131</span>
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





<div class="tjs_footer_div">
<div style=" height:6px; font-size:0px; width:100%; background-color:#959494;"></div>
<div class="tjs_1108px center">
<div class="tjs_footer_copyrightdiv">
<ul>
<li class="tjs_2_border">
<span style="height:45px;display:inline-block;">关于我们</span><br />
<a href="#">公司介绍</a><br />
<a href="#">股东背景</a><br />
<a href="#">媒体报道</a><br />
<a href="#">最新动态</a><br />
</li>
<li class="tjs_2_border">
<span style="height:45px;display:inline-block;">帮助中心</span><br />
<a href="#">新手入门</a><br />
<a href="#">理财问答</a><br />
<a href="#">使用帮助</a><br />
</li>
<li class="tjs_2_border">
<span style="height:50px;display:inline-block;">关注我们</span><br />
<a href="#" class="tjs_footer_sns"><br /><br /><span>&nbsp;腾讯微博</span></a>&nbsp;
<a href="#" class="tjs_footer_sina"><br /><br /><span>&nbsp;新浪微博</span></a>&nbsp;
<a href="#" class="tjs_footer_blog"><br /><br /><span>&nbsp;腾讯微博</span></a>
</li>
<li>
<span style="height:40px;display:inline-block;">客服热线</span><br />
<span class="tjs_service_ico"></span><span style=" float:left;height:40px; line-height:40px;display:inline-block; color:#999;">400-888-896</span><br />
<span style="height:46px; line-height:50px;display:inline-block;">在线咨询</span><br />
<a href="#" class="tjs_footer_qq">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>在线咨询</span></a><span style="font-size:14px; color:#999;">08:00 - 23:00</span>
</li>
</ul>
</div>
<!-- /tjs_footer_copyrightdiv -->

<div class="tjs_footer_copyrightcontent"> <a href="#">商务合作</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">加入我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">免责声明</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">意见反馈</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">友情链接</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站地图</a><br />
淘金山互联网在线理财  版权所有 &copy; 2015-2018   粤ICP备 12068806号-1<br />投资有风险，理财需谨慎 

</div>
</div>
<!-- /footer tjs_1108px -->
</div>
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
