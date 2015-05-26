<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" pageEncoding="UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">私募产品管理</h3>
        
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyWord" placeholder="关键字" value="" >
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
                        <th field="simpleName">产品名称 <span class="glyphicon"></span></th>
                        <th field="pecompanyName">私募公司 <span class="glyphicon"></span></th>
                        <th field="productLevel">产品等级 <span class="glyphicon"></span></th>
                        <th field="accumulatedIncome">累计收益 <span class="glyphicon"></span></th>
                        <th field="nowRate">今年以来收益 <span class="glyphicon"></span></th>
                        <th field="oneRate">近1年收益 <span class="glyphicon"></span></th>
                        <th field="towRate">近2年收益 <span class="glyphicon"></span></th>
                        <th field="netWorthTime">净值日期 <span class="glyphicon"></span></th>
                        <th field="setupTime">成立日期 <span class="glyphicon"></span></th>
                        <th field="status">产品状态 <span class="glyphicon"></span></th>
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
    var insertUrl = "rest/admin/pe/peProduct/insert";
    var updateUrl = "rest/admin/pe/peProduct/update";
    var viewUrl = "rest/admin/pe/peProduct/view";
    var deleteDataUrl = "rest/admin/pe/peProduct/deleteData";
    var listDataCountUrl = "rest/admin/pe/peProduct/listDataCount";
    var listDataUrl = "rest/admin/pe/peProduct/listData";

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
        $("#searchForm input[name='pageNo']").val("0");
        $.post(
            listDataCountUrl, 
            encodeURI(encodeURI(decodeURIComponent($('#searchForm').formSerialize(),true))),
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
            encodeURI(encodeURI(decodeURIComponent($('#searchForm').formSerialize(),true))),
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