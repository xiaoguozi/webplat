<%@ include file="/views/wx/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head >
 	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0">
    <title>淘金山</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/center.css" rel="stylesheet" type="text/css" />
    
</head>

<body class="bg_gray">
    <div class="container">		
			<div class="row centerbg">
	            <div class="col-xs-12">
	                <h3>
	               		 ${username},欢迎回来!                
	                </h3>
	                <h5>淘金山用户累计收益已超10亿元</h5>
	            </div>	            
	      </div>
		
		
		
		<div class="row pei_money" style="margin-top:10px">
		 <a href="rest/wx/center/personInfo">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/baseinfo.png"/></p></div>
			<div class="col-xs-8" style="padding-top: 25px;margin-left:10px">
					<p style="font-size:20px; color:#000;"><b>基本资料</b></p>							  
			</div>
			<div class="col-xs-1" style="padding-top: 25px;">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		 </a>
		</div>
		
		<div class="row pei_money" style="margin-top:10px">
		    <a href="rest/wx/center/xtOrder">
				<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/xintuoyd.png" /></p></div>
				<div class="col-xs-8" style="padding-top: 25px;margin-left:10px">
					<p style="font-size:20px; color:#000; "><b>信托预约记录</b></p>
				</div>
				<div class="col-xs-1" style="padding-top:25px;">
					<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
				</div>
			</a>	
		</div>				
	  </div>
	
	
	
	<footer>
        <div class="container">
            <div class="row">
                <ul class="list-unstyled">
                    <li class="">
                        <a href="rest/wx/xintuo/index">
                            <span class="menu-home"></span>
                            <p>首页</p>
                        </a>
                    </li>
                    <li >
                        <a href="rest/wx/moreProducts">
                            <span class="menu-shopping"></span>
                            <p>我要理财</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="rest/wx/center/index">
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
