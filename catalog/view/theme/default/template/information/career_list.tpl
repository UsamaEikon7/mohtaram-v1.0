<?php echo $header; ?>
<div class="container"  >
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row" ><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <!--<?php //if ($description) //{ ?>
      <div class="row">
        <?php //if ($description) //{ ?>
        <div class="col-sm-10"><?php //echo $description; ?></div>
        <?php //} ?>
      </div>
      <hr>
      <?php //} ?>-->
      <?php if ($careers) { ?>
      <br />
      <div class="row">
        <?php foreach ($careers as $career) { ?>
        <div class="career-layout career-list col-xs-10">
          <div class="career-thumb">
            <div>
              <div class="caption">
                <div><?php echo $text_apply_now ?></div> 
                <h4><a href="<?php echo $career['apply_now']; ?>"><?php echo $career['title']; ?></a></h4>
                <div><?php echo $career['description']; ?></div>       
                  
                  <div class="col-sm-6" style="padding-left:0px;">
                    <tr><td><?php echo $text_num_of_position; ?> :</td>
                      <td><?php echo $career['num_of_position'] ?></td></tr>
                </div>
                <br />                
                <div class="col-sm-6" style="padding-left:0px;">
                  <tr><td><?php echo $text_contact_person; ?> :</td>
                    <td><?php echo $career['contact_person'] ?></td></tr>
                </div>
                <br />                
                <div class="col-sm-6" style="padding-left:0px;">
                  <tr><td><?php echo $text_phone; ?> :</td>
                    <td><?php echo $career['phone'] ?></td></tr>
                </div>
              </br>
                <div><a href="<?php echo $career['apply_now']; ?>" ><?php echo $text_more; ?></a></div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $text_apply_email ?></div> 
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$careers) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>


