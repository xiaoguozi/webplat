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
        <title>淘金山</title>
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
        <div class="row">
		    <div class="col-md-6 col-md-offset-3">
		        <h3 class="page-header"> <a href="#">淘金山</a> <small>登录页面 </small></h3>
		    </div>
		    <div class="col-md-4 col-md-offset-4">
		    <form class="login-form" action="rest/web/passport/login" method="post">
		<div class="text-danger">${error }</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">用户名</label>
			<div class="input-icon">
				<input name="username" id="username" size="25" value="" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">密码</label>
			<div class="input-icon">
				<input name="password" id="password" size="25" value="" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" />
			</div>
		</div>
		<div class="form-actions">
			<label class="checkbox">
			<input type="checkbox" name="remember" value="1"/> 记住我 </label>
			
		</div>
		<div class="form-actions">
			
			<button id="loginBut" type="submit" class="btn btn-primary btn-lg btn-block">
			登录 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
		<div class="forget-password">
			<h4>忘记密码 ?</h4>
			<p>点击 <a href="rest/web/passport/getPwd" id="forget-password">这里</a> 重置您的密码.
			</p>
		</div>
		<div class="create-account">
			<p>
				 还没有账号 ?&nbsp; <a href="rest/web/passport/reg" id="register-btn">创建一个账号</a>
			</p>
		</div>
	</form>
			</div>
		</div>

        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script src="app/lib/security/sha256.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
$(function() {  
	var handleLogin = function() {
	    $('.login-form').validate({
	        errorElement : 'span', // default input error message container
	        errorClass : 'help-block', // default input error message class
	        focusInvalid : false, // do not focus the last invalid input
	        rules : {
	            username : {
	                required : true
	            },
	            password : {
	                required : true
	            },
	            remember : {
	                required : false
	            }
	        },
	
	        messages : {
	            loginName : {
	                required : "用户名不能为空."
	            },
	            password : {
	                required : "密码不能为空."
	            }
	        },
	
	        invalidHandler : function(event, validator) { // display error
	            // alert on form
	            // submit
	            $('.alert-danger', $('.login-form')).show();
	        },
	
	        highlight : function(element) { // hightlight error inputs
	            $(element).closest('.form-group').addClass('has-error'); 
	        },
	
	        success : function(label) {
	            label.closest('.form-group').removeClass('has-error');
	            label.remove();
	        },
	
	        errorPlacement : function(error, element) {
	            error.insertAfter(element.closest('.input-icon'));
	        },
	
	        submitHandler : function(form) {
	            var passwordInput = $('[name="password"]');
	            passwordInput.val(sha256_digest(passwordInput.val()));
	            form.submit();
	        }
	    });
	
	    $('.login-form input').keypress(function(e) {
	        if (e.which == 13) {
	            if ($('.login-form').validate().form()) {
	                $('.login-form').submit();
	            }
	            return false;
	        }
	    });
	}
		   
			handleLogin();
	
		});
	</script>
        
        
    </body>
</html>