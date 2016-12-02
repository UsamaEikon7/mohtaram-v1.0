<?php echo $header; ?>
 <section class="archive">
    	
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol>
        
       <!-- <div class="filter pull-right">
        	
            <p>Filter:</p>
            <a href="#"><i class="fa fa-th-large active"></i></a>
            <a href="#"><i class="fa fa-th"></i></a>
        	<div class="clear"></div>
        </div>--><!--filter--> 
        
        <div class="clear"></div><div class="spece"></div>

		<?php
		if(!empty($categories)) {
			
		 ?>
        
        <div class="container">
        	
            <div class="row">
            	<?php 
                foreach ($categories as $category) { ?>
                <div class="col-md-4 col-sm-4 margin-bottom-top">
                <article class="archive-article">
                	<a href="<?php echo $category['href']; ?>">
                    <div class="featured-image"> <img alt="<?php echo $category['description']; ?>" class="thumbnail-medium" src="<?php echo M_IMAGE.$category['image']; ?>"> </div>
                    <div class="overlay">
                      <div class="overlay-content">
                        <h2><?php echo $category['name']; ?></h2>
                      </div>
                    </div>
                    </a>
                  </article>
                 </div> 
                 <?php } ?>              
            </div><!--row-->
        
        </div><!--container-->
        <?php } ?> 
        
        <!--right section-->
        <div class="clear"></div>   <div class="spece"></div><div class="spece"></div>     
    </section><!--bredcrumbs section-->
    

<?php echo $footer; ?>