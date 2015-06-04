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
        <title>淘金山——注册</title>
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
		    <img src="assets/img/ui/register_logo.png" alt="logo" class="img-responsive"/>
		    </div>
		        <form class="register-form" action="rest/web/passport/mregS2" method="post">
  <div class="form-group" >
    <label>手机号</label>
    <input type="text" class="form-control" name="userName" id="userName" placeholder="手机号">
  </div>
  <div class="form-group">
    <label>短信验证码</label>
    
    <div class="input-group">
      <input type="text" class="form-control" name="mobileVerifyCode" id="mobileVerifyCode" placeholder="短信验证码">
      <span class="input-group-btn">
        <button class="btn btn-info" type="button" id="newVerifyCode">获取验证码</button>
      </span>
    </div>
  </div>
  <div class="form-group">
    <label>密码</label>
    <input type="password" class="form-control" id="register_password" name="password"  placeholder="密码">
  </div>
  <div class="form-group">
    <label>确认密码</label>
    <input type="password" class="form-control" name="rpassword" placeholder="再次输入密码">
  </div>
  <div class="form-group checkbox">
    <label>
      <input name="tnc" type="checkbox" value="" checked="checked" > &nbsp;我已阅读接受&nbsp;<a href="rest/web/passport/agreement" target="_blank" class="tjs_registercode">《淘金山用户使用协议》</a>
    </label>
  </div>
  <button type="button" id="register-submit-btn" class="btn btn-primary btn-lg btn-block">提交</button>
</form>

		    </div>
		</div>
</div>
        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
           <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
        <script src="app/lib/security/sha256.js" type="text/javascript"></script>
        
<script>
$(function() {  
    var handleRegister = function() {

        jQuery.validator.addMethod("mobileCN", function(value, element) {
            return this.optional(element) || /^0?(13[0-9]|15[0-9]|18[0-9]|14[57]|17[78])[0-9]{8}$/.test(value);
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
                    remote: "rest/web/passport/notExistUserName"
                },
                password : {
                    required : true,
                    rangelength:[6,16]
                },
                rpassword : {
                    equalTo : "#register_password"
                },
                mobileVerifyCode : {
                    required : true,
                    remote: "rest/web/passport/validMobileVerifyCode"
                },
                tnc : {
                    required : true
                }
            },

            messages : { // custom messages for radio buttons and checkboxes

                userName : {
                    required : "手机号码不能为空.",
                    remote:"手机号已经注册过，您可以直接<a href='rest/web/mlogin'>登录</a>"
                },
                password : {
                    required : "密码不能为空."
                },
                mobileVerifyCode : {
                    required : "短信验证码不能为空.",
                    remote: "短信验证码输入有误."
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
                if (element.attr("name") == "tnc") {
                    error.insertAfter(element.closest('label'));
                } else if (element.closest('.input-group').size() === 1) {
                    error.insertAfter(element.closest('.input-group'));
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
  

    var wait=0;  
    var timeCount = function(o) {  
        if (wait == 0) {  
            o.prop("disabled","");            
            o.html("获取验证码");  
            wait = 60;  
        } else {  
            o.prop("disabled","disabled");  
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
            if ($('.register-form ').validate().element("#userName")) {
            	if($("#newVerifyCode").prop("disabled") != "disabled"){
            		var mobileNo = $('.register-form input[name=userName]').val();
                    $.post("rest/web/passport/sendMobileVerifyCode",{
                        "mobileNo":mobileNo
                    });
                    timeCount($("#newVerifyCode"));
                   // alert("验证码发送到 "+mobileNo+" 成功");
                }	
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