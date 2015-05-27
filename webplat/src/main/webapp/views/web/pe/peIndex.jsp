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
<link href="assets/css/ui/simu.css" rel="stylesheet" />

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
            <a href="#">
                <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
        </div>
        <div class="top_wrap_menu menu">
            <ul>
                <li><a href="rest/web/pe/peIndex"><span class="simu_on">私募首页</span></a></li>
                <li><a href="rest/web/pe/peIndexRate" target="_blank"><span>私募排行</span></a></li>
                <li><a href="rest/web/pe/peIndexProduct" target="_blank"><span>私募产品</span></a></li>
                <li><a href="rest/web/pe/peIndexManager" target="_blank"><span>私募经理</span></a></li>
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
                    <li><a href="rest/web/pe/peIndex" >
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="rest/web/pe/peIndex" >
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="rest/web/pe/peIndex" >
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
                            <img class="tjs_img_diamond" src="assets/img/ui/diamond.png" />顶级私募推荐<span style="float: right;"><a href="rest/web/pe/peIndexProduct" target="_blank" class="tjs_moreurl">更多>></a></span>
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
                                    <div class="tjs_private_textdiv">基金经理：<a href="rest/web/pe/peIndexMDetail?managerId=${peTop4Product.managerId}" target="_blank">${peTop4Product.managerName}</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="rest/web/pe/peIndexProductDetail?peProductId=${peTop4Product.id}" target="_blank">${peTop4Product.name}</a></div>
                                </div>
                                <div class="tjs_product_textdiv">${peTop4Product.managerReview} </div>
                                <div class="tjs_right_btndiv">
                                    <a class="tjs_btn" href="#" data_id="${peTop4Product.id}">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 01 -->
                            </c:forEach>
                            

                            <div class="clearfloat"></div>
                        </div>
                    </div>
                    <!-- /顶级私募推荐 -->
                    <form id="modalForm" action="rest/web/pe/peIndex" method="post" >
                    <input type="hidden" id="peType" name="peType" value="${simuSearchVO.peType}" />
                    <input type="hidden" id="currentYear" name="currentYear" value="${simuSearchVO.currentYear}" />
                    <div class="tjs_right_titlediv fcolor">
                        <img class="tjs_img_diamond" src="assets/img/ui/ranklist.png" />私募收益排行 
				        <div class="sel_wrap">
				            <label class="lbl">
				            	<c:if test="${simuSearchVO.peType==0}">全部策略</c:if>
				            	<c:if test="${simuSearchVO.peType==1}">股票</c:if>
				            	<c:if test="${simuSearchVO.peType==2}">期货基金</c:if>
				            	<c:if test="${simuSearchVO.peType==3}">股票量化</c:if>
				            	<c:if test="${simuSearchVO.peType==4}">债券型</c:if>
				            	<c:if test="${simuSearchVO.peType==5}">定向增发</c:if>
				            	<c:if test="${simuSearchVO.peType==6}">宏观对冲</c:if>
				            	<c:if test="${simuSearchVO.peType==7}">组合基金</c:if>
				            	<c:if test="${simuSearchVO.peType==8}">其他</c:if>
				            </label>
				            <ul class="select" style="filter:alpha(opacity=100);">
				            	<li type="0" style="list-style-type:none;">全部策略</li>
				                <li type="1" style="list-style-type:none;">股票</li>
				                <li type="2" style="list-style-type:none;">期货基金</li>
				                <li type="3" style="list-style-type:none;">股票量化</li>
				                <li type="4" style="list-style-type:none;">债券型</li>
				                <li type="5" style="list-style-type:none;">定向增发</li>
				                <li type="6" style="list-style-type:none;">宏观对冲</li>
				                <li type="7" style="list-style-type:none;">组合基金</li>
				                <li type="8" style="list-style-type:none;">其他</li>
				            </ul>
				        </div>
                        <!--<select class="tjs_select">
            

        </select>-->
                        <span style="float: right;"><a href="rest/web/pe/peIndexProduct" class="tjs_moreurl">更多>></a></span>
                    </div>
                    <div class="tjs_coloreddiv ml0 bgcolorc"></div>
                    <div class="tjs_years">
                        <ul>
                        	<c:forEach items="${lstCommon}" varStatus="status" var="common">
                        		<c:if test="${common.netYear==currentYear}">
                        			<li><a href="" tag="${common.netYear}">今年以来</a></li>
                        		</c:if>
	                            <c:if test="${common.netYear!=currentYear}">
	                            	<li><a href="" tag="${common.netYear}">${common.netYear}</a></li>
	                            </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    </form>
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
	                                    <p class="tjs_table_ptitle"><a href="rest/web/pe/peIndexProductDetail?peProductId=${peTop10Product.id}" target="_blank" >${peTop10Product.name}</a></p>
	                                    <p class="tjs_table_pname"><a href="rest/web/pe/peIndexMDetail?managerId=${peTop10Product.managerId}" target="_blank" style="color: #FE6700;">${peTop10Product.managerName}</a></p>
	                                    <p>${peTop10Product.companyName}</p>
	                                </div>
	                            </td>
	                            <td class="tjs_table_td_three">
	                                <div class="tjs_table_div_right">
	                                    <p>近一年收益：${peTop10Product.oneRate}%</p>
	                                    <p>近二年收益：${peTop10Product.towRate}%</p>
	                                    <p>今年以来收益：<span class="tjs_table_pname"><fmt:formatNumber value="${peTop10Product.nowRate}" pattern="#0"/>.<fmt:formatNumber value="${peTop10Product.nowRate*100%100}" pattern="00"/>%</span></p>
	                                </div>
	                            </td>
	                            <td class="tjs_table_td_four">
	                                <p>累计收益</p>
	                                <p class="tjs_num"><fmt:formatNumber value="${peTop10Product.accumulatedIncome}" pattern="#0"/>.<span class="tjsfont_size"><fmt:formatNumber value="${peTop10Product.accumulatedIncome*100%100}" pattern="00"/>%</span></p>
	                                <p><a href="javascript:void(0)" class="tjs_btn" data_id="${peTop10Product.id}"><img src="assets/img/ui/clock.png" />立即预约</a></p>
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
	    var IndexPage = {};
	    IndexPage.orderProductUrl="rest/web/pe/peOrderProduct";
    
        window.onload = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            
            $(".tjs_years a[tag=${simuSearchVO.currentYear}]").addClass("jhz_border");
            
          	//--自定义下拉框--
            $(".sel_wrap").click(function () {
                $(".select").toggle();
                /* if($(".select").css("display")=="none" || $(".select").css("display")=="NONE"){
                	$(".select").css("display", "block");
                }else{
                	$(".select").css("display", "none");
                } */
                $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
                $(".select>li").each(function (index) {
                    $(this).click(function () {
                        var opt = $(this).html();
                        $(".lbl").html(opt);
                        //var currentYear = $(".tjs_years a[class=jhz_border]").attr("tag");
                        //var params = "?peType="+$(this).attr("type")+"&currentYear="+currentYear;
                        $("#peType").val($(this).attr("type"));
                        $("#modalForm").attr("action",$("#modalForm").attr("action")).submit();
                    })
                });
                
                })
            //--/自定义下拉框--
            //--表格单行变色--
            $("tr:even").css("background", "#EEEDEB");
            //--/表格单行变色--
            
            //今年以来查询
            $(".tjs_years a").click(function(event){
    	    	event.preventDefault();
                //var params = "?currentYear="+$(this).attr("tag");
                $("#currentYear").val($(this).attr("tag"));
    	    	$("#modalForm").attr("action",$("#modalForm").attr("action")).submit();
    	    });
            
        }
        
      	//--预约--                   
		$("a.tjs_btn").click(function(event){	
			event.preventDefault();
			
		    alertMsg($(this).attr("data_id"),'20', 1);  
		    
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
      	
		
    </script>
    
    
<script>

    

</body>
</html>




















