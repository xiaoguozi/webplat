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
        <title>淘金山—-登录</title>
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
        <link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
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
			    	<img src="assets/img/ui/login_logo.png" alt="logo" class="img-responsive"/>
			    </div>
	 			<form class="login-form" action="rest/web/passport/mlogin" method="post">
				   <div class="form-group" >
					    <label>手机号</label>
					    <input type="text" class="form-control" name="username" id="username" placeholder="手机号">
				   </div>
		  
				  <div class="form-group" style="margin-bottom:2px">
				    <label>密码</label>
				    <input type="password" class="form-control" id="password" name="password"  placeholder="密码">
				  </div>
				   <div class="form-group" style="margin-bottom:2px">
				   <span style="color:red;margin-left:5px">${error}</span>				  
				   </div>
				 	  		  		
		 		<button type="button" id="loginBut" class="btn btn-primary btn-lg btn-block">登录</button>
		 		
		 		
		 		<div class="form-group" >
			 		<div class="tjs_assist" nowrap>
					<div class="tjs_assist_left" style="width:65px;margin-left:15px"><input name="remember" type="checkbox" value="1" /> 记住我</div>
					<div class="tjs_assist_right" style="margin-right:10px"> <a href="rest/web/passport/getMPwd">忘记密码？</a> ｜ <a href="rest/web/passport/mreg">立即注册</a></div>
					</div>
			   </div>
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
		var handleLogin = function() {
			
		    $('.login-form').validate({
		        errorElement : 'span', // default input error message container
		        errorClass : 'help-block', // default input error message class
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