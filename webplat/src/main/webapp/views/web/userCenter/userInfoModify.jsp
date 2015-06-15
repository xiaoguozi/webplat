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
                    <a href="http://www.taojinshan.com.cn">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                       <c:if test="${isLog!='true'}">
                        <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <li><a href="rest/web/peizi/raise"><span>淘金募集</span></a></li>
                        <li><a href="rest/web/peizi/self"><span>淘金自营</span></a></li>
                        <li><a href="rest/web/peizi/personalCenter"><span class="simu_on">个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                        </c:if>
                        
                        <c:if test="${isLog=='true'}">
                        <li><a href="#">首页</a></li>
					    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li><a href="rest/web/peizi/index" target="_blank">配资</a></li>
					    <li><a href="#" target="_blank">海外保险</a></li>
					    <li><a href="rest/web/aboutUs/index" target="_blank">关于我们</a></li>
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
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
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
                        	<span class="bor_dashed"><a href="javascript:void()">免息配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/ttpUserCenter">天天配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/yypUserCenter">月月配</a></span>
                            <span class="bor_dashed"><a href="rest/web/peizi/usercenter/dxpUserCenter">低息1配1</a></span>
                        </div>
                        
                        <li class="wdzj">我的资金</li>
                        <div class="bor_dashed moneymx" style="display:none"><a href="javascript:void()">资金明细</a></div>
                        
                        <li class="zlsz">资料设置</li>
                        <div class="bor_dashed  mmxg"><a href="rest/web/userCenter/userModify" style="color:#ff6600">个人信息</a></div>
                        
                        
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
                  <div id="modify_data" style="width:75%;text-align: center;margin-top:20px;display:none">
                    <span style="width:auto;font-size:40px;text-align: center;" id="modify_tip"></span>
                  </div>                         
                  <div >
	                <form class="modify-form" id="modify-form" action="rest/web/userCenter/saveUserInfo" method="post">
	                 <div style="height:30px"></div>     
	                 <div class="tjs_register_left" style="width:20%">姓名：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_username" name="userInfo.name" value="${name}" maxlength="30" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">身份证：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_certId" name="userInfo.certId" value="${certId}" maxlength="18" onblur="validateCertId(this);" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" autofocus x-webkit-speech >&nbsp;&nbsp;<span id="cert_id_span" style="color: red;"></span>&nbsp;<img id="validateSuccessImg" src="assets/img/peizi/check_sucess.png" valign="center" style="display: none;"><a style="cursor: pointer;" id="aValidate" onclick="validateRealName()" >实名认证</a></div>
	                 <div class="tjs_register_left" style="width:20%">邮箱：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_email" name="userInfo.email" value="${email}" maxlength="100" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">QQ：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_qq" name="userInfo.qqNo" value="${qq}" maxlength="16" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">手机号：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_phone" name="phone" value="${phone}" disabled="disabled" type="text" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">密码：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_password_1" name="password" value="0000000000000000000000000000000000" disabled="disabled" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="" x-webkit-speech >&nbsp;&nbsp;<a style="cursor: pointer;" id="a_dialog" onclick="showPasswordDialog()" >修改密码</a></div>
	                
	                 <div style="height:60px; width:75%; text-align: center;"><a id="register-submit-btn"  class="tjs_registerbtn">提交修改</a></div>
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
<!-- 配资页尾 结束 -->
<script type="text/javascript">

	$(document).ready(function () {
		$("#register-submit-btn").click(function(e){
			e.preventDefault();
			$(".modify-form").submit();
		});
		
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
	});
	
	function validateCertId(obj){
		var certId = obj.value;
		if(certId==""){
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
	
	var tipDialog;
	function validateRealName(){
		var realName = $("#register_username").val();
		var realCertId = $("#register_certId").val();
		//显示一个模态框验证窗口
		tipDialog = dialog({
		    title: '温馨提示',
		    content: '<div style="float:left;"><img src="assets/img/circle_loading.gif" ></div><div style="text-align:center;float:left;height:32px; line-height:32px;">&nbsp;&nbsp;实名认证中，请稍等...</div>',
		    width: 300,
		    cancel: false,
		    ok: false
		});
		tipDialog.showModal();

		setTimeout('showValidateResult("'+realName+'","'+realCertId+'")', 2000);
	}
	
	function showValidateResult(realName, realCertId){
		//ajax修改后台密码
		$.ajax({
		    type: 'POST',
		    url: 'rest/web/userCenter/valiadCertId' ,
		    data: {
		    	name: realName,
		    	certId: realCertId
            },
		    success: function(data){
		    	if(tipDialog){
			    	tipDialog.close().remove();
		    	}
		    	if(data==true){
		    		$("#validateSuccessImg").show();
		    		$("#aValidate").html("已实名认证");
		    		$("#aValidate").css("color","#000000").css("cursor","default");
		    		$("#register_certId").attr("disabled", true);
		    		$("#register_certId").css("background-color", "#eeeeee");
		    		$("#register_username").attr("disabled", true);
		    		$("#register_username").css("background-color", "#eeeeee");
		    		
		    		var dNew = dialog({
		    		    content: '<img src="assets/img/peizi/check_sucess.png" valign="center">&nbsp;实名认证成功'
		    		});
		    		dNew.show();
		    		setTimeout(function () {
		    			dNew.close().remove();
		    		}, 2000);
		    	}else{
		    		var dNew = dialog({
		    		    content: '<img src="assets/img/peizi/check_sucess.png" valign="center">&nbsp;实名认证失败'
		    		});
		    		dNew.show();
		    		setTimeout(function () {
		    			dNew.close().remove();
		    		}, 2000);
		    		
		    	}
		    } ,
		    dataType: 'json'
		});
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