<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募产品收益排名  <small>查看</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-primary income_modalCloseBtn" data-dismiss="modal">关闭</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="income_modalForm" action="" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${peProductIncome.id}">
     	
        <div class="form-group">
            <label class="col-md-3 control-label">产品名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="productName" value="${peProductIncome.productName}" readonly>
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

    Btk.form($("#income_modalForm"),"view");


    $("button.income_modalCloseBtn").unbind('click').click(function(event) {
        income_IndexPage.togglePage('list');
    });

});

</script>
