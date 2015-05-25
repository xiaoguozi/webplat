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
<link href="assets/css/ui/taojinshan.css" rel="stylesheet"
	media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

<!--私募页面样式-->
<link href="assets/css/ui/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/scripts-bottom-min.js"></script>

<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>

</head>

<body>

	<div class="home_all">

		<%@ include file="/views/web/header.jsp"%>
		<!-- /header_top -->

		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
				<div class="logo_wrap">
					<a href="#"> <img
						src="assets/img/ui/tjs_logo.png" width="338" height="94"
						align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu menu">
					<ul>
						<li><a href="rest/web/pe/peIndex"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct"><span class="simu_on">私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexRate"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="" class="path_item">私募</a><span
					class="sep">&gt;</span> <a href="" class="path_item">私募产品</a> <span
					class="sep">&gt;</span> <span class="txt">私募产品对比</span>
			</div>
		</div>

		<!-- 私募对比 -->
	      <div class="tjs_1108px center">
	       <div  class="mod_left_item simu_side_nav_box">
	        <div class="left_hd clearfix"> <span class="txt"> <em class="ui_titico ui_titico_6"><img src="assets/img/ui2/zoushi.png" style="margin-top:10px;" alt="" /></em>收益大比拼 </span> </div>
	        <div class="simu_detailwrap_2 simu_detailwrap">
	          <div class="sub_item">
	            <div class="sub_hd">历史收益对比</div>
	            <div class="sub_bd_1">
	              <table class="detail_tb_2 tjstbl" style="margin-top:30px;" width="80%">
	                <thead>
	                  <tr>
	                  	<td>&nbsp;</td>
	                  	<td>今年以来</td>
	                  	<td>年化收益</td>
	                  	<c:forEach items="${maxYearList}" var="maxYear">
	                  		<td >${maxYear.netYear}年</td>
	                  	</c:forEach>
	                  </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${lstYearAll}" varStatus="status" var="yearList">
	                		<tr >
		                		<td class="f_090"><a href="rest/web/pe/peIndexProductDetail?peProductId=${yearList[0].id}" target="_blank">${yearList[0].name}</a></td>
		                		<td>
		                			${yearList[0].timeRate}${yearVO.timeRate!=null?'%':''}
		                		</td>
		                		<td>
		                			${yearList[status.index].yearRate}${yearList[status.index].yearRate!=null?'%':''}
		                		</td>
		                		
		                		<c:forEach items="${yearList}" var="yearVO">
		                			<td>
		                				 ${yearVO.timeRate}${yearVO.timeRate!=null?'%':''}
		                			</td>
		                		</c:forEach>
		                		
	                		</tr>
	                	</c:forEach>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="sub_item" style="display:none;">
	            <div class="sub_hd">净值走势对比</div>
	            <div class="sub_bd_1">
	                <img src="assets/img/ui2/zoushi.jpg" alt="Alternate Text" />
	            </div>
	          </div>
	        </div>
	        <div class="left_hd clearfix border_color_blue"><span class="txt txtcolor" > <em class="ui_titico ui_titico_6" ><img src="assets/img/ui2/stact.png" style="margin-top:4px;" alt="" /></em>私募全面对比</span> </div>
	           <table class="tjs_tbl_compare_all">
	               <thead>
	                   <tr>
	                       <td></td>
	                       <td class="tdbgcolor pos_r"><span class="product_title_color">${lstYearAll[0][0].name}</span></td>
	                       <td class="pos_r"><span class="product_title_color">${lstYearAll[1][0].name}</span></td>
	                       <c:if test="${fn:length(lstYearAll)==3}">
		                       <td class="tdbgcolor pos_r"><span class="product_addtitle_color">${lstYearAll[2][0].name}</span></td>
	                       </c:if>
	                       <c:if test="${fn:length(lstYearAll)==2}">
		                       <td class="tdbgcolor pos_r"><span class="product_addtitle_color"></span></td>
	                       </c:if>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                       <td class="tjs_tbl_compare_all_tb1 txt_align_left"><b class="bfont_color">基金净值</b></td>
	                       <td>${lstYearAll[0][0].netWorth}</td><td>${lstYearAll[1][0].netWorth}</td>
	                       <td>
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].netWorth}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">最新净值:</span></td>
	                       <td class="tdbgcolor">${lstYearAll[0][0].nowRate}</td><td>${lstYearAll[1][0].nowRate}</td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].nowRate}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">累计净值:</span></td>
	                       <td class="tdbgcolor">${lstYearAll[0][0].accumulatedIncome}</td><td>${lstYearAll[1][0].accumulatedIncome}</td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].accumulatedIncome}
	                       		</c:if>
	                       	</td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">运行时长:</span></td>
	                       <td class="tdbgcolor">${lstYearAll[0][0].runTime}</td><td>${lstYearAll[1][0].runTime}</td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].runTime}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金费用</b></td>
	                       <td></td><td></td><td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金风险</b></td>
	                       <td></td><td></td><td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">基金类型：</span></td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${lstYearAll[0][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==8}">其他</c:if>
	                       	</td>
	                       <td><c:if test="${lstYearAll[1][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==8}">其他</c:if></td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			<c:if test="${lstYearAll[2][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==8}">其他</c:if>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金经理</b></td>
	                       <td></td>
	                       <td></td>
	                       <td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">基金经理：</span></td>
	                       <td class="tdbgcolor txt_fcolor">${lstYearAll[0][0].managerName}</td>
	                       <td class="txt_fcolor">${lstYearAll[1][0].managerName}</td>
	                       <td class="tdbgcolor txt_fcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].managerName}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">管理产品数：</span></td>
	                       <td class="tdbgcolor">${lstYearAll[0][0].manageFund}</td>
	                       <td>${lstYearAll[1][0].manageFund}</td>
	                       <td class="tdbgcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].manageFund}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">产品赢利占比：</span></td>
	                       <td class="tdbgcolor"></td><td></td><td class="tdbgcolor"></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">所在公司：</span></td>
	                       <td class="tdbgcolor txt_zcolor">${lstYearAll[0][0].companyName}</td>
	                       <td class="txt_zcolor">${lstYearAll[1][0].companyName}</td>
	                       <td class="tdbgcolor txt_zcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].companyName}
	                       		</c:if>
	                       </td>
	                   </tr>
	               </tbody>
	           </table>
	  </div>
	
	  </div>		
		

		<div class="clear"></div>


		<%@ include file="/views/web/footer.jsp"%>
	</div>

	<!-- /home_all -->
	<script>
		
        
    </script>




</body>
</html>




















