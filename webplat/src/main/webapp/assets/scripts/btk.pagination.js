/*!
 * jQuery BtkPagination Library
 * @author skyswpan
 */
!function ($) {

$.fn.BtkPagination =function(options) {
    var opts = $.extend({}, $.fn.BtkPagination.defaults, options);
    var currentPageNo = 1;
    var pagination = function(element){
        var $this = $(element);
        //构造分页
        var totalPageNo = Math.ceil(opts.totalCount/opts.pageSize);
        var displayPageCount = totalPageNo<opts.displayPage?totalPageNo:opts.displayPage;
        var pageListHtml = "";
        if(displayPageCount > 0){
            pageListHtml = opts.pagelinkfirst + opts.pagelinkpre;
            var pageHtml = "";
            for (var i = 1; i <= displayPageCount; i++) {
                pageHtml = opts.pagelinktemplate.replace(new RegExp("#pageNo#", "gm"), i);
                pageListHtml += pageHtml;
            }
            pageListHtml += opts.pagelinkpost + opts.pagelinklast;
        }

        if(opts.showMode == 'simple'){
            opts.paginationtemplate = '<ul class="pagination pull-left">#pageListHtml#</ul>'
                +'<span class="pagination-span pull-right"> 共 #totalCount#条 · #totalPageNo#页</span>';
        }
        
        var paginationHtml = opts.paginationtemplate.replace(new RegExp("#pageListHtml#", "gm"), pageListHtml)
                .replace(new RegExp("#pageSize#", "gm"), opts.pageSize)
                .replace(new RegExp("#totalCount#", "gm"), opts.totalCount)
                .replace(new RegExp("#totalPageNo#", "gm"), totalPageNo);
        $this.html(paginationHtml);

        //默认加载第一页数据，如果只有一页，则下一页设置disabled
        if(currentPageNo==totalPageNo){
            $this.find("li.postPage").addClass("disabled");
        }

        //绑定分页链接事件
        $this.find("a.pageNo").click(function(event) {
            event.preventDefault();
            currentPageNo = Number($(this).attr('pageNo'));

            //调用回调函数
            typeof opts.loadPaginationData == 'function' && opts.loadPaginationData.call(this,currentPageNo,opts.pageSize);

            $this.find("li").removeClass("active");
            $(this).parent().addClass("active");

            //设置上一页下一页样式
            if(1==currentPageNo){
                $this.find("li.prePage").addClass("disabled");
                $this.find("li.firstPage").addClass("disabled");
            }else{
                $this.find("li.prePage").removeClass("disabled");
                $this.find("li.firstPage").removeClass("disabled");
            }
            if(totalPageNo == currentPageNo){
                $this.find("li.postPage").addClass("disabled");
                $this.find("li.lastPage").addClass("disabled");
            }else{
                $this.find("li.postPage").removeClass("disabled");
                $this.find("li.lastPage").removeClass("disabled");
            }

            //设置页面跳转数字
            $this.find("input[name=pageNo]").val(currentPageNo);

            return false;
        });

        //设置上一页下一页事件、样式
        $this.find("li.prePage").click(function(event) {
            event.preventDefault();
            var firstPageNo = Number($this.find("a.pageNo:first").attr("pageNo"));
            if(firstPageNo<currentPageNo){
                currentPageNo = currentPageNo-1;
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }else if(firstPageNo>1){
                $this.find("a[pageNo]").each(function(){
                    var pageNo = Number($(this).attr("pageNo"));
                    $(this).attr("pageNo",pageNo-1).html(pageNo-1);
                });
                currentPageNo = currentPageNo-1;
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }else{
                $(this).addClass("disabled");
            }
            return false;
        });
        $this.find("li.postPage").click(function(event) {
            event.preventDefault();
            var lastPageNo = Number($this.find("a.pageNo:last").attr("pageNo"));
            if(lastPageNo>currentPageNo){
                currentPageNo = currentPageNo+1;
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }else if(lastPageNo<totalPageNo){
                $this.find("a[pageNo]").each(function(){
                    var pageNo = Number($(this).attr("pageNo"));
                    $(this).attr("pageNo",pageNo+1).html(pageNo+1);
                });
                currentPageNo = currentPageNo+1;
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }else{
                $(this).addClass("disabled");
            }
            return false;
        });
        //设置首页 末页 事件、样式
        $this.find("li.firstPage").click(function(event) {
            event.preventDefault();
            currentPageNo = 1;
            var diffPageNo = Number($this.find("a.pageNo:first").attr("pageNo"))-currentPageNo;
            
            $this.find("a[pageNo]").each(function(){
                var pageNo = Number($(this).attr("pageNo"));
                $(this).attr("pageNo",pageNo-diffPageNo).html(pageNo-diffPageNo);
            });
            $this.find("a[pageNo="+currentPageNo+"]").click();
            return false;
        });
        $this.find("li.lastPage").click(function(event) {
            event.preventDefault();
            currentPageNo = totalPageNo;
            var diffPageNo = currentPageNo - Number($this.find("a.pageNo:last").attr("pageNo"));
            
            $this.find("a[pageNo]").each(function(){
                var pageNo = Number($(this).attr("pageNo"));
                $(this).attr("pageNo",pageNo+diffPageNo).html(pageNo+diffPageNo);
            });
            $this.find("a[pageNo="+currentPageNo+"]").click();
            return false;
        });

        //设置页数刷新功能
        $this.find("span.refreshBtn").click(function(event) {
            event.preventDefault();
            $input = $this.find("input[name=pageSize]");
            refreshPageSize = $input.val();
            //只能输入正整数
            var re = /^[1-9]+[0-9]*]*$/;
            if (!re.test(refreshPageSize) || refreshPageSize>999)
            {
                alert("输入页面条数必须 1 ~ 999 范围内的整数！");
                $input.val(opts.pageSize);
                $input.focus();
            }else{
                opts.pageSize = refreshPageSize;
                typeof opts.loadData == 'function' && opts.loadData.call(this, opts.pageSize);
            }
            
            return false;
        });

        //设置页数跳转功能
        $this.find("span.jumpBtn").click(function(event) {
            event.preventDefault();
            $input = $this.find("input[name=pageNo]");
            jumpPageNo = $input.val();
            //只能输入正整数
            var re = /^[1-9]+[0-9]*]*$/;
            if (!re.test(jumpPageNo) || jumpPageNo>totalPageNo)
            {
                alert("输入页码必须为 1 ~ "+totalPageNo+" 范围内的整数！");
                $input.val(currentPageNo);
                $input.focus();
            }else if(jumpPageNo == currentPageNo){
                return false;
            }else {
                var firstPageNo = Number($this.find("a.pageNo:first").attr("pageNo"));
                var lastPageNo = Number($this.find("a.pageNo:last").attr("pageNo"));
               /* if(lastPageNo>=jumpPageNo && firstPageNo<=jumpPageNo){
                }else */
                if(lastPageNo<jumpPageNo){
                    var jump = jumpPageNo - lastPageNo;
                    $this.find("a[pageNo]").each(function(){
                        var pageNo = Number($(this).attr("pageNo"));
                        $(this).attr("pageNo",pageNo+jump).html(pageNo+jump);
                    });
                }else if(firstPageNo>jumpPageNo){
                    var jump = firstPageNo - jumpPageNo;
                    $this.find("a[pageNo]").each(function(){
                        var pageNo = Number($(this).attr("pageNo"));
                        $(this).attr("pageNo",pageNo-jump).html(pageNo-jump);
                    });
                }
                currentPageNo = jumpPageNo;
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }
            
            return false;
        });


        //加载当前页数据
        if(opts.defaultLoad){
            if(displayPageCount > 0){
                $this.find("a[pageNo="+currentPageNo+"]").click();
            }else{
                typeof opts.loadPaginationData == 'function' && opts.loadPaginationData.call(this,0,opts.pageSize);            
            }
        }
       
    };

    return this.each(function() {
        pagination($(this));
    });
};

$.fn.BtkPagination.defaults = {
    pageSize:20,
    displayPage:5,
    totalCount: 0,
    loadPaginationData: null,
    loadData: null,
    defaultLoad: true,
    showMode: "full",
    paginationtemplate: '<ul class="pagination pull-left">#pageListHtml#</ul>'
        +'<span class="pagination-span pull-right"> 条·共 #totalCount# 条·共 #totalPageNo# 页</span>'
        +'<div class="pagination-field input-group pull-right">'
        +'<input type="number" name="pageSize" class="form-control" value="#pageSize#"/>'
        +'<span class="input-group-addon pagination-btn refreshBtn" title="刷新">'
        +'<span class="glyphicon glyphicon-refresh"></span></span></div>'
        +'<span class="pagination-span pull-right">页·每页 </span>'
        +'<div class="pagination-field input-group pull-right">'
        +'<input type="text" name="pageNo" class="form-control" value="1"/>'
        +'<span class="input-group-addon pagination-btn jumpBtn" title="跳至">'
        +'<span class="glyphicon glyphicon-step-forward"></span></span></div>'
        +'<span class="pagination-span pull-right">跳至 </span>',
    pagelinkfirst : '<li class="firstPage" title="首页"><a href="#" ><span class="glyphicon glyphicon-fast-backward"></span></a></li>',
    pagelinklast : '<li class="lastPage" title="末页"><a href="#" ><span class="glyphicon glyphicon-fast-forward"></span></a></li>',
    pagelinkpre : '<li class="prePage" title="上一页"><a href="#" ><span class="glyphicon glyphicon-backward"></span></a></li>',
    pagelinktemplate : '<li  title="第#pageNo#页"><a href="#" class="pageNo" pageNo="#pageNo#">#pageNo#</a></li>',
    pagelinkpost : '<li class="postPage" title="下一页"><a href="#" ><span class="glyphicon glyphicon-forward"></span></a></li>'
};


}(window.jQuery);
