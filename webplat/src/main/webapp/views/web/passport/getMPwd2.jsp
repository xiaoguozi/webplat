<%@ include file="/views/web/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8" />
        <title>淘金山—找回密码</title>
        <div id='wx_pic' style='margin:0 auto;display:none;'>
          <img src='assets/img/fx_logo.jpg' />
        </div>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <meta name="MobileOptimized" content="320">

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->

        <link rel="shortcut icon" href="app/img/favicon.ico" />
    </head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body>
        <div class="container">
        <div class="row">
            <div class="col-md-12">
            <div>
            <img src="assets/img/ui/getpwd_logo.jpg" alt="logo" class="img-responsive"/>
            <div class="center-block"><h3 class="text-success">您已成功重置密码！</h3></div>
            <br/>
            <a href="rest/web/mlogin" class="btn btn-primary btn-lg btn-block">马上登陆</a>
            </div>
			</div>
        </div>
        </div>

        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>