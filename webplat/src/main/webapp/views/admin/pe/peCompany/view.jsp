<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募公司管理  <small>查看</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-primary modalCloseBtn" data-dismiss="modal">关闭</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${peCompany.id}">
     
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">公司名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="name" value="${peCompany.name}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">公司LOGO</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="logo" value="${peCompany.logo}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">成立时间</label>
            <div class="col-md-6">
                    <input type="text" class="form-control form_datetime required" name="setupTime" value="<fmt:formatDate value="${peCompany.setupTime}" pattern="yyyy-MM-dd"/>"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">所在地区</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="area" value="${peCompany.area}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">管理规模</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="managementScale" value="${peCompany.managementScale}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">投研人数</label>
            <div class="col-md-6">
                 <input type="text" class="form-control required" name="investmentNumber" value="${peCompany.investmentNumber}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">产品线</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="productLine" value="${peCompany.productLine}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">点评</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="review" value="${peCompany.review}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">核心人物</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="coreCharacter">${peCompany.coreCharacter}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">公司简介</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control required" name="companyProfile">${peCompany.companyProfile}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">投资理念</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="investmentPhilosophy">${peCompany.investmentPhilosophy}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">投研团队</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="investmentTeam">${peCompany.investmentTeam}</textarea>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">

$(function(){

    Btk.form($("#modalForm"),"view");


    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });

});

</script>
