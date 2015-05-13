<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="net_listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="net_searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyWord" placeholder="关键字" value="" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="net_searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
            <button type="button" id="net_insertBtn" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 新增</button>
            <button type="button" id="net_deleteBtn" class="btn btn-danger ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-trash"></span> 删除</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            <table id="net_list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>
                        <th class="data-operator">
                            <label class="checkbox-inline">
                                <input type="checkbox" value=""/> 
                                &nbsp;&nbsp;&nbsp;
                            </label>
                        </th>
                        <th field="id">ID<span class="glyphicon"></span></th>
                        <th field="netTime">净值时间 <span class="glyphicon"></span></th>
                        <th field="unitNet">单位净值 <span class="glyphicon"></span></th>
                        <th field="totalNet">累计净值 <span class="glyphicon"></span></th>
                        <th field="increaseRate">增长率 <span class="glyphicon"></span></th>
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
            <div id="net_paginationDiv" class="col-md-12">
            </div>
        </div>
    </div>
</div>

</div>

<div id="net_modalDiv" class="hidden" >
</div>

    </div>
</div>

<script type="text/javascript">

var net_IndexPage = {};

$(function(){
    var insertUrl = "rest/admin/pe/peProductNet/insert?productId=" + ${productId};
    var updateUrl = "rest/admin/pe/peProductNet/update?productId=" + ${productId};
    var viewUrl = "rest/admin/pe/peProductNet/view?productId=" + ${productId};
    var deleteDataUrl = "rest/admin/pe/peProductNet/deleteData?productId=" + ${productId};
    var listDataCountUrl = "rest/admin/pe/peProductNet/listDataCount?productId=" + ${productId};
    var listDataUrl = "rest/admin/pe/peProductNet/listData?productId=" + ${productId};

    Btk.form($('#net_searchForm'));

    //搜索事件
    $("#net_searchBtn").click(function(event) {
        event.preventDefault();
        loadList();
        return false;
    }).click();

    $("#net_searchForm select[name=sType]").change(function(event) {
        event.preventDefault();
        loadList();
        return false;
    })

    //新增事件
    $("#net_insertBtn").click(function() {
        $("#net_modalDiv").load(
            insertUrl, 
            {
            },
            function(){
                togglePage('modal');
            });
  
    });

    //删除事件
    $("#net_deleteBtn").click(function() {
        var ids = Btk.tableCheckedIds($("#net_list-data"));
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
        $("#net_list-data > tbody a.edit").click(function(event) {
            event.preventDefault();
            $("#net_modalDiv").load(
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
        $("#net_list-data > tbody a.view").click(function(event) {
            event.preventDefault();
            $("#net_modalDiv").load(
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
        var _pageSize = $("#net_searchForm input[name='pageSize']").val();
        if(!pageSize){
            _pageSize = _pageSize?_pageSize:Btk.defaultPageSize;
        }else{
            _pageSize = pageSize
        }
        $("#net_searchForm input[name='pageSize']").val(_pageSize);
        $("#net_searchForm input[name='pageNo']").val("0");
        $.post(
            listDataCountUrl, 
            $('#net_searchForm').formSerialize(),
            function(data){
                if(data && data.total){
                    //分页数据
                    $("#net_paginationDiv").BtkPagination({
                        pageSize: _pageSize,
                        totalCount: data.total,
                        loadPaginationData: function(pNo){
                            $("#net_searchForm input[name='pageNo']").val(pNo);
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
        $("#net_list-data > tbody").load(
            listDataUrl, 
            $('#net_searchForm').formSerialize(), 
            function(){
                updateEvent();
                viewEvent();
                Btk.table($("#net_list-data"));
                Btk.loading("hide");
            });
    }

    $("#net_list-data").BtkTable({
        thSort: function(){
            $("#net_searchForm input[name='sortField']").val($(this).attr("field"));
            $("#net_searchForm input[name='sortType']").val($(this).attr("sortType"));
            loadListData();
        }
    });

    function togglePage(type){
        if("list" == type){
            $('#net_modalDiv').empty();
            $('#net_modalDiv').addClass('hidden');
            $('#net_listDiv').removeClass('hidden');
        }else if("modal" == type){
            $('#net_modalDiv').removeClass('hidden');
            $('#net_listDiv').addClass('hidden');
        }
    }

    net_IndexPage.togglePage = function(type){
        togglePage(type);
    }

    net_IndexPage.loadListData = function(){
        loadListData();
    }

});

</script>