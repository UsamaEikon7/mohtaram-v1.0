<?php echo $header; ?>
    <section>
    	
        <ol class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
        </ol>
		
        <div class="container">
        	
            <div class="row">
                <div class="col-md-10 col-sm-10 col-md-offset-1 col-sm-offset-1">
                	<?php echo $content_top; ?>
                    <h2><?php echo $heading_title; ?></h2>
                    <div class="row">
                    <div class="col-sm-6">
                    <p class="pull-left"><?php echo $text_message; ?> </p>
                    </div>
                    <div class="col-sm-6">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="sign-btn hvr-bounce-to-left"><?php echo $button_continue; ?></a></div>
                    </div>
                    </div>	
                    <div class="spece"></div><div class="spece"></div>
                    
                    <div class="spece"></div>
                                        <!--post footer-->
                    
                  
                  <!--comment widget-->
                    
                </div><!--col md sm 12-->
                
                <div class="clear"></div>
                
             
            
            </div><!--row-->
        
        </div><!--container-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
<?php echo $footer; ?>
