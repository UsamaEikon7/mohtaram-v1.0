<?php echo $header; ?>
 <section>
    	<!--
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol> -->
		
        <section class="about-section about-main-page">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-5 col-sm-6 pull-left">
                
                	<h2><?php echo $heading_title; ?></h2>
                    <div class="spece"></div>
                    <?php echo $description; ?>
					<div class="spece"></div>
                    <div class="spece"></div>
                    <a href="<?php echo HTTP_SERVER ?>index.php?route=information/brandstory" class="readmore-btn hvr-bounce-to-left">OUR STORY</a>
                    
                    <!--<div class="spece"></div><div class="spece"></div><div class="spece"></div>
                    <p>Other pages of interests:<br />
                    <a href="<?php echo HTTP_SERVER ?>index.php?route=information/career">Careers</a><br />
                    <a href="<?php echo HTTP_SERVER ?>index.php?route=information/contact">Help</a><br />
                    <a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=5">Legal Informations</a>
                    </p>
                -->
                </div><!--our story-->
                
                <div class="col-md-6 col-sm-6 position pull-right home-about-fixes">
                	<h2>&nbsp; </h2>
                	<!-- class="big-image" -->
                    <div ><img src="image/catalog/goingglobal1.png" alt="" style="float: right;
width: 72%;"/></div><!--big image-->
                    
                  <!--  <div class="video-box"><img src="image/catalog/goingglobal2.jpg" alt=""/><a href="#" class="play-icon"><img src="img/play-icon.png" alt=""/></a></div><!--video-box-->
                    
                    <!--<div class="small-image"><img src="image/catalog/goingglobal3.jpg" alt=""/></div><!--small image-->

              </div><!--col md sm 6-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section><!--story-section-->
        
        <div class="clear"></div>        
    </section><!--bredcrumbs section-->
    


<?php echo $footer; ?>