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
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/list.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="container" id="bar_list">
        <div style="left: 0;  position: fixed;  top: 0;  width: 100%;  z-index: 1000;">
            <a href="rest/wx/xintuo/xintuoInfo" class="btn btn-block btn_blue">点击查看信托介绍<span class="pull-right icon-a"></span></a>
        </div>
        
        <div class="row" id="bar_list_div" style="margin-top: 20px">
       	  <div id="bar_list_ul">
	           <c:forEach items="${lstProductVos}" var="xintuocp">
		            <div class="jr_list">
		                <div class="col-xs-12">
		                    <h3><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}">${xintuocp.xtcpSplname}</a></h3>
		                </div>
		                <div class="col-xs-12">               
		                    <div class="row m_title">
		                        <div class="col-xs-7">
		                            <h5>  <a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}"> 预期年收益率</a></h5></div>
		                        <div class="col-xs-5">
		                            <h5><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}">存续期<span class="pull-right icon-a"></span></a> </h5>
		                        </div>
		                    </div>
		                    <div class="row m_money">
		                        <div class="col-xs-7">
		                            <h4><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}"><fmt:formatNumber value="${xintuocp.xtcpNsyl}" pattern="#0.####"/>%</a></h4></div>
		                        <div class="col-xs-5">
		                            <h4 class="m_day"><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}">${xintuocp.xtcpCxq}个月</a></h4>
		                        </div>
		                    </div>
		                    <div class="row m_tip">
		                        <div class="col-xs-7">
		                            <h5><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}"><fmt:formatNumber value="${xintuocp.xtcpZdrgje}" pattern="#0.####"/>万起</a></h5></div>
		                        <div class="col-xs-5">
		                            <h5><a href="rest/wx/xintuo/detail?id=${xintuocp.xtcpId}">	                            
		                           		<c:choose>  
							                <c:when test="${xintuocp.xtcpLxfp=='10'}">  
							                  		按月付息
							                </c:when>
							                 <c:when test="${xintuocp.xtcpLxfp=='20'}">  
							                  		  按季付息
							                </c:when>
							                 <c:when test="${xintuocp.xtcpLxfp=='30'}">  
							                  		  半年付息 
							                </c:when> 
							                 <c:when test="${xintuocp.xtcpLxfp=='40'}">  
							                  		 按年付息
							                </c:when> 
							                 <c:when test="${xintuocp.xtcpLxfp=='50'}">  
							                  		 到期付息
							                </c:when>     
							                <c:otherwise>  
							                     	其他
							                </c:otherwise>  
							            </c:choose>		                            
		                            </a></h5>
		                        </div>
		                    </div>
		                </div>
		            </div>
	         </c:forEach> 
         </div>  
         <c:if test="${xinTuoSeachCtrlVO.pageNo<xinTuoSeachCtrlVO.totalPageSize}" >
          <div class="up_down"><div id="up_arrow" class="up_down_arrow"></div><div id="up_text" class="up_down_text">上拉加载更多</div></div> 
         </c:if>
         <input type="hidden"  name="pageNo" value="${xinTuoSeachCtrlVO.pageNo}">
         <input type="hidden"  name="totalPageSize" value="${xinTuoSeachCtrlVO.totalPageSize}">
        </div>
    </div>
</body>

<script src="assets/scripts/wx/ai.js" type="text/javascript"></script> 
<script src="assets/scripts/wx/slip.js" type="text/javascript"></script> 
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
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
					 $.post("rest/wx/xintuo/listMore", 
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
		
		
	function addRecode(xintop){
		var strhtml ="<div class=\"jr_list\">";
		    strhtml+="<div class=\"col-xs-12\">";
		    strhtml+="<h3>"+xintop.xtcpSplname+"</h3>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"col-xs-12\"> ";              
		    strhtml+="<div class=\"row m_title\">";
		    strhtml+="<div class=\"col-xs-7\">";
		    strhtml+="    <h5>  <a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\"> 预期年收益率</a></h5></div>";
		    strhtml+="<div class=\"col-xs-5\">";
		    strhtml+="    <h5><a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\">存续期<span class=\"pull-right icon-a\"></span></a> </h5>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"row m_money\">";
		    strhtml+="<div class=\"col-xs-7\">";
		    strhtml+="     <h4><a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\">"+xintop.xtcpNsyl+"%</a></h4></div>";
		    strhtml+="<div class=\"col-xs-5\">";
		    strhtml+="<h4 class=\"m_day\"><a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\">"+xintop.xtcpCxq+"个月</a></h4>";
		    strhtml+="</div>";
		    strhtml+="</div>";
		    strhtml+="<div class=\"row m_tip\">";
		    strhtml+="<div class=\"col-xs-7\">";
		    strhtml+="<h5><a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\">"+xintop.xtcpZdrgje+"万起</a></h5></div>";
		    strhtml+="<div class=\"col-xs-5\">";
		    strhtml+="<h5><a href=\"rest/wx/xintuo/detail?id="+xintop.xtcpId+"\">";                                      
		    strhtml+="</a></h5>";
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

</SCRIPT>
</html>
