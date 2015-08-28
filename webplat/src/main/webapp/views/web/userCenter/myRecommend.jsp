<%@ include file="/views/web/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘金山-个人中心</title>
<link href="assets/css/ui/taojinshan_peizi.css" rel="stylesheet"
	media="screen" type="text/css" />
<!--配资页面样式-->
<link href="assets/css/ui/peizi.css" rel="stylesheet" />
<link href="assets/css/ui-dialog.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script type="text/javascript" src="assets/scripts/ui/jquery-1.9.1.js"></script>
<script
	src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"
	type="text/javascript"></script>
<script
	src="assets/plugins/jquery-validation/localization/messages_zh.js"
	type="text/javascript"></script>
<script src="app/lib/security/sha256.js" type="text/javascript"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<script src="assets/scripts/ui/dialog-min.js" charset="utf-8"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/zeroclipboard/jquery.zclip.min.js" type="text/javascript"></script>

<style>
.am-form-field {
  display: block;
  width: 100%;
  padding: 0.625em;
  font-size: 1.6rem;
  line-height: 1.8;
  color: #555555;
  vertical-align: middle;
  background-color: #ffffff;
  background-image: none;
  border: 1px solid #cccccc;
  border-radius: 0;
  -webkit-appearance: none;
  -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
          transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.am-form-field.am-radius {
  border-radius: 2px;
}

.line{margin-bottom:20px;}
/* 复制提示 */
.copy-tips{position:fixed;z-index:999;bottom:50%;left:50%;margin:0 0 -20px -80px;background-color:rgba(0, 0, 0, 0.2);filter:progid:DXImageTransform.Microsoft.Gradient(startColorstr=#30000000, endColorstr=#30000000);padding:6px;}
.copy-tips-wrap{padding:10px 20px;text-align:center;border:1px solid #F4D9A6;background-color:#FFFDEE;font-size:14px;}
#ckepop .jiathis_bubble_style .jiathis_counter{
	width:36px !important;
}


</style>

</head>
<body>
	<div class="home_all">
		<%@ include file="/views/web/header.jsp"%>
		<!-- /header_top -->

		<div class="header_menu">
			<div class="tjs_1108px center" style="position: relative;">
				<div class="logo_wrap">
					<a href=""> <img src="assets/img/ui/tjs_logo.png" width="338"
						height="94" align="middle" alt="淘金山理财" /></a>
				</div>
				<div class="top_wrap_menu_main menu">
					<ul>

						<li ><a href="#">首页</a></li>
						<li ><a
							href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
						<li ><a href="rest/web/pe/peIndex"
							target="_blank">私募</a></li>
						<li ><a href="rest/web/peizi/index"
							target="_blank">配资</a></li>
						<li ><a href="#" target="_blank">海外保险</a></li>
						<li><a href="http://academy.taojinshan.com.cn/portal.php" target="_blank">淘金学院</a></li>
						<li ><a href="rest/web/aboutUs/index"
							target="_blank">关于我们</a></li>

					</ul>
				</div>
			</div>
		</div>
		<!-- /header_menu -->
		<!--二级导航-->
		<div class="nav_box1">
			<ul class="nav_menu" style="width: 98px;">
				<li><a href="rest/web/peizi/mfp/freeActivity">免费配</a></li>
				<li><a href="rest/web/peizi/mxp/monthCapital">免息配</a></li>
				<li><a href="rest/web/peizi/yyp/monthCapital">月月配</a></li>
				<li><a href="rest/web/peizi/ttp/dayCapital">天天配</a></li>
				<li><a href="rest/web/peizi/dxp/lowCapital">低息1配1</a></li>
			</ul>
		</div>
		<!--/二级导航-->
		<div class="mod_breadcrumb">
			<div class="layout_n clearfix">
				<span class="home">当前位置 ：</span> <a href="" class="path_item">首页</a>
				<span class="sep">&gt;</span> <a href="rest/web/userCenter/index"
					class="path_item">个人中心</a> <span class="sep">&gt;</span> <span
					class="txt">充值</span>
			</div>
		</div>
		<div class="w100bg" >
			<hr class="pc" style="padding:2px;"/>
			<div class="tjs_1108px center">
				<div class="bgcolor">
					<div class="mycenter_left">
						<ul class="mc_lbox">
						
							<li class="wypz">我的配资</li>
							<div class="ttp wypz_div" >
								<span class="bor_dashed"><a
									href="rest/web/peizi/usercenter/mfp">免费配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/mfp">免息配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/ttpUserCenter">天天配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/yypUserCenter">月月配</a></span> <span
									class="bor_dashed"><a
									href="rest/web/peizi/usercenter/dxpUserCenter">低息1配1</a></span>
							</div>

							<li class="wdzj">我的资金</li>
							<div class="moneymx">
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/addbank">银行卡</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur">充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex">提现</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/fundHistory">资金明细</a></span>
                           </div>

							<li class="zlsz">资料设置</li>
							<div class="bor_dashed  mmxg">
		                        <span>
		                        	<a href="rest/web/userCenter/userModify" >个人信息</a>
		                        </span>
		                        <span class="bor_dashed">
	                        		<a href="rest/web/userCenter/myRecommend" style="color:#ff6600">我的推荐</a>
	                        	</span>
	                        </div>


						</ul>
					</div>
					<script>
						$(function() {

							$(".wypz").click(function() {
								$(".ttp").slideToggle(500);
							});
							$(".wdzj").click(function() {
								$(".moneymx").slideToggle(300);
							});

							$(".zlsz").click(function() {
								$(".mmxg").slideToggle(300);
							});

						})
					</script>
					<div class="mycenter_right" id="mycenter_right">
						<ul id="myTab" class="nav nav-tabs">
						   <li class="active">
						      <a href="#home" data-toggle="tab" style="font-size:16px;">
						         	邀请好友
						      </a>
						   </li>
						   <li><a href="#history" data-toggle="tab" style="font-size:16px;">已推荐好友</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
						   <div class="tab-pane fade in active" id="home">
		                        <div style="float:left;width:100%;">
		                        	<div style="float:left;width:50%;">
			                        	<span>
				                        	<img height="300px" width="300px" src="rest/web/userCenter/rerfererQRCode?id=${userCtrlModel.user.parent}" alt="推荐好友"/>
				                        </span>
			                        </div>
			                        <div style="float:left;width:50%;">
			                        	
			                        </div>
		                        </div>
		                        <p><span style="font-size:18px;margin-left:5px;">如何邀请好友获得奖励？</span></p>
		                        <div style="float:left; height:51px; width:100%; margin-top:15px; margin-left:7px;">
		                        	<span>
				                        	<img src="assets/img/wx/qq_invite.png" align="absmiddle"  /><span style="font-size:18px;margin-left:14px;">邀请方式：复制链接发送QQ好友</span>
				                        </span>
			                        
		                        </div>
		                        <div class="am-form-field am-radius friend-link" style="float:left;width:96%;margin-top:20px;height:86px;">
                  					 <span style="margin-top:35px; font-size:13px; margin-left:3%;">复制链接发给QQ/微信上的好友</span>
                  					 <div>
                   					<input class="copy_btn" type="text" value="http://www.taojinshan.com.cn/rest/web/passport/mreg?regFrom=6&parent=${userCtrlModel.user.parent}" style="width:90%;margin-left:3%;font-size:13px;color:#AAAAAA;border:1px solid #AAAAAA; line-height:26px; height:26px;" readOnly="readOnly"/></div>
					 			</div>
					 			
					 			<!-- JiaThis Button BEGIN -->
							<div id="ckepop" style="float:left; width:100%; margin-top:15px;">
							<span class="jiathis_txt">分享到：</span>
							<a class="jiathis_button_cqq">QQ好友</a>
							<a class="jiathis_button_qzone">QQ空间</a>
							<a class="jiathis_button_weixin">微信</a>
							<a class="jiathis_button_tsina">新浪微博</a>
							<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
							</div>
							<script "text/javascript"> 
								var jiathis_config = { 
									url: "http://www.taojinshan.com.cn/rest/web/passport/reg", 
									title: "淘金山互联网金融", 
									summary:"淘金山-采集、风控、销售、服务为一体，为客户提供全面、专业、简单、高效的互联网++金融服务平台,互联网金融行业的京东,国内最牛的互联网金融服务平台;4006-114-088" 
								} 
							</script> 
							<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
							<!-- JiaThis Button END -->
						   </div>
						   <div class="tab-pane fade" id="history">
						     		<h2 class="space-right-h2">
										&nbsp;<strong>推荐历史记录</strong><span style="font-size:14px;">（总数：${userCtrlModel.totalCount}）</span>
									</h2>
									<div class="ms-c6-table" style="margin-right: 15px;">
										<table style="border: 1px solid #fff; border-collapse: collapse; ">
										 		<thead>
												 <tr style="background: #f9f9f9;">
												     <th style="text-align:center">用户名</th>
												     <th style="text-align:center">注册时间</th>
												     <th style="text-align:center">注册来源</th>
												   </tr>
												</thead>
												<tbody>
													<c:forEach var="user" items="${lstUser}">
														<tr>
															<td>${user.username}</td>
															<td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
															<td>
																<c:choose>
																	<c:when test="${user.regFrom==0}">PC端</c:when>
																	<c:when test="${user.regFrom==1}">手机端</c:when>
																	<c:when test="${user.regFrom==5}">微信推荐</c:when>
																	<c:when test="${user.regFrom==6}">链接推荐</c:when>
																	<c:when test="${user.regFrom==7}">线下推广</c:when>
																	<c:when test="${user.regFrom==10}">高铁</c:when>
																	<c:otherwise>PC端</c:otherwise>
																</c:choose>
															</td>
														</tr>
													</c:forEach>
												</tbody>
			              				</table>
			              			</div>
			              			<form id="modalForm" action="rest/web/userCenter/myRecommend" method="post" >
			              				<input name="pageNo" type="hidden" value="${userCtrlModel.pageNo}"/>
										<input name="pageSize" type="hidden" value="${userCtrlModel.pageSize }"/>
			              			</form>
			              			
			              			<!-- 翻页开始 -->
									<div class="pages pgbtn" style="margin-top: 20px;">
									    <table class=pagetb cellspacing=0 >
									      <tbody>
									        <tr>
									        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
									        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${userCtrlModel.pageNo-1}"><</a></td>
									        <c:if test="${userCtrlModel.totalPageSize<=9||(userCtrlModel.totalPageSize>9&&userCtrlModel.pageNo<=5)}">
									       	 <c:forEach var="item" varStatus="status" begin="1" end="${userCtrlModel.totalPageSize>9?9:userCtrlModel.totalPageSize}">             
										        <c:choose>  
										          <c:when test="${status.index==userCtrlModel.pageNo }"> 
										           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
										          </c:when> 
										          <c:otherwise>
										          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
										          </c:otherwise> 
										        </c:choose>             
									       </c:forEach>
									       </c:if>
									       
									       <c:if test="${userCtrlModel.totalPageSize>9&&userCtrlModel.pageNo>5&&userCtrlModel.totalPageSize>userCtrlModel.pageNo+4}">
									        <c:forEach var="item" varStatus="status" begin="${userCtrlModel.pageNo-4}" end="${userCtrlModel.pageNo+4}">             
									        <c:choose>  
									          <c:when test="${status.index==userCtrlModel.pageNo }"> 
									           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
									          </c:when> 
									          <c:otherwise>
									          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
									          </c:otherwise> 
									        </c:choose>             
									        </c:forEach>							        
									       </c:if>
									       
									       
									       <c:if test="${userCtrlModel.totalPageSize>9&&userCtrlModel.pageNo>5&&userCtrlModel.totalPageSize<=userCtrlModel.pageNo+4}">
										        <c:forEach var="item" varStatus="status" begin="${userCtrlModel.totalPageSize-8}" end="${userCtrlModel.totalPageSize}">             
										        <c:choose>  
										          <c:when test="${status.index==userCtrlModel.pageNo }"> 
										           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
										          </c:when> 
										          <c:otherwise>
										          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
										          </c:otherwise> 
										        </c:choose>             
										        </c:forEach>							        
										       </c:if>
										        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${userCtrlModel.pageNo+1}">></a></td>
										        <td class=pagnum><a title=最前一页 href="#" page_no="${userCtrlModel.totalPageSize}">>|</a></td>          
										        </tr>
										      </tbody>
										    </table>
									  </div>
								 <!-- 翻页结束 -->
						     
						     
						   </div>
						</div>
              			
					</div>
					
				</div>
			</div>
		<hr class="pc" />
			
		
	</div>
	<!-- 配资页尾 -->
	<%@ include file="/views/web/footer.jsp"%>
	</div>
	<!-- 配资页尾 结束 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$(".pagnum a").click(function(event){
		    	event.preventDefault();
	            $("input[name=pageNo]").val($(this).attr("page_no"));
		    	$("#modalForm").submit();
		    });
			
			if ( window.clipboardData ) {  
                $('.copy_btn').click(function() {  
                    window.clipboardData.setData("Text", $(this).val());  
                    alert('复制成功！');  
                });  
            } else {  
                $(".copy_btn").zclip({  
                    path:'<%=basePath%>assets/plugins/zeroclipboard/ZeroClipboard.swf',  
                    copy:function(){return $(this).val();},  
                    afterCopy:function(){alert('复制成功！');}  
                });  
            }  
			
			//$(".jiathis_button_expanded").attr("width", "36px");
			if($(".jiathis_counter").size()==1){
				//$(".jiathis_counter").css("width", "36");
				//$(".jiathis_counter").addClass("count_width");
			}
		});
		
	</script>
</body>
</html>