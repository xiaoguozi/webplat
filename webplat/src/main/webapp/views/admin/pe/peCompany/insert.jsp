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
        <input type="hidden" name="id" value="${peCompany.id}">

        <div class="form-group">
            <label class="col-md-3 control-label">公司名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="100" name="name" value="${peCompany.name}" >
            </div>
        </div>
        <div class="form-group">
             <label class="col-md-3 control-label">公司LOGO</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="100" name="logo" value="${peCompany.logo}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">成立时间</label>
            <div class="col-md-6">
            	<div class="input-group date form_date" data-date-format="yyyy-mm-dd" startview="1" minview="0">
                    <input type="text" class="form-control" name="setupTimeStr" value="${peCompany.setupTime}">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
        </div> 
        <div class="form-group">
             <label class="col-md-3 control-label">所在地区</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="100" name="area" value="${peCompany.area}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">管理规模</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="managementScale" maxlength="100" value="${peCompany.managementScale}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">投研人数</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="investmentNumber" maxlength="100" value="${peCompany.investmentNumber}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">产品线</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="productLine" maxlength="100" value="${peCompany.productLine}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">点评</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="review" maxlength="100" value="${peCompany.review}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">核心人物</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" maxlength="2000" name="coreCharacter">${peCompany.coreCharacter}</textarea>
            </div>
        </div>
          <div class="form-group">
            <label class="col-md-3 control-label">公司简介</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="companyProfile" maxlength="2000">${peCompany.companyProfile}</textarea>
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">投资理念</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" maxlength="2000"  name="investmentPhilosophy">${peCompany.investmentPhilosophy}</textarea>
            </div>
        </div>
          <div class="form-group">
            <label class="col-md-3 control-label">投研团队</label>
            <div class="col-md-6">
               <textarea rows="6" cols="100" class="form-control required" maxlength="2000"  name="investmentTeam">${peCompany.investmentTeam}</textarea>
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">推荐位置</label>
            <div class="col-md-6">
                 <select name="recommendLocation"  style="width: 200px; height: 30px " class="form-control required"> 
                 		 <option value="0" <c:if test="${peCompany.recommendLocation == '0'}">selected</c:if>>无推荐</option>  
                         <option value="1" <c:if test="${peCompany.recommendLocation == '1'}">selected</c:if>>平台首页</option>  
                         <option value="2" <c:if test="${peCompany.recommendLocation == '2'}">selected</c:if>>版块首页</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">推荐顺序</label>
            <div class="col-md-6">
            	<select name="recommendSequence"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peCompany.recommendSequence == '1'}">selected</c:if>>一</option>  
                         <option value="2" <c:if test="${peCompany.recommendSequence == '2'}">selected</c:if>>二</option>
                         <option value="3" <c:if test="${peCompany.recommendSequence == '3'}">selected</c:if>>三</option>
                         <option value="4" <c:if test="${peCompany.recommendSequence == '4'}">selected</c:if>>四</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">公司状态</label>
            <div class="col-md-6">
                <select name="status"  style="width: 200px; height: 30px " class="form-control required">   
                		<option value="1" <c:if test="${peCompany.status == '1'}">selected</c:if>>未上线</option> 
                         <option value="2" <c:if test="${peCompany.status == '2'}">selected</c:if>>上线</option>  
                         <option value="3" <c:if test="${peCompany.status == '3'}">selected</c:if>>下线</option>
                </select> 
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
