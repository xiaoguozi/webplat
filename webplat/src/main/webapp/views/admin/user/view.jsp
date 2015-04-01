<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">用户管理  <small>查看</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-primary modalCloseBtn" data-dismiss="modal">关闭</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${user.id}">

        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">username</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="username" value="${user.username}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sHost" class="col-md-3 control-label">password</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="password" value="${user.password}"  >
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
