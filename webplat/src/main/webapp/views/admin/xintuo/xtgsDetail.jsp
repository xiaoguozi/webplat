<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<head>
        <base href="<%=basePath%>">
</head>

<body>
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">用户管理</h3>
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="#">首页</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">系统管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">产品管理</a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div id="listDiv" class="row" >
    <div class="col-md-12">

<div class="row">
    <div class="col-md-12">
                  
            <button type="button" id="saveBtn" class="btn btn-primary" onclick="updateXtgs();"><span class="glyphicon glyphicon-plus">保存</span> </button>
       
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            
             <form  id="fbean" method="POST" action="/rest/product/xt/gs/update"> 
	             <input type="text" name="xtgsId"  value="${productXtgs.xtgsId}"/>
	              <table id="list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
	               <tr>
	               <td>公司编码</td><td> <input type="text" name="xtgsCode"  value="${productXtgs.xtgsCode}"/></td>
	                <td>公司LOGO</td><td> <input type="text" name="xtgsLog"  value="${productXtgs.xtgsLog}"/></td>
	               </tr>
	               
	                <tr>
	               <td>公司中文名称</td><td> <input type="text" name="xgtsZhname"  value="${productXtgs.xgtsZhname}"/></td>
	                <td>公司英文名称</td><td> <input type="text" name="xgtsEnname"  value="${productXtgs.xgtsEnname}"/></td>
	               </tr>
	               
	                <tr>
	               <td>公司简称</td><td> <input type="text" name="xgtsSplname"  value="${productXtgs.xgtsSplname}"/></td>
	                <td>成立日期</td><td><input type="text" name="xgtsCreatedate"  value="<fmt:formatDate value="${productXtgs.xgtsCreatedate}" pattern="yyyy-MM-dd"/>"/></td>
	               </tr>
	               
	                <tr>
	               <td>注册资本</td><td> <input type="text" name="xgtsZczb"  value="${productXtgs.xgtsZczb}"/></td>
	                <td>所在城市</td><td> <input type="text" name="xgtsCity"  value="${productXtgs.xgtsCity}"/></td>
	               </tr>
	               
	                <tr>
	               <td>董事长</td><td> <input type="text" name="xgtsGsz"  value="${productXtgs.xgtsGsz}"/></td>
	                <td>总经理</td><td><input type="text" name="xgtsZjl"  value="${productXtgs.xgtsZjl}"/></td>
	               </tr>
	               
	                <tr>
	               <td>法人代表</td><td> <input type="text" name="xgtsFrdb"  value="${productXtgs.xgtsFrdb}"/></td>
	                <td>大股东</td><td> <input type="text" name="xgtsDgd"  value="${productXtgs.xgtsDgd}"/></td>
	               </tr>
	               
	                <tr >
	                <td>是否上市</td><td>	                
	                <input type="radio" name="xgtsSs" value="1" <c:if test="${productXtgs.xgtsSs== '1'}">checked="checked"</c:if>>是
                    <input type="radio" name="xgtsSs" value="0" <c:if test="${productXtgs.xgtsSs== '0'}">checked="checked"</c:if>>否	                	                 	                 
	                 </td>
	                <td>公司性质</td><td > 
	                <select name="xgtsGsxz"  style="font-family: sans-serif" mce_style="font-family: sans-serif">   
                            <option value="1" <c:if test="${productXtgs.xgtsGsxz == '1'}">selected</c:if>>中央企业控股</option>  
                            <option value="2" <c:if test="${productXtgs.xgtsGsxz == '2'}">selected</c:if>>金融机构控股</option>  
                    </select>  	                		               	                	                
	                </td>
	               </tr>
	               
	               <tr>
	                <td>资产管理规模</td><td colspan="3"> <input type="text" name="xgtsZcglgm"  value="${productXtgs.xgtsZcglgm}"/></td>	                
	               </tr>
	               
	                <tr>
	                <td>公司简介</td><td colspan="3"> <textarea  rows="3" name="xgtsGsjj" >${productXtgs.xgtsGsjj}</textarea>  </td>
	                
	               </tr>	               	               
	             </table>
            </form>  
        </div>
       
    </div>
</div>


    </div>
</div>
<div id="modalDiv" class="container hidden" >
</div>

<script type="text/javascript">

   function updateXtgs(){
	   document.forms[0].action="rest/admin/xintuogs/updateXtgs";	   
	   document.forms[0].submit();
   }
   
 

</script>
</body>
</html>