<%@ include file="/views/web/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page language="java" import="com.tjs.admin.kybx.constants.KybxClassEnum"%>
<%@page language="java" import="com.tjs.core.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="保险产品，保险产品大全，最新保险产品,保险公司,保险公司排名"/>
<meta name="description" content="淘金山信托频道为您提供保险产品，最亲保险公司中，最新保险产品等详细信息，帮助您选出收益率最高的保险产品，并完成购买保险产品。"/>
<title>保险产品,保险公司,保险公司排名-淘金山</title>

<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css?1=1" rel="stylesheet" />
<link href="assets/css/ui/OverSafe.css?1=1" rel="stylesheet" />

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
    <li style="width:155px"><a href="rest/web/Kybx/kybxIndex"><span class="${Indexclass}">保险首页</span></a></li>
    <li style="width:155px"><a href="rest/web/Kybx/kybxSX" target="_blank"><span class="${bxSXclass}">寿险</span></a></li>
    <li style="width:155px"><a href="rest/web/Kybx/kybxYlbx" target="_blank"><span class="${Ylbxclass}">医疗</span></a></li>
    <li style="width:155px"><a href="rest/web/Kybx/kybxBzbx" target="_blank"><span class="${Bzbxclass}">保费隔资</span></a></li>
    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->



<!-- 精选推荐 开始-->

<div class="tjs_1108px center" style="min-height:350px">
<div style=" height:20px; width:100%;"></div>
<div class="tjs_recommend_title tjs_recommend_trusticobg">精选推荐</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>
<c:forEach items="${lstKybx}" var="kybx" >
<ul class="os-l-ul">           
            <li class="clearfix" style="min-height:238px">
            <div class="c-left fl ">
                    <div class="fl os-pic">
                        <a href="rest/web/Kybx/kybxDetail?id=${kybx.kybxId}&flag=${flag}" target="_blank"><img src="rest/web/system/upfile/viewImage?imageName=${kybx.kybxImgUrl}" alt="" style="width:197px;height:197px" /></a>
                    </div>
                    <div class="fl os-tdsc">
                        <a class="tit" href="rest/web/Kybx/kybxDetail?id=${kybx.kybxId}&flag=${flag}" target="_blank">${kybx.kybxName}</a> 
                        <div class="i-item">                   
	                       ${kybx.kybxCpys}
                        </div>  
                    </div>               
            </div>

            <div class="c-right fr" style="min-height:238px;">
                <table style="width: 100%; height:100%; " >
                   <tr class="border-bottom last">
                		<td>
                		<c:if test="${!empty kybx.kybxZlUrl }">
                		<a href="rest/web/system/upfile/downFile?imageName=${kybx.kybxZlUrl}"  id="JS-img-src" class="kybx_downbtn"><img src="assets/img/ui/icon-1.png"  align="middle"/>&nbsp;资料下载</a>
                		</c:if>
                		<a class="kybx_btn" data_id="${kybx.kybxId}"><img src="assets/img/ui/icon-3.png"  align="middle"/>&nbsp;立即预约</a>
                		<!-- 
                		<a href="rest/web/Kybx/kybxDetail?id=${kybx.kybxId}&flag=${flag}" target="_blank" class="kybx_btn fl"><img src="assets/img/ui/icon-2.png"  align="middle"/>&nbsp;查看详情</a></td>
                		 -->
                	</tr>
                	<tr class="border-bottom">
                		<td><span class="sleft">保险种类：</span> <span class="sright">
                			<c:set var="classKey"  value="${kybx.kybxClass}" scope="request"/> 
          					<%=EnumUtils.getValue((IEnum[])KybxClassEnum.values(), (String)request.getAttribute("classKey")) %>
         					 </span></td>
                	</tr>
                	<tr class="border-bottom">
                		<td><span class="sleft">适合人群：</span><span class="sright" style="line-height:35px">${kybx.kybxShrq}</span></td>
                	</tr>
                	<tr class="border-bottom" style="border-bottom:0px">
                		<td><span class="sleft">产品亮点：</span><span class="sright">${kybx.kybxGood}</span></td>
                	</tr>               	
                </table>
            </div>
        </li>
     </ul>
</c:forEach>


<div class="clearfloat"></div>
</div>

<div  style=" height:26px; width:100%;"></div>
<div class="clearfloat"></div>
<div style=" height:26px; width:100%;"></div>

<%@ include file="/views/web/footer.jsp"%>
</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/Kybx/orderKybx";

$(function() {  					 		
		  //--预约--                   
		$("a.kybx_btn").click(function(event){	
			event.preventDefault();			
		    alertMsg($(this).attr("data_id"),'40', 1);  
		    
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
		  
		  
		 //--预约--                   
		$("a.tjs_btn_disable").click(function(event){	
			event.preventDefault();		
		});
		  		       
		});
      //--/预约--

      
  function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	}
 
   
   window.onresize = function(){
		var clientWidth = $(document.body)[0].clientWidth;
		$("a[class^=header_banner]").css("width", clientWidth);
	}
      

</SCRIPT>
</body>
</html>
