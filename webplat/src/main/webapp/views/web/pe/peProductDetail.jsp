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
<script type="text/javascript" src="assets/scripts/ui/highstock.js"></script>

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
						<li><a href="rest/web/pe/peIndexRate" target="_blank"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct"><span class="simu_on">私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexManager" target="_blank"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- /header_menu -->
		  <div class="mod_breadcrumb">
		  <div class="layout_n clearfix"> <span class="home">当前位置 ：</span> <a href=""  class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndex" class="path_item" >私募</a> <span class="sep">&gt;</span> <a href="rest/web/pe/peIndexProduct" class="path_item">私募产品</a> <span class="sep">&gt;</span> <span class="txt">产品明细</span> </div>
		</div>
		

		<!-- container -->
<div class="simu_prodetail_container simu_side_nav_main">
  
  <!-- hot -->
  <div id="detail_info" class="layout_n simu_side_nav_box">
    <div class="simu_detailtop_box clearfix">
      <div class="detail_box_1"> <span class="box_tit"> <a target="_blank" href=""><img width="35" height="35" src="assets/img/ui2/txicon.png" alt="" />${peProduct.managerName}</a> - ${peProduct.name} </span>
        <ul class="assess_list">
        </ul>
      </div>
      <div class="detail_box_2">
        <ul class="attr_list clearfix">
          <!-- 无收益 --> 
          <!-- 有收益 -->
          <li class="attr_item">            
            <div class="attr_name">最新净值</div>
            <div class="attr_val"><fmt:formatNumber value="${peProduct.netWorth.intValue()}" pattern="#0"/><span class="small">.<fmt:formatNumber value="${peProduct.netWorth*100%100}" pattern="00"/></span></div>
            <div class="attr_info">净值日期：<fmt:formatDate value="${peProduct.netWorthTime}" pattern="yyyy-MM-dd"/></div>
          </li>
          <li class="attr_item">
            <div class="attr_name">累计收益</div>
            <div class="attr_val"><fmt:formatNumber value="${peProduct.accumulatedIncome.intValue()}" pattern="#0"/><span class="small percent">.<fmt:formatNumber value="${peProduct.accumulatedIncome*100%100}" pattern="00"/>%</span> </div>
            <div class="attr_info">成立日期： <fmt:formatDate value="${peProduct.setupTime}" pattern="yyyy-MM-dd"/></div>
          </li>
          <li class="attr_item attr_item_last" style="border-right:1px solid #d3d3d3;">
            <div class="attr_name">认购起点（万）</div>
            <div class="attr_val"><fmt:formatNumber value="${peProduct.subscripStart.intValue()}" pattern="#0"/><span class="small">.<fmt:formatNumber value="${peProduct.subscripStart*100%100}" pattern="00"/> </span></div>
            <div class="attr_info">私募公司：${peProduct.pecompanyName}</div>
          </li>
        </ul>
      </div>
      <div class="detail_box_3">
        <form action="/public/rsv" class="detail_form" id="simu_detail_rsv_form">
          <div class="form_bd">
            <div class="submit_wrap">
                <div class="input_control"> <b style="color:#FF6600;font-size:26px;">4006-114-088</b></div>
              <div class="input_control"> <a class="input_btn tjsinput_btn" href="#" data_id="${peProduct.id}"><img class="clockicon" src="assets/img/ui/clock.png" />立即预约</a> </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- 两栏结构 -->
  <div class="layout_n clearfix">
    <div class="mod_left_wrap"> 
      <!-- 推荐理由 --> 
      <!-- 基金收益 -->
      <div  class="mod_left_item simu_side_nav_box">
        <div class="left_hd clearfix" > <span class="txt"> </span> <span class="txt"> <em class="ui_titico ui_titico_6"><img src="assets/img/ui2/zoushi.png" style="margin-top:10px;" alt="" /></em>基金收益 </span> </div>
        <div class="simu_detailwrap_2 simu_detailwrap">
          <div class="sub_item">
            <div class="sub_hd f_s14">收益测算</div>
            <div class="sub_bd_1">
              <div class="tit">历史业绩来看,以投入一年，100万元为例 ( <span class="f_f80">赚${rateMax.intValue()}元</span> ~ <span class="f_f80">赚${rateMin.intValue()}元</span> )</div>
              <table class="detail_tb_2 tjstbl" width="80%">
                <thead>
                  <tr>
                    <th width="20%">收益</th>
                  	<c:forEach items="${lstYear}" var="yearVO">
                    	<c:if test="${yearVO.netYear==currentYear}">
	                    	<th width="20%">今年以来</th>
                    	</c:if>
                    	<c:if test="${yearVO.netYear!=currentYear}">
	                    	<th width="20%">${yearVO.netYear}年</th>
                    	</c:if>
                    </c:forEach>
                  </tr>
                </thead>
                <tbody>
                  <tr class="f_f80">
                    <td>赚</td>
                    <c:forEach items="${lstProductRate}" var="rateVO">
                    	<c:if test="${rateVO.nowRate>=0}">
                    		<td>${rateVO.nowRate.intValue()}</td>
                    	</c:if>
                    	<c:if test="${rateVO.nowRate<0}">
                    		<td></td>
                    	</c:if>
                    </c:forEach>
                  </tr>
                  <tr class="f_090" style="color: #090;">
                    <td>亏</td>
                    <c:forEach items="${lstProductRate}" var="rateVO">
                    	<c:if test="${rateVO.nowRate<0}">
                    		<td>${rateVO.nowRate.intValue()}</td>
                    	</c:if>
                    	<c:if test="${rateVO.nowRate>=0}">
                    		<td></td>
                    	</c:if>
                    </c:forEach>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="sub_item" style="display:none;">
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
                    	<c:forEach items="${lstProductIncome}" var="peProductIncome">
	                      <tr >
	                        <td width="75">
	                        	${peProductIncome.year}
	                        </td>
	                        <td width="75">
	                        	<c:if test="${peProductIncome.durationIncome!=null || peProductIncome.durationIncome!=0 || peProductIncome.durationIncome!='0.00'}">
	                        		<c:if test="${peProductIncome.durationIncome>0}">
	                        			<span class="f_f80">${peProductIncome.durationIncome}%</span>
	                        		</c:if>
	                        		<c:if test="${peProductIncome.durationIncome<0}">
		                        		<span style="color: #090;">${peProductIncome.durationIncome}%</span>
	                        		</c:if>
	                        	</c:if>
	                        </td>
	                        <td width="75">
	                        	<c:if test="${peProductIncome.industryAverage!=null || peProductIncome.industryAverage!=0 || peProductIncome.industryAverage!='0.00'}">
	                        		<c:if test="${peProductIncome.industryAverage>0}">
	                        			<span class="f_f80">${peProductIncome.industryAverage}%</span>
	                        		</c:if>
	                        		<c:if test="${peProductIncome.industryAverage<0}">
	                        			<span style="color: #090;">${peProductIncome.industryAverage}%</span>
	                        		</c:if>
	                        	</c:if>
	                        </td>
	                        <td width="75">
	                        	<c:if test="${peProductIncome.hs300!=null || peProductIncome.hs300!=0 || peProductIncome.hs300!='0.00'}">
	                        		<c:if test="${peProductIncome.hs300>0}">
	                        			<span class="f_f80">${peProductIncome.hs300}%</span>
	                        		</c:if>
	                        		<c:if test="${peProductIncome.hs300<0}">
	                        			<span style="color: #090;">${peProductIncome.hs300}%</span>
	                        		</c:if>
	                        	</c:if>
	                        </td>
	                        <td width="75">
	                        	<c:if test="${peProductIncome.rank!=null || peProductIncome.rank!=0 || peProductIncome.rank!='0.00'}">
	                        		${peProductIncome.rank}
	                        	</c:if>
	                        </td>
	                        <td width="*">
	                        	<c:if test="${peProductIncome.rankInterval!=null || peProductIncome.rankInterval!=0 || peProductIncome.rankInterval!='0.00'}">
	                        		<fmt:formatNumber value="${peProductIncome.rankInterval.intValue()}" pattern="#0"/>%
	                        	</c:if>
	                        </td>
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
                    	<c:forEach items="${lstPeProductNet}" var="peProductNet">
                    		<tr class="even">
		                        <td width="125"><fmt:formatDate value="${peProductNet.netTime}" pattern="yyyy-MM-dd"/></td>
		                        <td width="125"><fmt:formatNumber value="${peProductNet.unitNet}" pattern="###0.##"/></td>
		                        <td width="125"><fmt:formatNumber value="${peProductNet.totalNet}" pattern="###0.##"/></td>
		                        <td width="*">
		                        	<c:if test="${peProductNet.increaseRate>0}">
		                        		<span class="f_f80"><fmt:formatNumber value="${peProductNet.increaseRate}" pattern="###0.##"/>%</span>
		                        	</c:if>
		                        	<c:if test="${peProductNet.increaseRate<0}">
		                        		<span style="color: #090;"><fmt:formatNumber value="${peProductNet.increaseRate}" pattern="###0.##"/>%</span>
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
    <div style="display:block;float:left;">
      <div id="detail_manager" class="mod_left_item tab simu_left_tab simu_side_nav_box">
        <div class="left_hd tab_hd clearfix"> <em class="ui_titico ui_titico_7"><img src="assets/img/ui2/txico.png" width="35" height="35" alt="" /></em>
          <ul class="tab_control">
            <li class="tab_control_item active">基金经理</li>
            <li class="sep"></li>
            <li class="tab_control_item">私募公司</li>
            <li class="sep"></li>
            <li class="tab_control_item">投资理念</li>
            <li class="sep"></li>
            <li class="tab_control_item">投研团队</li>
          </ul>
        </div>
        <div class="simu_detailwrap tab_bd" id="product_detail_div"> 
          <!-- tc_1 -->
          <div class="tab_con active"> 
            <!-- 基金经理 -->
            <div class="tab_mgr_wrap clearfix">
              <div class="mgr_img"> <img src="assets/img/ui2/morentxicon.png"  alt="">
              </div>
              <div class="mgr_con">${peManager.introduce}</div>
            </div>
            <!-- 私募公司 -->
            <div class="tab_mgr_wrap clearfix dp_none">
            <div class="">${peCompany.companyProfile}</div>
            </div>
            <!-- 投资理念 -->
            <div class="tab_mgr_wrap clearfix dp_none">
            <div class="">${peCompany.investmentPhilosophy}</div>
            </div>
              <!-- 投研团队 -->
            <div class="tab_mgr_wrap clearfix dp_none">
            <div class="">${peCompany.investmentTeam}</div>
            </div>
          </div>
          <!-- tc_4 --> 
        </div>
          
      </div>
        <div class="clear"></div>
      <!-- 认购需知 -->
      <div class="mod_left_item simu_side_nav_box tjssimu_side_nav_box">
        <div class="left_hd clearfix tjsrengou"> <span class="txt rengou"><em class="ui_titico ui_titico_8">
            <img width="35" height="35" src="assets/img/ui2/rengouicon.png" alt="" /></em>认购需知</span> </div>
        <div class="simu_detailwrap_3 simu_detailwrap">
          <div class="wrap_1">
            <table class="detail_tb" width="100%">
              <tbody>
                <tr>
                  <th width="94">发行平台：</th>
                  <td width="318">${peProduct.distributionPlatform }</td>
                  <th width="94">基金性质：</th>
                  <td width="*">主基金
                  			<c:if test="${peProduct.fundProperty==1}">主基金</c:if>
                       		<c:if test="${peProduct.fundProperty==2}">子基金</c:if>
                  </td>
                </tr>
                <tr>
                  <th>托管银行：</th>
                  <td>${peProduct.custodianBank }</td>
                  <th>基金类型：</th>
                  <td>
							<c:if test="${peProduct.fundType==1}">股票</c:if>
                       		<c:if test="${peProduct.fundType==2}">期货基金</c:if>
                       		<c:if test="${peProduct.fundType==3}">股票量化</c:if>
                       		<c:if test="${peProduct.fundType==4}">债券型</c:if>
                       		<c:if test="${peProduct.fundType==5}">定向增发</c:if>
                       		<c:if test="${peProduct.fundType==6}">宏观对冲</c:if>
                       		<c:if test="${peProduct.fundType==7}">组合基金</c:if>
                       		<c:if test="${peProduct.fundType==8}">其他</c:if>
				 </td>
                </tr>
                <tr>
                  <th>证券经纪：</th>
                  <td>${peProduct.stockbrokers }</td>
                  <th>是否结构化：</th>
                  <td>${peProduct.whetherStructure }</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="wrap_2">
            <div class="subtit">参与和退出</div>
            <table class="detail_tb" width="100%">
              <tbody>
                <tr>
                  <th width="94">开  放  日：</th>
                  <td width="318">${peProduct.openTime}
                  </td>
                  <th width="94">退出费用：</th>
                  <td width="*">
                  	<c:if test="${peProduct.exitFee!=null}">
                  		${peProduct.exitFee}
                  		</c:if>
                  	</td>
                </tr>
                <tr>
                  <th>认购起点：</th>
                  <td>${peProduct.subscripStart}万元</td>
                  <th>浮动管理费：</th>
                  <td>
                  	<c:if test="${peProduct.managementFee!=null}">
                  		${peProduct.managementFee}
                  	</c:if>
                  </td>
                </tr>
                <tr>
                  <th>认  购  费：</th>
                  <td>
                  		<c:if test="${peProduct.subscripFee!=null}">
	                  		${peProduct.subscripFee}
	                  	</c:if>
                  </td>
                  <th></th>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="tjs_detail_manager_right">
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

  <!-- 通栏结构 -->
  <div id="detail_under" class="layout_n simu_side_nav_box"> 
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
            <c:forEach items="${lstManageProducts}" var="manageProduct">
	            <tr class="odd">
	              <td class="c_l c_b"><a href="rest/web/pe/peIndexProductDetail?peProductId=${manageProduct.id}" target="_blank" title="${manageProduct.name}">${manageProduct.name}</a></td>
	              <td class="c_l c_b">${manageProduct.netWorth }</td>
	              <td class="c_r c_b">
						<c:if test="${manageProduct.accumulatedIncome!=null}">
	                  		<c:if test="${manageProduct.accumulatedIncome>0}">
	                  			<span class="f_f80">${manageProduct.accumulatedIncome}%</span>
	                  		</c:if>
	                  		<c:if test="${manageProduct.accumulatedIncome<0}">
	                  			<span style="color: #090;">${manageProduct.accumulatedIncome}%</span>
	                  		</c:if>
	                  	</c:if>
				  </td>
	              <td class="c_c c_b">${manageProduct.runTime}</td>
	              <td class="c_r c_b">
	              		<c:if test="${manageProduct.nowRate!=null}">
	                  		<c:if test="${manageProduct.nowRate>0}">
	                  			<span class="f_f80">${manageProduct.nowRate}%</span>
	                  		</c:if>
	                  		<c:if test="${manageProduct.nowRate<0}">
	                  			<span style="color: #090;">${manageProduct.nowRate}%</span>
	                  		</c:if>
	                  	</c:if>
	              </td>
	              <td class="c_r c_b">
						<c:if test="${manageProduct.towRate!=null}">
	                  		<c:if test="${manageProduct.towRate>0}">
	                  			<span class="f_f80">${manageProduct.towRate}%</span>
	                  		</c:if>
	                  		<c:if test="${manageProduct.towRate<0}">
	                  			<span style="color: #090;">${manageProduct.towRate}%</span>
	                  		</c:if>
	                  	</c:if>
				</td>
	              <td class="c_r c_b">
						<c:if test="${manageProduct.oneRate!=null}">
	                  		<c:if test="${manageProduct.oneRate>0}">
	                  			<span class="f_f80">${manageProduct.oneRate}%</span>
	                  		</c:if>
	                  		<c:if test="${manageProduct.oneRate<0}">
	                  			<span style="color: #090;">${manageProduct.oneRate}%</span>
	                  		</c:if>
	                  	</c:if>
				</td>
	              <td class="c_r c_b">
	              		<c:if test="${manageProduct.yearRate!=null}">
	                  		<c:if test="${manageProduct.yearRate>0}">
	                  			<span class="f_f80">${manageProduct.yearRate}%</span>
	                  		</c:if>
	                  		<c:if test="${manageProduct.yearRate<0}">
	                  			<span style="color: #090;">${manageProduct.yearRate}%</span>
	                  		</c:if>
	                  	</c:if>
	              </td>
	              <td class="c_c">
							<c:if test="${manageProduct.fundType==1}">股票</c:if>
                       		<c:if test="${manageProduct.fundType==2}">期货基金</c:if>
                       		<c:if test="${manageProduct.fundType==3}">股票量化</c:if>
                       		<c:if test="${manageProduct.fundType==4}">债券型</c:if>
                       		<c:if test="${manageProduct.fundType==5}">定向增发</c:if>
                       		<c:if test="${manageProduct.fundType==6}">宏观对冲</c:if>
                       		<c:if test="${manageProduct.fundType==7}">组合基金</c:if>
                       		<c:if test="${manageProduct.fundType==8}">其他</c:if>
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

			<div class="clear"></div>
			<!-- container end -->


			<%@ include file="/views/web/footer.jsp"%>
		</div>

		<!-- /home_all -->
		<script>
			var IndexPage = {};
		    IndexPage.orderProductUrl="rest/web/pe/peOrderProduct";
		
			//切换经理，公司，理念，团队
		    window.onload = function () {
		        $(".tab_control_item").each(function (index) {
		            $(this).click(function () {
		                $(".tab_control_item").removeClass("active");
		                $(this).addClass("active");
		                $(".tab_mgr_wrap").hide();
		                $(".tab_mgr_wrap:eq(" + index + ")").show();
		            });
		        });
		    }
		 
		    //--预约--
		    function alertbox() {
		        alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
		    }
		    //--/预约--
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
		    //--预约--    
		    
		    
		    $(function () {
					createChart = function () {
						
			            $('#chartContainer').highcharts('StockChart', {
			            	xAxis: {
			            	   tickPixelInterval: 150,
			                   type: 'datetime',
	                           title: {
	                               text: null
	                           },
	                           
	                           formatter: function() {

	                        	   var vDate=new Date(this.value);

	                        	   return vDate.getFullYear()+"-"+(vDate.getMonth()+1)+"-"+vDate.getDate();

	                        	} 
			                },
			                yAxis: {
			                    labels: {
			                        formatter: function () {
			                            return  this.value;
			                        }
			                    },
			                    plotLines: [{
			                        value: 0,
			                        width: 1,
			                        color: 'silver'
			                    }],
			                    gridLineWidth: 1 ,
			                    lineWidth : 1,
			                    minorTickInterval: 'auto',
			                    minorTickLength: 10,
			                    minorTickWidth: 1
			                },
			
			                plotOptions: {
			                    series: {
			                        compare: 'percent'
			                    }
			                },
			
			                tooltip: {
			                    pointFormat: '<span style="color:{series.color}">{series.name}: {point.y}</span><br/>',
			                    valueDecimals: 2
			                },
			
			                series: eval("(" +'${valueSeries}'+ ")")
			            });
			            
			          	//去掉版权
				    	$("text[text-anchor=end]").html("");
			        };
			
				createChart();
			});
	
    </script>
</body>
</html>




















