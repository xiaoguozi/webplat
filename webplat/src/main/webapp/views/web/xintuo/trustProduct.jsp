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
<title>淘金山——信托产品</title>
<link href="assets/css/ui/taojinshan.css?1=1" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />

 <script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<style>
body{ width:100%; height:100%;font-family: "Microsoft YaHei" !important;font-size: 14px; background-color:#f5f5f5;}
html{ width:100%; height:100%;background:#f5f5f5;}
a.tjs_condition_selected{ min-width:44px;width:auto !important;width:44px;-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; display: inline-block; height: 23px; background-color: #0280CC;border-radius: 4px;line-height: 23px;text-align:center;font-size: 14px;color: #FFF; border:none;cursor:pointer;}
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
    <li><a href="rest/web/xintuo/trust/trustProduct" ><span class="simu_on">信托产品</span></a></li>
    <li><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li><a href="rest/web/xintuo/trust/trustSafeguard">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="#">首页</a> > <a href="rest/web/xintuo/trust/trustProduct">信托产品</a></div></div>
<!-- 精选推荐 开始-->

<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div class="tjs_recommend_title tjs_recommend_trusticobg">精选推荐</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>

<div class="tjs_trust_typle">

<c:forEach items="${lstTopVos}" var="xintuotop" >
<div class="tjs_trust_unit tjs_right_1pxdashed">
<div class="tjs_right_icodiv">
<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_title">
  <tr>
    <td width="65" align="right"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}"><img src="assets/img/ui/${xintuotop.xtcpLog}" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<span><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}">${xintuotop.xtcpSplname}</a></span></td>
  </tr>

</div>
<div class="tjs_right_earningsdiv"><span class="tjs_font36px"><fmt:formatNumber value="${xintuotop.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuotop.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛：<fmt:formatNumber value="${xintuotop.xtcpZdrgje}" pattern="#0.####"/> 万 | 期限： ${xintuotop.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv" style="height:40px"> ${xintuotop.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn" data_id="${xintuotop.xtcpId}">立即预约</a></div>
</div>

</c:forEach>
<!-- /tjs_right_unit 04 -->
<div class="clearfloat"></div>

</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 精选推荐 结束-->






<div  style=" height:26px; width:100%;"></div>
<!-- 信托产品开始 -->
<div class="tjs_1108px center">
<div class="tjs_recommend_title tjs_product_allicobg">全部信托产品</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_product_coloreddiv"></div>
<div class="tjs_product_search">
<div style=" height:10px; width:100%; font-size:0px;"></div>
<ul>
<li><div class="tjs_condition_left">认购起点：</div><div class="tjs_condition_right" id="xtcpZdrgje"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="30万">30万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50" title="50万">50万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="100" title="100万">100万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="300" title="300万">300万</a></div></li>

<li><div class="tjs_condition_left">产品期限：</div><div class="tjs_condition_right" id="xtcpCxq"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="11" title="12个月以内">12个月以内</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="12" title="12个月">12个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="13" title="13-23个月">13-23个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="24" title="24个月">24个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="25" title="24个月以上">24个月以上</a></div></li>

<li><div class="tjs_condition_left">预期收益：</div><div class="tjs_condition_right" id="xtcpNsyl"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="7" title="8%以内">8%以内</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="8" title="8%-9.9%">8%-9.9%</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="10%-11.9%">10%-11.9%</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="12" title="12%及以上">12%及以上</a></div></li>

<li><div class="tjs_condition_left">付息方式： </div><div class="tjs_condition_right" id="xtcpLxfp"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="按月付息">按月付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="20" title="按季付息">按季付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="30" title="半年付息">半年付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="40" title="按年付息">按年付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="50" title="到期付息">到期付息</a></div></li>

<li><div class="tjs_condition_left">投资领域：</div><div class="tjs_condition_right" id="xtcpTzly"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="房地产">房地产</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20" title="金融">金融</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="基础设施">基础设施</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="40" title="工商企业">工商企业</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50"  title="其他">其他</a></div></li>

<li><div class="tjs_condition_left">项目所在地：</div><div class="tjs_condition_right" id="xtcpArea"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="珠三角">珠三角</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20" title="江浙沪">江浙沪</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="京津冀">京津冀</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50" title="其它地区">其它地区</a></div></li>

<li><div class="tjs_condition_left">信托公司： </div><div class="tjs_condition_right xtcpGsId" id="xtcpGsId">
<a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;
<c:forEach items="${lstProductXtgs}" var="productXtgs" end="5">
	<a class="tjs_condition_btn" href="#" tag="${productXtgs.xtgsId}"  title="${productXtgs.xgtsSplname}">${productXtgs.xgtsSplname}</a> 
</c:forEach>
<a href="#" class="more_condition">更多&gt;</a>
</div>
</li>
<li style="height:auto;display:none" class="xtcpGsId" id="more_gs_condition">
<div  class="tjs_condition_right" style="height:auto;width:80%;border: 1px solid #D3D3D3;" >
	<div class="">
		<ul class="">			          		
					<c:if test="${fn:length(lstProductXtgs)>6}">
					 <c:forEach items="${lstProductXtgs}" var="productXtgs" begin="6">					    
						<a class="tjs_condition_btn " href="#" tag="${productXtgs.xtgsId}" tagmore="1" style="width:90px"  title="${productXtgs.xgtsSplname}">${productXtgs.xgtsSplname}</a>						
					 </c:forEach>
				  </c:if>				
		</ul>
	</div>
</div>
</li>
</ul>
<form id="modalForm" action="rest/web/xintuo/trust/trustProduct" method="post" >
<div class="tjs_dashed_bottom tjst_height_32px" style="margin-top:4px;padding-top:0px;height:2px"></div>
<div class="tjst_height_50px tjs_dashed_bottom"><div class="tjs_search_left">信托公司： </div><div class="tjs_search_right"><input name="keyword"  type="text"  value="${xintuoSearVO.keyword}" placeholder="关键字"  class="tjst_pct_search"><a href="#"><img src="assets/img/ui/search_ico.png" width="33" height="33" style="float:left"></a></div></div>
<div class="tjst_height_50px tjs_bg_gray"><div class="tjs_search_left">已选条件： </div>
<div class="tjs_pct_right "><span class="searchCondition">

</span>
共 <span style="font-size:16px; color:#FF6600">${xintuoSearVO.totalCount}</span> 款产品满足条件&nbsp;&nbsp;&nbsp;&nbsp;
<a href="rest/web/xintuo/trust/trustProduct">清空条件</a></div></div>
</div>
<!-- //tjs_product_search -->


<div class="tjst_height_32px"></div>

<input name="sortField" type="hidden" value="${xintuoSearVO.sortField }"/>
<input name="sortType" type="hidden" value="${xintuoSearVO.sortType}"/>
<input name="pageNo" type="hidden" value="${xintuoSearVO.pageNo}"/>
<input name="pageSize" type="hidden" value="${xintuoSearVO.pageSize }"/>
<div class="tjs_pct_div">
<ul>
<c:forEach items="${lstProductVos}" var="xintuoProduct" varStatus="status">
<li>
<div class="tjs_pct_unit">
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_pct_title">
  <tr>
    <td width="65" align="right"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuoProduct.xtcpId}"><img src="assets/img/ui/${xintuoProduct.xtcpLog}" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a href="rest/web/xintuo/trust/trustParticulars?id=${xintuoProduct.xtcpId}" class="tjs_pct_titleurl">${xintuoProduct.xtcpSplname}</a></td>
  </tr>
</div>
<div class="tjs_pct_icodiv">
<div class="tjs_pct_earningsdiv"><span class="tjs_font36px"><fmt:formatNumber value="${xintuoProduct.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuoProduct.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:15px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuoProduct.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛： <fmt:formatNumber value="${xintuoProduct.xtcpZdrgje}" pattern="#0.####"/> 万 | 期限：  ${xintuoProduct.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv" style="height:40px"> ${xintuoProduct.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn" data_id="${xintuoProduct.xtcpId}">>立即预约</a></div>
</div>
<!-- /tjs_pct_unit 01 -->
</li>
</c:forEach>
</ul>
</div>
<!-- //tjs_pct_div -->
<!-- 翻页开始 -->
<div class="pages pgbtn">
    <table class=pagetb cellspacing=0>
      <tbody>
        <tr>
        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${xintuoSearVO.pageNo-1}"><</a></td>
        <c:forEach var="item" varStatus="status" begin="1" end="${xintuoSearVO.totalPageSize}">             
        <c:choose>  
          <c:when test="${status.index==xintuoSearVO.pageNo }"> 
           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
          </c:when> 
          <c:otherwise>
          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
          </c:otherwise> 
        </c:choose>             
        </c:forEach>
        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${xintuoSearVO.pageNo+1}">></a></td>
        <td class=pagnum><a title=最前一页 href="#" page_no="${xintuoSearVO.totalPageSize}">>|</a></td>          
        </tr>
      </tbody>
    </table>
  </div>
 <!-- 翻页结束 -->
 </form>
</div>

<!-- 信托产品结束 -->


<div class="clearfloat"></div>
<div style=" height:26px; width:100%;"></div>

<!-- 底部 -->
<%@ include file="/views/web/footer.jsp"%>

</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/xintuo/trust/orderProduct";
	$(function () {  
		//初始化选择按钮
	    $("#xtcpZdrgje a[tag=${xintuoSearVO.xtcpZdrgje}]").addClass("tjs_condition_selected");
	    $("#xtcpCxq a[tag=${xintuoSearVO.xtcpCxq}]").addClass("tjs_condition_selected");
	    $("#xtcpNsyl a[tag=${xintuoSearVO.xtcpNsyl}]").addClass("tjs_condition_selected");
	    $("#xtcpLxfp a[tag=${xintuoSearVO.xtcpLxfp}]").addClass("tjs_condition_selected");
	    $("#xtcpTzly a[tag=${xintuoSearVO.xtcpTzly}]").addClass("tjs_condition_selected");
	    $("#xtcpArea a[tag=${xintuoSearVO.xtcpArea}]").addClass("tjs_condition_selected");
	    $(".xtcpGsId a[tag=${xintuoSearVO.xtcpGsId}]").addClass("tjs_condition_selected");
	    
	    //初始化选这按钮
	    if($("#xtcpZdrgje a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpZdrgje'>"+$("#xtcpZdrgje a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpCxq a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpCxq'>"+$("#xtcpCxq a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpNsyl a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpNsyl'>"+$("#xtcpNsyl a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpLxfp a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpLxfp'>"+$("#xtcpLxfp a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpTzly a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpTzly'>"+$("#xtcpTzly a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpArea a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpArea'>"+$("#xtcpArea a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    	    
	    if($(".xtcpGsId a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpGsId'>"+$(".xtcpGsId a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    
	    
	   
	    $(".searchCondition a").click(function(event){
	    	event.preventDefault();	    	
	    	$("#"+$(this).attr("condition_name")+" a").removeClass("tjs_condition_selected");
	    	$("#"+$(this).attr("condition_name")+" a[tag=0]").addClass("tjs_condition_selected");	    		    	
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

	    });
	    
	    
	    	    
	    $("li .tjs_condition_right a").click(function(event){
	    	event.preventDefault();
	    	if($(this).attr("tagmore")=='1'){
	    		$(".xtcpGsId a").removeClass("tjs_condition_selected")
	    		$(this).addClass("tjs_condition_selected");
	    	}else{
	    		$(this).removeClass("tjs_condition_selected").addClass("tjs_condition_selected").siblings().removeClass("tjs_condition_selected");	
	    	}
	    	
	    	$("#more_gs_condition").css("display","none");
	    	var params =SetPara();
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

	    });
	    
	    
	    
	    $(".more_condition").unbind();
	    $(".more_condition").click(function(event){
	    	event.preventDefault();	    	
	    	if($("#more_gs_condition").css("display")=='none'){
	    		$(this).html("隐藏&gt;");
	    		$("#more_gs_condition").css("display","block");
	    	}else{
	    		$(this).html("更多&gt;");	
	    		$("#more_gs_condition").css("display","none")
	    	};
	    });
	    
	    
	  
	    
	    
	    
	    
	    $(".tjs_dashed_bottom a").click(function(event){
	    	event.preventDefault();	    	
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

	    });
	    
	    
	    $(".pagnum a").click(function(event){
	    	event.preventDefault();
            $("input[name=pageNo]").val($(this).attr("page_no"));
	    	//获取查询条件
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

	    });
	   
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
		  
		
 	    		       
	}); 
	
	function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	}

		
	function SetPara() { 
		var xtcpZdrgje = $("#xtcpZdrgje a.tjs_condition_selected").attr("tag");
		var xtcpCxq = $("#xtcpCxq a.tjs_condition_selected").attr("tag");
		var xtcpNsyl =$("#xtcpNsyl a.tjs_condition_selected").attr("tag");
		var xtcpLxfp = $("#xtcpLxfp a.tjs_condition_selected").attr("tag");
		var xtcpTzly =$("#xtcpTzly a.tjs_condition_selected").attr("tag");
		var xtcpArea =$("#xtcpArea a.tjs_condition_selected").attr("tag");
		var xtcpGsId =$(".xtcpGsId a.tjs_condition_selected").attr("tag");
		
		if($("input[name=keyword]").val()==$("input[name=keyword]").attr('placeholder')){
			$("input[name=keyword]").val("");
		}		
		var params = "?xtcpZdrgje=" + xtcpZdrgje + "&xtcpCxq=" + xtcpCxq + "&xtcpNsyl="+ xtcpNsyl+ "&xtcpLxfp=" + xtcpLxfp+ "&xtcpTzly=" + xtcpTzly+ "&xtcpArea=" + xtcpArea+"&xtcpGsId="+xtcpGsId;
		return params;
	}
	
  		
</SCRIPT>
</body>
</html>
