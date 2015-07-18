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
</head>

<body class="bg_gray">
    <div class="container">
        <div class="row">
            <a href="javascript:history.go(-1);" class="btn btn-block btn-lg back_btn">${xtcp.xtcpSplname}<span class="icon-back pull-left"></span></a>
        </div>              
        <div class="pei_money row">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>信托公司:</h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>${xtcp.xtcpGszhname}</h4></span>
                </div>
            </div>
            <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4>预计发行规模:</h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><fmt:formatNumber value="${xtcp.xtcpFxgm}" pattern="#0.####"/>万</h4></span>
                </div>
            </div>
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>预期年收益率：</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>${xtcp.xtcpNsyl}%</h4></span>
                </div>
            </div>
            <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4>付息方式:</h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>
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
			           </c:choose>                   
                    </h4></span>
                </div>
            </div>
        	<div class="b_b">
                <div class="col-xs-6">
                    <h4>存续期：</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>${xtcp.xtcpCxq}个月</h4></span>
                </div>
           </div>
           
           <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4>投资方式:</h4>
                </div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>
                    	<c:choose>  
			                <c:when test="${xtcp.xtcpTzfs=='10'}">  
			                  		信托贷款
			                </c:when>
			                 <c:when test="${xtcp.xtcpTzfs=='20'}">  
			                  		  股权投资
			                </c:when>
			                 <c:when test="${xtcp.xtcpTzfs=='30'}">  
			                  		  权益投资  
			                </c:when> 
			                 <c:when test="${xtcp.xtcpTzfs=='40'}">  
			                  		组合运用 
			                </c:when> 
			                 <c:when test="${xtcp.xtcpTzfs=='50'}">  
			                  		 债券投资
			                </c:when>
			                 <c:when test="${xtcp.xtcpTzfs=='60'}">  
			                  		 其他投资 
			                </c:when>       
			                <c:otherwise>  
			                     	其他
			                </c:otherwise>  
			            </c:choose>                                       
                    </h4></span>
                </div>
           </div>
        
          <div class="b_b">
                <div class="col-xs-6">
                    <h4>最低认购金额：</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4><fmt:formatNumber value="${xtcp.xtcpZdrgje}" pattern="#0.####"/>万</h4></span>
                </div>
         </div>
         <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4>投资领域：</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>
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
			            </c:choose>
                    </h4></span>
                </div>
         </div>
         
         
          <div class="b_b">
                <div class="col-xs-6">
                    <h4>抵押率:</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>${xtcp.xtcpDyl}</h4></span>
                </div>
         </div>
         
         <div class="b_b" style="background-color: #f8f8f8">
                <div class="col-xs-6">
                    <h4>抵押物:</h4></div>
                <div class="col-xs-6">
                    <span class="money_select"><h4>${xtcp.xtcpDyw}</h4></span>
                </div>
         </div>
         </div>
         
         
         
        <div class="row pei_money" style="border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>收益说明</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpSysm">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpSysm" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       
       
       <div id="xtcpSysm" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
             ${xtcp.xtcpSysm}
       </div>
       
     
       
       
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>募集进度/账号</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpMjzh">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpMjzh" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpMjzh" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
            <c:choose>  
		       <c:when test="${xtcp.xtcpStatus=='20'}">  
		                      募集中<br/>
		       </c:when>    
		       <c:otherwise>  
		                    募集完毕<br/>
		       </c:otherwise>  
		     </c:choose>          
		     ${xtcp.xtcpMjzh}
       </div>
       
       
        <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>融资方是谁？</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpRzf">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpRzf" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpRzf" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
           ${xtcp.xtcpRzf}
       </div>
       
       
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>资金用途是什么？</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpZjyt">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpZjyt" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpZjyt" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
           ${xtcp.xtcpZjyt}
       </div>
       
       
       <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>风控措施如何？</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpFkcs">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpFkcs" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpFkcs" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
           ${xtcp.xtcpFkcs}
       </div>
              
         <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>还款来源有哪些？</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpHkly">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpHkly" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpHkly" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
           ${xtcp.xtcpHkly}
       </div>
       
        <div class="row pei_money" style="margin-top:10px;border-bottom: 0px">
            <div class="b_b">
                <div class="col-xs-6">
                    <h4>管理机构是谁？</h4></div>
                <div class="col-xs-6" role="tab" id="pz_xtcpZcglr">
                    <div class="row collapsed" data-toggle="collapse" href="#xtcpZcglr" aria-expanded="true" aria-controls="info">
                        <div class="col-xs-12">
                            <div class="rotate pull-right">
                                <h4><span class="icon-a"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <div id="xtcpZcglr" class="panel-collapse collapse row" role="tabpanel" aria-expanded="false" style="background: #fff;padding-left: 15px">
           ${xtcp.xtcpZcglr}
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

</html>
