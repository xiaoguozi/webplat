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
<link href="assets/css/ui/taojinshan.css" rel="stylesheet"
	media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

<!--私募页面样式-->
<link href="assets/css/ui/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript"
	src="assets/scripts/ui/scripts-bottom-min.js"></script>

<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>

</head>

<body>
	<div id="divTemplate"  style="display: none;">
		<input type="hidden" name="cid" value="#productId" />
		<img class="del_compare" src="assets/img/ui2/close_compare.png" onclick="clearChoose('#productId');" alt="" />
		<div class="clear"></div>
		<p>#productName</p>
		<p>累计收益</p>
		<p class="tjs_products_title">
			#intValue.<span>#decimal%</span>
		</p>
	</div>


	<div class="home_all">

		<%@ include file="/views/web/header.jsp"%>
		<!-- /header_top -->

		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
				<div class="logo_wrap">
					<a href="#"> <img
						src="assets/img/ui/tjs_logo.png" width="338" height="94"
						align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu menu">
					<ul>
						<li><a href="rest/web/pe/peIndex" target="_blank"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct" target="_blank"><span>私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexRate"><span class="simu_on">私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager" target="_blank"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="#" target="_blank" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" target="_blank" class="path_item">私募</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndexRate" class="path_item">私募排行</a> <span class="sep">&gt;</span> <span class="txt">筛选条件</span> </div>
        </div>
		
		
		<!-- container -->
        <div class="simu_pro_container">
            <!-- hot product-->
            <div class="layout_n">
                <div class="mod_box_item simu_mainprolist_box">
                    <div class="tjs_right_titlediv fcolor">
                        <img class="tjs_img_diamond" style="top: 10px;" src="assets/img/ui2/all.png" />私募分类排行 </div>
                    <div class="simuchanpin_liebiao">
                        <div class="simu_mainprolist_mult clearfix">
                        	<form id="modalForm" action="rest/web/pe/peIndexRate" method="post" >
                        	<input name="sortField" id="sortField" type="hidden" value="${simuSearchVO.sortField }"/>
							<input name="sortType" id="sortType" type="hidden" value="${simuSearchVO.sortType}"/>
							<input name="pageNo" type="hidden" value="${simuSearchVO.pageNo}"/>
							<input name="pageSize" type="hidden" value="${simuSearchVO.pageSize }"/>
							<input type="hidden" id="currentYear" name="currentYear" value="${simuSearchVO.currentYear}" />
                            <input type="hidden" id="currentYearPeriod" name="currentYearPeriod" value="${simuSearchVO.currentYearPeriod}" />
                            
                             </form>
                            <div class="mult_item" style="display:none;">
                                <div class="mult_name">年度收益排名</div>
                                <div class="mult_con" id="tjs_years">
                                	<a href="" tag="0" class="mult_lk">不限</a>
                                    <c:forEach items="${lstCommon}" varStatus="status" var="common">
			                        		<c:if test="${common.netYear==currentYear}">
			                        			<a href="" tag="${common.netYear}" class="mult_lk">今年以来</a>
			                        		</c:if>
				                            <c:if test="${common.netYear!=currentYear}" >
				                            	<a href="" tag="${common.netYear}" class="mult_lk">${common.netYear}</a>
				                            </c:if>
			                            </c:forEach>
                                </div>
                            </div>
                            <div class="mult_item">
                                <div class="mult_name">中长期业绩排名</div>
                                <div class="mult_con" id="tjs_years_period">
                                    <a href="" class="mult_lk" tag="0">不限</a> <a class="mult_lk" href="" tag="1">最近一年</a><a class="mult_lk" href="" tag="2">最近两年</a>
                                </div>
                            </div>
                            <div class="mult_item" style="display:none;">
                                <div class="mult_name">短期业绩排名</div>
                                <div class="mult_con">
                                    <a href="" class="mult_lk mult_checked">不限</a> <a class="mult_lk" href="">近一个月</a><a class="mult_lk" href="">近三个月</a><a class="mult_lk" href="">近六个月</a>
                                </div>
                            </div>
                            <div class="mult_item">
                                <div class="mult_name">按基金类型排名</div>
                            	<div class="mult_con" id="divPEType">
									<a class="mult_lk" href="#" tag="0" title="不限">不限</a>
									<a class="mult_lk" href="#" tag="1" title="股票">股票</a>
									<a class="mult_lk" href="#" tag="2" title="期货基金">期货基金</a>
									<a class="mult_lk" href="#" tag="3" title="股票量化">股票量化</a>
									<a class="mult_lk" href="#" tag="4" title="债券型">债券型</a>
									<a class="mult_lk" href="#" tag="5" title="定向增发">定向增发</a>
									<a class="mult_lk" href="#" tag="6" title="宏观对冲">宏观对冲</a>
									<a class="mult_lk" href="#" tag="7" title="组合基金">组合基金</a>
									<a class="mult_lk" href="#" tag="8" title="其他">其他</a>
								</div>
                            </div>
                            <div class="mult_item mult_item_search">
                                <div class="mult_name">关&nbsp;&nbsp;键&nbsp;&nbsp;词：</div>
                                <div class="mult_con">
                                    <div class="uc_boxhd_search skin_1">
                                        <input class="input_txt" placeholder="请输入关键词" id="simu_product_list_search_input" style="border-right: none;" type="text">
                                        <a id="simu_product_list_search" href="" data-href="" class="input_search"></a>
                                    </div>
                                    <div class="fast_search" style="display:none;"><a target="_blank" href="">泽熙3期</a> <a target="_blank" href="">清水源1号</a> <a target="_blank" href="">淡水泉成长一期</a> </div>
                                </div>
                            </div>
                            <div class="mult_item mult_item_checked">
                                <div class="mult_name" >已选条件：</div>
                                <div class="mult_con">
                                    <span class="searchCondition"></span>
									<span class="checked_info">共 <em class="num">${simuSearchVO.totalCount}</em>
										款产品满足条件
									</span><a href="rest/web/pe/peIndexRate" style="margin-left:10px;">清空条件</a> <label class="checked_condition">
										在售&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										class="input_check" id="input_check" name="onLine" ${simuSearchVO.onLine==1?'checked=checked':''}  type="checkbox">
									</label>
                                </div>
                            </div>
                           
                        </div>
                        <div class="simu_mainprolist_result">
                            <table class="simu_pro_tb_2 tjs_simu_tbl" width="100%">
                                <thead>
                                    <tr>
                                        <td class="tjs_tbl_td_brm">对比</td>
                                        <td class="tjs_tbl_td_brm">排行</td>
                                        <td class="tjs_tbl_td_bm" style="text-align: left"><span style="padding-left: 20px;">基金简称</span></td>
                                        <td class="tjs_tbl_td_bm" style="text-align: left"><span>基金经理</span></td>
                                        <td class="tjs_tbl_td_bm">基金公司</td>
                                        <td class="tjs_tbl_td_brm">基金类型</td>
                                        <td class="tjs_tbl_td_bm" style="text-align: right">最新净值</td>
                                        <td class="tjs_tbl_td_bm" style="text-align: right">累计收益</td>
                                        <c:if test="${simuSearchVO.currentYear!=0}">
	                                        <td class="tjs_tbl_td_bm" style="text-align: right">${simuSearchVO.currentYear==nowYear || simuSearchVO.currentYear==0?'今':simuSearchVO.currentYear}年收益<img src="assets/img/ui2/zhibiaoc.png" style="vertical-align: -4px;" /></td>
                                        </c:if>
                                        <c:if test="${simuSearchVO.currentYear==0}">
	                                        <td class="tjs_tbl_td_bm" style="text-align: right">${simuSearchVO.currentYear==nowYear || simuSearchVO.currentYear==0?'今':simuSearchVO.currentYear}年收益</td>
                                        </c:if>
                                        <c:if test="${simuSearchVO.currentYearPeriod==1}">
                                        	<td class="tjs_tbl_td_bm" style="text-align: right">最近一年<img src="assets/img/ui2/zhibiaoc.png" style="vertical-align: -4px;" /></td>
                                        </c:if>
                                        <c:if test="${simuSearchVO.currentYearPeriod!=1}">
                                        	<td class="tjs_tbl_td_bm" style="text-align: right">最近一年</td>
                                        </c:if>
                                        <c:if test="${simuSearchVO.currentYearPeriod==2}">
                                        	<td class="tjs_tbl_td_bm" style="text-align: right">最近两年<img src="assets/img/ui2/zhibiaoc.png" style="vertical-align: -4px;" /></td>
                                        </c:if>
                                        <c:if test="${simuSearchVO.currentYearPeriod!=2}">
                                        	<td class="tjs_tbl_td_bm" style="text-align: right">最近两年</td>
                                        </c:if>
                                        <td class="tjs_tbl_td_brm">净值走势</td>
                                        <td class="tjs_tbl_td_bm">预约</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${lstAll}" varStatus="status"  var="peAllProduct">
	                                    <tr class="odd">
											<td class="c_c c_b c_first_control">
												<div class="lb_wrap">
													<span class="lb_b"></span> <input class="tb_chk" productId="${peAllProduct.id}" productName="${peAllProduct.name }"  accumulatedIncome="${peAllProduct.accumulatedIncome}"  type="checkbox">
												</div>
											</td>
											<td class="tjs_tbl_td_br"><span class='${status.index<3?"orangecolor":"graycolor"}'>${status.index+1}</span></td>
											<td class="c_l" style="text-align: left"><a href="rest/web/pe/peIndexProductDetail?peProductId=${peAllProduct.id}" target="_blank">${peAllProduct.name }</a></td>
											<td class="c_l" style="text-align: left;padding-left: 0px;">${peAllProduct.managerName }</td>
											<td class="c_c_s">${peAllProduct.companyName }</td>
											
											<td class="c_c_s c_b">
												<c:if test="${peAllProduct.fundType==1}">股票</c:if>
												<c:if test="${peAllProduct.fundType==2}">期货基金</c:if>
												<c:if test="${peAllProduct.fundType==3}">股票量化</c:if>
												<c:if test="${peAllProduct.fundType==4}">债券型</c:if>
												<c:if test="${peAllProduct.fundType==5}">定向增发</c:if>
												<c:if test="${peAllProduct.fundType==6}">宏观对冲</c:if>
												<c:if test="${peAllProduct.fundType==7}">组合基金</c:if>
												<c:if test="${peAllProduct.fundType==8}">其他</c:if>
											</td>
											
											<td class="c_r_s" style="text-align: right;padding-right: 0px;"><span>${peAllProduct.netWorth }</span></td>
											<td class="c_r_s" style="text-align: right;padding-right: 0px;"><span><fmt:formatNumber value="${peAllProduct.accumulatedIncome}" pattern="#0"/>.<fmt:formatNumber value="${peAllProduct.accumulatedIncome*100%100}" pattern="00"/>%</span></td>
											<td class="c_r_s" style="text-align: right;padding-right: 0px;"><span class="f_f80">${peAllProduct.nowRate }%</span></td>
											<td class="c_r_s" style="text-align: right;padding-right: 0px;">${peAllProduct.oneRate }%</td>
											<td class="c_r_s" style="text-align: right;padding-right: 0px;">${peAllProduct.towRate }%</td>
											<td class="c_b">
												<div class="trend_viewer">
													<div class="trend_viewer_hd">
														<a href="" title="点击查看详情"><em class="uc_trend"></em></a>
													</div>
													<div class="details_show">
														<em class="left_icon"></em>
														<div class="details_boxes"></div>
													</div>
												</div>
											</td>
											<td class="c_c"><a
												class="tb_btn tb_btn_primary simu_reserve_btn" href="javascript:void(0)" data_id="${peAllProduct.id}">预约</a></td>
										</tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 翻页开始 -->
			<div class="pages pgbtn">
			    <table class=pagetb cellspacing=0>
			      <tbody>
			        <tr>
			        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
			        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${simuSearchVO.pageNo-1}"><</a></td>
			        <c:if test="${simuSearchVO.totalPageSize<=9||(simuSearchVO.totalPageSize>9&&simuSearchVO.pageNo<=5)}">
			       	 <c:forEach var="item" varStatus="status" begin="1" end="${simuSearchVO.totalPageSize>9?9:simuSearchVO.totalPageSize}">             
				        <c:choose>  
				          <c:when test="${status.index==simuSearchVO.pageNo }"> 
				           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
				          </c:when> 
				          <c:otherwise>
				          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
				          </c:otherwise> 
				        </c:choose>             
			       </c:forEach>
			       </c:if>
			       
			       <c:if test="${simuSearchVO.totalPageSize>9&&simuSearchVO.pageNo>5&&simuSearchVO.totalPageSize>simuSearchVO.pageNo+4}">
			        <c:forEach var="item" varStatus="status" begin="${simuSearchVO.pageNo-4}" end="${simuSearchVO.pageNo+4}">             
			        <c:choose>  
			          <c:when test="${status.index==simuSearchVO.pageNo }"> 
			           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
			          </c:when> 
			          <c:otherwise>
			          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
			          </c:otherwise> 
			        </c:choose>             
			        </c:forEach>							        
			       </c:if>
			       
			       
			       <c:if test="${simuSearchVO.totalPageSize>9&&simuSearchVO.pageNo>5&&simuSearchVO.totalPageSize<=simuSearchVO.pageNo+4}">
			        <c:forEach var="item" varStatus="status" begin="${simuSearchVO.totalPageSize-8}" end="${simuSearchVO.totalPageSize}">             
			        <c:choose>  
			          <c:when test="${status.index==simuSearchVO.pageNo }"> 
			           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
			          </c:when> 
			          <c:otherwise>
			          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
			          </c:otherwise> 
			        </c:choose>             
			        </c:forEach>							        
			       </c:if>
			        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${simuSearchVO.pageNo+1}">></a></td>
			        <td class=pagnum><a title=最前一页 href="#" page_no="${simuSearchVO.totalPageSize}">>|</a></td>          
			        </tr>
			      </tbody>
			    </table>
			  </div>
			 <!-- 翻页结束 -->
            
        </div>
        <!-- 产品对比 -->
        <div class="simu_compare_container">
            <div class="compare_container">
                <div class="compare_container_title">
                    <h3 class="compare_products">产品对比栏</h3>
                    <div class="close_compare">
                        <img src="assets/img/ui2/close_compareicon.png" alt="" />隐藏</div>
                </div>
                <div class="compare_container_contents">
                    <p class="moren_font">您还可以继续添加</p>
                </div>
                <div class="compare_container_contents">
                    <p class="moren_font">您还可以继续添加</p>
                </div>
                <div class="compare_container_contents">
                    <p class="moren_font">您还可以继续添加</p>
                </div>
                <div class="tjs_comparing">
                    <a class="uc_btn compare_btn" href="javascript:void(0)" onclick="goCompareDetail();">对&nbsp;&nbsp;&nbsp;&nbsp;比</a>
                    <a id="clear_duibi" class="uc_btn compare_btn">清空对比栏</a>
                </div>
            </div>
        </div>
        <!-- 产品对比 end -->
        <div class="clear"></div>
        <!-- container end -->
		
		
		<%@ include file="/views/web/footer.jsp"%>
	</div>
	
	<!-- /home_all -->
	<script>
		var IndexPage = {};
	    IndexPage.orderProductUrl="rest/web/pe/peOrderProduct";
		var sum = 0;
		window.onload = function () {
			
			$("#divPEType a[tag=${simuSearchVO.peType}]").addClass("mult_checked");
			$("#tjs_years a[tag=${simuSearchVO.currentYear}]").addClass("jhz_border");
			$("#tjs_years_period a[tag=${simuSearchVO.currentYearPeriod}]").addClass("jhz_border");
			
			if($("#divPEType a[tag=${simuSearchVO.peType}]").attr("tag")!='0'){
		    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' style='margin-left:10px;' condition_name='divPEType'>"+$("#divPEType a[tag=${simuSearchVO.peType}]").attr("title")+"</a>");
		    }
			
			$("#divPEType a[class=mult_lk]").click(function(event){
		    	event.preventDefault();
		    	$("#divPEType a[class='mult_lk mult_checked']").each(function(index){
		    		$(this).removeClass("mult_checked");
		    	});   
		    	$(this).removeClass("mult_checked").addClass("mult_checked"); 
		    	var params =SetPara();	 
		    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
		    });
			
			$(".pagnum a").click(function(event){
		    	event.preventDefault();
	            $("input[name=pageNo]").val($(this).attr("page_no"));
	            var params = SetPara();
		    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

		    });
			
	        //--对比框--
			$(".close_compare").click(function () {
	            $(".simu_compare_container").hide();
	        })
	        $("#clear_duibi").click(function () {
	            $(".tb_chk").removeAttr("checked");
	            $(".simu_compare_container").hide();
	            for(var i=0; i<3; i++){
	            	$(".compare_container_contents:eq("+i+")").html("<p class='moren_font'>您还可以继续添加</p>");
	            }
	            sum = 0;
	        });

	        $(".tb_chk").each(function (index) {
	            $(".tb_chk").removeAttr("checked");
	            $(this).click(function () {
	                if ($(this).is(':checked')) {
	                    sum += 1;
	                    if (sum > 3) {
		                    sum = 3;
		                    $(this).removeAttr("checked");
		                    alert("最多只能选三个进行对比！")
		                }else{
		                	if($("input[name=cid][value="+$(this).attr("productId")+"]").size()==0){
		                		//添加要对比的选项
		                    	var contentHtml = $("#divTemplate").html();
		                    	contentHtml = contentHtml.replace(/#productId/g, $(this).attr("productId"));
		                    	contentHtml = contentHtml.replace("#productName", $(this).attr("productName"));
		                    	//收益
		                    	var income = $(this).attr("accumulatedIncome") ;
		                    	income = parseFloat(income).toFixed(2);
		                    	var intValue = income.substring(0, income.indexOf("."));
		                    	var decimal = income.substring(income.indexOf(".")+1);
		                    	contentHtml = contentHtml.replace("#intValue", intValue);
		                    	contentHtml = contentHtml.replace("#decimal", decimal);
		                    	
		                    	for(var i=0; i<3; i++){
		                    		if($(".compare_container_contents:eq("+i+")").find("input").size()==0){
		                    			$(".compare_container_contents:eq("+i+")").html(contentHtml);
		                    			break;
		                    		}
		                    	}
		                	}
		                }
	                    
	                } else {
	                    sum -= 1;
	                    var obj = $("input[name=cid][value="+$(this).attr("productId")+"]");
	                    if(obj.size()>0){
		                    obj.eq(0).parent().html(" <p class='moren_font'>您还可以继续添加</p>");
	                    }
	                }
	                sum > 0 ? $(".simu_compare_container").show() : $(".simu_compare_container").hide();
	            });
	        });
	        $(".del_compare").each(function (index) {
	            $(this).click(function () {
	                $(".compare_container_contents:eq(" + index + ")").html(" <p class='moren_font'>您还可以继续添加</p>");
	            });
	        })
			
	        //--对比框--
	        //--详情框--
	        $(".trend_viewer").each(function (index) {
	            $(this).hover(function () {
	                $(".details_show:eq(" + index + ")").show();
	            }, function () {
	                $(".details_show:eq(" + index + ")").hide();
	            });
	        });
	        //--详情框--
	        
	      	//今年以来查询
            $("#tjs_years a").click(function(event){
    	    	event.preventDefault();
                $("#currentYear").val($(this).attr("tag"));
                //清掉中长期
                $("#currentYearPeriod").val("0");
                var params = SetPara();
    	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
    	    });
	        
          	//中长期业绩以来查询
            $("#tjs_years_period a").click(function(event){
    	    	event.preventDefault();
                $("#currentYearPeriod").val($(this).attr("tag"));
                //清掉年份
                $("#currentYear").val("0");
                var params = SetPara();
    	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
    	    });
          	
            //关键字查询按钮
	   	    $("#simu_product_list_search").click(function(event){
	   	    	event.preventDefault();	    	
	   	    	var params =SetPara();	    
	   	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	   	    });
            
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
		    
		    $(".input_check").click(function(event){
		    	var params =SetPara();	    	    	
		    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

		    });
	    }
		
		function placeholderSupport() {
		    return 'placeholder' in document.createElement('input');
		}
		
		function SetPara() { 
			var peType = $("#divPEType a.mult_checked").attr("tag");
		
			if($("input[name=keyword]").val()==$("input[name=keyword]").attr('placeholder')){
				$("input[name=keyword]").val("");
			} 
			
			var onLine = $("#input_check").attr("checked");
			if(onLine==undefined){
				onLine = 0;
			}else{
				onLine = 1;
			}
			
			var params = "?peType=" + peType + "&onLine="+onLine;
			return params;
		}
		
		//去掉选项
		function clearChoose(productId){
			$("input[name=cid][value="+productId+"]").parent().html("<p class='moren_font'>您还可以继续添加</p>");
		    $("input[class=tb_chk][productId="+productId+"]").removeAttr("checked");
		    sum -= 1;
		}
		
		function goCompareDetail(event){
			var cids = $(".compare_container input[name=cid]");
			if(cids.size()<2){
				alert("请至少选择两个产品");
			}
			var ids='';
			for(var i=0; i<cids.size(); i++){
				if(i!=0){
					ids = cids[i].value + ','+ids;
				}else{
					ids += cids[i].value;
				}
			}
			window.open("rest/web/pe/peIndexCompare?productIdArray="+ids, "_blank");
		}
		
		//--预约--                   
		$("a.simu_reserve_btn").click(function(event){	
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


    

</body>
</html>




















