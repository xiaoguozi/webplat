<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title pull-left">海外保险<small>新增</small></h3>
        
<div class="pull-right">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="modal-body">
    <form id="modalForm" name="modalForm" action="rest/admin/kybx/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" name="kybxId" value="${kybx.kybxId}">
        
        
        <div class="form-group">
           <label class="col-md-2 control-label">保险logo图片</label>
         	<input type="hidden" class="form-control " name="kybxImgUrl" id="JS-homeImg" value="${kybx.kybxImgUrl}" >
            <div class="col-md-10">          			           			
	            	   <div <c:if test="${(empty kybx.kybxImgUrl)}">style="display:none"</c:if> id="img_div">
				           <img alt="ddd" src="rest/web/system/upfile/viewImage?imageName=${kybx.kybxImgUrl}" id="JS-img-src">
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
            <label class="col-md-2 control-label">保险名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxName" value="${kybx.kybxName}"  >
            </div>
         </div>
        
        <div class="form-group">
            <label class="col-md-2 control-label">年限选择</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxChoose" value="${kybx.kybxChoose}"  >
            </div>
         </div>
         
         <div class="form-group">
            <label class="col-md-2 control-label">投保年龄</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxAge" value="${kybx.kybxAge}"  >
            </div>
         </div>
         
         <div class="form-group">
            <label class="col-md-2 control-label">保险金额</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxAmont" value="${kybx.kybxAmont}"  >
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">产品大类</label>
            <div class="col-md-6">
                <input type="radio" name="kybxClass" value="10" <c:if test="${kybx.kybxClass== '10'}">checked="checked"</c:if>>寿险
                <input type="radio" name="kybxClass" value="20" <c:if test="${kybx.kybxClass== '20'}">checked="checked"</c:if>>医疗
                <input type="radio" name="kybxClass" value="30" <c:if test="${kybx.kybxClass== '30'}">checked="checked"</c:if>>保费隔资  
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">产品小类</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxSubclass" value="${kybx.kybxSubclass}"  >
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">状态</label>
            <div class="col-md-6">
                   <input type="radio" name="kybxStatus" value="10" <c:if test="${kybx.kybxStatus== '10'}">checked="checked"</c:if>>未上线
                   <input type="radio" name="kybxStatus" value="20" <c:if test="${kybx.kybxStatus== '20'}">checked="checked"</c:if>>已上线
                   <input type="radio" name="kybxStatus" value="30" <c:if test="${kybx.kybxStatus== '30'}">checked="checked"</c:if>>已下线                            	  
            </div>
            
          </div>
          
          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐位</label>
            <div class="col-md-6">           	                
                  <input type="checkbox" name="kybxTjw" value="10" <c:if test="${fn:contains(kybx.kybxTjw,'10')}">checked="checked"</c:if>>平台首页
                  <input type="checkbox" name="kybxTjw" value="20" <c:if test="${fn:contains(kybx.kybxTjw,'20')}">checked="checked"</c:if>>版块首页 
                  <input type="checkbox" name="kybxTjw" value="30" <c:if test="${fn:contains(kybx.kybxTjw,'30')}">checked="checked"</c:if>>无推荐            
            </div>           
          </div>
          
          
           <div class="form-group">
            <label class="col-md-2 control-label">推荐序号</label>
            <div class="col-md-6">
                    <input type="text" class="form-control required number" name="kybxTjno" value="${kybx.kybxTjno}">
            </div>          
          </div>
        
        
        <div class="form-group">
            <label class="col-md-2 control-label">产品亮点</label>
            <div class="col-md-6">
                <textarea id="kybxGood" name="kybxGood" style="width:700px;height:300px;">${kybx.kybxGood}</textarea>
            </div>
         </div>
         
         <div class="form-group">
            <label class="col-md-2 control-label">产品信息</label>
            <div class="col-md-6">
                <textarea id="kybxInfo" name="kybxInfo" style="width:700px;height:300px;">${kybx.kybxInfo}</textarea>
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">保障计划</label>
            <div class="col-md-6">
                <textarea id="kybxPlan" name="kybxPlan" style="width:700px;height:300px;">${kybx.kybxPlan}</textarea>
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">理赔流程</label>
            <div class="col-md-6">
                <textarea id="kybxLplc" name="kybxLplc" style="width:700px;height:300px;">${kybx.kybxLplc}</textarea>
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">常见问题</label>
            <div class="col-md-6">
                <textarea id="kybxQuestion" name="kybxQuestion" style="width:700px;height:300px;">${kybx.kybxQuestion}</textarea>
            </div>
         </div>
         
         
               
          <div class="form-group">
            <label class="col-md-2 control-label">保险条款</label>
            <div class="col-md-6">
                <textarea id="kybxTk" name="kybxTk" style="width:700px;height:300px;">${kybx.kybxTk}</textarea>
            </div>
         </div>
         
         
                   
    </form>
</div>


<script type="text/javascript">

$(function(){
    Btk.form($("#modalForm"),"update",function(data){
        if("0"==data.code){
            IndexPage.togglePage('list');
            KindEditor.remove('textarea[name="kybxGood"]');
            KindEditor.remove('textarea[name="kybxInfo"]');
            KindEditor.remove('textarea[name="kybxPlan"]');
            KindEditor.remove('textarea[name="kybxLplc"]');
            KindEditor.remove('textarea[name="kybxQuestion"]');
            KindEditor.remove('textarea[name="kybxTk"]');
            $("#searchBtn").click();
        }
    },function(){    	
    	 editorkybxGood.sync();
    	 editorkybxInfo.sync();
    	 editorkybxPlan.sync();
    	 editorkybxLplc.sync();
    	 editorkybxQuestion.sync();
    	 editorkybxTk.sync();      	   	   	
    });


    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
        KindEditor.remove('textarea[name="kybxGood"]');
        KindEditor.remove('textarea[name="kybxInfo"]');
        KindEditor.remove('textarea[name="kybxPlan"]');
        KindEditor.remove('textarea[name="kybxLplc"]');
        KindEditor.remove('textarea[name="kybxQuestion"]');
        KindEditor.remove('textarea[name="kybxTk"]');
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
