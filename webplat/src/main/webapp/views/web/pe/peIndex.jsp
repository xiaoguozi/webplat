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

<!--私募页面样式-->
<link href="assets/css/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
<script type="text/javascript" src="assets/scripts/slide.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>


</head>

<body>

<div class="home_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
    <div class="tjs_1108px center" style="position: relative;">
        <div class="logo_wrap">
            <a href="http://www.taojinshan.com.cn">
                <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
        </div>
        <div class="top_wrap_menu menu">
            <ul>
                <li><a href="rest/web/pe/peIndex"><span class="simu_on">私募首页</span></a></li>
                <li><a href="rest/web/pe/peIndexProduct"><span>私募产品</span></a></li>
                <li><a href="simuchanpinpaihang.html"><span>私募排行</span></a></li>
                <li><a href="simuchanpinjingli.html"><span>私募经理</span></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /header_menu -->

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
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                </ul>
            </div>
            <a class="prev" href="javascript:void(0)"></a><a class="next" href="javascript:void(0)"></a>
        </div>
        <script type="text/javascript">
            jQuery(".slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, delayTime: 700 });
        </script>
        <!-- 焦点广告 结束 -->
        <div class="tjs_liuchengbg"></div>
        <div class="tjs_1108px center">
            <div class="tjs_liucheng">
            </div>
            <div class="tjs_product_div">
                <div class="tjs_1108px center">
                    <div class="tjs_product_right ml0">
                        <div class="tjs_right_titlediv fontcolor">
                            <img class="tjs_img_diamond" src="assets/img/ui/diamond.png" />顶级私募推荐<span style="float: right;"><a href="#" class="tjs_moreurl">更多>></a></span>
                        </div>
                        <div class="tjs_coloreddiv ml0 bgcolor"></div>
                        <div class="tjs_right_typle border_left">
                            <c:forEach items="${top4Data}" var="peTop4Product">
                        	
                            <div class="tjs_right_unit w275 tjs_right_2border">
                                <div class="tjs_private_icodiv">
                                    <div style="height: 23px; width: 100%;"></div>
                                    <div class="tjs_right_privatetitle chanpinjingli">
                                        <img src="assets/img/${peTop4Product.managerLogo}" width="128" height="128" />
                                    </div>
                                    <div class="tjs_private_textbgdiv">累计收益</div>
                                    <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">${peTop4Product.accumulatedIncome}</span>%</div>
                                    <div class="tjs_private_textdiv">基金经理：<a href="#">${peTop4Product.managerName}</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="#">${peTop4Product.name}</a></div>
                                </div>
                                <div class="tjs_product_textdiv">${peTop4Product.managerReview} </div>
                                <div class="tjs_right_btndiv">
                                    <a class="tjs_btn" href="javascript:void(0)" onclick="alertbox(this)">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 01 -->
                            </c:forEach>
                            

                            <div class="clearfloat"></div>
                        </div>
                    </div>
                    <!-- /顶级私募推荐 -->
                    <div class="tjs_right_titlediv fcolor">
                        <img class="tjs_img_diamond" src="assets/img/ui/ranklist.png" />私募收益排行 
        <div class="sel_wrap">
            <label>全部策略</label>
            <select class="select">
                <option value="0">全部策略</option>
                <option value="1">股票策略</option>
                <option value="2">宏观策略</option>
                <option value="3">管理期货</option>
                <option value="4">事件驱动</option>
                <option value="5">相对价值策略</option>
                <option value="6">债券策略</option>
                <option value="7">组合基金</option>
                <option value="8">复合策略</option>
                <option value="9">其它策略</option>
            </select>
        </div>
                        <!--<select class="tjs_select">
            

        </select>-->
                        <span style="float: right;"><a href="#" class="tjs_moreurl">更多>></a></span>
                    </div>
                    <div class="tjs_coloreddiv ml0 bgcolorc"></div>
                    <div class="tjs_years">
                        <ul>
                            <li><a class="jhz_border" href="">今年以来</a></li>
                            <li><a href="">2014</a></li>
                            <li><a href="">2013</a></li>
                            <li><a href="">2012</a></li>
                            <li><a href="">2011</a></li>
                            <li><a href="">2010</a></li>
                            <li><a href="">2009</a></li>
                            <li><a href="">2008</a></li>
                            <li><a href="">2007</a></li>
                            <li><a href="">2006</a></li>
                        </ul>
                    </div>
                    <table class="tjs_table_shouyipaihang" cellpadding="0" cellspacing="0">
                        <c:forEach items="${top10Data}" varStatus="status" var="peTop10Product">
	                        <tr>
	                            <td class="tjs_table_td_one">
	                            	<c:if test="${status.count <10}">
	                            	    <c:if test="${status.count <=3}">
			                                <span class="tjs_xuhao">0${status.count}</span>
	                            	    </c:if>
	                            	    <c:if test="${status.count > 3}">
	                            	    	<span class="tjs_xuhao hunse">0${status.count}</span>
	                            	    </c:if>
	                            	</c:if>
	                            	<c:if test="${status.count >= 10}">
		                                <span class="tjs_xuhao hunse">${status.count}</span>
	                            	</c:if>
	                            </td>
	                            <td class="tjs_table_td_two">
	                                <div class="tjs_table_div_right">
	                                    <p class="tjs_table_ptitle">${peTop10Product.name}</p>
	                                    <p class="tjs_table_pname">${peTop10Product.managerName}</p>
	                                    <p>${peTop10Product.companyName}</p>
	                                </div>
	                            </td>
	                            <td class="tjs_table_td_three">
	                                <div class="tjs_table_div_right">
	                                    <p>近一年收益：${peTop10Product.oneRate}</p>
	                                    <p>近二年收益：${peTop10Product.towRate}</p>
	                                    <p>今年以来收益：<span class="tjs_table_pname">${peTop10Product.nowRate}</span></p>
	                                </div>
	                            </td>
	                            <td class="tjs_table_td_four">
	                                <p>累计收益</p>
	                                <p class="tjs_num"><fmt:formatNumber value="${peTop10Product.accumulatedIncome}" pattern="#0"/>.<span class="tjsfont_size"><fmt:formatNumber value="${peTop10Product.accumulatedIncome*100%100}" pattern="00"/>%</span></p>
	                                <p><a href="#" class="tjs_btn">我要预约</a></p>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>


                </div>
            </div>
            <!-- /tjs_product_div -->
            <!-- 私募板块结束 -->

        </div>
        
		<%@ include file="/views/web/footer.jsp"%>
    </div>
    <!-- /home_all -->
    <script>
        window.onload = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            //--/轮播按钮--
            //--自定义下拉框--
            $(".sel_wrap").on("change", function () {
                var o;
                var opt = $(this).find('option');
                opt.each(function (i) {
                    if (opt[i].selected == true) {
                        o = opt[i].innerHTML;
                    }
                })
                $(this).find('label').html(o);
            }).trigger('change');
            //--/自定义下拉框--
            //--表格单行变色--
            $("tr:even").css("background", "#EEEDEB");
            //--/表格单行变色--
        }
        
      	//--预约--
        function alertbox() {
            alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
        }
        //--/预约--
    </script>
    
    
<script>

    

</body>
</html>




















