
    <section id="product"> 
	<?php
	// start of banner 10
	if(!empty($v_section_2_a))  {	
		foreach ($v_section_2_a  as $banner) {
			
?>
        <div class="col-md-8 col-sm-8 padding0 grow">
        	
            <div class="hover03 column">
		<div>
        
			<figure>
            	<?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>" title="<?php echo $banner['title']; ?>">
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                </a>
                <?php }else{ ?>
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                <?php } ?>
            </figure>
            
		</div>
	</div>
            
        </div><!--col md sm 8-->
        <?php }
		} // end of banner 10
	?>
    	<?php
	// start of banner 11
	if(!empty($v_section_2_b))  {	
		foreach ($v_section_2_b  as $banner) {
			
?>
        
        <div class="col-md-4 col-sm-4 padding0">
        	
            <div class="hover03 column img2">
		<div>
			<figure>
            	<?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>" title="<?php echo $banner['title']; ?>">
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                </a>
                <?php }else{ ?>
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                <?php } ?>
            </figure>
            
		</div>
	</div>
            
        </div><!--col md sm 4-->
               <?php }
		} // end of banner 11
	?>
        	<?php
	// start of banner 12	
	if(!empty($v_section_2_c))  {	
		foreach ($v_section_2_c  as $banner) {
			
?>
        <div class="col-md-4 col-sm-4 padding0">
        	
            <div class="hover03 column img3">
		<div>
			<figure>
            	<?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>" title="<?php echo $banner['title']; ?>">
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                </a>
                <?php }else{ ?>
                <img src="<?php echo M_IMAGE.$banner['image']; ?>" class="img1" width="100%" alt="<?php echo $banner['title']; ?>" />
            	<div class="overlay"><h2><?php echo html_entity_decode($banner['title']); ?></h2></div>
                <?php } ?>
            </figure>
            
		</div>
	</div>
            
        </div><!--col md sm 4-->
        <?php } 
		}?>
        
        <div class="clearfix"></div>
    </section><!--appointment section-->
