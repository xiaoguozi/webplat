<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
	<title>淘金山-个人中心</title>
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />	
    <script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
    <script src="app/lib/security/sha256.js" type="text/javascript"></script>
    <script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="home_all">
	<%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
					    <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <!--  
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                        -->
                        <li><a href="rest/web/peizi/usercenter/pzzhongxin"><span class="simu_on">个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                	<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
					<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
        </div>
    <div class="w100bg">
        <hr class="pc"/>
        <div class="tjs_1108px center">
            <div class="bgcolor">
                <div class="mycenter_left">
                    <ul class="mc_lbox">
                    	<li >可用余额</li>                                             
                        <li class="colorf06 font18 lh10 ">0.00元</li>
                        <li><a class="tjs_btn pzbtn" href="javascript:void()"><b>¥</b> 充值</a></li>
                    	   
                                         
                        <li class="wypz">我的配资</li>
                        <div class="ttp wypz_div" >
                        	<span class="bor_dashed"><a href="rest/web/peizi/usercenter/mfp" >免费配</a></span>
                        	<span class="bor_dashed"><a href="rest/web/peizi/usercenter/mxp">免息配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/ttpUserCenter">天天配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/yypUserCenter">月月配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/dxpUserCenter">低息1配1</a></span>
                        </div>
                        
                        <li class="wdzj">我的资金</li>
                        <div class="bor_dashed moneymx"><a href="javascript:void()">资金明细</a></div>
                        
                        <li class="zlsz">资料设置</li>
                        <div class="bor_dashed  mmxg"><a href="rest/web/userCenter/userModify">密码修改</a></div>
                        
                        
                    </ul>
                </div>
                <script>
                    $(function () {
                    	
                        $(".wypz").click(function () {
                            $(".ttp").slideToggle(500);
                        });
                        $(".wdzj").click(function () {
                            $(".moneymx").slideToggle(300);
                        });
                                             
                        $(".zlsz").click(function () {
                            $(".mmxg").slideToggle(300);
                        });
                        
                    })
                </script>
	            <div class="mycenter_right" id="mycenter_right">
	                <b class="my_tit">资产总览</b>
               		 <table class="my_tbl1">
	                    <thead>
	                    <tr>
	                        <td>账户总资产<span>(元)</span></td>
	                        <td>配资金额<span>(元)</span></td>
	                        <td>投资本金<span>(元)</span></td>
	                        <td>账户余额<span>(元)</span></td>
	                    </tr>
	                    </thead>
	                    <tbody>
	                    <tr>
	                        <td class="colorf06">0.00</td>
	                        <td>0.00</td>
	                        <td>0.00</td>
	                        <td style="border:none;">0.00</td>
	                    </tr>
	                    </tbody>
                 </table>
	              
	              <!-- 天天配 --> 
	               <b class="my_tit" style="border-bottom-width:1px">天天配 <span class="tit_span">最近进行中<span >${!empty ttPeizi?1:0}</span>笔</span><span class="f-right" style="font-size:14px;color:#666;font-weight:normal">交易账号密码请在方案详情中查看&nbsp;&nbsp;</span></b>                  
	                <c:if test="${!empty ttPeizi}">
	                <table class="my_tbl2">                    
	                    <tr>
	                        <td><span class="colorf06 font30"> <fmt:formatNumber value="${ttPeizi.dataZcpzj}" pattern="#0.####"/></span> 元<br />总操盘资金</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${ttPeizi.dataJjx}" pattern="#0.####"/></span>元<br />亏损警告线</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${ttPeizi.dataPcx}" pattern="#0.####"/></span>元<br />亏损平仓线</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${ttPeizi.dataJklxTotal}" pattern="#0.####"/></span>元<br />账户管理费</td>
	                        <td>
	                        	<c:if test="${ttPeizi.dataOperaStatus=='10'}">
	                        		<b class="color158 font18">验资中</b>
	                        	</c:if>
	                        	<c:if test="${ttPeizi.dataOperaStatus=='20'}">
	                        		<b class="color158 font18">操盘中</b>
	                        	</c:if>
	                        	<c:if test="${ttPeizi.dataOperaStatus=='30'}">
	                        		<b class="color158 font18">已完结</b>
	                        	</c:if>
	                        </td>
	                    </tr>
	                    <tr>				                    
	                       <td>发起时间：<span class="color158"><fmt:formatDate value="${ttPeizi.dataSubmitDate}" pattern="yyyy-MM-dd" /></span></td> 			                        
	                       <td colspan="3" style="text-align:left;text-indent:3em;"></td>
	                       <td><a class="tjs_next_btn" href="rest/web/peizi/usercenter/pzdetail?dataId=${ttPeizi.dataId}">查询方案详情</a></td>
	                   </tr>
	                </table>
	                </c:if>
                    <!--无产品状态-->
	                <c:if test="${empty ttPeizi}">
		                <table class="my_tbl2">
		                    <tr>
		                        <td colspan="5"><a class="my_add" href="rest/web/peizi/ttp/dayCapital" title="添加配资"></a></td>
		                    </tr>
		                </table>
	                </c:if> 
	                
	               <div style="border-bottom:dashed 1px #d3d3d3"></div>
	               
	               <!-- 月月配 start-->
	                <b class="my_tit" style="border-bottom-width:1px">月月配 <span class="tit_span">最近进行中<span >${!empty yyPeizi?1:0}</span>笔</span><span class="f-right" style="font-size:14px;color:#666;font-weight:normal">交易账号密码请在方案详情中查看&nbsp;&nbsp;</span></b>                  
	               <c:if test="${!empty yyPeizi}">
	                <table class="my_tbl2"  >
	                    <tr>
	                        <td><span class="colorf06 font30"> <fmt:formatNumber value="${yyPeizi.dataZcpzj}" pattern="#0.####"/></span> 元<br />总操盘资金</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${yyPeizi.dataJjx}" pattern="#0.####"/></span>元<br />亏损警告线</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${yyPeizi.dataPcx}" pattern="#0.####"/></span>元<br />亏损平仓线</td>
	                        <td><span class="colorf06 font30"><fmt:formatNumber value="${yyPeizi.dataJklxTotal}" pattern="#0.####"/></span>元<br />借款利息费</td>
	                        <td>
	                        	<c:if test="${yyPeizi.dataOperaStatus=='10'}">
	                        		<b class="color158 font18">验资中</b>
	                        	</c:if>
	                        	<c:if test="${yyPeizi.dataOperaStatus=='20'}">
	                        		<b class="color158 font18">操盘中</b>
	                        	</c:if>
	                        	<c:if test="${yyPeizi.dataOperaStatus=='30'}">
	                        		<b class="color158 font18">已完结</b>
	                        	</c:if>
	                        </td>
	                    </tr>
	                    <tr>
	                    
	                        <td>发起时间：<span class="color158"><fmt:formatDate value="${yyPeizi.dataSubmitDate}" pattern="yyyy-MM-dd" /></span></td> 			                        
	                        <td colspan="3" style="text-align:left;text-indent:3em;"></td>
	                        <td><a class="tjs_next_btn" href="rest/web/peizi/usercenter/pzdetail?dataId=${yyPeizi.dataId}">查询方案详情</a></td>
	                    </tr>
	                </table>
	                </c:if>
	                
	                
	                <!--无产品状态-->
	                <c:if test="${empty yyPeizi}">
		                <table class="my_tbl2">
		                    <tr>
		                        <td colspan="5"><a class="my_add" href="rest/web/peizi/yyp/monthCapital" title="添加配资"></a></td>
		                    </tr>
		                </table>
	                </c:if> 
	                <!-- 月月配 end-->
	                  <div style="border-bottom:dashed 1px #d3d3d3"></div>
	                <!-- 低息配 --> 	                	                
	                <b class="my_tit" style="border-bottom-width:1px" >低息1配1 <span class="tit_span">最近进行中<span >${!empty dxPeizi?1:0}</span>笔</span><span class="f-right" style="font-size:14px;color:#666;font-weight:normal">交易账号密码请在方案详情中查看&nbsp;&nbsp;</span></b>                  
		                 <c:if test="${!empty dxPeizi}">
		                <table class="my_tbl2"  >
		                    <tr>
		                        <td><span class="colorf06 font30"> <fmt:formatNumber value="${dxPeizi.dataZcpzj}" pattern="#0.####"/></span> 元<br />总操盘资金</td>
		                        <td><span class="colorf06 font30"><fmt:formatNumber value="${dxPeizi.dataJjx}" pattern="#0.####"/></span>元<br />亏损警告线</td>
		                        <td><span class="colorf06 font30"><fmt:formatNumber value="${dxPeizi.dataPcx}" pattern="#0.####"/></span>元<br />亏损平仓线</td>
		                        <td><span class="colorf06 font30"><fmt:formatNumber value="${dxPeizi.dataJklxTotal}" pattern="#0.####"/></span>元<br />借款利息费</td>
		                        <td>
		                        	<c:if test="${dxPeizi.dataOperaStatus=='10'}">
		                        		<b class="color158 font18">验资中</b>
		                        	</c:if>
		                        	<c:if test="${dxPeizi.dataOperaStatus=='20'}">
		                        		<b class="color158 font18">操盘中</b>
		                        	</c:if>
		                        	<c:if test="${dxPeizi.dataOperaStatus=='30'}">
		                        		<b class="color158 font18">已完结</b>
		                        	</c:if>
		                        </td>
		                    </tr>
		                    <tr>
		                    
		                        <td>发起时间：<span class="color158"><fmt:formatDate value="${dxPeizi.dataSubmitDate}" pattern="yyyy-MM-dd" /></span></td> 			                        
		                        <td colspan="3" style="text-align:left;text-indent:3em;"></td>
		                        <td><a class="tjs_next_btn" href="rest/web/peizi/usercenter/pzdetail?dataId=${dxPeizi.dataId}">查询方案详情</a></td>
		                    </tr>
		                </table>
	                    </c:if>
	                
	                
	                  <!--无产品状态-->
		                <c:if test="${empty dxPeizi}">
			                <table class="my_tbl2">
			                    <tr>
			                        <td colspan="5"><a class="my_add" href="rest/web/peizi/dxp/lowCapital" title="添加配资"></a></td>
			                    </tr>
			                </table>
		                </c:if> 
	                
	                
	               
	            </div>

            </div>
        </div>
        <hr class="pc"/>
    </div>
<!-- 配资页尾 -->
<%@ include file="/views/web/footer.jsp"%>
<!-- 配资页尾 结束 -->
<script type="text/javascript">
$(function() {  
        /*-二级导航-*/
        $(".tjpz").hover(function () {
            $(".nav_menu").show();
            $(".tjpz>a>span").addClass("tspan");
        }, function () {
            $(".nav_menu").hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
        $(".nav_menu").hover(function () {
            $(this).show();
            $(".tjpz>a>span").addClass("tspan");
        });
        $(".nav_menu").mouseleave(function () {
            $(this).hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
   	       	 					
	});
       
</script>
</body>
</html>