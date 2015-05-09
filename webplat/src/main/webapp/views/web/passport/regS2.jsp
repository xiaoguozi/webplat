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

     <div class="logo_wrap"><a href="#"><img src="assets/img/ui/register_logo.png" width="338" height="94" alt="logo" /></a></div>
    
  </div>
</div>
<!-- /header_menu -->

<div class="tjs_register_all_div">
<div class="tjs_1108px center tjs_all_border">

<div class="tjs_schedulediv">
<ul>
<li class="tjs_width330px tjs_backgroundblue tjs_bk_01"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;填写帐户信息</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/finish_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundblue tjs_width330px tjs_bk_02"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;验证账户信息</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/arrows_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundgray_b tjs_width330px tjs_bk_03"><span class="tjs_textgray">注册成功&nbsp;&nbsp;</span></li>
</ul>
</div>

<div class="tjs_register_div">


 <form class="register-form" action="rest/web/passport/regS3" method="post">
 
<input type="hidden" name="userName" value="${ctrlData.userName }">
<input type="hidden" name="password" value="${ctrlData.password }">
<div style=" height:30px;width:100%;"></div>
<div class="tjs_register_left">手机号：</div><div class="tjs_register_right"><div class="tjs_numberdiv"><span>${ctrlData.userName }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class=""><a href="rest/web/passport/reg">更换号码</a></span></div></div>

<div class="tjs_register_left">验证码：</div><div class="tjs_register_right"><input name="mobileVerifyCode" id="mobileVerifyCode" type="text" class="tjs_register_input  tjs_width176px" tabindex="1" spellcheck="false" placeholder=" 验证码" autofocus x-webkit-speech >&nbsp;&nbsp;<span class="tjs_verificationcode"><a href="#" id="newVerifyCode" >重新发送(60秒)</a></span></div>
<div class="clearfloat"></div>
<div class="tjs_register_prompt">&nbsp;<img src="assets/img/ui/ico_right.png" width="20" height="20" align="middle" />&nbsp;校验码已发送至您的手机，请查收</div>
<div style="height:60px; width:100%; text-align: center;"><a id="register-submit-btn" href="#" class="tjs_registerbtn">下一步</a></div>
<div style=" height:30px;width:100%;"></div>



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
            errorClass : 'help-block', // default input error message class
            focusInvalid : false, // do not focus the last invalid input
            ignore : "",
            rules : {
                mobileVerifyCode : {
                    required : true,
                    remote: "rest/web/passport/validMobileVerifyCode"
                }
            },

            messages : { // custom messages for radio buttons and checkboxes

            	mobileVerifyCode : {
	                required : "短信验证码不能为空.",
	                remote: "短信验证码输入有误."
	            }
            },

            invalidHandler : function(event, validator) { 
            	$('.alert-danger', $('.register-form2')).show();
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
	

	var wait=60;  
	var timeCount = function(o) {  
        if (wait == 0) {  
            o.removeClass("disabled");            
            o.html("免费获取验证码");  
            wait = 60;  
        } else {  
            o.addClass("disabled");  
            o.html("重新发送(" + wait + "秒)");  
            wait--;  
            setTimeout(function() {  
            	timeCount(o)  
            },  
            1000)  
        }  
    } 
			
	var handleNewVerifyCode = function(){
		timeCount($("#newVerifyCode"));
		$("#newVerifyCode").click(function(event){
			event.preventDefault();
			if(!$("#newVerifyCode").hasClass("disabled")){
				var mobileNo = $('.register-form input[name=userName]').val();
				$.post("rest/web/passport/reSendMobileVerifyCode",{
					"mobileNo":mobileNo
				});
				timeCount($("#newVerifyCode"));
				alert("验证码发送到 "+mobileNo+" 成功");
			}
			return false;
		});
	}
   
		   
		   
	handleRegister();
	handleNewVerifyCode();
		});
	</script>
        
        
        
</body>
</html>