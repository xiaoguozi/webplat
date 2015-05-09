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
<link href="assets/css/ui/public.css" rel="stylesheet" />
 <script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>

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
    <li><a href="rest/web/xintuo/trust/trustProduct" target="_blank" >信托产品</a></li>
    <li><a href="rest/web/xintuo/trust/trustCompany"><span class="simu_on">信托公司</span></a></li>
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
<c:forEach items="${productXtgsIndex}" var="xtgs" varStatus="status" >
<div class="tjs_cpy_unit  <c:if test='${status.index!=3}'>tjs_right_1pxdashed</c:if>">
<div class="tjs_cpy_icodiv"> <a href="company_profile.html"><img src="assets/img/ui/img_005.png" width="106" height="95"  class="tjs_cpy_logoimg"/></a></div>
<div class="tjs_cpy_textdiv">股东背景：<span style="color:#333">${xtgs.xgtsGsxz}</span><br /><br />   注册资本：<span style="color:#333"><fmt:formatNumber value="${xtgs.xgtsZczb}" pattern="#0.####"/>万</span><br /><br />    管理规模：<span style="color:#333">${xtgs.xgtsZcglgm}</span><br />
</div>
</div>
</c:forEach>
<!-- /tjs_right_unit 01 -->



<!-- /tjs_right_unit 04 -->
<div class="clearfloat"></div>

</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 精选推荐 结束-->


<div  style=" height:26px; width:100%;"></div>
<!-- 信托公司开始 -->
<form id="modalForm" action="rest/web/xintuo/trust/trustCompany" method="post" >
<input name="sortField" type="hidden" value="${xintuoGsCtrlModel.sortField }"/>
<input name="sortType" type="hidden" value="${xintuoGsCtrlModel.sortType}"/>
<input name="pageNo" type="hidden" value="${xintuoGsCtrlModel.pageNo}"/>
<input name="pageSize" type="hidden" value="${xintuoGsCtrlModel.pageSize }"/>
<div class="tjs_1108px center">
<div class="tjs_cpy_title ">全部信托公司</div>
<div class="tjs_cpy_searchdiv"><input name="keyWord"  type="text"  value="${xintuoGsCtrlModel.keyWord}" onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}" class="tjst_pct_search" placeholder="请输入关键字"><a href="#"><img src="assets/img/ui/search_ico.png" width="33" height="33" style="float:left"></a></div>
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
  
  <c:forEach items="${lstProductXtgs}" var="ProductXtgs" varStatus="status">
  <tr <c:if test="${status.index%2==0}"> class="tjs_cpy_evenbg"</c:if>>
    <td height="50"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" align="right"><a href="company_profile.html"><img src="assets/img/ui/company_ico01.png" alt="${ProductXtgs.xgtsSplname }" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a title="${ProductXtgs.xgtsSplname }" href="#">${ProductXtgs.xgtsSplname }</a></td>
  </tr>
</table></td>
    <td align="right"><span style="color:#FF6600;">${ProductXtgs.xgtsPjsyl }%</span></td>
    <td align="right">${ProductXtgs.xgtsCpdfbl }％</td>
    <td align="right"><fmt:formatNumber value="${ProductXtgs.xgtsZczb}" pattern="#0.####"/></td>
    <td align="center">${ProductXtgs.xgtsGsxz}</td>
    <td align="center">${ProductXtgs.xgtsFrdb}</td>
    <td align="center">${ProductXtgs.xgtsCity}</td>
    <td align="center"><fmt:formatDate value="${ProductXtgs.xgtsCreatedate}" pattern="yyyy-MM-dd"/></td>
  </tr> 
</c:forEach>
   
</table>

</div>
<!-- //tjs_product_search -->


<!-- 翻页开始 -->
<div class="pages pgbtn">
    <table class=pagetb cellspacing=0>
      <tbody>
        <tr>
        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${xintuoGsCtrlModel.pageNo-1}"><</a></td>
        <c:forEach var="item" varStatus="status" begin="1" end="${xintuoGsCtrlModel.totalPageSize}">             
        <c:choose>  
          <c:when test="${status.index==xintuoGsCtrlModel.pageNo }"> 
           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
          </c:when> 
          <c:otherwise>
          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
          </c:otherwise> 
        </c:choose>             
        </c:forEach>
        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${xintuoGsCtrlModel.pageNo+1}">></a></td>
        <td class=pagnum><a title=最前一页 href="#" page_no="${xintuoGsCtrlModel.totalPageSize}">>|</a></td>          
        </tr>
      </tbody>
    </table>
  </div>
 <!-- 翻页结束 -->
</div>
</form>
<!-- 信托产品结束 -->


<div class="clearfloat"></div>
<div style=" height:26px; width:100%;"></div>

<%@ include file="/views/web/footer.jsp"%>

</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>

$(function () {                    
    $(".pagnum a").click(function(event){
    	event.preventDefault();
        $("input[name=pageNo]").val($(this).attr("page_no"));
    	//获取查询条件  	    	    	
    	$("#modalForm").submit();

    });
    
    $(".tjs_cpy_searchdiv a").click(function(event){
    	event.preventDefault();
    	//获取查询条件  	    	    	
    	$("#modalForm").submit();

    });
    
  
    		       
}); 


</SCRIPT>
</body>
</html>
