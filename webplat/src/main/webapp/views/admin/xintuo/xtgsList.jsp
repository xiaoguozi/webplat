<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">用户管理</h3>
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="#">首页</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">系统管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">产品管理</a>
            </li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div id="listDiv" class="row" >
    <div class="col-md-12">

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            <div class="form-group">
                <input type="text" class="form-control" size="30" name="keyword" placeholder="关键字" value="" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="">
                  <input type="hidden" name="xtgsId" value="">
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
                        <th field="xgtsZhname">公司名称 <span class="glyphicon"></span></th>
                        <th field="xtgsCode">公司编码 <span class="glyphicon"></span></th>
                        <th field="xgtsGsz">董事长 <span class="glyphicon"></span></th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr>
                      <c:forEach var="productGs" items="${lstProductGs}">
                      
                       <td>
                        <label class="checkbox-inline">
                      		<input type="checkbox" value=""/>
                       </label>
                       </td> 
                       <td><a class="edit" data-id="${productGs.xtgsId }" >${productGs.xgtsZhname }</a></td>
                       <td>${productGs.xtgsCode }</td>
                       <td>${productGs.xgtsGsz }</td>
                       </tr>  
                     </c:forEach>                  
                                                 
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
</div>
<div id="modalDiv" class="container hidden" >

</div>

<script type="text/javascript">

var IndexPage = {};

$(function(){
    var insertUrl = "rest/admin/xintuogs/initXtgs";
    var updateUrl = "rest/admin/xintuogs/updateXtgs";
    var viewUrl = "rest/admin/xintuogs/initXtgs";
    var deleteDataUrl = "rest/admin/user/deleteData";
    var listDataCountUrl = "rest/admin/user/listDataCount";
    var listDataUrl = "rest/admin/user/listData";

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
      /*   $("#modalDiv").load(
            insertUrl, 
            {
            },
            function(){
                togglePage('modal');
            });
 */  
 alert('1');
    document.forms[0].action=viewUrl;
   
    document.forms[0].submit();
 
    });
    


    //查看事件
    $("#list-data > tbody a.edit").click(function() {
    	alert('1');
      var xtgsId =  $(this).attr("data-id");
      $("#searchForm input[name='xtgsId']").val(xtgsId);
      document.forms[0].action=viewUrl;  
      document.forms[0].submit();
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