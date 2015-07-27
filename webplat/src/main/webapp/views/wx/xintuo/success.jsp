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
            <div class="col-xs-12" style="background: #F8FFEB;text-align:center;">
            	<span style="color: #000;">预约成功，跳转中......</span>
            	<span id="span_time" style="font-size: 24px;color: ">6</span>
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
                    <li class="rest/wx/center/index">
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
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script>
var timer = 7;
function tick(){
	 if(timer == 1){
		window.location.href = '<%=basePath%>rest/wx/xintuo/list';
	 }else{
		  timer--;
		  $('#span_time').html(timer);
		  setTimeout("tick()",1000);
	 }
}

$(function(){
	tick();
});
</script>
</html>
