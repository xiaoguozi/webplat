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

     <div class="logo_wrap"><a href="#"><img src="assets/img/ui/login_logo.png" width="338" height="94" alt="logo" /></a></div>
    
  </div>
</div>
<!-- /header_menu -->

<div class="tjs_login_all_div">
<div class="tjs_1108px center tjs_contentbg">

<div class="tjs_contentdiv">

<form class="login-form" action="rest/web/passport/login" method="post">
<div class="tjs_login_bgdiv">
<div class="tjs_login_title">会员登录</div>
<div class="tjs_topheight12"></div>

<div class="tjs_input_div">
  <input  name="username" id="username" type="text" class="tjs_input_text" tabindex="1" spellcheck="false" placeholder=" 手机号码" autofocus x-webkit-speech >
</div>
<div class="tjs_input_div">
<input name="password" id="password" type="password" class="tjs_input_text" placeholder=" 登录密码" tabindex="2">

</div>

<div class="tjs_botton_div">
<span class="">${error }</span>
<a href="＃" id="loginBut" class="tjs_loginbtn">登录</a>
</div>
<div class="tjs_assist">
<div class="tjs_assist_left"><input name="remember" type="checkbox" value="1" /> 记住我</div>
<div class="tjs_assist_right"><a href="rest/web/passport/getPwd">忘记密码？</a> ｜ <a href="rest/web/passport/reg">立即注册</a></div>
</div>
</div>

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
	var handleLogin = function() {
	    $('.login-form').validate({
	        errorElement : 'span', // default input error message container
	        errorClass : 'tjs_login_error', // default input error message class
	        focusInvalid : false, // do not focus the last invalid input
	        ignore : "",
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
	        	username : {
	                required : "用户名不能为空."
	            },
	            password : {
	                required : "密码不能为空."
	            }
	        },

            invalidHandler : function(event, validator) { 
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
                if (element.closest('.input-icon').size() === 1) {
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

	    $('.login-form input').keypress(function(e) {
	        if (e.which == 13) {
	            if ($('.login-form').validate().form()) {
	                $('.login-form').submit();
	            }
	            return false;
	        }
	    });
	    
	    $('#loginBut').click(function(e){
	    	e.preventDefault();
	    	//alert(1);
	    	if ($('.login-form').validate().form()) {
                $('.login-form').submit();
            }
	    	return false;
	    });
	}
		   
			handleLogin();
	
		});
	</script>
        
        
</body>
</html>
