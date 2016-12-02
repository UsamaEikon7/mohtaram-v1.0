    
    <?php
	
	if(!empty($results)){
		foreach ($results  as $banner) {
		?>
    	        <section class="career-slide header-slide" style="background:url(<?php echo M_IMAGE.$banner['image']; ?>);">

<div class="slider-caption slider-caption-center animated fadeInUpBig">
									<?php if ($banner['link']) { ?>
                                    <a href="<?php echo $banner['link']; ?>"><h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<?php echo html_entity_decode($banner['description']);  ?> </a>
<?php }else { ?>
                                    <h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<?php echo html_entity_decode($banner['description']);  ?>
									<?php } ?>
<a href="#" class="collection-btn fadeInUp hvr-fade">JOB OPENINGS</a>
<div class="clear"></div>
                                   
								</div>
                                <div class="text-center">
                                <a href="#product" class="product-btn career-btn animated fadeInUpBig"><img src="catalog/view/theme/default/img/Scroll_icon.png" class="" alt=""/></a>
			</div>

		</section><!--slider-->
    <?php 
		} // end of for loop
	} // end of if
	?>
    <section class="about-section">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-6 col-sm-6 pull-left">
                
                	<h2>Jessica’s succes story</h2>
                    <div class="spece"></div>
                    <p>We’ll take care of the sizing. You choose from more than 20 fabrics industry. She
has been the industry's standard dummy text ever since the 1500s, when an 
printer took a galley.
<br /><br />
Will uncover many web sites still in their infancy. Various versions have evolveda
the years, sometimes by accident, sometimes on purpose.</p>

<a href="#" class="readmore-btn hvr-bounce-to-left">VIEW HER STORY</a>


                
                </div><!--our story-->
                
                <div class="col-md-5 col-sm-5 pull-right">
                	
                	<img src="catalog/view/theme/default/img/careers-girl.jpg" width="100%" alt=""/> 
                
                </div><!--col md sm 6-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section><!--story-section-->
    
    <section class="light-bg">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-6 col-sm-6 col-md-offset-3 text-center">
                
                	<h2>Opened positions</h2>
                    <div class="spece"></div><div class="spece"></div>
                    <p>We’ll take care of the sizing. You choose from more than 20 fabrics
industry. Lorem Ipsum has been the industry's standard dummy text 
ever since the 1500s, when an unknown printer took a galley.</p>

                
                </div><!--our story-->
               
                
              <div class="clear"></div>
            </div><!--row-->
        <div class="spece"></div><div class="spece"></div>
        </div><!--container-->
        
    </section><!--light-section-->	 
