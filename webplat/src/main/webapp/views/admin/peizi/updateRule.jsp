<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">配资规则<small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/peizi/peizirule/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="ruleId" value="${peiziRule.ruleId}">
        <div class="form-group">
            <label class="col-md-2 control-label">配资类型</label>
            <div class="col-md-6">
                 <input type="radio" name="ruleType" class="required" value="10" <c:if test="${peiziRule.ruleType== '10'}">checked="checked"</c:if>>免费配资
                 <input type="radio" name="ruleType" class="required" value="20" <c:if test="${peiziRule.ruleType== '20'}">checked="checked"</c:if>>天天配
                 <input type="radio" name="ruleType" class="required" value="30" <c:if test="${peiziRule.ruleType== '30'}">checked="checked"</c:if>>月月配  
                 <input type="radio" name="ruleType" class="required" value="40" <c:if test="${peiziRule.ruleType== '40'}">checked="checked"</c:if>>低息配          
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">警戒线(%)</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" max="999" name="ruleJjx" value="${peiziRule.ruleJjx}" >
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">平仓线(%)</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" max="999" name="rulePcx" value="${peiziRule.rulePcx}" >
            </div>            
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">配资管理收益</label>
            <div class="col-md-6">
                 <input type="radio" name="ruleGlsyType" class="required" value="10" <c:if test="${peiziRule.ruleGlsyType== '10'}">checked="checked"</c:if>>借款账户管理费/天
                 <input type="radio" name="ruleGlsyType" class="required" value="20" <c:if test="${peiziRule.ruleGlsyType== '20'}">checked="checked"</c:if>>借款月利率
                 <input type="radio" name="ruleGlsyType" class="required"  value="30" <c:if test="${peiziRule.ruleGlsyType== '30'}">checked="checked"</c:if>>借款年利率  
            </div>            
        </div>
       
        
         <div class="form-group">
            <label class="col-md-2 control-label">账户管理费(元)</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required number" max="999" name="ruleZhglf" value="${peiziRule.ruleZhglf}" >           	
            </div>
             
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">年利率(%)</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required number" name="ruleNll" value="${peiziRule.ruleNll}" >           	
            </div>
             
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">月利率(%)</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required number" name="ruleYll" value="${peiziRule.ruleYll}" >           	
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
