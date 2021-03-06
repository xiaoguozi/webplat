<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">信托产品<small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" action="rest/admin/xintuo/xintuocp/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="xtcpId" value="${productXtcp.xtcpId}">
        <div class="form-group">
            <label class="col-md-2 control-label">信托产品全称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required"  name="xtcpFullname" value="${productXtcp.xtcpFullname}" >
            </div>            
        </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">信托产品简称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" maxlength="13" name="xtcpSplname" value="${productXtcp.xtcpSplname}" >
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
                <input type="text" class="form-control required number " name="xtcpFxgm" value="${productXtcp.xtcpFxgm}"  >
            </div>
           </div>
        
        
          <div class="form-group">
            <label class="col-md-2 control-label">预期年收益率（%）</label>
            <div class="col-md-2">
                 <input type="text"  class="form-control required number " name="xtcpNsyl" value="${productXtcp.xtcpNsyl}">               
            </div>                   
           </div>
           
           
           
           
            <div class="form-group">
            <label class="col-md-2 control-label">利息分配</label>
            <div class="col-md-6">
            	  <input type="radio" name="xtcpLxfp" value="10" <c:if test="${productXtcp.xtcpLxfp== '10'}">checked="checked"</c:if>>按月付息
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
                   <input type="checkbox" name="xtcpXtlx" value="10" <c:if test="${productXtcp.xtcpXtlx== '10'}">checked="checked"</c:if>>小额信托
                   <input type="checkbox" name="xtcpXtlx" value="20" <c:if test="${productXtcp.xtcpXtlx== '20'}">checked="checked"</c:if>>1年期信托
                   <input type="checkbox" name="xtcpXtlx" value="30" <c:if test="${productXtcp.xtcpXtlx== '30'}">checked="checked"</c:if>>高收益信托       
                   <input type="checkbox" name="xtcpXtlx" value="40" <c:if test="${productXtcp.xtcpXtlx== '40'}">checked="checked"</c:if>>政信类信托              
            </div>
            </div>
            
            
            <div class="form-group">
            <label class="col-md-2 control-label">投资方式</label>
            <div class="col-md-6">
                   <input type="radio" name="xtcpTzfs" value="10" <c:if test="${productXtcp.xtcpTzfs== '10'}">checked="checked"</c:if>>信托贷款
                   <input type="radio" name="xtcpTzfs" value="20" <c:if test="${productXtcp.xtcpTzfs== '20'}">checked="checked"</c:if>>股权投资
                   <input type="radio" name="xtcpTzfs" value="30" <c:if test="${productXtcp.xtcpTzfs== '30'}">checked="checked"</c:if>>权益投资      
                   <input type="radio" name="xtcpTzfs" value="40" <c:if test="${productXtcp.xtcpTzfs== '40'}">checked="checked"</c:if>>组合运用   
                   <input type="radio" name="xtcpTzfs" value="50" <c:if test="${productXtcp.xtcpTzfs== '50'}">checked="checked"</c:if>>债券投资 
                   <input type="radio" name="xtcpTzfs" value="60" <c:if test="${productXtcp.xtcpTzfs== '60'}">checked="checked"</c:if>>其他投资                   
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
                <input type="radio" name="xtcpTzly" value="10" <c:if test="${productXtcp.xtcpTzly== '10'}">checked="checked"</c:if>>房地产
                <input type="radio" name="xtcpTzly" value="20" <c:if test="${productXtcp.xtcpTzly== '20'}">checked="checked"</c:if>>金融
                <input type="radio" name="xtcpTzly" value="30" <c:if test="${productXtcp.xtcpTzly== '30'}">checked="checked"</c:if>>基础设施      
                <input type="radio" name="xtcpTzly" value="40" <c:if test="${productXtcp.xtcpTzly== '40'}">checked="checked"</c:if>>工商企业
                <input type="radio" name="xtcpTzly" value="50" <c:if test="${productXtcp.xtcpTzly== '50'}">checked="checked"</c:if>>其他
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
                <input type="text" class="form-control required" name="xtcpHd" maxlength="16" value="${productXtcp.xtcpHd}" >
            </div>            
        </div>
        
        
         <div class="form-group">
        <label class="col-md-2 control-label">所在区域</label>
            <div class="col-md-6">
                <input type="radio" name="xtcpArea" value="10" <c:if test="${productXtcp.xtcpArea== '10'}">checked="checked"</c:if>>珠三角
                <input type="radio" name="xtcpArea" value="20" <c:if test="${productXtcp.xtcpArea== '20'}">checked="checked"</c:if>>江浙沪
                <input type="radio" name="xtcpArea" value="30" <c:if test="${productXtcp.xtcpArea== '30'}">checked="checked"</c:if>>京津冀       
                <input type="radio" name="xtcpArea" value="50" <c:if test="${productXtcp.xtcpArea== '50'}">checked="checked"</c:if>>其它地区
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
                  <input type="checkbox" name="xtcpTjw" value="10" <c:if test="${fn:contains(productXtcp.xtcpTjw,'10')}">checked="checked"</c:if>>平台首页
                  <input type="checkbox" name="xtcpTjw" value="20" <c:if test="${fn:contains(productXtcp.xtcpTjw,'20')}">checked="checked"</c:if>>版块首页 
                  <input type="checkbox" name="xtcpTjw" value="30" <c:if test="${fn:contains(productXtcp.xtcpTjw,'30')}">checked="checked"</c:if>>无推荐            
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
            <label class="col-md-2 control-label">管理机构</label>
            <div class="col-md-6">
                <textarea rows="6" cols="100" class="form-control required" name="xtcpZcglr">${productXtcp.xtcpZcglr}</textarea>
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">点评</label>
            <div class="col-md-6">
                 <textarea rows="6" cols="100" class="form-control required"  maxlength="30" name="xtcpDp">${productXtcp.xtcpDp}</textarea>
            </div>
       </div>
       
       
       <div class="form-group">
           <label class="col-md-2 control-label">资料上传 </label>
            <div  class="col-md-1" <c:if test="${(empty productXtcp.xtcpUrl)}">style="display:none"</c:if> id="img_div">	            	   
		          <a href="rest/web/system/upfile/downFile?imageName=${productXtcp.xtcpUrl}"  id="JS-img-src"><img alt="ddd" src="assets/img/attachfile.png"></a>
		    </div>
         	<input type="hidden" class="form-control " name="xtcpUrl" id="JS-homeImg" value="${productXtcp.xtcpUrl}" >
            <div class="col-md-5">          			           				            	   
                     <div id="uploader" class="wu-example">
                    	
				        <div class="queueList">
				            <div id="dndArea" class="placeholder">
				                <div id="filePicker"></div>				               
				            </div>
				        </div>
				        <div class="statusBar" style="display:none;">
				            <div class="progress">
				                <span class="text">0%</span>
				                <span class="percentage"></span>
				            </div>
				            <div class="info"></div>
				            <div class="btns">
				                <div id="filePicker2"></div>
				                <div class="uploadBtn">开始上传</div>
				            </div>
				        </div>
				    </div>
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
    
    
    
    // 实例化
    var uploader = WebUploader.create({
    	 // swf文件路径
	    swf: 'assets/plugins/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    server :  'rest/web/system/upfile/uploadFile',//上传的URL
	    accept: {
            title: 'Images',
            extensions: "pdf,doc,docx,rar,zip",
            mimeTypes: 'application/msword|word,application/pdf|pdf,application/zip'
        },
        auto: true,
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: {
        	id: '#filePicker',
        	innerHTML: "选择资料"
    	}
    });
   

    uploader.on( 'uploadSuccess', function(file,ret) {
    	var success = false;
		var message = "";
		try {
        	if (ret.state == 'SUCCESS') {
        		success = true;
            }else{
            	message = ret.statusText || "未知原因"
            }
        } catch (e) {
        	message = "未知原因";
        }
        if(success){
        	$("#JS-homeImg").val(ret.url);
        	$("#img_div").css("display","block");
        	$("#JS-img-src").attr("href","rest/web/system/upfile/downFile?imageName=" + ret.url);
        }else{
        	XT.error(message);
        }

    });
    

});

</script>
