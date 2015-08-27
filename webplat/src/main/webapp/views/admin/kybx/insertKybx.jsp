<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="com.tjs.admin.kybx.constants.KybxClassEnum" pageEncoding="utf-8"%>


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
    <form id="modalForm" name="modalForm" action="rest/admin/kybx/insertData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
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
            <label class="col-md-2 control-label">保险产品全称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxName" value="${kybx.kybxName}"  >
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">保险产品简称称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxShortName" value="${kybx.kybxShortName}"  >
            </div>
         </div>
         
         <div class="form-group">
            <label class="col-md-2 control-label">保险公司名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxCompanyName" value="${kybx.kybxCompanyName}"  >
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
            <label class="col-md-2 control-label">保障金额</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxAmont" value="${kybx.kybxAmont}"  >
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">适合人群</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="kybxShrq" value="${kybx.kybxShrq}"  >
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">产品亮点</label>
            <div class="col-md-6">
            	<input type="text" class="form-control required" name="kybxGood" value="${kybx.kybxGood}"  >
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">产品大类</label>
            <div class="col-md-6">
                <input type="radio" name="kybxClass" value="10" <c:if test="${kybx.kybxClass== '10'}">checked="checked"</c:if>><%=KybxClassEnum.CXSX.getValue() %>
                <input type="radio" name="kybxClass" value="20" <c:if test="${kybx.kybxClass== '20'}">checked="checked"</c:if>><%=KybxClassEnum.YLBX.getValue() %>
                <input type="radio" name="kybxClass" value="30" <c:if test="${kybx.kybxClass== '30'}">checked="checked"</c:if>><%=KybxClassEnum.BFGZ.getValue() %>  
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
            <label class="col-md-2 control-label">产品优势</label>
            <div class="col-md-6">
                <textarea  name="kybxCpys" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
         
         <div class="form-group">
            <label class="col-md-2 control-label">产品介绍</label>
            <div class="col-md-6">
                <textarea  name="kybxInfo" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
          <div class="form-group">
            <label class="col-md-2 control-label">保障计划</label>
            <div class="col-md-6">
                <textarea  name="kybxPlan" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">理赔流程</label>
            <div class="col-md-6">
                <textarea  name="kybxLplc" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
         
          <div class="form-group">
            <label class="col-md-2 control-label">常见问题</label>
            <div class="col-md-6">
                <textarea  name="kybxQuestion" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
         
               
          <div class="form-group">
            <label class="col-md-2 control-label">保险条款</label>
            <div class="col-md-6">
                <textarea  name="kybxTk" style="width:700px;height:300px;"></textarea>
            </div>
         </div>
         
         
         <div class="form-group">
           <label class="col-md-2 control-label">资料上传 </label>
            <div  class="col-md-1" <c:if test="${(empty kybx.kybxZlUrl)}">style="display:none"</c:if> id="zl_div">	            	   
		          <a href="rest/web/system/upfile/downFile?imageName=${kybx.kybxZlUrl}"  id="JS-zl-src"><img alt="ddd" src="assets/img/attachfile.png"></a>
		    </div>
         	<input type="hidden" class="form-control " name="kybxZlUrl" id="JS-homezl" value="${kybx.kybxZlUrl}" >
            <div class="col-md-5">          			           				            	   
                     <div id="uploader" class="wu-example">
                    	
				        <div class="queueList">
				            <div id="dndArea" class="placeholder">
				                <div id="filePicker1"></div>				               
				            </div>
				        </div>
				        <div class="statusBar" style="display:none;">
				            <div class="progress">
				                <span class="text">0%</span>
				                <span class="percentage"></span>
				            </div>
				            <div class="info"></div>
				            <div class="btns">
				                <div id="filePicker3"></div>
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
            KindEditor.remove('textarea[name="kybxCpys"]');
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
        KindEditor.remove('textarea[name="kybxCpys"]');
        KindEditor.remove('textarea[name="kybxInfo"]');
        KindEditor.remove('textarea[name="kybxPlan"]');
        KindEditor.remove('textarea[name="kybxLplc"]');
        KindEditor.remove('textarea[name="kybxQuestion"]');
        KindEditor.remove('textarea[name="kybxTk"]');
    });
    
    
    
    // 实例化
    var uploader1 = WebUploader.create({
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
   

    uploader1.on( 'uploadSuccess', function(file,ret) {
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
        	id: '#filePicker1',
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
        	$("#JS-homezl").val(ret.url);
        	$("#zl_div").css("display","block");
        	$("#JS-zl-src").attr("href","rest/web/system/upfile/downFile?imageName=" + ret.url);
        }else{
        	XT.error(message);
        }

    });
     

});

</script>
