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
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

 <script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
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

     <div class="logo_wrap"><a href="index.html"><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li><a href="rest/web/xintuo/trust/trustProduct">信托产品</a></li>
    <li><a href="#">信托公司</a></li>
    <li><a href="#">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<!-- 焦点广告 开始 -->
<div class="header">
<div  class="tjs_1108px" style=" margin:0 auto;position: relative; z-index:20000;height:360px;">
<div class="top_header_logindiv"  id="tip120"  style="display:block">
<div class="top_login_title">快速注册  仅需10秒</div>
<div  style=" height:22px; width:100%;"></div>

<div class="tjs_topinput_div">手机号：<input name="" type="text" class="tjs_login_input tjs_width180px" /></div>
<div class="tjs_topinput_div">
<div class="tjs_v_div_left">验证码：<input name="" type="text" class="tjs_login_input tjs_width90px" /></div>
<div class="tjs_v_div_right"><img src="assets/img/ui/verification_img.png" width="65" height="30" /> <span><a href="#" class="tjs_registerurl">看不清</a></span></div>
</div>
<div class="learfloat"></div>
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_btndiv"><a href="#" class="tjs_next_btn" onclick='show("tip120","img128")'>下一步</a><!--<input name="" type="button" value="下一步" class="tjs_register_btn" onclick='show("tip120","img128")'/>--></div>
<div class="tjs_talkdiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="checkbox" value="" checked="checked" /> <a href="#" class="tjs_registerurl">我同意《淘金山用户使用协议》</a></div>
</div>
<!-- /top_header_logindiv -->

<div class="top_header_logindiv"  id="img128" style="display:none">
<div class="top_login_title">快速注册 仅需10秒</div>

<div class="tjs_cellphone_div"><span>手机号：<span style="color:#ff6600">13798239230</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_pw_url"><span style="color:#00aeff">修改</span></a></span></div>
<div class="tjs_pw_div_left">短信验证码：</div>
<div class="tjs_pw_div_right"><input name="" type="text" class="tjs_login_input tjs_width90px" />&nbsp;&nbsp;<span><a href="#">未收到？</a></span></div>

<div class="learfloat"></div>
<div class="tjs_topinput_pw_div">设置密码：<input name="" type="text" class="tjs_login_input tjs_width150px" /></div>

<div class="tjs_topinput_pw_div">重复密码：<input name="" type="text" class="tjs_login_input tjs_width150px" /></div>

<div  style=" height:5px; width:100%; font-size:0px;"></div>
<div class="tjs_pw_btndiv"><a href="#" class="tjs_ok_btn"  onclick='show("tip120","img128")'>完成</a></div>

</div>
<!-- /top_header_logindiv -->


  <div id="onebyone_slider">

    <div class="oneByOne_item">
		<span class="ob1_title">漫画原创时间日期Jquery插件</span>
		<span class="ob1_description">1、可以灵活设计响应事件（Event） 2、层显示的位置（Left，Top）3、年月日之的连接符号 4、自由控制是否显示时间（isTime）5、年份下列列表的开始值与结束值。</span>
		<span class="ob1_button"><a href="http://www.taojinshan.com.cn/" target="_blank" class="default_button">查看详情</a></span>
		<img src="assets/img/ui/header/2.png" class="ob1_img_device1" alt="漫画原创时间日期Jquery插件" />
	</div>
   <div class="oneByOne_item">
		<span class="ob1_title">jcDate原创时间Jquery插件</span>
		<span class="ob1_description">可支持：1、图标样式名称;2、响应的事件;3、出现的速度;4、靠左的位置;5、靠上的位置;6、日期连接字符;7、关闭时间。</span>
		<span class="ob1_button"><a href="http://www.taojinshan.com.cn/" target="_blank" class="default_button">查看详情</a></span>
		<img src="assets/img/ui/header/2.png" class="ob1_img_device1" alt="jcDate原创时间Jquery插件" />
	</div>
	<div class="oneByOne_item">
		<span class="ob1_title">漫画原创弹出内容提示Jquery插件</span>
		<span class="ob1_description">可支持响应的事件、提示层显示的时间、显示的消息、滑动速度、提示类型（1、success 2、error 3、warning）等参数的灵活设置，具体请查看详细介绍。。。</span>
		<span class="ob1_button"><a href="http://www.taojinshan.com.cn/" target="_blank" class="default_button">查看详情</a></span>
		<img src="assets/img/ui/header/2.png" class="ob1_img_device1" alt="漫画原创弹出内容提示Jquery插件" />
	</div>

  </div>
   </div>
</div>
<!-- 焦点广告 结束 -->




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
<div class="tjs_right_title"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65" align="right"><img src="assets/img/ui/${xintuotop.xtcpLog}" width="36" height="30" align="middle"></td>
    <td align="left">&nbsp;&nbsp;<span>${xintuotop.xtcpFullname}</span></td>
  </tr>
</table>
</div>
<div class="tjs_right_earningsdiv"><span class="tjs_font36px"><fmt:formatNumber value="${xintuotop.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuotop.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛：<fmt:formatNumber value="${xintuotop.xtcpZdrgje}" pattern="#0.####"/> 万 | 期限： ${xintuotop.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv"> ${xintuotop.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn">立即预约</a></div>
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

<li><div class="tjs_condition_left">投资领域：</div><div class="tjs_condition_right" id="xtcpTzly"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="房地产">房地产</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20" title="金融">金融</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30">基础设施</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="40">工商企业</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50">其他</a></div></li>

<li><div class="tjs_condition_left">项目所在地：</div><div class="tjs_condition_right" id="xtcpArea"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10">珠三角</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20">江浙</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30">沪京</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="40">津冀</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50">其它地区</a></div></li>

<li><div class="tjs_condition_left">信托公司： </div><div class="tjs_condition_right" id="xtcpGsId"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">平安信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">中融信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">中信信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">华润信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">四川信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">中江信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn">中泰信托</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">更多></a></div></li>
</ul>
<div class="tjs_dashed_bottom tjst_height_32px"></div>
<div class="tjst_height_50px tjs_dashed_bottom"><div class="tjs_search_left">信托公司： </div><div class="tjs_search_right"><input name="keyword"  type="text"  value="${xintuoSearVO.keyword}" placeholder="关键字" onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}" class="tjst_pct_search"><a href="#"><img src="assets/img/ui/search_ico.png" width="33" height="33" style="float:left"></a></div></div>
<div class="tjst_height_50px tjs_bg_gray"><div class="tjs_search_left">产品期限：</div><div class="tjs_pct_right">共 <span style="font-size:16px; color:#FF6600">${xintuoSearVO.totalCount}</span> 款产品满足条件&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">清空条件</a></div></div>
</div>
<!-- //tjs_product_search -->


<div class="tjst_height_32px"></div>
<form id="modalForm" action="rest/web/xintuo/trust/trustProduct" method="post" >
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
<div class="tjs_pct_title"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65" align="right"><a href="#"><img src="assets/img/ui/${xintuoProduct.xtcpLog}" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<a href="#" class="tjs_pct_titleurl">${xintuoProduct.xtcpFullname}</a></td>
  </tr>
</table>
</div>
<div class="tjs_pct_icodiv">
<div class="tjs_pct_earningsdiv"><span class="tjs_font36px"><fmt:formatNumber value="${xintuoProduct.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuoProduct.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:15px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuoProduct.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛： <fmt:formatNumber value="${xintuoProduct.xtcpZdrgje}" pattern="#0.####"/> 万 | 期限：  ${xintuoProduct.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv"> ${xintuoProduct.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn">立即预约</a></div>
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
	$(function () {             
	    $("#xtcpZdrgje a[tag=${xintuoSearVO.xtcpZdrgje}]").addClass("tjs_condition_selected");
	    $("#xtcpCxq a[tag=${xintuoSearVO.xtcpCxq}]").addClass("tjs_condition_selected");
	    $("#xtcpNsyl a[tag=${xintuoSearVO.xtcpNsyl}]").addClass("tjs_condition_selected");
	    $("#xtcpLxfp a[tag=${xintuoSearVO.xtcpLxfp}]").addClass("tjs_condition_selected");
	    $("#xtcpTzly a[tag=${xintuoSearVO.xtcpTzly}]").addClass("tjs_condition_selected");
	    $("#xtcpArea a[tag=${xintuoSearVO.xtcpArea}]").addClass("tjs_condition_selected");
	    $("li .tjs_condition_right a").click(function(event){
	    	event.preventDefault();
	    	$(this).removeClass("tjs_condition_selected").addClass("tjs_condition_selected").siblings().removeClass("tjs_condition_selected");
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

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
	    
	  
	    		       
	}); 
	
	
	function SetPara() { 
		var xtcpZdrgje = $("#xtcpZdrgje a.tjs_condition_selected").attr("tag");
		var xtcpCxq = $("#xtcpCxq a.tjs_condition_selected").attr("tag");
		var xtcpNsyl =$("#xtcpNsyl a.tjs_condition_selected").attr("tag");
		var xtcpLxfp = $("#xtcpLxfp a.tjs_condition_selected").attr("tag");
		var xtcpTzly =$("#xtcpTzly a.tjs_condition_selected").attr("tag");
		var xtcpArea =$("#xtcpArea a.tjs_condition_selected").attr("tag");
		var keyword=$("input[name=keyword]").val();
		var params = "?xtcpZdrgje=" + xtcpZdrgje + "&xtcpCxq=" + xtcpCxq + "&xtcpNsyl="+ xtcpNsyl+ "&xtcpLxfp=" + xtcpLxfp+ "&xtcpTzly=" + xtcpTzly+ "&xtcpArea=" + xtcpArea+"&keyword="+keyword;
		return params;
	}
	
	
	
	
	
  	
	
</SCRIPT>
</body>
</html>
