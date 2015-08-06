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
    <title>提款机，无抵押、无担保、一小时放款，淘金山提款机</title>
    <link href="assets/css/wx/index.css" rel="stylesheet" type="text/css" />
    <meta name="keywords" content="提款机、无抵押、无担保、一小时放款" />
    <meta name="description" content="每个人都有急需要钱的时候，在提款机只需要凭借信用就可以成功提到钱，无抵押，无担保，一小时放款，打造每个人手中的提款机。" />
    <link rel="stylesheet" type="text/css"  href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <script src="assets/scripts/ui/jquery.js" type="text/javascript"></script>
</head>
<body style="background:#ffffff;" >
        <div class="container" style="min-height:30em; height:auto!important; height:30em;min-width:21em" >
       		<div class="row" >
                <div class="col-xs-12" style="background: #F7F9F8; min-height: 20px;"></div>
			    <div class="col-xs-12" style="background: #F7F9F8; text-align:center;">
                        <span style="font-weight: bold;">提款金额</span><span style="font-size: 12px;">（元）</span>
				</div>
                <div class="col-xs-12" style="background: #F7F9F8; min-height: 10px;"></div>
                <div class="col-xs-12" style="background: #F7F9F8; text-align:center;">
                    <span style="font-size: 38px; color: #F04E27;font-weight: bold;">10000.00</span>
                </div>
			</div>
           <div class="row" style="border-bottom:1px solid #DEDEDE;">
               <div class="col-xs-12" style="background: #F7F9F8; min-height: 10px;"></div>
               <div class="col-xs-12" style="background: #F7F9F8; text-align:center;">
                   <span style="color: #9FA1A0;">利息200（元）</span>
               </div>
               <div class="col-xs-12" style="background: #F7F9F8; min-height: 10px;"></div>
           </div>
           
           <div style="background:#8D8D8D; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-08-05</span></div>
           		<div style="width:50%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">9000.00&nbsp;</span></div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-09-05</span></div>
           		<div style="background:#8D8D8D;width:47%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">8000.00&nbsp;</span></div>
           		<div style="width:3%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-10-05</span></div>
           		<div style="background:#8D8D8D;width:44%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">7000.00&nbsp;</span></div>
           		<div style="width:6%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-11-05</span></div>
           		<div style="background:#8D8D8D;width:41%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">6000.00&nbsp;</span></div>
           		<div style="width:9%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-12-05</span></div>
           		<div style="background:#8D8D8D;width:38%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">5000.00&nbsp;</span></div>
           		<div style="width:12%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2016-01-05</span></div>
           		<div style="background:#8D8D8D;width:35%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">4000.00&nbsp;</span></div>
           		<div style="width:15%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-02-05</span></div>
           		<div style="background:#8D8D8D;width:32%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">3000.00&nbsp;</span></div>
           		<div style="width:18%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-03-05</span></div>
           		<div style="background:#8D8D8D;width:29%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">2000.00&nbsp;</span></div>
           		<div style="width:21%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>
           
           <div style="background:#DDDDDD; float:left; margin-top:10px; min-height:45px; line-height:45px; width:100%;">
           		<div style="background:#8D8D8D;width:50%;text-align:left;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">&nbsp;2015-04-05</span></div>
           		<div style="background:#8D8D8D;width:26%;text-align:right;min-height:45px; line-height:45px;float:left; "><span style="color:#ffffff;">1000.00&nbsp;</span></div>
           		<div style="width:24%;text-align:right;min-height:45px; line-height:45px;float:left; ">&nbsp;</div>
           </div>

       </div>
</body>

</html>
