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
				<div class="top_wrap_menu menu">
					<ul>
						<c:if test="${isLog!='true'}">
							<li st><a href="rest/web/peizi/index"><span>配资首页</span></a></li>
							<li class="tjpz"><a href="rest/web/peizi/capital"><span>淘金配资</span></a></li>
							<li><a href="rest/web/peizi/usercenter/pzzhongxin"><span
									class="simu_on">个人中心</span></a></li>
							<li><a href="rest/web/peizi/trade"><span>交易软件下载</span></a></li>
						</c:if>

						<c:if test="${isLog=='true'}">
							<li style="width: 115px"><a href="#">首页</a></li>
							<li style="width: 115px"><a
								href="rest/web/xintuo/trust/trustIndex" target="_blank">信托</a></li>
							<li style="width: 115px"><a href="rest/web/pe/peIndex"
								target="_blank">私募</a></li>
							<li style="width: 115px"><a href="rest/web/peizi/index"
								target="_blank">配资</a></li>
							<li style="width: 115px"><a href="#" target="_blank">海外保险</a></li>
							<li style="width: 115px"><a href="rest/web/aboutUs/index"
								target="_blank">关于我们</a></li>
						</c:if>

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
			<hr class="pc" />
			<div class="tjs_1108px center">
				<div class="bgcolor">
					<div class="mycenter_left">
						<ul class="mc_lbox">
							
							<li class="wypz">我的配资</li>
							<div class="ttp wypz_div">
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
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/enterCur" >充值</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/withdrawIndex">提现</a></span>
                        	<span class="bor_dashed"><a href="rest/web/userCenter/zhifu/fundHistory" style="color: #ff6600">资金明细</a></span>
                           </div>

							<li class="zlsz">资料设置</li>
							<div class="bor_dashed  mmxg">
							  <span class="bor_dashed">
								<a href="rest/web/userCenter/userModify" >个人信息</a>
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
						<h2 class="space-right-h2">
							<c:if test="${fundRecordCtrlModel.isFromIndex==1}">
								<a href="rest/web/userCenter/index" ><img src="assets/img/zhifu/back.png" title="返回账户总览" style="cursor: pointer;"/></a>
							</c:if>
							&nbsp;<strong>资金明细</strong>
						</h2>
						<div class="ms-c6-table" style="margin-right: 15px;">
							<table style="border: 1px solid #fff; border-collapse: collapse; ">
							 		<thead>
									 <tr style="background: #f9f9f9;">
									     <th width="120px;">时间</th>
									     <th width="100px;">交易类型</th>
									     <th width="100px;" >金额&nbsp;(元)</th>
									     <th width="100px;" >可用余额&nbsp;(元)</th>
									     <th width="170px;">备注</th>
									   </tr>
									</thead>
									<tbody>
										<c:forEach var="fundRecord" items="${lstFundRecord}">
											<tr>
												<td><fmt:formatDate value="${fundRecord.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>
													<c:if test="${fundRecord.fundType=='00001'}">充值</c:if>
													<c:if test="${fundRecord.fundType=='00002'}">借款利息</c:if>
													<c:if test="${fundRecord.fundType=='00003'}">投资保证金</c:if>
													<c:if test="${fundRecord.fundType=='00004'}">配资金额</c:if>
													<c:if test="${fundRecord.fundType=='00005'}">提现冻结</c:if>
													<c:if test="${fundRecord.fundType=='00006'}">提现成功</c:if>
													<c:if test="${fundRecord.fundType=='00007'}">提现失败</c:if>
													<c:if test="${fundRecord.fundType=='00008'}">收回配资金额</c:if>
													<c:if test="${fundRecord.fundType=='00009'}">返还投资保证金</c:if>
													<c:if test="${fundRecord.fundType=='00010'}">配资收益</c:if>
													<c:if test="${fundRecord.fundType=='00011'}">扣除风险保证金</c:if>
													<c:if test="${fundRecord.fundType=='00012'}">返还借款利息</c:if>
												</td>
												
												<c:if test="${fundRecord.fundType=='00002' || fundRecord.fundType=='00003' || fundRecord.fundType=='00005' || fundRecord.fundType=='00006' || fundRecord.fundType=='00011'}">
													<td style="color: #FFA348;">-<fmt:formatNumber value="${fundRecord.amount}" pattern="########.##" /></td>
												</c:if>
												<c:if test="${fundRecord.fundType=='00001' || fundRecord.fundType=='00004' || fundRecord.fundType=='00007' || fundRecord.fundType=='00008' || fundRecord.fundType=='00009' || fundRecord.fundType=='00010' || fundRecord.fundType=='00012'}">
													<td style="color: green;"><fmt:formatNumber value="${fundRecord.amount}" pattern="########.##" /></td>
												</c:if>
												<td><fmt:formatNumber value="${fundRecord.usableAmount}" pattern="########.##" /></td>
												<td>${fundRecord.recordDesc}</td>
											</tr>
										</c:forEach>
									</tbody>
              				</table>
              			</div>
              			<form id="modalForm" action="rest/web/userCenter/zhifu/fundHistory" method="post" >
              				<input name="pageNo" type="hidden" value="${fundRecordCtrlModel.pageNo}"/>
							<input name="pageSize" type="hidden" value="${fundRecordCtrlModel.pageSize }"/>
              			</form>
              			
              			<!-- 翻页开始 -->
						<div class="pages pgbtn" style="margin-top: 20px;">
						    <table class=pagetb cellspacing=0 >
						      <tbody>
						        <tr>
						        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
						        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${fundRecordCtrlModel.pageNo-1}"><</a></td>
						        <c:if test="${fundRecordCtrlModel.totalPageSize<=9||(fundRecordCtrlModel.totalPageSize>9&&fundRecordCtrlModel.pageNo<=5)}">
						       	 <c:forEach var="item" varStatus="status" begin="1" end="${fundRecordCtrlModel.totalPageSize>9?9:fundRecordCtrlModel.totalPageSize}">             
							        <c:choose>  
							          <c:when test="${status.index==fundRecordCtrlModel.pageNo }"> 
							           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
							          </c:when> 
							          <c:otherwise>
							          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
							          </c:otherwise> 
							        </c:choose>             
						       </c:forEach>
						       </c:if>
						       
						       <c:if test="${fundRecordCtrlModel.totalPageSize>9&&fundRecordCtrlModel.pageNo>5&&fundRecordCtrlModel.totalPageSize>fundRecordCtrlModel.pageNo+4}">
						        <c:forEach var="item" varStatus="status" begin="${fundRecordCtrlModel.pageNo-4}" end="${fundRecordCtrlModel.pageNo+4}">             
						        <c:choose>  
						          <c:when test="${status.index==fundRecordCtrlModel.pageNo }"> 
						           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
						          </c:when> 
						          <c:otherwise>
						          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
						          </c:otherwise> 
						        </c:choose>             
						        </c:forEach>							        
						       </c:if>
						       
						       
						       <c:if test="${fundRecordCtrlModel.totalPageSize>9&&fundRecordCtrlModel.pageNo>5&&fundRecordCtrlModel.totalPageSize<=fundRecordCtrlModel.pageNo+4}">
							        <c:forEach var="item" varStatus="status" begin="${fundRecordCtrlModel.totalPageSize-8}" end="${fundRecordCtrlModel.totalPageSize}">             
							        <c:choose>  
							          <c:when test="${status.index==fundRecordCtrlModel.pageNo }"> 
							           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
							          </c:when> 
							          <c:otherwise>
							          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
							          </c:otherwise> 
							        </c:choose>             
							        </c:forEach>							        
							       </c:if>
							        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${fundRecordCtrlModel.pageNo+1}">></a></td>
							        <td class=pagnum><a title=最前一页 href="#" page_no="${fundRecordCtrlModel.totalPageSize}">>|</a></td>          
							        </tr>
							      </tbody>
							    </table>
						  </div>
					 <!-- 翻页结束 -->
              			
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
		});
		
	</script>
</body>
</html>