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
	<title>淘金山-个人中心</title>
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />	
	<link href="assets/css/ui-dialog.css" rel="stylesheet" />
    <script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
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
                    <a href="">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                       <c:if test="${isLog!='true'}">
                        <li st><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>                      
                        <li><a href="rest/web/peizi/usercenter/pzzhongxin"><span class="simu_on">个人中心</span></a></li>                       
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                        </c:if>
                        
                        <c:if test="${isLog=='true'}">
                        <li style="width:115px"><a href="#">首页</a></li>
					    <li style="width:115px"><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li style="width:115px"><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li style="width:115px"><a href="rest/web/peizi/index" target="_blank">配资</a></li>
					    <li style="width:115px"><a href="#" target="_blank">海外保险</a></li>
					    <li style="width:115px"><a href="rest/web/aboutUs/index" target="_blank">关于我们</a></li>
                       </c:if>
                                               
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                	<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
					<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
					<li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>                   
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
        </div>
    <div class="w100bg">
        <hr class="pc"/>
        <div class="tjs_1108px center">
            <div class="bgcolor">
                <div class="mycenter_left">
                    <ul class="mc_lbox">
                    	<li >可用余额</li>                                             
                        <li class="colorf06 font18 lh10 ">0.00元</li>
                        <li><a class="tjs_btn pzbtn" href="javascript:void()"><b>¥</b> 充值</a></li>
                    	   
                                         
                        <li class="wypz">我的配资</li>
                        <div class="ttp wypz_div" style="display:none">
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/mfp" >免费配</a></span>
                        	<span class="bor_dashed"><a href="rest/web/peizi/usercenter/mfp">免息配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/ttpUserCenter">天天配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/yypUserCenter">月月配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/dxpUserCenter">低息1配1</a></span>
                        </div>
                        
                        <li class="wdzj">我的资金</li>
                        <div class="moneymx">
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/addbank">银行卡</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur">充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex">提现</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/fundHistory">资金明细</a></span>
                        </div>
                        
                        <li class="zlsz">资料设置</li>
                        <div class="bor_dashed  mmxg">
	                        <span>
	                        	<a href="rest/web/userCenter/userModify" style="color:#ff6600">个人信息</a>
	                        </span>
                        </div>
                        
                        
                    </ul>
                </div>
                <script>
                    $(function () {
                    	
                        $(".wypz").click(function () {
                            $(".ttp").slideToggle(500);
                        });
                        $(".wdzj").click(function () {
                            $(".moneymx").slideToggle(300);
                        });
                                             
                        $(".zlsz").click(function () {
                            $(".mmxg").slideToggle(300);
                        });
                        
                    })
                </script>
            <div class="mycenter_right" id="mycenter_right">
            	    <h2 class="space-right-h2"><strong>淘金山账户</strong><span style="color: #666; font-size: 13px; font-weight: 300; margin-left: 20px;">账户名： 13714619930</span></h2>
			        <div class="ms-c3 clearfix">
			          <div class="ms-c3-l"> <span>账户余额：</span> <br>
			            <strong>￥0.00</strong>元 <a href="rest/web/userCenter/zhifu/fundHistory?isFromIndex=1">账户资金明细</a> </div>
			          <p><a href="rest/web/userCenter/zhifu/enterCur" class="s1">充值</a><a  class="s2" style="margin-right: 30px;">提现</a></p>
			        </div>
			        <div class="ms-c2-t" style="margin-bottom: 10px;">
			          <div id="myAsset">
			            <dl>
			              <dt>账户总资产<span id="tip" data-text="可用金额+冻结金额 " class="icon icon-help-s ml10" style="cursor: pointer;"></span></dt>
			              <dd> <strong>￥
			              0.00<!-- 0.0 -->
			                </strong> 元 </dd>
			            </dl>
			            <dl>
			              <dt>配资资产<span id="tip1" data-text="钱生财股票配资金额" class="icon icon-help-s ml10" style="cursor: pointer;"></span></dt>
			              <dd> <strong>￥
			             
			                          0
			                          </strong> 元 </dd>
			            </dl>
			            <dl>
			              <dt>风险保证金<span id="tip2" data-text="风险保证金 + 停牌准备金" class="icon icon-help-s ml10" style="cursor: pointer;"></span></dt>
			              <dd> <strong>
			            
			                          0
			                          </strong> 元 </dd>
			            </dl>
			            <dl>
			            <dt>冻结金额</dt>
			              <dd> <strong>￥0.00</strong> 元 </dd>
			            
			              
			            </dl>
			            <dl class="last width ">
			              <dt>账户余额</dt>
			              <dd> <strong>￥0.00</strong> 元 </dd>
			            </dl>
			            
			          </div>
			        </div>
            
                  <div id="modify_data" style="width:75%;text-align: center;margin-top:1px;display:none">
                    <span style="width:auto;font-size:40px;text-align: center;" id="modify_tip"></span>
                  </div>                         
                  <div style="margin-bottom: 20px;">
	                <form class="modify-form" id="modify-form" action="rest/web/userCenter/saveUserInfo" method="post">
	                 <input type="hidden" id="validateHiddenName" />
	                 <input type="hidden" id="validateHiddenCertId" />
	                 
	                 <div style="height:30px"></div> 
	                   
	                 <c:if test="${isValidate==1}">
	                 	<div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img id="vImgSuc" src="assets/img/peizi/check_sucess.png" />&nbsp;实名认证&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 120px;"><span style="color: #999999;" id="validateSpan">已完成实名认证 </span><a style="cursor: pointer; margin-left: 135px;" id="aValidate" onclick="viewValidateNameCertId();" >查看实名认证信息</a></div> </div></div>
	                 </c:if>
	                 <c:if test="${isValidate!=1}">
	                 	<div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img id="vImgAlert" src="assets/img/peizi/check_alert.png" /><img id="vImgSuc" src="assets/img/peizi/check_sucess.png" style="display: none;"/>&nbsp;实名认证&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 120px;"><span style="color: #999999;" id="validateSpan">未完成实名认证 </span><a style="cursor: pointer; margin-left: 135px;" id="aValidate" onclick="validateNameCertId();" >实名认证</a></div> </div></div>
	                 </c:if>
					 <div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img  src="assets/img/peizi/check_sucess.png" />&nbsp;登录密码&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 60px;"><span style="color: #999999;" >定期更换密码可以让你的账户更加安全</span><a style="cursor: pointer; margin-left: 62px;" id="a_dialog" onclick="showPasswordDialog()" >修改密码</a></div> </div></div>
	                 <div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img  src="assets/img/peizi/check_sucess.png" />&nbsp;手机认证&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 120px;"><span style="color: #999999;" >${phone}</span></div> </div></div>
	                 
	                 <c:if test="${(empty email) || (empty qq)}">
	                 	 <div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img  src="assets/img/peizi/check_alert.png" />&nbsp;邮箱&nbsp;QQ&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 60px;"><span style="color: #999999;" >留下您的邮箱和qq号，方便接收活动信息</span><a style="cursor: pointer; margin-left: 46px;" id="a_mail_qq" onclick="showChange()" >立即修改</a></div> </div></div>
	                 </c:if>
	                 <c:if test="${!(empty email) && !(empty qq)}">
		                 <div class="divLine" style="height: 56px;line-height: 56px;"><div class="tjs_register_left" style="width:20%;line-height: 56px;"><img  src="assets/img/peizi/check_sucess.png" />&nbsp;邮箱&nbsp;QQ&nbsp;</div><div class="tjs_register_right" style="margin-left:20%;height:56px; " ><div style="margin-top: 8px;  height: 56px; margin-left: 60px;"><span style="color: #999999;" >留下您的邮箱和qq号，方便接收活动信息</span><a style="cursor: pointer; margin-left: 46px;" id="a_mail_qq" onclick="showChange()" >立即修改</a></div> </div></div>
	                 </c:if>
	                 
	                </form>     
                 </div>
                <!--/无产品状态-->
            </div>

            </div>
        </div>
        <hr class="pc"/>
    </div>

<!-- 配资页尾 -->
<%@ include file="/views/web/footer.jsp"%>
</div>
<!-- 配资页尾 结束 -->
<script type="text/javascript">

	$(document).ready(function () {
		
		//修改成功提示
		if('${changeSucess}'=='true'){
			var dNew = dialog({
    		    content: '<img src="assets/img/peizi/check_sucess.png" valign="center">&nbsp;修改成功'
    		});
    		dNew.show();
    		setTimeout(function () {
    			dNew.close().remove();
    		}, 2000);
		}
		
		$(".divLine").mouseover(function(){
			$(this).css("background-color","#F2F2F2");
			$(this).find("span").css("color","#000000");
		});
		$(".divLine").mouseout(function(){
			$(this).css("background-color","#FFFFFF");
			$(this).find("span").css("color","#999999");
		});
	});
	
	
	function showChange(){
		
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-emailqq\" action=\"rest/web/userCenter/saveUserInfo\" method=\"post\">";
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\">邮箱：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_email\" name=\"userInfo.email\" value=\"${email}\" type=\"text\"  class=\"tjs_register_input  tjs_width245px\" tabindex=\"1\" spellcheck=\"false\" maxLength=\"100\"  autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_email\"></span></div>";
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\">QQ：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_qq\" name=\"userInfo.qqNo\" value=\"${qq}\" type=\"text\"  class=\"tjs_register_input  tjs_width245px\" tabindex=\"2\" spellcheck=\"false\" maxLength=\"16\"  autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_qq\"></span></div>";
		
		dialogContent += "<div style=\"height:60px; width:75%; text-align: center;\"><a id=\"register-submit-email-btn\" href=\"#\" class=\"tjs_registerbtn\" >提交修改</a></div>";
		dialogContent += "</form></div>";
		
		dInput = dialog({
		    title: '修改邮箱和QQ',
		    content: dialogContent
		});
		
		dInput.showModal();	
		
		$("#register-submit-email-btn").click(function(e){
			e.preventDefault();
			$(".modify-form-emailqq").submit();
		});
		
	}
	
	function validateCertId(obj){
		var certId = obj.value;
		if(certId==""){
			$("#cert_id_span").text("");
			return false;
		}
		if(!isIdCardNo(certId)){
			$("#cert_id_span").text("请正确输入您的身份证号码");
		}else{
			$("#cert_id_span").text("");
		}
	}
	
	function isIdCardNo(num){
	    num = num.toUpperCase();
	    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
	    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num)))
	    {
	        return false;
	    }
	    //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	    //下面分别分析出生日期和校验位
	    var len, re;
	    len = num.length;
	    if (len == 15)
	    {
	        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
	        var arrSplit = num.match(re);
	 
	        //检查生日日期是否正确
	        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
	        var bGoodDay;
	        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
	        if (!bGoodDay)
	        {
	            return false;
	        }
	        else
	        {
	                //将15位身份证转成18位
	                //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	                var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
	                var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
	                var nTemp = 0, i;
	                num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
	                for(i = 0; i < 17; i ++)
	                {
	                    nTemp += num.substr(i, 1) * arrInt[i];
	                }
	                num += arrCh[nTemp % 11];
	                return true;
	        }
	    }
	    if (len == 18)
	    {
	        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
	        var arrSplit = num.match(re);
	 
	        //检查生日日期是否正确
	        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
	        var bGoodDay;
	        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
	        if (!bGoodDay)
	        {
	            return false;
	        }
	    else
	    {
	        //检验18位身份证的校验码是否正确。
	        //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	        var valnum;
	        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
	        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
	        var nTemp = 0, i;
	        for(i = 0; i < 17; i ++)
	        {
	            nTemp += num.substr(i, 1) * arrInt[i];
	        }
	        valnum = arrCh[nTemp % 11];
	        if (valnum != num.substr(17, 1))
	        {
	            return false;
	        }
	        return true;
	    }
	    }
	    return false;
	}
	
	
	var isOldPwdRight = false;
	
	function ajaxQueryOldPassword(obj){
		if(obj.value==""){
			$("#span_old_pwd").text("原密码不能为空");
		}else{
			$("#span_old_pwd").text("");
			//ajax查询后台
			$.ajax({
			    type: 'POST',
			    url: 'rest/web/userCenter/valiadPassword' ,
			    data: {
                	password: function () { return sha256_digest($("#register_password").val()); }
                },
			    success: function(data){
			    	if(data==false){
			    		$("#span_old_pwd").text("原密码输入错误");
			    		isOldPwdRight = false;
			    	}else{
			    		$("#span_old_pwd").text("");
			    		isOldPwdRight = true;
			    	}
			    } ,
			    dataType: 'json'
			});
		}
	}

	function showPasswordDialog(){
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-pwd\" action=\"rest/web/userCenter/userModifyData\" method=\"post\">";
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:25%\">原密码：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_password\" name=\"password\" type=\"password\" onblur=\"ajaxQueryOldPassword(this);\" class=\"tjs_register_input  tjs_width245px\" tabindex=\"1\" spellcheck=\"false\" placeholder=\"初始密码，6~16个字母、符号或数字组合\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_old_pwd\"></span></div>";
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:25%\">新密码：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_newpassword\" name=\"newpassword\" type=\"password\" onblur=\"onBlurNewPassword(this)\" class=\"tjs_register_input  tjs_width245px\" tabindex=\"2\" spellcheck=\"false\" placeholder=\"初始密码，6~16个字母、符号或数字组合\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_new_pwd\"></span></div>";
		
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:25%\">确认新密码：</div><div class=\"tjs_register_right_new\"style=\"margin-left:20px\"><input id=\"rpaConfirmssword\" name=\"rpaConfirmssword\" type=\"password\" onblur=\"onBlurNewConfirmPassword(this);\" class=\"tjs_register_input  tjs_width245px\" tabindex=\"3\" spellcheck=\"false\" placeholder=\" 确认密码\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_new_confirm_pwd\"></span></div>";
		
		
		dialogContent += "<div style=\"height:60px; width:75%; text-align: center;\"><a id=\"register-submit-pwd-btn\" href=\"#\" class=\"tjs_registerbtn\" >提交修改</a></div>";
		dialogContent += "</form></div>";
		
		var d = dialog({
		    title: '修改密码',
		    content: dialogContent
		});
		d.showModal();
		
		
		//初始化控件
		$("#register-submit-pwd-btn").click(function(e){
			e.preventDefault();
			var registerPassword = $("#register_password").val();
			var registerNewpassword = $("#register_newpassword").val();
			var rpaConfirmssword = $("#rpaConfirmssword").val();
		
			if(registerPassword=='' || registerNewpassword=='' || rpaConfirmssword==''){
				if(registerPassword==''){
					$("#span_old_pwd").text("原密码不能为空");
				}
				if(registerNewpassword==''){
					$("#span_new_pwd").text("新密码不能为空");
				}
				if(rpaConfirmssword==''){
					$("#span_new_confirm_pwd").text("确认新密码不能为空");
				}
				
				if(registerPassword!=''){
					$("#span_old_pwd").text("");
				}
				if(registerNewpassword!=''){
					$("#span_new_pwd").text("");
				}
				if(rpaConfirmssword!=''){
					$("#span_new_confirm_pwd").text("");
				}
				
				return false;
			}else{
				if(isOldPwdRight==true){
					$("#span_old_pwd").text("");
				}
				$("#span_new_pwd").text("");
				$("#span_new_confirm_pwd").text("");
			}
			
			if(registerNewpassword!=rpaConfirmssword){
				$("#span_new_confirm_pwd").text("确认密码与新密码不一致");
				return false;
			}
			
			if(isOldPwdRight==false){
				return false;
			}
			
			//ajax修改后台密码
			$.ajax({
			    type: 'POST',
			    url: 'rest/web/userCenter/userModifyData' ,
			    data: {
                	password: function () { return sha256_digest(registerPassword); },
                	newpassword: function () { return sha256_digest(registerNewpassword); }
                },
			    success: function(data){
			    	if(data==true){
			    		d.close().remove();
			    		
			    		var dNew = dialog({
			    		    content: '<img src="assets/img/peizi/check_sucess.png" valign="center">&nbsp;修改成功'
			    		});
			    		dNew.show();
			    		setTimeout(function () {
			    			dNew.close().remove();
			    		}, 2000);
			    	}else{
			    		$("#span_new_confirm_pwd").text("修改错误");
			    	}
			    } ,
			    dataType: 'json'
			});
			
			
		});
		
	}
	
	function viewValidateNameCertId(){
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-certId\" action=\"rest/web/userCenter/userModifyData\" method=\"post\">";
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\"><img src=\"assets/img/peizi/check_sucess.png\" valign=\"center\">&nbsp;真实姓名：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_name_view\" name=\"userInfo.name\" value=\"${name}\" type=\"text\" disabled class=\"tjs_register_input  tjs_width245px\" tabindex=\"1\" spellcheck=\"false\" maxLength=\"10\"  autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_username\"></span></div>";
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\"><img src=\"assets/img/peizi/check_sucess.png\" valign=\"center\">&nbsp;身份证号：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_certId_view\" name=\"userInfo.certId\" value=\"${certId}\" type=\"text\" disabled class=\"tjs_register_input  tjs_width245px\" tabindex=\"2\" spellcheck=\"false\" maxLength=\"20\"  autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_certId\"></span></div>";
		
		dialogContent += "</form></div>";
		
		dInput = dialog({
		    title: '查看实名认证信息',
		    content: dialogContent,
		    width:350,
		    okValue: '确定',
		    ok:function(){}
		});
		
		dInput.showModal();	
		if($("#validateHiddenName").val()!=""){
			$("#register_name_view").val($("#validateHiddenName").val());
		}
		if($("#validateHiddenCertId").val()!=""){
			$("#register_certId_view").val($("#validateHiddenCertId").val());
		}
		
	}
	
	var tipDialog;
	//实名认证输入框
	var dInput;
	function validateNameCertId(){
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-certId\" action=\"rest/web/userCenter/userModifyData\" method=\"post\">";
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:25%\">真实姓名：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_name\" name=\"userInfo.name\" value=\"${name}\" type=\"text\" onblur=\"onBlurName(this);\" class=\"tjs_register_input  tjs_width245px\" tabindex=\"1\" spellcheck=\"false\" maxLength=\"10\" placeholder=\"请输入您的真实姓名\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_username\"></span></div>";
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:25%\">身份证号：</div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_certId\" name=\"userInfo.certId\" value=\"${certId}\" type=\"text\" onblur=\"onBlurCertId(this)\" class=\"tjs_register_input  tjs_width245px\" tabindex=\"2\" spellcheck=\"false\" maxLength=\"20\" placeholder=\"请输入您的身份证号码\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\"><span style=\"color:red;margin-top:5px;height:30px;\" id=\"span_register_certId\"></span></div>";
		
		dialogContent += "<div style=\"height:60px; width:75%; text-align: center;\"><a id=\"register-submit-cert-btn\" href=\"#\" class=\"tjs_registerbtn\" >开始认证</a></div>";
		dialogContent += "</form></div>";
		
		dInput = dialog({
		    title: '实名认证',
		    content: dialogContent
		});
		
		dInput.showModal();		
		if($("#validateHiddenName").val()!=""){
			$("#register_name").val($("#validateHiddenName").val());
		}
		if($("#validateHiddenCertId").val()!=""){
			$("#register_certId").val($("#validateHiddenCertId").val());
		}
		
		//初始化控件
		$("#register-submit-cert-btn").click(function(e){
				e.preventDefault();
				var name = $("#register_name").val();
				var certId = $("#register_certId").val();
				
				if(name==''){
					$("#span_register_username").text("真实姓名不能为空");
				}
				
				if(certId==''){
					$("#span_register_certId").text("身份证号码不能为空");
				}
				
				if(name=='' || certId==''){
					return false;
				}
				
				//身份证不正确
				if(!isIdCardNo(certId)){
					$("#span_register_certId").text("请正确输入您的身份证号码");
					return false;
				}else{
					$("#span_register_certId").text("");
				}
				
				
				//暂存填写的信息
				$("#validateHiddenName").val(name);
				$("#validateHiddenCertId").val(certId);
				
				//先关掉实名认证输入框，再弹出实名认证进展框
		    	if(dInput){
		    		dInput.close().remove();
			    	//dInput.close();
		    	}
				
		    	//显示一个模态框验证窗口
				tipDialog = dialog({
				    title: '温馨提示',
				    content: '<div style="float:left;"><img src="assets/img/circle_loading.gif" ></div><div style="text-align:center;float:left;height:32px; line-height:32px;">&nbsp;&nbsp;实名认证中，请稍等...</div>',
				    width: 300,
				    cancel: false,
				    ok: false
				});
				tipDialog.showModal();
				
				//ajax修改后台密码
				$.ajax({
				    type: 'POST',
				    url: 'rest/web/userCenter/validateNameCertId',
				    data: {
				    	name: name,
				    	certId: certId,
	                	userId:'${userId}'
	                },
				    success: function(data){
						setTimeout('showValidateNameCertIdResult("'+data+'")', 1000);
				    } ,
				    dataType: 'text'
				});
		});
	}
	
	function showValidateNameCertIdResult(data){
		if(tipDialog){
			tipDialog.close().remove();
		}
		
    	if(data=="true"){
    		$("#vImgAlert").hide();
    		$("#vImgSuc").show();
    		$("#validateSpan").text("已完成实名认证 ");
    		$("#aValidate").html("查看实名认证信息");
    		$("#aValidate").removeAttr("onclick");
    		//TODO 添加查看实名认证信息
    		$("#aValidate").click(function(){
    			viewValidateNameCertId();
    		});
    		
    		var dNew = dialog({
    		    content: '<img src="assets/img/peizi/check_sucess.png" valign="center">&nbsp;实名认证成功'
    		});
    		dNew.show();
    		setTimeout(function () {
    			dNew.close().remove();
    		}, 2000);
    	}else{
    		if(data=="false"){
    			data = '<img src="assets/img/peizi/check_fail.png" valign="center">&nbsp;实名认证失败，请重试！';
    		}else{
    			data = getMsgContent(data);
    			data = '<img src="assets/img/peizi/check_fail.png" valign="center">&nbsp;' + data;
    		}
    		var dNew = dialog({
    		    content: data
    		});
    		dNew.show();
    		setTimeout(function () {
    			dNew.close().remove();
    		}, 2000);
    		
    	}	
		
	}
	
	function getMsgContent(code){
		var msg = "";
		if(code=="-71"){
			msg = "认证服务参数不正确,请联系客服！";
		}else if(code=="-53"){
			msg = "认证服务账号过期,请联系客服！";
		}else if(code=="-72"){
			msg = "认证服务权限不足,请联系客服！";
		}else if(code=="-31"){
			msg = "认证服务需要充值,请联系客服！";
		}else if(code=="-60"){
			msg = "认证服务参数格式错误,请联系客服！";
		}else if(code=="-90"){
			msg = "认证服务器出问题,请联系客服！";
		}else if(code=="-1000"){
			msg = "实名认证存在问题，请联系客服人工认证！";
		}else if(code=="-1001"){
			msg = "身份证号码与姓名不一致";
		}else if(code=="-1002"){
			msg = "该姓名和身份证号码已被其他用户实名认证，请勿重复认证!";
		}
		
		return msg;
	}
	
	function onBlurCertId(obj){
		if(obj.value==""){
			$("#span_register_certId").text("身份证号不能为空");
		}else{
			//身份证不正确
			if(!isIdCardNo(obj.value)){
				$("#span_register_certId").text("请正确输入您的身份证号码");
			}else{
				$("#span_register_certId").text("");
			}
		}
	}
	
	function onBlurName(obj){
		if(obj.value==""){
			$("#span_register_username").text("真实姓名不能为空");
		}else{
			$("#span_register_username").text("");
		}
	}
	
	function onBlurNewPassword(obj){
		if(obj.value==""){
			$("#span_new_pwd").text("新密码不能为空");
		}else{
			$("#span_new_pwd").text("");
		}
	}
	
	function onBlurNewConfirmPassword(obj){
		if(obj.value==""){
			$("#span_new_confirm_pwd").text("确认新密码不能为空");
		}else{
			$("#span_new_confirm_pwd").text("");
		}
	}
       
</script>

</body>
</html>