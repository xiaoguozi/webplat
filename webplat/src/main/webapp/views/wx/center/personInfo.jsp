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
    <title>淘金山-基本资料</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/center.css" rel="stylesheet" type="text/css" />
    
</head>

<body class="bg_gray">
    <div class="container">		
		 <div class="row" >
            <a class="btn btn-block btn-lg back_btn" style="cursor: default;width: 100%;"><font style="font-family: 黑体;color:#080808; font-size: 20px;">基本资料</font></a>
         </div>
		
		
		
		<div class="row pei_money" style="margin-top:10px">
		 <a href="rest/wx/xintuo/list">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/${(userInfo.isValidate==1)?'dui.png':'cuo.png'}"/></p></div>
			<div class="col-xs-8" style="padding-top:10px;margin-left:-20px">
					<p style="font-size:20px; color:#3f3f3f;"><b>实名认证</b></p>							  
			</div>
			<div class="col-xs-1" style="padding-top: 10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		 </a>
		</div>
		
		<div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/dui.png" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>登陆密码</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>				
	  
	  
	  <div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/dui.png" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>手机认证</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>				
	  
	  
	  <div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/${(empty userInfo.email||empty userInfo.qqNo )?'cuo.png':'dui.png'}" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>邮箱QQ</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
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
