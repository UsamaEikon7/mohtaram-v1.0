<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="sticky-nav">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save fa-fw"></i> <?php echo $button_save; ?></button>
                    <?php if ($is_module) {?>
                    <button type="submit" form="form-module" data-toggle="tooltip" data-loading-text="<?php echo $button_save_loading; ?>" onclick="$(this).button('loading'); $('input[name=\'save_and_continue\'').val('1');" title="<?php echo $button_save_continue; ?>" class="btn btn-success"><i class="fa fa-save fa-fw"></i> <?php echo $button_save_continue; ?></button>
                    <?php } ?>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                </div>
                <h1><?php echo $title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid static-content">
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		    <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <form action="<?php echo $action; ?>" method="post"  id="form-module" class="form-horizontal">
                <input type="hidden" name="save_and_continue" value="0" />
                <input type="hidden" name="attributes_filters_first_save" value="1" />
                <div class="panel-body">
                    <ul class="nav nav-tabs" id="module_panel">
                        <li><a href="#module_panel_settings" data-toggle="tab"><i class="fa fa-wrench fa-lg fa-fw"></i> <?php echo $tab_settings; ?></a></li>
                        <li><a href="#module_panel_language" data-toggle="tab"><i class="fa fa-language fa-lg fa-fw"></i> <?php echo $tab_language; ?></a></li>
                        <li><a href="#module_panel_style" data-toggle="tab"><i class="fa fa-eye fa-lg fa-fw"></i> <?php echo $tab_style; ?></a></li>
                        <li><a href="#module_panel_about" data-toggle="tab"><i class="fa fa-question fa-lg fa-fw"></i> <?php echo $tab_about; ?></a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane" id="module_panel_settings">

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				    <?php if ($error_name) { ?>
					    <div class="text-danger"><?php echo $error_name; ?></div>
				    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
					<?php if ($status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
				<div class="col-sm-10">
				    <div class="checkbox" style="margin-bottom:15px;">
					<label>
					    <input class="dont_chcked" onclick="disableCheckbox('categories');" name="attributes_filters_display_in_all" type="checkbox" value="1" <?php if (isset($attributes_filters_display_in_all) && $attributes_filters_display_in_all == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_display_in_all; ?>
					</label>
				    </div>
				    <div>
					<b>OR select Categories:</b>
				    </div>
				    <div class="well well-sm categories" style="height: 190px; overflow: auto;">
					<?php foreach ($categories as $category) { ?>
						<div class="checkbox">
						    <label>
							<?php if (in_array($category['category_id'], $attributes_filters_categories)) { ?>
								<input type="checkbox" class="checkbox_item" name="attributes_filters_categories[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
								<span><?php echo $category['name']; ?></span>
							<?php } else { ?>
								<input type="checkbox" class="checkbox_item" name="attributes_filters_categories[]" value="<?php echo $category['category_id']; ?>" />
								<span><?php echo $category['name']; ?></span>
							<?php } ?>
						    </label>
						</div>
					<?php } ?>
				    </div>
				    <a onclick="$(this).parent().find(':checkbox:not(\'.dont_chcked\')').prop('checked', true); return false;" href="#"><?php echo $text_select_all; ?></a> / <a href="#" onclick="$(this).parent().find(':checkbox:not(\'.dont_chcked\')').prop('checked', false); return false;"><?php echo $text_unselect_all; ?></a>
				</div>
                            </div>

                            <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_attributes; ?></label>
				<div class="col-sm-10">
				    <div class="well well-sm" style="height: 190px; overflow: auto;">
					<?php foreach ($attributes as $attribute) { ?>
						<div class="checkbox">
						    <label>
							<?php if (in_array($attribute['attribute_id'], $attributes_filters_attributes)) { ?>
								<input type="checkbox" class="checkbox_item" name="attributes_filters_attributes[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
								<span><?php echo $attribute['display_name']; ?></span>
							<?php } else { ?>
								<input type="checkbox" class="checkbox_item" name="attributes_filters_attributes[]" value="<?php echo $attribute['attribute_id']; ?>" />
								<span><?php echo $attribute['display_name']; ?></span>
							<?php } ?>
						    </label>
						</div>
					<?php } ?>
				    </div>
				    <a onclick="$(this).parent().find(':checkbox:not(\'.dont_chcked\')').prop('checked', true); return false;" href="#"><?php echo $text_select_all; ?></a> / <a href="#" onclick="$(this).parent().find(':checkbox:not(\'.dont_chcked\')').prop('checked', false); return false;"><?php echo $text_unselect_all; ?></a>
				</div>
                            </div>

			    <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_other_settings; ?></label>
				<div class="col-sm-10">
<!--                                <div class="checkbox" style="margin-bottom:10px;">
					<label>
					    <input name="attributes_filters_other_settings_display_number_as_slider" type="checkbox" value="1" <?php if (isset($attributes_filters_other_settings_display_number_as_slider) && $attributes_filters_other_settings_display_number_as_slider == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_other_settings_display_number_as_slider; ?>
					</label>
				    </div>-->
                                    <div class="checkbox" style="margin-bottom:10px;">
					<label>
					    <input name="attributes_filters_other_settings_display_header" type="checkbox" value="1" <?php if (isset($attributes_filters_other_settings_display_header) && $attributes_filters_other_settings_display_header == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_other_settings_display_header; ?>
					</label>
				    </div>
                                    <div class="checkbox" style="margin-bottom:10px;">
					<label>
					    <input name="attributes_filters_other_settings_display_product_count" type="checkbox" value="1" <?php if (isset($attributes_filters_other_settings_display_product_count) && $attributes_filters_other_settings_display_product_count == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_other_settings_display_product_count; ?>
					</label>
				    </div>
				    <div class="checkbox" style="margin-bottom:10px;">
					<label>
					    <input name="attributes_filters_other_settings_use_checkbox" id="use_checkbox" type="checkbox" value="1" <?php if (isset($attributes_filters_other_settings_use_checkbox) && $attributes_filters_other_settings_use_checkbox == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_other_settings_use_checkbox; ?>
					</label>
				    </div>
                                    <div class="checkbox" id="search_button_checkbox" style="margin-bottom:10px;">
					<label>
					    <input name="attributes_filters_other_settings_show_search_button" type="checkbox" value="1" <?php if (isset($attributes_filters_other_settings_show_search_button) && $attributes_filters_other_settings_show_search_button == '1') { ?>checked<?php } ?> />
					    <?php echo $entry_other_settings_show_search_button; ?>
					</label>
				    </div>
				</div>
                            </div>
			    
			    <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_select_condition_1; ?>  <a data-toggle="help_image_icon" href="#" data-image="help_condition1.png" data-title=""><i class="fa fa-question-circle fa-lg fa-fw"></i></a></label>
				<div class="col-sm-10">
				    <label class="radio-inline">
                                        <input type="radio" name="attributes_filters_select_condition_1" value="1" <?php if (isset($attributes_filters_select_condition_1) && $attributes_filters_select_condition_1 == '1') { ?>checked="checked"<?php } ?> >
					AND
				    </label>
				    <label class="radio-inline">
                                        <input type="radio" name="attributes_filters_select_condition_1" value="2" <?php if (isset($attributes_filters_select_condition_1) && $attributes_filters_select_condition_1 == '2') { ?>checked="checked"<?php } ?>  >
					OR
				    </label>
				</div>
			    </div>
			    <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_select_condition_2; ?><a data-toggle="help_image_icon" href="#" data-image="help_condition2.png" data-title=""><i class="fa fa-question-circle fa-lg fa-fw"></i></a></label>
				<div class="col-sm-10">
				    <label class="radio-inline">
                                        <input type="radio" name="attributes_filters_select_condition_2" value="1" <?php if (isset($attributes_filters_select_condition_2) && $attributes_filters_select_condition_2 == '1') { ?>checked="checked"<?php } ?> >
					AND
				    </label>
				    <label class="radio-inline">
                                        <input type="radio" name="attributes_filters_select_condition_2" value="2" <?php if (isset($attributes_filters_select_condition_2) && $attributes_filters_select_condition_2 == '2') { ?>checked="checked"<?php } ?> >
					OR
				    </label>
				</div>
			    </div>
                        </div>
                        <div class="tab-pane " id="module_panel_language">
			    <?php foreach ($frontend_language as $id_lang => $defaults) { ?>
				    <div class="form-group" >
					<label class="col-sm-2 control-label" for="input-lang-text-<?php echo $id_lang ?>"><?php echo $defaults['entry']; ?> <?php if (isset($defaults['help']) && $defaults['help']) { ?><a data-toggle="help_image_icon" href="#" data-image="help_lang.png" data-title="<?php echo $defaults['entry']; ?> = lang <?php echo $id_lang; ?>"><i class="fa fa-question-circle fa-lg fa-fw"></i></a> <?php } ?></label>
					<div class="col-sm-10 tab-pane" >
					    <ul class="nav nav-tabs" id="lang_text_<?php echo $id_lang; ?>">
						<?php foreach ($languages as $language) { ?>
							<li><a href="#lang_text_<?php echo $id_lang ?>_text<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['image_url']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					    </ul>
					    <div class="tab-content ">
						<?php foreach ($languages as $language) { ?>
							<div class="tab-pane" id="lang_text_<?php echo $id_lang ?>_text<?php echo $language['language_id']; ?>">
							    <div class="col-sm-12 btech-tab-pane row-no-padding">
								<input class="form-control" maxlength="500" name="attributes_filters_lang[<?php echo $id_lang ?>][<?php echo $language['language_id']; ?>][text]"  placeholder="<?php echo $language['name'] . " " . $defaults['default']; ?>" value="<?php echo isset($attributes_filters_lang[$id_lang][$language['language_id']]['text']) ? $attributes_filters_lang[$id_lang][$language['language_id']]['text'] : $defaults['default']; ?>"/>
							    </div>
							</div>
						<?php } ?>
					    </div>
					</div>
				    </div>
			    <?php } ?>
                        </div>
                        <div class="tab-pane " id="module_panel_style">
			    <div class="form-group">
                                <label class="col-sm-2 control-label" for="max-height"><?php echo $entry_max_height; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="attributes_filters_style_max_height" value="<?php echo $attributes_filters_style_max_height; ?>" placeholder="<?php echo $entry_max_height; ?>" id="max-height" class="form-control" />
                                    <div class="text-info"><?php echo $text_style_max_height_note; ?></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_module_css; ?></label>
                                <div class="col-sm-10" >
                                    <textarea id="textarea-module-css" style="display: none;" name="attributes_filters_style_module_css"><?php echo $attributes_filters_style_module_css; ?></textarea>
                                    <textarea id="editor-module-css"><?php echo $attributes_filters_style_module_css; ?></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="module_panel_about">
			    <?php
			    if ($module_info) {
				    echo '<div class="btech-about">' . $module_info . '</div>';
			    } else {
                                ?>
                                <div class="alert alert-danger">
                                    <i class="fa fa-check-circle"></i> Error: cURL is not installed! <br><br>For info click <br><a onclick="javascript:PopupCenter('<?php echo $module_info_url; ?>&window=true', 800, 300);return false;" href="#"><i class="fa fa-hand-o-right"></i> <?php echo $module_info_url; ?></a>   
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                </div>
			    <?php } ?>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<style type="text/css">
    .btech-tab-pane{
        border-bottom: 1px solid #EEEEEE;
        padding-bottom: 10px;
    }
    .row-no-padding[class*="col-"] {
        padding-left: 0 !important;
        padding-right: 0 !important;
    }
    .btech-about{
        font-family: monospace;
        font-size: 15px;
    }
    .popover.btech{
        max-width: 800px;
        min-width: 200px;
    }
    .popover.btech h3.popover-title{
        font-size: 20px;
        font-weight: bold;
    }
    .checkbox .disabled {
        opacity: .5;
    }
    .ace-chrome{
        height: 280px;
    }
</style>
<script type="text/javascript">
$(document).ready(function() {
    <?php foreach ($languages as $language) { ?>
            $('#attributes_filters_name_<?php echo $language['language_id']; ?>').summernote({height: 80});
    <?php } ?>

    <?php foreach ($frontend_language as $id_lang => $defaults) { ?>
        $('#lang_text_<?php echo $id_lang ?> a:first').tab('show');
    <?php } ?>

    <?php if (isset($attributes_filters_display_in_all) && $attributes_filters_display_in_all == '1') { ?>
        disableCheckbox('categories');
    <?php } ?>	

    <?php if (isset($attributes_filters_other_settings_use_checkbox) && $attributes_filters_other_settings_use_checkbox != '1') { ?>
        disableCheckboxButton();
    <?php } ?>
    stickyNav();    
});
</script>

<?php echo $footer; ?>