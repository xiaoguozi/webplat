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
                        <img src="assets/img/ui/tjs_logo.png" width="338" style="margin-top: 6px" height="94" align="middle" alt="淘金山理财" /></a>
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
    <img src="assets/img/about/imgbg.jpg" style="display: block; overflow: hidden; width: 100%" alt="" />
    <div class="mod_breadcrumb">
        <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/aboutUs/index" class="path_item">关于我们</a> <span class="sep">&gt;</span> <span class="txt">商户合作</span> </div>
    </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="gywm_left">
                <ul>
                    <li><a href="rest/web/aboutUs/index">公司简介</a></li>
                    <li><a href="rest/web/aboutUs/team">管理团队</a></li>
                    <li><a href="rest/web/aboutUs/jobs">人才招聘</a></li>
                    <li><a href="rest/web/aboutUs/contact">联系我们</a></li>
                    <li><a href="rest/web/aboutUs/partner" class="on">商户合作</a></li>
                </ul>
            </div>
            <div class="gywm_right">
                <div class="gywm_title shhz">商户合作</div>
                <div class="business">
                    <ul class="tit">
                        <li class="on">固定收益</li>
                        <li>浮动收益</li>
                        <li>证券业务合作</li>
                        <li>媒体关系</li>
                        <li>网站合作</li>
                    </ul>
                    <div class="content">
                        <div class="con">
                            <div class="intro">
                                <p class="hea">信托、资管等</p>
                                <p>信托类产品高端人群首选，适合资金稳健 增值，收益高且稳健，30倍银行活期存款 利息，信托迄今为止本息100%兑付。</p>
                            </div>
                            <div class="detial">
                                <div class="d_left">
                                    <p style="font-size: 20px;">联系方式</p>
                                    <table class="tbl3 tdh40" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><img src="assets/img/about/name.png" />
                                        &nbsp; 罗经理</td>
                                            <td><img src="assets/img/about/mail.png" />
                                            &nbsp; 810008703@qq.com</td>
                                        </tr>
                                        <tr>
                                            <td>
                                        <img src="assets/img/about/tellphone.png" />
                                        &nbsp; 18813982100</td>
                                            <td><img src="assets/img/about/qqlink.png" />
                                            &nbsp; 810008703</td>
                                        </tr>
                                    </table>
                                   
                                </div>
                                <div class="d_right">
                                <!-- 
                                    <div class="jianjie"></div>
                                    <p style="padding: 15px 130px;">简介</p>
                                    <p class="jjnr">与国内众多财富管理机构、券商、银行及商会有较紧密的合作关系，善于洞察高净值客户理财需求，为客户定制专业的资产配置计划。</p>
                                 -->
                                </div>
                            </div>
                        </div>
                        <div class="con" style="display: none"></div>
                        <div class="con" style="display: none"></div>
                        <div class="con" style="display: none"></div>
                        <div class="con" style="display: none"></div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!--/ 内容-->
    <!--  页脚-->
    <%@ include file="/views/web/footer.jsp"%> 
    <script>
    $(function () {
        $(".tit li").each(function (index) {
            $(this).click(function () {

                $(".tit li").removeClass("on");
                $(this).addClass("on");
                $(".content>.con").css("display", "none");
                $(".con:eq(" + index + ")").css("display", "block");
            });
        });
    });
    </script>
</body>
</html>
