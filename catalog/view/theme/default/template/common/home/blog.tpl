  <section class="welcome-bg">
    <?php 
    // banner 1
	if(!empty($banner1)){
		foreach ($banner1  as $banner) { ?>
    	<div class="col-md-6 col-sm-12 padding0">
        	
          <div class="about-content">
            	
               <div class="about-bg" style="background: url(<?php echo M_IMAGE.$banner['image']; ?>) top center no-repeat;
background-size: cover;"></div><!--about bg-->
            	
                <div class="about-body">
                	
                    <h4><?php echo html_entity_decode($banner['title']);  ?></h4>
                    
                    <?php echo html_entity_decode($banner['description']);  ?>

<a href="<?php echo $banner['link']; ?>" class="readmore-btn hvr-fade">Visit Us</a>
                
                </div><!--about body-->	
                
                <div class="clearfix"></div>
            </div><!--about content-->
            <div class="clearfix"></div>
        </div><!--col md sm 6-->
        <?php }
	}?>
        
<?php // banner 2,3 ?>
        <div class="col-md-6 col-sm-12 padding0">
        <?php if(!empty($banner2)){
		foreach ($banner2  as $banner) { ?>
          <div class="collection-content">
            	
               <div class="collection-bg" style="background: url(<?php echo M_IMAGE.$banner['image']; ?>); background-position: center center;"></div><!--about bg-->
            	
                <div class="collection-body text-center">
                	
                    <h4><?php echo html_entity_decode($banner['title']);  ?></h4>
                    
                    <h2><?php echo html_entity_decode($banner['description']);  ?></h2>
                    
<a href="<?php echo $banner['link'];  ?>" class="readmore-btn hvr-fade">Take a look</a>
                
                </div><!--about body-->	
                
                <div class="clearfix"></div>
            </div><!--about content-->
            <?php }
		}?>
            
            
            
            
            
          <div class="collection-content">
    <?php if(!empty($banner3)){
		foreach ($banner3  as $banner) { ?>
              <!-- <a href="<?php echo $banner['link'];  ?>" title="<?php echo html_entity_decode($banner['title']);  ?>"> -->
               <div class="product-week-bg" style="background: linear-gradient(
                     rgba(20,20,20, .5), 
                     rgba(20,20,20, .5)),url(<?php echo M_IMAGE.$banner['image']; ?>); background-position: center center;">
               		
                    <h2><?php echo html_entity_decode($banner['title']);  ?></h2>
                    <a href="<?php echo $banner['link'];  ?>" class="readmore-btn hvr-fade clr-brdr-white" style="">Join the Club</a>
                
               </div><!--about bg-->
              <!-- </a> -->
               <?php } 
			   } ?>
            	
    <?php if(!empty($banner4)){
		foreach ($banner4  as $banner) { ?> 
              <!-- <a href="<?php echo $banner['link'];  ?>" title="<?php echo html_entity_decode($banner['title']);  ?>"> -->
               <div class="frame-life-bg" style="background: linear-gradient(
                     rgba(20,20,20, .5), 
                     rgba(20,20,20, .5)),url(<?php echo M_IMAGE.$banner['image']; ?>); background-position: center center;">
               	
                	<h2><?php echo html_entity_decode($banner['title']);  ?></h2>
                    <a href="<?php echo $banner['link'];  ?>" class="readmore-btn hvr-fade">Read more</a> 
               
               </div><!--about bg-->
               <!--</a> -->
                <?php } 
	}?>
                <div class="clearfix"></div>
            </div><!--about content-->
            
            <div class="clearfix"></div>
        </div><!--col md sm 6-->
    	
        <div class="clearfix"></div>
    </section><!--about section-->
    