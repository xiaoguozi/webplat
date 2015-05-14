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
<title>${productXtcp.xtcpSplname}</title>
<link href="<%=basePath%>assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
 <script type="text/javascript" src="<%=basePath%>assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/scripts/ui/tip_box.js"></script>
<script src="<%=basePath%>assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<link href="<%=basePath%>assets/css/ui/simu.css" rel="stylesheet" />
</head>

<body>
<div class="tis_pcs_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href="index.html"><img src="<%=basePath%>assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li><a href="<%=basePath%>rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li><a href="<%=basePath%>rest/web/xintuo/trust/trustProduct" target="_blank">信托产品</a></li>
    <li><a href="<%=basePath%>rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li><a href="<%=basePath%>rest/web/xintuo/trust/trustSafeguard"  target="_blank">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="<%=basePath%>">首页</a> > <a href="<%=basePath%>rest/web/xintuo/trust/trustProduct">信托产品</a> > ${productXtcp.xtcpSplname}</div></div>

<!-- 产品基本信息 开始-->

<div class="tjs_1108px center" style="position:relative;">
<div style=" height:20px; width:100%;"></div>
<div class="flow_menu">
<ul>
<li class="flow_menu_solid flow_menu_titlebg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>快速直达</strong></li>
<li class="flow_menu_dash"><a href="#A"  id="flow_menu_click">产品概况</a></li>
<li class="flow_menu_dash"><a href="#B">融资方</a></li>
<li class="flow_menu_dash"><a href="#C">资金用途</a></li>
<li class="flow_menu_dash"><a href="#D">风控措施</a></li>
<li class="flow_menu_dash"><a href="#E">还款来源</a></li>
<li class="flow_menu_dash"><a href="#F">资产管理</a></li>
</ul>
</div>
<div class="tjs_pcs_title"><div class="tjs_pcs_titleleft">产品概况</div> <div class="tjs_pcs_titleright"> <a href="#" class="tjs_btn" data_id="${productXtcp.xtcpId}">立即预约</a></div></div>
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
                  		不限按月付息
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
    ${productXtcp.xtcpMjzh}
    </td>
    </tr>
</table>


</div>
<!--// tjs_pcs_box 01-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px">
<div class="tjs_pcs_title">融资方是谁？<a name="B" id="B"></a></div>
  ${productXtcp.xtcpRzf}
<!--// tjs_pcs_box 02-->
</div>
<!--// tjs_padding_width24px 02-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px">
<div class="tjs_pcs_title">资金用途是什么？<a name="C" id="C"></a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
   ${productXtcp.xtcpZjyt}
</div>
<!--// tjs_pcs_box 03-->
</div>
<!--// tjs_padding_width24px 03-->

<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px">
<div class="tjs_pcs_title">风控措施如何？<a name="D" id="D"></a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
 ${productXtcp.xtcpFkcs}
</div>
<!--// tjs_pcs_box 04-->
</div>



<!--// tjs_padding_width24px 04-->
<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px">
<div class="tjs_pcs_title">还款来源有哪些？<a name="E" id="E"></a></div>
<div class="tjs_pcs_box tjs_padding_height16px">
 ${productXtcp.xtcpHkly}
</div>
<!--// tjs_pcs_box 04-->
</div>


<div style=" height:30px; width:100%; font-size:0px;"></div>
<div  class="tjs_padding_width24px">
<div class="tjs_pcs_title">资产管理人是谁？<a name="F" id="F"></a></div>

 ${productXtcp.xtcpZcglr}
<!--// tjs_pcs_box 05-->
</div>
<!--// tjs_padding_width24px 05-->

</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 产品基本信息 结束-->

<div class="tjs_pcs_flow">
<div class="tjs_1108px center">
<div style=" height:30px; width:100%; font-size:0px;"></div>

<div class="tjs_pcs_title">信托购买流程<a name="G" id="G"></a></div>

<div class="tjs_flowdiv">
<ul>
<li>
<strong>在线预约</strong><br />
 <span style=" color:#9d9d9d;">或拨打4000-181-131</span>
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





<%@ include file="/views/web/footer.jsp"%>
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
	  
	IndexPage.orderProduct= function(productId,productType,username,usertel){
	     $.post(IndexPage.orderProductUrl, 
	            $('#orderform').formSerialize(),
	            function(data){		              
					
	             });
	 }  
	
   });
   
   
function placeholderSupport() {
    return 'placeholder' in document.createElement('input');
}
</SCRIPT>
</body>
</html>
