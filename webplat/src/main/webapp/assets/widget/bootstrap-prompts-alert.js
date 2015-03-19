window._alert = window.alert;
window.alert = function(text,cb) {
    var bootStrapAlert = function() {
        if(! $.fn.modal.Constructor)
            return false;
        if($('#windowAlertModal').length == 1)
            return true;
        $('body').append(' \
			<div id="windowAlertModal" class="modal fade" data-width="500px" >\
				  <div class="modal-header">\
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\
					<h4 class="modal-title">提示</h4>\
				  </div>\
				  <div class="modal-body">\
					<p> alert text </p>\
				  </div>\
				  <div class="modal-footer">\
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>\
				  </div>\
			</div>\
    ');

      $('body').off('click', '#windowAlertModal .btn-primary');

      function ok() {
        if(typeof cb == 'function'){cb();}
      }

      $('body').on('click', '#windowAlertModal .btn-primary', ok);

        return true;
    }
    if ( bootStrapAlert() ){
        $('#windowAlertModal .modal-body p').html(text);
        $('#windowAlertModal').modal();
    }  else {
        console.log('bootstrap was not found');
        window._alert(text);
    }
}
window._confirm = window.confirm;
window.confirm = function(text, cb) {
    var initTemplate = function(){
      if($('#windowConfirmModal').length == 1)
        return true;
      $('body').append(' \
			<div id="windowConfirmModal" class="modal fade" data-width="500px">\
				  <div class="modal-header">\
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\
					<h4 class="modal-title">确认</h4>\
				  </div>\
				  <div class="modal-body">\
					<p> alert text </p>\
				  </div>\
				  <div class="modal-footer">\
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>\
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button> \
				  </div>\
			</div>\
      ');
    }

    var bootStrapConfirm = function() {
      if(! $.fn.modal.Constructor)
          return false;

      $('body').off('click', '#windowConfirmModal .btn-primary');
      $('body').off('click', '#windowConfirmModal .btn-default');

      function confirm() { cb(true); }
      function deny() { cb(false); }

      $('body').on('click', '#windowConfirmModal .btn-primary', confirm);
      $('body').on('click', '#windowConfirmModal .btn-default', deny);

      return true;
    }

    initTemplate()

    if ( bootStrapConfirm() ){
        $('#windowConfirmModal .modal-body p').html(text);
        $('#windowConfirmModal').modal();
    }  else {
        console.log('bootstrap was not found');
        cb(window._confirm(text));
    }
}