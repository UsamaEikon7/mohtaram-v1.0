<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-career" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-career" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
          </ul>
          <div class="tab-content">

            <div class="tab-pane active in" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="career_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($career_description[$language['language_id']]) ? $career_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-min_requirement<?php echo $language['language_id']; ?>"><?php echo $entry_min_requirement; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="career_description[<?php echo $language['language_id']; ?>][min_requirement]" value="<?php echo isset($career_description[$language['language_id']]) ? $career_description[$language['language_id']]['min_requirement'] : ''; ?>" placeholder="<?php echo $entry_min_requirement; ?>" id="input-min_requirement<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_min_requirement[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_min_requirement[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-walkin_timing<?php echo $language['language_id']; ?>"><?php echo $entry_walkin_timing; ?></label>
                    <div class="col-sm-10">
                      <textarea name="career_description[<?php echo $language['language_id']; ?>][walkin_timing]" rows="5" placeholder="<?php echo $entry_walkin_timing; ?>" id="input-walkin_timing<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($career_description[$language['language_id']]) ? $career_description[$language['language_id']]['walkin_timing'] : ''; ?></textarea>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-summery<?php echo $language['language_id']; ?>"><?php echo $entry_summery; ?></label>
                    <div class="col-sm-10">
                      <textarea name="career_description[<?php echo $language['language_id']; ?>][summery]"  id="input-summery<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($career_description[$language['language_id']]) ? $career_description[$language['language_id']]['summery'] : ''; ?></textarea>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="career_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($career_description[$language['language_id']]) ? $career_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>

            <div class="tab-pane fade" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
                <div class="col-sm-10">
                  <select name="type" >
                <?php if ($type) { ?>
                  <option value="1" selected="selected"><?php echo $text_full_time; ?></option>
                  <option value="0"><?php echo $text_part_time; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_full_time; ?></option>
                  <option value="0" selected="selected"><?php echo $text_part_time; ?></option>
                  <?php } ?>
                </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-publish_date"><?php echo $entry_publish_date; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="publish_date" value="<?php echo $publish_date; ?>" placeholder="<?php echo $entry_publish_date; ?>" id="input-publish_date" class="form-control" />
                  
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-num_of_position"><?php echo $entry_num_of_position; ?></label>
                <div class="col-sm-4">
                  <input type="text" name="num_of_position" value="<?php echo $num_of_position; ?>" placeholder="<?php echo $entry_num_of_position; ?>" id="input-num_of_position" class="form-control" />
                  <?php if ($error_num_of_position) { ?>
                  <div class="text-danger"><?php echo $error_num_of_position; ?></div>
                  <?php } ?>                
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-contact_person"><?php echo $entry_contact_person; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="contact_person" value="<?php echo $contact_person; ?>" placeholder="<?php echo $entry_contact_person; ?>" id="input-contact_person" class="form-control" />
                  <?php if ($error_contact_person) { ?>
                  <div class="text-danger"><?php echo $error_contact_person; ?></div>
                  <?php } ?>                
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="address" value="<?php echo $address; ?>"  id="input-address" class="form-control" />
              </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-column"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <select name="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=catalog/career/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>&token=<?php echo $token; ?>');">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-column"><?php echo $entry_zone; ?></label>
                <div class="col-sm-10">
                  <select name="zone_id"> 

                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="phone" value="<?php echo $phone; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-phone" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
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
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $career_store)) { ?>
                        <input type="checkbox" name="career_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="career_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $career_store)) { ?>
                        <input type="checkbox" name="career_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="career_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>

            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="career_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($career_layout[0]) && $career_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="career_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($career_layout[$store['store_id']]) && $career_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>

          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-summery<?php echo $language['language_id']; ?>').summernote({
  height: 300
});
$('#input-description<?php echo $language['language_id']; ?>').summernote({
  height: 300
});
<?php } ?>
//--></script> 
  <script type="text/javascript"><!--
/*$('input[name=\'path\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/career/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        json.unshift({
          career_id: 0,
          name: '<?php echo $text_none; ?>'
        });

        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['career_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'path\']').val(item['label']);
    $('input[name=\'parent_id\']').val(item['value']);
  }
});*/
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['filter_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter\']').val('');

    $('#career-filter' + item['value']).remove();

    $('#career-filter').append('<div id="career-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="career_filter[]" value="' + item['value'] + '" /></div>');
  }
});

$('#career-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'zone_id\']').load('index.php?route=catalog/career/zone&token=<?php echo $token; ?>&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
  dateFormat: 'yy-mm-dd',
  timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>