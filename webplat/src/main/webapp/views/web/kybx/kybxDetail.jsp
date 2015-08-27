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
<meta name="keywords" content="找${kybx.kybxName}产品上淘金山，为您提供${kybx.kybxName}理财产品，${kybx.kybxName}最新产品，${kybx.kybxName}产品有哪些等详细信息，帮助您选出最适合自己${kybx.kybxName}公司产品，并完成购买保险产品。"/>
<meta name="description" content="${kybx.kybxName}产品，${kybx.kybxName}理财产品，${kybx.kybxName}最新产品"/>
<title>${kybx.kybxName}产品,${kybx.kybxName}理财产品,${kybx.kybxName}最新产品-淘金山</title>
<link rel="stylesheet" href="assets/widget/kindeditor/plugins/code/prettify.css" />
<link href="assets/css/ui/OverSafe.css?1=1" rel="stylesheet"/>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />


<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="<%=basePath%>assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<link href="<%=basePath%>assets/css/ui/simu.css" rel="stylesheet" />
<link href="<%=basePath%>assets/css/ui/xintuo.css" rel="stylesheet" />
</head>

<body>
<div class="tis_pcs_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;" >

    <div class="logo_wrap"><a href="<%=basePath%>"><img src="<%=basePath%>assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
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



<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">
当前位置： <a href="">首页</a> &gt;
<a href="${url}">${urlName}</a>
&gt;${kybx.kybxName}</div></div>

<!-- 产品基本信息 开始-->

<div class="tjs_1108px center" style="position:relative;" >
<div style=" height:20px; width:100%;"></div>
<div class="tjs_pcs_title" ><div class="tjs_pcs_titleleft" style="color:#000">${kybx.kybxName}</div>	
      <div class="tjs_pcs_titleright">	        
       	<a href="#" class="tjs_btn" data_id="${kybx.kybxId}" style="border-radius:4px;">立即预约</a>	         
      </div>	  	    	      	
</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>

<div class="tjs_pcs_box xt_side_nav_box" id="detail_info" style="border-bottom:0px">
<div><span class="dleft">保险公司：</span> <span class="drihgt" style="line-height:35px">${kybx.kybxCompanyName}</span></div>
<div><span class="dleft">年限选择：</span> <span class="drihgt" style="line-height:35px">${kybx.kybxChoose}</span></div>
<div><span class="dleft">最低保障金额：</span> <span class="drihgt" style="line-height:35px">${kybx.kybxAmont}</span></div>
<div><span class="dleft">投保年龄：</span> <span class="drihgt" style="line-height:35px">${kybx.kybxAge}</span></div>

<div>
 <div class="dleft fl" style="width:80px">产品优点：</div>
 <div class="d-item fl" style="width:80%">
  ${kybx.kybxCpys}
 </div>
</div>
</div>



<!--// tjs_pcs_box 01-->
<div class="xt_side_nav_box" id="who" style="margin-bottom:20px">
<div style=" height:20px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title">产品介绍</a></div>
<div class="tjs_pcs_box" style="border-bottom:0px">
  ${kybx.kybxInfo}
 </div>
</div>
</div>

<!--// tjs_pcs_box 02-->
<div class="xt_side_nav_box" id="where" style="margin-bottom:20px">
<hr style="border:1px solid #e2e2e2"/>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title">保障计划</div>
<div class="tjs_pcs_box" style="border-bottom:0px">
   ${kybx.kybxPlan}
</div>
</div>
</div>


<!--// tjs_pcs_box 03-->
<div class="xt_side_nav_box" id="howback" style="margin-bottom:20px">
<hr style="border:1px solid #e2e2e2"/>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title">理赔流程</a></div>
<div class="tjs_pcs_box" style="border-bottom:0px">
 ${kybx.kybxLplc}
</div>
</div>
</div>



<!--// tjs_pcs_box 04-->
<div class="xt_side_nav_box" id="from" style="margin-bottom:20px"> 
<hr style="border:1px solid #e2e2e2"/>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title" >常见问题</div>
<div class="tjs_pcs_box" style="border-bottom:0px" >
 ${kybx.kybxQuestion}
</div>
</div>
</div>

<!--// tjs_pcs_box 05-->
<div class="xt_side_nav_box" id="managercom" style="margin-bottom:20px"> 
<hr style="border:1px solid #e2e2e2"/>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title">保险条款</a></div>
<div class="tjs_pcs_box " style="border-bottom:0px">
 ${kybx.kybxTk}
 </div>
</div>
</div>
<!--// tjs_pcs_box 05 05-->

</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 产品基本信息 结束-->
<!--//tjs_pcs_flow -->




<div style=" height:30px; width:100%; font-size:0px;"></div>
<%@ include file="/views/web/footer.jsp"%>
<!-- /footer tjs_1108px -->
</div>
</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/Kybx/orderKybx";
$(function(){  
	$(".flow_menu_dash a").click(function(event){		
    	$(".flow_menu_dash a").attr("id","");
    	$(this).attr("id","flow_menu_click");
    });
	
	 //--预约--                   
	$("a.tjs_btn").click(function(event){	
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
	 
	 
	//快速导航滚动
	var $navs = $(".xt_fastnav .fastnav_bd .fastnav_item"),
    $containers = $(".xt_side_nav_box");
	if($navs.length > 0){
	    //滚动时的处理
	    function doScroll()
	    {
	        $containers.each(function(index) {	        
	            container_top = $(this).offset().top;
	            container_bottom = $(this).offset().top + $(this).height();
	            scrollbar_position = $(document).scrollTop();
	            if(container_top <= scrollbar_position && container_bottom > scrollbar_position){
	                $navs.eq(index).addClass("fastnav_item_active").siblings(".fastnav_item").removeClass("fastnav_item_active");
	            }
	        });
	    }
	    //刚进详情页判断一次
	    doScroll();
	    //滚动时，进行判断
	    $(window).scroll(function() {
	        doScroll();
	    });
	    
	    
	}
	
	if($(".fastnav_container").length > 0){
		//详细页左边快速导航
	$(window).scroll(function(){
	    var h = $(".fastnav_container").offset().top ;   
	    var scrollt = document.documentElement.scrollTop + document.body.scrollTop;
	
	    if( scrollt > h){
	        $(".xt_fastnav").css({
	            position: 'fixed',
	            top:'0'                                         
	        });                     
	    }else{ 
	        $(".xt_fastnav").css({
	            position: 'static'
	        });             
	    }
	});
	} 
	 
	
   });
   
   
 
   
function placeholderSupport() {
    return 'placeholder' in document.createElement('input');
}
</SCRIPT>
</body>
</html>
