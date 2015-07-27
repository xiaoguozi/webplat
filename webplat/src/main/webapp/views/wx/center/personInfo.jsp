<%@ include file="/views/wx/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head >
 	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0">
    <title>淘金山-基本资料</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/center.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/ui-dialog.css" rel="stylesheet" />
    <link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />	
    <link href="assets/css/ui/peizi.css" rel="stylesheet" />	
    
</head>

<body class="bg_gray">
    <div class="container">		
		 <div class="row" >
            <a class="btn btn-block btn-lg back_btn" style="cursor: default;width: 100%;"><font style="font-family: 黑体;color:#080808; font-size: 20px;">基本资料</font></a>
         </div>
		
		<input type="hidden" id="validateHiddenName" />
	    <input type="hidden" id="validateHiddenCertId" />
		<c:if test="${userInfo.isValidate!=1}">
		<div class="row pei_money" style="margin-top:10px" id="aValidate" onclick="validateNameCertId();">
		</c:if>
		<c:if test="${userInfo.isValidate==1}">
		<div class="row pei_money" style="margin-top:10px" onclick="viewValidateNameCertId();">
		</c:if>
		
			<div class="col-xs-2" style="margin-top:10px">
				<c:if test="${userInfo.isValidate==1}">
					<p><img src="assets/img/wx/dui.png"/></p>
				</c:if>
				<c:if test="${userInfo.isValidate!=1}">
					<p><img id="vImgAlert" src="assets/img/wx/cuo.png"/><img id="vImgSuc" src="assets/img/wx/dui.png" style="display:none;" /></p>
				</c:if>
			</div>
			<div class="col-xs-8" style="padding-top:10px;margin-left:-20px">
				<c:if test="${userInfo.isValidate!=1}">
					<p style="font-size:20px; color:#3f3f3f;" ><b id="bValidate">实名认证</b></p>	
				</c:if>	
				<c:if test="${userInfo.isValidate==1}">
					<p style="font-size:20px; color:#3f3f3f;"><b>查看实名认证信息</b></p>	
				</c:if>					  
			</div>
			<div class="col-xs-1" style="padding-top: 10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>
		
		<div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/dui.png" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>登陆密码</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>				
	  
	  
	  <div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/dui.png" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>手机认证</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>				
	  
	  
	  <div class="row pei_money" style="margin-top:10px">
			<div class="col-xs-2" style="margin-top:10px"><p><img src="assets/img/wx/${(empty userInfo.email||empty userInfo.qqNo )?'cuo.png':'dui.png'}" /></p></div>
			<div class="col-xs-8" style="padding-top: 10px;margin-left:-20px">
				<p style="font-size:20px; color:#3f3f3f; "><b>邮箱QQ</b></p>
			</div>
			<div class="col-xs-1" style="padding-top:10px;margin-left:25px">
				<span class="pull-right icon-a" style="margin-top: 3px; color: #b4b4b4;"></span>
			</div>	
		</div>						
   </div>

	
	
	<footer>
        <div class="container">
            <div class="row">
                <ul class="list-unstyled">
                    <li class="">
                        <a href="rest/wx/xintuo/index">
                            <span class="menu-home"></span>
                            <p>首页</p>
                        </a>
                    </li>
                    <li >
                        <a href="rest/wx/moreProducts">
                            <span class="menu-shopping"></span>
                            <p>我要理财</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="rest/wx/center/index">
                            <span class="menu-person"></span>
                            <p>个人中心</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script src="assets/scripts/ui/dialog-min.js" charset="utf-8"></script>

<script type="text/javascript">
	

	function viewValidateNameCertId(){
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-certId\" action=\"rest/web/userCenter/userModifyData\" method=\"post\">";
		dialogContent += "<div  ><nobr><img src=\"assets/img/peizi/check_sucess.png\" valign=\"center\">&nbsp;真实姓名：<span id=\"span_register_name\">${userInfo.name}</span></nobr></div><br/>";
		dialogContent += "<div  ><nobr><img src=\"assets/img/peizi/check_sucess.png\" valign=\"center\">&nbsp;身份证号：<span id=\"span_register_certId\">${userInfo.certId}</span></nobr></div>";
		dialogContent += "</form></div>";
		
		dInput = dialog({
		    title: '实名认证信息',
		    content: dialogContent,
		    width:230,
		    okValue: '确定',
		    ok:function(){}
		});
		
		dInput.showModal();	
		if($("#validateHiddenName").val()!=""){
			$("#span_register_name").html($("#validateHiddenName").val());
		}
		var certId = $("#validateHiddenCertId").val();
		if(certId!=""){
			certId = certId.substring(0,3)+"***********"+certId.substring(certId.length-4);
			$("#span_register_certId").html(certId);
		}
		
	}
	
	var tipDialog;
	//实名认证输入框
	var dInput;
	function validateNameCertId(){
		var dialogContent = "<div>";
		dialogContent += "<form class=\"modify-form-certId\" action=\"rest/web/userCenter/userModifyData\" method=\"post\">";
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\"><nobr>真实姓名：</nobr></div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_name\" name=\"userInfo.name\" value=\"${name}\" type=\"text\" onblur=\"onBlurName(this);\" class=\"tjs_register_input\" style=\"width:160px; font-size:12px;\" tabindex=\"1\" spellcheck=\"false\" maxLength=\"10\" placeholder=\"请输入您的真实姓名\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\">&nbsp;<span style=\"color:red;margin-top:5px;height:30px;font-size:12px;\" id=\"span_register_username\"></span></div>";
		
		dialogContent += "<div class=\"tjs_register_left_new\" style=\"width:28%\"><nobr>身份证号：</nobr></div><div class=\"tjs_register_right_new\" style=\"margin-left:20px\"><input id=\"register_certId\" name=\"userInfo.certId\" value=\"${certId}\" type=\"text\" onblur=\"onBlurCertId(this)\" class=\"tjs_register_input\" style=\"width:160px; font-size:12px;\" tabindex=\"2\" spellcheck=\"false\" maxLength=\"20\" placeholder=\"请输入您的身份证号码\" autofocus x-webkit-speech ></div>";
		dialogContent += "<div class=\"tjs_register_left_new_text\" style=\"width:25%\"></div><div class=\"tjs_register_right_new_text\" style=\"margin-left:20px\">&nbsp;<span style=\"color:red;margin-top:5px;height:30px;font-size:12px;\" id=\"span_register_certId\"></span></div>";
		
		dialogContent += "<div style=\"height:60px; width:75%; text-align: center;\"><a id=\"register-submit-cert-btn\" href=\"#\" class=\"tjs_registerbtn\" style=\"width:230px;\">开始认证</a></div>";
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
				    width: 220,
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
	                	userId:'${userInfo.userId}'
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
    		//$("#validateSpan").text("已完成实名认证 ");
    		$("#bValidate").html("查看实名认证信息");
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
	
</script>

</html>
