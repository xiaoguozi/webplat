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
    <title>预约记录</title>
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
      
       <c:if test="${null!=lstProduct&&!lstProduct.isEmpty()}">
      	<c:forEach items="${lstProduct}" var="simucp">
        <div class="row pei_money" style="cursor: pointer; margin-top: 15px;border-bottom: 1px solid #DDDDDD; " onclick="showPanel(this,'${simucp.orderId}');">
            <div class="b_b" style="border:0px">
                <div class="col-xs-10">
                    <h4><font style="color:#545454;">${simucp.simpleName}</font></h4></div>
                <div class="col-xs-2" role="tab" id="pz_${simucp.orderId}">
                    <div class="row collapsed" >
                        <div class="col-xs-12">
                            <div class="rotate pull-right" id="${simucp.orderId}Arrow">
                                <h4><span class="icon-a" style="color: #bbb;"></span>  </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="b_b" style="border:0px;" >
                <div style="margin-left:16px;color:#d4d4d4" >
                 	<fmt:formatDate value="${simucp.orderCreateDate}" pattern="yyyy-MM-dd HH:mm"/>
                </div>
            </div>
       </div>               
       <div id="${simucp.orderId}" class="panel-collapse collapse row" role="tabpanel"  style="padding-top:10px;background: #fff;padding-left:10px">
	            <table class="table" style="width:97%">				
				   <tbody>
				      <tr>
				         <td style="border:1px solid #ddd;width:25%">产品名称</td>
				         <td style="border:1px solid #ddd;width:80%">${simucp.name}</td>
				      </tr>	
				      <tr>
				         <td style="border:1px solid #ddd;width:25%">公 &nbsp; &nbsp; &nbsp; &nbsp;司</td>
				         <td style="border:1px solid #ddd;width:80%">${simucp.pecompanyName}</td>
				      </tr>
				       <tr>
				         <td style="border:1px solid #ddd;width:25%">基金经理</td>
				         <td style="border:1px solid #ddd;width:80%">${simucp.managerName}</td>
				      </tr>
				       <tr>
				         <td style="border:1px solid #ddd;width:25%">基金类型</td>
				         <td style="border:1px solid #ddd;width:80%">
								<c:if test="${simucp.fundType==1}">股票</c:if>
								<c:if test="${simucp.fundType==2}">期货基金</c:if>
								<c:if test="${simucp.fundType==3}">股票量化</c:if>
								<c:if test="${simucp.fundType==4}">债券型</c:if>
								<c:if test="${simucp.fundType==5}">定向增发</c:if>
								<c:if test="${simucp.fundType==6}">宏观对冲</c:if>
								<c:if test="${simucp.fundType==7}">组合基金</c:if>
								<c:if test="${simucp.fundType==8}">其他</c:if>
						</td>
				      </tr>
				      <tr>
				         <td style="border:1px solid #ddd;width:25%">最新净值</td>
				         <td style="border:1px solid #ddd;width:80%">
						         ${simucp.netWorth }
					     </td>
				      </tr>
				      <tr>
				         <td style="border:1px solid #ddd;width:25%">累计收益</td>
				         <td style="border:1px solid #ddd;width:80%">
						        <c:if test="${simucp.accumulatedIncome>0}">
		                  			<span style="color:#f60;">${simucp.accumulatedIncome}%</span>
		                  		</c:if>
		                  		<c:if test="${simucp.accumulatedIncome<0}">
		                  			<span style="color: #090;">${simucp.accumulatedIncome}%</span>
		                  		</c:if>
					     </td>
				      </tr>
				      <tr>
				         <td style="border:1px solid #ddd;width:25%">今年收益</td>
				         <td style="border:1px solid #ddd;width:80%">
						        <c:if test="${simucp.nowRate>0}">
		                  			<span style="color:#f60;">${simucp.nowRate}%</span>
		                  		</c:if>
		                  		<c:if test="${simucp.nowRate<0}">
		                  			<span style="color: #090;">${simucp.nowRate}%</span>
		                  		</c:if>
					     </td>
				      </tr>
				     
					   </tbody>
				</table>
       </div>
      </c:forEach> 
	  </c:if>
	  
	  <c:if test="${null==lstProduct||lstProduct.isEmpty()}">
	  <div class="row" >
	  	<div class="b_b" style="margin-top:30px">
              <div class="col-xs-12" style="text-align:center">
                     <span><img src="assets/img/wx/tanhao.png"/></span>
              </div>
              
              <div class="col-xs-12" style="text-align:center">
                    <h3 style="color:#3f3f3f">当前没有私募预约记录</h3>
              </div> 
              
              <div class="col-xs-12" style="margin-top:30px">
                <a href="rest/wx/simu/list" class="btn btn-block btn_orange">先逛一逛</a>
            </div>           
         </div>
	  </div>	 	  
	  </c:if>
                              
    
</body>
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script type="text/javascript">

function showPanel(obj,panelId){
	var _this = $(obj);
	var obj = $("#"+panelId);
	var objArrow = $("#"+panelId+"Arrow");
	if(obj.css("display")!='none'){
		obj.css("display", "none");
		objArrow.removeClass("rotateTop");
		objArrow.addClass("rotate");
		_this.css("border-bottom","1px solid #DDDDDD");
	}else{
		obj.css("display", "block");
		objArrow.removeClass("rotate");
		objArrow.addClass("rotateTop");
		_this.css("border-bottom","0px");
	}
}
			
</script>

</html>
