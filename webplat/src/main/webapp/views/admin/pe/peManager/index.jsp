<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">私募经理管理</h3>
        
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyword" placeholder="关键字" value="" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
            <button type="button" id="insertBtn" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 新增</button>
            <button type="button" id="deleteBtn" class="btn btn-danger ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-trash"></span> 删除</button>
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
                            <label class="checkbox-inline">
                                <input type="checkbox" value=""/> 
                                &nbsp;&nbsp;&nbsp;
                            </label>
                        </th>
                        <th field="id">ID<span class="glyphicon"></span></th>
                        <th field="name">姓名 <span class="glyphicon"></span></th>
                        <th field="name">私募公司 <span class="glyphicon"></span></th>
                        <th field="education">文化程度 <span class="glyphicon"></span></th>
                        <th field="workYear">从业年限 <span class="glyphicon"></span></th>
                        <th field="manageFund">管理基金数<span class="glyphicon"></span></th>
                        <th field="profitProduct">盈利基金数<span class="glyphicon"></span></th>
                        <th field="profitProduct">产品盈利占比<span class="glyphicon"></span></th>
                        <th field="profitProduct">代表产品<span class="glyphicon"></span></th>
                        <th field="profitProduct">累计收益<span class="glyphicon"></span></th>
                        <th field="status">状态<span class="glyphicon"></span></th>
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
    var insertUrl = "rest/admin/pe/peManager/insert";
    var updateUrl = "rest/admin/pe/peManager/update";
    var viewUrl = "rest/admin/pe/peManager/view";
    var deleteDataUrl = "rest/admin/pe/peManager/deleteData";
    var listDataCountUrl = "rest/admin/pe/peManager/listDataCount";
    var listDataUrl = "rest/admin/pe/peManager/listData";

    Btk.form($('#searchForm'));

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
        
        $.post(
            listDataCountUrl, 
            $('#searchForm').formSerialize(),
            function(data){
                if(data && data.total){
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

            }, "json");
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