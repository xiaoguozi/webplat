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
<title>找回密码——淘金山</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
</head>

<body>
<div class="home_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href="#"><img src="assets/img/ui/reset_logo.png" width="338" height="94" alt="logo" /></a></div>
    
  </div>
</div>
<!-- /header_menu -->

<div class="tjs_register_all_div">
<div class="tjs_1108px center tjs_all_border">

<div class="tjs_reset_pwdiv">
<ul>
<li class="tjs_width239px tjs_backgroundblue"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;帐户验证</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/finish_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundblue tjs_width239px"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;身份验证</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/finish_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundblue tjs_width239px"><span class="tjs_textwhite">重置密码&nbsp;&nbsp;</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/arrows_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundgray_b tjs_width239px"><span class="tjs_textgray">重置成功&nbsp;&nbsp;</span></li>
</ul>
</div>

<div class="tjs_register_div">


 <form class="register-form" action="rest/web/passport/getPwdS4" method="post">
 
<input type="hidden" name="userName" value="${ctrlData.userName }">
<input type="hidden" name="mobileVerifyCode" value="${ctrlData.mobileVerifyCode }">


<div style=" height:60px;width:100%;"></div>

<div style=" height:38px;width:100%; color:#999;">* 密码为6~16个字母、符号或数字组合，字母区分大小写 </div>

<div class="tjs_register_left">新密码：</div><div class="tjs_register_right"><input id="register_password" name="password" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 新密码" autofocus x-webkit-speech ></div>


<div class="tjs_register_left">确认新密码：</div><div class="tjs_register_right"><input name="rpassword" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 确认密码" autofocus x-webkit-speech ></div>
<div class="clearfloat"></div>

<div style="height:60px; width:100%; text-align: center;"><a id="register-submit-btn"  href="#" class="tjs_registerbtn">下一步</a></div>
<div style=" height:60px;width:100%;"></div>

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

        $('.register-form').validate({
            errorElement : 'span', // default input error message container
            errorClass : 'tjs_reg_error', // default input error message class
            focusInvalid : false, // do not focus the last invalid input
            ignore : "",
            rules : {
                password : {
                    required : true,
                    rangelength:[6,16]
                },
                rpassword : {
                    equalTo : "#register_password"
                }
            },

            messages : { // custom messages for radio buttons and checkboxes

	            
	            password : {
	                required : "密码不能为空."
	            },
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
	
		   
	handleRegister();
		});
	</script>
        


</body>
</html>
