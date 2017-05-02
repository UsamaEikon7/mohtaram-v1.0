<?php echo $header; ?>
    <section class="main_top">
    	
        <ol class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ol>
        
          
		
        <div class="container">
        	
            <div class="row">
            	
				<?php echo $column_left; ?>
                
                <div class="col-md-12">
                <?php if ($attention) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                  </div>
                  <?php } ?>
                  <?php if ($success) { ?>
                  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                  </div>
                  <?php } ?>
                  <?php if ($error_warning) { ?>
                  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                  </div>
                  <?php } ?>
                	<?php echo $content_top; ?>
                    <h2><?php echo $heading_title; ?>
						<?php //if ($weight) { ?>
                        <?php // echo $weight; ?>
                        <?php //} ?>
                    </h2>
                    
                <!--col md sm 12-->
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="col-md-8 col-sm-8">
                	
                    <div class="order-boxstyle">
                    	<!--<h4>You’ve saved $17.00 on this order</h4> -->
                        <h4>Cart Items</h4>
                        <div class="table-responsive">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        	<tbody>
                                <tr>
                                  <th colspan="2">Your items</th>
                                  <th class="text-center">Quantity</th>
                                  <th class="text-center">Price</th>
                                  <th class="text-center">Total</th>
                                </tr>
                                <?php foreach ($products as $product) { ?>
                                <tr>
                                	<td>
										  <?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                          <?php } ?>
                                      </td>
                                      <td>
                                      	<p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										  <?php if (!$product['stock']) { ?>
                                          <br /><span class="text-danger">***</span>
                                          <?php } ?>
                                          <?php if ($product['option']) { ?>
                                          <?php foreach ($product['option'] as $option) { ?>
                                          <br />
                                          <span><?php echo $option['name']; ?>: <?php echo $option['value']; ?></span>
                                          <?php } ?>
                                          <?php } ?>
                                          <?php if ($product['reward']) { ?>
                                          <br />
                                          <span><?php echo $product['reward']; ?></span>
                                          <?php } ?>
                                      </td>
                                      <td class="text-center">
                                          <div class="center">
                                            <p>
                                            <div class="input-group">
                                                  <span class="input-group-btn">
                                                      <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]"> <i class="fa fa-refresh"></i></button>
                                                      </span>
                                                  <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" min="1" max="10" size="1" class="form-control input-number" />
                                                  <span class="input-group-btn">
                                                      <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button>
                                                  </span>
                                              </div>
                                              </p>
                                          </div>
                                      </td>
                                      <td class="text-center"><span class="price" style="margin:0px;"><?php echo $product['price']; ?></span></td>
                                      <td class="text-center"><span class="price" style="margin:0px;"><?php echo $product['total']; ?></span></td>
                                  
                                </tr>
                                <?php } ?>
                              </tbody>
                        </table>

                      	</div>
                    
                    </div><!-- order box style-->
                	</div>
					<div class="col-md-4 col-sm-4">
                	
                    <div class="order-boxstyle">
                    
                    	<h4>Order Total</h4>
                        
                        <div class="total-box" style="border-bottom:0px;">
				<?php foreach ($totals as $total) {
                        if(strtolower($total['title']) == 'total'){
                         }else{ ?>
                            	<p><?php echo $total['title']; ?>:  <span><?php echo $total['text']; ?></span></p>
						 <?php }
                        }
                        ?>
                        <div class="clear"></div>
                      </div><!--order-detail-->
                      
                      	<div class="order-detail padding0" style="border-bottom:0px;">
                        
						<div class="story-content padding0">
                            <?php foreach ($totals as $total) {
									if(strtolower($total['title']) == 'total'){ ?>
                            	<p><span class="price"><?php echo $total['title']; ?>:  <?php echo $total['text']; ?></span></p>
                                <?php }
							}?>
                                <div class="clear"></div>
                                
                                <a href="<?php echo $checkout; ?>" class="chekout-btn hvr-bounce-to-left"><?php echo $button_checkout; ?></a>
                            
                        </div><!--story content-->
                            
                            <div class="clear"></div>
                      </div><!--order-detail-->
                      	
                    
                    </div><!-- order box style-->
                    
                </div><!--col md sm 4-->
				
				<div class="col-md-8 col-sm-8">
                
					  <?php if ($modules) { ?>
                          <h2><?php echo $text_next; ?></h2>
                          <p><?php echo $text_next_choice; ?></p>
                          <div class="panel-group" id="accordion">
                            <?php foreach ($modules as $module) { ?>
                            <?php echo $module; ?>
                            <?php } ?>
                          </div>
                       <?php } ?>
                    
                    
                    
                    <div class="spece"></div><div class="spece"></div>
                    
                     <!-- <h2>Special offers</h2> -->
                    
                    <!-- <div class="order-boxstyle">
                    
                    	<h4>Discount prices not offered when products are bought separately</h4>
                        <div class="spece"></div>
                        
                        <div class="table-responsive">
                        
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                
                                <tr>
                                  <td><img src="img/order-img.jpg" alt=""/></td>
                                  <td><p>Men's semi-fitted<br />
                                        cotton floral print sky<br />
                                        and blue shirt<br />
                                        <span>WWS0337SNV12</span><br />
                                        <span>A great saving on this</span><br />
                                        <span>reversible belt, a wardrobe.</span>
                                        </p>
                            	  </td>
                                  
                                  <td>
                                    <span class="total-box">
                                        <p class="text-right">Subtotal:  <span>$20.00</span></p>
                                        <p class="text-right">Flat Rate Shipping:  <span>$5.00</span></p>
                                        <a href="#" class="readmore-btn pull-right">Add to bag</a>
                                        <span class="clear"></span>
                                     </span>
                                  
                                  </td>
                             </tr>
                             </tbody>
						</table>
						
                        </div>
                      	
                    
                    </div> -->
                    
                    
                </div><!--col md sm 8-->
                
                </div>
                
                <div class="clear"></div>
                
              <div class="spece"></div>
              <div class="spece"></div>
              <div class="spece"></div>
              <div class="spece"></div>
            
            </div><!--row-->
        
        </div><!--container-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->
    


<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
  
<?php echo $footer; ?>
