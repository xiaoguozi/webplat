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
<body class="bg_gray" style="background-image:url('assets/img/tkj/beijin.jpg');background-size: 100%; background-repeat:no-repeat;">
       <div class="container" style="min-height:30em; height:auto!important; height:30em;min-width:21em" >
       		<div class="row" >
                <div class="col-xs-12" style="text-align: center;margin-top: 10px;">
                    <img src="assets/img/tkj/biaoq.png" >
                </div>
                <div class="col-xs-12" style="text-align: center; margin-top: 10px;">
                    <span style="color: #ffffff; font-size: 18px;">我要提多少</span>
                </div>
			</div>

            <div class="row" style="min-height: 57px;line-height: 57px; margin-top: 10px;">
                <div class="col-xs-1"></div>
                <div class="col-xs-10" style="background-image:url('assets/img/tkj/shulukuan.png'); background-size: 100% 90%; background-repeat:no-repeat;">
                    <div class="col-xs-2" >
                        <img src="assets/img/tkj/jian.png" style="vertical-align: middle; margin-left: -10px; margin-top: -8px;">
                    </div>
                    <div class="col-xs-6">
                        <input value="100" style="border: 1px solid #737373; height: 30px; text-align:center; line-height:30px; width: 118px;  font-size: 18px; margin-top: 12px;" />
                    </div>
                    <div class="col-xs-2" style="text-align: right;">
                        <img src="assets/img/tkj/jia.png" style="vertical-align: middle; margin-left: 20px; margin-top: -8px;">
                    </div>
                </div>
                <div class="col-xs-1"></div>
            </div>

           <div class="row" style="margin-top: 20px;">
               <div class="col-xs-12" style="text-align: center; ">
                   <span style="color: #ffffff; font-size: 18px;">我要提多久</span>
               </div>
           </div>
           <div class="row" style="min-height: 57px;line-height: 57px; margin-top: 10px;">
               <div class="col-xs-1"></div>
               <div class="col-xs-10" style="background-image:url('assets/img/tkj/shulukuan.png');background-size: 100% 90%; background-repeat:no-repeat;">
                   <div class="col-xs-2" >
                       &nbsp;
                   </div>
                   <div class="col-xs-6">
                       <input style="border: 1px solid #737373; height: 30px; line-height:30px;width: 118px; text-align:center;  font-size: 18px; margin-top: 12px;" value="1个月" />
                   </div>
                   <div class="col-xs-2" style="text-align: right;">
                       <img src="assets/img/tkj/down.png" style="vertical-align: middle; margin-left: 20px; margin-top: -8px;">
                   </div>
               </div>
               <div class="col-xs-1"></div>
           </div>

           <div class="row" style="margin-top: 20px;">
               <div class="col-xs-12" style="text-align: center; ">
                   <span style="color: #ffffff; font-size: 18px;">提来干嘛</span>
               </div>
           </div>
           <div class="row" style="min-height: 57px;line-height: 57px; margin-top: 10px;">
               <div class="col-xs-1"></div>
               <div class="col-xs-10" style="background-image:url('assets/img/tkj/shulukuan.png');background-size: 100% 90%; background-repeat:no-repeat;">
                   <div class="col-xs-2" >
                       &nbsp;
                   </div>
                   <div class="col-xs-6">
                       <input value="创业" style="border: 1px solid #737373; height: 30px; line-height:30px;width: 118px; text-align:center;  font-size: 18px; margin-top: 12px;" />
                   </div>
                   <div class="col-xs-2" style="text-align: right;">
                       <img src="assets/img/tkj/down.png" style="vertical-align: middle; margin-left: 20px; margin-top: -8px;">
                   </div>
               </div>
               <div class="col-xs-1"></div>
           </div>


           <div class="row" style="background: #80D2DD; text-align: center; margin-top: 30px; ">
               <button type="button" class="btn" onclick="next();" style="color:#EE592E; width: 40%; border-radius: 8px; background: #FFFFFF; height: 50px; font-size: 18px; font-weight: bold;" >下一步</button>
           </div>
	   </div>
</body>

<script type="text/javascript">
	function next(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/apply";
	}
</script>

</html>
