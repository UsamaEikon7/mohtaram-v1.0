<div class="footer-top">
<div class="container-fluid">
        	<div class="col-md-12 col-sm-12 logo-block">
          
             <img src="catalog/view/theme/default/img/blocklogo.png" />
            
            </div>
            </div>

</div>

<div class="footer-bg">
    	
        <div class="container-fluid">
        	
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel border-right">
                    	
                        <h5>Visit us</h5>
                        
                        <p>Office # 10, 2nd Floor, <br />
16-A Royal Inn Plaza, F-8 Markaz</p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->
                
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel border-right">
                    	
                        <h5>Email us</h5>
                        
                        <p><a href="mailto:info@mohtaram.co">info@mohtaram.co</a><br />
<a href="mailto:appointment@mohtaram.co">appointment@mohtaram.com</a></p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->
                
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel">
                    	
                        <h5>Customer care</h5>
                        
                        <p> <a href="<?php echo HTTP_SERVER ?>index.php?route=information/sizeguide">Size Guide</a> <br />
							<a href="<?php echo HTTP_SERVER ?>index.php?route=information/contact">Feedback</a>
                            </p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->        
        	
            <div class="clearfix"></div>
        </div><!--container-->
        
        <div class="copyrights">
        	
            <ul class="pull-left">
            	<li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/contact">Customer Care</a></li>            
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=4">Corporate</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=3">Privacy</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=5">Terms and Condition</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/sitemap">Sitemap</a></li>
                <!--<li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/career">Careers</a></li> -->
                </ul>
                
                
            	
                
                <div id="gotoTop" class="pull-right"><a href="#" class="animated hvr-bob"><img src="catalog/view/theme/default/img/top-icon.png" alt=""/></a></div>
                <ul class="pull-right social-networkf social-circlef">
                        <li><a href="https://www.instagram.com/mohtaramco/" class="icoInstagram" title="Follow us on Instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="https://www.facebook.com/mohtaramco" class="icoFacebook" title="Follow us on Facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/mohtaramco" class="icoTwitter" title="Follow us on Twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.pinterest.com/mohtaramco/" class="icoPinterest" title="Follow us on Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                        <!--<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li> -->
                    </ul>
                <div class="clear"></div>
        </div><!--copyrights-->
    	
            
    </div><!--footer bg-->
    
<?php if (!empty($modules)) { ?>

  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
<?php } ?>

			<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
	
			<?php 
if ($hideadl==0) {
$_SESSION['advurl']="http" . (($_SERVER['SERVER_PORT']==443) ? "s://" : "://") . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

echo $customcss;


			}	?>
<?php if ($hideadl==1) { ?>

<?php $zone_id=0; if ((isset($_SESSION['fieldrequired'])) && (count($_SESSION['fieldrequired'])>=1)) { ?>





<link href="catalog/view/javascript/jquery/fancybox/bootstrap-combined.min.css" rel="stylesheet">

<script src="catalog/view/javascript/jquery/fancybox/bootstrafp.min.js"></script>
<div id="thanks"><a id="subscribepopup" href="#form-content"  style="display:none"></a></div>
	<!-- model content -->	
	
	<div id="form-contentb" class="modal fade in" data-keyboard="false" data-backdrop="static" style="bottom: auto !important; display: none; ">
	        <div class="modal-header">
	              
	              <b><?php echo $popupheading; ?></b>
	              
	        </div>
		<div>
		<form id="address_field" class="contact">
			
			<fieldset>
			<div id="thanks2"></div>
		         <div class="modal-body">
		        	 <ul class="nav nav-list">
					 <?php foreach ($_SESSION['fieldrequired'] as $field) { ?>
					  <?php if ($field=='firstname') { ?>
				<li class="nav-header">*<?php echo $entry_firstname; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
                
                 <?php if ($field=='lastname') { ?>
				<li class="nav-header">*<?php echo $entry_lastname; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
					  <?php if ($field=='fax') { ?>
				<li class="nav-header"><?php echo $entry_fax; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
						  <?php if ($field=='telephone') { ?>
				<li class="nav-header">*<?php echo $entry_telephone; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
						  <?php if ($field=='company') { ?>
				<li class="nav-header"><?php echo $entry_company; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
				
				
				
				
						  <?php if ($field=='postcode') { ?>
				<li class="nav-header"><?php echo $entry_postcode; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				
				<?php if ($error_postcode) { ?>
            <span id="postcode-required" class="error"><?php echo $error_postcode; ?></span>
            <?php } ?>
			<?php } ?>
				
						  <?php if ($field=='city') { ?>
				<li class="nav-header">*<?php echo $entry_city; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
					 
					  <?php if ($field=='address_1') { ?>
				<li class="nav-header">*<?php echo $entry_address_1; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
				
				 <?php if ($field=='address_2') { ?>
				 
				<li class="nav-header"><?php echo $entry_address_2; ?></li>
				<li><input class="input-xlarge" value="" type="text" name="<?php echo $field; ?>" id="<?php echo $field; ?>"></li>
				<?php } ?>
					 
					 <?php if ($field=='country_id') { ?>
					 <?php $usecountry='1'; ?>
					 <li class="nav-header">*<?php echo $entry_country; ?></li>
					 <li>
					 <select name="country_id" id="country_id" >
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
             
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
             
            </select>
            <?php if ($error_country) { ?>
            <span id ="country-required"  class="error"><?php echo $error_country; ?></span>
            <?php } ?>					
					 </li>
					  <?php } ?>  <?php if ($field=='zone_id') { ?>
					 
					 
					 <li class="nav-header">*<?php echo $entry_zone; ?></li>
					 <li>
					<select name="zone_id" id="zone_id">
            </select>
            <?php if ($error_zone) { ?>
            <span id ="zone-required" class="error"><?php echo $error_zone; ?></span>
            <?php } ?>
					 </li>
					 <?php } ?> 
					
				
				
				<?php } ?>
				 

				</ul> 
		        </div>
			</fieldset>
			</form>
		</div>
	     <div class="modal-footer">
	         <button class="btn btn-success" id="submit">submit</button>
	        
  		</div>
	</div>

    <script>
 $(function() {
//twitter bootstrap script
	$("button#submit").click(function(){
	        $.ajax({
    		type: "POST",
		url: "index.php?route=module/advancedlogin/address",
		data: $("#address_field").serialize(),
	
        	success: function(msg){
			  $('#thanks2').before('<div class="alert ' + msg.type + '">' + msg.message + '</div>');
 	                
 		       	$("."+msg.type).delay(5000).slideUp(400, function(){if($(this).hasClass('alert-success')){ $("#form-contentb").hide();	}});
 		        },
		error: function(){
			alert("failure");
			}
      		});
	});
});
</script>
<script type="text/javascript">jQuery(document).ready(function() {

    setTimeout( function() {$("#subscribepopup").trigger('click'); $( "#form-contentb" ).show(); },0);
	
   }
   );  
   </script>
   	<?php if ($usecountry=='1') { ?>
   <script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			
			} else {
				$('#postcode-required').hide();
			
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
			$('#country-required').show();
			
			$('#zone-required').show();
			
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
						$('#zone-required').hide();
						
	    			}
					
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
					
					
						
				}
			} else {
			
				$('#zone-required').show();
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
		
			$('select[name=\'zone_id\']').html(html);
			
		
			$('#country-required').hide();
			$('#zone-required').hide();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
  <?php } ?> 
   <?php } ?>
      <?php } ?>
			
			
</body>

<!-- External JavaScripts
	============================================= -->
    <script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
   <!--	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/plugins.js"></script>-->

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/functions.js"></script>
	
	<script>
	$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        $('html, body').animate({
          scrollTop: target.offset().top;
          return false;
      }
    }
  });
});
	</script>
<script src="catalog/view/theme/default/js/grayscale.js"></script>

</html>
