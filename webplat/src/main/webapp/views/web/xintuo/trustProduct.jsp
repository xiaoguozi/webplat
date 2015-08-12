<%@ include file="/views/web/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
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
<meta name="description" content="找信托理财产品上淘金山，为您提供信托理财产品收益率列表，信托理财产品查询，帮助您选出最适合自己信托产品，并完成购买信托产品。" />
<meta name="keywords" content="信托理财产品，信托理财产品收益率，信托理财产品查询" />
<title>信托理财产品,信托理财产品收益率,信托理财产品查询-淘金山</title>
<link href="assets/css/ui/taojinshan.css?1=1" rel="stylesheet" media="screen" type="text/css" />
<link href="assets/css/ui/public.css" rel="stylesheet" />
<link href="assets/css/ui/simu.css" rel="stylesheet" />

 <script type="text/javascript" src="assets/scripts/ui/jquery.js"></script>
<script type="text/javascript" src="assets/scripts/ui/alert_box.js"></script>
<script type="text/javascript" src="assets/scripts/ui/tip_box.js"></script>
<script src="assets/widget/form/jquery.form.min.js" charset="utf-8"></script>
<style>
body{ width:100%; height:100%;font-family: "Microsoft YaHei" !important;font-size: 14px; background-color:#f5f5f5;}
html{ width:100%; height:100%;background:#f5f5f5;}
a.tjs_condition_selected{ min-width:44px;width:auto !important;width:44px;-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; display: inline-block; height: 23px; background-color: #0280CC;border-radius: 4px;line-height: 23px;text-align:center;font-size: 14px;color: #FFF; border:none;cursor:pointer;}
</style>


</head>

<body>
<div id="divTemplate"  style="display: none;">
		<input type="hidden" name="cid" value="#productId" />
		<img class="del_compare" src="assets/img/ui2/close_compare.png" onclick="clearChoose('#productId');" alt="" />
		<div class="clear"></div>
		<p>#productName</p>
		<p>预期年化收益</p>
		<p class="tjs_products_title">
			#intValue.<span>#decimal%</span>
		</p>
	</div>


<div class="tis_trust_all">

<%@ include file="/views/web/header.jsp"%>
<!-- /header_top -->

<div class="header_menu">
<div class="tjs_1108px center" style="position: relative;">

     <div class="logo_wrap"><a href=""><img src="assets/img/ui/tjs_logo.png" width="338" height="94" align="middle" alt="淘金山理财" /></a></div>
    <div class="top_wrap_menu">
    <ul>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustIndex" target="_blank">信托首页</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustProduct" ><span class="simu_on">信托产品</span></a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustCompany" target="_blank">信托公司</a></li>
    <li style="width:155px"><a href="rest/web/xintuo/trust/trustSafeguard">安全保障</a></li>

    </ul>
    </div>    
  </div>
</div>
<!-- /header_menu -->


<div class="tjs_trust_positiondiv"> <div class="tjs_1108px center">当前位置： <a href="">首页</a> &gt; <a href="rest/web/xintuo/trust/trustIndex">信托</a>&gt;信托产品</div></div>



<!-- 信托产品开始 -->
<div class="tjs_1108px center">
<div class="tjs_recommend_title tjs_product_allicobg">全部信托产品</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_product_coloreddiv"></div>
<div class="tjs_product_search">
<div style=" height:10px; width:100%; font-size:0px;"></div>
<ul>
<li><div class="tjs_condition_left">认购起点：</div><div class="tjs_condition_right" id="xtcpZdrgje"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="30万">30万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50" title="50万">50万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="100" title="100万">100万</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="300" title="300万">300万</a></div></li>

<li><div class="tjs_condition_left">产品期限：</div><div class="tjs_condition_right" id="xtcpCxq"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="11" title="12个月以内">12个月以内</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="12" title="12个月">12个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="13" title="13-23个月">13-23个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="24" title="24个月">24个月</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="25" title="24个月以上">24个月以上</a></div></li>

<li><div class="tjs_condition_left">预期收益：</div><div class="tjs_condition_right" id="xtcpNsyl"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="7" title="8%以内">8%以内</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="8" title="8%-9.9%">8%-9.9%</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="10%-11.9%">10%-11.9%</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="12" title="12%及以上">12%及以上</a></div></li>

<li><div class="tjs_condition_left">付息方式： </div><div class="tjs_condition_right" id="xtcpLxfp"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="按月付息">按月付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="20" title="按季付息">按季付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="30" title="半年付息">半年付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="40" title="按年付息">按年付息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn"  tag="50" title="到期付息">到期付息</a></div></li>

<li><div class="tjs_condition_left">投资领域：</div><div class="tjs_condition_right" id="xtcpTzly"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="房地产">房地产</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20" title="金融">金融</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="基础设施">基础设施</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="40" title="工商企业">工商企业</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50"  title="其他">其他</a></div></li>

<li><div class="tjs_condition_left">项目所在地：</div><div class="tjs_condition_right" id="xtcpArea"><a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="10" title="珠三角">珠三角</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="20" title="江浙沪">江浙沪</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="30" title="京津冀">京津冀</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tjs_condition_btn" tag="50" title="其它地区">其它地区</a></div></li>

<li><div class="tjs_condition_left">信托公司： </div><div class="tjs_condition_right xtcpGsId" id="xtcpGsId">
<a href="#" class="tjs_condition_btn" tag="0" title="不限">不限</a>&nbsp;&nbsp;&nbsp;&nbsp;
<c:forEach items="${lstProductXtgs}" var="productXtgs" end="5">
	<a class="tjs_condition_btn" href="#" tag="${productXtgs.xtgsId}"  title="${productXtgs.xgtsSplname}">${productXtgs.xgtsSplname}</a> 
</c:forEach>
<a href="#" class="more_condition">更多&gt;</a>
</div>
</li>
<li style="height:auto;display:none" class="xtcpGsId" id="more_gs_condition">
<div  class="tjs_condition_right" style="height:auto;width:80%;border: 1px solid #D3D3D3;" >
	<div class="">
		<ul class="">			          		
					<c:if test="${fn:length(lstProductXtgs)>6}">
					 <c:forEach items="${lstProductXtgs}" var="productXtgs" begin="6">					    
						<a class="tjs_condition_btn " href="#" tag="${productXtgs.xtgsId}" tagmore="1" style="width:90px"  title="${productXtgs.xgtsSplname}">${productXtgs.xgtsSplname}</a>						
					 </c:forEach>
				  </c:if>				
		</ul>
	</div>
</div>
</li>
</ul>
<form id="modalForm" action="rest/web/xintuo/trust/trustProduct" method="post" >
<div class="tjs_dashed_bottom tjst_height_32px" style="margin-top:4px;padding-top:0px;height:2px"></div>
<div class="tjst_height_50px tjs_dashed_bottom"><div class="tjs_search_left">关  键  词： </div><div class="tjs_search_right"><input name="keyword"  type="text"  value="${xintuoSearVO.keyword}" placeholder="请输入关键字"  class="tjst_pct_search"><a href="#"><img src="assets/img/ui/search_ico.png" width="33" height="33" style="float:left"></a></div></div>
<div class="tjst_height_50px " style="background:#ffffff;"><div class="tjs_search_left" >已选条件： </div>
<div class="tjs_pct_right " ><span class="searchCondition">

</span>
共 <span style="font-size:16px; color:#FF6600">${xintuoSearVO.totalCount}</span> 款产品满足条件&nbsp;&nbsp;&nbsp;&nbsp;
<a href="rest/web/xintuo/trust/trustProduct">清空条件</a></div></div>
</div>
<!-- //tjs_product_search -->


<div class="tjst_height_32px" style="height:15px; background:#ffffff;"></div>

<input name="sortField" type="hidden" value="${xintuoSearVO.sortField }"/>
<input name="sortType" type="hidden" value="${xintuoSearVO.sortType}"/>
<input name="pageNo" type="hidden" value="${xintuoSearVO.pageNo}"/>
<input name="pageSize" type="hidden" value="${xintuoSearVO.pageSize }"/>



<div class="simu_mainprolist_result" style="background:#ffffff; margin-top:0px;">
                 <table class="simu_pro_tb_2 tjs_simu_tbl" width="100%">
                     <thead>
                         <tr>
                             <td class="tjs_tbl_td_brm" >&nbsp;对比&nbsp;</td>
                             <td class="tjs_tbl_td_bm" style="text-align: center;width:12%"><span style="padding-left: 20px;">发行机构</span></td>
                             <td class="tjs_tbl_td_brm" style="text-align: center;width:18%"><span>产品简称</span></td>
                             <td class="tjs_tbl_td_bm" style="width:9%;text-align: right;"><nobr>预期年化收益</nobr></td>
                             <td class="tjs_tbl_td_bm" style="width:9%;text-align: right;">返现金额</td>
                             <td class="tjs_tbl_td_bm" style="width:9%;text-align: right;">认购起点</td>
                             <td class="tjs_tbl_td_brm" style="width:9%;text-align: center">产品期限</td>
                             <td class="tjs_tbl_td_bm" style="width:8%;">付息方式</td>
                             <td class="tjs_tbl_td_bm" style="text-align:center;width:8%;">投资领域</td>
                             <td class="tjs_tbl_td_bm" style="text-align:center;width:8%;">所在区域</td>
                             <td class="tjs_tbl_td_bm">预约</td>
                         </tr>
                     </thead>
                     <tbody>
                     	<c:forEach items="${lstProductVos}" varStatus="status"  var="xintuoProduct">
                          <tr class="odd">
								<td class="c_c c_b c_first_control">
								<div class="lb_wrap">
									<span class="lb_b"></span> <input class="tb_chk" productId="${xintuoProduct.xtcpId}" productName="${xintuoProduct.xtcpSplname }" accumulatedIncome="<fmt:formatNumber value='${xintuoProduct.xtcpNsyl.intValue()}' pattern='#0'/>.<fmt:formatNumber value='${xintuoProduct.xtcpNsyl*100%100}' pattern='00'/>%"  type="checkbox" />
									</div>
								</td>
								<td class="c_l" style="text-align:center;"> 
									<div style="float:left;width:40%;">
										<img src="assets/img/xintuo/small/${xintuoProduct.xtcpLog}" width="36" height="30" align="middle"/>
									</div>
									<div style="float:left;width:60%;text-align:center; margin-top:4px;">
										<span>${xintuoProduct.xtcpGszhname}</span>
									</div>
								</td>
								<td class="c_l c_b" style="text-align:left;">
									<a href="rest/web/xintuo/trust/trustParticulars?id=${xintuoProduct.xtcpId}" style="font-size:16px" target="_blank"><nobr>${xintuoProduct.xtcpSplname}</nobr></a>
								</td>
								<td class="c_l" style="text-align:right;"><span class="f_f80"><fmt:formatNumber value="${xintuoProduct.xtcpNsyl.intValue()}" pattern="#0"/>.<fmt:formatNumber value="${xintuoProduct.xtcpNsyl*100%100}" pattern="00"/>%</span></td>
								<td class="c_l" style="text-align:right;"><span class="f_f80">${xintuoProduct.xtcpHd}元</span></td>
								
								<td class="c_c_s" style="text-align:right;"><fmt:formatNumber value="${xintuoProduct.xtcpZdrgje}" pattern="#0.####"/> 万 </td>
								<td class="c_c_s c_b" style="text-align:center;">${xintuoProduct.xtcpCxq}个月</td>
								<td class="c_r_s" style="text-align:center;">
									<c:choose>  
						                <c:when test="${xintuoProduct.xtcpLxfp=='10'}">按月付息</c:when>
						                <c:when test="${xintuoProduct.xtcpLxfp=='20'}">按季付息</c:when>
						                <c:when test="${xintuoProduct.xtcpLxfp=='30'}">半年付息</c:when> 
						                <c:when test="${xintuoProduct.xtcpLxfp=='40'}">按年付息</c:when> 
						                <c:when test="${xintuoProduct.xtcpLxfp=='50'}">到期付息</c:when>     
						                <c:otherwise>其他</c:otherwise>  
						            </c:choose>
						        </td>
								<td class="c_r_s" style="text-align:center;">
									<c:choose>  
						                <c:when test="${xintuoProduct.xtcpTzly=='10'}">  
						                  		房地产
						                </c:when>
						                 <c:when test="${xintuoProduct.xtcpTzly=='20'}">  
						                  		  金融
						                </c:when>
						                 <c:when test="${xintuoProduct.xtcpTzly=='30'}">  
						                  		基础设施  
						                </c:when> 
						                 <c:when test="${xintuoProduct.xtcpTzly=='40'}">  
						                  		工商企业
						                </c:when> 
						                 <c:when test="${xintuoProduct.xtcpTzly=='50'}">  
						                  		其他
						                </c:when>                 
						                <c:otherwise>  
						                     	其他
						                </c:otherwise>  
						            </c:choose>
								</td>
								<td class="c_r_s" style="text-align:center;">${xintuoProduct.xtcpCity}</td>
								<td class="c_r_s">
									<c:choose> 
										<c:when test="${xintuoProduct.xtcpStatus=='30'}">
											<a class="tb_btn tb_btn_primary simu_reserve_btn" style="background-color: #dbdbdb;border:1px solid #dbdbdb; color:white; cursor:default;" href="javascript:void(0)" data_id="${xintuoProduct.xtcpId}">预约</a>
										</c:when>
										<c:otherwise>     
											<a class="tb_btn tb_btn_primary simu_reserve_btn t_reserve" href="javascript:void(0)" data_id="${xintuoProduct.xtcpId}">预约</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
		             </c:forEach>
		        </tbody>
    		</table>
</div>




<!-- //tjs_pct_div -->
<!-- 翻页开始 -->
<div class="pages pgbtn" >
    <table class=pagetb cellspacing=0>
      <tbody>
        <tr>
        <td class=pagnum><a title=最前一页 href="#" page_no="1">|<</a></td>
        <td class=pagnum><a class=currentpg title=上一页  href="#" page_no="${xintuoSearVO.pageNo-1}"><</a></td>
        <c:if test="${xintuoSearVO.totalPageSize<=9||(xintuoSearVO.totalPageSize>9&&xintuoSearVO.pageNo<=5)}">
       	 <c:forEach var="item" varStatus="status" begin="1" end="${xintuoSearVO.totalPageSize>9?9:xintuoSearVO.totalPageSize}">             
	        <c:choose>  
	          <c:when test="${status.index==xintuoSearVO.pageNo }"> 
	           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
	          </c:when> 
	          <c:otherwise>
	          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
	          </c:otherwise> 
	        </c:choose>             
       </c:forEach>
       </c:if>
       
       <c:if test="${xintuoSearVO.totalPageSize>9&&xintuoSearVO.pageNo>5&&xintuoSearVO.totalPageSize>xintuoSearVO.pageNo+4}">
        <c:forEach var="item" varStatus="status" begin="${xintuoSearVO.pageNo-4}" end="${xintuoSearVO.pageNo+4}">             
        <c:choose>  
          <c:when test="${status.index==xintuoSearVO.pageNo }"> 
           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
          </c:when> 
          <c:otherwise>
          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
          </c:otherwise> 
        </c:choose>             
        </c:forEach>							        
       </c:if>
       
       
       <c:if test="${xintuoSearVO.totalPageSize>9&&xintuoSearVO.pageNo>5&&xintuoSearVO.totalPageSize<=xintuoSearVO.pageNo+4}">
        <c:forEach var="item" varStatus="status" begin="${xintuoSearVO.totalPageSize-8}" end="${xintuoSearVO.totalPageSize}">             
        <c:choose>  
          <c:when test="${status.index==xintuoSearVO.pageNo }"> 
           <td class=pagnum><a class=currentpg title=当前页  href="#" page_no="${status.index}" id="pagnum_click">${status.index}</a></td>     
          </c:when> 
          <c:otherwise>
          <td class=pagnum><a title=第${status.index}页  href="#" page_no="${status.index}">${status.index}</a></td>   
          </c:otherwise> 
        </c:choose>             
        </c:forEach>							        
       </c:if>
        <td class=pagnum><a class=currentpg title=下一页 href="#" page_no="${xintuoSearVO.pageNo+1}">></a></td>
        <td class=pagnum><a title=最前一页 href="#" page_no="${xintuoSearVO.totalPageSize}">>|</a></td>          
        </tr>
      </tbody>
    </table>
  </div>
 <!-- 翻页结束 -->
 </form>
</div>

<!-- 信托产品结束 -->

<div  style=" height:16px; width:100%;"></div>

<!-- 精选推荐 开始-->

<div class="tjs_1108px center">
<div style=" height:20px; width:100%;"></div>
<div class="tjs_recommend_title tjs_recommend_trusticobg">精选推荐</div>
<div style=" height:10px; width:100%; font-size:0px;"></div>
<div class="tjs_trust_coloreddiv"></div>

<div class="tjs_trust_typle">

<c:forEach items="${lstTopVos}" var="xintuotop" >
<div class="tjs_trust_unit tjs_right_1pxdashed">
<div class="tjs_right_icodiv">
<div  style=" height:36px; width:100%;"></div>
<div class="tjs_right_title">
  <tr>
    <td width="65" align="right"><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}" target="_blank"><img src="assets/img/xintuo/small/${xintuotop.xtcpLog}" width="36" height="30" align="middle"></a></td>
    <td align="left">&nbsp;&nbsp;<span><a href="rest/web/xintuo/trust/trustParticulars?id=${xintuotop.xtcpId}" style="font-size:16px" target="_blank">${xintuotop.xtcpSplname}</a></span></td>
  </tr>

</div>
<div class="tjs_right_earningsdiv"><span class="tjs_font36px"><fmt:formatNumber value="${xintuotop.xtcpNsyl.intValue()}" pattern="#0"/>.</span><fmt:formatNumber value="${xintuotop.xtcpNsyl*100%100}" pattern="00"/>%</div>
<div  style=" height:20px; width:100%;"></div>
<div class="tjs_right_textdiv"><span class="tjs_colororange">${xintuotop.xtcpHd}</span></div>
<div class="tjs_right_textdiv"> 门槛：<fmt:formatNumber value="${xintuotop.xtcpZdrgje}" pattern="#0.####"/> 万 | 期限： ${xintuotop.xtcpCxq} 个月 </div>
</div>
<div class="tjs_product_textdiv" style="height:40px"> ${xintuotop.xtcpDp}</div>
<c:choose>  
    <c:when test="${xintuotop.xtcpStatus=='30'}">
    	<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn_disable" data_id="${xintuotop.xtcpId}">立即预约</a></div>
    </c:when>    
    <c:otherwise>        
		<div class="tjs_right_btndiv"> <a href="#" class="tjs_btn t_reserve" data_id="${xintuotop.xtcpId}">立即预约</a></div>
    </c:otherwise>  
</c:choose>

</div>

</c:forEach>
<!-- /tjs_right_unit 04 -->
<div class="clearfloat"></div>

</div>
</div>
<!-- /tjs_content_div tjs_1108px -->

<!-- 精选推荐 结束-->


<div class="clearfloat"></div>
<div style=" height:26px; width:100%;"></div>



<!-- 产品对比 -->
<div class="simu_compare_container">
    <div class="compare_container">
        <div class="compare_container_title">
            <h3 class="compare_products">产品对比栏</h3>
            <div class="close_compare">
                <img src="assets/img/ui2/close_compareicon.png" alt="" />隐藏</div>
        </div>
        <div class="compare_container_contents">
            <p class="moren_font">您还可以继续添加</p>
        </div>
        <div class="compare_container_contents">
            <p class="moren_font">您还可以继续添加</p>
        </div>
        <div class="compare_container_contents">
            <p class="moren_font">您还可以继续添加</p>
        </div>
        <div class="tjs_comparing">
            <a class="uc_btn compare_btn" href="javascript:void(0)" onclick="goCompareDetail();">对&nbsp;&nbsp;&nbsp;&nbsp;比</a>
            <a id="clear_duibi" class="uc_btn compare_btn">清空对比栏</a>
        </div>
    </div>
</div>
<!-- 产品对比 end -->
<div class="clear"></div>
<!-- container end -->



<!-- 底部 -->
<%@ include file="/views/web/footer.jsp"%>

</div>
<!-- /tis_trust_all -->
<!--======tab pages JS======-->
<SCRIPT type=text/javascript>
var IndexPage = {};
IndexPage.orderProductUrl="rest/web/xintuo/trust/orderProduct";
IndexPage.formActionUrl="rest/web/xintuo/trust/trustProduct";
var sum = 0;
	$(function () {  
		//初始化选择按钮
	    $("#xtcpZdrgje a[tag=${xintuoSearVO.xtcpZdrgje}]").addClass("tjs_condition_selected");
	    $("#xtcpCxq a[tag=${xintuoSearVO.xtcpCxq}]").addClass("tjs_condition_selected");
	    $("#xtcpNsyl a[tag=${xintuoSearVO.xtcpNsyl}]").addClass("tjs_condition_selected");
	    $("#xtcpLxfp a[tag=${xintuoSearVO.xtcpLxfp}]").addClass("tjs_condition_selected");
	    $("#xtcpTzly a[tag=${xintuoSearVO.xtcpTzly}]").addClass("tjs_condition_selected");
	    $("#xtcpArea a[tag=${xintuoSearVO.xtcpArea}]").addClass("tjs_condition_selected");
	    $(".xtcpGsId a[tag=${xintuoSearVO.xtcpGsId}]").addClass("tjs_condition_selected");
	    
	    //初始化选这按钮
	    if($("#xtcpZdrgje a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpZdrgje'>"+$("#xtcpZdrgje a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpCxq a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpCxq'>"+$("#xtcpCxq a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpNsyl a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpNsyl'>"+$("#xtcpNsyl a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpLxfp a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpLxfp'>"+$("#xtcpLxfp a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpTzly a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpTzly'>"+$("#xtcpTzly a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    if($("#xtcpArea a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpArea'>"+$("#xtcpArea a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    	    
	    if($(".xtcpGsId a.tjs_condition_selected").attr("tag")!='0'){
	    	$(".searchCondition").append("<a href='#' class='tjs_close_btn' condition_name='xtcpGsId'>"+$(".xtcpGsId a.tjs_condition_selected").attr("title")+"</a>&nbsp;&nbsp;");
	    }
	    
	    
	    
	   
	    $(".searchCondition a").click(function(event){
	    	event.preventDefault();	    	
	    	$("#"+$(this).attr("condition_name")+" a").removeClass("tjs_condition_selected");
	    	$("#"+$(this).attr("condition_name")+" a[tag=0]").addClass("tjs_condition_selected");	    		    	
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",IndexPage.formActionUrl+params).submit();

	    });
	    
	    
	    	    
	    $("li .tjs_condition_right a").click(function(event){
	    	event.preventDefault();
	    	if($(this).attr("tagmore")=='1'){
	    		$(".xtcpGsId a").removeClass("tjs_condition_selected")
	    		$(this).addClass("tjs_condition_selected");
	    	}else{
	    		$(this).removeClass("tjs_condition_selected").addClass("tjs_condition_selected").siblings().removeClass("tjs_condition_selected");	
	    	}
	    	
	    	$("#more_gs_condition").css("display","none");
	    	var params =SetPara();
	    	$("#modalForm").attr("action",IndexPage.formActionUrl+params).submit();

	    });
	    
	    
	    
	    $(".more_condition").unbind();
	    $(".more_condition").click(function(event){
	    	event.preventDefault();	    	
	    	if($("#more_gs_condition").css("display")=='none'){
	    		$(this).html("隐藏&gt;");
	    		$("#more_gs_condition").css("display","block");
	    	}else{
	    		$(this).html("更多&gt;");	
	    		$("#more_gs_condition").css("display","none")
	    	};
	    });
	    
	    
	  
	    
	    
	    
	    
	    $(".tjs_dashed_bottom a").click(function(event){
	    	event.preventDefault();	    	
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",IndexPage.formActionUrl+params).submit();

	    });
	    
	    
	    $(".pagnum a").click(function(event){
	    	event.preventDefault();
            $("input[name=pageNo]").val($(this).attr("page_no"));
	    	//获取查询条件
	    	var params =SetPara();	    	    	
	    	$("#modalForm").attr("action",IndexPage.formActionUrl+params).submit();

	    });
	   
	    if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
	        $('[placeholder]').focus(function() {
	            var input = $(this);
	            if (input.val() == input.attr('placeholder')) {
	                input.val('');
	                input.removeClass('placeholder');
	            }
	        }).blur(function() {
	            var input = $(this);
	            if (input.val() == '' || input.val() == input.attr('placeholder')) {
	                input.addClass('placeholder');
	                input.val(input.attr('placeholder'));
	            }
	        }).blur();
	    };
	    
	    
	    //--预约--                   
		$("a.t_reserve").click(function(event){	
			event.preventDefault();
			  alertMsg($(this).attr("data_id"),'10', 1);  							    
				if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
			        $('[placeholder]').focus(function() {
			            var input = $(this);
			            if (input.val() == input.attr('placeholder')) {
			                input.val('');
			                input.removeClass('placeholder');
			            }
			        }).blur(function() {
			            var input = $(this);
			            if (input.val() == '' || input.val() == input.attr('placeholder')) {
			                input.addClass('placeholder');
			                input.val(input.attr('placeholder'));
			            }
			        }).blur();
			    };
		});
	    
	    
		 //--预约--                   
		$("a.tjs_btn_disable").click(function(event){	
			event.preventDefault();		
		});
		  
		
		 
		
		//--对比框--
		$(".close_compare").click(function () {
            $(".simu_compare_container").hide();
        })
        $("#clear_duibi").click(function () {
            $(".tb_chk").removeAttr("checked");
            $(".simu_compare_container").hide();
            for(var i=0; i<3; i++){
            	$(".compare_container_contents:eq("+i+")").html("<p class='moren_font'>您还可以继续添加</p>");
            }
            sum = 0;
        });

        $(".tb_chk").each(function (index) {
            $(".tb_chk").removeAttr("checked");
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    sum += 1;
                    if (sum > 3) {
	                    sum = 3;
	                    $(this).removeAttr("checked");
	                    alert("最多只能选三个进行对比！")
	                }else{
	                	if($("input[name=cid][value="+$(this).attr("productId")+"]").size()==0){
	                		//添加要对比的选项
	                    	var contentHtml = $("#divTemplate").html();
	                    	contentHtml = contentHtml.replace(/#productId/g, $(this).attr("productId"));
	                    	contentHtml = contentHtml.replace("#productName", $(this).attr("productName"));
	                    	//收益
	                    	var income = $(this).attr("accumulatedIncome") ;
	                    	income = parseFloat(income).toFixed(2);
	                    	var intValue = income.substring(0, income.indexOf("."));
	                    	var decimal = income.substring(income.indexOf(".")+1);
	                    	contentHtml = contentHtml.replace("#intValue", intValue);
	                    	contentHtml = contentHtml.replace("#decimal", decimal);
	                    	
	                    	for(var i=0; i<3; i++){
	                    		if($(".compare_container_contents:eq("+i+")").find("input").size()==0){
	                    			$(".compare_container_contents:eq("+i+")").html(contentHtml);
	                    			break;
	                    		}
	                    	}
	                	}
	                }
                    
                } else {
                    sum -= 1;
                    var obj = $("input[name=cid][value="+$(this).attr("productId")+"]");
                    if(obj.size()>0){
	                    obj.eq(0).parent().html(" <p class='moren_font'>您还可以继续添加</p>");
                    }
                }
                sum > 0 ? $(".simu_compare_container").show() : $(".simu_compare_container").hide();
            });
        });
        $(".del_compare").each(function (index) {
            $(this).click(function () {
                $(".compare_container_contents:eq(" + index + ")").html(" <p class='moren_font'>您还可以继续添加</p>");
            });
        }) 
		 
		 
 	    		       
	}); 
	
	//去掉选项
	function clearChoose(productId){
		$("input[name=cid][value="+productId+"]").parent().html("<p class='moren_font'>您还可以继续添加</p>");
	    $("input[class=tb_chk][productId="+productId+"]").removeAttr("checked");
	    sum -= 1;
	}
	
	function goCompareDetail(event){
		var cids = $(".compare_container input[name=cid]");
		if(cids.size()<2){
			alert("请至少选择两个产品");
			return;
		}
		var ids='';
		for(var i=0; i<cids.size(); i++){
			if(i!=0){
				ids = cids[i].value + ','+ids;
			}else{
				ids += cids[i].value;
			}
		}
		window.open("<%=basePath%>rest/web/xintuo/trust/compare?productIdArray="+ids, "_blank");
	}
	
	
	function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	}

		
	function SetPara() { 
		var xtcpZdrgje = $("#xtcpZdrgje a.tjs_condition_selected").attr("tag");
		var xtcpCxq = $("#xtcpCxq a.tjs_condition_selected").attr("tag");
		var xtcpNsyl =$("#xtcpNsyl a.tjs_condition_selected").attr("tag");
		var xtcpLxfp = $("#xtcpLxfp a.tjs_condition_selected").attr("tag");
		var xtcpTzly =$("#xtcpTzly a.tjs_condition_selected").attr("tag");
		var xtcpArea =$("#xtcpArea a.tjs_condition_selected").attr("tag");
		var xtcpGsId =$(".xtcpGsId a.tjs_condition_selected").attr("tag");
		
		if($("input[name=keyword]").val()==$("input[name=keyword]").attr('placeholder')){
			$("input[name=keyword]").val("");
		}		
		var params = "?xtcpZdrgje=" + xtcpZdrgje + "&xtcpCxq=" + xtcpCxq + "&xtcpNsyl="+ xtcpNsyl+ "&xtcpLxfp=" + xtcpLxfp+ "&xtcpTzly=" + xtcpTzly+ "&xtcpArea=" + xtcpArea+"&xtcpGsId="+xtcpGsId;
		return params;
	}
	
  		
</SCRIPT>
</body>
</html>
