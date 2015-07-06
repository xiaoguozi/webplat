<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">提现处理</h3>
        
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            <div class="form-group">
            
	             <!-- Single button -->
				<div class="btn-group" >
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   <span class="txzt" style="width:50px">提现状态</span><span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu">
				    <li><a href="" title="提现状态" value="">--全部--</a></li>
				    <li><a href="#" title="待审核" value="0">待审核</a></li>
				    <li><a href="#" title="待确定" value="1">待确定</a></li>
				    <li><a href="#" title="完成"  value="2">完成</a></li>
				    <li><a href="#" title="取消" value="3">取消</a></li>				   
				  </ul>				 
				</div>
				
                <input type="hidden" id="withdrawStatus" name="withdraw.status" value="">
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            
		    <input type="text" class="form-control" size="20" name="keyWord" placeholder="关键字" value="" style="width:150px">

            <button type="submit" id="searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            <table id="list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>
                        <th class="data-operator">
                           
                        </th>                      
                        <th field="create_by">客户名称 <span class="glyphicon"></span></th>
                        <th field="bank_name">提现银行<span class="glyphicon"></span></th>
                        <th field="card_no">卡号<span class="glyphicon"></span></th>
                        <th field="create_time">申请时间<span class="glyphicon"></span></th>
                        <th field="audit_by">审核人<span class="glyphicon"></span></th>
                        <th field="audit_time">审核时间<span class="glyphicon"></span></th>                     
                        <th field="check_by">确定人<span class="glyphicon"></span></th>
                        <th field="check_time">确定时间<span class="glyphicon"></span></th>
                        <th field="status">提现状态<span class="glyphicon"></span></th> 
                        <th field="audit_desc">备注<span class="glyphicon"></span></th>                                                
                    </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
        </div>
        <div class="row" >
            <div id="paginationDiv" class="col-md-12">
            </div>
        </div>
    </div>
</div>

</div>

<div id="modalDiv" class="hidden" >

</div>

    </div>
</div>

<script type="text/javascript">

var IndexPage = {};

$(function(){
    var insertUrl = "rest/admin/withdraw/insert";
    var updateUrl = "rest/admin/withdraw/update";
    var viewUrl = "rest/admin/withdraw/update";
    var deleteDataUrl = "rest/admin/withdraw/deleteData";
    var listDataCountUrl = "rest/admin/withdraw/listDataCount";
    var listDataUrl = "rest/admin/withdraw/listData";

    Btk.form($('#searchForm'));
    
    
    //查询条件
    $(".dropdown-menu a").click(function(event) {
        event.preventDefault();
        $("#withdrawStatus").val($(this).attr("value"));
        loadList();      
       $(".txzt").html($(this).attr("title"))
       $(".form-group .open").removeClass("open");              
        return false;
    });

    //搜索事件
    $("#searchBtn").click(function(event) {
        event.preventDefault();
        loadList();
        return false;
    }).click();

    $("#searchForm select[name=sType]").change(function(event) {
        event.preventDefault();
        loadList();
        return false;
    })

    //新增事件
    $("#insertBtn").click(function() {
        $("#modalDiv").load(
            insertUrl, 
            {
            },
            function(){
                togglePage('modal');
            });
  
    });

    //删除事件
    $("#deleteBtn").click(function() {
        var ids = Btk.tableCheckedIds($("#list-data"));
        if(!ids){
            Btk.message("请选择记录进行操作！");
            return false;
        }else{
            var $this = this;
            confirm("确定要<strong class='text-danger'>删除</strong>选中的数据吗？您只能删除本人创建的数据。", function(confirm){
                if(confirm){
                    var l = Ladda.create($this);
                    l.start();
                    $.post(
                        deleteDataUrl, 
                        { 
                            "ids": ids
                        },
                        function(data){
                            Btk.messageData(data);
                            loadList();
                        }, "json")
                    .always(function() { l.stop(); });
                }
            });
        }
    });

    //修改事件
    function updateEvent(){
        $("#list-data > tbody a.edit").click(function(event) {
            event.preventDefault();
            $("#modalDiv").load(
                updateUrl, 
                {
                    "id": $(this).attr("data-id")?$(this).attr("data-id"):""
                }, 
                function(){
                    togglePage('modal');
                });
            return false;
        });
    }

    //查看事件
    function viewEvent(){
        $("#list-data > tbody a.view").click(function(event) {
            event.preventDefault();
            $("#modalDiv").load(
                viewUrl, 
                {
                    "id": $(this).attr("data-id")?$(this).attr("data-id"):""
                }, 
                function(){
                    togglePage('modal');
                });
            return false;
        });
    }

    //加载列表
    function loadList(pageSize){
        var _pageSize = $("#searchForm input[name='pageSize']").val();
        if(!pageSize){
            _pageSize = _pageSize?_pageSize:Btk.defaultPageSize;
        }else{
            _pageSize = pageSize
        }
        $("#searchForm input[name='pageSize']").val(_pageSize);
        $("#searchForm input[name='pageNo']").val(0);
        
        $.post(
            listDataCountUrl, 
            $('#searchForm').formSerialize(),
            function(data){
                if(data && "undefined"!= typeof data.total){
                    //分页数据
                    $("#paginationDiv").BtkPagination({
                        pageSize: _pageSize,
                        totalCount: data.total,
                        loadPaginationData: function(pNo){
                            $("#searchForm input[name='pageNo']").val(pNo);
                            loadListData();
                        },
                        loadData: function(pSize){
                            loadList(pSize);
                        }
                    });                    
                }

            });
    }

    //加载列表数据
    function loadListData(){
        Btk.loading("show");
        $("#list-data > tbody").load(
            listDataUrl, 
            $('#searchForm').formSerialize(), 
            function(){
                updateEvent();
                viewEvent();
                Btk.table($("#list-data"));
                Btk.loading("hide");
            });
    }

    $("#list-data").BtkTable({
        thSort: function(){
            $("#searchForm input[name='sortField']").val($(this).attr("field"));
            $("#searchForm input[name='sortType']").val($(this).attr("sortType"));
            loadListData();
        }
    });

    function togglePage(type){
        if("list" == type){
            $('#modalDiv').empty();
            $('#modalDiv').addClass('hidden');
            $('#listDiv').removeClass('hidden');
        }else if("modal" == type){
            $('#modalDiv').removeClass('hidden');
            $('#listDiv').addClass('hidden');
        }
    }

    IndexPage.togglePage = function(type){
        togglePage(type);
    }

    IndexPage.loadListData = function(){
        loadListData();
    }

});

</script>