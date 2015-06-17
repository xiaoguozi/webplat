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
	<title>淘金山-跟我淘金山</title>
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />
	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />
	
	<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
	<script type="text/javascript" src="assets/scripts/slide.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
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
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span class="simu_on">淘金配资</span></a></li>
                        <!-- 
                        <li><span>淘金募集</span></li>
                        <li><span>淘金自营</span></li>
                         -->
                        <li><a href="rest/web/peizi/usercenter/dxpUserCenter"><span>个人中心</span></a></li>
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
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资 </a> <span class="sep">&gt;</span> <a href="rest/web/peizi/capital" class="path_item">淘金配资</a> <span class="sep">&gt;</span> <span class="txt">低息1配1</span> </div>
        </div>
        <div class="w100bg">
            <div class="tjs_1108px center">
                <div class="pz_produce">
                    <img src="assets/img/peizi/peizisq.png" width="34" alt=""><b>低息1配1 配资申请</b>
                </div>
                <div class="bgcolor">
                    <div class="programbox">
                        <h3>免费体验</h3>
                        <div class="mf_box">
                            <table class="ty_tbl" style="width:70%;margin:0 auto;">
                                <tr>
                                    <td><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataZcpzj}" pattern="########.##" /></span> 元<br />总操盘金额</td>
                                    <td style="width:10px"><b class="font26">=</b></td>
                                    <td><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataTzbzj }" pattern="########.##" /></span> 元<br />投资本金</td>
                                    <td style="width:10px"><b class="font26">+</b></td>
                                    <td><span class="colorf06 font26"><fmt:formatNumber value="${peizi.dataPzje }" pattern="########.##" /></span> 元<br />配资金额</td>
                                </tr>
                            </table>
                            <div class="pros_box bord_d" style="width:92%;">
                                <table class="mf_tbl" style="width:100%">
                                    <tr>
                                        <td>亏损警告线：<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataJjx }" pattern="########.##" /></span></td>
                                        <td>亏损平仓线：<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataPcx }" pattern="########.##" /></span></td>
                                        <td>利息费:<span class="font26 colorf06"><fmt:formatNumber value="${peizi.dataJklxTotal }" pattern="########.##" /></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>利益分配：<b class="font26">全部归你</b></td>
                                        <td>投资方向：<b class="font26">深沪A股</b></td>
                                        <td>仓位要求: <b class="font26">以合同为准</b></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pros_box bord_d"  style="width:92%;height:100px;" >
                                <table class="mf_tbl" style="width:100%;">
                                <tr>
                                <td style="width:50%;border-right:1px dashed;" >
	                                 <b class="color158 font26">                              
		                                <c:choose>  
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
                                <td style="width:50%">
                                	<div style="width:100%;text-align:left;margin:0 auto;font-size:18px">投资保证金付款账户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> 
			                        <div style="width:91%;margin:0 auto;padding-top:10px;padding-bottom:10px">                                                                                         
			                        <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">帐&nbsp;&nbsp;&nbsp;号：6226 0965 5051 9592</div>
			                        <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">户&nbsp;&nbsp;&nbsp;名：吴&nbsp;田&nbsp;&nbsp;&nbsp;&nbsp;</div> 
			                        <div style="width:100%;margin:0 auto;text-align:left;font-size:14px">开户行：招商银行深圳分行深纺支行</div>                                                
			                        </div> 
                                
                                </td>
                                </tr>
                                <tr>
                                  <td colspan="2" style="text-align:center">
                                    <p class="pt10">热线电话：<span class="colorf06">4006-114-008&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
                                  </td>
                                </tr>
                                 </table>                                                                                
                            </div> 
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
        $(document).ready(function () {
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
                    sum = $(".cpmoney:eq(" + i + ")").text();
                    $("#capital").text(sum);
                    $("#assure").text(sum * 0.25);
                    $("#loss").text(sum * 0.9);
                    $("#close").text(sum * 0.875);
                    $("#fee").text(sum * 0.00075);

                });
            });
            /*--/操盘金额--*/
            /*--QQ咨询--*/
            $(".about_box1:eq(2)").hover(function () {
                $(".qq").attr("src", "assets/img/peizi/qqhove.png");
                $(".zx").css("color", "#1682CA");
            }, function () {
                $(".qq").attr("src", "assets/img/peizi/qq.png");
                $(".zx").css("color", "#8c969d");
            })
            /*--/QQ咨询--*/
            //--自定义下拉框--
            $(".sel_wrap").click(function () {
                var money = "7.5";
                $(".select").toggle();
                $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
                $(".select>li").each(function (index) {
                    $(this).click(function () {
                        var opt = $(this).html();
                        $(".lbl").html(opt);
                        var num = opt.substring(0, 1);
                        $("#manageFee").text(num * money);
                    })
                })
            })
            //--/自定义下拉框--
        })
        function alertbox() {
            alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
        }
    </script>
</body>
</html>
