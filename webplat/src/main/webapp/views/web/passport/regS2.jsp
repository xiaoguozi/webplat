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
<li class="tjs_width47px"><img src="assets/img/ui/finish_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundblue tjs_width330px tjs_bk_02"><span class="tjs_textwhite">&nbsp;&nbsp;&nbsp;&nbsp;验证账户信息</span></li>
<li class="tjs_width47px"><img src="assets/img/ui/arrows_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundgray_b tjs_width330px tjs_bk_03"><span class="tjs_textgray">注册成功&nbsp;&nbsp;</span></li>
</ul>
</div>

<div class="tjs_register_div">
<div style=" height:30px;width:100%;"></div>
<div class="tjs_register_left">手机号：</div><div class="tjs_register_right"><div class="tjs_numberdiv"><span>${username }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class=""><a href="rest/web/login">更换号码</a></span></div></div>

<div class="tjs_register_left">验证码：</div><div class="tjs_register_right"><input name="email" type="email" class="tjs_register_input  tjs_width176px" tabindex="1" spellcheck="false" placeholder=" 验证码" autofocus x-webkit-speech >&nbsp;&nbsp;<span class="tjs_verificationcode"><a href="#"><img src="assets/img/ui/code_2.png" width="100" height="38"  align="middle"/></a></span></div>
<div class="clearfloat"></div>
<div class="tjs_register_prompt">&nbsp;<img src="assets/img/ui/ico_right.png" width="20" height="20" align="middle" />&nbsp;校验码已发送至您的手机，请查收</div>
<div style="height:60px; width:100%; text-align: center;"><a href="succeed.html" class="tjs_registerbtn">下一步</a></div>
<div style=" height:30px;width:100%;"></div>
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->
</div>
<!-- /tjs_content_div -->


<%@ include file="/views/web/footer.jsp"%>
<!-- /footer tjs_1108px -->

</div>
<!-- /home_all -->
</body>
</html>