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
<link href="assets/css/ui/zhifu.css" rel="stylesheet"
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
							<li class="colorf06 font18 lh10 "><fmt:formatNumber value="${usableFund}" pattern="########.##" />元</li>
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
							<div class="moneymx">
                        	<span class="bor_dashed"><a href="javascript:void()">银行卡</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur" >充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex" style="color: #ff6600">提现</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/fundHistory">资金明细</a></span>
                           </div>

							<li class="zlsz">资料设置</li>
							<div class="bor_dashed  mmxg">
							  <span class="bor_dashed">
								<a href="rest/web/userCenter/userModify" >个人信息</a>
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
							<strong>账户提现</strong><span style="margin-left: 20px; font-size: 13px; font-weight:normal; cursor: pointer;"><a href="rest/web/userCenter/zhifu/rechargeHistory">查看提现记录</a></span>
						</h2>
              			<form id="modalForm" action="rest/web/userCenter/zhifu/rechargeHistory" method="post" >
              				<input name="pageNo" type="hidden" value="${rechargeCtrlModel.pageNo}"/>
							<input name="pageSize" type="hidden" value="${rechargeCtrlModel.pageSize }"/>
              			</form>
              			<p style="line-height: 28px; vertical-align: baseline; margin-top: 30px; ">
              				<label for="" style="width:130px;line-height: 28px; margin-left: 70px;">账户余额：</label>
              				<span id="usableFund" style="color: #18b160; font-size: 18px; font-weight: bold;">￥467.37</span>
              			</p>
              			<p style="line-height: 28px; vertical-align: baseline; margin-top: 10px; ">
              				<label for="" style="width:130px;line-height: 28px; margin-left: 56px;">可提现金额：</label>
              				<span id="usableFund" style="color: #18b160; font-size: 18px; font-weight: bold;">￥467.37</span>
              			</p>
              			<p style="line-height: 28px; margin-top: 15px; ">
	              			<span style="color: #999; font-size: 14px; margin-top: 30px; font-weight: bold; margin-bottom: 10px;">选择提现使用的银行卡</span>
              			</p>
              			<form name="WithdrawForm" class="hform" id="WithdrawForm" method="post">
              			<ul class="signing_bankcard_list" style="margin-top: 15px;">
              				<li >
              					<input style="float: left;" name="bankCardId" value="23503" type="radio" data-name="招商">
              					<img  alt="" style="float: left; margin-left: 20px; vertical-align: bottom;" src="assets/img/zhifu/jianshe.gif">
              					<span  style="margin-left: 30px; margin-top: 15px;">****4479</span>
                            </li>
                            <li style="border-top: 0px;">
              					<input style="float: left;" name="bankCardId" value="23503" type="radio" data-name="招商">
              					<img  alt="" style="float: left; margin-left: 20px; vertical-align: bottom;" src="assets/img/zhifu/jianshe.gif">
              					<span  style="margin-left: 30px; margin-top: 15px;">****4479</span>
                            </li>
                        </ul>     
                        <p style="line-height: 28px; vertical-align: baseline; margin-top: 20px; ">
              				<label for="" style="width:130px;line-height: 28px; margin-left: 70px;">提交金额：</label>
              				<input name="withdraw.amount" class="txt" id="amount" type="text" maxLength="10" style="height: 42px; width: 235px; margin-left: 12px;"/>
              			</p>
              			
						</form>      
						<p class="space-bot">
							<button style="padding: 8px 40px; letter-spacing: 1px; margin-left: 158px; margin-top: 30px; font-size: 16px;" id="SumbitWithdrawForm" class="red left" type="button">申请提现</button>
						</p>					
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
			$(".pagnum a").click(function(event){
		    	event.preventDefault();
	            $("input[name=pageNo]").val($(this).attr("page_no"));
		    	$("#modalForm").submit();
		    });
		});
		
	</script>
</body>
</html>