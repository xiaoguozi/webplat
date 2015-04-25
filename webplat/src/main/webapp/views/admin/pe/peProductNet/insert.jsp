<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募产品净值  <small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/pe/peProductNet/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
     	<input type="hidden" name="id" value="${peProductNet.id}">
     	
        <div class="form-group">
            <label class="col-md-3 control-label">产品名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="productName" value="${peProductNet.productName}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">净值时间</label>
            <div class="col-md-6">
                <div class="input-group date form_date" data-date-format="yyyy-mm-dd" startview="1" minview="0">
                    <input type="text" class="form-control" name="netTimeStr" value="${peProductNet.netTime}">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">单位净值 </label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="unitNet" value="${peProductNet.unitNet}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">累计净值 </label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="totalNet" value="${peProductNet.totalNet}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">增长率</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="increaseRate" value="${peProductNet.increaseRate}"  >
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">

$(function(){


    Btk.form($("#modalForm"),"insert",function(data){
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