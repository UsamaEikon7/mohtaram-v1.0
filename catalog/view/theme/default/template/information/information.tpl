<?php echo $header; ?>
 <section>
    	
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol>
		
        <section class="about-section padding0 informationmain main_top">
    	
        <div class="container">
        	
            <div class="row">
            	
                <h2><?php echo $heading_title; ?></h2>
                <div class="clear"></div><div class="spece"></div>
                
                <?php
				//echo '<pre>';
				echo html_entity_decode($description);
				//echo '</pre>';
					 ?>
                
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section><!--story-section-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->
    
<?php echo $footer; ?>