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
                <div class="col-xs-12" style="text-align: center;margin-top: 10px;">
                    <img src="assets/img/tkj/buzou3.png">
                </div>
			</div>
           <div class="row" style="background: #ffffff; margin-top: 20px; border-bottom: 1px solid #DCDCDC; min-height: 50px; line-height: 50px;" >
               <div class="col-xs-3" style="background: #ffffff;text-align: left;color: #000000;">
                   <nobr>用户名</nobr>
               </div>
               <div class="col-xs-9" style="text-align: center;color: #ffffff;">
                   <input type="text" class="form-control" id="firstname" style="margin-top: 8px;"
                          placeholder="请输入用户名">
               </div>
           </div>
           <div class="row" style="background: #ffffff; border-bottom: 1px solid #DCDCDC; min-height: 50px; line-height: 50px;" >
               <div class="col-xs-3" style="background: #ffffff;text-align: left;color: #000000;">
                   <nobr>卡号</nobr>
               </div>
               <div class="col-xs-9" style="text-align: center;color: #ffffff;">
                   <input type="text" class="form-control" id="cardId" style="margin-top: 8px;"
                          placeholder="请输入卡号">
               </div>
           </div>
           <div class="row" style="background: #ffffff; border-bottom: 1px solid #DCDCDC; min-height: 50px; line-height: 50px;" >
               <div class="col-xs-3" style="background: #ffffff;text-align: left;color: #000000;">
                   <nobr>所属银行</nobr>
               </div>
               <div class="col-xs-9" style="text-align: right;color: #ffffff;">
                   <img src="assets/img/tkj/jianhang_s.png" style="margin-top: -4px;" />&nbsp;&nbsp;<span style="color: #C9C9C9;font-size: 16px;"><span style="color: #222222;">中国建设银行</span>&nbsp;<span class="icon-a" style="color: #E2E2E2; "></span></span>
               </div>
           </div>
           <div class="row" style="background: #ffffff; border-bottom: 1px solid #DCDCDC; min-height: 50px; line-height: 50px;" >
               <div class="col-xs-3" style="background: #ffffff;text-align: left;color: #000000;">
                   <nobr>开户城市</nobr>
               </div>
               <div class="col-xs-3" style="text-align: center;color: #ffffff;">
                   <img src="assets/img/tkj/down_white.png">
               </div>
               <div class="col-xs-1" style="text-align: center;color: #ffffff;">
                   <div style="background: #dddddd; width: 1px; margin-top: 2px; margin-bottom: 2px;">&nbsp;</div>
               </div>
               <div class="col-xs-2" style="text-align: right;color: #ffffff;">
                   <img src="assets/img/tkj/down_white.png">
               </div>
           </div>
           <div class="row" style="background: #ffffff; border-bottom: 1px solid #DCDCDC; min-height: 50px; line-height: 50px;" >
               <div class="col-xs-3" style="background: #ffffff;text-align: left;color: #000000;">
                   <nobr>开户支行</nobr>
               </div>
               <div class="col-xs-9" style="text-align: center;color: #ffffff;">&nbsp;

               </div>
           </div>

           <div class="row" style="background: #80D2DD; text-align: center; margin-top: 30px; ">
               <button type="button" class="btn" onclick="next();" style="color:#EE592E; width: 80%; height:45px; background: #FFFFFF;" >下一步</button>
           </div>

           <div class="row" style="position:absolute; width:100%;  z-index:-1; margin-top: 5px;">
               <img src="assets/img/tkj/beijingb.png"  width="100%"/>
           </div>

	   </div>
</body>

<script type="text/javascript">
	function next(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/success";
	}
</script>

</html>
