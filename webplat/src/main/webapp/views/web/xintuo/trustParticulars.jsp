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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${productXtcp.xtcpSplname},${productXtcp.xtcpFullname}"/>
<meta name="description" content="找${productXtcp.xtcpSplname} 上淘金山，为您提供${productXtcp.xtcpFullname}信息介绍，包括起始资金<fmt:formatNumber value="${productXtcp.xtcpFxgm}" pattern="#0.####"/>万元、产品期限${productXtcp.xtcpCxq}个月、预期收益${productXtcp.xtcpNsyl}%，帮助您选出最适合自己信托产品，并完成购买信托产品。"/>
<title>${productXtcp.xtcpSplname}_信托产品-淘金山</title>
<link href="<%=basePath%>assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
 <script type="text/javascript" src="<%=basePath%>assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/scripts/ui/tip_box.js"></script>
<script src="<%=basePath%>assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<link href="<%=basePath%>assets/css/ui/simu.css" rel="stylesheet" />
<link href="<%=basePath%>assets/css/ui/xintuo.css" rel="stylesheet" />
</head>


<body>
<div class="tis_pcs_all">

<div class="header_top">
 <div class="tjs_1108px center">
     <span class="time">欢迎您来到淘金山，投资有风险，选择需谨慎！</span>
     <div class="topservice">4006-114-088</div>
	    <div class="toplinks">
			<c:if test="${empty sessionScope.userInfo.username}">  
			     <a href="<%=basePath%>rest/web/login" class="log_link">登录</a> | <a href="<%=basePath%>rest/web/passport/reg">注册</a> 
			</c:if>  
			<c:if test="${not empty sessionScope.userInfo.username}">  
			     <a href="<%=basePath%>rest/web/userCenter/index" class="log_link">欢迎您：${sessionScope.userInfo.username }</a> | <a href="<%=basePath%>rest/web/passport/logout">退出</a> 
			</c:if>      	    	    
	    </div>    
  </div>
</div>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;" >

    <div class="logo_wrap"><a href="<%=basePath%>"><img src="<%=basePath%>assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li style="width:155px"><a href="<%=basePath%>rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li style="width:155px"><a href="<%=basePath%>rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li style="width:155px"><a href="<%=basePath%>rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li style="width:155px"><a href="<%=basePath%>rest/web/xintuo/trust/trustSafeguard"  target="_blank">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center" >当前位置： <a href="<%=basePath%>">首页</a> &gt;<a href="<%=basePath%>rest/web/xintuo/trust/trustIndex">信托</a>&gt; <a href="<%=basePath%>rest/web/xintuo/trust/trustProduct">信托产品</a> &gt; ${productXtcp.xtcpSplname}</div></div>

<!-- 产品基本信息 开始-->

<div class="tjs_1108px center" style="position:relative;" >
<div style=" height:20px; width:100%;"></div>
<div class="xt_fastnav_wrap">
		<div class="fastnav_container">
			<div class="xt_fastnav" style="top: 0px; position: static; z-index: 1000;">
				<div class="fastnav_hd">快速直达</div>
				<div class="fastnav_bd">
					<ul class="fastnav_list">
						<li class="fastnav_item fastnav_item_active">
							<a href="#detail_info">
								<em class="nav_ico"></em>
								<span class="txt">产品概况</span>
							</a>
						</li>
						<li class="fastnav_item">
							<a href="#who">
								<em class="nav_ico"></em>
								<span class="txt">融资方</span>
							</a>
						</li>
						<li class="fastnav_item">
							<a href="#where">
								<em class="nav_ico"></em>
								<span class="txt">资金用途</span>
							</a>
						</li>
						<li class="fastnav_item">
							<a href="#howback">
								<em class="nav_ico"></em>
								<span class="txt">风控措施</span>
							</a>
						</li>
						<li class="fastnav_item">
							<a href="#from">
								<em class="nav_ico"></em>
								<span class="txt">还款来源</span>
							</a>
						</li>
						
						<li class="fastnav_item fastnav_item_last">
							<a href="#managercom">
								<em class="nav_ico"></em>
								<span class="txt">管理机构</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>              
	</div>
<div class="tjs_pcs_title xt_side_nav_box" id="detail_info"><div class="tjs_pcs_titleleft">产品概况</div>
	<c:choose>  
	    <c:when test="${productXtcp.xtcpStatus=='30'}">
	        <div class="tjs_pcs_titleright"> <a href="#" class="tjs_btn_disable" data_id="${productXtcp.xtcpId}">立即预约</a></div>
	    </c:when>    
	    <c:otherwise>        
			<div class="tjs_pcs_titleright"> <a href="#" class="tjs_btn" data_id="${productXtcp.xtcpId}">立即预约</a></div>
	    </c:otherwise>  
	</c:choose> 
	
</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_pcs_box">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tjs_pcs_bable">
  <tr>
    <td width="15%" height="40" class="tjs_pcs_titleoddbg">信托全称：</td>
    <td colspan="3" class="tjs_pcs_textoddbg">${productXtcp.xtcpFullname}</td>
    </tr>
  <tr>
    <td height="40"  class="tjs_pcs_titleevenbg">信托公司：</td>
    <td width="35%" class="tjs_pcs_textevenbg">${productXtcp.xtcpGszhname}</td>
    <td width="15%" class="tjs_pcs_titleevenbg">预计发行规模:</td>
    <td class="tjs_pcs_textevenbg"><fmt:formatNumber value="${productXtcp.xtcpFxgm}" pattern="#0.####"/>万</td>
  </tr>
  <tr>
    <td height="40" class="tjs_pcs_titleoddbg">预期年收益率：</td>
    <td class="tjs_pcs_textoddbg">${productXtcp.xtcpNsyl}%</td>
    <td class="tjs_pcs_titleoddbg">付息方式:</td>
    <td class="tjs_pcs_textoddbg">
             <c:choose>  
                <c:when test="${productXtcp.xtcpLxfp=='10'}">  
                  		 按月付息
                </c:when>
                 <c:when test="${productXtcp.xtcpLxfp=='20'}">  
                  		  按季付息
                </c:when>
                 <c:when test="${productXtcp.xtcpLxfp=='30'}">  
                  		  半年付息 
                </c:when> 
                 <c:when test="${productXtcp.xtcpLxfp=='40'}">  
                  		 按年付息
                </c:when> 
                 <c:when test="${productXtcp.xtcpLxfp=='50'}">  
                  		 到期付息
                </c:when>     
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose>
     </td>
  </tr>
  <tr>
    <td height="40"  class="tjs_pcs_titleevenbg">存续期：</td>
    <td class="tjs_pcs_textevenbg">${productXtcp.xtcpCxq} 个月</td>
    <td class="tjs_pcs_titleevenbg">投资方式:</td>
    <td class="tjs_pcs_textevenbg">
    		<c:choose>  
                <c:when test="${productXtcp.xtcpTzfs=='10'}">  
                  		信托贷款
                </c:when>
                 <c:when test="${productXtcp.xtcpTzfs=='20'}">  
                  		  股权投资
                </c:when>
                 <c:when test="${productXtcp.xtcpTzfs=='30'}">  
                  		  权益投资  
                </c:when> 
                 <c:when test="${productXtcp.xtcpTzfs=='40'}">  
                  		组合运用 
                </c:when> 
                 <c:when test="${productXtcp.xtcpTzfs=='50'}">  
                  		 债券投资
                </c:when>
                 <c:when test="${productXtcp.xtcpTzfs=='60'}">  
                  		 其他投资 
                </c:when>       
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose></td>
  </tr>
  <tr>
    <td height="40" class="tjs_pcs_titleoddbg">最低认购金额：</td>
    <td class="tjs_pcs_textoddbg"><fmt:formatNumber value="${productXtcp.xtcpZdrgje}" pattern="#0.####"/>万 </td>
    <td class="tjs_pcs_titleoddbg">抵押率:</td>
    <td class="tjs_pcs_textoddbg">${productXtcp.xtcpDyl}</td>
  </tr>
  <tr>
    <td height="40" class="tjs_pcs_titleevenbg">投资领域：</td>
    <td class="tjs_pcs_textevenbg">    
             <c:choose>  
                <c:when test="${productXtcp.xtcpTzly=='10'}">  
                  		房地产
                </c:when>
                 <c:when test="${productXtcp.xtcpTzly=='20'}">  
                  		  金融
                </c:when>
                 <c:when test="${productXtcp.xtcpTzly=='30'}">  
                  		基础设施  
                </c:when> 
                 <c:when test="${productXtcp.xtcpTzly=='40'}">  
                  		工商企业
                </c:when> 
                 <c:when test="${productXtcp.xtcpTzly=='50'}">  
                  		其他
                </c:when>                 
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose>
          </td>
    
    
    
    <td class="tjs_pcs_titleevenbg">抵押物:</td>
    <td class="tjs_pcs_textevenbg">${productXtcp.xtcpDyw}</td>
  </tr>
  <tr>
    <td height="40" class="tjs_pcs_titleoddbg">收益说明：</td>
    <td colspan="3" class="tjs_pcs_textoddbg"><table border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td>
         ${productXtcp.xtcpSysm}
         </td>
          </tr>
        </tbody>
    </table></td>
    </tr>
  <tr>
    <td height="150" class="tjs_pcs_titleevenbg">募集进度/账号：</td>
    <td colspan="3" class="tjs_pcs_textevenbg">
     <c:choose>  
         <c:when test="${productXtcp.xtcpStatus=='20'}">  
           		  募集中<br/>
         </c:when>    
         <c:otherwise>  
              	募集完毕<br/>
         </c:otherwise>  
     </c:choose>          
    ${productXtcp.xtcpMjzh}
    </td>
    </tr>
</table>


</div>
<!--// tjs_pcs_box 01-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title xt_side_nav_box" id="who">融资方是谁？</a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
  ${productXtcp.xtcpRzf}
 </div>
<!--// tjs_pcs_box 02-->
</div>
<!--// tjs_padding_width24px 02-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title xt_side_nav_box" id="where">资金用途是什么？</a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
   ${productXtcp.xtcpZjyt}
</div>
<!--// tjs_pcs_box 03-->
</div>
<!--// tjs_padding_width24px 03-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title xt_side_nav_box" id="howback">风控措施如何？</a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
 ${productXtcp.xtcpFkcs}
</div>
<!--// tjs_pcs_box 04-->
</div>



<!--// tjs_padding_width24px 04-->
<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title xt_side_nav_box" id="from">还款来源有哪些？</a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
 ${productXtcp.xtcpHkly}
</div>
<!--// tjs_pcs_box 04-->
</div>


<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px" style="padding-left:0px">
<div class="tjs_pcs_title xt_side_nav_box" id="managercom">管理机构是谁？</a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
 ${productXtcp.xtcpZcglr}
 </div>
<!--// tjs_pcs_box 05-->
</div>
<!--// tjs_padding_width24px 05-->

</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 产品基本信息 结束-->

<div class="tjs_pcs_flow">
<div class="tjs_1108px center" >
<div style=" height:30px;  font-size:0px;"></div>

<div class="tjs_pcs_title">信托购买流程</a></div>

<div class="tjs_flowdiv"  >
<ul>
<li >
<strong>在线预约</strong><br />
 <span style=" color:#9d9d9d;">或拨打4006-114-088</span>
</li>
<li class="tjs_margin_L45px">
<strong>确定意向</strong><br />
 <span style=" color:#9d9d9d;">额度和打款时间</span>
</li>
<li class="tjs_margin_L45px">
<strong>完成打款</strong><br />
 <span style=" color:#9d9d9d;">指定监管帐号</span>
</li>
<li class="tjs_margin_L45px">
<strong>成功购买</strong><br />
 <span style=" color:#9d9d9d;">按签署合同收取返现</span>
</li>

</ul>
</div>
<!--// tjs_pcs_box 05-->

<div class="clearfloat"></div>
</div>
</div>
<!--//tjs_pcs_flow -->





<footer>
<div class="footer_bg">
    <div class="tjs_1108px center">
        <div class="foot_menu">
            <p class="menu_title">关于我们</p>
            <ul class="foot_menu1">
                <li><a href="<%=basePath%>rest/web/aboutUs/index" target="_blank">><span>公司简介</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/team" target="_blank">><span>管理团队</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/jobs" target="_blank">><span>人才招聘</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/contact" target="_blank">><span>联系我们</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/partner" target="_blank">><span>商户合作</span></a></li>
            </ul>
        </div>
        <div class="foot_menu">
            <p class="menu_title">帮助中心</p>
            <ul class="foot_menu1">
                <li><a href="">><span>新手入门</span></a></li>
                <li><a href="">><span>理财问答</span></a></li>
                <li><a href="">><span>试用帮助</span></a></li>
            </ul>
        </div>
        <div class="foot_menu">
            <p class="menu_title">关注我们</p>
            <ul class="foot_menu1">
                <img src="<%=basePath%>assets/img/ui2/aboutimg.png" alt=""/>
            </ul>
        </div>
        <div class="foot_about_box">
            <ul class="about_box1">
                <li><img class="addr_home" src="<%=basePath%>assets/img/ui2/home.png" alt=""></li><li><span>联系地址</span></li><li class="w217">深圳市福田区福强路4001号文化创意园A座6层
（地铁龙岗线益田站D出口）</li>
            </ul>
            <ul class="about_box1">
                <li><img class="addr_home" src="<%=basePath%>assets/img/ui2/phone.png" alt=""></li><li><span>热线电话</span></li><li class="w217 lh40">4006-114-088</li>
            </ul>
            <ul class="about_box1">
                <li><img class="addr_home qq" src="<%=basePath%>assets/img/ui2/qq.png" alt=""></li><li><span class="zx">在线咨询</span></li><li class="w217 lh40">08:00-23:00</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="footers">
    <p class="pt25">投资有风险，理财需谨慎</p>
    <p>淘金山互联网在线理财 版权所有 © 2015-2018 粤ICP备 15026551号-1
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1255221274'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1255221274%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
	</p>
</div>
</footer>
<!-- /footer tjs_1108px -->
</div>
</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="<%=basePath%>rest/web/xintuo/trust/orderProduct";
$(function(){  
	$(".flow_menu_dash a").click(function(event){		
    	$(".flow_menu_dash a").attr("id","");
    	$(this).attr("id","flow_menu_click");
    });
	
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
