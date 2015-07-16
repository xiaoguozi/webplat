require.config({
    paths: {
        jquery: "../ui/jquery",
        bootstrap: "../../plugins/bootstrap/js/bootstrap.min"
    },
    shim: {
        bootstrap: {
            deps: ['jquery'],
            exports: 'bootstrap',
        }
    }
});
require(['jquery','bootstrap'], function($) {
  $('.close').click(function(){
  	$('.banner').fadeOut(500);
  });
  $('body').on("keyup","#ben_money",function(){
     var m_gg=$(".pei_money .m_gg");
     var val=$(this).val();
     $.each(m_gg,function(i){
        if (val/10000<1) {
        $(this).text(val*(i+1)+"元");
      }else{
        $(this).text(val/10000*(i+1)+"万元");
      }
     });
  });

  $('.m_gg').click(function(){
    $(this).addClass("select").siblings().removeClass("select");
  });
  $("#time").change(function(){
      var select_val=$(this).val();
      $('#select_val').text(select_val);
  });
});