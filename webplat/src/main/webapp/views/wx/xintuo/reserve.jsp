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
        <div class="row" >
            <a href="javascript:history.go(-1);" class="btn btn-block btn-lg back_btn " style="background: #45A7FF;">预约<span class="icon-back pull-left"></span></a>
        </div>
        <div class="row" >
            <div class="col-xs-12" style="background: #F2F2F2;">
                    <label style="margin-top: 5px;">
                        <h4>请填写预约相关信息</h4>
                    </label>
            </div>
            <div class="pei_money col-xs-12" style="margin-top: 0px;">
                <div class="row">
                    <div class="b_b">
                        <div class="col-xs-4">
                            <label for="userName">
                                <h4>客户姓名</h4></label>
                        </div>
                        <div class="col-xs-8">
                            <h4>
                                <input type="text" maxlength="12"  placeholder="请输入姓名" class="form-control" id="userName" placeholder="请输入姓名">
                           </h4>
                        </div>
                    </div>
                    <div class="b_b">
                        <div class="col-xs-4">
                            <label for="userPhone">
                                <h4>客户手机</h4></label>
                        </div>
                        <div class="col-xs-8">
                            <h4>
                                <input type="number" maxlength="11" class="form-control" id="userPhone" placeholder="请输入手机号码">
                           </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding-bottom:20px">
                    <a href="#" class="btn btn-block btn_orange">确&nbsp;定</a>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
</html>