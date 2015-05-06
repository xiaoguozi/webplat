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
<title>淘金山——信托</title>
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
    <li><a href="rest/web/xintuo/trust/trustIndex">信托首页</a></li>
    <li><a href="rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
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




<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="index.html">首页</a> > <a href="#">信托产品</a></div></div>

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
<div class="tjs_right_earningsdiv"><span class="tjs_font36px"> <fmt:formatNumber value="${xintuotop.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuotop.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛：  <fmt:formatNumber value="${xintuotop.xtcpZdrgje}" pattern="#0.####"/>万 | 期限：${xintuotop.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv"> ${xintuotop.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</c:forEach>

<div class="clearfloat"></div>

</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 精选推荐 结束-->






<div  style=" height:26px; width:100%;"></div>
<!-- 信托板块开始 -->

<div class="tjs_1108px center">
<div class="tjs_trust_product_left">
<div class="tjs_trust_more"><a href="#">更多...</a></div>
<!-- 信托TAB代码 开始 -->
<div class="tjs_trust_tabtitle">
<ul id=tags>
<li class=selectTag><A onClick="selectTag('tagContent0',this)" href="javascript:void(0)">小额信托</A></li>
<li><A onClick="selectTag('tagContent1',this)" href="javascript:void(0)">1年期信托</A></li>
<li><A onClick="selectTag('tagContent2',this)" href="javascript:void(0)">高收益信托</A> </li>
<li><A onClick="selectTag('tagContent3',this)" href="javascript:void(0)">政信类信托</A> </li> 
</ul>
</div>
<!--=====================tab pages start=====================-->

<div id=con>

<div id=tagContent>
<!--====NO 1 Start===-->
<div class="tagContent  selectTag" id=tagContent0> 
<div class="tjs_trust_tabbox">
<div class="tjs_trust_coloreddiv"><div class="tjs_1pxleftmargin tjs_trust_coloredorange"></div></div>

<c:forEach items="${lstTopfootSmalls}" var="xintuofootsmall" varStatus="status">
<div class="tjs_trust_content <c:if test='${status.index%2==0}'>tjs_bg_gray</c:if>">
	<div class="tjs_float_left tjs_width165px">
	<div class="tjs_trust_logodiv"><a href="#"><img src="assets/img/ui/trust_img002.png" width="108" height="108" /></a></div>
	</div>
	
	<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
	<div class="tjs_trust_title"><a href="#">${xintuofootsmall.xtcpFullname}</a></div>
	<div class="tjs_trust_bonus">${xintuofootsmall.xtcpHd}</div>
	<div class="tjs_trust_contentdiv">${xintuofootsmall.xtcpDp}</div>
	</div>
	<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
	<div class="tjs_trust_base">投资起点：<span style="color:#666;"><fmt:formatNumber value="${xintuofootsmall.xtcpZdrgje}" pattern="#0.####"/>万</span><br />
	投资期限：<span style="color:#666;">${xintuofootsmall.xtcpCxq}个月</span><br />
	投资方向：<span style="color:#666;">${xintuofootsmall.xtcpZjyt}</span></div>
	</div>
	<div class="tjs_float_left tjs_width225px tjs_height145px">
	<div class="tjs_trust_order">
	<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${xintuofootsmall.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuofootsmall.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
	<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
	</div>
	</div>
</div>
</c:forEach>
<!--//tjs_trust_content 1 div-->	
</div>
<!--//tjs_trust_tabbox div-->	
</div>
</div>
 

<!--====NO 2 Start===-->
<div  class="tagContent" id="tagContent1">
<div class="tjs_trust_tabbox">
<div class="tjs_trust_coloreddiv"><div class="tjs_151pxleftmargin tjs_trust_coloredorange"></div></div>

<c:forEach items="${lstTopfootOnes}" var="xintuofootone" varStatus="status">
<div class="tjs_trust_content <c:if test='${status.index%2==0}'>tjs_bg_gray</c:if>">
<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="assets/img/ui/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">${xintuofootone.xtcpFullname}</a></div>
<div class="tjs_trust_bonus">${xintuofootone.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${xintuofootone.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;"><fmt:formatNumber value="${xintuofootone.xtcpZdrgje}" pattern="#0.####"/>万</span><br />
投资期限：<span style="color:#666;">${xintuofootone.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">${xintuofootone.xtcpZjyt}</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${xintuofootone.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuofootone.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>
</div>
</c:forEach>
<!--//tjs_trust_content 1 div-->	


<!--//tjs_trust_content 4 div-->	
</div>
</div>
<!--===NO 2 SOTP ===-->

<!--===NO 3 Start===-->
<div class=tagContent id=tagContent2>
<div class="tjs_trust_tabbox">
<div class="tjs_trust_coloreddiv"><div class="tjs_303pxleftmargin tjs_trust_coloredorange"></div></div>

<c:forEach items="${lstTopfootHighs}" var="lstTopfootHighs" varStatus="status">
<div class="tjs_trust_content <c:if test='${status.index%2==0}'>tjs_bg_gray</c:if>">
<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="assets/img/ui/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">${lstTopfootHighs.xtcpFullname}</a></div>
<div class="tjs_trust_bonus">${lstTopfootHighs.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${lstTopfootHighs.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">${lstTopfootHighs.xtcpZdrgje}万</span><br />
投资期限：<span style="color:#666;">${lstTopfootHighs.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">${lstTopfootHighs.xtcpZjyt}</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${lstTopfootHighs.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${lstTopfootHighs.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>
</div>
</c:forEach>
<!--//tjs_trust_content 2 div-->
</div>
</div>


<!--====NO 4 Start===-->
<div class="tagContent" id=tagContent3>
<div class="tjs_trust_tabbox">
<div class="tjs_trust_coloreddiv"><div class="tjs_455pxleftmargin tjs_trust_coloredorange"></div></div>

<c:forEach items="${lstTopfootOthers}" var="lstTopfootOthers" varStatus="status">
<div class="tjs_trust_content <c:if test='${status.index%2==0}'>tjs_bg_gray</c:if>">
<div class="tjs_float_left tjs_width165px">
<div class="tjs_trust_logodiv"><a href="#"><img src="assets/img/ui/trust_img002.png" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="#">${lstTopfootOthers.xtcpFullname}</a></div>
<div class="tjs_trust_bonus">${lstTopfootOthers.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${lstTopfootOthers.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">${lstTopfootOthers.xtcpZdrgje}万</span><br />
投资期限：<span style="color:#666;">${lstTopfootOthers.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">${lstTopfootOthers.xtcpZjyt}</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${lstTopfootOthers.xtcpNsyl}" pattern="#0"/>.</span><fmt:formatNumber value="${lstTopfootOthers.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn">立即预约</a></div>
</div>
</div>
</div>
</c:forEach>

<!--//tjs_trust_content 1 div-->	

<!--//tjs_trust_content 2 div-->
</div>
</div>
<!--===NO 4 SOTP ===-->


</div> 
<!--=====================tab pages stop======================-->
<!-- 信托TAB代码 结束 -->
</div>
<!-- /tjs_trust_product_left -->

<div class="tjs_trust_product_right">
<div class="tjs_trust_4border">
<div class="tjs_advantage_title">信托优势</div>
<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_earnings_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">收益较高</span><br /><span style="color:#8f8f8f;">年化收益为9%-13%</span></div>
</div>

<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_security_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">安全性高</span><br /><span style="color:#8f8f8f;">迄今100%全部兑付</span></div>
</div>

<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_deadline_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">期限固定</span><br /><span style="color:#8f8f8f;">一般在1~3年</span></div>
</div>

<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_quick_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">期限固定</span><br /><span style="color:#8f8f8f;">一般在1~3年</span></div>
</div>

<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_major_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">期限固定</span><br /><span style="color:#8f8f8f;">一般在1~3年</span></div>
</div>
<div  style=" height:36px; width:100%;"></div>
</div>
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_trust_4border">
<div class="tjs_advantage_title">信托信息免费订阅</div>
<div class="tjs_trust_takecontent">第一时间通知您最新的顶尖信托免费为您发送最新高额返现信息</div>
<div class="tjs_trust_servicediv">免费服务热线：<br /><span style="font-size:30px;">4000-181-131</span></div>
<div class="tjs_trust_servicebtn"><a href="#" class="take_btn">&nbsp;&nbsp;&nbsp;&nbsp;邮箱订阅</a>&nbsp;&nbsp;<a href="#" class="phone_btn">&nbsp;&nbsp;&nbsp;&nbsp;手机订阅</a></div>
<div class="tjs_trust_warning">我们承诺对您的信息严格保密！</div>
<div  style=" height:18px; width:100%;"></div>
</div>
</div>
<!-- /tjs_trust_product_right -->





</div>



<!-- 信托板块结束 -->


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
