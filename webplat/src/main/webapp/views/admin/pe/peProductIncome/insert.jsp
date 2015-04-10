<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募产品收益排名  <small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/pe/peProductIncome/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
     	<input type="hidden" name="id" value="${peProductIncome.id}">
     	
        <div class="form-group">
            <label class="col-md-3 control-label">产品名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="productName" value="${peProductIncome.productName}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">年度</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="year" value="${peProductIncome.year}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">期间收益</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="durationIncome" value="${peProductIncome.durationIncome}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">行业平均</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="industryAverage" value="${peProductIncome.industryAverage}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">沪深300</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="hs300" value="${peProductIncome.hs300}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">排名</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="rank" value="${peProductIncome.rank}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">排名区间</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="rankInterval" value="${peProductIncome.rankInterval}"  >
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
