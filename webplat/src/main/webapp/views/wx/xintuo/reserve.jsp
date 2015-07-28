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
            <form id="xtForm" action="rest/wx/xintuo/orderProduct" method="post">
         	<input type="hidden" name="productId" value="${productId}"/>
         	<input type="hidden" name="productType" value="10" />
	            <div class="col-xs-12">
	             	<div class="form-group" >
						    <label>客户姓名</label>
						    <input type="text" class="form-control" name="userName" id="userName" value="${name}" placeholder="请输入姓名">
					   </div>
			  
					  <div class="form-group" style="margin-bottom:2px">
					    <label>客户手机</label>
					    <input type="text" class="form-control" id="userPhone" name="userPhone" value="${userPhone}" placeholder="请输入手机号码">
					  </div>
	                   
	                  <div class="form-group" style="margin-bottom:2px">
					    <label>备注</label>
					     <textarea rows="4" cols="50" class="form-control" name="dataRemark" maxlength="200"></textarea>
					  </div>
	             	
	             </div> 
	             
	             <div class="col-xs-12">
	                 <span style="color:red;font-size:14px" id="tipInifo">
	                    
	                </span>
	             </div>   
            </form>     
          
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
