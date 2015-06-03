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
    <form id="modalForm" action="rest/admin/peizi/peizi/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="dataId" value="${peizi.dataId}">
        <div class="form-group">
            <label class="col-md-2 control-label">配资类型</label>
            <div class="col-md-6">
                 <input type="radio" name="dataType" class="required" value="10" <c:if test="${peizi.dataType== '10'}">checked="checked"</c:if> disabled="disabled">免费配资
                 <input type="radio" name="dataType" class="required" value="20" <c:if test="${peizi.dataType== '20'}">checked="checked"</c:if> disabled="disabled">天天配
                 <input type="radio" name="dataType" class="required" value="30" <c:if test="${peizi.dataType== '30'}">checked="checked"</c:if> disabled="disabled">月月配  
                 <input type="radio" name="dataType" class="required" value="40" <c:if test="${peizi.dataType== '40'}">checked="checked"</c:if> disabled="disabled">低息配          
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
            <label class="col-md-2 control-label">使用期限（<c:if test="peizi.dataTypeSylx=='10'">天</c:if><c:if test="peizi.dataTypeSylx!='10'">月</c:if>）</label>
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
	                  		年利率:${peizi.datanll}%
	                </c:when>                
	                <c:otherwise>  
	                     	错误
	                </c:otherwise>  
            </c:choose>                     
            </div>            
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">配置开始时间</label>
            <div class="col-md-6">
                <input type="text" class="form-control  number" name="dataZjsyqx" value="<fmt:formatDate value="${peizi.dataSubmitDate}" pattern="yyyy-MM-dd HH:mm"/>  " readonly="readonly">
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">配资交易开始时间</label>
            <div class="col-md-6">
                 <c:choose>  
	                <c:when test="${peizi.dataJyksDate=='1'}">  
	                  		当天
	                </c:when>
	                 <c:when test="${peizi.dataJyksDate=='2'}">  
	                  		下一个交易日
	                </c:when>	                              
	                <c:otherwise>  
	                     	错误
	                </c:otherwise>  
                </c:choose>             
            </div>            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">处理状态</label>
            <div class="col-md-6">
                   <input type="radio" name="dataOperaStatus" value="10" <c:if test="${peizi.dataOperaStatus== '10'}">checked="checked"</c:if>>申请配资
                   <input type="radio" name="dataOperaStatus" value="20" <c:if test="${peizi.dataOperaStatus== '20'}">checked="checked"</c:if>>配资中
                   <input type="radio" name="dataOperaStatus" value="30" <c:if test="${peizi.dataOperaStatus== '30'}">checked="checked"</c:if>>配资完成    
            </div>            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">备注</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control" name="dataRemark">${peizi.dataRemark}</textarea>
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
