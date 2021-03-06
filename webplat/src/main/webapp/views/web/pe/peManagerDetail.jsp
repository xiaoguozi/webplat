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
<meta name="keywords" content=" ${peManagerProduct.managerName}， ${peManagerProduct.managerName}基金经理， ${peManagerProduct.managerName}私募产品， ${peManagerProduct.managerName}私募基金" />
<meta name="description" content="找${peManagerProduct.managerName}私募基金上淘金山，为您提供${peManagerProduct.managerName}基金经理个人简介，${peManagerProduct.managerName}私募基金业绩，助您快速找到最适合的${peManagerProduct.managerName}私募产品进行购买，支持7*24小时在线预约。" />
<title> ${peManagerProduct.managerName}-私募基金经理-淘金山私募</title>

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>  
<script type="text/javascript" src="assets/scripts/ui/highstock-1.3.9.js"></script>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />
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
      <div class="logo_wrap"><a href="#"><img src="assets/img/ui2/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
      <div class="top_wrap_menu menu">
        <ul>
         <li><a href="rest/web/pe/peIndex"  target="_blank"><span>私募首页</span></a></li>
		 <li><a href="rest/web/pe/peIndexRate"  target="_blank"><span>私募排行</span></a></li>
		 <li><a href="rest/web/pe/peIndexProduct"  target="_blank"><span>私募产品</span></a></li>
		 <li><a href="rest/web/pe/peIndexManager"  target="_blank"><span
				class="simu_on">私募经理</span></a></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- /header_menu -->
 <div class="mod_breadcrumb">
	<div class="layout_n clearfix">
		<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
		<span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item"  >私募</a> <span
			class="sep">&gt;</span> <a href="rest/web/pe/peIndexManager" class="path_item"  >私募经理</a> <span
			class="sep">&gt;</span> <span class="txt">经理明细</span>
	</div>
 </div>
<!-- container -->
<div class="simu_prodetail_container simu_side_nav_main">
  
  <!-- hot -->
  <div id="detail_info" class="layout_n simu_side_nav_box">
    <div class="simu_detailtop_box clearfix box_top_color">
      <div class="detail_box_1"> <span class="box_tit"> ${peManagerProduct.managerName}<span class="small_fontcolor"> - 
      <a href="rest/web/pe/peIndexProductDetail?peProductId=${peManagerProduct.productId}" target="_blank">
      ${peManagerProduct.productSimpleName}
      </a> 
      
      
      </span></span>
      </div>
      <div class="detail_box_2">
        <ul class="attr_list clearfix">
          <!-- 无收益 --> 
          <!-- 有收益 -->
          <li class="attr_item">            
              <table class="jinglixinxi">
                  <tr>
                      <td>产品盈利占比：</td>
                      <td class="txt_a_left"><span class="font_color_y"><fmt:formatNumber value="${peManagerProduct.profitProduct*100/peManagerProduct.manageFund}" pattern="#0.00"/>%</span></td>
                  </tr>
                  <tr>
                      <td>管理基金：</td>
                      <td class="txt_a_left"><span class="font_color_b">${peManagerProduct.manageFund}只</span></td>
                  </tr>
                  <tr>
                      <td>产品盈利：</td>
                      <td class="txt_a_left"><span class="font_color_b">${peManagerProduct.profitProduct}只</span></td>
                  </tr>
              </table>
          </li>
          <li class="attr_item">
            <table class="jinglixinxi">
                  <tr>
                      <td>代表作：</td>
                      <td class="txt_a_left"><span class="bluecolor_font"> 
                      <a href="rest/web/pe/peIndexProductDetail?peProductId=${peManagerProduct.productId}" target="_blank">
                        ${peManagerProduct.productSimpleName}
                      </a>                    
                      </span></td>
                  </tr>
                  <tr>
                      <td>累计收益：</td>
                      <td class="txt_a_left">
                      		<c:if test="${peManagerProduct.accumulatedIncome>0}">
                        		<span class="f_f80"><fmt:formatNumber value="${peManagerProduct.accumulatedIncome}" pattern="###0.00"/>%</span>
                        	</c:if>
                        	<c:if test="${peManagerProduct.accumulatedIncome<0}">
                        		<span style="color: #090;"><fmt:formatNumber value="${peManagerProduct.accumulatedIncome}" pattern="###0.00"/>%</span>
                        	</c:if>
                      </td>
                  </tr>
                  <tr>
                      <td>净值日期：</td>
                      <td class="txt_a_left"><span class="font_color_b"><fmt:formatDate value="${peProduct.netWorthTime}" pattern="yyyy-MM-dd"/></span></td>
                  </tr>
              </table>
          </li>
          <li class="attr_item attr_item_last" style="border-right:1px solid #d3d3d3;">
            <table class="jinglixinxi">
                  <tr>
                      <td>所在公司：</td>
                      <td class="txt_a_left"><span class="font_color_b">${peCompany.name}</span></td>
                  </tr>
                  <tr>
                      <td>从业年限：</td>
                      <td class="txt_a_left"><span class="font_color_b">${(peManagerProduct.workYear==null||peManagerProduct.workYear.trim()=="")?"--":peManagerProduct.workYear}</span></td>
                  </tr>
                  <tr>
                      <td>从业背景：</td>
                      <td class="txt_a_left"><span class="font_color_b">${(peManagerProduct.background==null||peManagerProduct.background.trim()=="")?"--":peManagerProduct.background}</span></td>
                  </tr>
              </table>
          </li>
        </ul>
      </div>
      <div class="detail_box_3">
        <form action="/public/rsv" class="detail_form" id="simu_detail_rsv_form">
          <div class="form_bd">
            <div class="submit_wrap">
                <div class="input_control"> <b style="color:#FF6600;font-size:26px;" >4006-114-088</b></div>
              <div class="input_control"> <a class="input_btn tjsinput_btn" href="javascript:void(0)" data_id="${peManagerProduct.productId}"><img class="clockicon" src="assets/img/ui2/clock.png" />立即预约</a> </div>
            </div>
          </div>
        </form>
      </div>
        <div class="clear"></div>
    <div class="jingli_txt">
        <img style="vertical-align:middle" src="assets/img/ui2/dianping.png" alt="" />&nbsp;${peManagerProduct.review}
    </div>
    </div>


    <div style="display:block;float:left;">
      <div id="detail_manager" class="mod_left_item tab simu_left_tab simu_side_nav_box">
        <div class="left_hd tab_hd clearfix"> <em class="ui_titico ui_titico_7"><img src="assets/img/ui2/txico.png" width="35" height="35" alt="" /></em>
          <ul class="tab_control">
            <li class="tab_control_item active">基金经理</li>
            <li class="sep"></li>
            <li class="tab_control_item">私募公司</li>
          </ul>
        </div>
        <div class="simu_detailwrap tab_bd" id="product_detail_div"> 
          <!-- tc_1 -->
          <div class="tab_con active"> 
            <!-- 基金经理 -->
            <div class="tab_mgr_wrap clearfix">
              <div class="mgr_img "> <img class="auto_wh" src="assets/img/simu/${peManagerProduct.logo}"  alt="">
              </div>
              <div class="mgr_con mgr_con_color">${peManagerProduct.introduce}</div>
            </div>
            <div class="tab_mgr_wrap clearfix dp_none">
            <div class="mgr_con_color">${peCompany.companyProfile}</div>
        </div>
          </div>
          <!-- tc_4 --> 
        </div>
          
      </div>
        <div class="clear"></div>
    </div>
    <div class="tjs_detail_manager_right" style="margin-top: 2px;">
    <h2 class="simu_goumailiucheng">私募购买流程</h2>   
    <div class="goumailiucheng_img">
        <img src="assets/img/ui2/goumailiucheng.png" alt="" />
    </div> 
    <div class="liuchengxinxi">
        <ul>
            <li><span>在线预约</span><br />或拨打4006-114-088</li>
            <li><span>确定意向</span><br />额度和打款时间</li>
            <li><span>完成打款</span><br />制定监管账号</li>
            <li><span>成功购买</span><br />按签署合同收取返现</li>
        </ul>
    </div>      
</div>
<div class="clear"></div>

  <div class="layout_n clearfix">
    <div class="mod_left_wrap"> 
      <!-- 推荐理由 --> 
      <!-- 基金收益 -->
      <div  class="mod_left_item simu_side_nav_box">
        <div class="left_hd clearfix"> <span class="txt"> </span> <span class="txt"> <em class="ui_titico ui_titico_6"><img src="assets/img/ui2/zoushi.png" style="margin-top:10px;" alt="" /></em>${peManagerProduct.managerName}代表作 </span><span class="dbzuo_fc">${peManagerProduct.productSimpleName}</span> </div>
        <div class="simu_detailwrap_2 simu_detailwrap">
          <!-- 
          <div class="sub_item">
            <div class="sub_hd f_s14">收益测算</div>
            <div class="sub_bd_1">
              <div class="tit">历史业绩来看，以投入一年，100万元为例 ( <span class="f_f60">赚8377400元</span> ~ <span class="f_f60">赚8377400元</span> )</div>
              <table class="detail_tb_2 tjstbl" width="80%">
                <thead>
                  <tr>
                    <th width="20%">收益</th>
                    <th width="20%">今年以来</th>
                    <th width="20%">2014年</th>
                    <th width="20%">2013年</th>
                    <th width="20%">2012年</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="f_f70">
                    <td>赚</td>
                    <td>8377400</td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr class="f_090">
                    <td>亏</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
           -->
           
          <div class="sub_item">
            <div class="sub_hd f_s14">净值走势</div>
            <div id="chartContainer" class="sub_bd_1">
            </div>
          </div>
          
          
          <div class="sub_item">
            <div class="sub_hd clearfix">
              <div class="sub_hd_left f_s14">收益排名</div>
              <div class="sub_hd_right f_s14">净值</div>
            </div>
            <div class="sub_bd_3 clearfix">
            
              <div class="sub_left">
                <table class="detail_tb_2" width="100%">
                  <thead>
                    <tr>
                      <th width="75">年度</th>
                      <th width="75">期间收益</th>
                      <th width="75">行业平均</th>
                      <th width="75">沪深300</th>
                      <th width="75">排名</th>
                      <th width="*">排名区间</th>
                    </tr>
                  </thead>
                </table>
                <div class="detail_tb_oyb">
                  <table class="detail_tb_2" width="100%">
                    <tbody>
                    <c:forEach items="${lstPEProductIncome}" var="peProductIncome">
                      <tr>
                        <td width="75">${ peProductIncome.year}</td>
                        <td width="75">
                        	<c:if test="${empty peProductIncome.durationIncome}">---</c:if>
                        	<c:if test="${not empty peProductIncome.durationIncome}">
                        		<c:if test="${peProductIncome.durationIncome>0}">
	                        		<span class="f_f80"><fmt:formatNumber value="${peProductIncome.durationIncome}" pattern="###0.##"/>%</span>
	                        	</c:if>
	                        	<c:if test="${peProductIncome.durationIncome<0}">
	                        		<span style="color: #090;"><fmt:formatNumber value="${peProductIncome.durationIncome}" pattern="###0.##"/>%</span>
	                        	</c:if>
                        	</c:if>
                        </td>                        
                        <td width="75">
	                        <c:if test="${empty peProductIncome.industryAverage}">---</c:if>
	                        <c:if test="${not empty peProductIncome.industryAverage}">
	                        	<c:if test="${peProductIncome.industryAverage>0}">
	                        		<span class="f_f80"><fmt:formatNumber value="${peProductIncome.industryAverage}" pattern="###0.##"/>%</span>
	                        	</c:if>
	                        	<c:if test="${peProductIncome.industryAverage<0}">
	                        		<span style="color: #090;"><fmt:formatNumber value="${peProductIncome.industryAverage}" pattern="###0.##"/>%</span>
	                        	</c:if>
	                        </c:if>
	                    </td>
                        <td width="75">
                        	<c:if test="${empty peProductIncome.hs300}">---</c:if>
                        	<c:if test="${not empty peProductIncome.hs300}">
                        		<c:if test="${peProductIncome.hs300>0}">
	                        		<span class="f_f80"><fmt:formatNumber value="${peProductIncome.hs300}" pattern="###0.##"/>%</span>
	                        	</c:if>
	                        	<c:if test="${peProductIncome.hs300<0}">
	                        		<span style="color: #090;"><fmt:formatNumber value="${peProductIncome.hs300}" pattern="###0.##"/>%</span>
	                        	</c:if>
                        	</c:if>
                        </td>
                        <td width="75"><c:if test="${empty peProductIncome.rank}">---</c:if><c:if test="${not empty peProductIncome.rank}">${ peProductIncome.rank}</c:if></td>
                        <td width="*"><c:if test="${empty peProductIncome.rankInterval}">---</c:if><c:if test="${not empty peProductIncome.rankInterval}"><fmt:formatNumber value="${peProductIncome.rankInterval}" pattern="#0.##"/>%</c:if></td>
                      </tr>
                    </c:forEach>                                       
                    </tbody>
                  </table>
                </div>
              </div>
              
              <div class="sub_right">
                <table class="detail_tb_2" width="100%">
                  <thead>
                    <tr>
                      <th width="125">净值时间</th>
                      <th width="125">单位净值</th>
                      <th width="125">累计净值</th>
                      <th width="*">增长率</th>
                    </tr>
                  </thead>
                </table>
                <div class="detail_tb_oyb">
                  <table class="detail_tb_2" width="100%">
                    <tbody>
                     <c:forEach items="${lstPEProductNet}" var="peProductNet" varStatus="status">
                      <tr class="${status.index%2==0?'even':'odd'}">
                        <td width="125"><fmt:formatDate value="${peProductNet.netTime}" pattern="yyyy.MM.dd"/></td>
                        <td width="125"><c:if test="${empty peProductNet.unitNet}">---</c:if><c:if test="${not empty peProductNet.unitNet}"><fmt:formatNumber value="${peProductNet.unitNet}" pattern="#0.####"/></c:if></td>
                        <td width="125"><c:if test="${empty peProductNet.totalNet}">---</c:if><c:if test="${not empty peProductNet.totalNet}"><fmt:formatNumber value="${peProductNet.totalNet}" pattern="#0.####"/></c:if></td>
                        <td width="*">
                        	<c:if test="${empty peProductNet.increaseRate}">---</c:if>
                        	<c:if test="${not empty peProductNet.increaseRate}">
                        		<c:if test="${peProductNet.increaseRate>0}">
	                        		<span class="f_f80"><fmt:formatNumber value="${peProductNet.increaseRate}" pattern="###0.##"/>%</span>
	                        	</c:if>
	                        	<c:if test="${peProductNet.increaseRate<0}">
	                        		<span style="color: #090;"><fmt:formatNumber value="${peProductNet.increaseRate}" pattern="###0.##"/>%</span>
	                        	</c:if>
                        	</c:if>
                        </td>
                      </tr>
                      </c:forEach>                   
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 基金经理、私募公司、投资理念、投研团队 -->

  <!-- 通栏结构 -->
  <div id="detail_under" class="layout_n simu_side_nav_box mg_btm"> 
    <!-- 旗下产品收益率	 -->
    <div class="mod_box_item">
      <div class="box_hd clearfix"> <span class="txt"><em class="ui_titico ui_titico_9"><img width="35" height="35" src="assets/img/ui2/shouyiicon.png" alt="" /></em>旗下产品收益</span> </div>
      <div class="box_bd">
        <table class="simu_pro_tb_2" width="100%">
          <thead>
            <tr>
              <th class="c_l c_b">基金简称</th>
              <th class="c_l c_b">最新净值</th>
              <th class="c_r c_b">累计收益</th>
              <th class="c_c c_b">运行时间</th>
              <th class="c_r c_b">今年以来收益率</th>
              <th class="c_r c_b">近2年收益率</th>
              <th class="c_r c_b">近1年收益率</th>
              <th class="c_r c_b">年化收益</th>
              <th class="c_c">基金类型</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${lstPEProduct}" var="peProduct" varStatus="status">
             <tr class="${status.index%2==0?'even':'odd'}">
              <td class="c_l c_b"><a href="rest/web/pe/peIndexProductDetail?peProductId=${peProduct.id}" target="_blank" title="好运来巨牛一号"> ${peProduct.simpleName } </a></td>
              <td class="c_l c_b"><c:if test="${empty peProduct.netWorth}">---</c:if><c:if test="${not empty peProduct.netWorth}"><fmt:formatNumber value="${peProduct.netWorth}" pattern="#0.####"/></c:if></td>
              <td class="c_r c_b"><c:if test="${empty peProduct.accumulatedIncome}">---</c:if>
              	<c:if test="${not empty peProduct.accumulatedIncome}">
              		<c:if test="${peProduct.accumulatedIncome>0}">
                   		<span class="f_f80"><fmt:formatNumber value="${peProduct.accumulatedIncome}" pattern="###0.##"/>%</span>
                   	</c:if>
                   	<c:if test="${peProduct.accumulatedIncome<0}">
                   		<span style="color: #090;"><fmt:formatNumber value="${peProduct.accumulatedIncome}" pattern="###0.##"/>%</span>
                   	</c:if>
              	</c:if>
              </td>
              <td class="c_c c_b"><c:if test="${empty peProduct.runTime}">---</c:if><c:if test="${not empty peProduct.runTime}">${ peProduct.runTime}</c:if></td>
              <td class="c_r c_b"><c:if test="${empty peProduct.nowRate}">---</c:if>
              	<c:if test="${not empty peProduct.nowRate}">
              		<c:if test="${peProduct.nowRate>0}">
                   		<span class="f_f80"><fmt:formatNumber value="${peProduct.nowRate}" pattern="###0.##"/>%</span>
                   	</c:if>
                   	<c:if test="${peProduct.nowRate<0}">
                   		<span style="color: #090;"><fmt:formatNumber value="${peProduct.nowRate}" pattern="###0.##"/>%</span>
                   	</c:if>
              	</c:if>
              </td>
              <td class="c_r c_b"><c:if test="${empty peProduct.towRate}">---</c:if>
              	<c:if test="${not empty peProduct.towRate}">
              		<c:if test="${peProduct.towRate>0}">
                   		<span class="f_f80"><fmt:formatNumber value="${peProduct.towRate}" pattern="###0.##"/>%</span>
                   	</c:if>
                   	<c:if test="${peProduct.towRate<0}">
                   		<span style="color: #090;"><fmt:formatNumber value="${peProduct.towRate}" pattern="###0.##"/>%</span>
                   	</c:if>
              	</c:if>
              </td>
              <td class="c_r c_b"><c:if test="${empty peProduct.oneRate}">---</c:if>
              	<c:if test="${not empty peProduct.oneRate}">
              		<c:if test="${peProduct.oneRate>0}">
                   		<span class="f_f80"><fmt:formatNumber value="${peProduct.oneRate}" pattern="###0.##"/>%</span>
                   	</c:if>
                   	<c:if test="${peProduct.oneRate<0}">
                   		<span style="color: #090;"><fmt:formatNumber value="${peProduct.oneRate}" pattern="###0.##"/>%</span>
                   	</c:if>
              	</c:if>
              </td>
              <td class="c_r c_b"><c:if test="${empty peProduct.yearRate}">---</c:if>
              	<c:if test="${not empty peProduct.yearRate}">
              		<c:if test="${peProduct.yearRate>0}">
                   		<span class="f_f80"><fmt:formatNumber value="${peProduct.yearRate}" pattern="###0.##"/>%</span>
                   	</c:if>
                   	<c:if test="${peProduct.yearRate<0}">
                   		<span style="color: #090;"><fmt:formatNumber value="${peProduct.yearRate}" pattern="###0.##"/>%</span>
                   	</c:if>
              	</c:if>
              </td>
              <td class="c_c">
	             <c:choose>  
	                <c:when test="${peProduct.productLevel =='1'}">股票</c:when>
	                <c:when test="${peProduct.productLevel =='2'}">期货基金</c:when>
	                <c:when test="${peProduct.productLevel =='3'}">股票量化</c:when>
	                <c:when test="${peProduct.productLevel =='4'}">债券型</c:when>
	                <c:when test="${peProduct.productLevel =='5'}">定向增发</c:when>
	                <c:when test="${peProduct.productLevel =='3'}">宏观对冲</c:when>
	                <c:when test="${peProduct.productLevel =='4'}">组合基金</c:when>
	                <c:when test="${peProduct.productLevel =='5'}">其他</c:when>
	                 <c:otherwise>---</c:otherwise>  
	            </c:choose>                                                    
              </td>
            </tr>
            </c:forEach>           
          </tbody>
        </table>
      </div>
    </div>
    <!-- hot product-->
  </div>
</div>
</div>
    </div>
<!-- container end -->   
 <%@ include file="/views/web/footer.jsp"%>
    <!-- /footer tjs_1108px --> 
  </div>
</div>
<!-- /home_all -->
<script  type="text/javascript">
var IndexPage = {};
   IndexPage.orderProductUrl="rest/web/pe/peOrderProduct";
	//切换经理，公司
    $(function(){
        $(".tab_control_item").each(function (index) {
            $(this).click(function () {
                $(".tab_control_item").removeClass("active");
                $(this).addClass("active");
                $(".tab_mgr_wrap").hide();
                $(".tab_mgr_wrap:eq(" + index + ")").show();
            });
        });
        

    	//--预约--                   
    	$("a.tjsinput_btn").click(function(event){	
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
    });   
	
    var chartObj = {
			renderTo: 'chartContainer',
			width: 860,
			height: 350,
			style: 'text-align:center;margin:0px auto;'
		};
	    
	    $(function () {
	    	drawChart(eval("(" +'${valueSeries}'+ ")"), chartObj);
	    	//修改位置
			$(".highcharts-container").css("text-align","center");
			$(".highcharts-container").css("margin", "0px auto");
		});

	    
	    function drawChart(chart_data, chartObj)
	    {
	        var chart1 = new Highcharts.StockChart({
	            colors: ['#FF6600', '#3DADEA', '#009900', '#B33133'],
	            chart: {
	                renderTo: chartObj.renderTo,
	                width: chartObj.width,
	                height: chartObj.height
	            },
	            credits: {
	                enabled: true,
	                href: null,
	                text: ''
	            },
	            exporting: {enabled: false},
	            title: {text: null, style: {color: '#004789'}},
	            rangeSelector: {enabled: false},
	            tooltip: {
	                enabled: true,
	                crosshairs: true,
	                formatter: function () {
	                    var date = new Date(this.x);
	                    var header = '<b>时间: ' + date.getFullYear() + '年' + (date.getMonth() + 1) + '月' + date.getDate() + '日' + '</b>';
	                    $.each(this.points, function (i, point) {
	                        if(i==0 && chartObj.renderTo !== "compare_chart_container"){
	                            header += '<br/><span style="color:' + this.point.series.color + '">累计净值:' + Highcharts.numberFormat(this.y, 2) + '</span>';
	                        }else{
	                            header += '<br/><span style="color:' + this.point.series.color + '">' + this.point.series.name + ':' + Highcharts.numberFormat(this.y, 2) + '</span>';
	                        }
	                    });
	                    return header;
	                }
	            },
	            xAxis: {
	                type: 'datetime',
	                gridLineDashStyle: 'longdash',
	                dateTimeLabelFormats: {
	                    second: '%Y-%m-%d<br/>%H:%M:%S',
	                    minute: '%Y-%m-%d<br/>%H:%M',
	                    hour: '%Y-%m-%d<br/>%H:%M',
	                    day: '%Y<br/>%m-%d',
	                    week: '%Y<br/>%m-%d',
	                    month: '%Y-%m',
	                    year: '%Y'
	                },
	                gridLineWidth: 1,
	                lineColor: '#999',
	                tickColor: '#999',
	                showFirstLabel: true,
	                showLastLabel: true,
	                labels: {
	                    style: {
	                        color: '#000',
	                        font: '11px Trebuchet MS, Verdana, sans-serif',
	                        align: 'right',
	                        style: {font: 'normal 13px 宋体'}
	                    },
	                    formatter: function () {
	                        return Highcharts.dateFormat('%Y-%m-%d', this.value);
	                    }
	                },
	                title: {
	                    style: {
	                        color: '#333',
	                        fontWeight: 'bold',
	                        fontSize: '12px',
	                        fontFamily: 'Trebuchet MS, Verdana, sans-serif'
	                    }
	                }
	            },

	            yAxis: {

	                showLastLabel: true,
	                tickPixelInterval: 40,
	                lineColor: '#999',
	                lineWidth: 1,
	                tickWidth: 1,

	                tickColor: '#999',
	                labels: {
	                    align: 'right',
	                    x: -10,
	                    y: 5,
	                    style: {
	                        color: '#000',
	                        font: '11px Trebuchet MS, Verdana, sans-serif'
	                    }
	                },
	                title: {
	                    style: {
	                        color: '#333',
	                        fontWeight: 'bold',
	                        fontSize: '12px',
	                        fontFamily: 'Trebuchet MS, Verdana, sans-serif'
	                    }
	                }
	            },

	            legend: {
	                enabled: true,
	                itemStyle: {
	                    font: '9pt Trebuchet MS, Verdana, sans-serif',
	                    color: '#004789'

	                },
	                itemHoverStyle: {
	                    color: '#004789'
	                }

	            },
	            scrollbar: {enabled: false},
	            navigator: {
	                enabled: true,
	                top: (chartObj.height-80),
	                height: 30,
	                xAxis: {
	                    labels: {
	                        enabled: false
	                    }
	                }

	            },

	            plotOptions: {
	                series: {lineWidth: 2},
	                line: {
	                    cursor: 'pointer',
	                    shadow: false,
	                    states: {
	                        /*状态*/
	                        hover: {
	                            /*(鼠标)悬浮状态*/
	                            lineWidth: 2    /*曲线宽*/
	                        }
	                    }
	                }
	            },
	            //设置3条线宽度也可以在下面单独设置
	            series: chart_data
	        }, function (chart) { // on complete
	            chart.renderer.image('assets/img/logo_watermark.png', chartObj.width/2-115, 30, 230, 100)
	                .add();

	        });
	    }
	
  </script>
<body>
</body>
</html>
