<?php echo $header; ?>
<div id="content" class="container"><?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 <div class="clear"></div>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
 <div id="cms" class="cms paddTp">
  <h1><?php echo $heading_title; ?></h1>
  <div class="middle">
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
    <?php } ?>
     <div class="col-sm-8">
		
			<!--<h3 class="spaceBottom"><?php //echo $text_description; ?></h3>--> <!--<div class="spaceBottom"><?php //echo $description; ?></div>-->
      <!--<div class="flt carrerpg spaceBottom"><?php //echo $text_num_of_position; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig"> <?php //echo $num_of_position; ?></div>-->
      <div class="col-sm-4" style="padding-left:0px;">
        <tr><td><?php echo $text_num_of_position; ?> :</td>
        <td><?php echo $num_of_position; ?></td></tr>
      </div>
      <!--<tr><td><?php //echo $text_num_of_position; ?></td><td>:</td> <td><?php //echo $num_of_position; ?></td></tr>-->
                <br />
     <div class="clear"></div>
          
      <div class="col-sm-4" style="padding-left:0px;">
        <tr><td><?php echo $text_type; ?> :</td>
        <td><?php echo $type; ?></td></tr>
      </div>

			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_type; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig"> <?php //echo $type; ?></div>-->
      <!--<tr><td><?php //echo $text_type; ?></td><td>:</td> <td><?php //echo $type; ?></td></tr>-->
                <br />
     <div class="clear"></div>

     <div class="col-sm-4" style="padding-left:0px;">
        <tr><td><?php echo $text_contact_person; ?> :</td>
        <td><?php echo $contact_person; ?></td></tr>
      </div>
     
     <!--<div class="flt carrerpg spaceBottom"><?php //echo $text_contact_person; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"> <?php //echo $contact_person; ?></div>-->
     <!--<tr><td><?php echo $text_contact_person; ?></td><td>:</td> <td><?php //echo $contact_person; ?></td></tr>-->
                <br />
     <div class="clear"></div>
     
     <div class="col-sm-5" style="padding-left:0px;">
        <tr><td><?php echo $text_phone; ?> :</td>
        <td><?php echo $phone_no; ?></td></tr>
      </div>
     
			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_phone; ?> </div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"><?php //echo $phone_no; ?></div>-->
      <!--<tr><td><?php //echo $text_phone; ?></td><td>:</td> <td><?php //echo $phone_no; ?></td></tr>-->
                <br />
     <div class="clear"></div>

     <div class="col-sm-7" style="padding-left:0px;">
        <tr><td><?php echo $text_address; ?> :</td>
        <td><?php echo $address; ?></td></tr>
      </div>
     
     <!--<div class="flt carrerpg spaceBottom"><?php //echo $text_address; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"><?php //echo $address; ?></div>-->
     <!--<tr><td><?php //echo $text_address; ?></td><td>:</td> <td><?php //echo $address; ?></td></tr>-->
                <br />
     <div class="clear"></div>

     <div class="col-sm-5" style="padding-left:0px;">
        <tr><td><?php echo $text_zone; ?> :</td>
        <td><?php echo $zone; ?></td></tr>
      </div>
     
     
     
			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_zone; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"><?php //echo $zone; ?></div>-->
      <!--<tr><td><?php //echo $text_zone; ?></td><td>:</td> <td><?php //echo $zone; ?></td></tr>-->
                <br />
     <div class="clear"></div>

     <div class="col-sm-5" style="padding-left:0px;">
        <tr><td><?php echo $text_country; ?> :</td>
        <td><?php echo $country; ?></td></tr>
      </div>
     
			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_country; ?></b></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"><?php //echo $country; ?></div>-->
      <!--<tr><td><?php //echo $text_country; ?></td><td>:</td> <td><?php //echo $country; ?></td></tr>-->
                <br />
     <div class="clear"></div>
         
			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_publish_date; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"> <?php //echo $publish_date; ?></div>
     <div class="clear"></div>-->
         <div class="marBtm"></div>  
         
         
        <div class="col-sm-8" style="padding-left:0px;"> <div class="carrerpg spaceBottom"><?php echo $text_description; ?></div> <div class="spaceBottom"><?php echo $description; ?></div></div>
     <div class="clear"></div>
           
			<!--<div class="carrerpg spaceBottom"><?php //echo $text_min_requirement; ?></div> <div class="spaceBottom"><?php //echo $min_requirement; ?></div>
     <div class="clear"></div>-->
        
			<!--<div class="flt carrerpg spaceBottom"><?php //echo $text_walkin_timing; ?></div><div class="flt paddleftrigh">:</div> <div class="flt carrerpgrig spaceBottom"> <?php //echo $walkin_timing; ?></div>
     <div class="clear"></div>-->
         
			
     
          
		  
			
  </div>
 <div class="col-sm-3">
 
	<h3><?php echo $sub_heading_apply ?></h3>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div class="content">
    <div class="formData">
       <div class="flt newcdiv1" style="font-size:13px;"> <?php echo $entry_name; ?> <span class="required" style="color:red;">*</span></div>
			 <div class="flt contemail"><input type="text" name="name" value="<?php echo $name; ?>" /><br/>
              <?php if ($error_name) { ?>
              <span class="error" style="width: 270px;color:red;"><?php echo $error_name; ?></span>
              <?php } ?></div>
		   <div class="clear"></div>
      <div class="flt newcdiv1 spaceTop" style="font-size:13px;"><?php echo $entry_email; ?> <span class="required" style="color:red;">*</span></div>
		<div class="flt contemail spaceTop"><input type="text" name="email" value="<?php echo $email; ?>"/><br/>
              <?php if ($error_email) { ?>
              <span class="error" style="width: 270px;color:red;"><?php echo $error_email; ?></span>
              <?php } ?></div>
               <div class="clear" style="width: 270px;"></div>
		 <div class="flt newcdiv1 spaceTop" style="font-size:13px;"><?php echo $entry_phone; ?> <span class="required" style="color:red;">*</span></div>
				<div class="flt contemail spaceTop"><input type="text" name="phone" value="<?php echo $phone; ?>"/><br/>
              <?php if ($error_phone) { ?>
              <span class="error" style="color:red;"><?php echo $error_phone; ?></span>
              <?php } ?></div>
               <div class="clear" style="width: 270px;"></div>
     	<div class="flt newcdiv1 spaceTop" style="font-size:13px;"><?php echo $entry_upload_resume; ?> <span class="required" style="color:red;">*</span></div>
		<div class="flt contemail spaceTop"><input type="file"  name="upload_resume" value="" class="her-tag"> <?php if ($error_upload_resume) { ?>
            <span class="error" style="width: 270px;color:red;"><?php echo $error_upload_resume; ?></span>
            <?php } ?></div> <div class="clear"></div>
     </div>
	 </div>
		
          <div class="flt newcdiv1 marBtm spaceTop">&nbsp;</div>

     <div class="flt contemail marBtm spaceTop"><a onclick="$('#form').submit();" class="btn btn-primary"><span><?php echo $button_save; ?></span></a> &nbsp; <a onclick="location='<?php echo $cancel; ?>';" class="btn btn-primary"><span><?php echo $button_cancel; ?></span></a></div>

      <div class="clear"></div>
	</form>
  </div>
  </div>
  </div>
 
 <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>