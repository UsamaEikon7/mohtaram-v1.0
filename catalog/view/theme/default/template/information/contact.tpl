<?php echo $header; ?>
    
    
    <section id="maps" class="map">
					
			
							
		
	</section>
    
                
    <section class="about-section contactpage">
    	
      <div class="container text-center">
        	
            <div class="row">
            	
                	<div class="col-md-8 col-sm-8 col-md-offset-2 contact">
                    	
                        <h2>Feel free to contact us at your convenience
and we’ll be happy to get in touch with you. </h2>
						
                        <div class="spece"></div><div class="spece"></div>
                        
						<div class="col-md-8 col-sm-12 col-md-offset-2">
                        	
                            <p>We are here to help you look your best everyday. Start your Mohtaram journey today, contact us by filling out this form.</p>

<div class="spece"></div><div class="spece"></div>

							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        	<?php if ($error_name) { ?>
                              <div class="text-danger"><?php echo $error_name; ?></div>
                              <?php } ?> 
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control check-field" placeholder="Name (required)"  />
							 <?php if ($error_email) { ?>
                              <div class="text-danger"><?php echo $error_email; ?></div>
                              <?php } ?>                            
                            <input type="email" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control check-field" placeholder="Email (required)" />
                             <?php if ($error_subject) { ?>
                              <div class="text-danger"><?php echo $error_subject; ?></div>
                              <?php } ?> 
                            <input type="text" name="subject" value="<?php echo $subject; ?>" id="input-subject" class="form-control check-field" placeholder="Subject" />
                            <?php if ($error_enquiry) { ?>
                              <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                            <textarea class="form-control textarea" placeholder="Message" name="enquiry" id="input-enquiry"><?php echo $enquiry; ?></textarea>
                            
                            <input class="send-btn pull-left" type="submit" value="<?php echo $button_submit; ?>"/>
                            
                            <div class="clear"></div>
                            
                        </form>
                            
                        </div><!--col md sm 8-->
                        
                    </div><!--col md sm 8-->
                
                <div class="clear"></div>
                
 
            
            </div><!--row-->
        
        </div><!--container-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->

<?php echo $footer; ?>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDQddURYGdOEEVHJLwkN4r0A7JDGh0PaDU&sensor=true"></script>
<script type='text/javascript' src='catalog/view/theme/default/js/gmaps.js'></script>
<script type='text/javascript'>
		
			 map = new GMaps({
					el: '#maps',
					zoom: 14,
					 lat: 33.7201038,
					lng: 73.0715905,
					zoomControl : true,
					scrollwheel: false,
					zoomControlOpt: {
						style : 'SMALL',
						position: 'TOP_LEFT'
					},
					panControl : false,
					streetViewControl : false,
					mapTypeControl: false,
					overviewMapControl: false
				  });

			 map.addMarker({
				   lat: 33.7201038,
					lng: 73.0715905,
					title: 'Beverley Centre, Blue Area, Islamabad, Pakistan',
					icon: "image/catalog/marker.png"
				  });

			 countdown_init();
		</script>