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

<body>
    <div class="container">
        <div class="row">
            <a href="rest/wx/xintuo/xintuoInfo" class="btn btn-block btn_blue">点击查看信托介绍<span class="pull-right icon-a"></span></a>
        </div>
        <div class="row">
           <c:forEach items="${lstProductVos}" var="xintuocp">
	            <div class="jr_list">
	                <div class="col-xs-12">
	                    <h3>${xintuocp.xtcpSplname}</h3>
	                </div>
	                <div class="col-xs-12">               
	                    <div class="row m_title">
	                        <div class="col-xs-7">
	                            <h5>  <a href="peizi.html"> 预期年收益率</a></h5></div>
	                        <div class="col-xs-5">
	                            <h5><a href="peizi.html">存续期<span class="pull-right icon-a"></span></a> </h5>
	                        </div>
	                    </div>
	                    <div class="row m_money">
	                        <div class="col-xs-7">
	                            <h4><a href="peizi.html"><fmt:formatNumber value="${xintuocp.xtcpNsyl}" pattern="#0.####"/>%</a></h4></div>
	                        <div class="col-xs-5">
	                            <h4 class="m_day"><a href="peizi.html">${xintuocp.xtcpCxq}个月</a></h4>
	                        </div>
	                    </div>
	                    <div class="row m_tip">
	                        <div class="col-xs-7">
	                            <h5><a href="peizi.html"><fmt:formatNumber value="${xintuocp.xtcpZdrgje}" pattern="#0.####"/>万起</a></h5></div>
	                        <div class="col-xs-5">
	                            <h5><a href="peizi.html">	                            
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
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <ul class="list-unstyled">
                    <li class="">
                        <a href="index.html">
                            <span class="menu-home"></span>
                            <p>首页</p>
                        </a>
                    </li>
                    <li class=" active">
                        <a href="list.html">
                            <span class="menu-shopping"></span>
                            <p>我要理财</p>
                        </a>
                    </li>
                    <li class="">
                        <a href="index1.html">
                            <span class="menu-person"></span>
                            <p>个人中心</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>

</html>
