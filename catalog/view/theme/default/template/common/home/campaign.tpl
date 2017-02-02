<?php 
if(!empty($banners)){
		foreach ($banners  as $banner) { ?>
 <section class="section parallax" style="padding: 100px 0px; min-height:800px; background:linear-gradient(
                     rgba(20,20,20, .5), 
                     rgba(20,20,20, .5)),url(<?php echo M_IMAGE.$banner['image']; ?>); background-position: center center;" data-stellar-background-ratio="0.3">
    				
                    <div class="container">
    					
                        <div class="row">
							
                            <div class="letter-box col-md-8 col-md-offset-2">
						
                        <div class="body-area text-center">
                        	
                            <h4>Limited Edition</h4>
                            <h2><?php echo $banner['title'];  ?></h2>
<?php echo html_entity_decode($banner['description']);  ?>
<a href="<?php echo $banner['link'];  ?>" class="readmore-btn hvr-fade">Take a look</a>
                            
                        
                        </div><!--body area-->
                        
					</div>
                    
                    	</div><!--row-->
                    
                    </div><!--container-->
				</section><!--parallax section-->
                
                <?php
		}
}?>
    