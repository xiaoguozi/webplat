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
<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />
<!--配资页面样式-->
<link href="assets/css/ui/peizi.css" rel="stylesheet" />
<link href="assets/css/ui-dialog.css" rel="stylesheet" />
<script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/scripts/ui/err_box.js"></script>
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
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/addbank" style="color: #ff6600">银行卡</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur" >充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex">提现</a></span>
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
							<strong>银行卡管理</strong>
						</h2>
                       <c:if test="${userInfo.isValidate!=1}">
                       	  <div style="TEXT-ALIGN: center;"><span style="color:red;font-size:18px">请先 <a href="rest/web/userCenter/index" target="_self">实名认证</a> 再添加银行卡</span></div>  
                       </c:if>
                       <c:if test="${userInfo.isValidate==1}">
                            <c:if test="${!empty lstCustbank}">
							<div class="l_recharge" style="height: 120px; margin-right: 15px;">
								<UL id="radioImage" class="bank_list l_bank_list  clr">
								 <c:forEach items="${lstCustbank}" var="custbank" >
								<LI id="yh1" style="height:">
								    <div style="width:200px">
									<P>
										<IMG alt="${custbank.bankName}" src="assets/img/zhifu/${custbank.img}" >									
									</P>
									<p style="text-align:center;border:0px;height:20px; width:200px;">
									     ${custbank.bankNo}
									</p>									
								</LI>																															
							    </c:forEach>								
							</UL>
							</div>
							<div style="margin-top: 20px; margin-bottom: 20px;TEXT-ALIGN: center;font-size:18px;border:1px solid"></div>
							</c:if>	
							
							<div style="margin-top: 20px; margin-bottom: 20px;TEXT-ALIGN: center;font-size:18px">添加银行卡(<span style="color:red">请务必填写本人的银行卡号，否则会提款失败</span>)</div>
							  
							<form id="modalForm" action="rest/web/userCenter/zhifu/addbankData" method="post">
							<input type="hidden" name="springMVC_token"  value="${springMVC_token}"/>
							<div style="height: 250px;">
								<div style="height:40px"><span style="margin-left:220px">用 &nbsp;户&nbsp;名:</span><span>${userInfo.name}</span></div>
								<div style="height:40px"><span style="margin-left:220px">开 &nbsp;户&nbsp;行:</span>
									<span> 
										<select  name="bankCode">
										 <c:forEach items="${lstBank}" var="bank" >
										   <option value="${bank.bankCode}">${bank.bankName}</option>										  
										 </c:forEach>
										</select> 								
									</span>
								</div>
								
								<div style="height:40px"><span style="margin-left:220px">开户城市:</span>
									<span>									  								
									    <select name="provinceId" id="province" onchange="provinceChange()">
									    <option value="">--请选择--</option>
									      <c:forEach items="${lstProvince}" var="province" >
										      <option value="${province.id }">${province.shortName}</option>										  
										   </c:forEach>										
										</select> 
									</span>
									<span>
									   <select name="cityId" id="city">
									    <option value="">--请选择--</option>
									   </select>
									</span>
									
								</div>
								<div style="height:40px"><span style="margin-left:220px">开户支行:</span><span><input type="text"  name="branchName" style="height:25px" size="25" maxLength="60" value=""/></div>
								<div style="height:40px"><span style="margin-left:220px">卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</span><span ><input  type="text" size="25" maxlength="25" value="" name="bankNo" style="height:25px"  onkeyup="formatBankNo(this)" onkeydown="formatBankNo(this)" /></span></div>						
								
								<div style="height:40px">
							      <span style="margin-left:220px" class="addbank"><a href="" class="tjs_btn">添加银行卡</a></span>
						    	</div>
							</div>
							<div style="margin-top: 20px; margin-bottom: 20px;TEXT-ALIGN: center;font-size:18px;border:1px solid"></div>
							<div>
								* 银行卡仅限于取现使用，充值不限绑定的银行卡<br/>
								* 请保证银行卡开户名与淘金山实名认证一致，否则取现不成功<br/>
								* 请绑定银行储蓄卡帐户，不能绑定信用卡帐户<br/>														
							</div>
						   </form>	
					 </c:if>
						
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
	 function provinceChange(){		 
		 if($("#province").val()==""){
			$("#city").html("<option value=\"\">--请选择--</option>")
			return ;
		 }	 
		  //ajax获取数据
		$.ajax({
		    type: 'POST',
		    url: 'rest/web/userCenter/zhifu/queryCity',
		    data: {
		    	provinceId: $("#province").val()
               },
		    success: function(data){
		    	var optionHtml="<option value=''>--请选择--</option>"
		    	for(i=0;i<data.length;i++){
		    		optionHtml = optionHtml+"<option value='"+data[i].id+"'>"+data[i].nameCn+"</option>";	
		    	}
		    	$("#city").html(optionHtml)
		    },
		    dataType: 'json'
		});
	 }
	 
		
	 function formatBankNo (BankNo){
		    if (BankNo.value == "") return;
		    var account = new String (BankNo.value);
		    account = account.substring(0,22); /*帐号的总数, 包括空格在内 */
		    if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
		        /* 对照格式 */
		        if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" +
		        ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
		            var accountNumeric = accountChar = "", i;
		            for (i=0;i<account.length;i++){
		                accountChar = account.substr (i,1);
		                if (!isNaN (accountChar) && (accountChar != " ")) accountNumeric = accountNumeric + accountChar;
		            }
		            account = "";
		            for (i=0;i<accountNumeric.length;i++){    /* 可将以下空格改为-,效果也不错 */
		                if (i == 4) account = account + " "; /* 帐号第四位数后加空格 */
		                if (i == 8) account = account + " "; /* 帐号第八位数后加空格 */
		                if (i == 12) account = account + " ";/* 帐号第十二位后数后加空格 */
		                account = account + accountNumeric.substr (i,1)
		            }
		        }
		    }
		    else
		    {
		        account = " " + account.substring (1,5) + " " + account.substring (6,10) + " " + account.substring (14,18) + "-" + account.substring(18,25);
		    }
		    if (account != BankNo.value) BankNo.value = account;
	}
	 
 	$(document).ready(function () {
 		//添加银行卡
 		$(".addbank .tjs_btn").click(function(event){
			event.preventDefault();	
			//判断必填项
			if($('#province').val()==''||$('#city').val()==''){
				errTip("开户城市需要填写 ", 1);
				return;
			}
			if($.trim($('input[name=branchName]').val())==''){
				errTip("开户支行需要填写 ", 1);
				return;
			}
			
			if($.trim($('input[name=bankNo]').val())==''){
				errTip("卡号需要填写 ", 1);
				return;
			}
						
			$("#modalForm").submit();			   
		})
	 });

	</script>
</body>
</html>