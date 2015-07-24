<%@ include file="/views/wx/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0">
    <title>${simucp.managerName} - ${simucp.name}</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    	.rotateTop{display:inline-block;
    			transition:all 0.5s ease;
    			-webkit-transition:all 0.5s ease;
    			-moz-transition:all 0.5s ease;
    			-o-transition:all 0.5s ease;
    			-ms-transition:all 0.5s ease;
		    	transform:rotate(-90deg);
		    	-moz-transform:rotate(-90deg);
		    	-o-transform:rotate(-90deg);
		    	-ms-transform:rotate(-90deg);
		    	-webkit-transform:rotate(-90deg);
    	}
    	
    	.small {
        	font: 12px Tahoma,'\5FAE\8F6F\96C5\9ED1';
    	}
    	
    	.sub_item {
	        border-bottom: 1px solid #d3d3d3;
	    }
	
	    .sub_hd {
	        height: 48px;
	        margin: 0 30px;
	        border-bottom: 1px dashed #D3D3D3;
	        background-color: #fff;
	        line-height: 48px;
	    }
	
	    .sub_bd_1 {
	        padding: 0 30px 30px;
	        text-align: center;
	    }
    	
    </style>
</head>

<body class="bg_gray">
    <div class="container">
    	<div class="row" >
            <a href="javascript:void(0);" class="btn btn-block btn-lg back_btn" style="cursor: default;width: 100%;"><font style="font-family: 黑体;color:#080808; font-size: 20px;">${simucp.managerName} - ${simucp.name}</font></a>
        </div>
        <div class="row" style="background: white; ">
        	<div class="col-xs-4" style="border-top: 2px solid #F9F9F9; border-bottom: 2px solid #F9F9F9;">
        		<p style="margin-top: 5px;">最新净值</p>
        		<p><font style="color: red; font-size: 17px;" >${simucp.netWorth}</font></p>
        		<p><nobr><font style="font-size: 12px;">净值日期：<br><fmt:formatDate value="${simucp.netWorthTime}" pattern="yyyy-MM-dd"/></font></nobr></p>
        	</div>
        	<div class="col-xs-4" style="border: 2px solid #F9F9F9;">
        		<p style="margin-top: 5px;">累计收益</p>
        		<p><font style="color: red; font-size: 17px;" ><fmt:formatNumber value="${simucp.accumulatedIncome.intValue()}" pattern="#0"/><span class="small">.<fmt:formatNumber value="${simucp.accumulatedIncome*100%100}" pattern="00"/>%</span></font></p>
        		<p><nobr><font style="font-size: 12px;">成立日期：<br> <fmt:formatDate value="${simucp.setupTime}" pattern="yyyy-MM-dd"/></font></nobr></p>
        	</div>
        	<div class="col-xs-4" style="border-top: 2px solid #F9F9F9; border-bottom: 2px solid #F9F9F9;">
        		<p style="margin-top: 5px;"><nobr>认购起点（万）</nobr></p>
        		<p><font style="color: red; font-size: 17px;" ><fmt:formatNumber value="${simucp.subscripStart.intValue()}" pattern="#0"/><span class="small">.<fmt:formatNumber value="${simucp.subscripStart*100%100}" pattern="00"/> </span></font></p>
        		<p><nobr><font style="font-size: 12px;">私募公司：<br>${simucp.pecompanyName}</font></nobr></p>
        	</div>
        </div>
        <div class="row ">
            <div class="col-xs-12" style="border-bottom: 1px dashed #D3D3D3; background-color: #fff;">净值走势</div>
         </div>
         <div class="row" style="width: 100%;background: #fff;">
            <div class="col-xs-12" id="chartContainer" ></div>
         </div>
         
         <div class="row pei_money" style="border-bottom: 0px; cursor: pointer;" onclick="showPanel('rgxz');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">认购需知</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpSysm">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="rgxzArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       
       <div id="rgxz" class="panel-collapse collapse row" role="tabpanel"  style="background: #fff;padding-left: 15px">
             <div class="row">
             	
             </div>
       </div>
         
        
    </div>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding-bottom:20px">
                    <a href="rest/wx/xintuo/reservePage?productId=${xtcp.xtcpId}" class="btn btn-block btn_orange">立即预约</a>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/scripts/ui/highstock-1.3.9.js"></script>
<script src="assets/scripts/wx/jweixin-1.0.0.js" ></script>
<script type="text/javascript">

	function showPanel(panelId){
		var obj = $("#"+panelId);
		var objArrow = $("#"+panelId+"Arrow");
		if(obj.css("display")!='none'){
			obj.css("display", "none");
			objArrow.removeClass("rotateTop");
			objArrow.addClass("rotate");
		}else{
			obj.css("display", "block");
			objArrow.removeClass("rotate");
			objArrow.addClass("rotateTop");
		}
	}
	
	$(function(){ 
		 $.post("<%=basePath%>rest/wx/share/sign",
					{"url":window.location.href},
					function(data){
						//data=eval("("+data+")");
						wx.config({
						          debug: false,
						          appId: data.appId,
						          timestamp:data.timestamp,
						          nonceStr:data.nonceStr,
						          signature:data.signature,
						          jsApiList: [
						          'checkJsApi',
						          'onMenuShareTimeline',
						          'onMenuShareAppMessage',
						          'onMenuShareQQ'
						          ]
						});
						
						wx.ready(function(){
							  var sdata = {
								  title: '${simucp.name}', 
								  desc: '---',
								  link: '<%=basePath%>rest/wx/simu/detail?id=${xtcp.xtcpId}',
								  imgUrl: '<%=basePath%>assets/img/fx_logo.jpg',
								  success: function () {
								  	
								  },
								  cancel: function () {
								  	
								  }
							  };
							  wx.onMenuShareAppMessage(sdata);
							  wx.onMenuShareTimeline(sdata);
							  wx.onMenuShareQQ(sdata);
						});
			});
		
	});
	
	
	var chartObj = {
		renderTo: 'chartContainer',
		width: document.body.clientWidth-20,
		height: 220,
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
    
    function showPanel(panelId){
		var obj = $("#"+panelId);
		var objArrow = $("#"+panelId+"Arrow");
		if(obj.css("display")!='none'){
			obj.css("display", "none");
			objArrow.removeClass("rotateTop");
			objArrow.addClass("rotate");
		}else{
			obj.css("display", "block");
			objArrow.removeClass("rotate");
			objArrow.addClass("rotateTop");
		}
	}
	
</script>

</html>
