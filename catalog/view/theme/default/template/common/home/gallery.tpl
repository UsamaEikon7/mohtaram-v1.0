<?php 


if(!empty($v_gallery)){
	
		?>
 <section class="gallery">
    	 <?php foreach ($v_gallery  as $banner) {
			// echo "<pre>";print_r($banner); exit; ?>
        <div class="col-md-3 col-sm-3 padding0">
        	<?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link'];?>" ><img src="<?php echo M_IMAGE.$banner['image']; ?>" width="100%" alt="<?php echo $banner['title']; ?>" /> </a>
            
            <?php }else { ?>
            <img src="<?php echo M_IMAGE.$banner['image']; ?>" width="100%" alt="<?php echo $banner['title']; ?>" />
            <?php } ?>
        </div><!--col md sm 3-->
        <?php } ?>
        <div class="clear"></div>
    </section><!--Gallery-section-->
    <?php } ?>