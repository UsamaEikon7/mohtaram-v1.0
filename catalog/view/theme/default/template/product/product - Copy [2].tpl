<?php echo $header; ?>
    <section class="archive product_detail_p" >
    
        <div class="col-md-8 col-sm-8 padding0">
                	
             <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="100%" />
             <?php if ($images) {
				 // FOR OTHER PRODUCT IMAGES ?>
            	<?php foreach ($images as $image) { ?>
            	<img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" width="100%" />
            	<?php } ?>
            <?php } ?>
             <!--<img src="img/product-page-image.jpg" width="100%" alt=""/> -->
                    
        </div><!--product image-->
        
        <div class="col-md-4 col-sm-4">
        	
            <div class="product-detail">
            	<ul class="breadcrumb"> </ul>
                <div class="social-header" id="content">
                	<?php foreach($breadcrumbs as $key => $item) {
						if($key == 1) { ?>
                    <a href="<?php echo $item['href']; ?>" class="back-link pull-left"> &lt; Back to Category Name</a>
                    <?php } 
					}?>
                    <div class="social pull-right addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>">
                    	
                        
                        
                         <a class="addthis_button_tweet"></a> 
                         <a class="addthis_button_pinterest_pinit"></a>
                          <a class="addthis_counter addthis_pill_style"></a>
                          
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                    
                    </div><!--social-->
                    
                    <div class="clear"></div>
                </div><!--social header-->
                
                <h2><?php echo $heading_title; ?></h2>
                
                <p class="code-stock"><?php if(isset($product_info['sku']) and $product_info['sku'] != '' ) { ?>Item code:  <?php echo $product_info['sku']; ?>- <?php } ?> <?php echo $stock; ?></p>
                <?php if ($price) { ?>
                  
                    <?php if (!$special) { ?>
                    
                      <h3>Price : <?php echo $price; ?></h3>
                    
                    <?php } else { ?>
                    	<p class="code-stock"><?php echo $special; ?></p>
                     
                    
                    <?php } ?>
                    
                    
                    <?php if ($discounts) { ?>
                    <li>
                      <hr>
                    </li>
                    <?php foreach ($discounts as $discount) { ?>
                    <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                    <?php } ?>
                    <?php } ?>
                  
                  <?php } ?>
                
                
                <?php
				echo $description; ?>
                <!--<p>O uniune perfectă între stilul contemporan şi eleganţa pieselor 
clasice. Parka în stil sahariană din colecţia exclusivă Personal 
Tailoring. Confecţionată din ţesătură italiană din serj de in şi 
bumbac, vopsită pe articolul de îmbrăcăminte.</p> -->
		<ul class="nav nav-tabs">
            <li class="dropdowns nopadding active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li class="dropdowns nopadding"><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li class="dropdowns nopadding"><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn send-btn"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
		
        <div class="form-group">
        <label class="control-label labelheading" for="input-quantity">Quantity : </label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control forminput" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
        </div>
        
              
        <?php if ($options) { ?>
        <div id="product">
        <?php foreach ($options as $option) { ?>
        <div class="color-theme form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
         <!--<div class="color-theme"> -->
        	
          <h4><?php echo $option['name']; ?></h4>
          <div id="input-option<?php echo $option['product_option_id']; ?>" class="color-widget ">
          <?php foreach ($option['product_option_value'] as $option_value) { ?>
          <label class="checkbox-inline">
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
          
          <?php }
		  if(strtolower($option['name']) == 'sizes') { ?>
          <a href="#" style="color:#2b2b2c; padding-left:20px; text-decoration:underline; font-weight:bold;">Size guide</a>
          <?php } ?>
          </div><!--Color Widget -->
          </div><!--color -->
          
          
          
          <?php }
		  ?>
		  </div>
		  <?php
		   } ?>
        <div class="spece"></div>
        <!--color -->
          
      	<?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php  } ?>	
          <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn send-btn"><?php echo $button_cart; ?></button>
          
          <!--<a href="#" class="create-btn hvr-bounce-to-left">BUY</a>
          
          <a href="#" class="customize-btn hvr-bounce-to-right">Customize</a>
              -->   	
                <div class="clear"></div>
            </div><!--prodcut detail-->
        
        </div><!--col md sm 4-->
        
        <div class="clear"></div>    
    <!--bredcrumbs section-->
    



     
      <?php if ($products) { ?>
      <div class="container">
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) {
			?>
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
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
    
    </section>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
