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
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    
</head>
<body style="background-image:url('assets/img/tkj/beijin_long.jpg');background-size: 100% 100%; background-repeat:no-repeat;">
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
                    	<div style="width: 33px; min-height: 33px; " onclick="jian();" >
	                        <img src="assets/img/tkj/jian.png" style="vertical-align: middle; margin-left: -10px; margin-top: -8px;">
                    	</div>
                    </div>
                    <div class="col-xs-6">
                        <input id="amountInput" type="text" maxlength="5" onblur="inputBlur(this);" onkeyup="inputBlur(this);" onafterpaste="inputBlur(this);" value="1000" style="border: 1px solid #737373; height: 30px; text-align:center; line-height:30px; width: 118px;  font-size: 18px; margin-top: 12px;" />
                    </div>
                    <div class="col-xs-2" style="text-align: right;" >
                        <img src="assets/img/tkj/jia.png" onclick="jia();" style="vertical-align: middle; margin-left: 20px; margin-top: -8px;">
                    </div>
                </div>
                <div class="col-xs-1"></div>
            </div>

           <div class="row" style="margin-top: 10px;">
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
                       <input readonly="readonly" id="inputMonth" onfocus="this.blur();" style="border: 1px solid #737373; height: 30px; line-height:30px;width: 118px; text-align:center;  font-size: 18px; margin-top: 12px;" value="1个月" />
                   </div>
                   <div class="col-xs-2" style="text-align: right;">
                   		<div class="dropdown" style="margin-top: -5px;">
						   <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
						      data-toggle="dropdown">
						      <img alt="" src="assets/img/tkj/down.png" />
						   </button>
						   <ul class="dropdown-menu pull-left" style="min-width: 100px; margin-left: -30px;" id="ulMonth" role="menu" aria-labelledby="dropdownMenu1">
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="1个月">1个月</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="3个月">3个月</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="6个月">6个月</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="12个月">12个月</a>
						      </li>
						   </ul>
						</div>
                   </div>
               </div>
               <div class="col-xs-1"></div>
           </div>

           <div class="row" style="margin-top: 10px;">
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
                       <input value="创业" id="inputTarget" readonly="readonly" onfocus="this.blur();" style="border: 1px solid #737373; height: 30px; line-height:30px;width: 118px; text-align:center;  font-size: 18px; margin-top: 12px;" />
                   </div>
                   <div class="col-xs-2" style="text-align: right;">
                       <div class="dropdown" style="margin-top: -5px; ">
						   <button type="button" class="btn dropdown-toggle" id="dropdownMenu2" 
						      data-toggle="dropdown">
						      <img alt="" src="assets/img/tkj/down.png" />
						   </button>
						   <ul class="dropdown-menu" style="min-width: 100px; margin-left: -30px;" id="ulTarget" role="menu" aria-labelledby="dropdownMenu2">
						      <li role="presentation" >
						         <a role="menuitem" tabindex="-1" data="创业" >创业</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="消费购物">消费购物</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="应急周转">应急周转</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="培训助学">培训助学</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="旅行">旅行</a>
						      </li>
						      <li role="presentation" class="divider"></li>
						      <li role="presentation">
						         <a role="menuitem" tabindex="-1" data="就业准备">就业准备</a>
						      </li>
						   </ul>
						</div>
                   </div>
               </div>
               <div class="col-xs-1"></div>
           </div>
           
           <div  style="margin-top: 5px; width: 100%;">
	           	<nobr><span style="font-size: 14px; font-family: bold;">提款总额：</span>
	           	<span style="font-size: 14px; font-family: bold; color: #E95024;">100</span>
	           	<span style="font-size: 11px;color: #E95024;">(元)</span> 
	           	<span style="font-size: 14px; font-family: bold;">利息：</span>
	           	<span style="font-size: 14px; font-family: bold; color: #E95024;">5.0</span>
	           	<span style="font-size: 11px;color: #E95024;">(元)</span> 
	           	<span style="font-size: 14px; font-family: bold; color: #E95024; cursor:pointer;" onclick="goPlan();">还款计划&gt;&gt;</span>
	           	</nobr>
           </div>
           <div style="text-align: center;  width: 100%; margin-top:5px;">
               <button type="button" class="btn" onclick="next();" style="color:#EE592E; width: 40%; border-radius: 8px; background: #FFFFFF; height: 45px; font-size: 18px; font-weight: bold;" >下一步</button>
           </div>
	   </div>
</body>

<script type="text/javascript">
	function goPlan(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/plan";
	}

	function next(){
		window.location.href = "<%=basePath%>"+"rest/wx/tkj/apply";
	}
	
	function jian(){
		//alert();
		var amount = $("#amountInput").val();
		if(!amount){
			amount = 0;
		}
		amount = amount*1 - 100;
		//alert(amount);
		if(amount<0){
			amount = 0;
		}
		$("#amountInput").val(amount);
	}
	
	function jia(){

		var amount = $("#amountInput").val();
		if(!amount){
			amount = 0;
		}
		
		amount = amount*1 + 100;
		if(amount>50000){
			amount = 50000;
		}
		$("#amountInput").val(amount);
	}
	
	function inputBlur(obj){
		obj.value=obj.value.replace(/\D/g,''); 
		if(isNaN(obj.value)){
			obj.value=0;
		}
		if(obj.value>50000){
			obj.value=50000;
		}
		if(obj.value<0){
				obj.value=0;
		}
	}
	
	$(function(){
		$("#ulMonth > li").click(function(){
			$("#inputMonth").val($(this).children(0).attr("data"));
		});
		
		$("#ulTarget > li").click(function(){
			$("#inputTarget").val($(this).children(0).attr("data"));
		});
	})
	
	
</script>

</html>
