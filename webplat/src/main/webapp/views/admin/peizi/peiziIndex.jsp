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
        <h3 class="page-title" id="index-page-title">配资规则管理</h3>
        
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="searchBtn" class="btn btn-info ladda-button" data-style="expand-right" style="display:none"><span class="glyphicon glyphicon-search"></span> </button>
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
                       <th field="data_id">订单号<span class="glyphicon"></span></th>                      
                       <th field="data_type">配资类型  <span class="glyphicon"></span></th>
                       <th field="data_zcpzj">总超盘资金<span class="glyphicon"></span></th>
                       <th field="data_tzbzj">保证金<span class="glyphicon"></span></th>
                       <th field="data_jjx">警戒线<span class="glyphicon"></span></th>
                       <th field="data_pcx">平仓线<span class="glyphicon"></span></th>
                       <th field="data_jklx_total">借款总利息<span class="glyphicon"></span></th>
                       <th field="data_zjsyqx">使用期限<span class="glyphicon"></span></th>
                       <th field="data_id">借款利率<span class="glyphicon"></span></th>
                       <th field="data_submit_date">配资申请时间<span class="glyphicon"></span></th>
                       <th field="data_id">配资交易开始时间<span class="glyphicon"></span></th>
                       <th field="data_id">备注<span class="glyphicon"></span></th>                                                      
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
	 var insertUrl = "rest/admin/peizi/peizi/insert";
     var updateUrl = "rest/admin/peizi/peizi/update";
     var viewUrl = "rest/admin/peizi/peizi/view";
     var deleteDataUrl = "rest/admin/peizi/peizi/deleteData";
     var listDataCountUrl ="rest/admin/peizi/peizi/listDataCount";
     var listDataUrl = "rest/admin/peizi/peizi/listData";

    Btk.form($('#searchForm'));

    //搜索事件
    $("#searchBtn").click(function(event) {
        event.preventDefault();
        loadList();
        return false;
    }).click();


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