<div class="panel panel-default">
    <?php if ($display_header) { ?>
        <div class="panel-heading"><?php echo $heading_title; ?></div>
    <?php } ?>
    <div class="list-group" style="<?php echo ($style_max_height > 0 ) ? 'max-height: ' . $style_max_height . 'px; overflow-y: auto;' : ''; ?> " >
        <ul class="box-attributes-filters" id="box-attributes-filters">
            <?php foreach ($attributes as $key => $attribute_main_group) {
                if (isset($attribute_main_group['attribute']) && count($attribute_main_group['attribute']) > 0 && array_intersect(array_keys($attribute_main_group['attribute']), $attributes_filters_attributes)) {
                ?>
                <li class="filter-attributes-group-style"><span id="filter-attributes-group<?php echo $key; ?>"><?php echo $attribute_main_group['name']; ?></span>
                    <ul style="display:block !important;"> 
                        <?php
                            foreach ($attribute_main_group['attribute'] as $id_attribute => $attribute_group) {
                                if (in_array( $id_attribute, $attributes_filters_attributes)) {
                                    echo '<span>' . $attribute_group['name'].'</span>';
                                    if (isset($attribute_group['attributes']) && count($attribute_group['attributes']) > 0) {
                                        foreach ($attribute_group['attributes'] as $id_attribute => $attribute) {
                                            $name = $attribute['text'] . (($display_product_count) ? ' (' . $attribute['total'] . ')' : '');
                                            $selected = false;
                                            if (isset($attributes_filters_selected[$attribute_group['attribute_id']]) && in_array($attribute['text'], $attributes_filters_selected[$attribute_group['attribute_id']])) {
                                                $selected = true;
                                            }
                                            if ($use_checkbox) {
                                                ?>
                                                <div class="checkbox click-checkbox-attributes-filters">
                                                    <label>
                                                        <input type="checkbox" name="attributes_filters[<?php echo $attribute_group['attribute_id']; ?>][]" value="<?php echo $attribute['text']; ?>" <?php if ($selected) { ?>checked<?php } ?> />
                                                        <?php echo $name; ?>
                                                    </label>
                                                </div>

                                                <?php
                                            } else {
                                                ?>
                                                <li>
                                                    <a href="<?php echo $action; ?>&attributes_filters[<?php echo $attribute_group['attribute_id']; ?>][]=<?php echo $attribute['text']; ?>" class="list-group-item <?php if ($selected) { ?>selected<?php } ?>" ><?php echo $name; ?></a>
                                                </li>
                                                <?php
                                            }
                                        }
                                    }
                                }
                            }
                        ?>
                    </ul>
                </li>
            <?php } } ?>
        </ul>
    </div>
<?php if ($use_checkbox && $show_search_button) { ?>
        <div class="panel-footer text-right">
            <button type="button" id="button-attributes-filters" class="btn btn-primary"><?php echo $button_name; ?></button>
        </div>
<?php } ?>
</div>
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

