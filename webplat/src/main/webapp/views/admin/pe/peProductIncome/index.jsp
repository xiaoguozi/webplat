<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="income_listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="income_searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyWord" placeholder="关键字" value="" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="income_searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
            <button type="button" id="income_insertBtn" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 新增</button>
            <button type="button" id="income_deleteBtn" class="btn btn-danger ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-trash"></span> 删除</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            <table id="income_list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>
                        <th class="data-operator">
                            <label class="checkbox-inline">
                                <input type="checkbox" value=""/> 
                                &nbsp;&nbsp;&nbsp;
                            </label>
                        </th>
                        <th field="id">ID<span class="glyphicon"></span></th>
                        <th field="year">年度 <span class="glyphicon"></span></th>
                        <th field="durationIncome">期间收益 <span class="glyphicon"></span></th>
                        <th field="industryAverage">行业平均 <span class="glyphicon"></span></th>
                        <th field="hs300">沪深300 <span class="glyphicon"></span></th>
                        <th field="rank">排名 <span class="glyphicon"></span></th>
                        <th field="rankInterval">排名区间 <span class="glyphicon"></span></th>
                        <th field="productName">产品名称 <span class="glyphicon"></span></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
        </div>
        <div class="row" >
            <div id="income_paginationDiv" class="col-md-12">
            </div>
        </div>
    </div>
</div>

</div>

<div id="income_modalDiv" class="hidden" >
</div>

    </div>
</div>

<script type="text/javascript">

var income_IndexPage = {};

$(function(){
    var insertUrl = "rest/admin/pe/peProductIncome/insert?productId=" + ${productId};
    var updateUrl = "rest/admin/pe/peProductIncome/update?productId=" + ${productId};
    var viewUrl = "rest/admin/pe/peProductIncome/view";
    var deleteDataUrl = "rest/admin/pe/peProductIncome/deleteData";
    var listDataCountUrl = "rest/admin/pe/peProductIncome/listDataCount?productId=" + ${productId};
    var listDataUrl = "rest/admin/pe/peProductIncome/listData?productId=" + ${productId};

    Btk.form($('#income_searchForm'));

    //搜索事件
    $("#income_searchBtn").click(function(event) {
        event.preventDefault();
        loadList();
        return false;
    }).click();

    $("#income_searchForm select[name=sType]").change(function(event) {
        event.preventDefault();
        loadList();
        return false;
    })

    //新增事件
    $("#income_insertBtn").click(function() {
        $("#income_modalDiv").load(
            insertUrl, 
            {
            },
            function(){
                togglePage('modal');
            });
  
    });

    //删除事件
    $("#income_deleteBtn").click(function() {
        var ids = Btk.tableCheckedIds($("#income_list-data"));
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
        $("#income_list-data > tbody a.edit").click(function(event) {
            event.preventDefault();
            $("#income_modalDiv").load(
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
        $("#income_list-data > tbody a.view").click(function(event) {
            event.preventDefault();
            $("#income_modalDiv").load(
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
        var _pageSize = $("#income_searchForm input[name='pageSize']").val();
        if(!pageSize){
            _pageSize = _pageSize?_pageSize:Btk.defaultPageSize;
        }else{
            _pageSize = pageSize
        }
        $("#income_searchForm input[name='pageSize']").val(_pageSize);
        $("#income_searchForm input[name='pageNo']").val("0");
        $.post(
            listDataCountUrl, 
            $('#income_searchForm').formSerialize(),
            function(data){
                if(data && data.total){
                    //分页数据
                    $("#income_paginationDiv").BtkPagination({
                        pageSize: _pageSize,
                        totalCount: data.total,
                        loadPaginationData: function(pNo){
                            $("#income_searchForm input[name='pageNo']").val(pNo);
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
        $("#income_list-data > tbody").load(
            listDataUrl, 
            $('#income_searchForm').formSerialize(), 
            function(){
                updateEvent();
                viewEvent();
                Btk.table($("#income_list-data"));
                Btk.loading("hide");
            });
    }

    $("#income_list-data").BtkTable({
        thSort: function(){
            $("#income_searchForm input[name='sortField']").val($(this).attr("field"));
            $("#income_searchForm input[name='sortType']").val($(this).attr("sortType"));
            loadListData();
        }
    });

    function togglePage(type){
        if("list" == type){
            $('#income_modalDiv').empty();
            $('#income_modalDiv').addClass('hidden');
            $('#income_listDiv').removeClass('hidden');
        }else if("modal" == type){
            $('#income_modalDiv').removeClass('hidden');
            $('#income_listDiv').addClass('hidden');
        }
    }

    income_IndexPage.togglePage = function(type){
        togglePage(type);
    }

    income_IndexPage.loadListData = function(){
        loadListData();
    }

});

</script>