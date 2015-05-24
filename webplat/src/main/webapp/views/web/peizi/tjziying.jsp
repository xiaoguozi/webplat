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
	<title>淘金山-配资首页</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />
	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />
	
	<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
	<script type="text/javascript" src="assets/scripts/slide.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
	<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
	<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
</head>
<body>
    <div class="home_all">
        <%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="http://www.taojinshan.com.cn">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                        <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li><a href="rest/web/peizi/activity"><span>淘金活动</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <li><a href="rest/web/peizi/raise"><span>淘金募集</span></a></li>
                        <li><a href="rest/web/peizi/self"><span class="simu_on">淘金自营</span></a></li>
                        <li><a href="rest/web/peizi/personalCenter"><span>个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                    <li><a href="rest/web/peizi/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/lowCapital">低息配</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">淘金自营</span> </div>
        </div>
        <div class="w100bg">
            <div class="tjs_1108px center">
                <div class="pz_produce">
                    <img src="assets/img/peizi/jxtuijuan.png" alt=""><b>精选推荐</b>
                </div>
                <div class="bgcolor" style="border: 1px solid #d3d3d3; border-top: none">
                    <div class="tjs_right_unit w275 tjs_right_2border">
                        <div class="tjs_private_icodiv">
                            <div style="height: 23px; width: 100%;"></div>
                            <div class="tjs_right_privatetitle chanpinjingli">
                                <img src="assets/img/peizi/user01.png" width="128" height="128" />
                            </div>
                            <div class="tjs_private_textbgdiv">累计收益</div>
                            <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                            <div class="tjs_private_textdiv">基金经理：<a target="_blank" href="simujinglimingxi.html">罗林正</a></div>
                            <div class="tjs_private_textdiv">产品名称：<a target="_blank" href="simuchanpinmingxi.html">泽熙3期</a></div>
                        </div>
                        <div class="tjs_product_textdiv">私募一哥，风格犀利，踩点精准， 业绩遥遥领先！ </div>
                        <div class="tjs_right_btndiv">
                            <a href="javascript:void(0)" onclick="alertbox(this)" class="tjs_btn">
                                <img src="assets/img/peizi/clock.png" />立即预约</a>
                        </div>
                    </div>
                    <!-- /tjs_right_unit 01 -->

                    <div class="tjs_right_unit w275 tjs_right_2border">
                        <div class="tjs_private_icodiv">
                            <div style="height: 23px; width: 100%;"></div>
                            <div class="tjs_right_privatetitle chanpinjingli">
                                <img src="assets/img/peizi/user02.png" width="128" height="128" />
                            </div>
                            <div class="tjs_private_textbgdiv">累计收益</div>
                            <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                            <div class="tjs_private_textdiv">基金经理：<a target="_blank" href="simujinglimingxi.html">黄浩平</a></div>
                            <div class="tjs_private_textdiv">产品名称：<a target="_blank" href="simuchanpinmingxi.html">创势翔1号</a></div>
                        </div>
                        <div class="tjs_product_textdiv">连续两年股票私募冠军，成就私募历史第一人！ </div>
                        <div class="tjs_right_btndiv">
                            <a href="javascript:void(0)" onclick="alertbox(this)" class="tjs_btn">
                                <img src="assets/img/peizi/clock.png" />立即预约</a>
                        </div>
                    </div>
                    <!-- /tjs_right_unit 02 -->

                    <div class="tjs_right_unit w275 tjs_right_2border">
                        <div class="tjs_private_icodiv">
                            <div style="height: 23px; width: 100%;"></div>
                            <div class="tjs_right_privatetitle chanpinjingli">
                                <img src="assets/img/peizi/user02.png" width="128" height="128" />
                            </div>
                            <div class="tjs_private_textbgdiv">累计收益</div>
                            <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                            <div class="tjs_private_textdiv">基金经理：<a target="_blank" href="simujinglimingxi.html">黄浩平</a></div>
                            <div class="tjs_private_textdiv">产品名称：<a target="_blank" href="simuchanpinmingxi.html">创势翔1号</a></div>
                        </div>
                        <div class="tjs_product_textdiv">连续两年股票私募冠军，成就私募历史第一人！ </div>
                        <div class="tjs_right_btndiv">
                            <a href="javascript:void(0)" onclick="alertbox(this)" class="tjs_btn">
                                <img src="assets/img/peizi/clock.png" />立即预约</a>
                        </div>
                    </div>
                    <!-- /tjs_right_unit 02 -->

                    <div class="tjs_right_unit w275  tjs_backgroundgray">
                        <div class="tjs_private_icodiv">
                            <div style="height: 23px; width: 100%;"></div>
                            <div class="tjs_right_privatetitle chanpinjingli">
                                <img src="assets/img/peizi/user03.png" width="128" height="128" />
                            </div>
                            <div class="tjs_private_textbgdiv">累计收益</div>
                            <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                            <div class="tjs_private_textdiv">基金经理：<a target="_blank" href="simujinglimingxi.html">孙海宣</a></div>
                            <div class="tjs_private_textdiv">产品名称：<a target="_blank" href="simuchanpinmingxi.html">和聚1期</a></div>
                        </div>
                        <div class="tjs_product_textdiv">专注成长股，长牛私募，所有产品年化收益29%！ </div>
                        <div class="tjs_right_btndiv">
                            <a href="javascript:void(0)" onclick="alertbox(this)" class="tjs_btn">
                                <img src="assets/img/peizi/clock.png" />立即预约</a>
                        </div>
                    </div>
                    <!-- /tjs_right_unit 03 -->
                </div>
                <div class="pz_produce bdcolor">
				    <img src="assets/img/peizi/all.png" alt=""><b>全部自营产品</b>                    
			    </div>
                <table class="zy_tbl">
                        <thead>
                            <tr>
                                <td>基金简称</td>
                                <td>基金经理</td>
                                <td>基金公司</td>
                                <td class="border_l uc_sort">累计收益<em class="sort_desc"></em> </td>
                                <td class="border_l uc_sort">近2年收益<em class="sort_desc"></em></td>
                                <td class="uc_sort">近1年收益<em class="sort_desc"></em></td>
                                <td class="uc_sort">今年以来收益<em class="sort_desc"></em></td>
                                <td class="border_l">预约</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                            <tr>
                                <td><a href="tjziyingmingxi.html">金手指</a></td>
                                <td>郭建军</td>
                                <td>柯林资产</td>
                                <td class="border_l colorf06">1885.2%</td>
                                <td class="border_l">1185.25%</td>
                                <td>458.56%</td>
                                <td>302.45%</td>
                                <td class="border_l"><a href="javascript:void(0)" onclick="alertbox(this)">预约</a></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <hr class="pc" />
        </div>
        <!-- 配资页尾 -->
        <%@ include file="/views/web/footer.jsp"%>
        <!-- 配资页尾 结束 -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*-二级导航-*/
                $(".tjpz").hover(function () {
                    $(".nav_menu").show();
                    $(".tjpz>a>span").addClass("tspan");
                }, function () {
                    $(".nav_menu").hide();
                    $(".tjpz>a>span").removeClass("tspan");
                });
                $(".nav_menu").hover(function () {
                    $(this).show();
                    $(".tjpz>a>span").addClass("tspan");
                });
                $(".nav_menu").mouseleave(function () {
                    $(this).hide();
                    $(".tjpz>a>span").removeClass("tspan");
                });
                $(".about_box1:eq(2)").hover(function () {
                    $(".qq").attr("src", "assets/img/peizi/qqhove.png");
                    $(".zx").css("color", "#1682CA");
                }, function () {
                    $(".qq").attr("src", "assets/img/peizi/qq.png");
                    $(".zx").css("color", "#8c969d");
                })
                /*--/QQ咨询--*/
                //--排行图标--
                $(".uc_sort").each(function (index) {
                    $(".uc_sort>em").addClass("sort_desc");
                    $(this).click(function () {
                        var s = $(".uc_sort>em:eq(" + index + ")").hasClass("sort_desc");
                        $(".uc_sort>em").removeClass("sort_d sort_u");
                        $(".uc_sort>em").addClass("sort_desc");
                        if (s) {
                            $(".uc_sort>em:eq(" + index + ")").removeClass("sort_desc sort_u");
                            $(".uc_sort>em:eq(" + index + ")").addClass("sort_d");
                        } else {
                            $(".uc_sort>em:eq(" + index + ")").removeClass("sort_d");
                            $(".uc_sort>em:eq(" + index + ")").addClass("sort_u")
                            $(".uc_sort>em:eq(" + index + ")").addClass("sort_desc");
                        }
                    });

                })
                //--/排行图标--
            })
            function alertbox() {
                alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
            }
        </script>
</body>
</html>
