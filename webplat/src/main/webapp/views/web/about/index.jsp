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
    <title>淘金山-关于我们-公司简介</title>
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
                    <a href="http://www.taojinshan.com.cn">
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
    <img src="assets/img/about/imgbg.jpg" style="display: block; overflow: hidden; width:100%" alt="" />
    <div class="mod_breadcrumb">
        <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/aboutUs/index" class="path_item">关于我们</a> <span class="sep">&gt;</span> <span class="txt">公司简介</span> </div>
    </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="gywm_left">
                <ul>
                    <li><a class="on" href="rest/web/aboutUs/index">公司简介</a></li>
                    <li><a href="rest/web/aboutUs/team">管理团队</a></li>
                    <li><a href="rest/web/aboutUs/jobs">人才招聘</a></li>
                    <li><a href="rest/web/aboutUs/contact">联系我们</a></li>
                    <li><a href="rest/web/aboutUs/partner">商户合作</a></li>
                </ul>
            </div>
            <div class="gywm_right">
                <div class="gywm_title">公司简介</div>
                <div class="boxbg gywm_box">
                    淘金山（www.taojinshan.com.cn）淘金山秉着"以诚为贵、以客为尊、以人为本"的服务宗旨，通过互联网（移动）技术，随时随地为投资者提供专业、实时、权威的理财产品和金融服务的搜索、对比、查找、咨询，以帮助投资者找到最合适的理财产品和最优质的理财服务。
                </div>
                <div class="gywm_title title1">企业文化</div>
                <div class="boxbg gywm_box" style="height: auto">
                    <table class="tbl1">
                        <tr>
                            <td>
                                <img src="assets/img/about/shiming.png" alt="" /></td>
                            <td>
                                <img src="assets/img/about/linian.png" alt="" /></td>
                            <td>
                                <img src="assets/img/about/jiazhi.png" alt="" /></td>
                        </tr>
                        <tr>
                            <td><span>使命</span></td>
                            <td><span>理念</span></td>
                            <td><span>价值观</span></td>
                        </tr>
                        <tr>
                            <td>打造开放、公平的互联网金融服务平台</td>
                            <td>激情、专业、极致。</td>
                            <td>开放、包容、共享。</td>
                        </tr>
                    </table>
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
