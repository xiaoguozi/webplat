<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘金山-个人中心</title>
<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet"
	media="screen" type="text/css" />
<!--配资页面样式-->
<link href="assets/css/ui/peizi.css" rel="stylesheet" />
<link href="assets/css/ui-dialog.css" rel="stylesheet" />
<script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
<script
	src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"
	type="text/javascript"></script>
<script
	src="assets/plugins/jquery-validation/localization/messages_zh.js"
	type="text/javascript"></script>
<script src="app/lib/security/sha256.js" type="text/javascript"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<script src="assets/scripts/ui/dialog-min.js" charset="utf-8"></script>
</head>
<body>
	<div class="home_all">
		<%@ include file="/views/web/header.jsp"%>
		<!-- /header_top -->

		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
				<div class="logo_wrap">
					<a href=""> <img src="assets/img/ui/tjs_logo.png" width="338"
						height="94" align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu menu">
					<ul>
						<c:if test="${isLog!='true'}">
							<li st><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
							<li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
							<li><a href="rest/web/peizi/usercenter/pzzhongxin"><span
									class="simu_on">个人中心</span></a></li>
							<li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
						</c:if>

						<c:if test="${isLog=='true'}">
							<li style="width: 115px"><a href="#">首页</a></li>
							<li style="width: 115px"><a
								href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
							<li style="width: 115px"><a href="rest/web/pe/peIndex"
								target="_blank">私募</a></li>
							<li style="width: 115px"><a href="rest/web/peizi/index"
								target="_blank">配资</a></li>
							<li style="width: 115px"><a href="#" target="_blank">海外保险</a></li>
							<li style="width: 115px"><a href="rest/web/aboutUs/index"
								target="_blank">关于我们</a></li>
						</c:if>

					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->
		<!--二级导航-->
		<div class="nav_box1">
			<ul class="nav_menu" style="width: 98px;">
				<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
				<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
				<li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
				<li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
				<li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
			</ul>
		</div>
		<!--/二级导航-->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="rest/web/userCenter/index"
					class="path_item">个人中心</a> <span class="sep">&gt;</span> <span
					class="txt">充值</span>
			</div>
		</div>
		<div class="w100bg" >
			<hr class="pc" />
			<div class="tjs_1108px center">
				<div class="bgcolor">
					<div class="mycenter_left">
						<ul class="mc_lbox">
							<li>可用余额</li>
							<li class="colorf06 font18 lh10 ">0.00元</li>
							<li><a class="tjs_btn pzbtn" href="javascript:void()"><b>¥</b>
									充值</a></li>


							<li class="wypz">我的配资</li>
							<div class="ttp wypz_div" style="display: none">
								<span class="bor_dashed"><a
									href="rest/web/peizi/usercenter/mfp">免费配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/mfp">免息配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/ttpUserCenter">天天配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/yypUserCenter">月月配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/dxpUserCenter">低息1配1</a></span>
							</div>

							<li class="wdzj">我的资金</li>
							<div class="bor_dashed moneymx" style="display: none">
								<a href="javascript:void()">资金明细</a>
							</div>

							<li class="zlsz">资料设置</li>
							<div class="bor_dashed  mmxg">
								<a href="rest/web/userCenter/userModify" style="color: #ff6600">个人信息</a>
							</div>


						</ul>
					</div>
					<script>
						$(function() {

							$(".wypz").click(function() {
								$(".ttp").slideToggle(500);
							});
							$(".wdzj").click(function() {
								$(".moneymx").slideToggle(300);
							});

							$(".zlsz").click(function() {
								$(".mmxg").slideToggle(300);
							});

						})
					</script>
					<div class="mycenter_right" id="mycenter_right">
						<h2 class="space-right-h2">
							<strong>账户充值</strong>
						</h2>

						<div class="l_recharge"
							style="height: 200px; background: #f6f6f6; margin-right: 15px;">
							<div class="login_wrap l_mat clr">
								<div class="l_login_t l_ft18">账户余额：</div>
								<div class="fl">
									<div class="l_fc3709" style="width: 100%;">
										<span id="usableSum">0.00</span>元
									</div>
								</div>
								<br>
									<div class="login_wrap l_mat clr">
										<div class="l_login_t">充值金额 ：</div>
										<div class="fl">
											<div class="login_input l-w286" style="line-height: 43px;">
												<input id="rechargeAmount" style="margin-top: 1px;"
													name="amount" type="text" maxlength="12" value="请输入金额（元）"
													init-data="请输入金额（元）" autocomplete="false"
													onfocus="if(this.value=='请输入金额（元）'){this.value='';}"
													onblur="if(this.value==''){this.value='请输入金额（元）';}else{$('#rechargeAmountError').hide();}"
													onkeyup="value=value.replace(/[^\d]/g,'') "
													onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
													>
											</div>
											<p id="rechargeAmountError" class="m_login_txt1 dsn"
												style="display: none">输入错误</p>
										</div>
									</div>
									<div class="login_wrap l_mat clr">
										<p id="rechargeError" class=" m_login_txt1 m_dsn"
											style="display: none">输入错误</p>
										<a id="aSubmit" href="javascript:void(0);" target="_blank"
											class="mt10 btn_capital capital" style="margin-top: 50px;">立即充值
										</a>
									</div>
							</div>
						</div>
							
						<div style="margin-top: 20px; margin-bottom: 20px;">选择银行</div>
						<div style="height: 350px;">
							<UL id="radioImage" class="bank_list l_bank_list  clr">
								<LI id="yh1" onclick="yhxz(1);"><I><INPUT
										name="pdFrpId" checked="checked" value="BOC-NET-B2C"
										type="radio"></I>
									<P>
										<IMG alt="中国银行" src="assets/img/zhifu/zhongguo.gif">
									</P></LI>
								<LI id="yh2" onclick="yhxz(2);"><I><INPUT
										name="pdFrpId" value="CMBCHINA-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="招商银行" src="assets/img/zhifu/zhaohang.gif">
									</P></LI>
								<LI id="yh3" onclick="yhxz(3);"><I><INPUT
										name="pdFrpId" value="CCB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国建设银行" src="assets/img/zhifu/jianshe.gif">
									</P></LI>
								<LI id="yh4" onclick="yhxz(4);"><I><INPUT
										name="pdFrpId" value="ICBC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国工商银行" src="assets/img/zhifu/gongshang.gif">
									</P></LI>
								<LI id="yh5" onclick="yhxz(5);"><I><INPUT
										name="pdFrpId" value="ABC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国农业银行" src="assets/img/zhifu/nongye.gif">
									</P></LI>
								<LI id="yh6" onclick="yhxz(6);"><I><INPUT
										name="pdFrpId" value="POST-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国邮政储蓄银行" src="assets/img/zhifu/youzheng.gif">
									</P></LI>
								<LI id="yh7" onclick="yhxz(7);"><I><INPUT
										name="pdFrpId" value="ECITIC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中信银行" src="assets/img/zhifu/zhongxin.gif">
									</P></LI>
								<LI id="yh8" onclick="yhxz(8);"><I><INPUT
										name="pdFrpId" value="CEB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国光大银行" src="assets/img/zhifu/guangda.gif">
									</P></LI>
								<LI id="yh9" onclick="yhxz(9);"><I><INPUT
										name="pdFrpId" value="CIB-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="兴业银行" src="assets/img/zhifu/xingye.gif">
									</P></LI>
								<LI id="yh10" onclick="yhxz(10);"><I><INPUT
										name="pdFrpId" value="BOCO-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="交通银行" src="assets/img/zhifu/jiaotong.gif">
									</P></LI>
								<LI id="yh11" onclick="yhxz(11);"><I><INPUT
										name="pdFrpId" value="SPDB-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="浦发银行" src="assets/img/zhifu/shangpufa.gif">
									</P></LI>
								<LI id="yh12" onclick="yhxz(12);"><I><INPUT
										name="pdFrpId" value="HXB-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="华夏银行" src="assets/img/zhifu/huaxia.gif">
									</P></LI>
								<LI id="yh13" onclick="yhxz(13);"><I><INPUT
										name="pdFrpId" value="PINGANBANK-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="平安银行" style="margin-top: 0px;"
											src="assets/img/zhifu/pingan.gif">
									</P></LI>
								<LI id="yh14" onclick="yhxz(14);"><I><INPUT
										name="pdFrpId" value="SHB-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="上海银行" style="margin-top: 0px;"
											src="assets/img/zhifu/shanghaibank.gif">
									</P></LI>
								<LI id="yh15" onclick="yhxz(15);"><I><INPUT
										name="pdFrpId" value="SDB-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="深圳发展银行" style="margin-top: 0px;"
											src="assets/img/zhifu/shenfa.gif">
									</P></LI>
								<LI id="yh16" onclick="yhxz(16);"><I><INPUT
										name="pdFrpId" value="CMBC-NET-B2C" type="radio"></I>
									<P style="height: 33px;">
										<IMG alt="民生银行" style="margin-top: 0px;"
											src="assets/img/zhifu/minsheng.gif">
									</P></LI>
							</UL>
						</div>
						
						
					</div>
				</div>

			</div>
		</div>
		<hr class="pc" />
	</div>
	<!-- 配资页尾 -->
	<%@ include file="/views/web/footer.jsp"%>
	<!-- 配资页尾 结束 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$("#aSubmit").click(function(e){
				e.preventDefault();
				if($("#rechargeAmount").val()=="" || $("#rechargeAmount").val()=="请输入金额（元）"){
					$("#rechargeAmountError").show();
					$("#rechargeAmountError").html("请输入充值金额");
					return false;
				}else{
					$("#rechargeAmountError").hide();
				}
				var callbackUrl = "<%=basePath%>rest/web/userCenter/zhifu/callback";
				var pdFrpId = $("input:radio[name=pdFrpId]:checked").val();
				var payUrl = "<%=basePath%>rest/web/userCenter/zhifu/epay?pdFrpId="+pdFrpId
						+"&rechargeAmount="+$("#rechargeAmount").val()
						+"&callbackUrl="+callbackUrl;
				window.open(payUrl, "_blank");
				
				var dialogContent = "<div class=\"l1\"> ";
				dialogContent += "<p><span>充值完成前，请不要关闭此窗口<br>";
				dialogContent += " 操作完成后，请根据您的充值的情况点击下面按钮</span></p>";
				dialogContent += "<div class=\"btn-box\" style=\"float:right;\">";
				dialogContent += "<button type=\"button\" class=\"btn2 btn\" id=\"chargeFailed\">充值遇到问题</button>";
				dialogContent += "<button type=\"button\" class=\"btn2\" id=\"chargeSuccess\">充值完成</button>";
				dialogContent += "</div></div>";
				
				var d = dialog({
				    title: '账户充值提示',
				    content: dialogContent
				});
				d.showModal();
				
			});
			
		});
	
		function yhxz(num){
			
			$("input:radio[name=pdFrpId]").attr("checked",false);
			$("input:radio[name=pdFrpId]")[num-1].checked = true;
			
		}
	</script>
</body>
</html>