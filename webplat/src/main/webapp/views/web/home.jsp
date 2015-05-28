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
<title>淘金山—欢迎你—跟我淘金山</title>
<link href="assets/css/ui/taojinshan.css" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />

<script src="assets/scripts/ui/jquery-1.10.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="assets/scripts/ui/Slide.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>


 <SCRIPT>
function show(c_Str,imgg)
{if(document.all(c_Str).style.display=='none')
{document.all(c_Str).style.display='block';
document.all(imgg).style.display='none'}
else{document.all(c_Str).style.display='none';
document.all(imgg).style.display='block'}}
</SCRIPT>
</head>

<body>
<div class="home_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href=""><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li><a href="#">首页</a></li>
    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
    <li><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
    <li><a href="rest/web/peizi/index" target="_blank">配资</a></li>
    <li><a href="#" target="_blank">海外保险</a></li>
    <li><a href="rest/web/aboutUs/index" target="_blank">关于我们</a></li>
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
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <li><a href="javascript:void(0)" ><img src="assets/img/ui/banner/main1.jpg"/></a></li>
                    <li><a href="javascript:void(0)" ><img src="assets/img/ui/banner/main2.jpg"/></a></li>
                </ul>
            </div>
            <div class="tjs_nav_box"><a class="prev" href="javascript:void(0)"></a><a class="next" href="javascript:void(0)"></a></div>
        </div>
        <script type="text/javascript">
            jQuery(".slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, delayTime: 700 });
        </script>
        


<div class="tjs_content_div">
<div class="tjs_1108px center">
<div class="tjs_slogan_div"><span style="font-size:42px; color:#FF6600">淘金山</span>&nbsp;&nbsp;&nbsp;是一个致力于安全保障，稳健收益的实力平台</div>
<div class="tjs_advantage_div">
<ul>
<li>
<div class="tjs_icodiv"><img src="assets/img/ui/trend_ico.png" width="120" height="120"/></div>
<div class="tjs_ico_titlediv tjs_colorblue">高额收益</div>
<div class="tjs_ico_textdiv">年化收益率高达 <span class="tjs_colororange">14.6%</span></div>
</li>
<li>
<div class="tjs_icodiv"><img src="assets/img/ui/safety_ico.png" width="120" height="120"/></div>
<div class="tjs_ico_titlediv tjs_colorgreen">安全保障</div>
<div class="tjs_ico_textdiv">本息收益 <span class="tjs_colororange">100%</span> 保障</div>
</li>
<li>
<div class="tjs_icodiv"><img src="assets/img/ui/money.png" width="120" height="120"/></div>
<div class="tjs_ico_titlediv tjs_colorcyan">优质项目</div>
<div class="tjs_ico_textdiv">收益稳健</div>
</li>
</ul>
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->
</div>
<!-- /tjs_content_div -->


<div  style=" height:26px; width:100%;"></div>
<!-- 信托板块开始 -->
<div class="tjs_product_div">
<div class="tjs_1108px center">
<div class="tjs_product_left">
<div class="tjs_tag_div">固<br />定<br />收<br />益</div>
<div class="tjs_trust_topdiv">30万起</div>
<div class="tjs_product_left_cdiv">
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_product_left_icodiv"><img src="assets/img/ui/trust_ico.png" width="132" height="160" />
<div class="tjs_left_earningsdiv">&nbsp;&nbsp;<span>8%-13%</span>&nbsp;&nbsp;收益</div>
</div>
<div class="tjs_product_textdiv">信托类产品高端人群首选，适合资金稳健
增值，收益高且稳健，30倍银行活期存款
利息，信托迄今为止本息100%兑付。</div>
</div>
</div>
<!-- /tjs_product_left -->

<div class="tjs_product_right">
<div class="tjs_right_titlediv tjs_colorblue"><span style="float:left;font-size:28px">信托</span><span style="float:right;"><a href="rest/web/xintuo/trust/trustIndex" target="_blank" class="tjs_moreurl">更多>></a></span></div>
<div class="tjs_coloreddiv"><div class="tjs_coloredorange"></div></div>

<div class="tjs_right_typle">

<c:forEach items="${xtcpData}" var="xtcp" end="2" varStatus="status">
<div class="product_div tjs_right_unit  <c:if test='${status.index<2}'>tjs_right_2border</c:if>">
<div class="tjs_right_icodiv">
<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_title">
  <tr  width="95%" >
    <td width="45" align="right"><img src="assets/img/xintuo/small/${xtcp.xtcpLog}" width="33" height="30" align="middle"/></td>
    <td align="left"><span style="font-size:16px">${xtcp.xtcpSplname}</span></td>
  </tr>
</div>
<div class="tjs_right_earningsdiv"><span class="tjs_font36px">${xtcp.xtcpNsyl}</span>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xtcp.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛： <fmt:formatNumber value="${xtcp.xtcpZdrgje}" pattern="#0.####"/>  万 | 期限： ${xtcp.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv" style="height:40px;"> ${xtcp.xtcpDp}</div>
<div class="tjs_right_btndiv"> <a href="rest/web/xintuo/trust/trustParticulars?id=${xtcp.xtcpId}" target="_blank" class="tjs_btn">了解详情</a></div>
</div>
</c:forEach>
<!-- /tjs_right_unit 01 -->

<!-- /tjs_right_unit 03 -->
<div class="clearfloat"></div>

</div>

</div>
<!-- /tjs_product_right -->





</div>


</div>
<!-- /tjs_product_div -->
<!-- 信托板块结束 -->


<div  style=" height:26px; width:100%;"></div>
<!-- 私募板块开始 -->
<div class="tjs_product_div">
<div class="tjs_1108px center">
<div class="tjs_product_left">
<div class="tjs_tag_div">浮<br />动<br />收<br />益</div>
<div class="tjs_private_topdiv">百万理财</div>
<div class="tjs_product_left_cdiv">
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_product_left_icodiv"><img src="assets/img/ui/private_ico.png" width="172" height="150" />
<div class="tjs_left_earningsdiv">&nbsp;负收益至&nbsp;<span>10倍</span>&nbsp;收益</div>
</div>
<div class="tjs_product_textdiv">私募适合追求超高收益，承 担高风险投 资者。收益可无 限放大无上限，但也可 能出 现亏损，选择时需优中选优。</div>
</div>
</div>
<!-- /tjs_product_left -->

<div class="tjs_product_right">
<div class="tjs_right_titlediv tjs_colorshallowgreen"><span style="float:left;font-size:28px">私募</span><span style="float:right;"><a href="rest/web/pe/peIndex" target="_blank" class="tjs_moreurl">更多>></a></span></div>
<div class="tjs_coloreddiv"><div class="tjs_coloredorange"></div></div>

<div class="tjs_right_typle">

<c:forEach items="${smcpData}" var="smcp"  end="2" varStatus="status">
<div class="product_div tjs_right_unit <c:if test='${status.index<2}'>tjs_right_2border</c:if>">
<div class="tjs_private_icodiv">
<div  style=" height:23px; width:100%;"></div>
<div class="tjs_right_privatetitle"> <img src="assets/img/simu/${smcp.managerLog}" width="128" height="128" /></div>
<div class="tjs_private_textbgdiv">累计收益</div>
<div class="tjs_right_privateearningsdiv"><span class="tjs_font30px">${smcp.accumulatedIncome}</span>%</div>

<div class="tjs_private_textdiv">基金经理：<a href="rest/web/pe/peIndexMDetail?managerId=${smcp.managerId}" target="_blank">${smcp.managerName}</a></div>
<div class="tjs_private_textdiv"> 产品名称：<a href="rest/web/pe/peIndexProductDetail?peProductId=${smcp.id}" target="_blank">${smcp.simpleName}</a></div>
</div>
<div class="tjs_product_textdiv" style="height:40px;">${smcp.managerReview}  </div>
<div class="tjs_right_btndiv"> <a href="rest/web/pe/peIndexProductDetail?peProductId=${smcp.id}" class="tjs_btn" target="_blank">了解详情</a></div>

</div>
</c:forEach>
<!-- /tjs_right_unit 01 -->

<!-- /tjs_right_unit 03 -->
<div class="clearfloat"></div>

</div>

</div>
<!-- /tjs_product_right -->

</div>


</div>
<!-- /tjs_product_div -->
<!-- 私募板块结束 -->

<div style=" height:26px; width:100%;"></div>

<!-- 配资板块开始 -->
<div class="tjs_product_div">
<div class="tjs_1108px center">
<div class="tjs_product_left">
<div class="tjs_tag_div">翻<br />倍<br />收<br />益</div>
<div class="tjs_match_topdiv">百元随取</div>
<div class="tjs_product_left_cdiv">
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_product_left_icodiv"><img src="assets/img/ui/match_ico.png" width="132" height="160" />
<div class="tjs_left_earningsdiv">&nbsp;&nbsp;负收益至&nbsp;<span>6倍</span>&nbsp;收益</div>
</div>
<div class="tjs_product_textdiv">配资包赚不赔，新手体验；短线投资 , 4 倍杠杆；中长线投资 , 5倍杠杆；长线投 资，月息仅0.69%</div>
</div>
</div>
<!-- /tjs_product_left -->

<div class="tjs_product_right">
<div class="tjs_right_titlediv tjs_shalloworange"><span style="float:left;font-size:28px">配资</span><span style="float:right;"><a href="#" class="tjs_moreurl">更多>></a></span></div>
<div class="tjs_coloreddiv"><div class="tjs_coloredorange"></div></div>

<div class="tjs_right_typle">

<div class="product_div tjs_right_unit tjs_right_2border">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightmatch_title"><span>包赚不赔</span><br />包赚不赔，新手体验
</div>
<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">免费赠送2000元</span>实盘资金</div>

<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">盈利全归您</span>亏损算我们</div>

<div  style=" height:45px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="rest/web/peizi/freeActivity" target="_blank" class="tjs_btn">我要配资</a></div>

</div>
<!-- /tjs_right_unit 01 -->

<div class="product_div tjs_right_unit tjs_right_2border">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightmatch_title"><span>天天赚</span><br />短线投资 , 4倍杠杆
</div>
<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">5000元</span> 起配，日息低至<span class="tjs_shalloworange">0.1%</span></div>

<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">4倍</span> 杠杆 <span class="tjs_shalloworange">4倍</span> 利润</div>

<div  style=" height:45px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="rest/web/peizi/dayCapital" target="_blank" class="tjs_btn">我要配资</a></div>

</div>
<!-- /tjs_right_unit 02 -->

<div class="product_div tjs_right_unit">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightmatch_title"><span>低息1配1</span><br />长线投资，月息仅0.69%
</div>
<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">3个月</span> 起配，月息低至 <span class="tjs_shalloworange">0.69%</span></div>

<div class="tjs_rightmatch_content"><span class="tjs_shalloworange">1倍</span> 杠杆，风险超低</div>

<div  style=" height:45px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="rest/web/peizi/lowCapital" target="_blank" class="tjs_btn">我要配资</a></div>

</div>

<!-- /tjs_right_unit 03 -->
<div class="clearfloat"></div>

</div>

</div>
<!-- /tjs_product_right -->





</div>


</div>
<!-- /tjs_product_div -->
<!-- 配资板块结束 -->


<div style=" height:26px; width:100%;"></div>
<!-- 海外保险板块开始 -->
<div class="tjs_product_div">
<div class="tjs_1108px center">
<div class="tjs_product_left">
<div class="tjs_tag_div">分<br />红<br />收<br />益</div>
<div class="tjs_foreign_topdiv">千万雄资</div>
<div class="tjs_product_left_cdiv">
<div  style=" height:26px; width:100%;"></div>
<div class="tjs_product_left_icodiv"><img src="assets/img/ui/foreign_ico.png" width="172" height="150" />
<div class="tjs_left_earningsdiv">&nbsp;&nbsp;<span>6%-17%</span>&nbsp;收益</div>
</div>
<div class="tjs_product_textdiv">信托类产品高端人群首选，适合资金稳健增值，收益高且稳健，30倍银行活期存款利息，信托迄今为止本息100%兑付。</div>
</div>
</div>
<!-- /tjs_product_left -->

<div class="tjs_product_right">
<div class="tjs_right_titlediv tjs_shalloworange"><span style="float:left;font-size:28px">海外保险</span><span style="float:right;"><a href="#" class="tjs_moreurl">更多>></a></span></div>
<div class="tjs_coloreddiv"><div class="tjs_coloredorange" style=" width:180px;"></div></div>

<div class="tjs_right_typle">

<div class="product_div tjs_right_unit tjs_right_2border">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightforeign_title"><span>危疾终身保计划</span>
  <span style="margin-top:12px;display:block"><img src="assets/img/ui/publicity_ico.png" width="206" height="114" /></span>
  </div>

<div class="tjs_foreign_textdiv">保险公司：英国保诚<br />
产品类型：危疾保障<br />
承保年龄：0周岁~100周岁</div>


<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_foreignbtn">详细信息</a>&nbsp;&nbsp;<a href="#" class="tjs_orderbtn">在线预约</a></div>

</div>
<!-- /tjs_right_unit 01 -->

<div class="product_div tjs_right_unit tjs_right_2border">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightforeign_title"><span>危疾终身保计划</span>
  <span style="margin-top:12px;display:block"><img src="assets/img/ui/publicity_ico.png" width="206" height="114" /></span>
  </div>

<div class="tjs_foreign_textdiv">保险公司：英国保诚<br />
产品类型：危疾保障<br />
承保年龄：0周岁~100周岁</div>


<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_foreignbtn">详细信息</a>&nbsp;&nbsp;<a href="#" class="tjs_orderbtn">在线预约</a></div>

</div>
<!-- /tjs_right_unit 02 -->

<div class="product_div tjs_right_unit">

<div  style=" height:36px; width:100%;"></div>
<div class="tjs_rightforeign_title"><span>危疾终身保计划</span>
  <span style="margin-top:12px;display:block"><img src="assets/img/ui/publicity_ico.png" width="206" height="114" /></span>
  </div>

<div class="tjs_foreign_textdiv">保险公司：英国保诚<br />
产品类型：危疾保障<br />
承保年龄：0周岁~100周岁</div>


<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_btndiv"> <a href="#" class="tjs_foreignbtn">详细信息</a>&nbsp;&nbsp;<a href="#" class="tjs_orderbtn">在线预约</a></div>

</div>
<!-- /tjs_right_unit 03 -->
<div class="clearfloat"></div>

</div>

</div>
<!-- /tjs_product_right -->





</div>


</div>
<!-- /tjs_product_div -->
<!-- 海外保险板块结束 -->
<div style=" height:26px; width:100%;"></div>

<!-- 合作伙伴开始 -->
<div class="tjs_partner_div">
<div class="tjs_1108px center">
<div class="tjs_partner_title">合作伙伴</div>
<div class="tjs_partner_contentdiv"> 
<ul>
<li><a href="#"><img src="assets/img/ui/LOGO01.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO02.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO03.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO04.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO05.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO06.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO07.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO08.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO09.png" width="158" height="54" alt="logo" /></a></li>
<li><a href="#"><img src="assets/img/ui/LOGO10.png" width="158" height="54" alt="logo" /></a></li>
</ul>
</div>
</div>
<!-- /tjs_content_div tjs_1108px -->
</div>
<!-- /tjs_content_div -->
<!-- 合作伙伴结束 -->


<%@ include file="/views/web/footer.jsp"%>
<!-- /footer tjs_1108px -->

</div>
<!-- /home_all -->


<script>

var IndexPage = {};

$(function() {  
	var slideboxshow = function () {
            //--轮播按钮--
            $(".slideBox").hover(function () {
                $(".prev,.next").show();
            }, function () {
                $(".prev,.next").hide();
            });
            //--/轮播按钮--
            //--自定义下拉框--
            $(".sel_wrap").click(function () {
                $(".select").toggle();
                $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
                $(".select>li").each(function (index) {
                    $(this).click(function () {
                        var opt = $(this).html();
                        $(".lbl").html(opt);
                    })
                })
                })
            //--/自定义下拉框--
            //--表格单行变色--
            $("tr:even").css("background", "#EEEDEB");
            //--/表格单行变色--
        }
        //--预约--
        IndexPage.alertbox = function() {
            alertMsg("<div class='capacity'>预约</div><div class='alert_in_box'><p>姓名：<input id='alert_name' placeholder='请输入中文姓名' type='text'/></p><p>电话：<input id='alert_tel' placeholder='请输入联系电话' type='text'/></p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>", 1);
        }
        //--/预约--
        
        var hoverproduct = function(){
        	$(".product_div").hover(function () {
                $(this).addClass("tjs_backgroundgray");
            }, function () {
            	$(this).removeClass("tjs_backgroundgray");
            });
        }
		   
		   
		slideboxshow();
		hoverproduct();
		});
	</script>
        

</body>
</html>