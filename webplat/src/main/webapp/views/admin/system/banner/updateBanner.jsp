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
    <form id="modalForm" action="rest/admin/system/banner/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
         <input type="hidden" name="homeId" value="${sysHome.homeId}">
             
        <div class="form-group">
            <label class="col-md-2 control-label">标题</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="title" value="${sysHome.title}"  >
            </div>
         </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">启用状态</label>
            <div class="col-md-6">
             <input type="radio" name="enable" value="0" <c:if test="${sysHome.enable==0}">checked="checked"</c:if>>不启用
             <input type="radio" name="enable" value="1" <c:if test="${sysHome.enable==1}">checked="checked"</c:if>>启用
            </div>
            
        </div>
        
        <div class="form-group">
         <label class="col-md-2 control-label">图片类型</label>
            <div class="col-md-6">
             <input type="radio" name="homeType" value="0" <c:if test="${sysHome.homeType==0}">checked="checked"</c:if>>url
             <input type="radio" name="homeType" value="1" <c:if test="${sysHome.homeType==1}">checked="checked"</c:if>>自定义内容
            </div>
        </div>
        
        
        
          <div class="form-group">
         	<label class="col-md-2 control-label">图片</label>
         	<input type="hidden" class="form-control " name="homeImg" id="JS-homeImg" value="${sysHome.homeImg}" >
            <div class="col-md-10">
	            	  <div <c:if test="${(empty sysHome.homeImg)}">style="display:none"</c:if> id="img_div">
				           <img alt="ddd" src="rest/web/system/upfile/viewImage?imageName=${sysHome.homeImg}" style="width:100%;height:100%" id="JS-img-src">
				      </div>
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
        
         <div class="form-group">
            <label class="col-md-2 control-label">url地址</label>
            <div class="col-md-6">
                <input type="text" class="form-control " name="homeUrl" value="${sysHome.homeUrl}" >
            </div>
            
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">板块位置</label>
            <div class="col-md-6">
                <input type="radio" name="locationBanner" value="10" <c:if test="${fn:contains(sysHome.locationBanner,'10')}">checked="checked"</c:if>>首页banner
                <input type="radio" name="locationBanner" value="20" <c:if test="${fn:contains(sysHome.locationBanner,'20')}">checked="checked"</c:if>>信托首页banner
                <input type="radio" name="locationBanner" value="30" <c:if test="${fn:contains(sysHome.locationBanner,'30')}">checked="checked"</c:if>>私募首页banner       
            	<input type="radio" name="locationBanner" value="40" <c:if test="${fn:contains(sysHome.locationBanner,'40')}">checked="checked"</c:if>>配资首页banner              
            </div>    
        </div>
        
         <div class="form-group">
            <label class="col-md-2 control-label">排序</label>
            <div class="col-md-6">
                <input type="text" class="form-control number " name="orderIndex" value="${sysHome.orderIndex}" >
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
    
     // 实例化
    var uploader = WebUploader.create({
    	 // swf文件路径
	    swf: 'assets/plugins/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    server :  'rest/web/system/upfile/uploadFile',//上传的URL
	    accept: {
            title: 'Images',
            extensions: "jpg,jpeg,png,gif,bmp",
            mimeTypes: 'image/*'
        },
        auto: true,
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: {
        	id: '#filePicker',
        	innerHTML: "点击选择图片"
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
        	$("#JS-img-src").attr("src","rest/web/system/upfile/viewImage?imageName=" + ret.url);
        }else{
        	XT.error(message);
        }

    });
   

});

</script>
