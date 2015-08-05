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
<body class="bg_gray" style="background: #80D2DD; margin-left: 0px; margin-right: 0px;">
       <div >
       		<div class="row" style="background: #80D2DD;">
                <div class="col-xs-12" style="text-align: center;margin-top: 10px;">
                    <img src="assets/img/tkj/buzou1.png">&nbsp;
                </div>
			</div>

           <div class="row" style="background: #80D2DD;">
               <div class="col-xs-12" style="text-align: left;margin-top: 5px; color: #ffffff; font-size: 16px; ">
                   &nbsp;身份验证
               </div>
           </div>


           <div style="height: 50px; line-height: 50px; float: left; width: 100%; background: #FFFFFF; border-bottom: 1px solid #DDDDDD;">
               <div style="height: 50px; line-height: 50px; width: 30%;  float: left;">
                   <span>&nbsp;姓名</span>
               </div>
               <div style="height: 50px; line-height: 50px;width: 70%;  float: left;">
                   <input type="text" class="form-control" style="height:34px;line-height: 34px; width: 90%;  margin-top: 8px;" id="name"
                          placeholder="请输入名字">
               </div>
           </div>

           <div style="height: 50px; line-height: 50px; float: left; width: 100%;background: #FFFFFF;">
               <div style="height: 50px; line-height: 50px; width: 30%;  float: left;">
                   <span>&nbsp;身份证号码</span>
               </div>
               <div style="height: 50px; line-height: 50px;width: 70%;   float: left;">
                   <input type="text" class="form-control" style="height:34px;line-height: 34px;  width: 90%; margin-top: 8px;" id="certId"
                          placeholder="请输入身份证号码">
               </div>
           </div>


           <div class="row" style="background: #ffffff; min-height: 15px;">&nbsp;</div>
           <div class="row" style="background: #80D2DD; text-align: center; min-height: 10px;">&nbsp;</div>
           <div class="row" style="background: #80D2DD; text-align: center; ">
               <button type="button" class="btn" style="color:#EE592E; width: 80%; background: #FFFFFF; height: 40px;" >身份认证</button>
           </div>
           <div class="row" style="background: #80D2DD; text-align: center;  min-height: 10px;">&nbsp;</div>



           <div class="row" style="background: #ffffff; min-height: 12px;"></div>
           <div class="row" style="background: #ffffff; ">
                <span style="margin-left: 15px;font-size: 16px;">手机使用情况验证</span>
           </div>
           <div class="row" style="background: #ffffff; min-height: 5px;"></div>

           <div style="background: #ffffff; height: 60px; line-height: 60px; float: left;width: 100%;" >
               <div style="height: 60px; line-height: 60px;float: left; width: 33%;">
                   <div style="width: 50%; float: left; text-align: right;">
                       <div style="height: 30px; line-height: 40px;float: left; width: 100%;">
                           <img src="assets/img/tkj/anniu.png">&nbsp;&nbsp;
                       </div>
                       <div style="height: 30px; line-height: 20px;float: left;width: 100%; ">
                           <span style="font-size: 12px;"><nobr>移动</nobr>&nbsp;</span>
                       </div>
                   </div>
                   <div style="width: 50%; float: left; text-align: left;">
                       <img src="assets/img/tkj/yidong.png">
                   </div>
               </div>
               <div style="height: 60px; line-height: 60px;float: left; width: 33%;">
                   <div style="width: 50%; float: left; text-align: right;">
                       <div style="height: 30px; line-height: 40px;float: left; width: 100%;">
                           <img src="assets/img/tkj/anniu2.png">&nbsp;&nbsp;
                       </div>
                       <div style="height: 30px; line-height: 20px;float: left;width: 100%; ">
                           <span style="font-size: 12px;"><nobr>联通</nobr>&nbsp;</span>
                       </div>
                   </div>
                   <div style="width: 50%; float: left; text-align: left;">
                       <img src="assets/img/tkj/liantong.png">
                   </div>
               </div>
               <div style="height: 60px; line-height: 60px;float: left; width: 33%;">
                   <div style="width: 50%; float: left; text-align: right;">
                       <div style="height: 30px; line-height: 40px;float: left; width: 100%;">
                           <img src="assets/img/tkj/anniu2.png">&nbsp;&nbsp;
                       </div>
                       <div style="height: 30px; line-height: 20px;float: left;width: 100%; ">
                           <span style="font-size: 12px;"><nobr>电信</nobr>&nbsp;</span>
                       </div>
                   </div>
                   <div style="width: 50%; float: left; text-align: left;">
                       <img src="assets/img/tkj/dianxin.png">
                   </div>
               </div>
           </div>


           <div class="row" style="background: #ffffff; min-height: 5px;">&nbsp;</div>
           <div style="background: #80D2DD; width: 100%; margin-top: 20px; text-align: center;">
               <button type="button" class="btn" style="color:#EE592E; width: 80%; background: #FFFFFF; height: 40px;" >手机验证</button>
           </div>

           <div style="background: #80D2DD; width: 100%; margin-top: 20px;">
                <span style="text-align: left; color: #ffffff; font-size: 16px;">紧急联系人认证</span>
           </div>


           <div style="height: 50px; line-height: 50px; width: 100%; background: #ffffff;  border-bottom: 1px solid #DDDDDD;">
               <div style="height: 50px; line-height: 50px; width: 80px;  float: left;">
                   <span>&nbsp;手机号码</span>
               </div>
               <div style="height: 50px; line-height: 50px;width: 65%;  float: left;">
                   <input type="text" class="form-control" style="height:34px;line-height: 34px; width: 90%; margin-left: 0px;  margin-top: 8px;" id="name"
                          placeholder="请输入手机号码">
               </div>
           </div>



           <div style="height: 50px; line-height: 50px; float: left; width: 100%; background: #FFFFFF; ">
               <div style="width: 60%; float: left;">
                   <div style="height: 50px; line-height: 50px; width: 80px;  float: left;">
                       <span>&nbsp;姓名</span>
                   </div>
                   <div style="height: 50px; line-height: 50px;width: 100px;  float: left;">
                       <input type="text" class="form-control" style="height:34px;line-height: 34px; width: 100px;  margin-top: 8px;" id="name"
                              placeholder="请输入姓名">
                   </div>
               </div>

               <div style="width: 40%;float: left;">
                   <div style="width: 70%; float: left; text-align: center;">
                       <span ><nobr>关系</nobr></span>
                   </div>
                   <div style="width: 30%; float: left;">
                       <img src="assets/img/tkj/down_white.png" style="vertical-align: middle; ">
                   </div>
               </div>
           </div>



           <div style="background: #80D2DD; min-height: 10px; width: 100%;">&nbsp;</div>
           <div style="background: #80D2DD; text-align: center; width: 100%;">
               <button type="button" class="btn" style="color:#EE592E; width: 80%; background: #FFFFFF; height: 40px;" >紧急联系人验证</button>
           </div>
           <div  style="background: #80D2DD; min-height: 20px; width: 100%;">&nbsp;</div>
           <div  style=" text-align: center; width: 100%;">
               <button type="button" class="btn" onclick="next();" style="color:#EE592E; width: 40%; background: #FFFFFF; height: 40px;" >下一步</button>
           </div>

           <div  style="position:absolute; width:100%;  z-index:-1; margin-bottom: 0px;  ">
               <img src="assets/img/tkj/beijingb.png"  width="100%"/>
           </div>

	   </div>
</body>


<script type="text/javascript">
	function next(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/check";
	}
</script>

</html>
