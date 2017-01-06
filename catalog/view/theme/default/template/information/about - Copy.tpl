<?php echo $header; ?>
 <section>
    	
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol>
		
        <section class="about-section">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-5 col-sm-6 pull-left">
                
                	<h2><?php echo $heading_title; ?></h2>
                    <div class="spece"></div>
                    <?php echo $description; ?>

                    <a href="<?php echo $continue; ?>" class="readmore-btn hvr-bounce-to-left">VIEW OUR STORY</a>
                    
                    <div class="spece"></div><div class="spece"></div><div class="spece"></div>
                    <p>Other pages of interests:<br />
                    <a href="#">Careers</a><br />
                    <a href="#">Help</a><br />
                    <a href="#">Legal Informations</a>
                    </p>
                
                </div><!--our story-->
                
                <div class="col-md-6 col-sm-6 position pull-right">
                	
                	<div class="big-image"><img src="image/catalog/goingglobal1.jpg" alt=""/></div><!--big image-->
                    
                    <div class="video-box"><img src="image/catalog/goingglobal2.jpg" alt=""/><a href="#" class="play-icon"><img src="img/play-icon.png" alt=""/></a></div><!--video-box-->
                    
                    <div class="small-image"><img src="image/catalog/goingglobal3.jpg" alt=""/></div><!--small image-->

              </div><!--col md sm 6-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section><!--story-section-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->
    


<?php echo $footer; ?>