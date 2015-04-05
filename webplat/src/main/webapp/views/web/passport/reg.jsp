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
		        <h3 class="page-header"> <a href="#">淘金山</a> <small>注册页面 </small></h3>
		    </div>
		    <div class="col-md-4 col-md-offset-4">
		    <form class="register-form" action="rest/web/passport/regData" method="post">
		<div class="text-danger">${error }</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">手机号码</label>
			<div class="input-icon">
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="手机号码" name="userName"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">密码</label>
			<div class="input-icon">
				<input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="密码" name="password"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">再次输入密码</label>
			<div class="controls">
				<div class="input-icon">
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="再次输入密码" name="rpassword"/>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">验证码</label>
			<div class="input-icon">
				<img id="verifyCodeImg" class="img-rounded " alt="验证码" src="rest/captcha/img"> <a href="#" id="newVerifyCode">换一张</a>
				<br/><br/>
				<input name="verifyCode" id="verifyCode" size="25" value="" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="验证码" />
			</div>
		</div>
		<div class="form-group">
			<label>
			<input type="checkbox" name="tnc"/> 我同意 <a href="#">服务条款</a> 和 <a href="#">隐私政策</a>
			</label>
			<div id="register_tnc_error">
			</div>
		</div>
		<div class="form-actions">
			<button id="register-submit-btn" type="submit" class="btn btn-primary btn-lg btn-block">
			注册 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
		
	</form>
			</div>
		</div>

        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
           <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
        <script src="app/lib/security/sha256.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
$(function() {  
	var handleRegister = function() {

		jQuery.validator.addMethod("mobileCN", function(value, element) {
			return this.optional(element) || /^0?(13[0-9]|15[012356789]|18[0236789]|14[57]|17[7])[0-9]{8}$/.test(value);
		}, "手机号码格式不正确");


        $('.register-form').validate({
            errorElement : 'span', // default input error message container
            errorClass : 'help-block', // default input error message class
            focusInvalid : false, // do not focus the last invalid input
            ignore : "",
            rules : {
                userName : {
                    required : true,
                    mobileCN : true,
                    remote: "rest/web/passport/validUserName"
                },
                password : {
                    required : true
                },
                rpassword : {
                    equalTo : "#register_password"
                },
                verifyCode : {
                    required : true,
                    remote: "rest/web/passport/validVerifyCode"
                },
                tnc : {
                    required : true
                }
            },

            messages : { // custom messages for radio buttons and checkboxes

	            userName : {
	                required : "手机号码不能为空.",
	                remote:"手机号已经注册过，您可以直接<a href='rest/web/login'>登录</a>"
	            },
	            password : {
	                required : "密码不能为空."
	            },
	            verifyCode : {
	                required : "验证码不能为空.",
	                remote: "验证码输入有误."
	            },
	            tnc : {
                    required : "请同意并勾选服务条款."
                }
            },

            invalidHandler : function(event, validator) { 
            	$('.alert-danger', $('.register-form')).show();
            },

            highlight : function(element) { // hightlight error inputs
                $(element).closest('.form-group').addClass('has-error');
            },

            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement : function(error, element) {
                if (element.attr("name") == "tnc") { // insert checkbox
                    // errors after the
                    // container
                    error.insertAfter($('#register_tnc_error'));
                } else if (element.closest('.input-icon').size() === 1) {
                    error.insertAfter(element.closest('.input-icon'));
                } else {
                    error.insertAfter(element);
                }
            },

            submitHandler : function(form) {
            	var passwordInput = $('[name="password"]');
	            passwordInput.val(sha256_digest(passwordInput.val()));
                form.submit();
            }
        });

        $('.register-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.register-form').validate().form()) {
                    $('.register-form').submit();
                }
                return false;
            }
        });
	}
	var handleNewVerifyCode = function(){
		$("#newVerifyCode, #verifyCodeImg").click(function(event){
			event.preventDefault();
			var imgSrc = "rest/captcha/img?r=";
			$("#verifyCodeImg").attr("src", imgSrc+Math.random());
			return false;
		});
	}
		   
		   
	handleRegister();
	handleNewVerifyCode();
		});
	</script>
        
        
    </body>
</html>