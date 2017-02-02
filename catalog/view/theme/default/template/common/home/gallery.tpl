
<?php 


if(!empty($v_gallery)){
	
		?>
 <!--<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/gallery_rotator.css" />      
 <section id="ri-grid" class="ri-grid ri-shadow gallery">
    	 <ul>
		 <?php foreach ($v_gallery  as $banner) {
			// echo "<pre>";print_r($banner); exit; ?>
        <li class="col-md-3 col-sm-3 padding0">
        	<?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link'];?>" ><img src="<?php echo M_IMAGE.$banner['image']; ?>" width="100%" alt="<?php echo $banner['title']; ?>" /> </a>
            
            <?php }else { ?>
            <img src="<?php echo M_IMAGE.$banner['image']; ?>" width="100%" alt="<?php echo $banner['title']; ?>" />
            <?php } ?>
        </li>
        <?php } ?>
        </ul>
        <div class="clear"></div>
    </section> -->
    <?php } ?>
<!--<script type="text/javascript" src="catalog/view/theme/default/js/modernizr.custom.26633.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/js/jquery.gridrotator.js"></script>
		<script type="text/javascript">	
			$(function() {
			
				$( '#ri-grid' ).gridrotator( {
				rows			: 1,
				columns			: 4,
				animType		: 'slideLeft',
				animSpeed		: 1500,
				interval		: 5000,
				} );
			
			});
		</script>	-->