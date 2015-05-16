<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">信托公司<small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/xintuo/xintuogs/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="xtgsId" value="${productXtgs.xtgsId}">

        <div class="form-group">
            <label class="col-md-2 control-label">公司编码</label>
            <div class="col-md-6">
                <input type="text" class="form-control " name="xtgsCode" value="${productXtgs.xtgsCode}" >
            </div>
             
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">公司LOGO</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xtgsLog" value="${productXtgs.xtgsLog}"  >
            </div>
         </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">公司中文名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsZhname" value="${productXtgs.xgtsZhname}" >
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">公司英文名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsEnname" value="${productXtgs.xgtsEnname}"  >
            </div>
        </div>
        
        
         <div class="form-group">
            <label class="col-md-2 control-label">公司简称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required " maxlength="20" name="xgtsSplname" value="${productXtgs.xgtsSplname}" >
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">成立日期</label>
            <div class="col-md-6">                             
               <div class="input-group date form_date" data-date-format="yyyy-mm-dd" startview="1" minview="0">
                    <input type="text" class="form-control" name="xgtsCreatedate" value="<fmt:formatDate value="${productXtgs.xgtsCreatedate}" pattern="yyyy-MM-dd"/>">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
         </div>
        
          <div class="form-group">
            <label class="col-md-2 control-label">注册资本(元)</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number " name="xgtsZczb" value="${productXtgs.xgtsZczb}" >
            </div>
             
        </div>
        
         <div class="form-group">
        <label class="col-md-2 control-label">所在城市</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsCity" value="${productXtgs.xgtsCity}"  >
            </div>
        </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">董事长</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsGsz" value="${productXtgs.xgtsGsz}" >
            </div>
            
        </div>
        
         <div class="form-group">
         <label class="col-md-2 control-label">总经理</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsZjl" value="${productXtgs.xgtsZjl}"  >
            </div>
         </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">法人代表</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsFrdb" value="${productXtgs.xgtsFrdb}" >
            </div>
             
        </div>
         <div class="form-group">
        <label class="col-md-2 control-label">大股东</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="xgtsDgd" value="${productXtgs.xgtsDgd}"  >
            </div>
          </div>
                       
         <div class="form-group">
         <label class="col-md-2 control-label">公司性质</label>
            <div class="col-md-6">
                 <input type="text" class="form-control required"  maxlength="20" name="xgtsGsxz" value="${productXtgs.xgtsGsxz}">
            </div>
         </div>
         
         <div class="form-group">
         <label class="col-md-2 control-label">平均收益率(%)</label>
            <div class="col-md-6">
              <input type="text" class="form-control required number " name="xgtsPjsyl" value="${productXtgs.xgtsPjsyl}" >
            </div>
         </div>
         
         
         <div class="form-group">
         <label class="col-md-2 control-label">产品兑付比例(%)</label>
            <div class="col-md-6">
                <input type="text" class="form-control required number " name="xgtsCpdfbl" value="${productXtgs.xgtsCpdfbl}" >
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">是否上市</label>
            <div class="col-md-6">
                   <input type="radio" name="xgtsSs" value="1" <c:if test="${productXtgs.xgtsSs== '1'}">checked="checked"</c:if>>是
                   <input type="radio" name="xgtsSs" value="2" <c:if test="${productXtgs.xgtsSs== '2'}">checked="checked"</c:if>>否                   	  
            </div>
            
          </div>
         
         <div class="form-group">
            <label class="col-md-2 control-label">状态</label>
            <div class="col-md-6">
                   <input type="radio" name="xgtsStatus" value="10" <c:if test="${productXtgs.xgtsStatus== '10'}">checked="checked"</c:if>>未上线
                   <input type="radio" name="xgtsStatus" value="20" <c:if test="${productXtgs.xgtsStatus== '20'}">checked="checked"</c:if>>已上线
                    <input type="radio" name="xgtsStatus" value="30" <c:if test="${productXtgs.xgtsStatus== '30'}">checked="checked"</c:if>>已下线                            	  
            </div>
            
          </div>
          
          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐位</label>
            <div class="col-md-6">
                   <input type="radio" name="xgtsTjw" value="10" <c:if test="${productXtgs.xgtsTjw== '10'}">checked="checked"</c:if>>首页
                   <input type="radio" name="xgtsTjw" value="20" <c:if test="${productXtgs.xgtsTjw== '20'}">checked="checked"</c:if>>板块头             	  
            </div>
            
          </div>
         
                          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐序号</label>
            <div class="col-md-6">
                    <input type="text" class="form-control required number" name="xgtsTjno" value="${productXtgs.xgtsTjno}"  >
            </div>
            
          </div>
          
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">资产管理规模</label>
            <div class="col-md-6">
              <input type="text" class="form-control required" name="xgtsZcglgm"  maxlength="20" value="${productXtgs.xgtsZcglgm}"  >            
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">公司简介</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="xgtsGsjj">${productXtgs.xgtsGsjj}</textarea>
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
