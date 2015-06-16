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
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css?1=1" rel="stylesheet" />

<script src="assets/scripts/ui/jquery-1.10.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="assets/scripts/ui/Slide.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>

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

    <div class="logo_wrap"><a href=""><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustIndex"><span class="simu_on">信托首页</span></a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustSafeguard" target="_blank">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<!-- 焦点广告 开始 -->
  <div id="slideBox" class="slideBox">
            <div class="hd">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ul>
            </div>
            <div class="bd">           
                <ul>
                    <li><a class="xintuo_banner1" href="javascript:void(0)"></a></li>
                    <li><a class="xintuo_banner2" href="javascript:void(0)"></a></li>
                </ul>
            </div>
            <div class="tjs_nav_box"><a class="prev" href="javascript:void(0)"></a><a class="next" href="javascript:void(0)"></a></div>
        </div>
        <script type="text/javascript">
            $(".slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, delayTime: 700 });
        </script>
        <div class="tjs_liuchengbg"></div>
       

<!-- 焦点广告 结束 -->

<!-- 精选推荐 开始-->

<div class="tjs_1108px center">
<div class="tjs_liucheng">
            </div>
            
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
  <tr  width="90%" >
    <td width="65" align="right"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}" target="_blank"><img src="assets/img/xintuo/small/${xintuotop.xtcpLog}" width="36" height="30" align="middle"/></a></td>
    <td align="left">&nbsp;&nbsp;<span><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}" target="_blank" style="font-size:16px">${xintuotop.xtcpSplname}</a></span></td>
  </tr>
</div>
<div class="tjs_right_earningsdiv"><span class="tjs_font36px"> <fmt:formatNumber value="${xintuotop.xtcpNsyl.intValue()}" pattern="#0" />.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuotop.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛：  <fmt:formatNumber value="${xintuotop.xtcpZdrgje}" pattern="#0.####"/>万 | 期限：${xintuotop.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv" style="height:40px;"> ${xintuotop.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn" data_id="${xintuotop.xtcpId}">立即预约</a></div>
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
<div class="tjs_trust_more"><a href="rest/web/xintuo/trust/trustProduct">更多...</a></div>
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
	<div class="tjs_trust_logodiv"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuofootsmall.xtcpId}" target="_blank"><img src="assets/img/xintuo/middle/${xintuofootsmall.xtcpLog}" width="108" height="108" /></a></div>
	</div>
	
	<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
	<div class="tjs_trust_title"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuofootsmall.xtcpId}" target="_blank" style="font-size:16px">${xintuofootsmall.xtcpSplname}</a></div>
	<div class="tjs_trust_bonus">${xintuofootsmall.xtcpHd}</div>
	<div class="tjs_trust_contentdiv">${xintuofootsmall.xtcpDp}</div>
	</div>
	<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
	<div class="tjs_trust_base">投资起点：<span style="color:#666;"><fmt:formatNumber value="${xintuofootsmall.xtcpZdrgje}" pattern="#0.####"/>万</span><br />
	投资期限：<span style="color:#666;">${xintuofootsmall.xtcpCxq}个月</span><br />
	投资方向：<span style="color:#666;">
          <c:choose>  
               <c:when test="${xintuofootsmall.xtcpTzly=='10'}">  
                 		房地产
               </c:when>
                <c:when test="${xintuofootsmall.xtcpTzly=='20'}">  
                 		金融
               </c:when>
                <c:when test="${xintuofootsmall.xtcpTzly=='30'}">  
                 		 基础设施
               </c:when> 
                <c:when test="${xintuofootsmall.xtcpTzly=='40'}">  
                 		工商企业
               </c:when> 
                <c:when test="${xintuofootsmall.xtcpTzly=='50'}">  
                 		其他
               </c:when>     
               <c:otherwise>  
                    	其他
               </c:otherwise>  
           </c:choose> 		
	</span></div>
	</div>
	<div class="tjs_float_left tjs_width225px tjs_height145px">
	<div class="tjs_trust_order">
	<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${xintuofootsmall.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuofootsmall.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
	<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn" data_id="${xintuofootsmall.xtcpId}">立即预约</a></div>
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
<div class="tjs_trust_logodiv"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuofootone.xtcpId}" target="_blank"><img src="assets/img/xintuo/middle/${xintuofootone.xtcpLog}" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuofootone.xtcpId}" target="_blank" style="font-size:16px">${xintuofootone.xtcpSplname}</a></div>
<div class="tjs_trust_bonus">${xintuofootone.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${xintuofootone.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;"><fmt:formatNumber value="${xintuofootone.xtcpZdrgje}" pattern="#0.####"/>万</span><br />
投资期限：<span style="color:#666;">${xintuofootone.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">
           <c:choose>  
               <c:when test="${xintuofootone.xtcpTzly=='10'}">  
                 		房地产
               </c:when>
                <c:when test="${xintuofootone.xtcpTzly=='20'}">  
                 		金融
               </c:when>
                <c:when test="${xintuofootone.xtcpTzly=='30'}">  
                 		 基础设施
               </c:when> 
                <c:when test="${xintuofootone.xtcpTzly=='40'}">  
                 		工商企业
               </c:when> 
                <c:when test="${xintuofootone.xtcpTzly=='50'}">  
                 		其他
               </c:when>     
               <c:otherwise>  
                    	其他
               </c:otherwise>  
           </c:choose> 		

</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${xintuofootone.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuofootone.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn" data_id="${xintuofootone.xtcpId}">立即预约</a></div>
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
<div class="tjs_trust_logodiv"><a href="rest/web/xintuo/trust/trustParticulars?id=${lstTopfootHighs.xtcpId}" target="_blank"><img src="assets/img/xintuo/middle/${lstTopfootHighs.xtcpLog}" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="rest/web/xintuo/trust/trustParticulars?id=${lstTopfootHighs.xtcpId}" target="_blank" style="font-size:16px">${lstTopfootHighs.xtcpSplname}</a></div>
<div class="tjs_trust_bonus">${lstTopfootHighs.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${lstTopfootHighs.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">${lstTopfootHighs.xtcpZdrgje}万</span><br />
投资期限：<span style="color:#666;">${lstTopfootHighs.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">
   <c:choose>  
               <c:when test="${lstTopfootHighs.xtcpTzly=='10'}">  
                 		房地产
               </c:when>
                <c:when test="${lstTopfootHighs.xtcpTzly=='20'}">  
                 		金融
               </c:when>
                <c:when test="${lstTopfootHighs.xtcpTzly=='30'}">  
                 		 基础设施
               </c:when> 
                <c:when test="${lstTopfootHighs.xtcpTzly=='40'}">  
                 		工商企业
               </c:when> 
                <c:when test="${lstTopfootHighs.xtcpTzly=='50'}">  
                 		其他
               </c:when>     
               <c:otherwise>  
                    	其他
               </c:otherwise>  
           </c:choose> 		
</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${lstTopfootHighs.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${lstTopfootHighs.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn" data_id="${lstTopfootHighs.xtcpId}">立即预约</a></div>
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
<div class="tjs_trust_logodiv"><a href="rest/web/xintuo/trust/trustParticulars?id=${lstTopfootOthers.xtcpId}" target="_blank" style="font-size:16px"><img src="assets/img/xintuo/middle/${lstTopfootOthers.xtcpLog}" width="108" height="108" /></a></div>
</div>

<div class="tjs_float_left tjs_width210px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_title"><a href="rest/web/xintuo/trust/trustParticulars?id=${lstTopfootOthers.xtcpId}" target="_blank">${lstTopfootOthers.xtcpSplname}</a></div>
<div class="tjs_trust_bonus">${lstTopfootOthers.xtcpHd}</div>
<div class="tjs_trust_contentdiv">${lstTopfootOthers.xtcpDp}</div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px  tjs_right_1pxdashed">
<div class="tjs_trust_base">投资起点：<span style="color:#666;">${lstTopfootOthers.xtcpZdrgje}万</span><br />
投资期限：<span style="color:#666;">${lstTopfootOthers.xtcpCxq}个月</span><br />
投资方向：<span style="color:#666;">
  <c:choose>  
               <c:when test="${lstTopfootOthers.xtcpTzly=='10'}">  
                 		房地产
               </c:when>
                <c:when test="${lstTopfootOthers.xtcpTzly=='20'}">  
                 		金融
               </c:when>
                <c:when test="${lstTopfootOthers.xtcpTzly=='30'}">  
                 		 基础设施
               </c:when> 
                <c:when test="${lstTopfootOthers.xtcpTzly=='40'}">  
                 		工商企业
               </c:when> 
                <c:when test="${lstTopfootOthers.xtcpTzly=='50'}">  
                 		其他
               </c:when>     
               <c:otherwise>  
                    	其他
               </c:otherwise>  
           </c:choose> 	
</span></div>
</div>
<div class="tjs_float_left tjs_width225px tjs_height145px">
<div class="tjs_trust_order">
<div class="tjs_trust_ordertitle"><strong>预期收益</strong><br /><span style=" font-size:36px;color:#FF6600;"><span style="font-size:48px"><fmt:formatNumber value="${lstTopfootOthers.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${lstTopfootOthers.xtcpNsyl*100%100}" pattern="00"/>%</span></div>
<div class="tjs_right_btndiv" style="margin-top:12px;"> <a href="#" class="tjs_btn" data_id="${lstTopfootOthers.xtcpId}">立即预约</a></div>
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
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">募集迅速</span><br /><span style="color:#8f8f8f;">一般1-2周募集完</span></div>
</div>

<div class="tjs_dominant_contentdiv">
<div class="tjs_dominant_contentleft tjs_major_bg"></div>
<div class="tjs_dominant_contentright"><span style=" margin-top:20px;display:inline-block;font-size:18px; color:#0280cc">专款专用</span><br /><span style="color:#8f8f8f;">财产独立，专款专用</span></div>
</div>
<div  style=" height:36px; width:100%;"></div>
</div>
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_trust_4border">
<div class="tjs_advantage_title">信托信息免费订阅</div>
<div class="tjs_trust_takecontent">第一时间通知您最新的顶尖信托免费为您发送最新高额返现信息</div>
<div class="tjs_trust_servicediv">免费服务热线：<br /><span style="font-size:30px;">4006-114-088</span></div>
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
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/xintuo/trust/orderProduct";

$(function() {  
	var slideboxshow = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            //--/轮播按钮--
            //--自定义下拉框--
            $(".sel_wrap").click(function () {
                $(".select").toggle();
                $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
                $(".select>li").each(function (index) {
                    $(this).click(function () {
                        var opt = $(this).html();
                        $(".lbl").html(opt);
                    })
                })
                })
            //--/自定义下拉框--
            //--表格单行变色--98
            $("tr:even").css
            ("background", "#EEEDEB");
            //--/表格单行变色--
        }      		  		   
		slideboxshow();
    		
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
      //--/预约--

      
  function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	}
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
