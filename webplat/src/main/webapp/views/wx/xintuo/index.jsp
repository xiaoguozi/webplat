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
    <meta name="description" content="淘金山信托频道为您提供信托产品，帮助您选出收益率最高的信托产品，并完成购买信托产品"/>
    <title>淘金山</title>
    <div id='wx_pic' style='margin:0 auto;display:none;'>
      <img src='assets/img/fx_logo.jpg' />
    </div>   
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="container">
        <div class="row banner">
            <img src="assets/img/wx/xintuowxbanner.jpg" alt="" class="img-responsive center-block">
            <button type="button" class="close" aria-label="Close">&times;</button>
        </div>
        <div class="row bg">
            <div class="col-xs-12">
                <h3>
               		 ${username},欢迎回来!                
                </h3>
                <h5>淘金山用户累计收益已超10亿元</h5>
            </div>
            <div class="col-xs-12"> 
                <c:if test="${username=='你好'}">              
                <a href="rest/web/mlogin" class="btn btn_default" >登录</a>
                <a href="rest/web/passport/mreg" class="btn btn_default">注册</a>
                </c:if>                           
            </div>
        </div>
        <div class="row border_bottom">
         
			<div class="col-xs-12">
				<a href="rest/wx/xintuo/detail?id=${xtcp.xtcpId}">   
				 	<h3>${xtcp.xtcpSplname}</h3>
			    </a>
			</div>				

            <div class="hot"><img src="assets/img/wx/hot.png" alt="" class="img-responsive center-block"></div>
            <div class="col-xs-6 line">
                <a href="rest/wx/xintuo/detail?id=${xtcp.xtcpId}">                    
                    <h2><fmt:formatNumber value="${xtcp.xtcpNsyl}" pattern="#0.####"/>%</h2>
                    <p>${xtcp.xtcpCxq}个月</p>
                </a>
            </div>
            <div class="col-xs-6">
                <a href="rest/wx/xintuo/detail?id=${xtcp.xtcpId}">                 
                    <h2><fmt:formatNumber value="${xtcp.xtcpZdrgje}" pattern="#0.####"/><span style="font-size:14px">万起</span></h2>
                    <p>${xtcp.xtcpHd}</p>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <a href="rest/wx/xintuo/list" class="btn btn-block btn_orange">了解更多</a>
            </div>
            <div class="col-xs-12">
                <a href="#" class="btn btn-block btn_gray">更多产品请访问PC版</a>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <ul class="list-unstyled">
                    <li class=" active">
                        <a href="rest/wx/xintuo/index">
                            <span class="menu-home"></span>
                            <p>首页</p>
                        </a>
                    </li>
                    <li class="">
                        <a href="rest/wx/moreProducts">
                            <span class="menu-shopping"></span>
                            <p>我要理财</p>
                        </a>
                    </li>
                    <li class="">
                        <a>
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
