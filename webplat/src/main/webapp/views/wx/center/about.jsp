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
    <title>关于淘金山</title>
     <div id='wx_pic' style='margin:0 auto;display:none;'>
       <img src='assets/img/fx_logo.jpg' />
    </div>   
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    	.rotateTop{display:inline-block;
    			transition:all 0.5s ease;
    			-webkit-transition:all 0.5s ease;
    			-moz-transition:all 0.5s ease;
    			-o-transition:all 0.5s ease;
    			-ms-transition:all 0.5s ease;
		    	transform:rotate(-90deg);
		    	-moz-transform:rotate(-90deg);
		    	-o-transform:rotate(-90deg);
		    	-ms-transform:rotate(-90deg);
		    	-webkit-transform:rotate(-90deg);
    	}
    </style>
</head>

<body class="bg_gray">
    <div class="container">             	  
	  <div class="row" >
	  	 <div class="b_b" style="bordr:0px;margin-top:30px">
              <div class="col-xs-12" style="text-align:center;bordr:0px">
                     <span><img src="assets/img/wx/logo.png"/></span>
              </div>
              
              <div class="col-xs-12" style="margin-top:30px">
                    <h4 style="color:#3f3f3f"><span style="color:#ff6b09">服务热线：</span>4006-114-088</h4>
              </div>
              
               <div class="col-xs-12" style="margin-top:10px">
                    <h4 style="color:#3f3f3f"><span style="color:#ff6b09">联系地址：</span>深圳市福田区福强路4001号文化创意园A座6层（地铁龙岗线益田站D出口）</h4>
              </div>    
                                    
         </div>
                    
	  </div>	  	 	  
	</div>
       
      <footer>
        <div class="container">
            <div class="row" style="border:0px">
               <div class="col-xs-12" style="border:0px;padding-bottom:20px">
                    <a href="rest/web/passport/mlogout" class="btn btn-block btn_orange">退出登录</a>
                </div>
            </div>
        </div>
    </footer>   
                              
    
</body>
<script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	function showPanel(obj,panelId){
		var _this = $(obj);
		var obj = $("#"+panelId);
		var objArrow = $("#"+panelId+"Arrow");
		if(obj.css("display")!='none'){
			obj.css("display", "none");
			objArrow.removeClass("rotateTop");
			objArrow.addClass("rotate");
			_this.css("border-bottom","1px solid #DDDDDD");
		}else{
			obj.css("display", "block");
			objArrow.removeClass("rotate");
			objArrow.addClass("rotateTop");
			_this.css("border-bottom","0px");
		}
	}
			
</script>

</html>
