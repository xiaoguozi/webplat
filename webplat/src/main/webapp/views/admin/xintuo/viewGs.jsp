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
        <input type="hidden" name="xtgsId" value="${productXtgs.xtgsId}">

        <div class="form-group">
            <label class="col-md-2 control-label">公司编码</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtgsCode" value="${productXtgs.xtgsCode}" >
            </div>
             <label class="col-md-2 control-label">公司LOGO</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xtgsLog" value="${productXtgs.xtgsLog}"  >
            </div>
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">公司中文名称</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsZhname" value="${productXtgs.xgtsZhname}" >
            </div>
             <label class="col-md-2 control-label">公司英文名称</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsEnname" value="${productXtgs.xgtsEnname}"  >
            </div>
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">公司简称</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsSplname" value="${productXtgs.xgtsSplname}" >
            </div>
             <label class="col-md-2 control-label">成立日期</label>
            <div class="col-md-3">
                <input type="text" class="form-control form_datetime required" name="xgtsCreatedate" value="<fmt:formatDate value="${productXtgs.xgtsCreatedate}" pattern="yyyy-MM-dd"/>"  >
               <script type="text/javascript">  $(".form_datetime").datetimepicker();</script>
            </div>
        </div>
        
          <div class="form-group">
            <label class="col-md-2 control-label">注册资本</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsZczb" value="${productXtgs.xgtsZczb}" >
            </div>
             <label class="col-md-2 control-label">所在城市</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsCity" value="${productXtgs.xgtsCity}"  >
            </div>
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">董事长</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsGsz" value="${productXtgs.xgtsGsz}" >
            </div>
             <label class="col-md-2 control-label">总经理</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsZjl" value="${productXtgs.xgtsZjl}"  >
            </div>
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">法人代表</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsFrdb" value="${productXtgs.xgtsFrdb}" >
            </div>
             <label class="col-md-2 control-label">大股东</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsDgd" value="${productXtgs.xgtsDgd}"  >
            </div>
        </div>
        
          <div class="form-group">
            <label class="col-md-2 control-label">是否上市</label>
            <div class="col-md-3">
                   <input type="radio" name="xgtsSs" value="1" <c:if test="${productXtgs.xgtsSs== '1'}">checked="checked"</c:if>>是
                   <input type="radio" name="xgtsSs" value="0" <c:if test="${productXtgs.xgtsSs== '0'}">checked="checked"</c:if>>否	  
            </div>
             <label class="col-md-2 control-label">公司性质</label>
            <div class="col-md-3">
                <select name="xgtsGsxz"  style="font-family: sans-serif" mce_style="font-family: sans-serif">   
                         <option value="1" <c:if test="${productXtgs.xgtsGsxz == '1'}">selected</c:if>>中央企业控股</option>  
                         <option value="2" <c:if test="${productXtgs.xgtsGsxz == '2'}">selected</c:if>>金融机构控股</option>  
                </select> 
            </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">资产管理规模</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsZcglgm" value="${productXtgs.xgtsZcglgm}" >
            </div>
             <label class="col-md-2 control-label">公司简介</label>
            <div class="col-md-3">
                <input type="text" class="form-control required" name="xgtsGsjj" value="${productXtgs.xgtsGsjj}"  >
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
