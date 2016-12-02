<?php echo $header; ?>
    <section>
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol>

          
          
        
        <div class="container">
        	
            <div class="row">
            			  <?php if ($success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
          <?php } ?>
          <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
          <?php } ?>
                <div class="col-md-5 col-sm-5 pull-left">
                	
                    <h2>Just getting started?</h2>
                    <div class="spece"></div>
                    <p>Creating your first custom size is easy! We provide several 
ways to create your first custom shirt size. Click here to 
find out more and get started.</p>

					<a href="<?php echo $register; ?>" class="create-btn hvr-bounce-to-left">Register</a>
                    
                </div><!--col md sm 4 5-->
                
                <div class="col-md-5 col-sm-5 pull-right">
                	
                    <h2>Already have a saved size?</h2>
                    <div class="spece"></div>
                    <p>Sign in to your account to view edit your saved sizes. If 
you’ve ordered before, we will have automatically generated 
a saved size for you.</p>
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
              <div class="form-group">
                
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control check-field" />
              </div>
              <div class="form-group">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control check-field marginnone" />
                <?php if ($redirect) { ?>
                  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <?php } ?>
                <a href="<?php echo $forgotten; ?>" class="padding-top-15"><?php echo $text_forgotten; ?></a></div>
                <a onclick="$('#form').submit();" href="javascript:void(0);" class="sign-btn hvr-bounce-to-left marginnone">Sign in</a>
              <div class="spece"></div> 
              <div class="spece"></div> 
            </form>
					
                    
                </div><!--col md sm 4 5-->
                
                <div class="clear"></div>
                
              <!--<div class="about-section">
                	
                    <h2>Headline examples of custom products</h2>
                    <div class="spece"></div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever 
since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					
                  <div class="row">  
                  
                  <div class="col-md-3 col-sm-3 tile">
                    	
                        <a href="#"><img src="img/product-img1.jpg" width="100%" alt=""/></a>
                    
                  </div><!--col md sm 3-->
                  
                  <!--<div class="col-md-3 col-sm-3 tile">
                    	
                        <a href="#"><img src="img/product-img2.jpg" width="100%" alt=""/></a>
                    
                  </div><!--col md sm 3-->
                  
                 <!-- <div class="col-md-3 col-sm-3 tile">
                    	
                        <a href="#"><img src="img/product-img3.jpg" width="100%" alt=""/></a>
                    
                  </div><!--col md sm 3-->
                  
                <!--  <div class="col-md-3 col-sm-3 tile">
                    	
                        <a href="#"><img src="img/product-img4.jpg" width="100%" alt=""/></a>
                    
                  </div><!--col md sm 3-->
					<!---->
                    <!--<div class="clear"></div>-->
                  
                <!--  </div><!--row
                  
                  <div class="clear"></div> 
                </div>--><!--about section-->
            
            </div><!--row-->
        
        </div><!--container-->
        
        <div class="clear"></div>   
             
    </section><!--bredcrumbs section-->
    


<?php echo $footer; ?>
