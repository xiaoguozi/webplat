<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
    <title>淘金山-跟我淘金山</title>
    <script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
    <link href="assets/css/ui/taojinshan_about.css" rel="stylesheet" media="screen" type="text/css" />
	<link href="assets/css/ui/about.css" rel="stylesheet" />
</head>

<body>
    <div class="home_all">
       <%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" />
                    </a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                        <li><a href="">首页</a></li>
					    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li><a href="rest/web/peizi/index" target="_blank">配资</a></li>
					    <li><a href="#" target="_blank">海外保险</a></li>
					    <li><a href="rest/web/aboutUs/index" target="_blank">关于我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/  导航-->
    <!-- 内容-->
    <img src="assets/img/about/imgbg.jpg" style="display: block; overflow: hidden;width:100%" alt="" />
    <div class="mod_breadcrumb">
        <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/aboutUs/index" class="path_item">关于我们</a> <span class="sep">&gt;</span> <span class="txt">联系我们</span> </div>
    </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="gywm_left">
                <ul>
                    <li><a href="rest/web/aboutUs/index">公司简介</a></li>
                    <li><a href="rest/web/aboutUs/team">管理团队</a></li>
                    <li><a href="rest/web/aboutUs/jobs">人才招聘</a></li>
                    <li><a href="rest/web/aboutUs/contact" class="on">联系我们</a></li>
                    <li><a href="rest/web/aboutUs/partner">商户合作</a></li>
                </ul>
            </div>
            <div class="gywm_right">
                <div class="gywm_title lxwm">联系我们</div>
                <div class="amap">
                    <img src="assets/img/about/amap.png" />
                </div>
                <div class="about">
                    <p class="high">淘金山官方联系方式</p>
                    <p class="high">客户服务电话：</p>
                    <p>咨询热线：0755-88867258或者4006-114-088 （工作日）</p>
                    <p>服务时间：周一至周五9:00-18:00</p>
                    <p class="high">办公地址和联络方式：</p>
                    <p>地址：深圳市福田区福强路4001号文化创意园A座6层（地铁龙岗线益田站D出口）</p>
                    <p>企业邮箱：taojinshan88@163.com</p>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!--/ 内容-->
    <!--  页脚-->
   <%@ include file="/views/web/footer.jsp"%>
</body>
</html>
