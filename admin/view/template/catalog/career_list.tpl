<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-career').submit() : false;"><i class="fa fa-trash-o"></i></button>

      </div>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">
        
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-career">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>

                  <td class="text-left"><?php if ($sort == 'title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                    <?php } ?></td>
                    
                  <td class="text-left"><?php if ($sort == 'num_of_position') { ?>
                    <a href="<?php echo $sort_num_of_position; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_num_of_position; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_num_of_position; ?>"><?php echo $column_num_of_position; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'walkin_timing') { ?>
                    <a href="<?php echo $sort_walkin_timing; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_walkin_timing; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_walkin_timing; ?>"><?php echo $column_walkin_timing; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'contact_person') { ?>
                    <a href="<?php echo $sort_contact_person; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_contact_person; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_contact_person; ?>"><?php echo $column_contact_person; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_applied; ?></td>
                  <td class="text-left"><?php if ($sort == 'status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php  /*echo  "<pre>";
                        print_r($careers);
                        exit;*/
                      ?>
                <?php if ($careers) { ?>
                <?php foreach ($careers as $career) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($career['career_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $career['career_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $career['career_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $career['title']; ?></td>
                  <td class="text-left"><?php echo $career['num_of_position']; ?></td>
                  <td class="text-right"><?php echo $career['walkin_timing']; ?></td>
                  <td class="text-left"><?php echo $career['contact_person']; ?></td>
                  <td class="text-left"><a href="<?php echo $career['applicant_href']; ?>"><?php echo $text_applicant; ?>(<?php echo $career['applicant']; ?>)</a></td>
                  <td class="text-left"><?php echo $career['status']; ?></td>
                  <td class="text-left"><?php echo $career['sort_order']; ?></td>
                  <td class="text-right"><a href="<?php echo $career['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  
  <script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script></div>
<?php echo $footer; ?>
