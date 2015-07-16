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

<body class="bg_gray">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3><b>信托介绍</b></h3>
                <p>货币型基金是一种开放式基金，投向货币市场，以投资于债券、央行票据、回购等安全性极高的短期金融品种为主，期限最长不能超过397天。 货币基金的收益一般高于银行的定期存款利率，随时可以赎回，T+2确认到账。所以货币基金非常适合追求低风险、高流动性、稳定收益的单位和个人。</p>
                <p>购买货币基金时应坚持“买旧不买新、买高不买低、就短不就长”的原则。</p>
                <p>首先，购买货币基金时应优先考虑老基金，因为经过一段时间的运作，老基金的业绩已经明朗化了，可新发行的货币基金能否取得良好的业绩却需要时间来验证。</p>
                <p>同时，投资者应尽量选择年收益率一直名列前茅的高收益的货币基金类型。但是，也要记得货币基金比较适合打理活期资金、短期资金或一时难以确定用途的临时资金。</p>
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
