<%@ include file="/views/wx/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
 	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="telephone=no" name="format-detection">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0">
    <title>淘金山金融—注册</title>
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <meta name="keywords" content="淘金山金融—注册" />
    <link rel="stylesheet" type="text/css"  href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="assets/css/ui-dialog.css" rel="stylesheet" />
    <script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>      
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
    <script src="assets/scripts/ui/dialog-min.js" charset="utf-8"></script>
    
    <style>
		.btn_common{
			background:#59CBFF;
			color:#ffffff;
			font-size:18px;
		}
      		
    </style>
</head>
<body style="background:#F78D1F">
	<div style="width: 100%; height: 100%;">
		<img src="assets/img/wx/gaotie_bg_short.jpg"
			style="width: 100%; height: 100%;" />
	</div>
	<div class="container" style="margin-top:10px;">
		<div class="col-md-12">
			<form class="register-form" action="rest/web/passport/mregSact"
				method="post">
				<input type="hidden" id="movieCode" name="movieCode" value="9552134346" />
		       	<input type="hidden" id="parent" name="parent" value="${ctrlData.parent}" />
				
				<div class="form-group">
					<input type="text" class="form-control" name="userName"
						id="userName" placeholder="请输入您的手机号">
				</div>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" name="mobileVerifyCode"
							id="mobileVerifyCode" placeholder="请输入验证码" maxlength="6"> <span
							class="input-group-btn">
							<button class="btn btn-info" type="button" id="newVerifyCode">获取验证码</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn_common" id="register-submit-btn"  style="width:100%;color:#ffffff; " type="button" >点击获取观影验证码</button>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		
		var handleRegister = function() {

			jQuery.validator.addMethod("mobileCN", function(value, element) {
	            return this.optional(element) || /^0?(13[0-9]|15[0-9]|18[0-9]|14[57]|17[0-9])[0-9]{8}$/.test(value);
	        }, "手机号码格式不正确");

			$('.register-form')
					.validate(
							{
								errorElement : 'span', // default input error message container
								errorClass : 'help-block', // default input error message class
								focusInvalid : false, // do not focus the last invalid input
								ignore : "",
								rules : {
									userName : {
										required : true,
										mobileCN : true,
										remote : "rest/web/passport/notExistUserName"
									},
									mobileVerifyCode : {
										required : true,
										remote : "rest/web/passport/validMobileVerifyCode"
									},
									tnc : {
										required : true
									}
								},

								messages : { // custom messages for radio buttons and checkboxes

									userName : {
										required : "手机号码不能为空.",
										remote : "很抱歉，该手机号已经被注册过."
									},
									mobileVerifyCode : {
										required : "短信验证码不能为空.",
										remote : "短信验证码输入有误."
									},
									tnc : {
										required : "请同意并勾选服务条款."
									}
								},

								invalidHandler : function(event, validator) {
									$('.alert-danger', $('.register-form'))
											.show();
								},

								highlight : function(element) { // hightlight error inputs
									$(element).closest('.form-group').addClass(
											'has-error');
								},

								success : function(label) {
									label.closest('.form-group').removeClass(
											'has-error');
									label.remove();
								},

								errorPlacement : function(error, element) {
									if (element.attr("name") == "tnc") {
										error.insertAfter(element
												.closest('label'));
									} else if (element.closest('.input-group')
											.size() === 1) {
										error.insertAfter(element
												.closest('.input-group'));
									} else {
										error.insertAfter(element);
									}
								}
							});

			$('.register-form input').keypress(function(e) {
				if (e.which == 13) {
					if ($('.register-form').validate().form()) {
						//$('.register-form').submit();
						ajaxSubmit();
					}
					return false;
				}
			});

			$('#register-submit-btn').click(function(e) {
				e.preventDefault();
				if ($('.register-form').validate().form()) {
					//$('.register-form').submit();
					ajaxSubmit();
				}
				return false;
			});

		}

		var wait = 0;
		var timeCount = function(o) {
			if (wait == 0) {
				o.prop("disabled", "");
				o.html("获取验证码");
				wait = 60;
			} else {
				o.prop("disabled", "disabled");
				o.html("重新发送(" + wait + "秒)");
				wait--;
				setTimeout(function() {
					timeCount(o)
				}, 1000)
			}
		}

		var handleNewVerifyCode = function(){
	        timeCount($("#newVerifyCode"));
	        $("#newVerifyCode").click(function(event){
	            event.preventDefault();
	            if ($('.register-form ').validate().element("#userName")) {
	            	if($("#newVerifyCode").prop("disabled") != "disabled"){
	            		var mobileNo = $('.register-form input[name=userName]').val();
	                    $.post("rest/web/passport/sendMobileVerifyCode",{
	                        "mobileNo":mobileNo
	                    });
	                    timeCount($("#newVerifyCode"));
	                   // alert("验证码发送到 "+mobileNo+" 成功");
	                }	
	            }
	            
	            return false;
	        });
	    }

		handleRegister();
		handleNewVerifyCode();

	});
	
	var tipDialog;
	function ajaxSubmit(){
		//显示一个模态加载窗口
		tipDialog = dialog({
		    title: '温馨提示',
		    content: '<div style="float:left;"><img src="assets/img/circle_loading.gif" ></div><div style="text-align:center;float:left;height:32px; line-height:32px;">&nbsp;&nbsp;获取观影验证码中，请稍等...</div>',
		    width: 220,
		    cancel: false,
		    ok: false
		});
		tipDialog.showModal();
		$.ajax({
			   type: "POST",
			   url: "rest/web/passport/mregSact",
			   dataType:"json",
			   data: {
				   movieCode: $("#movieCode").val(),
				   userName: $("#userName").val(),
				   parent: $("#parent").val(),
				   mobileVerifyCode:$("#mobileVerifyCode").val()
               },
			   success: function(data){
				   //setTimeout('ajaxResult("'+msg+'")', 600);
				   ajaxResult(data);
			   }
		});
	}
	
	function ajaxResult(data){
		if(tipDialog){
			tipDialog.close().remove();
		}
		showMsgDialog(data);
	}
	
	function showMsgDialog(data){
		var msgImg = "";
		if(data.msg!="0"){
			msgImg = "<img src=\"assets/img/peizi/check_alert.png\" valign=\"center\">";
		}
		var msg = getMsgContent(data);
		
		var dialogContent = "<div>";
		dialogContent += "<div>"+msgImg+"&nbsp;<span id=\"span_register_name\">"+msg+"</span></div><br/>";
		dialogContent += "</div>";
		
		dInput = dialog({
		    title: 'http://www.taojinshan.com.cn',
		    content: dialogContent,
		    width:230
		});
		
		dInput.showModal();	
	}
	
	function getMsgContent(data){
		var msg;
		if(data.msg=="0"){
			msg = "<nobr>您在淘金山的用户名为"+data.userName+"，</nobr><br><nobr>初始密码为"+data.password+"，</nobr>您的高铁观影验证码已经发送到您的手机，淘金山祝您旅途愉快！";
			msg += "如您对高铁观影操作有疑问，可拨打观影客服电话：4008556685，感谢您的支持！";
		}else if(data.msg=="1" || data.msg=="2"){
			msg = "手机验证码错误";
		}else if(data.msg=="3"){
			msg = "手机号已注册";
		}else if(data.msg=="4"){
			msg = "注册服务发生错误，请稍后再试！";
		}
		return msg;
	}
	
</script>

</html>
