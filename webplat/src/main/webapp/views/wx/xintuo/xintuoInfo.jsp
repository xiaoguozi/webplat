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
    <div id='wx_pic' style='margin:0 auto;display:none;'>
       <img src='assets/img/fx_logo.jpg' />
    </div>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
</head>

<body class="bg_gray">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3><b>信托介绍</b></h3>
                <p>&nbsp;&nbsp;信托就是信用委托，信托业务是一种以信用为基础的法律行为，一般涉及到三方面当事人，即投入信用的委托人，受信于人的受托人，
                	以及受益于人的受益人。信托业务是由委托人依照契约或遗嘱的规定，为自己或第三者（即受益人）的利益，将财产上的权利转给受托人
                	（自然人或法人），受托人按规定条件和范围，占有、管理、使用信托财产，并处理其收益。</p>             
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding-bottom:20px">
                    <a href="javascript:history.back()" class="btn btn_orange btn-block">我知道了</a>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
</html>
