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
    <form id="modalForm" action="rest/admin/peizi/peizirule/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="ruleId" value="${peiziRule.ruleId}">
        <input type="hidden" name="ruleType" value="${peiziRule.ruleType}">
        <input type="hidden" name="ruleGlsyType" value="${peiziRule.ruleGlsyType}">
        <div class="form-group">
            <label class="col-md-2 control-label">配资类型</label>
            <div class="col-md-6">
                 <c:choose>  
                <c:when test="${peiziRule.ruleType=='10'}">  
                  		免费配资
                </c:when>
                 <c:when test="${peiziRule.ruleType=='20'}">  
                  		  天天配
                </c:when>
                 <c:when test="${peiziRule.ruleType=='30'}">  
                  		  月月配  
                </c:when>
                 <c:when test="${peiziRule.ruleType=='40'}">  
                  		低息配   
                </c:when>
                 <c:when test="${peiziRule.ruleType=='50'}">  
                  		免息配资
                </c:when>     
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>       
            </div>            
        </div>
        
         <c:if test="${peiziRule.ruleType=='10'}">
	          <div class="form-group">
	            <label class="col-md-2 control-label">账户管理费(元)/天</label>
	            <div class="col-md-6">           
	            	<input type="text" class="form-control required number" max="999" name="ruleZhglf" value="${peiziRule.ruleZhglf}" >           	
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
         </c:if>       
        
        
         <c:if test="${peiziRule.ruleType=='20'}">                   
	         <div class="form-group">
	            <label class="col-md-2 control-label">账户管理费(元)/天</label>
	            <div class="col-md-6">           
	            	<input type="text" class="form-control required number" max="999" name="ruleZhglf" value="${peiziRule.ruleZhglf}" >           	
	            </div>             
	         </div>
	       
	        	        	       	        	        
	         <div class="form-group">
	            <label class="col-md-2 control-label">3倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx3" value="${peiziRule.ruleJjx3}" >
	            </div>            
	        </div>
	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">3倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx3" value="${peiziRule.rulePcx3}" >
	            </div>            
	        </div>
	        	       
        </c:if>
        
        
         <c:if test="${peiziRule.ruleType=='30'}">    
                        
	        <div class="form-group">
            <label class="col-md-2 control-label">一倍杠杆月利率(%)</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required number" name="ruleYll" value="${peiziRule.ruleYll}" >           	
            </div>                        
            </div>
            
	         <div class="form-group">
	            <label class="col-md-2 control-label">一倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx" value="${peiziRule.ruleJjx}" >
	            </div>            
	        </div>	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">一倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx" value="${peiziRule.rulePcx}" >
	            </div>            
	        </div>
	        
	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">2倍杠杆月利率(%)</label>
	            <div class="col-md-6">
	            	<input type="text" class="form-control required number" name="ruleYll2" value="${peiziRule.ruleYll2}" >           	
	            </div>
            </div> 
	        <div class="form-group">
	            <label class="col-md-2 control-label">2倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx2" value="${peiziRule.ruleJjx2}" >
	            </div>            
	        </div>	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">2倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx2" value="${peiziRule.rulePcx2}" >
	            </div>            
	        </div>
	        
	        
	        <div class="form-group">
            <label class="col-md-2 control-label">3倍杠杆月利率(%)</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required number" name="ruleYll3" value="${peiziRule.ruleYll3}" >           	
            </div>
            </div>
	         <div class="form-group">
	            <label class="col-md-2 control-label">3倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx3" value="${peiziRule.ruleJjx3}" >
	            </div>            
	        </div>	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">3倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx3" value="${peiziRule.rulePcx3}" >
	            </div>            
	        </div>
	        
	        
	         <div class="form-group">
	            <label class="col-md-2 control-label">4倍杠杆月利率(%)</label>
	            <div class="col-md-6">
	            	<input type="text" class="form-control required number" name="ruleYll4" value="${peiziRule.ruleYll4}" >           	
	            </div>
            </div>
	         <div class="form-group">
	            <label class="col-md-2 control-label">4倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx4" value="${peiziRule.ruleJjx4}" >
	            </div>            
	        </div>	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">4倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx4" value="${peiziRule.rulePcx4}" >
	            </div>            
	        </div>
	        
	        
	          <div class="form-group">
	            <label class="col-md-2 control-label">5倍杠杆月利率(%)</label>
	            <div class="col-md-6">
	            	<input type="text" class="form-control required number" name="ruleYll5" value="${peiziRule.ruleYll5}" >           	
	            </div>
              </div>
	          <div class="form-group">
	            <label class="col-md-2 control-label">5倍杠杆警戒线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="ruleJjx5" value="${peiziRule.ruleJjx5}" >
	            </div>            
	        </div>
	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">5倍杠杆平仓线(%)</label>
	            <div class="col-md-6">
	                <input type="text" class="form-control required number" max="999" name="rulePcx5" value="${peiziRule.rulePcx5}" >
	            </div>            
	        </div>	        	                 
        </c:if>
        
     
        
        
        
	         <c:if test="${peiziRule.ruleType=='40'}">
		        <div class="form-group">
		            <label class="col-md-2 control-label">年利率(%)</label>
		            <div class="col-md-6">
		            	<input type="text" class="form-control required number" name="ruleNll" value="${peiziRule.ruleNll}" >           	
		            </div>                                
		        </div>
	        
	           <div class="form-group">
		            <label class="col-md-2 control-label">一倍杠杆警戒线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="ruleJjx" value="${peiziRule.ruleJjx}" >
		            </div>            
		        </div>
		        
		        <div class="form-group">
		            <label class="col-md-2 control-label">一倍杠杆平仓线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="rulePcx" value="${peiziRule.rulePcx}" >
		            </div>            
		        </div>         
	        </c:if>
        
          <c:if test="${peiziRule.ruleType=='50'}">
	             <div class="form-group">
		            <label class="col-md-2 control-label">一倍杠杆警戒线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="ruleJjx" value="${peiziRule.ruleJjx}" >
		            </div>            
	            </div>
	        
		        <div class="form-group">
		            <label class="col-md-2 control-label">一倍杠杆平仓线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="rulePcx" value="${peiziRule.rulePcx}" >
		            </div>            
		        </div>
	        
	        
		        <div class="form-group">
		            <label class="col-md-2 control-label">2倍杠杆警戒线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="ruleJjx2" value="${peiziRule.ruleJjx2}" >
		            </div>            
		        </div>
		        
		        <div class="form-group">
		            <label class="col-md-2 control-label">2倍杠杆平仓线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="rulePcx2" value="${peiziRule.rulePcx2}" >
		            </div>            
		        </div>
	        
	        
		         <div class="form-group">
		            <label class="col-md-2 control-label">3倍杠杆警戒线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="ruleJjx3" value="${peiziRule.ruleJjx3}" >
		            </div>            
		        </div>
		        
		        <div class="form-group">
		            <label class="col-md-2 control-label">3倍杠杆平仓线(%)</label>
		            <div class="col-md-6">
		                <input type="text" class="form-control required number" max="999" name="rulePcx3" value="${peiziRule.rulePcx3}" >
		            </div>            
		        </div> 	       
        </c:if>
                                        
                                                                                               
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
