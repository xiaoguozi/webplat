<%@ include file="/views/web/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘金山——注册</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
</head>

<body>
<div class="home_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href="http://www.taojinshan.com.cn"><img src="assets/img/ui/register_logo.png" width="338" height="94" alt="logo" /></a></div>
    
  </div>
</div>
<!-- /header_menu -->

<div class="tjs_register_all_div">
<div class="tjs_1108px center tjs_all_border">

<div class="tjs_schedulediv">
<ul>
<li class="tjs_width330px tjs_backgroundblue tjs_bk_01"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;填写帐户信息</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/arrows_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundgray_b tjs_width330px tjs_bk_02"><span class="tjs_textgray">&nbsp;&nbsp;&nbsp;&nbsp;验证账户信息</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/arrows__no_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundgray_b tjs_width330px tjs_bk_03"><span class="tjs_textgray">注册成功&nbsp;&nbsp;</span></li>
</ul>
</div>

<div class="tjs_register_div">

 <form class="register-form" action="rest/web/passport/regS2" method="post">
 
<div style=" height:30px;width:100%;"></div>
<div class="tjs_register_left">手机：</div><div class="tjs_register_right"><input name="userName" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 手机" autofocus x-webkit-speech ></div>

<div class="tjs_register_left">密码：</div><div class="tjs_register_right"><input id="register_password" name="password" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 初始密码" autofocus x-webkit-speech ></div>
<div class="tjs_register_left">确认：</div><div class="tjs_register_right"><input name="rpassword" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 确定密码" autofocus x-webkit-speech ></div>
<div class="tjs_register_left">验证码：</div><div class="tjs_register_right"><input name="verifyCode" id="verifyCode" type="text" class="tjs_register_input  tjs_width176px" tabindex="1" spellcheck="false" placeholder=" 验证码" autofocus x-webkit-speech >&nbsp;&nbsp;<span class="tjs_verificationcode"><a href="#"><img id="verifyCodeImg" src="rest/captcha/img" width="100" height="38"  align="middle"/></a></span>&nbsp;&nbsp;<span><a href="#" id="newVerifyCode" class="tjs_registercode">换一张</a></span></div>
<div class="clearfloat"></div>
<div class="tjs_register_agreement">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="tnc" type="checkbox" value="" checked="checked" />&nbsp;我已阅读接受&nbsp;<a href="#" class="tjs_registercode">《淘金山用户使用协议》</a></div>
<div style="height:60px; width:100%; text-align: center;"><a id="register-submit-btn"  href="#" class="tjs_registerbtn">下一步</a></div>
<div style="height:60px; width:100%; text-align: center;">已经注册? 前往 <a href="rest/web/login" class="tjs_registercode"><strong>登录</strong></a></div>


	
	</form>
	
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->
</div>
<!-- /tjs_content_div -->


<%@ include file="/views/web/footer.jsp"%>
<!-- /footer tjs_1108px -->

</div>
<!-- /home_all -->

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
        

	    $('#register-submit-btn').click(function(e){
	    	e.preventDefault();
	    	if ($('.register-form').validate().form()) {
                $('.register-form').submit();
            }
	    	return false;
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