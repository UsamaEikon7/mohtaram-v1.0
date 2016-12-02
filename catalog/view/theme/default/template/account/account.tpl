<?php echo $header; ?>
<section class="about-section nopadding">

  <ol class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ol>
  
 
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
      <?php } ?>
      
      <div class="clear"></div><div class="spece"></div>
      
      <div class="col-md-6 col-sm-6 pull-left">
          <h3 ><?php echo $text_my_account; ?></h3>          
          <p>
            <a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a><br />
            <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a><br />
            <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a>
            <a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
			 <?php if ($credit_cards) { ?>
                <?php foreach ($credit_cards as $credit_card) { ?>
                <a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a><br />
                <?php } ?>
              <?php } ?>
          </p>
      </div><!--our story-->
      
      <div class="col-md-6 col-sm-6 pull-left">
                    
        <h3 ><?php echo $text_my_orders; ?></h3>
        <p>
            <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a><br />
            <?php if ($reward) { ?>
            <a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a><br />
            <?php } ?>
            <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a><br />
            <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a><br />
            <a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a><br />
        </p>
                                        
      </div><!--our story-->
      
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

</section>
<?php echo $footer; ?> 