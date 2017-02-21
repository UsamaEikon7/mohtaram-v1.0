<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-easypay" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $edit_settings; ?></h3>
      </div>
	
	<div class="panel-body">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-easypay" class="form-horizontal">
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="easypay_status" id="input-status" class="form-control">
                <?php if ($easypay_status) { ?>
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
			<label class="col-sm-2 control-label" for="strID"><?php echo $entry_storeId; ?></label>
            <div class="col-sm-10">
              <input type="text" name="easypay_storeId" value="<?php echo $easypay_storeId; ?>" id="strID" class="form-control" />
            </div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="exp"><?php echo $entry_expiry; ?></label>
            <div class="col-sm-10">
              <input type="text" name="easypay_expiry" value="<?php echo $easypay_expiry; ?>" id ="exp" class="form-control" />
            </div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="key"><?php echo $entry_hashKey; ?></label>
            <div class="col-sm-10">
              <input type="text" name="easypay_hashKey" value="<?php echo $easypay_hashKey; ?>" id = "key" class="form-control" />
            </div>
        </div>

		<div class="form-group">
            <label class="col-sm-2 control-label" for="payMeth"><?php echo $entry_pay_methods; ?></label>
            <div class="col-sm-10">
              <select name="easypay_payment_method" id="payMeth" class="form-control">
                <?php foreach ($payment_methods as $method) { ?>
                <?php if ($method['value'] == $easypay_payment_method) { ?>
				<option value="<?php echo $method['value']; ?>" selected="selected"><?php echo $method['label']; ?></option>
                <?php } else { ?>
				<option value="<?php echo $method['value']; ?>"><?php echo $method['label']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
        </div>
		
        <div class="form-group">
            <label class="col-sm-2 control-label" for="ared"><?php echo $entry_autoRedirect; ?></label>
            <div class="col-sm-10">
              <select name="easypay_auto_redirection" id="ared" class="form-control">
                <?php if ($easypay_auto_redirection) { ?>
                <option value="1" selected="selected"><?php echo $enabled; ?></option>
                <option value="0"><?php echo $disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $enabled; ?></option>
                <option value="0" selected="selected"><?php echo $disabled; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>

		<div class="form-group">
            <label class="col-sm-2 control-label" for="env"><?php echo $entry_env_live; ?></label>
            <div class="col-sm-10">
              <select name="easypay_live" id="env" class="form-control">
                <?php if ($easypay_live) { ?>
                <option value="1" selected="selected"><?php echo $enabled; ?></option>
                <option value="0"><?php echo $disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $enabled; ?></option>
                <option value="0" selected="selected"><?php echo $disabled; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 