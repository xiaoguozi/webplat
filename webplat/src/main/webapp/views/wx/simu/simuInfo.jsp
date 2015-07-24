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
                <h3><b>私募介绍</b></h3>
                <p>私募股权投资（Private Equity，简称PE），是指投资于非上市股权，或者上市公司非公开交易
                股权的一种投资方式 。 从投资方式角度看，私募股权投资是指通过私募形式对私有企业，即非上市企业进行的权益性投资，
                在交易实施过程中附带考虑了将来的退出机制，即通过上市、并购或管理层回购等方式，出售持股获利。</p>             
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding-bottom:20px">
                    <a href="rest/wx/simu/list" class="btn btn_orange btn-block">我知道了</a>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
</html>
