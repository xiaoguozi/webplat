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
						<li><a href="rest/web/pe/peIndex" target="_blank"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexRate" target="_blank"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct" target="_blank"><span>私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span
								class="simu_on">私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item" >首页</a>
				<span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item" >私募</a><span
					class="sep">&gt;</span> <a href="rest/web/pe/peIndexManager" class="path_item" >私募经理</a> <span
					class="sep">&gt;</span> <span class="txt">全部私募经理</span>
			</div>
		</div>


		<!-- container -->

		<div class="tjs_1108px center">
			<div class="ml0" style="min-height: 300px;">
				<div class="tjs_right_titlediv fontcolor fontxuncolor">
					<img class="tjs_img_diamond" src="assets/img/ui2/xun.png" />明细私募经理
				</div>
				<div class="tjs_coloreddiv ml0 bgxuncolor"></div>
				
				<c:forEach items="${lstTopPeManager}" var="TopPeManager" varStatus="status">
				<table class="simujingli_box" <c:if test="${fn:length(lstTopPeManager)==(status.index+1)}">style="border-right:solid  1px #d3d3d3"</c:if>>
					<tr>
						<td colspan="2" class="simujingli_box_top bluecolor_font">
						<a href="rest/web/pe/peIndexMDetail?managerId=${TopPeManager.managerId}" target="_blank">${TopPeManager.managerName}</a>&nbsp;&nbsp;
						<a href="rest/web/pe/peIndexProductDetail?peProductId=${TopPeManager.productId}" target="_blank">
						${TopPeManager.productSimpleName}</a></td>
					</tr>
					<tr>
						<td class="font_tc pd_bottom">
						<a href="rest/web/pe/peIndexMDetail?managerId=${TopPeManager.managerId}" target="_blank"><img width="105"
							src="assets/img/simu/${TopPeManager.logo}" alt="" /></a></td>
						<td class="pd_left pd_bottom"><p>
								基金经理：<span class="bluecolor_font"><a href="rest/web/pe/peIndexMDetail?managerId=${TopPeManager.managerId}" target="_blank">${TopPeManager.managerName}</a></span>
							</p>
							<p>
								代&nbsp;表&nbsp;作：<span class="bluecolor_font"><a href="rest/web/pe/peIndexProductDetail?peProductId=${TopPeManager.productId}" target="_blank">${TopPeManager.productSimpleName}</a></span>
							</p>
							<p>
								累计收益<br />
								<span class="num_big"><fmt:formatNumber value="${TopPeManager.accumulatedIncome.intValue()}" pattern="#0"/>.</span><span class="small small_color"><fmt:formatNumber value="${TopPeManager.xtcpNsyl*100%100}" pattern="00"/>%</span>
							</p></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="br_top jingli_miaoxu" style="height:40px">
								<img style="vertical-align: middle" src="assets/img/ui2/dianping.png"
									alt="" />&nbsp;${TopPeManager.review}
							</div>
						</td>
					</tr>
				</table>
				</c:forEach>
				
				
				
				<div class="clear"></div>
				<form id="modalForm" action="rest/web/pe/peIndexManager" method="post" >
				<input name="sortField" type="hidden" value="${SearchCtrlModel.sortField }"/>
				<input name="sortType" type="hidden" value="${SearchCtrlModel.sortType}"/>
				<input name="pageNo" type="hidden" value="${SearchCtrlModel.pageNo}"/>
				<input name="pageSize" type="hidden" value="${SearchCtrlModel.pageSize }"/>
				<div class="tjs_right_titlediv fcolor">
					<img class="tjs_img_diamond" style="top: 10px;"src="assets/img/ui2/all.png" />
					全部私募经理<span style="display: block; position: relative; left: 115px; top: -40px;*left:130px;*top:-53px">
					<input name="keyWord" class="input_txt1" type="text" placeholder="请输入关键字" value="${SearchCtrlModel.keyWord }" />
					<a class="input_btn1" href=""><img src="assets/img/ui/searchbig.png" alt="" /></a></span>
				</div>
				<div class="simuchanpin_liebiao"></div>
				<table class="simu_pro_tb_2 tjs_simu_tbl font_color mg_bottom"
					width="100%">
					<thead>
						<tr>
							<td class="tjs_tbl_td_brm">基金经理</td>
							<td class="tjs_tbl_td_bm td_width">代表作品</td>
							<td class="tjs_tbl_td_brm"><a class="uc_sort"
								href="javascript:void(0)" sortField="accumulatedIncome" sortType="">累计收益<em></em></a></td>
							<td class="tjs_tbl_td_bm td_width">私募公司</td>
							<td class="tjs_tbl_td_bm"><a class="uc_sort"
								href="javascript:void(0)" sortField="manage_fund" sortType="">在售产品数<em></em></a></td>
							<td class="tjs_tbl_td_bm">从业年限</td>
							<td class="tjs_tbl_td_brm">从业背景</td>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${lstPeManager}" var="PeManager" varStatus="status">
						<tr>
							<td class="tjs_tbl_td_br"><a href="rest/web/pe/peIndexMDetail?managerId=${PeManager.managerId}" target="_blank"><span class="bluecolor_font">${PeManager.managerName}</a></span></td>
							<td><a href="rest/web/pe/peIndexProductDetail?peProductId=${PeManager.productId}" target="_blank">${PeManager.productSimpleName}</a></td>
							<td class="tjs_tbl_td_br"><fmt:formatNumber value="${PeManager.accumulatedIncome.intValue()}" pattern="###0.00"/>%</td>
							<td>${PeManager.companyName}</td>
							<td>${PeManager.manageFund}</td>
							<td>${PeManager.workYear}</td>
							<td>${PeManager.background}</td>
						</tr>						
						</c:forEach>
						
						
						<tr>
							<td colspan="13" class="foot_page">
							<!-- 翻页开始 -->
							<div class="pages pgbtn" id="divPages" style="margin-top: 2px;">
							    <table class=pagetb cellspacing=0>
							      <tbody>
							        <tr>
							        <td class=pagnum><a title=首页 href="#" page_no="1">|&lt;</a></td>
							        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${SearchCtrlModel.pageNo-1}"><</a></td>
							        
							        <c:if test="${SearchCtrlModel.totalPageSize<=9||(SearchCtrlModel.totalPageSize>9&&SearchCtrlModel.pageNo<=5)}">
							        	 <c:forEach var="item" varStatus="status" begin="1" end="${SearchCtrlModel.totalPageSize>9?9:SearchCtrlModel.totalPageSize}">             
									        <c:choose>  
									          <c:when test="${status.index==SearchCtrlModel.pageNo }"> 
									           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
									          </c:when> 
									          <c:otherwise>
									          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
									          </c:otherwise> 
									        </c:choose>             
							        </c:forEach>
							        </c:if>
							        
							        <c:if test="${SearchCtrlModel.totalPageSize>9&&SearchCtrlModel.pageNo>5&&SearchCtrlModel.totalPageSize>SearchCtrlModel.pageNo+4}">
							         <c:forEach var="item" varStatus="status" begin="${SearchCtrlModel.pageNo-4}" end="${SearchCtrlModel.pageNo+4}">             
								        <c:choose>  
								          <c:when test="${status.index==SearchCtrlModel.pageNo }"> 
								           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
								          </c:when> 
								          <c:otherwise>
								          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
								          </c:otherwise> 
								        </c:choose>             
							         </c:forEach>							        
							        </c:if>
							        
							        
							        <c:if test="${SearchCtrlModel.totalPageSize>9&&SearchCtrlModel.pageNo>5&&SearchCtrlModel.totalPageSize<=SearchCtrlModel.pageNo+4}">
							         <c:forEach var="item" varStatus="status" begin="${SearchCtrlModel.totalPageSize-8}" end="${SearchCtrlModel.totalPageSize}">             
								        <c:choose>  
								          <c:when test="${status.index==SearchCtrlModel.pageNo }"> 
								           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
								          </c:when> 
								          <c:otherwise>
								          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
								          </c:otherwise> 
								        </c:choose>             
							         </c:forEach>							        
							        </c:if>
							        
							      
							        
							        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${SearchCtrlModel.pageNo+1}">></a></td>
							        <td class=pagnum><a title=尾页 href="#" page_no="${SearchCtrlModel.totalPageSize}">&gt;|</a></td>          
							        </tr>
							      </tbody>
							    </table>
							  </div>
							</td>
						</tr>

					</tbody>
				</table>

			    </form>
			
			</div>

		</div>

		<div class="clear"></div>
		<!-- container end -->


		<%@ include file="/views/web/footer.jsp"%>
	</div>

	<!-- /home_all -->
<script type=text/javascript>

	$(function () { 
		        //--排行图标--
        $(".uc_sort").each(function (index) {
        	 if($(this).attr("sortField")=="${SearchCtrlModel.sortField}"){
              	if("${SearchCtrlModel.sortType}"=="asc"){
              		$(this).attr("sortType", "asc");
              		$(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
              		$(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
              	}else{
              		$(this).attr("sortType", "desc");
  	                $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
              	}
              }else{
              	 $(".uc_sort>em").addClass("sort_desc");
            }
        	  
            $(this).click(function () {
                var s = $(".uc_sort>em:eq(" + index + ")").hasClass("sort_desc");
                $(".uc_sort>em").removeClass("sort_d sort_u");
                $(".uc_sort>em").addClass("sort_desc");
                if (s) {
                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_desc sort_u");
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
                } else {
                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_d");
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
                }
                
               $("input[name=sortField]").val($(this).attr("sortField"));  
               
               if($(this).attr("sortType") == "desc"){
                 	$("input[name=sortType]").val("asc");
               }else{
                 	$("input[name=sortType]").val("desc");
               }
           	   $("#modalForm").submit();
              
            });

        })
        //--/排行图标--
        
       $(".pagnum a").click(function(event){
    	event.preventDefault();
        $("input[name=pageNo]").val($(this).attr("page_no"));
    	//获取查询条件  	    	    	
    	$("#modalForm").submit();
       });
		        
        $(".input_btn1").click(function(event){
        	event.preventDefault();          
        	//获取查询条件  	    	    	
        	$("#modalForm").submit();
           });
		        
		        
        
        
	});
        
    </script>




</body>
</html>




















