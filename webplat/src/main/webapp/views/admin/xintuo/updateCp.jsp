<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">信托产品<small>修改</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/xintuocp/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
           <input type="hidden" name="xtcpId" value="${productXtcp.xtcpId}">
        <div class="form-group">
            <label class="col-md-2 control-label">信托全称</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpFullname" value="${productXtcp.xtcpFullname}" >
            </div>
             <label class="col-md-2 control-label">信托产品LOGO</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpLog" value="${productXtcp.xtcpLog}"  >
            </div>
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">信托公司名称</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpGszhname" value="${productXtcp.xtcpGszhname}" >
            </div>
             <label class="col-md-2 control-label">预计发行规模</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpFxgm" value="${productXtcp.xtcpFxgm}"  >
            </div>
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">预期年收益率</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpNsyl" value="${productXtcp.xtcpNsyl}" >
            </div>
             <label class="col-md-2 control-label">利息分配</label>
            <div class="col-md-3">
                  <input type="text" class="form-control required" name="xtcpLxfp" value="${productXtcp.xtcpLxfp}" >
            </div>
        </div>
        
          <div class="form-group">
            <label class="col-md-2 control-label">存续期</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpCxq" value="${productXtcp.xtcpCxq}" >
            </div>
             <label class="col-md-2 control-label">信托类型</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpXtlx" value="${productXtcp.xtcpXtlx}"  >
            </div>
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">最低认购金额 （万元）</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpZdrgje" value="${productXtcp.xtcpZdrgje}" >
            </div>
             <label class="col-md-2 control-label">抵押率</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpDyl" value="${productXtcp.xtcpDyl}"  >
            </div>
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">投资领域</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpTzly" value="${productXtcp.xtcpTzly}" >
            </div>
             <label class="col-md-2 control-label">抵押物</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpDyw" value="${productXtcp.xtcpDyw}"  >
            </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">收益说明</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpSysm" value="${productXtcp.xtcpSysm}" >
            </div>
             <label class="col-md-2 control-label">募集进度/账号</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpMjzh" value="${productXtcp.xtcpMjzh}"  >
            </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">融资方</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpRzf" value="${productXtcp.xtcpRzf}" >
            </div>
             <label class="col-md-2 control-label">资金用途</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpZjyt" value="${productXtcp.xtcpZjyt}"  >
            </div>
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">还款来源</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpHkly" value="${productXtcp.xtcpHkly}" >
            </div>
             <label class="col-md-2 control-label">风控措施</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpFkcs" value="${productXtcp.xtcpFkcs}"  >
            </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">资产管理人</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpZcglr" value="${productXtcp.xtcpZcglr}" >
            </div>
             <label class="col-md-2 control-label">点评</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtcpDp" value="${productXtcp.xtcpDp}"  >
            </div>
        </div>
                                              
          <div class="form-group">
            <label class="col-md-2 control-label">是否发布</label>
            <div class="col-md-3">
                   <input type="radio" name="xtcpFb" value="1" <c:if test="${productXtcp.xtcpFb== '1'}">checked="checked"</c:if>>已发布
                   <input type="radio" name="xtcpFb" value="2" <c:if test="${productXtcp.xtcpFb== '2'}">checked="checked"</c:if>>未发布	  
            </div>
             <label class="col-md-2 control-label">是否在首页显示</label>
            <div class="col-md-3">
                 <input type="radio" name="xtcpInshow" value="1" <c:if test="${productXtcp.xtcpInshow== '1'}">checked="checked"</c:if>>显示
                 <input type="radio" name="xtcpInshow" value="2" <c:if test="${productXtcp.xtcpInshow== '2'}">checked="checked"</c:if>>不显示 
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
