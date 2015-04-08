<%@ include file="/views/admin/include.jsp"%>
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
        <title>淘金山管理系统</title>
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

        <!-- BEGIN THEME STYLES -->
        <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
        <!-- END THEME STYLES -->


<!-- BEGIN CUSTOM CSS IMPORT -->
    <link rel="stylesheet" href="assets/widget/ladda/css/ladda-themeless.min.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" media="screen">
    <link rel="stylesheet" href="assets/widget/icheck/skins/all.css" media="screen">
    <link rel="stylesheet" href="assets/widget/select2/select2.css">
    <link rel="stylesheet" href="assets/widget/select2/select2-bootstrap.css">
    <link rel="stylesheet" href="assets/widget/zTree/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="assets/widget/zTree/css/proton/zTreeTheme.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-modal/css/bootstrap-modal-bs3patch.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-modal/css/bootstrap-modal.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-notify/css/bootstrap-notify.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-notify/css/styles/alert-bangtidy.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-notify/css/styles/alert-blackgloss.css">
    <link rel="stylesheet" href="assets/widget/bootstrap-notify/css/styles/alert-notification-animations.css">
    <link rel="stylesheet" href="assets/widget/kindeditor/themes/default/default.css">
    
    <link rel="stylesheet" href="assets/css/admin-index.css">
<!-- END CUSTOM CSS IMPORT -->
        <link rel="shortcut icon" href="app/img/favicon.ico" />
    </head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body class="page-header-fixed">
        <!-- BEGIN HEADER -->
        <div class="header navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="header-inner">
                <!-- BEGIN LOGO -->
                <a class="navbar-brand" href="javascript:;">
                    <img src="assets/img/logo.png" alt="logo" class="img-responsive" />
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <img
                    src="assets/img/menu-toggler.png" alt="" />
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img alt="" src="assets/img/avatar1_small.jpg"/>
                            <span class="username"> ${userInfo.username } </span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="javascript:;" id="trigger_fullscreen">
                                    <i class="fa fa-move"></i> 全屏
                                </a>
                            </li>
                            <li>
                                <a href="extra_lock.html">
                                    <i class="fa fa-lock"></i> 锁屏
                                </a>
                            </li>
                            <li>
                                <a href="rest/admin/user/logout">
                                    <i class="fa fa-key"></i> 退出
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <div class="clearfix"></div>
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <ul class="page-sidebar-menu" id="page-sidebar-menu">
                        <li class="sidebar-toggler-wrapper">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler hidden-phone"></div>
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                        </li>

                        <li class="start active">
                            <a href="rest/admin/dashboard/index" id="btn-dashboard">
                                <i class="fa fa-home"></i><span class="title"> 首页 </span><span
                                class="selected"> </span>
                            </a>
                        </li>

                        <li class="">
                            <a href="javascript:;">
                                <i class="fa fa-gears"></i><span class="title"> 系统管理 </span><span
                                class="arrow "> </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="rest/admin/user/index">
                                        用户管理
                                    </a>
                                </li>
                                <li>
                                    <a href="rest/admin/role/index">
                                        角色管理
                                    </a>
                                </li>
                                <li>
                                    <a href="rest/admin/permission/index">
                                        权限管理
                                    </a>
                                </li>
                            </ul>
                        </li>
                        
                        
                         <li class="">
                            <a href="javascript:;">
                                <i class="fa fa-gears"></i><span class="title"> 产品管理 </span><span
                                class="arrow "> </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="rest/admin/xintuogs/xtgsIndex">
                                        信托公司
                                    </a>
                                </li>
                                <li>
                                    <a href="rest/admin/xintuocp/xtcpIndex">
                                        信托产品
                                    </a>
                                </li>
                                <li>
                                    <a href="rest/admin/pe/peCompany/index">
                                        私募公司
                                    </a>
                                </li>
                                 <li>
                                    <a href="rest/admin/pe/peProduct/index">
                                        私募产品
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="javascript:;">
                                <i class="fa fa-user"></i><span class="title"> 个人中心 </span><span
                                class="arrow "> </span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="rest/admin/user/infoUpdate">
                                        信息修改
                                    </a>
                                </li>
                                <li>
                                    <a href="rest/admin/user/pwdUpdate">
                                        密码修改
                                    </a>
                                </li>
                                
                                <!-- 测试权限控制 -->
                                <shiro:hasAnyRoles name="super_admin">
                                    <li>
                                        <a href="javascript:;">super_admin 拥有此角色</a>
                                    </li>
                                </shiro:hasAnyRoles>
                                
                                <shiro:hasPermission name="user:create">
                                    <li>
                                        <a href="javascript:;">user:create 拥有此权限</a>
                                    </li>
                                </shiro:hasPermission>
                                
                                <shiro:hasPermission name="user:update">
                                    <li>
                                        <a href="javascript:;">user:update 拥有此权限</a>
                                    </li>
                                </shiro:hasPermission>
     
                            </ul>
                        </li>

                    </ul>
                    <!-- END SIDEBAR MENU -->
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Modal title</h4>
                                </div>
                                <div class="modal-body">
                                    Widget settings form goes here
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn blue">
                                        Save changes
                                    </button>
                                    <button type="button" class="btn default" data-dismiss="modal">
                                        Close
                                    </button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <!-- BEGIN STYLE CUSTOMIZER -->
                    <div class="theme-panel hidden-xs hidden-sm hidden">
                        <div class="toggler"></div>
                        <div class="toggler-close"></div>
                        <div class="theme-options">
                            <div class="theme-option theme-colors clearfix">
                                <span> 主题颜色 </span>
                                <ul>
                                    <li class="color-black current color-default" data-style="default"></li>
                                    <li class="color-blue" data-style="blue"></li>
                                    <li class="color-brown" data-style="brown"></li>
                                    <li class="color-purple" data-style="purple"></li>
                                    <li class="color-grey" data-style="grey"></li>
                                    <li class="color-white color-light" data-style="light"></li>
                                </ul>
                            </div>
                            <div class="theme-option">
                                <span> 布局 </span>
                                <select class="layout-option form-control input-small">
                                    <option value="fluid">顺序</option>
                                    <option value="boxed">盒状</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> 标题 </span>
                                <select class="header-option form-control input-small">
                                    <option value="fixed">固定</option>
                                    <option value="default">默认</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> 工具栏 </span>
                                <select class="sidebar-option form-control input-small">
                                    <option value="fixed">固定</option>
                                    <option value="default">默认</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> 工具栏位置 </span>
                                <select class="sidebar-pos-option form-control input-small">
                                    <option value="left">左边</option>
                                    <option value="right">右边</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> 页脚 </span>
                                <select class="footer-option form-control input-small">
                                    <option value="fixed">固定</option>
                                    <option value="default">默认</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- END STYLE CUSTOMIZER -->

                    <!-- BEGIN DASHBOARD STATS -->
                    <div id="main-content"></div>

                    <!-- END PORTLET-->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">
                2015 &copy; TJS Company.
            </div>
            <div class="footer-tools">
                <span class="go-top"><i class="fa fa-angle-up"></i></span>
            </div>
        </div>
        
        
		<div id="notifications" class='notifications center'></div>
        <!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>
        <script src="assets/plugins/excanvas.min.js"></script>
        <![endif]-->
        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

        <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>

<!-- BEGIN CUSTOM JS IMPORT -->
	    <script src="assets/widget/jquery.metadata.js" charset="utf-8"></script>
	    <script src="assets/widget/spin.min.js" charset="utf-8"></script>
	    <script src="assets/widget/ladda/js/ladda.min.js" charset="utf-8"></script>
	    <script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
	    <script src="assets/widget/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="utf-8"></script>
	    <script src="assets/widget/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="utf-8"></script>
	    <script src="assets/widget/icheck/icheck.min.js" charset="utf-8"></script>
	    <script src="assets/widget/select2/select2.js" charset="utf-8"></script>
	    <script src="assets/widget/select2/select2_locale_zh-CN.js" charset="utf-8"></script>
	    <script src="assets/widget/zTree/js/jquery.ztree.all-3.5.min.js" charset="utf-8"></script>
	    <script src="assets/widget/zTree/js/jquery.ztree.exhide-3.5.min.js" charset="utf-8"></script>
	    <script src="assets/widget/bootstrap-modal/js/bootstrap-modalmanager.js" charset="utf-8"></script>
	    <script src="assets/widget/bootstrap-modal/js/bootstrap-modal.js" charset="utf-8"></script>
	    <script src="assets/widget/bootstrap-prompts-alert.js" charset="utf-8"></script>
	    <script src="assets/widget/jquery-inputmask/min/jquery.inputmask.js" charset="utf-8"></script>
    	<script src="assets/widget/jquery-inputmask/min/jquery.inputmask.date.extensions.js" charset="utf-8"></script>
    
	    <script src="assets/widget/bootstrap-notify/js/bootstrap-notify.js" charset="utf-8"></script>
	    <script src="assets/widget/kindeditor/kindeditor-min.js" charset="utf-8"></script>
	    <script src="assets/widget/kindeditor/lang/zh_CN.js" charset="utf-8"></script>
	    
        <script src="assets/scripts/btk.js" type="text/javascript"></script>
        <script src="assets/scripts/btk.pagination.js" type="text/javascript"></script>
        <script src="assets/scripts/btk.table.js" type="text/javascript"></script>
        <script src="assets/scripts/dict.js" type="text/javascript"></script>
<!-- END CUSTOM JS IMPORT -->        
        <script src="assets/scripts/app.js" type="text/javascript"></script>
        <script type="text/javascript" src="app/js/index.js"></script>

        <!-- <script data-main="app/js/main" src="app/lib/requirejs/require.js"></script> -->
    </body>
</html>