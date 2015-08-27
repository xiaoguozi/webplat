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
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu_main menu">
                    <ul>
                        <li><a href="">首页</a></li>
					    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li><a href="rest/web/peizi/index" target="_blank">配资</a></li>
					    <li><a href="rest/web/Kybx/kybxIndex" target="_blank">海外保险</a></li>
					    <li><a href="http://academy.taojinshan.com.cn/portal.php" target="_blank">淘金学院</a></li>
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
        <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/aboutUs/index" class="path_item">关于我们</a> <span class="sep">&gt;</span> <span class="txt">管理团队</span> </div>
    </div>
    <div class="w100bg">
        <div class="tjs_1108px center">
            <div class="gywm_left">
                <ul>
                    <li><a href="rest/web/aboutUs/index">公司简介</a></li>
                    <li><a href="rest/web/aboutUs/team"  class="on">管理团队</a></li>
                    <li><a href="rest/web/aboutUs/jobs">人才招聘</a></li>
                    <li><a href="rest/web/aboutUs/contact">联系我们</a></li>
                    <li><a href="rest/web/aboutUs/partner">商户合作</a></li>
                </ul>
            </div>
            <div class="gywm_right">
                <div class="gywm_title tdgl">管理团队</div>
                <div class="whitebg">
                    <div class="font_title">越努力越幸运，经过长久的发展，在全体同仁的努力下，团队实力不断增强</div>
                    <span class="bdline"></span>
                    <!--  
                    <table class="tbl2 mt20">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">吴 田</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">CEO</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于安徽财经大学，经济学学士，高级理财规划师。<br />
                                曾就职华泰证券、生命人寿、恒星财富。多年扎根于金融领域，深入的业务开展和管理实践，在高净值客户资产管理与风险控制多方面积累了丰富经验。具备敏锐的市场洞察力、快速的市场反应能力和丰富的团队组建和领导经验。敏锐的互联网创新思维和丰富的自主创业经验，致力于改造和重塑传统金融服务模式和效率。</td>
                        </tr>
                    </table>
                    <table class="tbl2">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">蹇永华</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">执行董事</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于天津大学，曾任职荷兰银行，苏格兰皇家银行。带领团队组建华安财富；联合多方资源筹建恒星财富，在深圳财富管理行业具备丰富资源及影响力。10年金融行业从业经验，证券从业，银行从业，保险从业多项资格。银行合作资源丰富，行业人脉资源广泛。<br />
                                · 中国文学艺术基金会中国陶瓷艺术基金副主任，深圳办事处秘书长；<br />
                                · 深圳中文控股有限公司董事总经理；<br />
                                · 深圳华锦投资控股有限公司（文化物权深圳文交所挂牌企业）董事总经理。
                            </td>
                        </tr>
                    </table>
                    <table class="tbl2">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">黄玉珍</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">COO</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于首都经贸大学，证券投资分析师，曾就职华泰证券、日信证券，曾筹建大唐财富深圳分公司，具有10年金融行业从业经验。<br />
                                拥有大量高端客户群体，行业人脉资源广泛。熟悉中高端客户多种金融服务业务，对金融产品风险控制拥有丰富经验。</td>
                        </tr>
                    </table>
                    <table class="tbl2">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">周辉</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">CTO</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于吉首大学，7年互联网及企业级管理软件研发经验。<br />
                                曾就职于国外知名互联网公司funmobile,具备丰富的研发及管理经验，有带领大型研发团队从新产品需求、设计、开发、运营整体闭环管理经验。先后负责或参与过affilate、chartroom、trivial、企业级资产管理等互联网平台,对团队管理、产品规划及设计、研发、运营拥有丰富经验。<br />
                                2004年与室友一起创建大学生部落论坛，早期个人站长。<br />
                                2013年与大学室友合伙创建查询啦站点，高峰期站点日访问量PV：20万以上。 </td>
                        </tr>
                    </table>
                    <table class="tbl2">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">徐钦</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">产品总监</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于石家庄铁道学院，金融学专业。证券投资分析师。曾就职金融界、安好财富。多年财富管理经验，具有开放的互联网思维及全面的金融理论基础，熟悉互联网理财服务运作模式。
拥有各大信托、资产管理公司、私募、基金等高端人脉资源。具备优秀的金融理财产品创新能力，尤其对金融与互联网相结合创新类理财产品有深入研究。</td>
                        </tr>
                    </table>
                    <table class="tbl2">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">罗忠山</b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">市场总监</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于南昌航空大学。曾就职华安财富，安好财富、恒星财富。在互联网和金融行业拥有多年市场营销策划和团队管理经验。<br />
                                与国内众多财富管理机构、券商、银行及商会有较紧密的合作关系，善于洞察高净值客户理财需求，为客户定制专业的资产配置计划。</td>
                        </tr>
                    </table>
                    <table class="tbl2" style="border-bottom: none">
                        <tr>
                            <td rowspan="3">
                                <img width="220" height="300" src="assets/img/about/user.jpg" alt="" /></td>
                            <td class="tdname"><b class="name">周绍林 </b></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"><b class="ceo">销售总监</b></td>
                        </tr>
                        <tr>
                            <td class="p_cont">毕业于太原理工大学。曾就职于银河证券，安好财富。<br />
                                具有多年金融行业的营销经验。拥有大量高端客户群体，行业人脉资源广泛。具备专业的金融知识和资深的客户开发及管理能力。</td>
                        </tr>
                    </table>
                    -->
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
