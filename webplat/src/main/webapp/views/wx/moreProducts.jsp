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
		<div class="row" style="border-bottom:2px solid #E0E0E0;">
			<div class="col-xs-1" style="padding-top:20px; padding-left:40px;"><img src="assets/img/wx/xintuo.png" /></div>
			<div class="col-xs-10">
				<div class="col-xs-8" style="padding-top:15px;"><p style="font-size:20px; color:#000;"><b>信托<b></p></div>
				<div class="col-xs-8"><p style="color:#ccc;">低风险，30倍银行活期存款利息</p></div>
			</div>
			<div class="col-xs-1" style="padding-top:30px;"><img src="assets/img/wx/jiantou.png" /></div>	
		</div>
		<div class="row" style="border-bottom:2px solid #E0E0E0;">
			<div class="col-xs-1" style="padding-top:20px; padding-left:40px;"><img src="assets/img/wx/simu.png" /></div>
			<div class="col-xs-10">
				<div class="col-xs-8" style="padding-top:15px;"><p style="font-size:20px; color:#000;"><b>私募<b></p></div>
				<div class="col-xs-8"><p style="color:#ccc;">高风险，追求超高收益</p></div>
			</div>
			<div class="col-xs-1" style="padding-top:30px;"><img src="assets/img/wx/jiantou.png" /></div>	
		</div>
		
	</div>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
</html>
