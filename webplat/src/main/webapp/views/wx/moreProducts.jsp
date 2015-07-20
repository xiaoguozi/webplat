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
		<div class="row" style="background:#F8F8F8;">
			<p class="text-center" style="width: 100%; font-weight: bold; font-size:20px; color: #308AFF;  margin-top:15px; margin-bottom:15px; ">全部产品</p>
		</div>
		<div class="row" style="border-bottom:1px solid #E0E0E0; border-top:1px solid #E0E0E0;">
		 <a href="rest/wx/xintuo/list">
			<div class="col-xs-2" style="padding-top: 15px;"><img src="assets/img/wx/xintuo.png" /></div>
			<div class="col-xs-8">
					<p style="font-size:20px; color:#000; margin-top: 12px;"><b>信托<b></p>
					<p style="color:#ccc; font-size: 13px;">低风险，30倍银行活期存款利息</p>			  
			</div>
			<div class="col-xs-2" style="padding-top: 25px;">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		 </a>
		</div>
		<div class="row" style="border-bottom:1px solid #E0E0E0;">
			<div class="col-xs-2" style="padding-top: 15px;"><img src="assets/img/wx/simu.png" /></div>
			<div class="col-xs-8">
				<p style="font-size:20px; color:#000; margin-top: 12px;"><b>私募<b></p>
				<p style="color:#ccc;font-size: 13px;">高风险，追求超高收益</p>
			</div>
			<div class="col-xs-2" style="padding-top: 25px;">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
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
                    <li class="active">
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
