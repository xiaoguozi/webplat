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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>淘金山-跟我淘金山</title>
    <script type="text/javascript" src="<%=basePath%>assets/scripts/ui/jquery.js"></script>
    <link href="<%=basePath%>assets/css/ui/taojinshan_about.css" rel="stylesheet" media="screen" type="text/css" />
	<link href="<%=basePath%>assets/css/ui/about.css" rel="stylesheet" />
</head>
<body>
<div class="home_all">
        <%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="<%=basePath%>">
                        <img src="<%=basePath%>assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu_main menu">
                    <ul>
                        <li><a href="<%=basePath%>">首页</a></li>
					    <li><a href="<%=basePath%>rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li><a href="<%=basePath%>rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li><a href="<%=basePath%>rest/web/peizi/index" target="_blank">配资</a></li>
					    <li><a href="#" target="_blank">海外保险</a></li>
					    <li><a href="http://academy.taojinshan.com.cn/portal.php" target="_blank">淘金学院</a></li>
					    <li><a href="<%=basePath%>rest/web/aboutUs/index" target="_blank">关于我们</a></li>
                    </ul>                    
                </div>
            </div>
        </div>
</div>
<!--/  导航-->
<!-- 内容-->
    <img src="<%=basePath%>assets/img/about/imgbg.jpg" style="display: block; overflow: hidden;width:100%" alt="" />
    <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="<%=basePath%>" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="<%=basePath%>rest/web/aboutUs/index" class="path_item">关于我们</a> <span class="sep">&gt;</span> <span class="txt">人才招聘</span> </div>
        </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="gywm_left">
                <ul>
                    <li><a href="<%=basePath%>rest/web/aboutUs/index">公司简介</a></li>
                    <li><a href="<%=basePath%>rest/web/aboutUs/team">管理团队</a></li>
                    <li><a href="<%=basePath%>rest/web/aboutUs/jobs" class="on">人才招聘</a></li>
                    <li><a href="<%=basePath%>rest/web/aboutUs/contact">联系我们</a></li>
                    <li><a href="<%=basePath%>rest/web/aboutUs/partner">商户合作</a></li>
                </ul>
            </div>
            <div class="gywm_right">
                <div class="gywm_title rczp">人才招聘</div>
                <div class="boxbg gywm_box" style="height:auto;">
                    <table class="tbl3">
                        <tr>
                            <td>淘金山是一个有爱的团队，真诚与责任为我们所推崇。<br />
                                在这里，工作绝不轻松，但你能收获快乐、成长和志同道合的伙伴。<br />
                                加入淘金山，有成长，有未来！<br />
                                加入淘金山，你将获得：<br />
                                物质方面：期权(人人都能成为淘金山股东)；<br />
                                精神方面：将获得大家庭的温暖，与团队共同成长的喜悦。

                            </td>
                            <td class="emailcolor">请发送您的简历至taojinshan88@163.com</td>
                        </tr>
                    </table>
                </div>
                <div class="gywm_title yzgw">应招岗位</div>
                <table class="tbl1 rczpin">
                    <thead>
                    <tr>
                        <td class="color158"><img src="<%=basePath%>assets/img/about/cpyy.png" alt="" />产品运营类</td>
                        <td class="color158"><img src="<%=basePath%>assets/img/about/yfl.png" alt="" />研发类</td>
                        <td class="color158"><img src="<%=basePath%>assets/img/about/kfqt.png" alt="" />客服及其他</td>
                    </tr>
                   </thead>
                    <tbody>
                    <tr>
                        <td>
                            <a class="dbock rcbtn" href="#zp1">金融产品经理</a>
                            <a class="dbock rcbtn" href="#zp2">理财经理</a>
                            <a class="dbock rcbtn" href="#zp3"">企划经理</a>

                        </td>
                        <td>--</td>
                        <td>--</td>
                    </tr>
                    </tbody>
                </table>
                <table class="tbl3 zp_list">
                    <tr>
                        <td colspan="2"><span class="font18" style="color:#000">产品运营类</span><br /><a id="zp1" name="zp1">金融产品经理</a></td>
                    </tr>
                    <tr>
                        <td class="colorf06">岗位职责</td>
                        <td class="color158">任职资格</td>
                    </tr>
                    <tr>
                        <td>1、与各大信托公司、资管公司、基金公司建立良好合作关系，引进信托、资管、私募等产品；<br />
                            2、收集市场各类理财产品，及时了解行业政策与动态；<br />
                            3、负责对公司新引入产品进行培训及跟进；<br />
                        </td>
                        <td>1、本科或以上学历，金融、经济、财务等相关专业者优先；<br />
                            2、有信托、资管、基金等相关经验者优先；<br />
                            3、具有良好的学习和沟通能力及抗压能力；<br />
                        </td>
                    </tr>
                </table>
                <table id="zp2" class="tbl3 zp_list">
                    <tr>
                        <td colspan="2"><span>理财经理</span></td>
                    </tr>
                    <tr>
                        <td class="colorf06">岗位职责</td>
                        <td class="color158">任职资格</td>
                    </tr>
                    <tr>
                        <td>1、负责为客户提供理财产品咨询、建议服务，制定相应的投资组合和策略 <br />
                            2、负责保持与客户沟通联系，并积极开发新的销售渠道和客户<br />
                            3、负责为客户提供完善的理财计划及信息咨询 <br />
                            4、负责根据客户的委托，帮助客户实施理财计划 <br />
                            5、负责对公司理财产品能够全力宣传、推广、销售 <br />
                            6、负责为重要客户需求提供理财咨询，制定合理的财务计划 <br />
                            7、负责维持重要客户关系，通过与客户沟通，及时调整客户的财务安排 
                        </td>
                        <td>1、本科及以上学历，金融、财务、管理等相关专业 <br />
                            2、具有投资、募资及上市公司操作经验者优先 <br />
                            3、熟悉信托、基金等金融产品的运作流程 <br />
                            4、熟练掌握个人及家庭理财相关知识和技能 <br />
                            5、具有优秀的沟通能力、团队协作精神以及分析研究能力 <br />
                            6、具有团队协作精神
                        </td>
                    </tr>
                </table>
                <table id="zp3" class="tbl3 zp_list">
                    <tr>
                        <td colspan="2"><span>企划经理</span></td>
                    </tr>
                    <tr>
                        <td class="colorf06">岗位职责</td>
                        <td class="color158">任职资格</td>
                    </tr>
                    <tr>
                        <td>1、专业人员职位，在上级的领导和监督下定期完成量化的工作要求，并能独立处理和解决所负责的任务；<br />
                            2、负责各项推广活动的会前准备、会后整理；<br />
                            3、收集活动反馈信息；<br />
                            4、具体实施制作各种宣传材料、项目说明书、销售支持材料等<br />
                            5、管理各种推广档案资料。<br />
                        </td>
                        <td>1、市场营销管理类或相关专业专科以上学历，女性；<br />
                            2、具有金融行业的从业背景者优先，有市场策划工作经验；
                            3、优秀的文案功底，有较强的创造性思维能力、创意概念及良好的沟通能力；<br />
                            4、了解市场动态，依据市场变化适时策划制定整体促销方案，策划定期的促销活动；<br />
                            5、有一定的组织实施经验，监督、指导、落实促销活动的执行，有成功的策划案例者优先；<br />
                            6、有综合运用包括广告策划、软文宣传、公关活动等在内的各种营销方式进行市场宣传、品牌推广的能力；<br />
                            7、熟练操作办公软件。<br />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="clear"></div>
<!--/ 内容-->
<!--  页脚-->
<footer>
<div class="footer_bg">
    <div class="tjs_1108px center">
        <div class="foot_menu">
            <p class="menu_title">关于我们</p>
            <ul class="foot_menu1">
                <li><a href="<%=basePath%>rest/web/aboutUs/index" target="_blank">><span>公司简介</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/team" target="_blank">><span>管理团队</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/jobs" target="_blank">><span>人才招聘</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/contact" target="_blank">><span>联系我们</span></a></li>
                <li><a href="<%=basePath%>rest/web/aboutUs/partner" target="_blank">><span>商户合作</span></a></li>
            </ul>
        </div>
        <div class="foot_menu">
            <p class="menu_title">帮助中心</p>
            <ul class="foot_menu1">
                <li><a href="">><span>新手入门</span></a></li>
                <li><a href="">><span>理财问答</span></a></li>
                <li><a href="">><span>试用帮助</span></a></li>
            </ul>
        </div>
        <div class="foot_menu">
            <p class="menu_title">关注我们</p>
            <ul class="foot_menu1">
                <img src="<%=basePath%>assets/img/ui2/aboutimg.png" alt=""/>
            </ul>
        </div>
        <div class="foot_about_box">
            <ul class="about_box1">
                <li><img class="addr_home" src="<%=basePath%>assets/img/ui2/home.png" alt=""></li><li><span>联系地址</span></li><li class="w217">深圳市福田区福强路4001号文化创意园A座6层
（地铁龙岗线益田站D出口）</li>
            </ul>
            <ul class="about_box1">
                <li><img class="addr_home" src="<%=basePath%>assets/img/ui2/phone.png" alt=""></li><li><span>热线电话</span></li><li class="w217 lh40">4006-114-088</li>
            </ul>
            <ul class="about_box1">
                <li><img class="addr_home qq" src="<%=basePath%>assets/img/ui2/qq.png" alt=""></li><li><span class="zx">在线咨询</span></li><li class="w217 lh40">08:00-23:00</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="footers">
    <p class="pt25">投资有风险，理财需谨慎</p>
    <p>淘金山互联网在线理财 版权所有 © 2015-2018 粤ICP备 15026551号-1
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1255221274'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1255221274%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
	</p>
</div>
</footer>
</body>
</html>
