<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">私募产品  <small>修改</small></h3>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<div>
	<ul class="nav nav-tabs" role="tablist" id="myTab">
	  <li role="presentation" class="active">
	  	<a href="#product" aria-controls="product" role="tab" data-toggle="tab" >
	  		产品基本信息
	  	</a>
	  </li>
	  <li role="presentation">
	  	<a href="#income" aria-controls="income" role="tab" data-toggle="tab">
	  		收益表
	  	</a>
	  </li>
	  <li role="presentation">
	  	<a href="#net" aria-controls="net" role="tab" data-toggle="tab">
	  		净值表
	  	</a>
	  </li>
	</ul>
</div>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="product">
  <div class="row">
    <div class="col-md-12">
	<div class="pull-right">
	    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
	    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
	</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<div class="modal-body">
    <form id="modalForm" action="rest/admin/pe/peProduct/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="id" value="${peProduct.id}">
		<!--  
         <div class="form-group">             
            <label class="col-md-3 control-label">私募公司</label>
            <div class="col-md-6">
                <input type="text" class="form-control ajax-select required" name="pecompanyId" value="${peProduct.pecompanyId}" 
            		data-title="${peProduct.pecompanyName}" placeholder="请选择"  data-url="rest/admin/pe/peProduct/getOnLinePECompanyList" > 
            </div>
        </div>
        -->
        <div class="form-group">
            <label class="col-md-3 control-label">基金名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="name" maxlength="100" value="${peProduct.name}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">基金简称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="simpleName" maxlength="6" value="${peProduct.simpleName}"  >
            </div>
        </div>
        
         <div class="form-group">             
            <label class="col-md-3 control-label">基金公司：公司经理</label>
            <div class="col-md-6">
            	<input type="text" class="form-control ajax-select required" name="managerId" value="${peProduct.managerId}"  
            		data-title="${peProduct.pecompanyName}:${peProduct.managerName}" placeholder="请选择"  data-url="rest/admin/pe/peProduct/getOnLinePEManagerList" >   
            </div>
        </div>
        
         <div class="form-group">
            <label class="col-md-3 control-label">最新净值</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="netWorth" value="${peProduct.netWorth}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">累计收益（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="accumulatedIncome" value="${peProduct.accumulatedIncome}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">净值日期</label>
            <div class="col-md-6">
            	<div class="input-group date form_date" data-date-format="yyyy-mm-dd" startview="1" minview="0">
                    <input type="text" class="form-control" name="netWorthTimeStr" value="<fmt:formatDate value="${peProduct.netWorthTime}" pattern="yyyy-MM-dd"/>">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">成立日期</label>
            <div class="col-md-6">
            	<div class="input-group date form_date" data-date-format="yyyy-mm-dd" startview="1" minview="0">
                    <input type="text" class="form-control" name="setupTimeStr" value="<fmt:formatDate value="${peProduct.setupTime}" pattern="yyyy-MM-dd"/>">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">运行时间</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="runTime" maxlength="20" value="${peProduct.runTime}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">今年以来收益率（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="nowRate" value="${peProduct.nowRate}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">近2年收益率（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="towRate" value="${peProduct.towRate}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">近1年收益率（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="oneRate" value="${peProduct.oneRate}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">年化收益率（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="yearRate" value="${peProduct.yearRate}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">基金类型</label>
            <div class="col-md-6">
            	 <select name="fundType"  style="width: 200px; height: 30px "  class="form-control required">   
                         <option value="1" <c:if test="${peProduct.fundType == '1'}">selected</c:if>>股票</option>  
                         <option value="2" <c:if test="${peProduct.fundType == '2'}">selected</c:if>>期货基金</option>
                         <option value="3" <c:if test="${peProduct.fundType == '3'}">selected</c:if>>股票量化</option>  
                         <option value="4" <c:if test="${peProduct.fundType == '4'}">selected</c:if>>债券型</option>  
                         <option value="5" <c:if test="${peProduct.fundType == '5'}">selected</c:if>>定向增发</option>  
                         <option value="6" <c:if test="${peProduct.fundType == '6'}">selected</c:if>>宏观对冲</option>  
                         <option value="7" <c:if test="${peProduct.fundType == '7'}">selected</c:if>>组合基金</option>  
                         <option value="8" <c:if test="${peProduct.fundType == '8'}">selected</c:if>>其他</option>    
                </select> 
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">产品等级</label>
            <div class="col-md-6">
                <select name="productLevel"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peProduct.productLevel == '1'}">selected</c:if>>一级</option>  
                         <option value="2" <c:if test="${peProduct.productLevel == '2'}">selected</c:if>>二级</option>
                         <option value="3" <c:if test="${peProduct.productLevel == '3'}">selected</c:if>>三级</option>  
                         <option value="4" <c:if test="${peProduct.productLevel == '4'}">selected</c:if>>四级</option>  
                         <option value="5" <c:if test="${peProduct.productLevel == '5'}">selected</c:if>>五级</option>  
                </select> 
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">发行平台</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="distributionPlatform" maxlength="100"  value="${peProduct.distributionPlatform}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">托管银行</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="custodianBank" maxlength="100"  value="${peProduct.custodianBank}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">证券经纪 </label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="stockbrokers" maxlength="100"  value="${peProduct.stockbrokers}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">基金性质</label>
            <div class="col-md-6">
                 <select name="fundProperty"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peProduct.fundProperty == '1'}">selected</c:if>>主基金</option>  
                         <option value="2" <c:if test="${peProduct.fundProperty == '2'}">selected</c:if>>子基金</option>
                </select> 
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">是否结构化</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="whetherStructure" maxlength="10"  value="${peProduct.whetherStructure}"  >
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">开放日期</label>
            <div class="col-md-6">
                    <input type="text" class="form-control" name="openTimeStr" maxlength="20" value="${peProduct.openTime}">
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-3 control-label">认购起点</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="subscripStart" value="${peProduct.subscripStart}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">认 购 费</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="subscripFee" value="${peProduct.subscripFee}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">退出费用</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="exitFee" value="${peProduct.exitFee}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">浮动管理费</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="managementFee" value="${peProduct.managementFee}"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">推荐理由</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control required" maxlength="200" name="recommendReason">${peProduct.recommendReason}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">推荐位置</label>
            <div class="col-md-6">
                 <select name="recommendLocation"  style="width: 200px; height: 30px " class="form-control required"> 
                         <option value="0" <c:if test="${peProduct.recommendLocation == '0'}">selected</c:if>>无推荐</option>   
                         <option value="1" <c:if test="${peProduct.recommendLocation == '1'}">selected</c:if>>平台首页</option>  
                         <option value="2" <c:if test="${peProduct.recommendLocation == '2'}">selected</c:if>>版块首页</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">推荐顺序</label>
            <div class="col-md-6">
            	<select name="recommendSequence"  style="width: 200px; height: 30px " class="form-control required">   
                         <option value="1" <c:if test="${peProduct.recommendSequence == '1'}">selected</c:if>>一</option>  
                         <option value="2" <c:if test="${peProduct.recommendSequence == '2'}">selected</c:if>>二</option>
                         <option value="3" <c:if test="${peProduct.recommendSequence == '3'}">selected</c:if>>三</option>
                         <option value="4" <c:if test="${peProduct.recommendSequence == '4'}">selected</c:if>>四</option>
                </select> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">产品状态</label>
            <div class="col-md-6">
                <select name="status"  style="width: 200px; height: 30px " class="form-control required">   
                		<option value="1" <c:if test="${peProduct.status == '1'}">selected</c:if>>未上线</option> 
                        <option value="2" <c:if test="${peProduct.status == '2'}">selected</c:if>>上线</option>  
                        <option value="3" <c:if test="${peProduct.status == '3'}">selected</c:if>>下线</option>
                </select> 
            </div>
        </div>
        
    </form>
</div>
</div>
<div role="tabpanel" class="tab-pane" id="income"></div>
  <div role="tabpanel" class="tab-pane" id="net"></div>
</div>

<script type="text/javascript">

$(function(){
	
	$('#myTab a').click(function (e) { 
	      e.preventDefault();//阻止a链接的跳转行为 
	      $(this).tab('show');//显示当前选中的链接及关联的content 
	      var sel = $(this).attr("href");
	      var isload = $(this).attr("data-load");
	      if("yes" != isload){	
	    	  var loadUrl = "";
	    	  if("#income" == sel){
	    		  loadUrl = "rest/admin/pe/peProductIncome/index?productId=" + ${peProduct.id};
	    	  }if("#net" == sel){
	    		  loadUrl = "rest/admin/pe/peProductNet/index?productId=" + ${peProduct.id};
	    	  }
	    	  if(loadUrl){

	        	  $(""+sel).load(loadUrl);
	        	  $(this).attr("data-load","yes");
	    	  }
	      }
	    }); 

    Btk.form($("#modalForm"),"update",function(data){
        if("0"==data.code){
           // IndexPage.togglePage('list');
           // $("#searchBtn").click();
        	
        }
    });

    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });


});

</script>
