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
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0">
    <title>淘金山</title>
    <div id='wx_pic' style='margin:0 auto;display:none;'>
       <img src='assets/img/fx_logo.jpg' />
    </div>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <script src="assets/scripts/ui/jquery-1.10.2.min.js" type="text/javascript"></script> 
</head>

<body>
    <div class="container">
        <div class="row" >
            <a href="javascript:void(0);" class="btn btn-block btn-lg back_btn " style="background: #45A7FF;cursor: default;">预约</a>
        </div>
        <div class="row" >
        	<div class="col-xs-12" style="background: #F2F2F2;">
                    <label style="margin-top: 5px;">
                        <span style="color:#000; font-size: 20px; font-weight: bold;">${xtName}</span>
                    </label>
            </div>          
            <div class="pei_money col-xs-12" style="margin-top: 0px;">
            	<form id="xtForm" action="rest/wx/xintuo/orderProduct" method="post">
            		<input type="hidden" name="productId" value="${productId}"/>
            		<input type="hidden" name="productType" value="10" />
            		
	                <div class="row">
	                    <div class="b_b">
	                        <div class="col-xs-4">
	                            <label for="userName">
	                                <h4>客户姓名</h4></label>
	                        </div>
	                        <div class="col-xs-8">
	                            <h4>
	                                <input type="text" maxlength="12"  placeholder="请输入姓名" class="form-control" id="userName" name="userName" placeholder="请输入姓名">
	                           </h4>
	                        </div>
	                    </div>
	                    <div class="b_b">
	                        <div class="col-xs-4">
	                            <label for="userPhone">
	                                <h4>客户手机</h4></label>
	                        </div>
	                        <div class="col-xs-8">
	                            <h4>
	                                <input type="text" maxlength="11" class="form-control" id="userPhone" name="userPhone" placeholder="请输入手机号码">
	                           </h4>
	                        </div>
	                    </div>
	                </div>
	                
	               
	               
	                <div class="row" style="display:none" id="rowInfo">
	                    <div class="b_b">
	                        <div class="col-xs-12">
	                            <span style="color:red;font-size:14px" id="tipInifo">
	                               
	                           </span>
	                        </div>
	                    </div>	                   
	                </div>
	                
                </form>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding-bottom:20px">
                    <a id="aConfirm" class="btn btn-block btn_orange">确&nbsp;定</a>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="assets/scripts/wx/require.js" data-main="assets/scripts/wx/main"></script>
<script type="text/javascript">
	$(function(){ 
		$("#aConfirm").click(function(event){
	    	event.preventDefault();
	    	if($.trim($("#userName").val())==''){
	    		$("#tipInifo").html("请输入姓名");
	    		$("#rowInfo").css("display","block");
	    		return ;
	    	}
	    	
			if($.trim($("#userPhone").val())==''){
				$("#tipInifo").html("请输入手机号码");
	    		$("#rowInfo").css("display","block");
	    		return;
	    	}
			
			if(!(/^1[3|4|5|7|8]\d{9}$/.test($("#userPhone").val().replace(/^\s+|\s+$/g, '')))){
				$("#tipInifo").html("请输入正确的手机号码");
	    		$("#rowInfo").css("display","block");
				return;
			}
	    	
			
	    	$("#xtForm").submit();
		});
	});
</script>

</html>
