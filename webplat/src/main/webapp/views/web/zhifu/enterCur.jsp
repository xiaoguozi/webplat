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
							
							<li class="wypz">我的配资</li>
							<div class="ttp wypz_div">
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
							<div class="moneymx">
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/addbank">银行卡</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur" style="color: #ff6600">充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex">提现</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/fundHistory">资金明细</a></span>
                           </div>

							<li class="zlsz">资料设置</li>
							<div class="bor_dashed  mmxg">
							  <span class="bor_dashed">
								<a href="rest/web/userCenter/userModify" >个人信息</a>
							   </span>
							   <span class="bor_dashed">
	                        		<a href="rest/web/userCenter/myRecommend">我的推荐</a>
	                        	</span>
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
							<strong>账户充值</strong> <span style="margin-left: 20px; font-size: 13px; font-weight:normal; cursor: pointer;"><a href="rest/web/userCenter/zhifu/rechargeHistory">查看历史记录</a></span>
						</h2>

						<div style="margin-top: 20px; margin-bottom: 20px;">选择银行</div>
						<div style="height: 300px;">
							<UL id="radioImage" class="bank_list l_bank_list  clr">
								<LI id="yh1" onclick="yhxz(1);"><I><INPUT
										name="pdFrpId" checked="checked" value="BOC-NET-B2C"
										type="radio"></I>
									<P>
										<IMG alt="中国银行" src="assets/img/zhifu/banks/zhongguo.png">
									</P></LI>
								<LI id="yh2" onclick="yhxz(2);"><I><INPUT
										name="pdFrpId" value="CMBCHINA-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="招商银行" src="assets/img/zhifu/banks/zhaohang.png">
									</P></LI>
								<LI id="yh3" onclick="yhxz(3);"><I><INPUT
										name="pdFrpId" value="CCB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国建设银行" src="assets/img/zhifu/banks/jianshe.png">
									</P></LI>
								<LI id="yh4" onclick="yhxz(4);"><I><INPUT
										name="pdFrpId" value="ICBC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国工商银行" src="assets/img/zhifu/banks/gongshang.png">
									</P></LI>
								<LI id="yh5" onclick="yhxz(5);"><I><INPUT
										name="pdFrpId" value="ABC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国农业银行" src="assets/img/zhifu/banks/nongye.png">
									</P></LI>
								<LI id="yh6" onclick="yhxz(6);"><I><INPUT
										name="pdFrpId" value="POST-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国邮政储蓄银行" src="assets/img/zhifu/banks/youzheng.png">
									</P></LI>
								<LI id="yh7" onclick="yhxz(7);"><I><INPUT
										name="pdFrpId" value="ECITIC-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中信银行" src="assets/img/zhifu/banks/zhongxin.png">
									</P></LI>
								<LI id="yh8" onclick="yhxz(8);"><I><INPUT
										name="pdFrpId" value="CEB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="中国光大银行" src="assets/img/zhifu/banks/guangda.png">
									</P></LI>
								<LI id="yh9" onclick="yhxz(9);"><I><INPUT
										name="pdFrpId" value="CIB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="兴业银行"  src="assets/img/zhifu/banks/xingye.png">
									</P></LI>
								<LI id="yh10" onclick="yhxz(10);"><I><INPUT
										name="pdFrpId" value="BOCO-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="交通银行" src="assets/img/zhifu/banks/jiaotong.png">
									</P></LI>
								<LI id="yh11" onclick="yhxz(11);"><I><INPUT
										name="pdFrpId" value="SPDB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="浦发银行" src="assets/img/zhifu/banks/shangpufa.png">
									</P></LI>
								<LI id="yh12" onclick="yhxz(12);"><I><INPUT
										name="pdFrpId" value="HXB-NET-B2C" type="radio"></I>
									<P>
										<IMG alt="华夏银行" src="assets/img/zhifu/banks/huaxia.png">
									</P></LI>
								<LI id="yh13" onclick="yhxz(13);"><I><INPUT
										name="pdFrpId" value="PINGANBANK-NET-B2C" type="radio"></I>
									<P style="height:37px;">
										<IMG alt="平安银行" 
											src="assets/img/zhifu/banks/pingan.png">
									</P></LI>
								<LI id="yh14" onclick="yhxz(14);"><I><INPUT
										name="pdFrpId" value="SHB-NET-B2C" type="radio"></I>
									<P style="height:37px;">
										<IMG alt="上海银行" 
											src="assets/img/zhifu/banks/shanghaibank.png">
									</P></LI>
								<LI id="yh15" onclick="yhxz(15);"><I><INPUT
										name="pdFrpId" value="BCCB-NET-B2C" type="radio"></I>
									<P style="height:37px;">
										<IMG alt="北京银行" 
											src="assets/img/zhifu/banks/beijing.png">
									</P></LI>
								<LI id="yh16" onclick="yhxz(16);"><I><INPUT
										name="pdFrpId" value="CMBC-NET-B2C" type="radio"></I>
									<P style="height:37px;">
										<IMG alt="民生银行" 
											src="assets/img/zhifu/banks/minsheng.png">
									</P></LI>
							</UL>
						</div>
						
						<div style="height: 230px; background: #f6f6f6; margin-right: 15px; margin-bottom: 20px;">
								<div style="height: 30px; margin-right: 15px;"></div>
								<div style="height: 50px; margin-right: 15px;">  
									<div style="height: 50px; width:330px; float:left; text-align: right; margin-right: 10px;"><span style="font-size: 18px; color: #000;">账户余额：</span></div>
									<div style="height: 50px; width:500px; float:left; "><span id="totalFund" style="font-size: 18px; color: red;"><fmt:formatNumber value="${usableFund}" pattern="########.##" />元</span></div>
								</div>
								<div style="height: 43px; margin-right: 15px;">  
									<div style="height: 43px; width:330px; float:left;  text-align: right; margin-right: 12px;">
										<div style="height: 10px;"></div>
										<div style="height: 33px;"><span style="font-size: 16px;">充值金额 ：</span></div>
									</div>
									<div style="height: 43px; width:294px; float:left; " class="login_input">
										<input id="rechargeAmount" style="margin-top: 0px;"
													name="amount" type="text" maxlength="12" value="请输入金额（元）"
													init-data="请输入金额（元）" autocomplete="false"
													onfocus="if(this.value=='请输入金额（元）'){this.value='';}"
													onblur="if(this.value==''){this.value='请输入金额（元）';}else{$('#rechargeAmountError').hide();}"
													onkeyup="clearNoNum(this);"
													onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
													>
													
									</div>
								</div>
								<div style="height: 25px; margin-right: 15px;">  
									<div style="height: 25px; width:330px; float:left; text-align: right; margin-right: 10px;"></div>
									<div style="height: 25px; width:500px; float:left; ">
									<p id="rechargeAmountError" class="m_login_txt1 dsn" style="display: none; margin-top: 8px; margin-left: 5px;">输入错误</p></div>
								</div>
								<div style="height: 50px; margin-right: 15px;">  
									<div style="height: 10px; "> </div>
									<div style="height: 40px; width:330px; float:left; margin-right: 12px;"></div>
									<div style="height: 40px; width:500px; float:left; ">
										<a id="aSubmit" href="javascript:void(0);" target="_blank"
											class="btn_capital" >立即充值
										</a>
									</div>
								</div>
						</div>
					</div>
				</div>

			</div>
		<hr class="pc" />
	</div>
	<!-- 配资页尾 -->
	<%@ include file="/views/web/footer.jsp"%>
	</div>
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
					$("#rechargeAmountError").html("");
					$("#rechargeAmountError").hide();
				}
				
				if(parseFloat($("#rechargeAmount").val())<=0){
					$("#rechargeAmountError").html("充值金额必须大于0");
					$("#rechargeAmountError").show();
					return false;
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
				
				$("#chargeFailed").click(function(){
					d.close().remove();
				});
				
				$("#chargeSuccess").click(function(){
					d.close().remove();
					window.location.href = '<%=basePath%>rest/web/userCenter/zhifu/fundHistory';
				});
			});
			
			
			
		});
		
		//保证输入数字
		function clearNoNum(obj){
			//先把非数字的都替换掉，除了数字和.
			obj.value = obj.value.replace(/[^\d.]/g,"");
			//必须保证第一个为数字而不是.
			obj.value = obj.value.replace(/^\./g,"");
			//保证只有出现一个.而没有多个.
			obj.value = obj.value.replace(/\.{2,}/g,".");
			//保证.只出现一次，而不能出现两次以上
			obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
			//保留两位小数
			var dotIndex = obj.value.indexOf(".");
			var length = obj.value.length;
			if(dotIndex!=-1){
				if(length-dotIndex>3){
					obj.value = obj.value.substring(0, dotIndex+3);
				}
			}
		}
	
		function yhxz(num){
			
			$("input:radio[name=pdFrpId]").attr("checked",false);
			$("input:radio[name=pdFrpId]")[num-1].checked = true;
			
		}
	</script>
</body>
</html>