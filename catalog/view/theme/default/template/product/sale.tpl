<?php echo $header; ?>
    <section class="archive">
        <ul class="breadcrumb pull-left">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ul>
       <!-- <p class="pull-left text-center col-md-9 col-sm-9 search-resutls">25 Results for Jackets. <a href="#">Change Search Term</a></p> -->
                <div class="clear"></div>
        <div class="spece"></div>

 <div class="row leftrightmargin">
<?php echo $column_left; ?>
		
    

<div class="col-sm-10">
        	

      <?php if ($products) {
		 // echo "<pre>"; print_r($products); exit; ?>
      <div class="row">
      
        <div class="col-md-4 col-xs-6"  id="content">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <div class="row">
   				
                <?php 
				//echo count($products);
				foreach ($products as $product) { ?>
                <div class="col-md-4 col-sm-4 margin-bottom-top">
                <article class="archive-article">
                	
                    <div class="featured-image"> <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="thumbnail-medium" /> </a></div>
                    <div class="overlay">
                      <div class="overlay-content">
                        <a href="<?php echo $product['href']; ?>"><h2><?php echo $product['name']; ?></h2></a>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                          <?php if (!$product['special']) { ?>
                          <?php echo $product['price']; ?>
                          <?php } else { ?>
                          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                          <?php } ?>
                          
                        </p>
                        <div class="button-group">
                            <button type="button"  onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                            <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> -->
                          </div>
                        <?php } ?>
                        
                      </div>
                    </div>
                   
                  </article>
                 </div> 
                 <?php } ?>
                 </div> 
       <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      
      
<?php } ?>
</div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

       
        
        <div class="clear"></div>   <div class="spece"></div><div class="spece"></div>     
    </section>
<?php echo $footer; ?>
