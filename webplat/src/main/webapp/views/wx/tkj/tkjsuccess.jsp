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

      		
    </style>
</head>
<body class="bg_gray" style="background-image:url('assets/img/tkj/beijin_no_cloud.jpg');background-size: 100% 100%; background-repeat:no-repeat;">
        <div class="container" style="min-height:30em; height:auto!important; height:30em;min-width:21em" >
       		<div class="row" >
                <div class="col-xs-12" style="text-align: center;margin-top: 10px;">
                    <img src="images/tkj/buzou3.png">
                </div>
			</div>

           <div class="row" style="margin-top: 30px;">
               <div class="col-xs-12" style="text-align: center;">
                   <img src="images/tkj/chengong.png">
               </div>
               <div class="col-xs-12" style="text-align: center;">
                   <span style="color:#E95024; font-size: 21px; ">提款成功</span>
               </div>
           </div>
           <div class="row" style="margin-top: 30px;">
               <div class="col-xs-12" style="text-align: center;">
                   <div style="border-bottom: 1px dashed #ffffff; height: 1px; margin-left: 30px; margin-right: 30px;"></div>
               </div>
           </div>
           <div class="row" style="margin-top: 30px;">
               <div class="col-xs-12" style="text-align: left;">
                   <span style="color: #FFFFFF;">您申请提款金额为：<span style="color: #E95024; font-weight: bold;">1000</span>
                       <span style="font-size: 12px;color: #E95024;">（元）</span>，期限<span style="color: #E95024; font-weight: bold;">12个月</span></span>
               </div>
           </div>
           <div class="row" style="margin-top: 10px;">
               <div class="col-xs-12" style="text-align: left;">
                   <span style="color: #FFFFFF;">其中利息：<span style="color: #E95024; font-weight: bold;">1000</span>
                       <span style="font-size: 12px;color: #E95024;">（元）</span></span>
               </div>
           </div>
           <div class="row" style="margin-top: 10px;">
               <div class="col-xs-12" style="text-align: center;">
                   <button type="button" class="btn" onclick="next();" style="color:#EE592E; width: 100%; background: #FFFFFF;" >还款计划</button>
               </div>
           </div>
           <div class="row" style="margin-top: 30px;">
               <div class="col-xs-12" style="text-align: center;">
                   <div style="border-bottom: 1px dashed #ffffff; height: 1px; margin-left: 30px; margin-right: 30px;"></div>
               </div>
           </div>
           <div class="row" style="margin-top: 20px;">
               <div class="col-xs-12" style="text-align: left;">
                   <span style="color: #FFFFFF;">预计2015-10-02 16:00之前人工审核完成</span>
               </div>
               <div class="col-xs-12" style="text-align: left;">
                   <span style="color: #FFFFFF;">敬请期待，客服：4006-114-088</span>
               </div>
           </div>


	   </div>
          
</body>

<script type="text/javascript">
	function next(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/fenqi";
	}
</script>

</html>
