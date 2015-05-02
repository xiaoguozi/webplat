<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">订单预定<small>修改</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/order/order/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${order.id}">
        <input type="hidden" name="createDate" value="<fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd"/>">
        <input type="hidden" name="operateDate" value="<fmt:formatDate value="${order.operateDate}" pattern="yyyy-MM-dd"/>">
        <input type="hidden" name="operateName" value="${order.operateName}">
        <input type="hidden" name="operateId" value="${order.operateId}">
        <div class="form-group">
            <label class="col-md-2 control-label">客户名称</label>
            <div class="col-md-6">
                 <input type="hidden" name="userID" value="${order.userID}">
                <input type="text" class="form-control required" name="userName" value="${order.userName}" readonly="readonly" >
            </div>            
        </div>
        
        <div class="form-group">
             <label class="col-md-2 control-label">客户电话号码</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="telphone" value="${order.telphone}" readonly="readonly" >
            </div>
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">预约产品名称</label>
             <div class="col-md-6">
                <input type="hidden" name="productId" value="${order.productId}">
                <input type="text" class="form-control required" name="productName" value="${order.productName}" readonly="readonly">
            </div>
             
        </div>
        
         <div class="form-group">
       		 <label class="col-md-2 control-label">产品类型</label>
            <div class="col-md-6">
                  <input type="hidden" name="productType" value="${order.productType}">                  
                  <input type="radio" name="productType" value="10" <c:if test="${order.productType== '10'}">checked="checked"</c:if> disabled="disabled">信托
                  <input type="radio" name="productType" value="20" <c:if test="${order.productType== '20'}">checked="checked"</c:if> disabled="disabled">私募
                  <input type="radio" name="productType" value="30" <c:if test="${order.productType== '30'}">checked="checked"</c:if> disabled="disabled">配资   
                  <input type="radio" name="productType" value="40" <c:if test="${order.productType== '40'}">checked="checked"</c:if> disabled="disabled">海外保险                  
            </div>
           </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">处理状态</label>
            <div class="col-md-6">               
                 <input type="radio" name="operateStatus" value="10" <c:if test="${order.operateStatus== '10'}">checked="checked"</c:if>>未处理
                 <input type="radio" name="operateStatus" value="20" <c:if test="${order.operateStatus== '20'}">checked="checked"</c:if>>处理中
                 <input type="radio" name="operateStatus" value="30" <c:if test="${order.operateStatus== '30'}">checked="checked"</c:if>>已处理      
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">备注</label>
            <div class="col-md-6">   
              <textarea rows="3" cols="100" class="form-control " name="remark">${order.remark}</textarea>            
            </div>
         </div>
           
          
        
    </form>
</div>

<script type="text/javascript">

$(function(){

    Btk.form($("#modalForm"),"update",function(data){
        if("0"==data.code){
            IndexPage.togglePage('list');
            $("#searchBtn").click();
        }
    });

    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });


});

</script>
