<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="only_listDiv">

<div class="row">
    <div class="col-md-12">
        <form id="only_searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyWord" placeholder="关键字" value="" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="only_searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
            <button type="button" id="only_deleteBtn" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> 保存</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            <table id="only_list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>
                        <th class="data-operator">
                            
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
            <div id="only_paginationDiv" class="col-md-12">
            </div>
        </div>
    </div>
</div>

</div>

<div id="only_modalDiv" class="hidden" >
</div>

    </div>
</div>

<script type="text/javascript">

var only_IndexPage = {};

$(function(){
    var insertUrl = "rest/admin/pe/productOnly/updateData?managerId=" + ${managerId};
    var updateUrl = "rest/admin/pe/productOnly/update?managerId=" + ${managerId};
    var viewUrl = "rest/admin/pe/productOnly/view?managerId=" + ${managerId};
    var deleteDataUrl = "rest/admin/pe/productOnly/updateData";
    var listDataCountUrl = "rest/admin/pe/productOnly/listDataCount?managerId=" + ${managerId};
    var listDataUrl = "rest/admin/pe/productOnly/listData?managerId=" + ${managerId};

    Btk.form($('#only_searchForm'));

    //搜索事件
    $("#only_searchBtn").click(function(event) {
        event.preventDefault();
        loadList();
        return false;
    }).click();

    $("#only_searchForm select[name=sType]").change(function(event) {
        event.preventDefault();
        loadList();
        return false;
    })

    //新增事件
    $("#only_insertBtn").click(function() {
        $("#only_modalDiv").load(
            insertUrl, 
            {
            },
            function(){
                togglePage('modal');
            });
  
    });

    //删除事件
    $("#only_deleteBtn").click(function() {
        var ids = Btk.tableCheckedIds($("#only_list-data"),'radio');
        if(!ids){
            Btk.message("请选择记录进行操作！");
            return false;
        }else{
            var $this = this;
            confirm("确定要设置选中的数据为<strong class='text-danger'>代表作</strong>吗？", function(confirm){
                if(confirm){
                    var l = Ladda.create($this);
                    l.start();
                    $.post(
                        deleteDataUrl, 
                        { 
                            "ids": ids,
                             "managerId":${managerId}
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
        $("#only_list-data > tbody a.edit").click(function(event) {
            event.preventDefault();
            $("#only_modalDiv").load(
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
        $("#only_list-data > tbody a.view").click(function(event) {
            event.preventDefault();
            $("#only_modalDiv").load(
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
        var _pageSize = $("#only_searchForm input[name='pageSize']").val();
        if(!pageSize){
            _pageSize = _pageSize?_pageSize:Btk.defaultPageSize;
        }else{
            _pageSize = pageSize
        }
        $("#only_searchForm input[name='pageSize']").val(_pageSize);
        $("#only_searchForm input[name='pageNo']").val("0");
        $.post(
            listDataCountUrl, 
            $('#only_searchForm').formSerialize(),
            function(data){
                if(data && data.total){
                    //分页数据
                    $("#only_paginationDiv").BtkPagination({
                        pageSize: _pageSize,
                        totalCount: data.total,
                        loadPaginationData: function(pNo){
                            $("#only_searchForm input[name='pageNo']").val(pNo);
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
        $("#only_list-data > tbody").load(
            listDataUrl, 
            $('#only_searchForm').formSerialize(), 
            function(){
                updateEvent();
                viewEvent();
                Btk.table($("#only_list-data"));
                Btk.loading("hide");
            });
    }

    $("#only_list-data").BtkTable({
        thSort: function(){
            $("#only_searchForm input[name='sortField']").val($(this).attr("field"));
            $("#only_searchForm input[name='sortType']").val($(this).attr("sortType"));
            loadListData();
        }
    });

    function togglePage(type){
        if("list" == type){
            $('#only_modalDiv').empty();
            $('#only_modalDiv').addClass('hidden');
            $('#only_listDiv').removeClass('hidden');
        }else if("modal" == type){
            $('#only_modalDiv').removeClass('hidden');
            $('#only_listDiv').addClass('hidden');
        }
    }

    only_IndexPage.togglePage = function(type){
        togglePage(type);
    }

    only_IndexPage.loadListData = function(){
        loadListData();
    }

});

</script>