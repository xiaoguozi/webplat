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
<title>淘金山—跟我淘金山</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />

<!--私募页面样式-->
<link href="assets/css/simu.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/iview.js"></script>
<script type="text/javascript" src="assets/scripts/ui/jquery.plugins-min.js"></script>
<script type="text/javascript" src="assets/scripts/ui/scripts-bottom-min.js"></script>
<script type="text/javascript" src="assets/scripts/slide.js"></script>


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
                <li><a href="index.html"><span class="simu_on">私募首页</span></a></li>
                <li><a href="simuchanpin.html"><span>私募产品</span></a></li>
                <li><a href="simuchanpinpaihang.html"><span>私募排行</span></a></li>
                <li><a href="simuchanpinjingli.html"><span>私募经理</span></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /header_menu -->

<div id="slideBox" class="slideBox">
            <div class="hd">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                    <li><a href="" target="_blank">
                        <img src="assets/img/ui/images01.jpg" /></a></li>
                </ul>
            </div>
            <a class="prev" href="javascript:void(0)"></a><a class="next" href="javascript:void(0)"></a>
        </div>
        <script type="text/javascript">
            jQuery(".slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, delayTime: 700 });
        </script>
        <!-- 焦点广告 结束 -->
        <div class="tjs_liuchengbg"></div>
        <div class="tjs_1108px center">
            <div class="tjs_liucheng">
            </div>
            <div class="tjs_product_div">
                <div class="tjs_1108px center">
                    <div class="tjs_product_right ml0">
                        <div class="tjs_right_titlediv fontcolor">
                            <img class="tjs_img_diamond" src="assets/img/ui/diamond.png" />顶级私募推荐<span style="float: right;"><a href="#" class="tjs_moreurl">更多>></a></span>
                        </div>
                        <div class="tjs_coloreddiv ml0 bgcolor"></div>
                        <div class="tjs_right_typle border_left">
                            <div class="tjs_right_unit w275 tjs_right_2border">
                                <div class="tjs_private_icodiv">
                                    <div style="height: 23px; width: 100%;"></div>
                                    <div class="tjs_right_privatetitle chanpinjingli">
                                        <img src="assets/img/ui/user01.png" width="128" height="128" />
                                    </div>
                                    <div class="tjs_private_textbgdiv">累计收益</div>
                                    <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                                    <div class="tjs_private_textdiv">基金经理：<a href="#">罗林正</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="#">泽熙3期</a></div>
                                </div>
                                <div class="tjs_product_textdiv">私募一哥，风格犀利，踩点精准， 业绩遥遥领先！ </div>
                                <div class="tjs_right_btndiv">
                                    <a href="#" class="tjs_btn">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 01 -->

                            <div class="tjs_right_unit w275 tjs_right_2border">
                                <div class="tjs_private_icodiv">
                                    <div style="height: 23px; width: 100%;"></div>
                                    <div class="tjs_right_privatetitle chanpinjingli">
                                        <img src="assets/img/ui/user02.png" width="128" height="128" />
                                    </div>
                                    <div class="tjs_private_textbgdiv">累计收益</div>
                                    <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                                    <div class="tjs_private_textdiv">基金经理：<a href="#">黄浩平</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="#">创势翔1号</a></div>
                                </div>
                                <div class="tjs_product_textdiv">连续两年股票私募冠军，成就私募历史第一人！ </div>
                                <div class="tjs_right_btndiv">
                                    <a class="tjs_btn">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 02 -->

                            <div class="tjs_right_unit w275 tjs_right_2border">
                                <div class="tjs_private_icodiv">
                                    <div style="height: 23px; width: 100%;"></div>
                                    <div class="tjs_right_privatetitle chanpinjingli">
                                        <img src="assets/img/ui/user02.png" width="128" height="128" />
                                    </div>
                                    <div class="tjs_private_textbgdiv">累计收益</div>
                                    <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                                    <div class="tjs_private_textdiv">基金经理：<a href="#">黄浩平</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="#">创势翔1号</a></div>
                                </div>
                                <div class="tjs_product_textdiv">连续两年股票私募冠军，成就私募历史第一人！ </div>
                                <div class="tjs_right_btndiv">
                                    <a href="#" class="tjs_btn">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 02 -->

                            <div class="tjs_right_unit w275  tjs_backgroundgray">
                                <div class="tjs_private_icodiv">
                                    <div style="height: 23px; width: 100%;"></div>
                                    <div class="tjs_right_privatetitle chanpinjingli">
                                        <img src="assets/img/ui/user03.png" width="128" height="128" />
                                    </div>
                                    <div class="tjs_private_textbgdiv">累计收益</div>
                                    <div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">486.67</span>%</div>
                                    <div class="tjs_private_textdiv">基金经理：<a href="#">孙海宣</a></div>
                                    <div class="tjs_private_textdiv">产品名称：<a href="#">和聚1期</a></div>
                                </div>
                                <div class="tjs_product_textdiv">专注成长股，长牛私募，所有产品年化收益29%！ </div>
                                <div class="tjs_right_btndiv">
                                    <a href="#" class="tjs_btn">
                                        <img src="assets/img/ui/clock.png" />立即预约</a>
                                </div>
                            </div>
                            <!-- /tjs_right_unit 03 -->

                            <div class="clearfloat"></div>
                        </div>
                    </div>
                    <!-- /顶级私募推荐 -->
                    <div class="tjs_right_titlediv fcolor">
                        <img class="tjs_img_diamond" src="assets/img/ui/ranklist.png" />私募收益排行 
        <div class="sel_wrap">
            <label>全部策略</label>
            <select class="select">
                <option value="0">全部策略</option>
                <option value="1">股票策略</option>
                <option value="2">宏观策略</option>
                <option value="3">管理期货</option>
                <option value="4">事件驱动</option>
                <option value="5">相对价值策略</option>
                <option value="6">债券策略</option>
                <option value="7">组合基金</option>
                <option value="8">复合策略</option>
                <option value="9">其它策略</option>
            </select>
        </div>
                        <!--<select class="tjs_select">
            

        </select>-->
                        <span style="float: right;"><a href="#" class="tjs_moreurl">更多>></a></span>
                    </div>
                    <div class="tjs_coloreddiv ml0 bgcolorc"></div>
                    <div class="tjs_years">
                        <ul>
                            <li><a class="jhz_border" href="">今年以来</a></li>
                            <li><a href="">2014</a></li>
                            <li><a href="">2013</a></li>
                            <li><a href="">2012</a></li>
                            <li><a href="">2011</a></li>
                            <li><a href="">2010</a></li>
                            <li><a href="">2009</a></li>
                            <li><a href="">2008</a></li>
                            <li><a href="">2007</a></li>
                            <li><a href="">2006</a></li>
                        </ul>
                    </div>
                    <table class="tjs_table_shouyipaihang" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao">01</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao">02</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>

                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao">03</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">04</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">05</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">06</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">07</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">08</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">09</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="tjs_table_td_one">
                                <span class="tjs_xuhao hunse">10</span>
                            </td>
                            <td class="tjs_table_td_two">
                                <div class="tjs_table_div_right">
                                    <p class="tjs_table_ptitle">好运来巨牛一号</p>
                                    <p class="tjs_table_pname">曾学鑫</p>
                                    <p>巨牛投资</p>
                                </div>
                            </td>
                            <td class="tjs_table_td_three">
                                <div class="tjs_table_div_right">
                                    <p>近一年收益： ----</p>
                                    <p>近二年收益： ----</p>
                                    <p>今年以来收益：<span class="tjs_table_pname">450.64%</span></p>
                                </div>
                            </td>
                            <td class="tjs_table_td_four">
                                <p>累计收益</p>
                                <p class="tjs_num">450.<span class="tjsfont_size">64%</span></p>
                                <p><a href="#" class="tjs_btn">我要预约</a></p>
                            </td>
                        </tr>
                    </table>


                </div>
            </div>
            <!-- /tjs_product_div -->
            <!-- 私募板块结束 -->

        </div>
        <div class="tjs_footer_div">
            <div style="height: 6px; font-size: 0px; width: 100%; background-color: #959494;"></div>
            <div class="tjs_1108px center">
                <div class="tjs_footer_copyrightdiv">
                    <ul>
                        <li class="tjs_2_border"><span style="height: 45px; display: inline-block;">关于我们</span><br />
                            <a href="#">公司介绍</a><br />
                            <a href="#">股东背景</a><br />
                            <a href="#">媒体报道</a><br />
                            <a href="#">最新动态</a><br />
                        </li>
                        <li class="tjs_2_border"><span style="height: 45px; display: inline-block;">帮助中心</span><br />
                            <a href="#">新手入门</a><br />
                            <a href="#">理财问答</a><br />
                            <a href="#">使用帮助</a><br />
                        </li>
                        <li class="tjs_2_border"><span style="height: 50px; display: inline-block;">关注我们</span><br />
                            <a href="#" class="tjs_footer_sns">
                                <br />
                                <br />
                                <span>&nbsp;腾讯微博</span></a>&nbsp; <a href="#" class="tjs_footer_sina">
                                    <br />
                                    <br />
                                    <span>&nbsp;新浪微博</span></a>&nbsp; <a href="#" class="tjs_footer_blog">
                                        <br />
                                        <br />
                                        <span>&nbsp;腾讯微博</span></a> </li>
                        <li><span style="height: 40px; display: inline-block;">客服热线</span><br />
                            <span class="tjs_service_ico"></span><span style="float: left; height: 40px; line-height: 40px; display: inline-block; color: #999;">400-888-896</span><br />
                            <span style="height: 46px; line-height: 50px; display: inline-block;">在线咨询</span><br />
                            <a href="#" class="tjs_footer_qq">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>在线咨询</span></a><span style="font-size: 14px; color: #999;">08:00 - 23:00</span> </li>
                    </ul>
                </div>
                <!-- /tjs_footer_copyrightdiv -->

                <div class="tjs_footer_copyrightcontent">
                    <a href="#">商务合作</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">加入我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">免责声明</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">意见反馈</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">友情链接</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站地图</a><br />
                    淘金山互联网在线理财  版权所有 &copy; 2015-2018   粤ICP备 12068806号-1<br />
                    投资有风险，理财需谨慎
                </div>
            </div>
            <!-- /footer tjs_1108px -->
        </div>
    </div>
    <!-- /home_all -->
    <script>
        window.onload = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            //--/轮播按钮--
            //--自定义下拉框--
            $(".sel_wrap").on("change", function () {
                var o;
                var opt = $(this).find('option');
                opt.each(function (i) {
                    if (opt[i].selected == true) {
                        o = opt[i].innerHTML;
                    }
                })
                $(this).find('label').html(o);
            }).trigger('change');
            //--/自定义下拉框--
            //--表格单行变色--
            $("tr:even").css("background", "#EEEDEB");
            //--/表格单行变色--
        }
    </script>
    
    
<script>

    

</body>
</html>




















