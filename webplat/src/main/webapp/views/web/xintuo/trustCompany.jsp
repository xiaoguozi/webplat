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
<title>淘金山——信托公司</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />

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

     <div class="logo_wrap"><a href="index.html"><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li><a href="rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li><a href="rest/web/xintuo/trust/trustCompany">信托公司</a></li>
    <li><a href="#">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->




<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="index.html">首页</a> > <a href="#">信托公司</a></div></div>

<!-- 精选推荐 开始-->

<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div class="tjs_recommend_title tjs_company_trustico">热门信托公司</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>

<div class="tjs_cpy_typle">
<div class="tjs_cpy_unit tjs_right_1pxdashed">
<div class="tjs_cpy_icodiv"> <a href="company_profile.html"><img src="assets/img/ui/img_005.png" width="106" height="95"  class="tjs_cpy_logoimg"/></a></div>
<div class="tjs_cpy_textdiv">股东背景：<span style="color:#333">中央企业控股</span><br /><br />   注册资本：<span style="color:#333">600000万</span><br /><br />    管理规模：<span style="color:#333">4785亿</span><br />
</div>
</div>
<!-- /tjs_right_unit 01 -->

<div class="tjs_cpy_unit tjs_right_1pxdashed">
<div class="tjs_cpy_icodiv"> <a href="company_profile.html"><img src="assets/img/ui/img_006.png" width="106" height="95"  class="tjs_cpy_logoimg"/></a></div>
<div class="tjs_cpy_textdiv">股东背景：<span style="color:#333">中央企业控股</span><br /><br />   注册资本：<span style="color:#333">600000万</span><br /><br />    管理规模：<span style="color:#333">4785亿</span><br />
</div>
</div>
<!-- /tjs_right_unit 02 -->
<div class="tjs_cpy_unit tjs_right_1pxdashed">
<div class="tjs_cpy_icodiv"> <a href="company_profile.html"><img src="assets/img/ui/img_007.png" width="106" height="95"  class="tjs_cpy_logoimg"/></a></div>
<div class="tjs_cpy_textdiv">股东背景：<span style="color:#333">中央企业控股</span><br /><br />   注册资本：<span style="color:#333">600000万</span><br /><br />    管理规模：<span style="color:#333">4785亿</span><br />
</div>
</div>
<!-- /tjs_right_unit 03 -->

<div class="tjs_cpy_unit">
<div class="tjs_cpy_icodiv"> <a href="company_profile.html"><img src="assets/img/ui/img_008.png" width="106" height="95"  class="tjs_cpy_logoimg"/></a></div>
<div class="tjs_cpy_textdiv">股东背景：<span style="color:#333">中央企业控股</span><br /><br />   注册资本：<span style="color:#333">600000万</span><br /><br />    管理规模：<span style="color:#333">4785亿</span><br />
</div>
</div>
<!-- /tjs_right_unit 04 -->
<div class="clearfloat"></div>

</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 精选推荐 结束-->


<div  style=" height:26px; width:100%;"></div>
<!-- 信托公司开始 -->
<div class="tjs_1108px center">
<div class="tjs_cpy_title ">全部信托公司</div>
<div class="tjs_cpy_searchdiv"><input name="keyword"  type="text"  value="请输入关键字" onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}" class="tjst_pct_search"><a href="#"><img src="assets/img/ui/search_ico.png" width="33" height="33" style="float:left"></a></div>
<div class="clearfloat"></div>

<div class="tjs_product_coloreddiv"></div>
<div class="tjs_product_search">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tjs_cpy_table">
  <tr>
    <td width="20%" height="50" align="center" class="tjs_cpy_tabletitle_div">公司简称</td>
    <td width="10%" align="right" class="tjs_cpy_tabletitle_div">平均收益率</td>
    <td width="10%" align="right" class="tjs_cpy_tabletitle_div">产品兑付比例</td>
    <td width="12%" align="right" class="tjs_cpy_tabletitle_div">注册资本（万元）</td>
    <td width="16%" align="center" class="tjs_cpy_tabletitle_div">股东背景</td>
    <td width="10%" align="center" class="tjs_cpy_tabletitle_div">法人代表</td>
    <td width="10%" align="center" class="tjs_cpy_tabletitle_div">所在地区</td>
    <td align="center" class="tjs_cpy_tabletitle_div">成立时间</td>
  </tr>
  <tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
 <tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
  <tr class="tjs_cpy_evenbg">
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr>
<tr>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="某某信托公司" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="某某信托公司" href="#">银象168号</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">7.28%</span></td>
    <td align="right">100％</td>
    <td align="right">698800</td>
    <td align="center">金融机构控股</td>
    <td align="center">周辉</td>
    <td align="center">深圳</td>
    <td align="center">2015-05-01</td>
  </tr> 
</table>

</div>
<!-- //tjs_product_search -->


<!-- 翻页开始 -->
<div class="pages pgbtn">
    <table class=pagetb cellspacing=0>
      <tbody>
        <tr>
        <td class=pagnum><a title=最前一页 href="#">|<</a></td>
        <td class=pagnum><a class=currentpg title=上一页 href="#"><</a></td>
          <td class=pagnum><a class=currentpg title=当前页 
      href="#" id="pagnum_click">1</a></td>
          <td class=pagnum><a title=第2页 
      href="#">2</a></td>
          <td class=pagnum><a title=第3页 
      href="#">3</a></td>
          <td class=pagnum><a title=第4页 
      href="#">4</a></td>
          <td class=pagnum><a title=第5页 
      href="http#">5</a></td>
          <td class=pagnum><a title=第6页 
      href="#">6</a></td>
          <td class=pagnum><a title=第7页 
      href="#">7</a></td>
      <td class=pagnum><a class=currentpg title=下一页 href="#">></a></td>
      <td class=pagnum><a title=最前一页 href="#">>|</a></td>
        </tr>
      </tbody>
    </table>
  </div>
 <!-- 翻页结束 -->
</div>
<!-- 信托产品结束 -->


<div class="clearfloat"></div>
<div style=" height:26px; width:100%;"></div>

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
