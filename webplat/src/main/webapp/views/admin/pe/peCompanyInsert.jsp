<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募公司管理  <small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/pe/peCompany/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${pECompany.id}">

        <div class="form-group">
            <label for="input-sDsName" class="col-md-2 control-label">公司名称</label>
            <div class="col-md-4">
                <input type="text" class="form-control required" name="name" value="${pECompany.name}" >
            </div>
             <label for="input-sHost" class="col-md-2 control-label">公司LOGO</label>
            <div class="col-md-2">
                <input type="text" class="form-control required" name="logo" value="${pECompany.logo}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">成立时间</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="setupTime" value="${pECompany.setupTime}"  >
            </div>
             <label for="input-sHost" class="col-md-2 control-label">所在地区</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="logo" value="${pECompany.area}"  >
            </div>
        </div>
         <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">管理规模</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="logo" value="${pECompany.managementScale}"  >
            </div>
            <label for="input-sHost" class="col-md-2 control-label">投研人数</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="setupTime" value="${pECompany.investmentNumber}"  >
            </div>
        </div>
         <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">产品线</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="setupTime" value="${pECompany.productLine}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">点评</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="setupTime" value="${pECompany.review}"  >
            </div>
        </div>
         <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">核心人物</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required">${pECompany.coreCharacter}</textarea>
            </div>
        </div>
          <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">公司简介</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required">${pECompany.companyProfile}</textarea>
            </div>
        </div>
         <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">投资理念</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required">${pECompany.investmentPhilosophy}</textarea>
            </div>
        </div>
          <div class="form-group">
            <label for="input-sHost" class="col-md-2 control-label">投研团队</label>
            <div class="col-md-6">
               <textarea rows="6" cols="100" class="form-control required">${pECompany.investmentTeam}</textarea>
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
