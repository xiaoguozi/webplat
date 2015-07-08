<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">配资规则<small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
     <c:if test="${peizi.dataOperaStatus=='10'}">
        <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span>验资完成</button>
     	<button type="button" id="cancelSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span>取消验资</button>
     </c:if>
     
      <c:if test="${peizi.dataOperaStatus=='20'}">
        <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span>操盘完成</button>
     </c:if>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/peizi/peizi/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="dataId" value="${peizi.dataId}">
        <input type="hidden" name="lockId" value="${peizi.lockId}">
         <div class="form-group">
            <label class="col-md-2 control-label">订单号</label>
            <div class="col-md-6">
                ${peizi.dataOrderCode}
            </div>            
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">配资类型</label>
            <div class="col-md-6">
                 <input type="radio" name="dataType" class="required" value="10" <c:if test="${peizi.dataType== '10'}">checked="checked"</c:if> disabled="disabled">免费配资
                 <input type="radio" name="dataType" class="required" value="20" <c:if test="${peizi.dataType== '20'}">checked="checked"</c:if> disabled="disabled">天天配
                 <input type="radio" name="dataType" class="required" value="30" <c:if test="${peizi.dataType== '30'}">checked="checked"</c:if> disabled="disabled">月月配  
                 <input type="radio" name="dataType" class="required" value="40" <c:if test="${peizi.dataType== '40'}">checked="checked"</c:if> disabled="disabled">低息配 
                 <input type="radio" name="dataType" class="required" value="40" <c:if test="${peizi.dataType== '50'}">checked="checked"</c:if> disabled="disabled">免息配资           
            </div>            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">客户姓名</label>
            <div class="col-md-6">
                 ${peizi.dataUserName}
            </div>            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">手机号码</label>
            <div class="col-md-6">
                ${peizi.dataUserTel}
            </div>            
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">总超盘资金（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number"  name="dataZcpzj" value="${peizi.dataZcpzj}" readonly="readonly">
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">保证金（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number" name="dataTzbzj" value="${peizi.dataTzbzj}" readonly="readonly">
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">警戒线（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number"  name="dataJjx" value="${peizi.dataJjx}" readonly="readonly">
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">平仓线（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number" name="dataPcx" value="${peizi.dataPcx}" readonly="readonly">
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">借款总利息（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number" name="dataJklxTotal" value="${peizi.dataJklxTotal}" readonly="readonly">
            </div>            
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">使用期限（<c:if test="${peizi.dataTypeSylx=='10' }">天</c:if><c:if test="${peizi.dataTypeSylx!='10'}">月</c:if>）</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number" name="dataZjsyqx" value="${peizi.dataZjsyqx}" readonly="readonly">
            </div>            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">借款利率</label>
            <div class="col-md-6">
                   <c:choose>  
	                <c:when test="${peizi.dataTypeSylx=='10'}">  
	                  		${peizi.dataZfglf}元/天
	                </c:when>
	                 <c:when test="${peizi.dataTypeSylx=='20'}">  
	                  		月利率:${peizi.dataYll}% 
	                </c:when>
	                 <c:when test="${peizi.dataTypeSylx=='30'}">  
	                  		年利率:${peizi.dataNll}%
	                </c:when>                
	                <c:otherwise>  
	                     	错误
	                </c:otherwise>  
            </c:choose>                     
            </div>            
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">配资申请时间</label>
            <div class="col-md-6">
                <fmt:formatDate value="${peizi.dataSubmitDate}" pattern="yyyy-MM-dd HH:mm"/>
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">配资交易开始时间</label>
            <div class="col-md-6">
                 <c:choose>  
	                <c:when test="${peizi.dataJyksDate=='1'}">  
	                  	提交配资申请当天
	                </c:when>
	                 <c:when test="${peizi.dataJyksDate=='2'}">  
	                  	提交配资申请下一个交易日
	                </c:when>	                              
	                <c:otherwise>  
	                                                   提交配资申请下一个交易日
	                </c:otherwise>  
                </c:choose>             
            </div>            
        </div>
        
               
         <div class="form-group">
            <label class="col-md-2 control-label">配资状态</label>
            <div class="col-md-6" style="margin-buttom:5px">
	              <c:choose>  
	                <c:when test="${peizi.dataOperaStatus=='1'}">  
	                  		待支付
	                </c:when>
	                 <c:when test="${peizi.dataOperaStatus=='10'}">  
	                  		验资中
	                </c:when>
	                 <c:when test="${peizi.dataOperaStatus=='20'}">  
	                  		  操盘中
	                </c:when>
	                 <c:when test="${peizi.dataOperaStatus=='30'}">  
	                  		已完结
	                </c:when> 
	                 <c:when test="${peizi.dataOperaStatus=='40'}">  
	                  		已取消
	                </c:when>           
	                <c:otherwise>  
	                     	异常
	                </c:otherwise>  
	            </c:choose>       
            </div>            
        </div>
        
        <c:if test="${peizi.dataOperaStatus!='1'}">
	        <div class="form-group">
	            <label class="col-md-2 control-label">恒生账户账号</label>
	            <div class="col-md-6">
	                   <input type="text" class="form-control required" name="dataJyzf" value="${peizi.dataJyzf}" >
	            </div>            
	        </div> 
	        
	        
	         <div class="form-group">
	            <label class="col-md-2 control-label">恒生账户密码</label>
	            <div class="col-md-6">
	            	<input type="text" class="form-control required " name="dataJymm" value="${peizi.dataJymm}" >
	            </div>            
	        </div>
	        
	        
	        <div class="form-group">
	            <label class="col-md-2 control-label">发送恒生账户时间</label>
		        <div class="col-md-6">  
		            <div class="input-group date form_date" data-date-format="yyyy-mm-dd hh:ii" data-minView="0" >
		                  <input type="text" class="form-control required  " name="dataJyzfDate" value="<fmt:formatDate value="${peizi.dataJyzfDate}" pattern="yyyy-MM-dd HH:mm"/>" >
		                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		            </div>
		        </div>            
	        </div>
        </c:if>
        
        
         <c:if test="${peizi.dataOperaStatus=='20'||peizi.dataOperaStatus=='30'||peizi.dataOperaStatus=='40'}">
         <div class="form-group">
            <label class="col-md-2 control-label">操盘完成时间</label>
            <div class="col-md-6">  
	            <div class="input-group date form_date" data-date-format="yyyy-mm-dd hh:ii" data-minView="0">
	                  <input type="text" class="form-control required  " name="dataJyfcDate" value="<fmt:formatDate value="${peizi.dataJyfcDate}" pattern="yyyy-MM-dd HH:mm"/>" >
	                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	            </div>  
            </div>         
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">配资收益（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required  number" name="dataProfit" value="${peizi.dataProfit}">
            </div>            
         </div>       
        </c:if>
        
          <div class="form-group">
            <label class="col-md-2 control-label">备注</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control" name="dataRemark" onblur="toCanlForm(this)">${peizi.dataRemark}</textarea>
            </div>            
        </div>
                                                                                                                                                         
    </form>
    
     <form id="cancelForm" action="rest/admin/peizi/peizi/CancelPeizi" method="post" class="form-horizontal" role="form" data-submit="#cancelSaveBtn">
	   <input type="hidden" name="dataId" value="${peizi.dataId}">
       <input type="hidden" name="lockId" value="${peizi.lockId}">
       <input type="hidden" name="dataRemark" value="${peizi.dataRemark}">
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


    Btk.form($("#cancelForm"),"update",function(data){
        if("0"==data.code){
            IndexPage.togglePage('list');
            $("#searchBtn").click();
        }
    });  
    
    
    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });
    

});


function toCanlForm(obj){
	$("#cancelForm").find("input[name=dataRemark]").val($(obj).val());
}

</script>