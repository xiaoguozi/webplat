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
<meta name="keywords" content="信托理财产品，信托理财产品收益率，信托理财产品查询" />
<meta name="description" content="找信托理财产品上淘金山，为您提供信托理财产品收益率列表，信托理财产品查询，帮助您选出最适合自己信托产品，并完成购买信托产品。" />
<title>信托排名，信托产品收益对比分析-淘金山信托</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet"
	media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

<!--私募页面样式-->
<link href="assets/css/ui/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>

</head>

<body>

	<div class="home_all">

		<%@ include file="/views/web/header.jsp"%>
		
		<!-- /header_top -->
		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
			
		     <div class="logo_wrap"><a href=""><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
		    <div class="top_wrap_menu">
		    <ul>
		    <li style="width:155px"><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
		    <li style="width:155px"><a href="rest/web/xintuo/trust/trustProduct" ><span class="simu_on">信托产品</span></a></li>
		    <li style="width:155px"><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
		    <li style="width:155px"><a href="rest/web/xintuo/trust/trustSafeguard">安全保障</a></li>
		
		    </ul>
		    </div>    
		  </div>
		</div>
		<!-- /header_menu -->
		
		
		<div class="tjs_trust_positiondiv"> 
			<div class="tjs_1108px center">当前位置： <a href="">首页</a> &gt; 
			<a href="rest/web/xintuo/trust/trustIndex">信托</a>&gt;
			<a href="rest/web/xintuo/trust/trustProduct">信托产品</a>&gt;
			信托对比</div>
		</div>


		<!-- 私募对比 -->
	      <div class="tjs_1108px center">
	       <div  class="mod_left_item simu_side_nav_box">
	       
	       	<div class="left_hd clearfix border_color_blue" ><span class="txt txtcolor" > <em class="ui_titico ui_titico_6" ><img src="assets/img/ui2/stact.png" style="margin-top:4px;" alt="" /></em>信托全面对比</span> </div>
	           <table class="tjs_tbl_compare_all" >
	           		<thead>
	                   <tr>
	                       <td></td>
	                       <td class="tdbgcolor pos_r"><span class="product_title_color">${lstProduct[0].xtcpSplname}</span></td>
	                       <td class="pos_r"><span class="product_title_color">${lstProduct[1].xtcpSplname}</span></td>
	                       <c:if test="${fn:length(lstProduct)==3}">
		                       <td class="tdbgcolor pos_r"><span class="product_title_color">${lstProduct[2].xtcpSplname}</span></td>
	                       </c:if>
	                       <c:if test="${fn:length(lstProduct)==2}">
		                       <td class="tdbgcolor pos_r"><span class="product_title_color"></span></td>
	                       </c:if>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                       <td class="tjs_tbl_compare_all_tb1 txt_align_left"><b class="bfont_color">产品概况</b></td>
	                       <td></td>
	                       <td></td>
	                       <td>
	                       		
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">信托全称:</span></td>
	                       <td class="tdbgcolor" style="color: #000; text-align:left;">${lstProduct[0].xtcpFullname}</td>
	                       <td style="color: #000;text-align:left;">${lstProduct[1].xtcpFullname}</td>
	                       <td class="tdbgcolor" style="color: #000; text-align:left;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpFullname}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">信托公司:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpGszhname}</td><td style="color: #000;">${lstProduct[1].xtcpGszhname}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpGszhname}
	                       		</c:if>
	                       	</td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">预计发行规模:</span></td>
	                       <td class="tdbgcolor" style="color: #000;"><fmt:formatNumber value="${lstProduct[0].xtcpFxgm}" pattern="#0.####"/>万</td><td style="color: #000;"><fmt:formatNumber value="${lstProduct[1].xtcpFxgm}" pattern="#0.####"/>万</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			<fmt:formatNumber value="${lstProduct[2].xtcpFxgm}" pattern="#0.####"/>万
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                    <tr>
	                       <td class="txt_align_left"><span class="sfont_color">预期年收益率:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpNsyl}%</td><td style="color: #000;">${lstProduct[1].xtcpNsyl}%</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpNsyl}%
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                    <tr>
	                       <td class="txt_align_left"><span class="sfont_color">付息方式:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:choose>  
					                <c:when test="${lstProduct[0].xtcpLxfp=='10'}">  
					                  		 按月付息
					                </c:when>
					                 <c:when test="${lstProduct[0].xtcpLxfp=='20'}">  
					                  		  按季付息
					                </c:when>
					                 <c:when test="${lstProduct[0].xtcpLxfp=='30'}">  
					                  		  半年付息 
					                </c:when> 
					                 <c:when test="${lstProduct[0].xtcpLxfp=='40'}">  
					                  		 按年付息
					                </c:when> 
					                 <c:when test="${lstProduct[0].xtcpLxfp=='50'}">  
					                  		 到期付息
					                </c:when>     
					                <c:otherwise>  
					                     	其他
					                </c:otherwise>  
					            </c:choose>
	                       </td>
	                       <td style="color: #000;">
	                       			<c:choose>  
						                <c:when test="${lstProduct[1].xtcpLxfp=='10'}">  
						                  		 按月付息
						                </c:when>
						                 <c:when test="${lstProduct[1].xtcpLxfp=='20'}">  
						                  		  按季付息
						                </c:when>
						                 <c:when test="${lstProduct[1].xtcpLxfp=='30'}">  
						                  		  半年付息 
						                </c:when> 
						                 <c:when test="${lstProduct[1].xtcpLxfp=='40'}">  
						                  		 按年付息
						                </c:when> 
						                 <c:when test="${lstProduct[1].xtcpLxfp=='50'}">  
						                  		 到期付息
						                </c:when>     
						                <c:otherwise>  
						                     	其他
						                </c:otherwise>  
						            </c:choose>
	                       </td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       				<c:choose>  
							                <c:when test="${lstProduct[2].xtcpLxfp=='10'}">  
							                  		 按月付息
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpLxfp=='20'}">  
							                  		  按季付息
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpLxfp=='30'}">  
							                  		  半年付息 
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpLxfp=='40'}">  
							                  		 按年付息
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpLxfp=='50'}">  
							                  		 到期付息
							                </c:when>     
							                <c:otherwise>  
							                     	其他
							                </c:otherwise>  
							            </c:choose>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">存续期:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpCxq} 个月</td>
	                       <td style="color: #000;">${lstProduct[1].xtcpCxq} 个月</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpCxq} 个月
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">投资方式:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">
						   			<c:choose>  
						                <c:when test="${lstProduct[0].xtcpTzfs=='10'}">  
						                  		信托贷款
						                </c:when>
						                 <c:when test="${lstProduct[0].xtcpTzfs=='20'}">  
						                  		  股权投资
						                </c:when>
						                 <c:when test="${lstProduct[0].xtcpTzfs=='30'}">  
						                  		  权益投资  
						                </c:when> 
						                 <c:when test="${lstProduct[0].xtcpTzfs=='40'}">  
						                  		组合运用 
						                </c:when> 
						                 <c:when test="${lstProduct[0].xtcpTzfs=='50'}">  
						                  		 债券投资
						                </c:when>
						                 <c:when test="${lstProduct[0].xtcpTzfs=='60'}">  
						                  		 其他投资 
						                </c:when>       
						                <c:otherwise>  
						                     	其他
						                </c:otherwise>  
						            </c:choose>
						   </td>
	                       <td style="color: #000;">
								<c:choose>  
						                <c:when test="${lstProduct[1].xtcpTzfs=='10'}">  
						                  		信托贷款
						                </c:when>
						                 <c:when test="${lstProduct[1].xtcpTzfs=='20'}">  
						                  		  股权投资
						                </c:when>
						                 <c:when test="${lstProduct[1].xtcpTzfs=='30'}">  
						                  		  权益投资  
						                </c:when> 
						                 <c:when test="${lstProduct[1].xtcpTzfs=='40'}">  
						                  		组合运用 
						                </c:when> 
						                 <c:when test="${lstProduct[1].xtcpTzfs=='50'}">  
						                  		 债券投资
						                </c:when>
						                 <c:when test="${lstProduct[1].xtcpTzfs=='60'}">  
						                  		 其他投资 
						                </c:when>       
						                <c:otherwise>  
						                     	其他
						                </c:otherwise>  
						            </c:choose>
						   </td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			<c:if test="${fn:length(lstProduct)==3}">
		                       			<c:choose>  
							                <c:when test="${lstProduct[2].xtcpTzfs=='10'}">  
							                  		信托贷款
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpTzfs=='20'}">  
							                  		  股权投资
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpTzfs=='30'}">  
							                  		  权益投资  
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpTzfs=='40'}">  
							                  		组合运用 
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpTzfs=='50'}">  
							                  		 债券投资
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpTzfs=='60'}">  
							                  		 其他投资 
							                </c:when>       
							                <c:otherwise>  
							                     	其他
							                </c:otherwise>  
							            </c:choose>
		                       		</c:if>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">最低认购金额:</span></td>
	                       <td class="tdbgcolor" style="color: #000;"><fmt:formatNumber value="${lstProduct[0].xtcpZdrgje}" pattern="#0.####"/>万</td>
	                       <td style="color: #000;"><fmt:formatNumber value="${lstProduct[1].xtcpZdrgje}" pattern="#0.####"/>万</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			<fmt:formatNumber value="${lstProduct[2].xtcpZdrgje}" pattern="#0.####"/>万
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">抵押率:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpDyl}</td>
	                       <td style="color: #000;">${lstProduct[1].xtcpDyl}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpDyl}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">投资领域:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:choose>  
					                <c:when test="${lstProduct[0].xtcpTzly=='10'}">  
					                  		房地产
					                </c:when>
					                 <c:when test="${lstProduct[0].xtcpTzly=='20'}">  
					                  		  金融
					                </c:when>
					                 <c:when test="${lstProduct[0].xtcpTzly=='30'}">  
					                  		基础设施  
					                </c:when> 
					                 <c:when test="${lstProduct[0].xtcpTzly=='40'}">  
					                  		工商企业
					                </c:when> 
					                 <c:when test="${lstProduct[0].xtcpTzly=='50'}">  
					                  		其他
					                </c:when>                 
					                <c:otherwise>  
					                     	其他
					                </c:otherwise>  
					            </c:choose>
					       </td>
	                       <td style="color: #000;">
								<c:choose>  
					                <c:when test="${lstProduct[1].xtcpTzly=='10'}">  
					                  		房地产
					                </c:when>
					                 <c:when test="${lstProduct[1].xtcpTzly=='20'}">  
					                  		  金融
					                </c:when>
					                 <c:when test="${lstProduct[1].xtcpTzly=='30'}">  
					                  		基础设施  
					                </c:when> 
					                 <c:when test="${lstProduct[1].xtcpTzly=='40'}">  
					                  		工商企业
					                </c:when> 
					                 <c:when test="${lstProduct[1].xtcpTzly=='50'}">  
					                  		其他
					                </c:when>                 
					                <c:otherwise>  
					                     	其他
					                </c:otherwise>  
					            </c:choose>
						   </td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       				<c:choose>  
							                <c:when test="${lstProduct[2].xtcpTzly=='10'}">  
							                  		房地产
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpTzly=='20'}">  
							                  		  金融
							                </c:when>
							                 <c:when test="${lstProduct[2].xtcpTzly=='30'}">  
							                  		基础设施  
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpTzly=='40'}">  
							                  		工商企业
							                </c:when> 
							                 <c:when test="${lstProduct[2].xtcpTzly=='50'}">  
							                  		其他
							                </c:when>                 
							                <c:otherwise>  
							                     	其他
							                </c:otherwise>  
							            </c:choose>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">抵押物:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpDyw}</td>
	                       <td style="color: #000;">${lstProduct[1].xtcpDyw}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpDyw}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">收益说明:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstProduct[0].xtcpSysm}</td>
	                       <td style="color: #000;">${lstProduct[1].xtcpSysm}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpSysm}
	                       		</c:if>
	                       </td>
	                   </tr>
	                  
	                   <tr>
	                       <td class="tjs_tbl_compare_all_tb1 txt_align_left"><b class="bfont_color">产品风控</b></td>
	                       <td></td>
	                       <td></td>
	                       <td>
	                       		
	                       </td>
	                   </tr>
	                  
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">资金用途:</span></td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left;vertical-align:top;">${lstProduct[0].xtcpZjyt}</td>
	                       <td style="color: #000;text-align:left;vertical-align:top;">${lstProduct[1].xtcpZjyt}</td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left;vertical-align:top;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpZjyt}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">风控措施:</span></td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left;vertical-align:top;">${lstProduct[0].xtcpFkcs}</td>
	                       <td style="color: #000;text-align:left;vertical-align:top;">${lstProduct[1].xtcpFkcs}</td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left;vertical-align:top;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpFkcs}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">还款来源:</span></td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left; vertical-align:top;">${lstProduct[0].xtcpHkly}</td>
	                       <td style="color: #000;text-align:left; vertical-align:top;">${lstProduct[1].xtcpHkly}</td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left; vertical-align:top;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpHkly}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">管理机构:</span></td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left; vertical-align:top;">${lstProduct[0].xtcpZcglr}</td>
	                       <td style="color: #000;text-align:left; vertical-align:top;">${lstProduct[1].xtcpZcglr}</td>
	                       <td class="tdbgcolor" style="color: #000;text-align:left;  vertical-align:top;">
	                       		<c:if test="${fn:length(lstProduct)==3}">
	                       			${lstProduct[2].xtcpZcglr}
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




















