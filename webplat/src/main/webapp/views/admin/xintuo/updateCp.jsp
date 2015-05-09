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
    <form id="modalForm" action="rest/admin/xintuo/xintuocp/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="xtcpId" value="${productXtcp.xtcpId}">         
         <div class="form-group">
            <label class="col-md-2 control-label">信托产品全称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpFullname" value="${productXtcp.xtcpFullname}" >
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">信托产品简称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpSplname" value="${productXtcp.xtcpSplname}" >
            </div>            
        </div>
        
        <div class="form-group">
             <label class="col-md-2 control-label">信托产品LOGO</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpLog" value="${productXtcp.xtcpLog}"  >
            </div>
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">信托公司名称</label>
             <div class="col-md-6">
            	<input type="text" class="form-control ajax-select required" name="xtcpGsId" value="${productXtcp.xtcpGsId}" data-title="${productXtcp.xtcpGszhname}" placeholder="请选择"  data-url="rest/admin/xintuo/xintuocp/queryGsData" >           	
            </div>
             
        </div>
        
         <div class="form-group">
       		 <label class="col-md-2 control-label">预计发行规模（元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="xtcpFxgm" value="${productXtcp.xtcpFxgm}"  >
            </div>
           </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">预期年收益率（%）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="xtcpNsyl" value="${productXtcp.xtcpNsyl}" >
            </div>
           </div>
           
            <div class="form-group">
            <label class="col-md-2 control-label">利息分配</label>
            <div class="col-md-6">
                   <input type="radio" name="xtcpLxfp" value="10" <c:if test="${productXtcp.xtcpLxfp== '10'}">checked="checked"</c:if>>不限按月付息
                  <input type="radio" name="xtcpLxfp" value="20" <c:if test="${productXtcp.xtcpLxfp== '20'}">checked="checked"</c:if>>按季付息
                  <input type="radio" name="xtcpLxfp" value="30" <c:if test="${productXtcp.xtcpLxfp== '30'}">checked="checked"</c:if>>半年付息      
                  <input type="radio" name="xtcpLxfp" value="40" <c:if test="${productXtcp.xtcpLxfp== '40'}">checked="checked"</c:if>>按年付息
                  <input type="radio" name="xtcpLxfp" value="50" <c:if test="${productXtcp.xtcpLxfp== '50'}">checked="checked"</c:if>>到期付息   
            </div>
            </div>
           
           
        
          <div class="form-group">
            <label class="col-md-2 control-label">存续期（月份）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required digits" name="xtcpCxq" value="${productXtcp.xtcpCxq}" >
            </div>
            
        </div>
        
         <div class="form-group">
         <label class="col-md-2 control-label">信托类型</label>
            <div class="col-md-6">
                   <input type="radio" name="xtcpXtlx" value="10" <c:if test="${productXtcp.xtcpXtlx== '10'}">checked="checked"</c:if>>小额信托
                   <input type="radio" name="xtcpXtlx" value="20" <c:if test="${productXtcp.xtcpXtlx== '20'}">checked="checked"</c:if>>1年期信托
                   <input type="radio" name="xtcpXtlx" value="30" <c:if test="${productXtcp.xtcpXtlx== '30'}">checked="checked"</c:if>>高收益信托       
                   <input type="radio" name="xtcpXtlx" value="40" <c:if test="${productXtcp.xtcpXtlx== '40'}">checked="checked"</c:if>>政信类依托                     
            </div>
            </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">最低认购金额 （元）</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number" name="xtcpZdrgje" value="${productXtcp.xtcpZdrgje}" >
            </div>
           
        </div>
        
         <div class="form-group">
          <label class="col-md-2 control-label">抵押率</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpDyl" value="${productXtcp.xtcpDyl}"  >
            </div>
          </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">投资领域</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpTzly" value="${productXtcp.xtcpTzly}" >
            </div>
             
        </div>
        
         <div class="form-group">
        <label class="col-md-2 control-label">抵押物</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpDyw" value="${productXtcp.xtcpDyw}"  >
            </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">收益说明</label>
            <div class="col-md-6">
                  <textarea rows="3" cols="100" class="form-control required" name="xtcpSysm">${productXtcp.xtcpSysm}</textarea>
            </div>
             
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label">活动</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtcpHd" value="${productXtcp.xtcpHd}" >
            </div>
             
        </div>
        
        <div class="form-group">
        <label class="col-md-2 control-label">所在区域</label>
            <div class="col-md-6">
             <input type="text" class="form-control required" name="xtcpArea" value="${productXtcp.xtcpArea}" >
            </div>
        </div>
        
        <div class="form-group">
           <label class="col-md-2 control-label">城市</label>
            <div class="col-md-6">
             <input type="text" class="form-control required" name="xtcpCity" value="${productXtcp.xtcpCity}" >
            </div>
        </div>
        
        <div class="form-group">
        <label class="col-md-2 control-label">募集进度/账号</label>
            <div class="col-md-6">
                <textarea rows="3" cols="100" class="form-control required" name="xtcpMjzh">${productXtcp.xtcpMjzh}</textarea>
            </div>
        </div>
        
       
       
        
         <div class="form-group">
            <label class="col-md-2 control-label">状态</label>
            <div class="col-md-6">
                   <input type="radio" name="xtcpStatus" value="10" <c:if test="${productXtcp.xtcpStatus== '10'}">checked="checked"</c:if>>未上线
                   <input type="radio" name="xtcpStatus" value="20" <c:if test="${productXtcp.xtcpStatus== '20'}">checked="checked"</c:if>>已上线
                   <input type="radio" name="xtcpStatus" value="30" <c:if test="${productXtcp.xtcpStatus== '30'}">checked="checked"</c:if>>已下线                            	  
            </div>
            
          </div>
          
          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐位</label>
            <div class="col-md-6">
                   <input type="radio" name="xtcpTjw" value="10" <c:if test="${productXtcp.xtcpTjw== '10'}">checked="checked"</c:if>>首页
                   <input type="radio" name="xtcpTjw" value="20" <c:if test="${productXtcp.xtcpTjw== '20'}">checked="checked"</c:if>>板块头             	  
            </div>
            
          </div>
         
                          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐序号</label>
            <div class="col-md-6">
                    <input type="text" class="form-control required number" name="xtcpTjno" value="${productXtcp.xtcpTjno}"  >
            </div>
            
          </div>
           
           
         <div class="form-group">
            <label class="col-md-2 control-label">融资方</label>
            <div class="col-md-6">
                 <textarea rows="5" cols="100" class="form-control required" name="xtcpRzf">${productXtcp.xtcpRzf}</textarea>
            </div>
             
        </div>   
        
        <div class="form-group">
        <label class="col-md-2 control-label">资金用途</label>
            <div class="col-md-6">
                <textarea rows="5" cols="100" class="form-control required" name="xtcpZjyt">${productXtcp.xtcpZjyt}</textarea>
            </div>
            </div>        
        
         <div class="form-group">
            <label class="col-md-2 control-label">还款来源</label>
            <div class="col-md-6">
                 <textarea rows="3" cols="100" class="form-control required" name="xtcpHkly">${productXtcp.xtcpHkly}</textarea>
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">风控措施</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="xtcpFkcs">${productXtcp.xtcpFkcs}</textarea>
            </div>
       </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">资产管理人</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="xtcpZcglr">${productXtcp.xtcpZcglr}</textarea>
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">点评</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control required" name="xtcpDp">${productXtcp.xtcpDp}</textarea>
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
