/*!
 * Btk, boss toolkit
 * @author skyswpan
 */

var Btk = {};
(function(){
	Btk.webRoot = "/webplat"
    Btk.defaultPageSize = 15;
    Btk.errorDetailMsg = "";
    Btk.loadingNotify = undefined;

    $.fn.modal.defaults.modalOverflow = true;

    //设置表格组件
    Btk.showErrorDetailMsg = function(){
        if(Btk.errorDetailMsg && "" != Btk.errorDetailMsg){
            alert(Btk.errorDetailMsg);
        }
    };

    //获取选中的Id，以“,”分隔
    Btk.tableCheckedIds = function(element, type){
        var $this = $(element);
        var ids = "";
        if("radio" == type){
            $this.find("tbody > tr > td :radio").each(function() {
                if($(this).prop("checked")){
                    ids = ids +","+ $(this).val();
                }
            });
        }else{
            $this.find("tbody > tr > td :checkbox").each(function() {
                if($(this).prop("checked")){
                    ids = ids +","+ $(this).val();
                }
            });
        }
        
        if(ids.length>0){
            ids = ids.substr(1);
        }
        return ids;
    };

    //设置表格组件
    Btk.table = function(element,type){
        if("view" != type){
            Btk.hoverOperator(element);
        }
        Btk.tableCheckbox(element);
        Btk.tableDict(element);
    };

    //设置操作列的显示
    Btk.hoverOperator = function(element){
        var $this = $(element);
  /*      $this.find("tbody > tr").hover(
            function () {
                $(this).find("td.data-operator a").removeClass("invisible");
            },
            function () {
                $(this).find("td.data-operator a").addClass("invisible");
            }
        );*/
    //暂时修改为默认全部显示操作列，不再隐藏
        $this.find("tbody > tr > td.data-operator a").removeClass("invisible");
    };

    //设置checkbox的显示
    Btk.tableCheckbox = function(element){
        var $this = $(element);
        $this.find('tbody > tr > td label.radio-inline input:radio, tbody > tr > td label.checkbox-inline input:checkbox').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            });
    };

    //设置字典项的显示
    Btk.tableDict = function(element){
        var $this = $(element);
        var MetaDictData = typeof MetaDict === 'undefined'?{}:MetaDict;
        $this.find('tbody > tr > td[data-dict]').each(function () {
	    var dictOldList = ($(this).attr("data-dict-value")).split(",");
	    var dictNewList = new Array();
	    for(var i = 0; i < dictOldList.length; i++){
            	dictNewList.push(MetaDictData[$(this).attr("data-dict")][dictOldList[i]]);
 	    }
	    var dict = dictNewList.join(",");
            if(dict){
                $(this).html(dict);
            }
        });
    };

/*    Messenger.options = {
          extraClasses: "messenger-fixed messenger-on-top"
        };*/

    //显示消息
    Btk.message = function(msg, code){
        var typeCode = code?code:'bangTidy';
        if(msg){
           /* Messenger().post({
                message: msg,
                type: typeCode,
                hideAfter: 3
            }); */  
            $('#notifications').notify({ message: { text: msg }, type: typeCode }).show();
        }
    };

    //显示加载中提示
    Btk.loading = function(type){
        if("show" == type && !Btk.loadingNotify){ 
            Btk.loadingNotify = $('#notifications').notify({ 
                message: { text: "数据加载中..." }, 
                type: "info", 
                fadeOut:{enabled:false} 
            });
            Btk.loadingNotify.show();
        }
        if("hide" == type && Btk.loadingNotify){
            Btk.loadingNotify.hide();
            Btk.loadingNotify = undefined;
        }
    };

    //显示操作结果
    Btk.messageData = function(data){
        var typeCode = 'info';
        var msg = "系统发生异常！";
        if(data){
            msg = data.msg;
            if("0"==data.code){ 
                typeCode = 'success';
                msg = msg?msg:'操作成功！';
            }else if("-1"==data.code){ 
                typeCode = 'danger';
                /*msg = msg?msg:'操作失败！';
                var errorsMsg = "";
                for(var key in data.errors){
                    errorsMsg += data.errors[key]+"; ";
                }
                msg += "\n详情：" +errorsMsg;*/
                //msg +='&nbsp;&nbsp;&nbsp;<a href="javascript:alert('+data.errors+')">查看错误详情</a>';
            
                if(typeof msg == 'undefined'){
                    msg = '操作失败！';
                }else if(typeof msg == 'object'){
                    var _msg = "操作失败！";
                    for(var key in msg){
                        _msg += msg[key]+"; ";
                    }
                    msg = _msg;
                }else if(typeof msg == 'string'){
                    
                }

                var errorsMsg = "";
                if(typeof data.errors == 'object'){
                    for(var key in data.errors){
                        errorsMsg += data.errors[key]+"; ";
                    }
                }else if(typeof data.errors == 'string'){
                    errorsMsg = data.errors;
                }
                Btk.errorDetailMsg = errorsMsg;
                if(errorsMsg.length>0){
                    msg +='<br/><a href="javascript:Btk.showErrorDetailMsg();">查看错误详情</a>';
                }

            }else{
                typeCode = 'danger';
                msg = msg?msg:"系统发生异常！"+data;
            }
        }

       /* Messenger().post({
            message: msg,
            type: typeCode,
            hideAfter: 3
        }); */  
        $('#notifications').notify({ message: { html: msg }, type: typeCode }).show();
    };

    //设置表单只读
    Btk.formReadonly = function(form, editor){
        var $this = $(form);
        $this.find('input').prop("readonly", true);
        $this.find('textarea').prop("readonly", true);
        $this.find("input[type='radio']").prop('disabled',true); 
        $this.find("input[type='checkbox']").prop('disabled',true);
        $this.find('select').prop("disabled", true); 
        //$this.find('span.input-group-addon').addClass('hidden');

     /*   if(editor){
            editor.readonly();
        }*/
    };

    //设置表单组件
    Btk.form = function(form,type,callback){
        Btk.formFillCheck(form);
        Btk.formCheck(form);
        Btk.formAjaxSelect(form);
        var editor = Btk.formRichtext(form);
        if("view" == type){
            Btk.formReadonly(form, editor);
        }
        if("insert" == type || "update" == type ){
            Btk.formDatetimepicker(form);
            Btk.formRequiredStyle(form);
            Btk.formValidate(form);
            Btk.formSubmit(form, callback, editor);
        }
        if("search" == type){
            Btk.formDatetimepicker(form);
        }
        //$.Placeholder.init();
    }; 

    //绑定保存表单事件
    Btk.formSubmit = function(form,callback,editor){
        var $form = $(form);
        var $saveBtn = $($form.attr("data-submit"));

        $saveBtn.unbind('click').click(function(event) {
            event.preventDefault();
            if(editor){
               editor.sync(); 
            }
            if($form.valid()){
                var l = Ladda.create(this);
                l.start();
                $form.find("input[disabled-field]").prop('disabled', false);
                $form.ajaxSubmit(function(_data){
                    l.stop();
                    var data = _data;//eval('('+_data+')');
                    Btk.messageData(data);
                    if("0"!=data.code){
                        $form.find("input[disabled-field]").prop('disabled', true);
                    }
                    typeof callback == 'function' && callback.call(this,data);
                });
            }else{
                Btk.message("表单填写有误，请修改红色标记的输入项！","danger");
            }
            return false;
        });
    };     

    //设置日期组件
    Btk.formDatetimepicker = function(form){
        var $this = $(form).find('.form_date');
        $this.datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            pickerPosition:'bottom-left'
        });
//        $this.each(function() {
//            $(this).find('input:text').inputmask($(this).attr("data-date-format"));
//        });
    };  


    //设置checkbox/radio的初始状态
    Btk.formFillCheck = function(form){
        var $this = $(form);
        $this.find('input:radio').each(function () {
            if($(this).attr("ref-value") == $(this).val()){
                $(this).prop("checked",true);
            }
        });
        $this.find('input:checkbox').each(function () {
            var refValues = $(this).attr("ref-value");
            if(refValues){
                var refValue = refValues.split(",");
                var value = $(this).val();
                for(var i = 0; i<refValue.length; i++){
                    if(refValue[i] == value){
                        $(this).prop("checked",true);
                        break;
                    }
                }
            }
        });
    };  

    //设置checkbox/radio组件
    Btk.formCheck = function(form){
        var $this = $(form);

        $this.find('input:radio, div.checkbox input:checkbox, label.checkbox-inline input:checkbox').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            });
    }; 


    //设置Richtext组件
    Btk.formRichtext = function(form){
        //var $this = $(form);
        var editor = KindEditor.create('textarea.richtext', {
            cssPath : '/lib/kindeditor/plugins/code/prettify.css',
            uploadJson : '/system/kindeditor/uploadJson',
            fileManagerJson : '/system/kindeditor/fileManagerJson',
            allowFileManager : true,
            minWidth : '400px',
            width : '500px',
            height : '200px',
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'code', 'image', 'link', 'fullscreen', 'preview']
        });
        //prettyPrint();
        return editor;
    }; 

  

    //设置select2组件
    Btk.formAjaxSelect = function(form){
        var $this = $(form);
        var pageSize = 10;
        var sysUserLength = typeof _arrStaffs === 'undefined'?0:_arrStaffs.length;
        var queryUserIndex = 0;
        $this.find('.ajax-select:not(.select2)').each(function () {
            var $ele = $(this);
            var dataUrl = $ele.attr("data-url");
            dataUrl = dataUrl?dataUrl:"";
            var isUserSelect = dataUrl.indexOf("_SYS_USER")>=0?true:false;
         //   var placeholder = $(this).attr("placeholder");
            if(isUserSelect){
                $ele.select2({
                    "minimumInputLength": 1,
                  //  "data":_arrStaffs,
                    "allowClear": true,
                    "multiple": $ele.attr("data-multiple")=="true",
                    "query": function (query){
                        var data = {results: []};
                        var pageNo = query.page;
                        var start = (pageNo-1)*pageSize;
                        var end = pageNo*pageSize;
                        var more = end<sysUserLength;
                        end = end>sysUserLength?sysUserLength:end;
                        var resultsIndex = start;
                        if(1==pageNo){
                            queryUserIndex = 0;
                        }

                        for(var i=queryUserIndex; i<sysUserLength; i++){
                            if(resultsIndex>=start && resultsIndex<end){
                                if(query.term.length == 0 || _arrStaffs[i][1].toUpperCase().indexOf(query.term.toUpperCase()) >= 0 ){
                                    data.results.push({id: _arrStaffs[i][0], text: _arrStaffs[i][1] });
                                    resultsIndex ++;
                                }
                            }
                            if(resultsIndex == end || i == (sysUserLength-1)){
                                queryUserIndex = i;
                                more = i<(sysUserLength-1);
                                break;
                            }
                        }

                        data.more = more;
                        query.callback(data);
                    },
                    "initSelection" : function (element, callback) {
                        var ids = element.val();
                        ids = ids?ids.split(","):"";
                        var titles = element.attr("data-title");
                        titles = titles?titles.split(","):"";
                        var data;
                        if(ids.length <= 1){
                            data = {id: ids[0], text: titles[0]?titles[0]:ids[0]};
                        }else{
                            data = new Array();
                            for(var i =0; i<ids.length; i++){
                                data[i] = {id: ids[i], text: titles[i]?titles[i]:ids[i]};
                            }
                        }
                        callback(data);
                    }
                });
            }else{
                 $ele.select2({
             //       placeholder: placeholder,
                    "minimumInputLength": 0,
                    "allowClear": true,
                    "multiple": $ele.attr("data-multiple")=="true",
                    "ajax": {
                        "url": $ele.attr("data-url"),
                        "dataType": "json",
                        "quietMillis": 100,
                        "data": function(term, page) {
                            return {
                                "keyword": encodeURI(term),
                                "pageSize": pageSize,
                                "pageNo": page
                            };
                        },
                        "results": function(data, page) {
                            var more = (page * pageSize) < data.total;
                            return {
                                "results": data.data,
                                "more": more
                            };
                        }
                    },
                    "initSelection" : function (element, callback) {
                        var ids = element.val();
                        ids = ids?ids.split(","):"";
                        var titles = element.attr("data-title");
                        titles = titles?titles.split(","):"";
                        var data;
                        if(ids.length <= 1){
                            data = {id: ids[0], title: titles[0]?titles[0]:ids[0]};
                        }else{
                            data = new Array();
                            for(var i =0; i<ids.length; i++){
                                data[i] = {id: ids[i], title: titles[i]?titles[i]:ids[i]};
                            }
                        }
                        
                        callback(data);
                    },
                    "formatResult": function(e){
                        //return e.id+":"+e.title;
                        return e.title;
                    },
                    "formatSelection": function(e){
                        //return e.id+":"+e.title;
                        return e.title;
                    },
                    "escapeMarkup": function(e) {
                        return e;
                    }
                });           
            }

            $ele.addClass('select2');
        });
    }

    //设置必填样式
    Btk.formRequiredStyle = function(form){
        var $this = $(form);
        $this.find('input[required], input.required, textarea.required, select.required').each(function () {
            var $label = $(this).parents(".form-group").find("label.control-label");
            if($label.find("span.glyphicon-asterisk").length<=0){
                $label.prepend(' <span class="glyphicon glyphicon-asterisk text-danger"></span> ');
            }
        });
    }; 

    //设置表单校验组件
    Btk.formValidate = function(form){
        var $this = $(form);
        return $this.validate({
            errorElement: "span",
            errorPlacement: function(error, ele) {
              //  if($(ele).attr("type") == "radio" || $(ele).attr("type") == "checkbox"){
                    $(ele).parents(".form-group").append(error);
               // }else{
              //      $(ele).parents(".form-group").append(error);
              //  }
            }, 
            success: function(label) {  
                $(label).parents(".form-group").addClass("has-success").removeClass("has-error");  
            }, 
            highlight: function(ele) {  
                $(ele).parents(".form-group").addClass("has-error").removeClass("has-success");  
              },  
            errorClass:"help-block text-danger"
        });
    }

    //$('#create-switch').wrap('<div class="switch" />').parent().bootstrapSwitch();  

})();

