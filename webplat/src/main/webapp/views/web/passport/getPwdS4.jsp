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
<li class="tjs_width47px"><img src="assets/img/ui/finish_ico.png" width="47" height="60" /></li>
<li class="tjs_backgroundblue tjs_width239px"><span class="tjs_textwhite">重置成功&nbsp;&nbsp;</span></li>
</ul>
</div>

<div class="tjs_register_div">
<div style=" height:60px;width:100%;"></div>
<div class="tjs_finish_left"></div>
<div class="tjs_finish_right">
<div style="height:50px; width:100%; text-align: center;"></div>
<span style="color:#39b53c; font-size:24px;">您已成功重置密码！</span><br /><a href="rest/web/login">马上登录？</a></div>
<div style="height:60px; width:100%; text-align: center;"><a href="rest/web/welcome" class="tjs_registerbtn">回到首页</a></div>

<div style=" height:60px;width:100%;"></div>


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