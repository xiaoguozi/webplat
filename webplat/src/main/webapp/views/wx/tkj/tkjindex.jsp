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
            -webkit-border-radius: 1em;
            -moz-border-radius: 1em;
            border-radius: 1em;
        }
		 
		
        .content-text {
            color: #ffffff;
            padding-left: 1.6em;
            text-align: left;
        }	
			
		.bg_gray{background:#f9f9f9}
		.container{width:100%}
		.list_li li{width:33.333333%;float:left;text-align:center}
		.center{text-align:center;color: #f04e27;}
		 h5{color: #f04e27;}			
    </style>
</head>
<body class="bg_gray" >
        <div class="container" style="min-height:30em; height:auto!important; height:30em;min-width:21em" >
       		<div class="row" >
			    <div class="col-xs-12" >
					<div id="carousel-example-generic" class="carousel slide " data-ride="carousel" >
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
		
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active" style="text-align:center">
								<img alt="First slide" src="assets/img/tkj/banner1.jpg" style="height:8em;width:12em;display:inline" />
							</div>
							<div class="item"  style="text-align:center">
								<img alt="Second slide" src="assets/img/tkj/banner1.jpg" style="height:8em;width:12em;display:inline"/>
							</div>
							<div class="item"  style="text-align:center">
								<img alt="Third slide" src="assets/img/tkj/banner1.jpg" style="height:8em;width:12em;display:inline" />
							</div>
						</div>
		
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				 </div>
			</div>
			
			<a href="rest/wx/tkj/borrow" >
			<div class="row content" style="background-color:#81D2D5;padding-top:0.5em;padding-bottom:0.5em">
			     <div class="content-text col-xs-8" >
                    <p style="font-size:1.2em">我要提款</p>
                    <p style="font-size:1em">月息低至0.99%，额度100-20000</p>
                </div>
                <div class="content-img col-xs-4" >
                    <img src="assets/img/tkj/tubiao1.png" style="width:5em;height:5em"/>
                </div>
		  </div>
		  </a>
    
	      <div class="row" >
		      <div class="center" style="margin-top:0.5em;margin-bottom:0.5em"><p style="font-size:1.2em">比你想象的too simple</p></div>
			  <div class="container list_li">
			 	<div class="row">
					<ul class="list-unstyled">
						<li class="active">
							<img src="assets/img/tkj/tubiao2.png" style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #f04e27;">提交申请</p>
								<p style="font-size:0.8em;color:#d8d8d8">在线提交申请</p>
							</div>
						</li>
						<li class="">
							  <img src="assets/img/tkj/tubiao3.png"  style="width:5em;height:5em">
							  <div class="classicon">
								<p style="font-size:1.1em;color: #f04e27;">等待审核</p>
								<p style="font-size:0.8em;color:#d8d8d8">审核资料</p>
							 </div>
						</li>
						<li class="">                  
							<img src="assets/img/tkj/tubiao4.png"  style="width:5em;height:5em">
							<div class="classicon">
								<p style="font-size:1.1em;color: #f04e27;">放款成功</p>
								<p style="font-size:0.8em;color:#d8d8d8">最快1小时内可到账</p>
							</div>
						</li>
					</ul>
				</div>							
			</div>
		  </div>		  				
	   </div>
           
       <footer style="padding-top:0px;">
		  <div class="container">
            <div class="row" >
				<ul class="list-unstyled">
                    <li class="active" style="background-color:#596273">
                    	<a href="rest/wx/tkj/fenqi">
                        <img src="assets/img/tkj/tubiao5.png"  style="width:5em;height:5em">
						<div class="classicon">
							<h5 style="color:#ffffff">我要还款</h5>
						</div>
						</a>
                    </li>
                    <li class="" style="background-color:#dce4e7">
                    	<a href="rest/wx/tkj/borrow">
                        <img src="assets/img/tkj/tubiao6.png"  style="width:5em;height:5em">
                    	<div class="classicon">
                       	 <h5 style="color:#4e4e4e">我的账户</h5>
                    	</div>
                    	</a>
                    </li>
                    <li class="" style="background-color:#f6f2f1" >                  
                        <div class="classicon">
                           <img src="assets/img/tkj/tubiao7.png"  style="width:5em;height:5em" >
                    	   <h5  style="color:#4e4e4e">MI我吧</h5>
                        </div>
                    </li>
                </ul>							
            </div>
		</div>
      </footer>
</body>

</html>
