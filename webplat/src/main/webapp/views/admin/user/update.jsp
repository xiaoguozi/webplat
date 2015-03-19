
<div class="modal-header">
    <button type="button" class="close modalCloseBtn" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" >修改数据源</h4>
</div>
<div class="modal-body">
    <form id="modalForm" action="/pageDataSource/updateData" method="post" class="form-horizontal" role="form" data-submit="#modalSaveBtn">
        <input type="hidden" id="input-iDsId" name="iDsId" value="{/$data['iDsId']/}">
        <input type="hidden" id="input-sCreator" name="sCreator" value="{/$data['sCreator']/}">
        <input type="hidden" id="input-sCreateTime" name="sCreateTime" value="{/$data['sCreateTime']/}">
        <input type="hidden" id="input-sUpdateTime" name="sUpdateTime" value="{/$data['sUpdateTime']/}">
        <input type="hidden" id="input-sType" name="sType" value="{/$data['sType']/}">

        <div class="form-group">
            <label for="input-sDsName" class="col-md-3 control-label">数据源名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="sDsName" value="{/$data['sDsName']/}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sHost" class="col-md-3 control-label">Host</label>
            <div class="col-md-6">
                <input type="text" class="form-control" name="sHost" value="{/$data['sHost']/}"  >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sPort" class="col-md-3 control-label">Port</label>
            <div class="col-md-6">
                <input type="text" class="form-control" name="sPort" value="{/$data['sPort']/}"   >
                <span class="help-block">【Host&port】和【NameServiceKey】二者填其一</span>
            </div>
        </div>
        <div class="form-group">
            <label for="input-sNameServiceKey" class="col-md-3 control-label">NameServiceKey</label>
            <div class="col-md-6">
                <input type="text" class="form-control" name="sNameServiceKey" value="{/$data['sNameServiceKey']/}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sUsername" class="col-md-3 control-label">Username</label>
            <div class="col-md-6">
                <input type="text" class="form-control required" name="sUsername" value="{/$data['sUsername']/}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sPassword" class="col-md-3 control-label">Password</label>
            <div class="col-md-6">
                <input type="password" class="form-control required" name="sPassword" value="{/$data['sPassword']/}" >
            </div>
        </div>
        <div class="form-group">
            <label for="input-sDbname" class="col-md-3 control-label">Dbname</label>
            <div class="col-md-4">
                <input type="text" class="form-control required" name="sDbname" value="{/$data['sDbname']/}" >
            </div>
            <button type="button" id="modalTestConnBtn"  class="btn btn-default ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-retweet"></span> 测试连接</button>
        </div>
        <div class="form-group">
            <label for="radio-sCharset" class="col-md-3 control-label">Charset</label>
            <div class="col-md-6">
                <label class="radio-inline">
                <input type="radio" name="sCharset" ref-value="{/$data['sCharset']/}" value=""> 数据库默认(不指定)
                </label>
                <label class="radio-inline">
                <input type="radio" class="" name="sCharset" ref-value="{/$data['sCharset']/}" value="utf8" > utf8
                </label>
                <label class="radio-inline">
                <input type="radio" name="sCharset" ref-value="{/$data['sCharset']/}" value="latin1"> latin1
                </label>
                <label class="radio-inline">
                <input type="radio" name="sCharset" ref-value="{/$data['sCharset']/}" value="gbk"> gbk
                </label>
                <label class="radio-inline">
                <input type="radio" name="sCharset" ref-value="{/$data['sCharset']/}" value="gb2312"> gb2312
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">数据库类型</label>
            <div class="col-md-6">
                <label class="radio-inline">
                <input type="radio" name="sDriver" ref-value="{/$data['sDriver']/}" value="mysql"> mysql
                </label>
                <label class="radio-inline">
                <input type="radio" class="" name="sDriver" ref-value="{/$data['sDriver']/}" value="hive" > hive
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="input-sResponser" class="col-md-3 control-label">负责人</label>
            <div class="col-md-6">
                <input type="text" class="form-control ajax-select" id="input-sResponser" name="sResponser" value="{/$data['sResponser']/}" data-title="{/$data['sResponser']/}" data-url="_SYS_USER" data-multiple="true"></div>
        </div>
        <div class="form-group">
            <label for="input-sRemark" class="col-md-3 control-label">备注</label>
            <div class="col-md-6">
                <textarea class="form-control required" rows="2" id="input-sRemark" name="sRemark">{/$data['sRemark']/}</textarea>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">关闭</button>
    <button type="button" id="modalSaveBtn"  class="btn btn-primary ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-save"></span> 保存</button>
</div>


<script type="text/javascript">

$(function(){
    var testDataSourceUrl = "/pageDataSource/testDataSource";

    Btk.form($("#modalForm"),"update",function(data){
        if("0"==data.code){
            IndexPage.togglePage('list');
            $("#searchBtn").click();
        }
    });

    $("button.modalCloseBtn").unbind('click').click(function(event) {
        IndexPage.togglePage('list');
    });

    $("#modalTestConnBtn").click(function(event) {
        event.preventDefault();
        var $this = this;
        var l = Ladda.create($this);
        l.start();
        $.post(
            testDataSourceUrl, 
            { 
                "sHost": $("#modalForm input[name='sHost']").val(),
                "sPort": $("#modalForm input[name='sPort']").val(),
                "sNameServiceKey": $("#modalForm input[name='sNameServiceKey']").val(),
                "sUsername": $("#modalForm input[name='sUsername']").val(),
                "sPassword": $("#modalForm input[name='sPassword']").val(),
                "sDbname": $("#modalForm input[name='sDbname']").val()
            },
            function(data){
                Btk.messageData(data);
            }, "json")
            .always(function() { l.stop(); });
        return false;
    })

});

</script>
