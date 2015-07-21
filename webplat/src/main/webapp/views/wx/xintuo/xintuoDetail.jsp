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
    <title>${xtcp.xtcpSplname}</title>
     <div id='wx_pic' style='margin:0 auto;display:none;'>
       <img src='assets/img/fx_logo.jpg' />
    </div>   
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
    </style>
</head>

<body class="bg_gray">
    <div class="container">
        <div class="row" style="display: none;">
            <a href="javascript:void(0);" class="btn btn-block btn-lg back_btn" style="cursor: default;"><font style="font-family: 黑体;color:#080808; font-size: 20px;">${xtcp.xtcpSplname}</font></a>
        </div>              
        <div class="pei_money row" >
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">信托公司:</font></h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">${xtcp.xtcpGszhname}</font></h4></span>
                </div>
            </div>
            <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">预计发行规模:</font></h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;"><fmt:formatNumber value="${xtcp.xtcpFxgm}" pattern="#0.####"/>万</font></h4></span>
                </div>
            </div>
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">预期年收益率：</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">${xtcp.xtcpNsyl}%</font></h4></span>
                </div>
            </div>
            <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">付息方式:</font></h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">
                    	<c:choose>  
			                <c:when test="${xtcp.xtcpLxfp=='10'}">  
			                  		 按月付息
			                </c:when>
			                 <c:when test="${xtcp.xtcpLxfp=='20'}">  
			                  		  按季付息
			                </c:when>
			                 <c:when test="${xtcp.xtcpLxfp=='30'}">  
			                  		  半年付息 
			                </c:when> 
			                 <c:when test="${xtcp.xtcpLxfp=='40'}">  
			                  		 按年付息
			                </c:when> 
			                 <c:when test="${xtcp.xtcpLxfp=='50'}">  
			                  		 到期付息
			                </c:when>     
			                <c:otherwise>  
			                     	其他
			                </c:otherwise>  
			           </c:choose>      </font>             
                    </h4></span>
                </div>
            </div>
        	<div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">存续期：</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">${xtcp.xtcpCxq}个月</font></h4></span>
                </div>
           </div>
           
          <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">最低认购金额：</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;"><fmt:formatNumber value="${xtcp.xtcpZdrgje}" pattern="#0.####"/>万</font></h4></span>
                </div>
         </div>
         <div class="b_b" >
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">投资领域：</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">
                    	<c:choose>  
			                <c:when test="${xtcp.xtcpTzly=='10'}">  
			                  		房地产
			                </c:when>
			                 <c:when test="${xtcp.xtcpTzly=='20'}">  
			                  		  金融
			                </c:when>
			                 <c:when test="${xtcp.xtcpTzly=='30'}">  
			                  		基础设施  
			                </c:when> 
			                 <c:when test="${xtcp.xtcpTzly=='40'}">  
			                  		工商企业
			                </c:when> 
			                 <c:when test="${xtcp.xtcpTzly=='50'}">  
			                  		其他
			                </c:when>                 
			                <c:otherwise>  
			                     	其他
			                </c:otherwise>  
			            </c:choose></font>
                    </h4></span>
                </div>
         </div>
         
         
          <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">抵押率:</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">${xtcp.xtcpDyl}</font></h4></span>
                </div>
         </div>
         
         <div class="b_b" >
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">抵押物:</font></h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><font style="color:#080808;">${xtcp.xtcpDyw}</font></h4></span>
                </div>
         </div>
         
                      
         </div>
         
         
         
        <div class="row pei_money" style="border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpSysm');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">收益说明</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpSysm">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpSysmArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       
       <div id="xtcpSysm" class="panel-collapse collapse row" role="tabpanel"  style="background: #fff;padding-left: 15px">
             <font style="color:#080808;">${xtcp.xtcpSysm}</font>
       </div>
       
     
       
       
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpMjzh');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">募集进度/账号</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpMjzh">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpMjzhArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpMjzh" class="panel-collapse collapse row"  style="background: #fff;padding-left: 15px">
            <font style="color:#080808;"><c:choose>  
		       <c:when test="${xtcp.xtcpStatus=='20'}">  
		                      募集中<br/>
		       </c:when>    
		       <c:otherwise>  
		                    募集完毕<br/>
		       </c:otherwise>  
		     </c:choose>          
		     ${xtcp.xtcpMjzh}</font>
       </div>
       
       
        <div class="row pei_money" style="margin-top:10px;border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpRzf');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">融资方是谁？</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpRzf">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpRzfArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpRzf" class="panel-collapse collapse row"  style="background: #fff;padding-left: 15px">
           <font style="color:#080808;">${xtcp.xtcpRzf}</font>
       </div>
       
       
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpZjyt');">
            <div class="b_b">
                <div class="col-xs-8">
                    <h4><font style="color:#545454;">资金用途是什么？</font></h4></div>
                <div class="col-xs-4" role="tab" id="pz_xtcpZjyt">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpZjytArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       
       
       <div id="xtcpZjyt" class="panel-collapse collapse row"  style="background: #fff;padding-left: 15px">
           <font style="color:#080808;"> ${xtcp.xtcpZjyt}</font>
       </div>
       
              
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px;cursor: pointer;" onclick="showPanel('xtcpFkcs');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">风控措施如何？</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpFkcs">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpFkcsArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpFkcs" class="panel-collapse collapse row"  style="background: #fff;padding-left: 15px">
           <font style="color:#080808;">${xtcp.xtcpFkcs}</font>
       </div>
              
         <div class="row pei_money" style="margin-top:10px;border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpHkly');">
            <div class="b_b">
                <div class="col-xs-8">
                    <h4><font style="color:#545454;">还款来源有哪些？</font></h4></div>
                <div class="col-xs-4" role="tab" id="pz_xtcpHkly">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpHklyArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpHkly" class="panel-collapse collapse row" style="background: #fff;padding-left: 15px">
           <font style="color:#080808;">${xtcp.xtcpHkly}</font>
       </div>
       
        <div class="row pei_money" style="margin-top:10px;border-bottom: 0px; cursor: pointer;" onclick="showPanel('xtcpZcglr');">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4><font style="color:#545454;">管理机构是谁？</font></h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpZcglr">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="xtcpZcglrArrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpZcglr" class="panel-collapse collapse row"  style="background: #fff;padding-left: 15px">
           <font style="color:#080808;">${xtcp.xtcpZcglr}</font>
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
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
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
	
</script>

</html>
