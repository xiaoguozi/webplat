<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">提现处理<small>审核</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/withdraw/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="withrowId" value="${withdraw.withrowId}">
        <input type="hidden" name="lockId" value="${withdraw.lockId}">
        <div class="form-group">
            <label class="col-md-2 control-label">客户名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control " name="createBy" value="${withdraw.createBy}" readonly="readonly" >
            </div>            
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">银行名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control " name="bankName" value="${withdraw.bankName}" readonly="readonly" >
            </div>            
        </div>
        
        
        <div class="form-group">
             <label class="col-md-2 control-label">银行开户所在地</label>
             <div class="col-md-6" style="margin-top:5px;font-size:14px" >
                ${withdraw.bankProvince} &nbsp;${withdraw.bankcity}&nbsp; ${withdraw.branchName}
             </div>              
        </div>
        
        <div class="form-group">
             <label class="col-md-2 control-label">银行卡号</label>
             <div class="col-md-6" style="margin-top:5px;font-size:14px" >
                 <input type="text" class="form-control " name="cardNo" value="${withdraw.cardNo}" readonly="readonly" >
             </div>              
        </div>
        
         <div class="form-group">
             <label class="col-md-2 control-label">提现金额(元)</label>
             <div class="col-md-6" style="margin-top:5px;font-size:14px" >
                 <input type="text" class="form-control " name="amount" value="${withdraw.amount}" readonly="readonly" >
             </div>              
         </div>
        
         <div class="form-group">
             <label class="col-md-2 control-label">提现状态</label>
             <div class="col-md-6" style="margin-top:5px;font-size:14px" >                  
                    <select name="status"  style="width: 200px; height: 30px " class="form-control required">
                         <option value="0" <c:if test="${withdraw.status == 0}">selected</c:if>>待审核</option>                      
                         <option value="1" <c:if test="${withdraw.status == 1}">selected</c:if>>待确认</option>  
                         <option value="2" <c:if test="${withdraw.status == 2}">selected</c:if>>完成</option>                        
                    </select>             	                
             </div>              
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">备注</label>
            <div class="col-md-6">   
              <textarea rows="3" cols="100" class="form-control " name="auditDesc">${withdraw.auditDesc}</textarea>            
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
