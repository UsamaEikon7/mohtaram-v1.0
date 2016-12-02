<div class="panel panel-default check-boxstyle cartpanelheading">
  <div class="panel-heading">
  	<h2 class="panel-title"><a href="#collapse-voucher" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $heading_title; ?></a></h2>
  </div>
  <div id="collapse-voucher" class="panel-collapse collapse">
    <div class="panel-body">
      <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control check-field" />
      <input class="continue-btn" type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher" data-loading-text="<?php echo $text_loading; ?>" > 
      <script type="text/javascript"><!--
$('#button-voucher').on('click', function() {
  $.ajax({
    url: 'index.php?route=extension/total/voucher/voucher',
    type: 'post',
    data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-voucher').button('loading');
    },
    complete: function() {
      $('#button-voucher').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['error']) {
        $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('html, body').animate({ scrollTop: 0 }, 'slow');
      }

      if (json['redirect']) {
        location = json['redirect'];
      }
    }
  });
});
//--></script>
    </div>
  </div>
</div>
