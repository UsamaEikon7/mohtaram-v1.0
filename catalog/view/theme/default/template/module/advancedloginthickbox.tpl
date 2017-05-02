<?php if ($hideadl == 0) { ?>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/fancybox/jquery.fancybox.css" media="screen" />
<style type="text/css">
.fancybox-outer {
    background: none repeat scroll 0 0 #fff !important; }
</style>
<div style="display:none">
  <div id="loginpopupt_form">
    <div class="advancedlogin">
      <div align="center">
        <div class="container padding-all">
          <div class="row">
            <div class="col-md-8 col-sm-8">
              <?php if ($localenable==1) { ?>
              <!--<p ALIGN="CENTER"><?php echo $logmessgetop; ?></p>
              <p ALIGN="CENTER"><?php echo $logheading; ?></p>-->
              <!--<br />-->
              <form id="module_logintk" class="col-md-8 col-sm-8">
                <input type="text" id="email" name="email" placeholder="<?php echo $entry_email_address; ?>"/>
                <br />
                <input type="password" id="password" name="password" placeholder="<?php echo $entry_password; ?>"/>
                <input type="hidden" name="fancybox"  id="fancybox" value="">
                <br />
                <div class="register-buttons">
                  <input type="button"  value="REGISTER" name="register-btn" class="btn btn-white register-btn-left" onclick="register()"/>
                  <input type="button" value="SIGN IN" name="signin-btn" class="btn send-btn register-btn-right" onclick="login()" />
                
                <a href="<?php echo $forgotten; ?>" class="button"><?php echo $button_forgotten; ?></a>
              </form>
              <?php } ?>

            <?php if ($fbenable==1 || $genable==1) { ?>
              <?php if ($fbenable==1) { ?>
              <a class="btn btn-block btn-social btn-facebook" href="<?php echo $advancedlogin_url; ?>"> <span class="fa fa-facebook"></span> CONTINUE WITH FACEBOOK </a>
              <?php } ?>
              <?php if ($genable==1) { ?>
              <a href="<?php echo $advancedlogin_furl; ?>" class="btn btn-block btn-social btn-google"> <span class="fa fa-google"></span> CONTINUE WITH GOOGLE </a>
              <?php } ?>
              <!--<a class="btn btn-block btn-social btn-envelope">
    <span class="fa fa-envelope"></span> CONTINUE WITH MAIL
  </a>--> </div>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  $('#module_logintk input').keydown(function(e) {
	  if (e.keyCode == 13) {
		  $('#module_logintk').submit();
	  }
  });
  //--></script> 
<script type="text/javascript">

$('.loginpopupt').fancybox({  'padding' : 0,  'scrolling'        : 'no',   'titleShow'        : false,   });



</script> 
<script language="javascript">
function login(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/advancedlogin/login',
			dataType: 'json',
            data:$("#module_logintk").serialize(),
			
			success: function(data){
				
			 	 $('#module_logintk').before('<div class="' + data.type + '">' + data.message + '</div>');
        $('div.' + data.type).delay(2000).slideUp(200, function(){if($(this).hasClass('success')){
		$.fancybox.close();
		<?php if ($redirect_advurl==1): ?>	
				window.location = '<?php echo $advurl; ?>';
				<?php else : ?>
					window.location = 'index.php?route=account/account';
				<?php endif; ?>
		}$(this).remove();});
				
				
				}});
 		        }
</script> 
<script language="javascript">
function register(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/advancedlogin/register',
			dataType: 'json',
            data:$("#module_logintk").serialize(),
			
			success: function(data){
				
			 	 $('#module_logintk').before('<div class="' + data.type + '">' + data.message + '</div>');
        $('div.' + data.type).delay(2000).slideUp(200, function(){if($(this).hasClass('success')){
		login();
		}$(this).remove();});
				
				
				}});
 		        }
</script>
<?php } ?>
