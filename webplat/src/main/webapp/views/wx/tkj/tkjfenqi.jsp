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
</head>
<body class="bg_gray" style="background: #80D2DD;">
        <div class="container" style="min-height:30em; height:auto!important; height:30em;min-width:21em" >
       		<div class="row" >
                <div class="col-xs-12" style="background: #81D2D5; min-height: 20px;"></div>
			    <div class="col-xs-12" style="background: #81D2D5; ">
                        <span style="font-weight: bold;">剩余还款总额</span><span style="font-size: 12px;">（元）</span>
				</div>
                <div class="col-xs-12" style="background: #81D2D5; min-height: 10px;"></div>
                <div class="col-xs-12" style="background: #81D2D5; ">
                    <span style="font-size: 38px; color: #FFFFFF;font-weight: bold;">1200.00</span></span>
                </div>
			</div>
           <div class="row" >
               <div class="col-xs-12" style="background: #81D2D5; min-height: 10px;"></div>
               <div class="col-xs-12" style="background: #81D2D5; ">
                   <span style="color: #FFFFFF;">包含利息200（元）</span>
               </div>
               <div class="col-xs-12" style="background: #81D2D5; min-height: 10px;"></div>
           </div>
           <div class="row" style="background: #ffffff; min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-6" >
                   <span style="font-size: 16px;">账单总额</span>
               </div>
               <div class="col-xs-6" style="text-align: right;">
                   <span style="color: #C9C9C9;font-size: 16px;">1400.00</span>
               </div>
           </div>
           <div class="row" style="background: #ffffff; min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-6" >
                   <span style="font-size: 16px;">已还款</span>
               </div>
               <div class="col-xs-6" style="text-align: right;">
                   <span style="color: #C9C9C9;font-size: 16px;">200.00</span>
               </div>
           </div>
           <div class="row" style="background: #ffffff; min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-6" >
                   <span style="font-size: 16px;">未分期</span>
               </div>
               <div class="col-xs-6" style="text-align: right;">
                   <span style="color: #C9C9C9;font-size: 16px;">创建还款计划&nbsp;<span class="icon-a" style="color: #E2E2E2;"></span></span>
               </div>
           </div>
           <div class="row" style="min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-12" >
                   <span style="font-size: 16px;">账单明细</span>
               </div>
           </div>

           <div class="row" style="background: #ffffff; min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-7" >
                   <div style="line-height: 28px;">
                      <img src="assets/img/tkj/fenqi.png"> &nbsp;2015年8月分期
                   </div>
                   <div style="line-height: 22px; color: #C9C9C9;">
                       01/03期
                   </div>
               </div>
               <div class="col-xs-5" style="text-align: right; ">
                   <span style="color: #C9C9C9;font-size: 16px;">50.00&nbsp;<span class="icon-a" style="color: #E2E2E2;"></span></span>
               </div>
           </div>
           <div class="row" style="background: #ffffff; min-height: 50px; line-height: 50px; border-bottom: 1px solid #E2E2E2;">
               <div class="col-xs-6" >
                   <div style="line-height: 28px;">
                       <img src="assets/img/tkj/huankuan.png"> &nbsp;主动还款
                   </div>
                   <div style="line-height: 22px; color: #C9C9C9;">
                       07-30
                   </div>
               </div>
               <div class="col-xs-6" style="text-align: right;">
                   <span style="color: #C9C9C9;font-size: 16px;">200.00&nbsp;<span class="icon-a" style="color: #E2E2E2;"></span></span>
               </div>
           </div>

           <div class="row" style="text-align: center;margin-top: 10px;">
                 <button type="button" class="btn" style="background: #F04E27; font-size: 20px; color: #FFFFFF;width: 88%; ">还&nbsp;&nbsp;&nbsp;款</button>
           </div>

       </div>
</body>

</html>
