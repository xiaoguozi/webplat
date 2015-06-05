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
						<li><a href="rest/web/pe/peIndex"><span>私募首页</span></a></li>
						<li><a href="rest/web/pe/peIndexRate"><span>私募排行</span></a></li>
						<li><a href="rest/web/pe/peIndexProduct"><span class="simu_on">私募产品</span></a></li>
						<li><a href="rest/web/pe/peIndexManager"><span>私募经理</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->

		<!-- /header_menu -->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="" class="path_item">私募</a><span
					class="sep">&gt;</span> <a href="" class="path_item">私募产品</a> <span
					class="sep">&gt;</span> <span class="txt">私募产品对比</span>
			</div>
		</div>

		<!-- 私募对比 -->
	      <div class="tjs_1108px center">
	       <div  class="mod_left_item simu_side_nav_box">
	        <div class="left_hd clearfix"> <span class="txt"> <em class="ui_titico ui_titico_6"><img src="assets/img/ui2/zoushi.png" style="margin-top:10px;" alt="" /></em>收益大比拼 </span> </div>
	        <div class="simu_detailwrap_2 simu_detailwrap">
	          <div class="sub_item">
	            <div class="sub_hd">历史收益对比</div>
	            <div class="sub_bd_1">
	              <table class="detail_tb_2 tjstbl" style="margin-top:30px;" width="80%">
	                <thead>
	                  <tr>
	                  	<td>&nbsp;</td>
	                  	<td>今年以来</td>
	                  	<td>年化收益</td>
	                  	<c:forEach items="${maxYearList}" var="maxYear" begin="1">
	                  		<td >${maxYear.netYear}年</td>
	                  	</c:forEach>
	                  </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${lstYearAll}"  var="yearList">
		                	<tr >
			                		<c:forEach items="${yearList}" var="yearVO" varStatus="status">
			                			<c:if test="${status.index==0}">
			                					<td class="f_090"><a href="rest/web/pe/peIndexProductDetail?peProductId=${yearVO.id}" target="_blank">${yearVO.name}</a></td>
			                					<c:if test="${yearVO.nowRate>0}">
					                        		<td><span class="f_f80"><fmt:formatNumber value="${yearVO.nowRate}" pattern="###0.00"/>%</span></td>	
					                        	</c:if>
					                        	<c:if test="${yearVO.nowRate<0}">
					                        		<td><span style="color: #090;"><fmt:formatNumber value="${yearVO.nowRate}" pattern="###0.##"/>%</span></td>	
					                        	</c:if>
					                        	<c:if test="${yearVO.nowRate==null || yearVO.nowRate==0 || yearVO.nowRate=='0.00'}">
					                        		<td>--</td>
					                        	</c:if>
			                			</c:if>
			                			<c:if test="${status.index!=0}">
			                					<c:if test="${yearVO.nowRate>0}">
					                        		<td><span class="f_f80"><fmt:formatNumber value="${yearVO.nowRate}" pattern="###0.00"/>%</span></td>	
					                        	</c:if>
					                        	<c:if test="${yearVO.nowRate<0}">
					                        		<td><span style="color: #090;"><fmt:formatNumber value="${yearVO.nowRate}" pattern="###0.##"/>%</span></td>	
					                        	</c:if>
					                        	<c:if test="${yearVO.nowRate==null || yearVO.nowRate==0 || yearVO.nowRate=='0.00'}">
					                        		<td>--</td>
					                        	</c:if>
			                			</c:if>
			                		</c:forEach>
			                </tr>
		                </c:forEach>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="sub_item" >
	            <div class="sub_hd">净值走势对比</div>
	            <div id="chartContainer" class="sub_bd_1" style="min-width: 800px;height: 365px;">
	               	
	            </div>
	          </div>
	        </div>
	        <div class="left_hd clearfix border_color_blue"><span class="txt txtcolor" > <em class="ui_titico ui_titico_6" ><img src="assets/img/ui2/stact.png" style="margin-top:4px;" alt="" /></em>私募全面对比</span> </div>
	           <table class="tjs_tbl_compare_all">
	               <thead>
	                   <tr>
	                       <td></td>
	                       <td class="tdbgcolor pos_r"><span class="product_title_color">${lstYearAll[0][0].name}</span></td>
	                       <td class="pos_r"><span class="product_title_color">${lstYearAll[1][0].name}</span></td>
	                       <c:if test="${fn:length(lstYearAll)==3}">
		                       <td class="tdbgcolor pos_r"><span class="product_title_color">${lstYearAll[2][0].name}</span></td>
	                       </c:if>
	                       <c:if test="${fn:length(lstYearAll)==2}">
		                       <td class="tdbgcolor pos_r"><span class="product_title_color"></span></td>
	                       </c:if>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                       <td class="tjs_tbl_compare_all_tb1 txt_align_left"><b class="bfont_color">基金净值</b></td>
	                       <td></td>
	                       <td></td>
	                       <td>
	                       		
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">最新净值:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].netWorth}</td><td style="color: #000;">${lstYearAll[1][0].netWorth}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].netWorth}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">累计净值:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].netWorth}</td><td style="color: #000;">${lstYearAll[1][0].netWorth}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].netWorth}
	                       		</c:if>
	                       	</td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">运行时长:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].runTime}</td><td style="color: #000;">${lstYearAll[1][0].runTime}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].runTime}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金费用</b></td>
	                       <td></td><td></td><td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">认购起点:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].subscripStart}万元</td>
	                       <td style="color: #000;">${lstYearAll[1][0].subscripStart}万元</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].subscripStart}万元
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">浮动管理费:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].subscripFee}</td>
	                       <td style="color: #000;">${lstYearAll[1][0].subscripFee}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].subscripFee}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">开放日期:</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].openTime}</td>
	                       <td style="color: #000;">${lstYearAll[1][0].openTime}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].openTime}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金风险</b></td>
	                       <td></td><td></td><td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">基金类型：</span></td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${lstYearAll[0][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[0][0].fundType==8}">其他</c:if>
	                       	</td>
	                       <td style="color: #000;"><c:if test="${lstYearAll[1][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[1][0].fundType==8}">其他</c:if></td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			<c:if test="${lstYearAll[2][0].fundType==1}">股票</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==2}">期货基金</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==3}">股票量化</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==4}">债券型</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==5}">定向增发</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==6}">宏观对冲</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==7}">组合基金</c:if>
	                       		<c:if test="${lstYearAll[2][0].fundType==8}">其他</c:if>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><b class="bfont_color">基金经理</b></td>
	                       <td></td>
	                       <td></td>
	                       <td></td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">基金经理：</span></td>
	                       <td class="tdbgcolor txt_fcolor"><a href="rest/web/pe/peIndexMDetail?managerId=${lstYearAll[0][0].managerId}" target="_blank">${lstYearAll[0][0].managerName}</a></td>
	                       <td class="txt_fcolor"><a href="rest/web/pe/peIndexMDetail?managerId=${lstYearAll[1][0].managerId}" target="_blank">${lstYearAll[1][0].managerName}</a></td>
	                       <td class="tdbgcolor txt_fcolor">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			<a href="rest/web/pe/peIndexMDetail?managerId=${lstYearAll[2][0].managerId}" target="_blank">${lstYearAll[2][0].managerName}</a>
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">管理产品数：</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].manageFund}</td>
	                       <td style="color: #000;">${lstYearAll[1][0].manageFund}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].manageFund}
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">产品赢利占比：</span></td>
	                       <td class="tdbgcolor" style="color: #000;">${lstYearAll[0][0].profitRate}%</td>
	                       <td style="color: #000;">${lstYearAll[1][0].profitRate}%</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].profitRate}%
	                       		</c:if>
	                       </td>
	                   </tr>
	                   <tr>
	                       <td class="txt_align_left"><span class="sfont_color">所在公司：</span></td>
	                       <td class="tdbgcolor " style="color: #000;">${lstYearAll[0][0].companyName}</td>
	                       <td style="color: #000;">${lstYearAll[1][0].companyName}</td>
	                       <td class="tdbgcolor" style="color: #000;">
	                       		<c:if test="${fn:length(lstYearAll)==3}">
	                       			${lstYearAll[2][0].companyName}
	                       		</c:if>
	                       </td>
	                   </tr>
	               </tbody>
	           </table>
	  </div>
	
	  </div>		
		

		<div class="clear"></div>


		<%@ include file="/views/web/footer.jsp"%>
	</div>

	<!-- /home_all -->
	<script>
		//alert('${series}');
		/**
		$(function () {
			$('#chartContainer').highcharts({
				chart:{
					type:'line'
				},
				title: {
					text: '净值走势对比',
					x: -20 //center
				},
				xAxis: {
		            type: 'datetime',
		            dateTimeLabelFormats: { 
		            	day:"%m-%e",
		                month:"%Y-%m-%d"
		            },
		            title: {
		                text: ''
		            }
		        },
				yAxis: {
					title: {
						text: ''
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}],
					lineColor: '#808080',
		            lineWidth: 1
				},
				tooltip: {
					 headerFormat: '<b>{point.x:%Y-%m-%d}</b><br>',
			         pointFormat: '{series.name}: {point.y:.2f}'
				},
				
				series: eval("(" +'${series}'+ ")")
			});
			
			//删除highChart文字
			$("text[text-anchor='end']").html("");
		});
		*/
		
		$(function () {
				createChart = function () {
					
		            $('#chartContainer').highcharts('StockChart', {
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
		                                header += '<br/><span style="color:' + this.point.series.color + '">累计净值:'   + '</span>';
		                            }else{
		                                header += '<br/><span style="color:' + this.point.series.color + '">' + this.point.series.name + ':' +  '</span>';
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




















