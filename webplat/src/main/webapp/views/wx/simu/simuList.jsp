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
    <title>淘金山</title>
    <div id='wx_pic' style='margin:0 auto;display:none;'>
       <img src='assets/img/fx_logo.jpg' />
    </div>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/list.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="container" id="bar_list">
    	<div class="row" style="background: #007AFF;  position: fixed;  top: 0;  width: 100%;  z-index: 1000;">
        	<div class="col-xs-2" >
        		<a href="rest/wx/simu/simuInfo" style="margin-top: 3px; " class="btn btn-block btn_blue">&nbsp;</a>
        	</div>
        	<div class="col-xs-8" >
        		<a href="rest/wx/simu/simuInfo" style="margin-top: 3px;" class="btn btn-block btn_blue">点击查看私募介绍</a>
        	</div>
        	<div class="col-xs-2" >
        		<a href="rest/wx/simu/simuInfo" style="margin-top: 3px;" class="btn btn-block btn_blue">&nbsp;<span class="pull-right icon-a" style="margin-top: 3px;"></span></a>
        	</div>
        </div>
    
        <div class="row" id="bar_list_div" style="margin-top: 28px">
       	  <div id="bar_list_ul">
	           <c:forEach items="${lstProductVO}" var="simucp">
		            <div class="jr_list"  onclick="goSimuDetail('${simucp.id}')">
		                <div class="col-xs-12">
		                    <h3><font style="color: #5C9BD1;">${simucp.name}</font></h3>
		                </div>
		                <div class="col-xs-12">               
		                    <div class="row m_title">
		                        <div class="col-xs-7">
		                            <h5>今年收益</h5></div>
		                        <div class="col-xs-5">
		                            <h5>最新净值<span class="pull-right icon-a"></span></h5>
		                        </div>
		                    </div>
		                    <div class="row m_money">
		                        <div class="col-xs-7">
		                        	<c:if test="${simucp.nowRate>0}">
			                            <h4><font style="color: #f60;"><fmt:formatNumber value="${simucp.nowRate}" pattern="#0.####"/>%</font></h4>
		                        	</c:if>
		                        	<c:if test="${simucp.nowRate<=0}">
										<h4><font style="color: #090;"><fmt:formatNumber value="${simucp.nowRate}" pattern="#0.####"/>%</font></h4>
		                        	</c:if>
		                        </div>
		                        <div class="col-xs-5">
		                            <h4 class="m_day">${simucp.netWorth}</h4>
		                        </div>
		                    </div>
		                    <div class="row m_tip">
		                        <div class="col-xs-6">
		                            <h5><fmt:formatNumber value="${simucp.subscripStart}" pattern="#0.####"/>万起</h5></div>
		                        <div class="col-xs-6">
		                            <h5>                           
		                           		基金经理：${simucp.managerName}	                            
		                            </h5>
		                        </div>
		                    </div>
		                </div>
		            </div>
	         </c:forEach> 
         </div>  
         <c:if test="${peSearchCtrlVO.pageNo<peSearchCtrlVO.totalPageSize}" >
          <div class="up_down"><div id="up_arrow" class="up_down_arrow"></div><div id="up_text" class="up_down_text">上拉加载更多</div></div> 
         </c:if>
         <input type="hidden"  name="pageNo" value="${peSearchCtrlVO.pageNo}">
         <input type="hidden"  name="totalPageSize" value="${peSearchCtrlVO.totalPageSize}">
        </div>
    </div>
</body>

<script src="assets/scripts/wx/ai.js" type="text/javascript"></script> 
<script src="assets/scripts/wx/slip.js" type="text/javascript"></script> 
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script src="assets/scripts/wx/jweixin-1.0.0.js" ></script>

<SCRIPT type=text/javascript>
	window.addEventListener('load', function(){		
		ai.hideUrl();	
		var bar_list_div = ai.i("bar_list_div"),
			bar_list     = ai.i("bar_list"),
			minus        = ai.ovb.ios() && ai.ovb.safari() && !ai.ovb.ipad() ? -20 : 40,
			up_arrow	 = ai.i("up_arrow"),
			up_text      = ai.i("up_text"),
			bar_list_ul  = ai.i("bar_list_ul");
			up_ing       = false,
		  down_ing       = false,
		     loadb       = false;
	
		bar_list.style.height =  ai.wh() - minus +"px";	
		function update() {
			if(this.xy < -(this.coreWidth_cut_width + 20) && up_ing == false){
				up_ing = true;
				down_ing = false;
				up_arrow.style['webkitTransitionDuration'] = '300ms';	
				up_arrow.style['webkitTransform'] = 'rotate(0deg)';
				up_text.innerHTML = "松开加载更多";
				loadb = true;				
			}else if(this.xy > -(this.coreWidth_cut_width + 20) && down_ing == false){
				down_ing = true;
				up_ing = false;
				up_arrow.style['webkitTransitionDuration'] = '300ms';	
				up_arrow.style['webkitTransform'] = 'rotate(-180deg)';
				up_text.innerHTML = "上拉加载更多";
				loadb = false;
			}
		}
	
		function loading() {
			var pageNO =parseInt($('input[name=pageNo]').val());
			var totalPageSize = parseInt($('input[name=totalPageSize]').val());
			if(pageNO>=totalPageSize){
				$('#up_text').text("数据加载完成");
				return ;
			}
			
			
			if(loadb){
				loadb    = false;
				var that = this;
				up_text.innerHTML= 'Loading...';
				up_arrow.style['webkitTransitionDuration'] = '0ms';	
				up_arrow.className += ' loading';				
				setTimeout(function () {										
					 $.post("rest/wx/simu/listMore", 
				             {
						     pageNo:(pageNO+1)        	
				             },
				             function(data){
				            	 var strhtml=""
				            	 for(i=0;i<data.bizData.length;i++){				            		 
				            		 strhtml += addRecode(data.bizData[i]);
				            	 }
				            	 bar_list_ul.innerHTML += strhtml;				            	 
				            	 up_arrow.style['webkitTransform'] = 'rotate(-180deg)';
								 up_arrow.className = 'up_down_arrow';
								 that.up_range = 0;
								 that.refresh();
								 $('input[name=pageNo]').val(pageNO+1);
								 if((pageNO+1)==totalPageSize){
									 $('#up_arrow').removeClass("up_down_arrow");
									 $('#up_text').text("");
								 }								 
					         });										
				}, 1000);
	
			}
	
		}
		
		
	function addRecode(simucp){
		var strhtml ="<div class=\"jr_list\"  onclick=\"goSimuDetail('"+simucp.id+"')\">";
		    strhtml+="<div class=\"col-xs-12\">";
		    strhtml+="<h3><font style='color: #5C9BD1;'>"+simucp.name+"</font></h3>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"col-xs-12\"> ";              
		    strhtml+="<div class=\"row m_title\">";
		    strhtml+="<div class=\"col-xs-7\">";
		    strhtml+="    <h5>今年收益</h5></div>";
		    strhtml+="<div class=\"col-xs-5\">";
		    strhtml+="    <h5>最新净值<span class=\"pull-right icon-a\"></span></h5>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"row m_money\">";
		    strhtml+="<div class=\"col-xs-7\">";
		    strhtml+="     <h4>"+simucp.nowRate+"%</h4></div>";
		    strhtml+="<div class=\"col-xs-5\">";
		    strhtml+="<h4 class=\"m_day\">"+simucp.netWorth+"</h4>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"row m_tip\">";
		    strhtml+="<div class=\"col-xs-6\">";
		    strhtml+="<h5>"+simucp.subscripStart+"万起</h5></div>";
		    strhtml+="<div class=\"col-xs-6\">";
		    strhtml+="<h5>";          
		    strhtml+="基金经理："+simucp.managerName;
		    strhtml+="</h5>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		  return strhtml;
		
	}
		var slipjs_yuxiang = slip('px', bar_list_div, {
				 moveFun: update,
				 endFun: loading
			});
	});
	
	function goSimuDetail(id){
		window.location.href = '<%=basePath%>rest/wx/simu/detail?peProductId='+id;
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
								  title: '跟我淘金山',
								  desc: '淘金山私募频道为您提供私募产品，帮助您选出收益率最高的私募产品，并完成购买私募产品',
								  link: '<%=basePath%>rest/wx/simu/list',
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

</SCRIPT>
</html>
