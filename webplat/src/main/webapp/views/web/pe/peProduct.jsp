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
						<li><a href="rest/web/pe/peIndexProduct"><span class="simu_on">私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexRate" target="_blank"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexManager" target="_blank"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="#" target="_blank" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item">私募</a> <span
					class="sep">&gt;</span> <a href="rest/web/pe/peIndexProduct" class="path_item">私募产品</a> <span
					class="sep">&gt;</span> <span class="txt">筛选条件</span>
			</div>
		</div>
		<!-- container -->
		<div class="simu_pro_container">
			<!-- hot product-->
			<div class="layout_n">
				<div class="mod_box_item simu_hot_box">
					<div class="tjs_right_titlediv fontcolor">
						<img class="tjs_img_diamond" src="assets/img/ui/diamond.png" />顶级私募产品
					</div>
					<div class="box_bd">
						<ul class="simu_hotpro_list clearfix">
							<c:forEach items="${top4Data}" var="peTop4Product">
							<li class="hotpro_item bg_hover">
								<div class="hotpro_hd">
									<a href="rest/web/pe/peIndexMDetail?peManagerId=${peTop4Product.managerId}" target="_blank"><span class="txt_1">${peTop4Product.managerName}</span></a>&nbsp;
									<a href="rest/web/pe/peIndexProductDetail?peProductId=${peTop4Product.id}" target="_blank"><span class="txt_2">${peTop4Product.name}</span> </a>
								</div>
								<div class="hotpro_income">
									<span class="income_tit">累计收益</span><br /> <span class="money"><fmt:formatNumber value="${peTop4Product.accumulatedIncome}" pattern="#0"/>.<em
										class="small"><fmt:formatNumber value="${peTop4Product.accumulatedIncome*100%100}" pattern="00"/>%</em>
									</span>
								</div>
								<div class="hotpro_comment">
									<span class="comment_tit"></span>${peTop4Product.managerReview}
								</div>
								<div class="hotpro_control">
									<a class="uc_btn_primary uc_btn simu_reserve_btn"
										href="javascript:void(0)" data_id="${peTop4Product.id}"> <img
										src="assets/img/ui/clock.png" />立即预约
									</a>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="mod_box_item simu_mainprolist_box">
					<div class="tjs_right_titlediv fcolor">
						<img class="tjs_img_diamond" src="assets/img/ui/ranklist.png" />全部私募产品
					</div>
					<div class="simuchanpin_liebiao">
						<div class="simu_mainprolist_mult clearfix">
							<div class="mult_item">
								<div class="mult_name">基金经理：</div>
								<div class="mult_con" id="divPEManager">
									<a href="#" class="mult_lk" tag="0" title="不限">不限</a> 
										<c:forEach items="${lstManager}" var="peManager" end="9">
											<a class="mult_lk" href="#" tag="${peManager.id}" tagmore="0" title="${peManager.name}">${peManager.name}</a> 
										</c:forEach>
									<a id="tjs_more" href="javascript:void(0)" class="mult_more" style="${fn:length(lstManager)>10?'':'display:none;'}">${simuSearchVO.peManagerMore==0?"&gt; 更多":"&gt; 收起"}</a>	
									<div class="mult_more_wrap" ${simuSearchVO.peManagerMore==0?"style='display: none;width:882px;'":"style='width:882px;'"}>
										<div class="more_wrap_bd" style="width:880px;">
											<ul class="more_lk_list">
												<c:if test="${fn:length(lstManager)>10}">
													<c:forEach items="${lstManager}" var="peManager" begin="10">
														<a class="mult_lk" href="#" tag="${peManager.id}" tagmore="1" title="${peManager.name}">${peManager.name}</a> 
													</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="mult_item">
								<div class="mult_name">基金公司：</div>
								<div class="mult_con" id="divPECompany">
										<a href="" class="mult_lk" tag="0" title="不限">不限</a> 
										<c:forEach items="${lstCompany}" var="peCompany" end="7">
											<a href="" class="mult_lk" tag="${peCompany.id}" tagmore="0"  title="${peCompany.name}">${peCompany.name}</a>
										</c:forEach>
									<a id="tjs_mores" class="mult_more" style="${fn:length(peCompany)>8?'':'display:none;'}">${simuSearchVO.peCompanyMore==0?"&gt; 更多":"&gt; 收起"}</a>
									<div class="mult_more_wrap" ${simuSearchVO.peCompanyMore==0?"style='display: none;width:880px;'":"style='width:880px;'"}>
										<div class="more_wrap_bd" style="width:880px;">
											<ul class="more_lk_list">
												<c:if test="${fn:length(lstCompany)>8}">
													<c:forEach items="${lstCompany}" var="peCompany" begin="8">
														<a class="mult_lk" href="#" tag="${peCompany.id}" tagmore="1"  title="${peCompany.name}">${peCompany.name}</a> 
													</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="mult_item">
								<div class="mult_name">基金类型：</div>
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
							<div class="mult_item">
								<div class="mult_name">年化收益：</div>
								<div class="mult_con" id="divPEYearRate">
									<a class="mult_lk" href="" tag="0" title="不限">不限</a> <a
										class="mult_lk" href="" tag="1" title="50%以上">50%以上</a> <a class="mult_lk" href="" tag="2" title="30%-50%">30%-50%</a>
									<a class="mult_lk" href="" tag="3" title="10%-30%">10%-30%</a> <a class="mult_lk"
										href="" tag="4" title="0%-10%">0%-10%</a> <a class="mult_lk" href="" tag="5" title="0%以下">0%以下</a>
								</div>
							</div>
							<form id="modalForm" action="rest/web/pe/peIndexProduct" method="post" >
							<input name="sortField" id="sortField" type="hidden" value="${simuSearchVO.sortField }"/>
							<input name="sortType" id="sortType" type="hidden" value="${simuSearchVO.sortType}"/>
							<input name="pageNo" type="hidden" value="${simuSearchVO.pageNo}"/>
							<input name="pageSize" type="hidden" value="${simuSearchVO.pageSize }"/>
							
							<div class="mult_item mult_item_search">
								<div class="mult_name">关&nbsp;&nbsp;键&nbsp;&nbsp;词：</div>
								<div class="mult_con">
									<div class="uc_boxhd_search skin_1">
										<input class="input_txt" name="keyword" value="${simuSearchVO.keyword}" placeholder="请输入关键词" style="border-right: none;"
											type="text"> <a id="simu_product_list_search" href=""
											class="input_search"></a>
									</div>
									<div class="fast_search" style="display: none;">
										<a target="_blank" href="">泽熙3期</a> <a target="_blank" href="">清水源1号</a>
										<a target="_blank" href="">淡水泉成长一期</a>
									</div>
								</div>
							</div>
							<div class="mult_item mult_item_checked">
								<div class="mult_name">已选条件：</div>
								<div class="mult_con">
									<span class="searchCondition"></span>
									<span class="checked_info">共 <em class="num">${simuSearchVO.totalCount}</em>
										款产品满足条件
									</span><a href="rest/web/pe/peIndexProduct" style="margin-left:10px;">清空条件</a> <label class="checked_condition">
										在售&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										class="input_check" id="input_check" name="onLine" ${simuSearchVO.onLine==1?'checked=checked':''}  type="checkbox">
									</label>
								</div>
							</div>
							</form>
						</div>
						<div class="simu_mainprolist_result">
							<table class="simu_pro_tb_2" id="tjs_tbl" width="100%">
								<thead class="rowspan_2">
									<tr class="row_1">
										<th class="c_c c_b c_first_control" width="50"></th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金概况</p>
										</th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金净值</p>
										</th>
										<th class="c_tit c_b" colspan="3">
											<p class="c_tit_p">基金收益率</p>
										</th>
										<th class="c_c c_b" width="*"></th>
										<th class="c_c" width="*"></th>
									</tr>
									<tr class="row_2 tr_bgcolor">
										<td class="c_c c_b c_first_control">对比</td>
										<td class="c_l">基金简称</td>
										<td class="c_l">基金经理</td>
										<td class="c_c c_b">基金公司</td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)" sortField="net_worth" sortType="">最新净值<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)" sortField="accumulated_income" sortType="">累计收益<em></em></a></td>
										<td class="c_c_s c_b"><a class="uc_sort"
											href="javascript:void(0)" sortField="run_time" sortType="">运行时间<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)" sortField="tow_rate" sortType="">近2年<em></em></a></td>
										<td class="c_r_s"><a class="uc_sort"
											href="javascript:void(0)" sortField="one_rate" sortType="">近1年<em></em></a></td>
										<td class="c_r_s c_b"><a class="uc_sort"
											href="javascript:void(0)" sortField="year_rate" sortType="">年化收益<em></em></a></td>
										<td class="c_r_s c_b">净值走势</td>
										<td class="c_c">预约</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${lstAll}" var="peAllProduct">
									<tr class="odd">
										<td class="c_c c_b c_first_control">
											<div class="lb_wrap">
												<span class="lb_b"></span> <input class="tb_chk"
													type="checkbox">
											</div>
										</td>
										<td class="c_l"><a href="rest/web/pe/peIndexProductDetail?peProductId=${peAllProduct.id}" target="_blank">${peAllProduct.name }</a></td>
										<td class="c_l">${peAllProduct.managerName }</td>
										<td class="c_c_s c_b">${peAllProduct.companyName }</td>
										<td class="c_r_s"><span>${peAllProduct.netWorth }</span></td>
										<td class="c_r_s"><span class="f_f80 "><fmt:formatNumber value="${peAllProduct.accumulatedIncome}" pattern="#0"/>.<fmt:formatNumber value="${peAllProduct.accumulatedIncome*100%100}" pattern="00"/>%</span></td>
										<td class="c_c_s c_b">${peAllProduct.runTime }</td>
										<td class="c_r_s">${peAllProduct.towRate }%</td>
										<td class="c_r_s">${peAllProduct.oneRate }%</td>
										<td class="c_r_s c_b ">${peAllProduct.yearRate}%</td>
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
			<div class="pages pgbtn" id="divPages" style="margin-top: 30px;">
			    <table class=pagetb cellspacing=0>
			      <tbody>
			        <tr>
			        <td class=pagnum><a title=首页 href="#" page_no="1">|<</a></td>
			        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${simuSearchVO.pageNo-1}"><</a></td>
			        <c:forEach var="item" varStatus="status" begin="1" end="${simuSearchVO.totalPageSize}">             
			        <c:choose>  
			          <c:when test="${status.index==simuSearchVO.pageNo }"> 
			           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
			          </c:when> 
			          <c:otherwise>
			          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
			          </c:otherwise> 
			        </c:choose>             
			        </c:forEach>
			        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${simuSearchVO.pageNo+1}">></a></td>
			        <td class=pagnum><a title=尾页 href="#" page_no="${simuSearchVO.totalPageSize}">>|</a></td>          
			        </tr>
			      </tbody>
			    </table>
			  </div>
			 <!-- 翻页结束 -->
			 
			<!-- container end -->
		</div>
		<!-- 产品对比 -->
		<div class="simu_compare_container">
			<div class="compare_container">
				<div class="compare_container_title">
					<h3 class="compare_products">产品对比栏</h3>
					<div class="close_compare">
						<img src="assets/img/ui2/close_compareicon.png" alt="" />隐藏
					</div>
				</div>
				<div class="compare_container_contents">
					<img class="del_compare" src="assets/img/ui2/close_compare.png" alt="" />
					<div class="clear"></div>
					<p>金手指三号</p>
					<p>累计收益</p>
					<p class="tjs_products_title">
						1920.<span>55%</span>
					</p>
				</div>
				<div class="compare_container_contents">
					<img class="del_compare" src="assets/img/ui2/close_compare.png" alt="" />
					<div class="clear"></div>
					<p>金手指三号</p>
					<p>累计收益</p>
					<p class="tjs_products_title">
						1920.<span>55%</span>
					</p>
				</div>
				<div class="compare_container_contents">
					<p class="moren_font">你还可以继续添加</p>
				</div>
				<div class="tjs_comparing">
					<a class="uc_btn compare_btn" href="simuchanpinduibi.html">对&nbsp;&nbsp;&nbsp;&nbsp;比</a>
					<a id="clear_duibi" class="uc_btn compare_btn">清空对比栏</a>
				</div>
			</div>
			
		</div>
		<!-- 产品对比 end -->
		<div class="clear"></div>

		<!-- /tjs_product_div -->
		<!-- 私募板块结束 -->
		
		<%@ include file="/views/web/footer.jsp"%>
	</div>
	
	<!-- /home_all -->
	<script>
	var IndexPage = {};
    IndexPage.orderProductUrl="rest/web/pe/peOrderProduct";
	
	window.onload = function () {
		//初始化选择按钮
	    $("#divPEManager a[tag=${simuSearchVO.peManagerId}]").addClass("mult_checked");
	    $("#divPECompany a[tag=${simuSearchVO.peCompanyId}]").addClass("mult_checked");
	    $("#divPEType a[tag=${simuSearchVO.peType}]").addClass("mult_checked");
	    $("#divPEYearRate a[tag=${simuSearchVO.peYearRate}]").addClass("mult_checked");
		
	  	//初始化选这按钮
	    if($("#divPEManager a[tag=${simuSearchVO.peManagerId}]").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' style='margin-left:10px;' condition_name='divPEManager'>"+$("#divPEManager a[tag=${simuSearchVO.peManagerId}]").attr("title")+"</a>");
	    }
	    if($("#divPECompany a[tag=${simuSearchVO.peCompanyId}]").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' style='margin-left:10px;' condition_name='divPECompany'>"+$("#divPECompany a[tag=${simuSearchVO.peCompanyId}]").attr("title")+"</a>");
	    }
	    if($("#divPEType a[tag=${simuSearchVO.peType}]").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' style='margin-left:10px;' condition_name='divPEType'>"+$("#divPEType a[tag=${simuSearchVO.peType}]").attr("title")+"</a>");
	    }
	    if($("#divPEYearRate a[tag=${simuSearchVO.peYearRate}]").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' style='margin-left:10px;' condition_name='divPEYearRate'>"+$("#divPEYearRate a[tag=${simuSearchVO.peYearRate}]").attr("title")+"</a>");
	    }
	    
	    $(".searchCondition a").click(function(event){
	    	event.preventDefault();	    	
	    	$("#"+$(this).attr("condition_name")+" a").removeClass("mult_checked");
	    	$("#"+$(this).attr("condition_name")+" a[tag=0]").addClass("mult_checked");	    		    	
	    	var params =SetPara();	    
	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
		
	    $("#divPEManager a[class=mult_lk]").click(function(event){
	    	event.preventDefault();
	    	$("#divPEManager a[class='mult_lk mult_checked']").each(function(index){
	    		$(this).removeClass("mult_checked");
	    	});
	    	$(this).removeClass("mult_checked").addClass("mult_checked");
	    	var params =SetPara();	 
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
	    
	    $("#divPECompany a[class=mult_lk]").click(function(event){
	    	event.preventDefault();
	    	$("#divPECompany a[class='mult_lk mult_checked']").each(function(index){
	    		$(this).removeClass("mult_checked");
	    	});   
	    	$(this).removeClass("mult_checked").addClass("mult_checked"); 
	    	var params =SetPara();	 
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
	    
	    $("#divPEType a[class=mult_lk]").click(function(event){
	    	event.preventDefault();
	    	$("#divPEType a[class='mult_lk mult_checked']").each(function(index){
	    		$(this).removeClass("mult_checked");
	    	});   
	    	$(this).removeClass("mult_checked").addClass("mult_checked"); 
	    	var params =SetPara();	 
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
	    
	    $("#divPEYearRate a[class=mult_lk]").click(function(event){
	    	event.preventDefault();
	    	$("#divPEYearRate a[class='mult_lk mult_checked']").each(function(index){
	    		$(this).removeClass("mult_checked");
	    	});   
	    	$(this).removeClass("mult_checked").addClass("mult_checked"); 
	    	var params =SetPara();	 
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
	    
	    //关键字查询按钮
	    $("#simu_product_list_search").click(function(event){
	    	event.preventDefault();	    	
	    	var params =SetPara();	    
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    });
	    
	    
	    /* $("#divPages a").click(function(event){
	    	event.preventDefault();	    	
	    	var params =SetPara();	    
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
	    }); */
	    
	    $(".pagnum a").click(function(event){
	    	event.preventDefault();
            $("input[name=pageNo]").val($(this).attr("page_no"));
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();

	    });
	    
	    $(".input_check").click(function(event){
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
	    
	    
        //--对比框--
        var sum = 0;
        $(".close_compare").click(function () {
            $(".simu_compare_container").hide();
        })
        $("#clear_duibi").click(function () {
            $(".tb_chk").removeAttr("checked");
            $(".simu_compare_container").hide();
            sum = 0;
        });

        $(".tb_chk").each(function (index) {
            $(".tb_chk").removeAttr("checked");
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    sum += 1;
                } else {
                    sum -= 1;
                }

                if (sum > 3) {
                    sum = 3;
                    $(this).removeAttr("checked");
                    alert("最多只能选三个进行对比！")
                }
                sum > 0 ? $(".simu_compare_container").show() : $(".simu_compare_container").hide();
            });
        });
        $(".del_compare").each(function (index) {
            $(this).click(function () {
                $(".compare_container_contents:eq(" + index + ")").html(" <p class='moren_font'>你还可以继续添加</p>");
            });
        })
        //--/对比框--
        //--详情框--
        $(".trend_viewer").each(function (index) {
            $(this).hover(function () {
                $(".details_show:eq(" + index + ")").show();
            }, function () {
                $(".details_show:eq(" + index + ")").hide();
            });
        });
        //--/详情框--
        
        
        //--点击更多js--
        function packUp(btn, i) {
            var num = true;
            $(btn).click(function (event) {
            	event.preventDefault();
                if (num) {
                    var shouqi = "&gt; 收起";
                    num = false;
                } else {
                    var shouqi = "&gt; 更多";
                    num = true;
                }
                $(this).html(shouqi);
                $(".mult_more_wrap:eq(" + i + ")").toggle();
                
            });
        }
        packUp("#tjs_more", 0);
        packUp("#tjs_mores", 1);


        
       
        //--/点击更多js--
        //--排行图标--
        $(".uc_sort").each(function (index) {
            if($(this).attr("sortField")=="${simuSearchVO.sortField}"){
            	if("${simuSearchVO.sortType}"=="asc"){
            		$(this).attr("sortType", "asc");
            		$(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
            		$(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
            	}else{
            		$(this).attr("sortType", "desc");
	                $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
            	}
            }else{
            	 $(".uc_sort>em").addClass("sort_desc");
            }
            
            
            //初始化排序箭头
            $(this).click(function () {
                var s = $(".uc_sort>em:eq(" + index + ")").hasClass("sort_desc");
                $(".uc_sort>em").removeClass("sort_d sort_u");
                $(".uc_sort>em").addClass("sort_desc");
                if (s) {
                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_desc sort_u");
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
                } else {
                    $(".uc_sort>em:eq(" + index + ")").removeClass("sort_d");
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
                    $(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
                }
                $("#sortField").val($(this).attr("sortField"));
                if($(this).attr("sortType") == "desc"){
                	$("#sortType").val("asc");
                }else{
                	$("#sortType").val("desc");
                }
                var params =SetPara();	    	    	
    	    	$("#modalForm").attr("action",$("#modalForm").attr("action")+params).submit();
            });

        })
        //--/排行图标--
    }
	
	function SetPara() { 
		var peManagerFilter = $("#divPEManager a.mult_checked");
		var peCompanyFilter = $("#divPECompany a.mult_checked");
		
		var peManagerId = peManagerFilter.attr("tag");
		var peManagerMore = peManagerFilter.attr("tagmore");
		if(peManagerMore==undefined){
			peManagerMore = 0;
		}
		
		var peCompanyId = peCompanyFilter.attr("tag");
		var peCompanyMore = peCompanyFilter.attr("tagmore");
		if(peCompanyMore==undefined){
			peCompanyMore = 0;
		}
		
		var peType = $("#divPEType a.mult_checked").attr("tag");
		var peYearRate =  $("#divPEYearRate a.mult_checked").attr("tag");
	
		if($("input[name=keyword]").val()==$("input[name=keyword]").attr('placeholder')){
			$("input[name=keyword]").val("");
		} 
		
		var onLine = $("#input_check").attr("checked");
		if(onLine==undefined){
			onLine = 0;
		}else{
			onLine = 1;
		}
		
		var params = "?peManagerId=" + peManagerId + "&peCompanyId=" + peCompanyId + "&peManagerMore="
			+peManagerMore + "&peCompanyMore="+peCompanyMore + "&peType=" + peType + "&peYearRate=" +peYearRate+ "&onLine="+onLine;
		return params;
	}
	
	function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
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



