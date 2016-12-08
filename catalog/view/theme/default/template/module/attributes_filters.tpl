
        	
            <?php if ($display_header) { ?><h3>Product Cuts</h3><?php } ?>
            <?php foreach ($attributes as $key => $attribute_main_group) {
                if (isset($attribute_main_group['attribute']) && count($attribute_main_group['attribute']) > 0 && array_intersect(array_keys($attribute_main_group['attribute']), $attributes_filters_attributes)) {
                if($key == 7){
					// $key 7 is for fit  only
					// this navigation is for FIT only
				?>
            <nav class="aside-nav">
            	
                <ul>
                <?php foreach ($attribute_main_group['attribute'] as $id_attribute => $attribute_group) {
                                if (in_array( $id_attribute, $attributes_filters_attributes)) {
									if (isset($attribute_group['attributes']) && count($attribute_group['attributes']) > 0) {
                                        foreach ($attribute_group['attributes'] as $id_attribute => $attribute) {
                                            $name = $attribute_group['name'] . (($display_product_count) ? ' (' . $attribute['total'] . ')' : '');
                                            $selected = false;
                                            if (isset($attributes_filters_selected[$attribute_group['attribute_id']]) && in_array($attribute['text'], $attributes_filters_selected[$attribute_group['attribute_id']])) {
                                                $selected = true;
                                            } ?>
                                <li><a href="<?php echo $action; ?>&attributes_filters[<?php echo $attribute_group['attribute_id']; ?>][]=<?php echo $attribute['text']; ?>" class="<?php if ($selected) { ?>selected active<?php } ?>" ><?php echo $name; ?></a></li>
                             <?php 
                                              }
                                        }
                                    }
                                }
                            
							?>
                </ul>
            </nav>
            <div class="spece"></div><div class="spece"></div>
            <?php }else{ ?>
            <h3><?php echo  $attribute_main_group['name']; ?></h3>
			<?php // end of navigation for fit only 
            foreach ($attribute_main_group['attribute'] as $id_attribute => $attribute_group) {
                                if (in_array( $id_attribute, $attributes_filters_attributes)) {
									?>
            
      
            <?php if (isset($attribute_group['attributes']) && count($attribute_group['attributes']) > 0) {
										//echo "<pre>"; print_r($attribute_group['attributes']); exit;
                                        foreach ($attribute_group['attributes'] as $id_attribute => $attribute) {
                                            //$name = $attribute['text'] . (($display_product_count) ? ' (' . $attribute['total'] . ')' : '');
                                            $name = $attribute_group['name'] . (($display_product_count) ? ' (' . $attribute['total'] . ')' : '');
                                            
											$selected = false;
                                            if (isset($attributes_filters_selected[$attribute_group['attribute_id']]) && in_array($attribute['text'], $attributes_filters_selected[$attribute_group['attribute_id']])) {
                                                $selected = true;
                                            } ?>
                                            
                                                    <label class="checkbox-inline  click-checkbox-attributes-filters">
                                                        <input type="checkbox" name="attributes_filters[<?php echo $attribute_group['attribute_id']; ?>][]" value="<?php echo $attribute['text']; ?>" <?php if ($selected) { ?>checked<?php } ?> />
                                                        <?php echo $name; ?>
                                                    </label>
                                                
                                                <?php 
										}
			}
								}
			}
			
				}
				}
			}
							?>
           
       



<style type="text/css">
<?php echo $style_module_css; ?>
</style>
<?php if ($use_checkbox) { ?>
<script type="text/javascript"><!--

function getCheckedAttributes(){
    var attributes_filters = [];
    $('input[name^="attributes_filters"]:checked').each(function(el) {
            attributes_filters.push(this.name + '=' + this.value);
    });
    return attributes_filters.join('&');
}

<?php if ($use_checkbox && !$show_search_button){ ?>
     $('.click-checkbox-attributes-filters').on('click', function() {
        window.location = '<?php echo $action; ?>&' + getCheckedAttributes();
    });
<?php } ?>

    $('#button-attributes-filters').on('click', function() {
        window.location = '<?php echo $action; ?>&' + getCheckedAttributes();
    });

//--></script> 
<?php } ?>

