    
    <?php
	
	if(!empty($results)){
		foreach ($results  as $banner) {
			
			 ?>
    <section class="intro" style="background:url(<?php echo M_IMAGE.$banner['image']; ?>) no-repeat bottom center scroll;">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    
                    <div class="slider-caption slider-caption-center animated fadeInUpBig">
									<?php if ($banner['link']) { ?>
                                    <a href="<?php echo $banner['link']; ?>"><h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<?php echo html_entity_decode($banner['description']); ?> </a>
									<?php }else { ?>
                                    <h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<?php echo html_entity_decode($banner['description']); ?>
									<?php } ?>
<?php if ($banner['link']) { ?>                                    
<a href="<?php echo $banner['link']; ?>" class="collection-btn fadeInUp hvr-fade">EXPLORE COLLECTION</a>
<?php } ?>
<div class="clear"></div>
                                   <a href="#product" class="product-btn animated fadeInUpBig"><img src="catalog/view/theme/default/img/Scroll_icon.png" class="" alt=""/></a>
								</div>
            
                </div>
            </div>
        </div>
    </section>
    <?php 
		} // end of for loop
	} // end of if
	?>