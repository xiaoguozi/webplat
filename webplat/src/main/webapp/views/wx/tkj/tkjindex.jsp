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
    <title>提款机，无抵押、无担保、一小时放款，淘金山提款机</title>
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <meta name="keywords" content="提款机、无抵押、无担保、一小时放款" />
    <meta name="description" content="每个人都有急需要钱的时候，在提款机只需要凭借信用就可以成功提到钱，无抵押，无担保，一小时放款，打造每个人手中的提款机。" />
    <link rel="stylesheet" type="text/css"  href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
    
    <style>

        .carousel-control.right {
            right: 0px;
            left: auto;
            background-image: linear-gradient(to right, transparent 0px, rgba(0, 0, 0, 0) 100%);
            background-repeat: repeat-x;
        }

        .carousel-control.left {
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0px, transparent 100%);
            background-repeat: repeat-x;
        }

        .carousel-inner {
            text-align: center;
            margin-top: 1em;
        }

         .content {     
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
		 
		
        .content-text {
            color: #ffffff;
            padding-left: 1.6em;
            text-align: left;
        }	
			
		.bg_gray{background:#f9f9f9}
		.container{width:100%}
		.list_li li{width:30%;float:left;text-align:center}
		.list_li2 li{width:33.33333%;float:left;text-align:center}
		.center{text-align:center;color: #f04e27;}
		 h5{color: #f04e27;}			
    </style>
</head>
<body style="background:#FAFBFF;" >
        <div style="min-height:30em; height:auto!important; height:30em;min-width:21em; background:#ffffff;" >
       		
			<div style="width:100%;">
				<img src="assets/img/tkj/banner.jpg" width="100%"/>
			</div>
			
			<div onclick="goBorrow();" class="row content" style="background-color:#FFD87B;margin-top:10px; margin-left:15px; margin-right:15px; ">
				     
				     <div class="content-text col-xs-8" style="margin-top:13px; margin-bottom:13px;">
	                    <p style="font-size:18px;color:#000000;">我要提款</p>
	                    <p style="font-size:12px; color:#986D4B;"><nobr>月息低至0.99%，额度最高2万</nobr></p>
	                </div>
	                <div class="content-img col-xs-4" style="margin-top:13px; margin-bottom:13px;">
	                    <img src="assets/img/tkj/tubiao1.png" style="width:5em;height:5em"/>
	                </div>
			</div>
    
	      <div class="row" >
		      <div class="center" style="margin-top:0.5em;margin-bottom:0.5em"><p style="font-size:1.2em; color:#9DD3C6;">比你想象的更简单</p></div>
			  <div class="container list_li">
			 	<div class="row">
					<ul class="list-unstyled">
						<li class="active" style="margin-left:3px;">
							<img src="assets/img/tkj/tubiao2.png" style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">提交申请</p>
								<p style="font-size:0.8em;color:#b8b8b8;">在线提交申请</p>
							</div>
						</li>
						<li style="width:5%;float:left;text-align:left;margin-top:24px; margin-left:-5px;">
							<img src="assets/img/tkj/dot.png" >
						</li>
						<li class="">
							  <img src="assets/img/tkj/tubiao3.png"  style="width:5em;height:5em">
							  <div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">等待审核</p>
								<p style="font-size:0.8em;color:#b8b8b8;">审核资料</p>
							 </div>
						</li>
						<li style="width:5%;float:left;text-align:left;margin-top:24px; margin-left:-5px;">
							<img src="assets/img/tkj/dot.png" >
						</li>
						<li class="">                  
							<img src="assets/img/tkj/tubiao4.png"  style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">放款成功</p>
								<p style="font-size:0.8em;color:#b8b8b8;">最快1小时内可到账&nbsp;&nbsp;</p>
							</div>
						</li>
					</ul>
				</div>							
			</div>
		  </div>		 
		  
		  
		  <div class="row" style="margin-top:15px;border-top:1px solid #E5E5E7; background:#FAFBFF;">
			  <div class="container list_li2" style="margin-top:15px;">
			 	<div class="row">
					<ul class="list-unstyled">
						<li class="active" onclick="goBorrow();">
							<img src="assets/img/tkj/tubiao3-1.png" style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">我要还款</p>
							</div>
						</li>
						<li class="" onclick="goFenqi();">
							  <img src="assets/img/tkj/tubiao3-2.png"  style="width:5em;height:5em">
							  <div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">我的账户</p>
							 </div>
						</li>
						<li class="">                  
							<img src="assets/img/tkj/tubiao3-3.png"  style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #9DD3C6;">MI我吧</p>
							</div>
						</li>
					</ul>
				</div>							
			</div>
		  </div>	
	   </div>
           
       
</body>

<script type="text/javascript">
	function goFenqi(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/fenqi";
	}
	
	function goBorrow(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/borrow";
	}
</script>


</html>
