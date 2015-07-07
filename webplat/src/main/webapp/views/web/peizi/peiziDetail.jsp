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
 	<script type="text/javascript" src="assets/scripts/ui/peizi.js"></script>
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
                        <li><a href="rest/web/peizi/raise"><span>淘金募集</span></a></li>
                        <li><a href="rest/web/peizi/self"><span>淘金自营</span></a></li>
                        -->
                        <c:if test="${peizi.dataType=='10'}">
	                        <li><a href="rest/web/peizi/usercenter/mfp"><span class="simu_on">个人中心</span></a></li>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='20'}">
		                    <li><a href="rest/web/peizi/usercenter/ttpUserCenter"><span class="simu_on">个人中心</span></a></li>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='30'}">
		                    <li><a href="rest/web/peizi/usercenter/yypUserCenter"><span class="simu_on">个人中心</span></a></li>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='40'}">
		                    <li><a href="rest/web/peizi/usercenter/dxpUserCenter"><span class="simu_on">个人中心</span></a></li>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='50'}">
		                    <li><a href="rest/web/peizi/usercenter/mxp"><span class="simu_on">个人中心</span></a></li>
	                    </c:if>
                        
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
					 <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>                   
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
        </div>
   	 
   	 	<div class="w100bg">
	            <div class="tjs_1108px center">
	                <div class="pz_produce">
	                    <img src="assets/img/peizi/peizisq.png" width="34" alt="">
	                    <c:if test="${peizi.dataType=='10'}">
		                    <b>免费配 方案进度</b>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='20'}">
		                    <b>天天配 方案进度</b>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='30'}">
		                    <b>月月配 方案进度</b>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='40'}">
		                    <b>低息1配1 方案进度</b>
	                    </c:if>
	                    <c:if test="${peizi.dataType=='50'}">
		                    <b>免息配 方案进度</b>
	                    </c:if>
	                </div>
	                <div class="bgcolor">
	                    <div class="programbox">
	                        <h3>账号密码</h3>
	                        <div class="pros_box">
	                        	<c:if test="${peizi.dataOperaStatus=='10'}">
		                            <p>交易账户： <span class="color158">暂无</span></p>
	                        	</c:if>
	                        	<c:if test="${peizi.dataOperaStatus=='20'}">
		                            <p>交易账户： <span class="color158">${peizi.dataJyzf}</span></p>
	                        	</c:if>
	                        	<c:if test="${peizi.dataOperaStatus=='30'}">
		                            <p>交易账户： <span class="color158">已回收</span></p>
	                        	</c:if>
	                            <c:if test="${peizi.dataOperaStatus=='10'}">
	                            	<p>交易密码： <span class="color158">暂无</span>（为了您的资金安全，请妥善保管好密码）</p>
	                            </c:if>
	                            <c:if test="${peizi.dataOperaStatus=='20'}">
	                            	<p>交易密码： <span class="color158">${peizi.dataJymm}</span>（为了您的资金安全，请妥善保管好密码）</p>
	                            </c:if>
	                            <c:if test="${peizi.dataOperaStatus=='30'}">
	                            	<p>交易密码： <span class="color158">已回收</span>（为了您的资金安全，请妥善保管好密码）</p>
	                            </c:if>
	                            <p>重点提醒： 交易前请先阅读 <a href="javascript:openAgree('<%=basePath%>');">天天配合作操盘协议</a></p>
	                            <p>交易软件： <a href="rest/web/peizi/trade">进入交易软件下载页面</a>（恒生系统每晚20:00进行维护，这段时间无法进行操作）</p>
	                        </div>
	                        <h3 style="display: none;">方案详情</h3>
	                        <div class="pros_box" style="display: none;">
	                            <p>开始时间： 2015-8-18</p>
	                            <p>预计到期时间： 2015-9-10 <a style="float:right" href="javascript:openAgree('<%=basePath%>');">天天配合作操盘协议</a></p>
	                        </div>
	                        <div class="pros_box">
	                        <table class="ty_tbl" style="width: 98%">
	                            <tr>
	                            	<c:if test="${peizi.dataType=='10'}">
	                                	<td class="color158 font26" style="white-space:nowrap;">免费体验</td>
	                                </c:if>
	                                <c:if test="${peizi.dataType=='20'}">
	                                	<td class="color158 font26" style="white-space:nowrap;">天天配</td>
	                                </c:if>
	                                <c:if test="${peizi.dataType=='30'}">
	                                	<td class="color158 font26" style="white-space:nowrap;">月月配</td>
	                                </c:if>
	                                <c:if test="${peizi.dataType=='40'}">
	                                	<td class="color158 font26" style="white-space:nowrap;">低息1配1</td>
	                                </c:if>
	                                <c:if test="${peizi.dataType=='50'}">
	                                	<td class="color158 font26" style="white-space:nowrap;">免息体验</td>
	                                </c:if>
	                                
	                                <c:if test="${peizi.dataType=='10'}">
	                                <td><span class="colorf06 font26">10000</span> 元<br />总操盘金额</td>
	                                </c:if>
	                                <c:if test="${peizi.dataType!='10'}">
	                                <td><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" /></span> 元<br />总操盘金额</td>
	                                </c:if>
	                                
	                                <td style="width:10px"><b class="font26">=</b></td>
	                                
	                                <c:if test="${peizi.dataType=='10'}">
	                                <td colspan="1"><span class="colorf06 font26">0</span> 元<br />投资本金</td>
	            					</c:if>
	            					<c:if test="${peizi.dataType!='10'}">
	                                <td colspan="1"><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataTzbzj}" pattern="########.##" /></span> 元<br />投资本金</td>
	            					</c:if>
	            					                    
	                                <td style="width:10px"><b class="font26">+</b></td>
	                                <td colspan="1"><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataPzje}" pattern="########.##" /></span> 元<br />配资金额</td>
	                                <td colspan="2" style="width: 1px"></td>
	                            </tr>
	                            
	                        </table>
	                        <table class="ty_tbl" style="width: 98%">
	                            <tr>
                                     <td style="white-space:nowrap;">亏损警告线：<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataJjx==null?0:peizi.dataJjx}" pattern="########.##" /></span>元</td>
                                     <td style="white-space:nowrap;">亏损平仓线：<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataPcx==null?0:peizi.dataPcx}" pattern="########.##" /></span>元</td>
                                     
                                     <c:if test="${peizi.dataType=='30' || peizi.dataType=='40'}">
                                     		<td style="white-space:nowrap;" >利息:<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataJklxTotal==null?0:peizi.dataJklxTotal}" pattern="########.##" /></span>元</td>
                                     </c:if>
                                     <c:if test="${peizi.dataType=='10' || peizi.dataType=='20' || peizi.dataType=='50'}">
                                     		<td style="white-space:nowrap;" >账户管理费:<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataJklxTotal==null?0:peizi.dataJklxTotal}" pattern="########.##" /></span>元</td>
                                     </c:if>
                                     
                                     <c:if test="${peizi.dataType=='30' || peizi.dataType=='40'}">
                                     	<td  style="white-space:nowrap;">资金使用期限:<span class="font26 colorf06">${peizi.dataZjsyqx}</span>月</td>
                                     </c:if>
                                     <c:if test="${peizi.dataType=='10' || peizi.dataType=='20' || peizi.dataType=='50'}">
                                     	<td style="white-space:nowrap;" >资金使用期限:<span class="font26 colorf06">${peizi.dataZjsyqx}</span>天</td>
                                     </c:if>
                                     
                                 </tr>
	                        </table>
	                        
                            </div>  
	                         <div class="pros_box bord_d"  style="width:82%;height:100px;" >
                                <table class="mf_tbl" style="width:100%;">
                                <tr>
                                <td style="width:100%;text-align: center;" >
	                                 <b class="color158 font26">                              
		                                <c:choose>  
		                                	<c:when test="${peizi.dataOperaStatus=='1'}">  
							                  		待支付......
							                </c:when>
							                <c:when test="${peizi.dataOperaStatus=='10'}">  
							                  		正在验资......
							                </c:when>
							                 <c:when test="${peizi.dataOperaStatus=='20'}">  
							                  		  操盘中......
							                </c:when>
							                 <c:when test="${peizi.dataOperaStatus=='30'}">  
							                  		  已完结
							                </c:when>					                
							                <c:otherwise>  
							                     	正在验资......
							                </c:otherwise>  
		            					</c:choose>                                                                         
	                                </b> 
                                </td>
                                </tr>
                                <tr>
                                  <td colspan="2" style="text-align:center">
                                    <p class="pt10">热线电话：<span class="colorf06">4006-114-008</span></p>
                                  </td>
                                </tr>
                                 </table>                                                                                
                            </div> 
	                    </div>
	                </div>
	            <hr class="pc" />
	        </div>
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
        /*--操盘金额--*/
        var sum = 0;
        $(".cpbox1").each(function (i) {
            $(this).click(function () {
                $(".cpbox1").removeClass("on")
                $(this).addClass("on");
                sum = $(".cpmoney:eq('" + i + "')").text();
                $("#capital").text(sum);
                $("#assure").text(sum * 0.25);
                $("#loss").text(sum * 0.9);
                $("#close").text(sum * 0.875);
                $("#fee").text(sum * 0.00075);
                
            });
        });
        /*--/操盘金额--*/
	/*--QQ咨询--*/
		$(".about_box1:eq(2)").hover(function (){
			$(".qq").attr("src","assets/img/peizi/qqhove.png");
			$(".zx").css("color","#1682CA");
		},function(){
			$(".qq").attr("src","assets/img/peizi/qq.png");
			$(".zx").css("color","#8c969d");
		})
	/*--/QQ咨询--*/
	   
						
	});
       
</script>
</body>
</html>