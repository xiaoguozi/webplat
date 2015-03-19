/*!
 * jQuery BtkTable Library
 * @author skyswpan
 */
!function ($) {

$.fn.BtkTable =function(options) {
    var opts = $.extend({}, $.fn.BtkTable.defaults, options);
    var table = function(element){

        var $this = $(element);
        //设置checkbox
/*        $this.find("thead > tr > th :checkbox").click(function(event) {
            if($(this).prop("checked")){
                $this.find("tbody > tr > td :checkbox").prop("checked",true);
            }else{
                $this.find("tbody > tr > td :checkbox").prop("checked",false); 
            }
        });*/
        //设置题头排序
        $this.find("thead > tr > th:gt(0)").click(function(event) {
            event.preventDefault();
            var type = $(this).attr("sortType");
            $this.find("thead > tr > th > span").removeClass("glyphicon-sort-by-attributes glyphicon-sort-by-attributes-alt");
            if("DESC" == type){
                $(this).attr("sortType","ASC").find("> span").addClass("glyphicon-sort-by-attributes");
            }else{
                $(this).attr("sortType","DESC").find("> span").addClass("glyphicon-sort-by-attributes-alt");
            }
            //调用回调函数
            typeof opts.thSort == 'function' && opts.thSort.call(this);
        });

        //设置checkbox样式，依赖icheck.js
       $this.find('label.radio-inline input:radio, label.checkbox-inline input:checkbox').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            }).on('ifChecked', function(event){
                $this.find("tbody > tr > td :checkbox:not(:disabled)").iCheck('check');
            }).on('ifUnchecked', function(event){
                $this.find("tbody > tr > td :checkbox:not(:disabled)").iCheck('uncheck');
            });

    };

    return this.each(function() {
        table($(this));
    });
};

$.fn.BtkTable.defaults = {
    thSort:null
};

}(window.jQuery);
