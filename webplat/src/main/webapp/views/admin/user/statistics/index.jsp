<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="row" >
    <div class="col-md-12">

<div id="listDiv">
<!-- BEGIN PAGE HEADER-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <h3 class="page-title" id="index-page-title">用户管理</h3>
        
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->

<div class="row">
    <div class="col-md-12">
        <form id="searchForm" class="form-inline" role="form">
            
        	<div class="btn-group" >
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			   <span class="pzzt" style="width:50px">注册来源</span><span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="" title="注册来源" value="">--全部--</a></li>
			    <li><a href="#" title="PC端" value="0">PC端</a></li>
			    <li><a href="#" title="手机端" value="1">手机端</a></li>
			    <li><a href="#" title="微信推荐" value="5">微信推荐</a></li>
			    <li><a href="#" title="链接推荐"  value="6">链接推荐</a></li>
			    <li><a href="#" title="线下推广" value="7">线下推广</a></li>	
			    <li><a href="#" title="高铁一等座" value="10">高铁一等座</a></li>	
			    <li><a href="#" title="高铁二等座" value="11">高铁二等座</a></li>				   
			  </ul>				 
			</div>
			&nbsp;
			<input id="d12" onFocus="WdatePicker({el:'d12', onpicked:function(){search();},oncleared:function(){search();}})" size="10" type="text" name="user.createDateString" class="form-control" placeholder="注册日期" style="width:150px;"/>
			<img onclick="WdatePicker({el:'d12', onpicked:function(){search();},oncleared:function(){search();}})" src="assets/img/ui2/cal_pick.png" align="middle"  style="cursor:pointer; margin-left:-9px;">
        	<div class="form-group">
                <input type="text" class="form-control" size="11"  name="user.rmobileNo" placeholder="推荐人手机号" value=""  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" >
                <input type="hidden" name="sortField" value="">
                <input type="hidden" name="sortType" value="">
                <input type="hidden" name="pageNo" value="">
                <input type="hidden" name="pageSize" value="15">
                <input type="hidden" id="userRegFrom" name="user.regFrom" value="">
            </div>&nbsp;&nbsp;
            <button type="submit" id="searchBtn" class="btn btn-info ladda-button" data-style="expand-right"><span class="glyphicon glyphicon-search"></span> 搜索</button>
        	&nbsp;
        	<span style="font-size:14px;">注册人数：<span id="totalCount"></span>人</span>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
                <div class="table-scroll table-scrollable">
            <table id="list-data" class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>
                        <th field="id">id <span class="glyphicon"></span></th>
                        <th field="username">用户名 <span class="glyphicon"></span></th>
                        <th >姓名</th>
                        <th field="createTime">注册时间 <span class="glyphicon"></span></th>
                        <th field="regFrom">注册来源 </th>
                        <th >推荐人手机号</th>
                        <th >推荐人姓名</th>
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

<script type="text/javascript" src="assets/widget/My97DatePicker/WdatePicker.js"></script> 

<script type="text/javascript">

var IndexPage = {};

function search(){
	$("#searchBtn").click();
}

$(function(){
    var listDataCountUrl = "rest/admin/user/statistics/listDataCount";
    var listDataUrl = "rest/admin/user/statistics/listData";

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
    
    $(".form_datetime").datetimepicker({
    	minView: "month", 
		format: "yyyy-mm-dd",
		language: 'zh-CN',
		autoclose:true
	});
    
    
    //查询条件
    $(".dropdown-menu a").click(function(event) {
        event.preventDefault();
        $("#userRegFrom").val($(this).attr("value"));
        loadList();      
       $(".pzzt").html($(this).attr("title"))
       $(".btn-group").removeClass("open");              
        return false;
    });
   

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
                	$("#totalCount").text(data.total+"");
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