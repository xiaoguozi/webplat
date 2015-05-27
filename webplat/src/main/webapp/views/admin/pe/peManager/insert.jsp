<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募经理  <small>新增</small></h3>
    </div>
</div>
<!-- END PAGE HEADER-->
<div>
	<ul class="nav nav-tabs" role="tablist" id="myTab">
	  <li role="presentation" class="active">
	  	<a href="#manager" aria-controls="manager" role="tab" data-toggle="tab" >
	  		经理基本信息
	  	</a>
	  </li>
	  <li role="presentation">
	  	<a href="#productOnly" aria-controls="productOnly" role="tab" data-toggle="tab">
	  		代表作
	  	</a>
	  </li>
	</ul>
</div>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="manager">
  
  <div class="row">
    <div class="col-md-12">
        <div class="pull-right">
			    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
			    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
		    </div>
    </div>
</div>

<div class="modal-body">
    <form id="modalForm" action="rest/admin/pe/peManager/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
     	<input type="hidden" name="id" value="${peManager.id}">
     	<div class="form-group">             
            <label class="col-md-3 control-label">私募公司</label>
            <div class="col-md-6">
            	<input type="text" class="form-control ajax-select required" name="companyId" value="${peManager.companyId}" 
            		data-title="${peManager.companyName}" placeholder="请选择"  data-url="rest/admin/pe/peManager/getOnLinePECompanyList" >   
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">头像</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="logo" value="${peManager.logo}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">姓名</label>
            <div class="col-md-6">
                   <input type="text" class="form-control required" name="name" value="${peManager.name}" >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">文化程度</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="education" value="${peManager.education}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">毕业院校 </label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="school" value="${peManager.school}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">从业年限</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="5" name="workYear" value="${peManager.workYear}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">从业背景</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="6" name="background" value="${peManager.background}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">过往从业机构</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="institution" value="${peManager.institution}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">经理评级</label>
            <div class="col-md-6">
                <select name="level"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peManager.level == '1'}">selected</c:if>>一级</option>  
                         <option value="2" <c:if test="${peManager.level == '2'}">selected</c:if>>二级</option>
                         <option value="3" <c:if test="${peManager.level == '3'}">selected</c:if>>三级</option>
                         <option value="4" <c:if test="${peManager.level == '4'}">selected</c:if>>四级</option>
                         <option value="5" <c:if test="${peManager.level == '5'}">selected</c:if>>五级</option>
                </select> 
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">管理基金数（只）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="manageFund" value="${peManager.manageFund}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">盈利产品数（只）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="profitProduct" value="${peManager.profitProduct}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">点评</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="review" value="${peManager.review}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">人物介绍</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" maxlength="250"  name="introduce">${peManager.introduce}</textarea>
            </div>
        </div>
         <div class="form-group">
             <label class="col-md-3 control-label">推荐位置</label>
            <div class="col-md-6">
                 <select name="recommendLocation"  style="width: 200px; height: 30px " class="form-control required">   
                 		 <option value="0" <c:if test="${peManager.recommendLocation == '0'}">selected</c:if>>无推荐</option>
                         <option value="1" <c:if test="${peManager.recommendLocation == '1'}">selected</c:if>>平台首页</option>  
                         <option value="2" <c:if test="${peManager.recommendLocation == '2'}">selected</c:if>>版块首页</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">推荐顺序</label>
            <div class="col-md-6">
            	<select name="recommendSequence"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peManager.recommendSequence == '1'}">selected</c:if>>一</option>  
                         <option value="2" <c:if test="${peManager.recommendSequence == '2'}">selected</c:if>>二</option>
                         <option value="3" <c:if test="${peManager.recommendSequence == '3'}">selected</c:if>>三</option>
                         <option value="4" <c:if test="${peManager.recommendSequence == '4'}">selected</c:if>>四</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">状态</label>
            <div class="col-md-6">
                <select name="status"  style="width: 200px; height: 30px " class="form-control required">   
                		<option value="1" <c:if test="${peManager.status == '1'}">selected</c:if>>未上线</option> 
                        <option value="2" <c:if test="${peManager.status == '2'}">selected</c:if>>上线</option>  
                        <option value="3" <c:if test="${peManager.status == '3'}">selected</c:if>>下线</option>
                </select> 
            </div>
        </div>
    </form>
</div>
</div>
<div role="tabpanel" class="tab-pane" id="productOnly"></div>
</div>

<script type="text/javascript">

var managerId = 0;

$(function(){
	
	$('#myTab a').click(function (e) { 
	      e.preventDefault();//阻止a链接的跳转行为 
	      $(this).tab('show');//显示当前选中的链接及关联的content 
	      var sel = $(this).attr("href");
	      var isload = $(this).attr("data-load");
	      if("yes" != isload){	
	    	  var loadUrl = "";
	    	  if("#productOnly" == sel){
	    		  loadUrl = "rest/admin/pe/productOnly/index?managerId=" + managerId;
	    	  }
	    	  
	    	  if(loadUrl){
	        	  $(""+sel).load(loadUrl);
	        	  $(this).attr("data-load","yes");
	    	  }
	      }
	    }); 
	

    Btk.form($("#modalForm"),"insert",function(data){
    	 if("0"==data.code){
            // IndexPage.togglePage('list');
            // $("#searchBtn").click();
    		 managerId = data.bizData.id;
    		 
    		 $('input[name=id]').val(data.bizData.id);
         }
    });


    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });

});

</script>
