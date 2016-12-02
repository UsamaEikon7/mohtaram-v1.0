<div class="panel panel-default check-boxstyle cartpanelheading">
  <div class="panel-title">
  	<h2 style="margin-top:0px;"><a href="#collapse-reward" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $heading_title; ?></a></h2>
  </div>
  <div id="collapse-reward" class="panel-collapse collapse">
    <div class="panel-body">
      	<input type="text" name="reward" value="<?php echo $reward; ?>" placeholder="<?php echo $entry_reward; ?>" id="input-reward" class="form-control check-field" />
        <input type="submit" value="<?php echo $button_reward; ?>" id="button-reward" data-loading-text="<?php echo $text_loading; ?>"  class="continue-btn" />
      
		<script type="text/javascript"><!--
$('#button-reward').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/total/reward/reward',
		type: 'post',
		data: 'reward=' + encodeURIComponent($('input[name=\'reward\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
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