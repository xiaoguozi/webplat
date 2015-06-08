<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>淘金山-个人中心</title>
	<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet" media="screen" type="text/css" />	
	<!--配资页面样式--> 
	<link href="assets/css/ui/peizi.css" rel="stylesheet" />	
    <script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-validation/localization/messages_zh.js" type="text/javascript"></script>
    <script src="app/lib/security/sha256.js" type="text/javascript"></script>
    <script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
</head>
<body>
	<div class="home_all">
	<%@ include file="/views/web/header.jsp"%>
        <!-- /header_top -->

        <div class="header_menu">
            <div class="tjs_1108px center" style="position: relative;">
                <div class="logo_wrap">
                    <a href="http://www.taojinshan.com.cn">
                        <img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a>
                </div>
                <div class="top_wrap_menu menu">
                    <ul>
                       <c:if test="${isLog!='true'}">
                        <li><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
                        <li><a href="rest/web/peizi/activity"><span>淘金活动</span></a></li>
                        <li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
                        <li><a href="rest/web/peizi/raise"><span>淘金募集</span></a></li>
                        <li><a href="rest/web/peizi/self"><span>淘金自营</span></a></li>
                        <li><a href="rest/web/peizi/personalCenter"><span class="simu_on">个人中心</span></a></li>
                        <li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
                        </c:if>
                        
                        <c:if test="${isLog=='true'}">
                        <li><a href="#">首页</a></li>
					    <li><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
					    <li><a href="rest/web/pe/peIndex" target="_blank">私募</a></li>
					    <li><a href="rest/web/peizi/index" target="_blank">配资</a></li>
					    <li><a href="#" target="_blank">海外保险</a></li>
					    <li><a href="rest/web/aboutUs/index" target="_blank">关于我们</a></li>
                       </c:if>
                                               
                    </ul>
                </div>
            </div>
        </div>
        <!-- /header_menu -->
        <!--二级导航-->
           <div class="nav_box1">
                <ul class="nav_menu" style="width:98px;">
                    <li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
                    <li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
                    <li><a href="rest/web/peizi/lowCapital">低息1配1</a></li>
                </ul>
            </div>        
        <!--/二级导航-->
        <div class="mod_breadcrumb">
            <div class="layout_n clearfix"><span class="home">当前位置 ：</span> <a href="http://www.taojinshan.com.cn" class="path_item">首页</a> <span class="sep">&gt;</span> <a href="rest/web/peizi/index" class="path_item">配资</a> <span class="sep">&gt;</span> <span class="txt">个人中心</span> </div>
        </div>
    <div class="w100bg">
        <hr class="pc"/>
        <div class="tjs_1108px center">
            <div class="bgcolor">
                <div class="mycenter_left">
                    <ul class="mc_lbox">
                    	<li >可用余额</li>                                             
                        <li class="colorf06 font18 lh10 ">0.00元</li>
                        <li><a class="tjs_btn pzbtn" href="javascript:void()"><b>¥</b> 充值</a></li>
                    	   
                                         
                        <li class="wypz">我的配资</li>
                        <div class="ttp wypz_div" style="display:none">
                            <span class="bor_dashed"><a href="javascript:void()">天天配</a></span>
                            <span class="bor_dashed"><a href="javascript:void()">月月配</a></span>
                            <span><a href="javascript:void()">低息1配1</a></span>
                        </div>
                        
                        <li class="wdzj">我的资金</li>
                        <div class="bor_dashed moneymx" style="display:none"><a href="javascript:void()">资金明细</a></div>
                        
                        <li class="zlsz">资料设置</li>
                        <div class="bor_dashed  mmxg"><a href="rest//web/userCenter/userModify">密码修改</a></div>
                        
                        
                    </ul>
                </div>
                <script>
                    $(function () {
                    	
                        $(".wypz").click(function () {
                            $(".ttp").slideToggle(500);
                        });
                        $(".wdzj").click(function () {
                            $(".moneymx").slideToggle(300);
                        });
                                             
                        $(".zlsz").click(function () {
                            $(".mmxg").slideToggle(300);
                        });
                        
                    })
                </script>
            <div class="mycenter_right" id="mycenter_right">
                  <div id="modify_data" style="width:75%;text-align: center;margin-top:20px;display:none">
                    <span style="width:auto;font-size:40px;text-align: center;" id="modify_tip"></span>
                  </div>                         
                  <div >
	                <form class="modify-form" action="rest/web/userCenter/userModifyData" method="post">
	                 <div style="height:100px"></div>                
	                 <div class="tjs_register_left" style="width:20%">原密码：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_password" name="password" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="初始密码，6~16个字母、符号或数字组合" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">新密码：</div><div class="tjs_register_right" style="margin-left:20px"><input id="register_newpassword" name="newpassword" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder="初始密码，6~16个字母、符号或数字组合" autofocus x-webkit-speech ></div>
	                 <div class="tjs_register_left" style="width:20%">确认新密码：</div><div class="tjs_register_right"style="margin-left:20px"><input id="rpaConfirmssword" name="rpaConfirmssword" type="password" class="tjs_register_input  tjs_width350px" tabindex="1" spellcheck="false" placeholder=" 确认密码" autofocus x-webkit-speech ></div>
	                 <div style="height:60px; width:75%; text-align: center;"><a id="register-submit-btn"  href="#" class="tjs_registerbtn">提交修改</a></div>
	                </form>     
                 </div>
                <!--/无产品状态-->
            </div>

            </div>
        </div>
        <hr class="pc"/>
    </div>
<!-- 配资页尾 -->
<%@ include file="/views/web/footer.jsp"%>
<!-- 配资页尾 结束 -->
<script type="text/javascript">
$(function() {  
        /*-二级导航-*/
        $(".tjpz").hover(function () {
            $(".nav_menu").show();
            $(".tjpz>a>span").addClass("tspan");
        }, function () {
            $(".nav_menu").hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
        $(".nav_menu").hover(function () {
            $(this).show();
            $(".tjpz>a>span").addClass("tspan");
        });
        $(".nav_menu").mouseleave(function () {
            $(this).hide();
            $(".tjpz>a>span").removeClass("tspan");
        });
        /*--操盘金额--*/
        var sum = 0;
        $(".cpbox1").each(function (i) {
            $(this).click(function () {
                $(".cpbox1").removeClass("on")
                $(this).addClass("on");
                sum = $(".cpmoney:eq('" + i + "')").text();
                $("#capital").text(sum);
                $("#assure").text(sum * 0.25);
                $("#loss").text(sum * 0.9);
                $("#close").text(sum * 0.875);
                $("#fee").text(sum * 0.00075);
                
            });
        });
        /*--/操盘金额--*/
	/*--QQ咨询--*/
		$(".about_box1:eq(2)").hover(function (){
			$(".qq").attr("src","assets/img/peizi/qqhove.png");
			$(".zx").css("color","#1682CA");
		},function(){
			$(".qq").attr("src","assets/img/peizi/qq.png");
			$(".zx").css("color","#8c969d");
		})
	/*--/QQ咨询--*/
	    //--自定义下拉框--
		$(".sel_wrap").click(function () {
		    var money = "7.5";
		    $(".select").toggle();
		    $('.select>li').filter(":last").css("border-bottom", "1px solid #d3d3d3");
		    $(".select>li").each(function (index) {
		        $(this).click(function () {
		            var opt = $(this).html();
		            $(".lbl").html(opt);
		            var num = opt.substring(0, 1);
		            $("#manageFee").text(num*money);
		        })
		    })
		})
	    //--/自定义下拉框--
		var handleRegister = function() {						
	        $('.modify-form').validate({
	            errorElement : 'span', // default input error message container
	            errorClass : 'tjs_reg_error', // default input error message class
	            focusInvalid : false, // do not focus the last invalid input
	            ignore : "",
	            rules : {	               
	                password : {
	                    required : true,
	                    rangelength:[6,16],
	                    remote:{
	                        url: "rest/web/userCenter/valiadPassword",
	                        type: "post",
	                        data: {
	                        	password: function () { return sha256_digest($("#register_password").val()); }
	                        }
	                    }
	                },
	                newpassword : {
	                    required : true,
	                    rangelength:[6,16]
	                },
	                rpaConfirmssword : {
	                    equalTo : "#register_newpassword"
	                }
	            },

	            messages : { // custom messages for radio buttons and checkboxes		           
		            password : {
		                required : "原密码不能为空.",
		                remote:"原密码错误"
		            },
	               newpassword : {
	                   required : "新密码不能为空."
	               }
	            },

	            invalidHandler : function(event, validator) { 
	            	$('.alert-danger', $('.modify-form')).show();
	            },

	            highlight : function(element) { // hightlight error inputs
	                $(element).closest('.form-group').addClass('has-error');
	            },

	            success : function(label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement : function(error, element) {	               
	                   error.insertAfter(element);
	            },

	            submitHandler : function(form) {
	            	//var passwordInput = $('[name="password"]');
		           // passwordInput.val(sha256_digest(passwordInput.val()));
		            
	               // form.submit();
	            }
	        });

	        $('.modify-form input').keypress(function(e) {
	            if (e.which == 13) {
	                if ($('.modify-form').validate().form()) {	                	                	
			    		var passwordInput = $('[name="password"]');
				        passwordInput.val(sha256_digest(passwordInput.val()));			        
				        var newPasswordInput = $('[name=newpassword]');
				        newPasswordInput.val(sha256_digest(newPasswordInput.val()));			        
				        var rpaConfirmssword = $('[name=rpaConfirmssword]');
				        rpaConfirmssword.val(sha256_digest(newPasswordInput.val()));							    		
			    		$.post('rest/web/userCenter/userModifyData', 
			    		            $('.modify-form').formSerialize(),
			    		            function(data){		    			
			    			 			passwordInput.val("");
			    						newPasswordInput.val("");
			    						rpaConfirmssword.val("");
			    						if(data){
			    							$("#modify_tip").text("修改成功");
			    						}else{
			    							$("#modify_tip").text("修改失败");
			    						}
			    						$("#modify_data").toggle(1000);
			    						$("#modify_data").toggle(1000);		    								    			
			    		            });
	                }
	                return false;
	            }
	        });
	        

		    $('#register-submit-btn').click(function(e){
		    	e.preventDefault();
		    	if ($('.modify-form').validate().form()) {
		    		var passwordInput = $('[name="password"]');
			        passwordInput.val(sha256_digest(passwordInput.val()));			        
			        var newPasswordInput = $('[name=newpassword]');
			        newPasswordInput.val(sha256_digest(newPasswordInput.val()));			        
			        var rpaConfirmssword = $('[name=rpaConfirmssword]');
			        rpaConfirmssword.val(sha256_digest(newPasswordInput.val()));							    		
		    		$.post('rest/web/userCenter/userModifyData', 
		    		            $('.modify-form').formSerialize(),
		    		            function(data){		    			
		    			 			passwordInput.val("");
		    						newPasswordInput.val("");
		    						rpaConfirmssword.val("");
		    						if(data){
		    							$("#modify_tip").text("修改成功");
		    						}else{
		    							$("#modify_tip").text("修改失败");
		    						}
		    						$("#modify_data").toggle(1000);
		    						$("#modify_data").toggle(1000);		    								    			
		    		            });
	            }
		    	return false;
		    });
	        
		}			   
		handleRegister();
						
	});
       
</script>
</body>
</html>