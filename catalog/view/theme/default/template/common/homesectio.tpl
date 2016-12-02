    
    <?php
	
	if(!empty($results)){
		foreach ($results  as $banner) {
			// we have to echo only the banner image 101 as the rest are all for the other stuff
			if($banner['banner_image_id'] == 101) {
			 ?>
    <section class="intro" style="background:url(image/<?php echo $banner['image']; ?>) no-repeat bottom center scroll;">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    
                    <div class="slider-caption slider-caption-center animated fadeInUpBig">
									<?php if ($banner['link']) { ?>
                                    <a href="<?php echo $banner['link']; ?>"><h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<p class="animated fadeInUpBig" data-caption-delay="200">Pakistan-based contemporary men’s ipsum brand, specialising in<br />
luxury bespoke suiting.</p> </a>
									<?php }else { ?>
                                    <h2 class="animated fadeInDown"><?php echo $banner['title']; ?></h2>
									<p class="animated fadeInUpBig" data-caption-delay="200">Pakistan-based contemporary men’s ipsum brand, specialising in<br />
luxury bespoke suiting.</p>
									<?php } ?>
<a href="#" class="collection-btn fadeInUp hvr-fade">EXPLORE COLLECTION</a>
<div class="clear"></div>
                                   <a href="#product" class="product-btn animated fadeInUpBig"><img src="catalog/view/theme/default/img/Scroll_icon.png" class="" alt=""/></a>
								</div>
            
                </div>
            </div>
        </div>
    </section>
    <?php } // end of if 
		} // end of for loop
	} // end of if
	?>