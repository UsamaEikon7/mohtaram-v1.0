<?php echo $header;
$i = 1; ?>
<section>
    	
       <ol class="breadcrumb">
         <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
        </ol>
        
<section class="about-section">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-10 col-sm-10 col-md-offset-1">
                	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					
                		
						  
                          <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading<?php echo $i; ?>">
                              <h4 class="panel-title pull-left">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $i; ?>" aria-expanded="false" aria-controls="collapse<?php echo $i; ?>">
                                  <?php echo $title; ?>
                                </a>
                              </h4>
                              <!--
                              <a class="collapsed pull-right" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $i; ?>" aria-expanded="false" aria-controls="collapse<?php echo $i; ?>">
                                  <img src="catalog/view/theme/default/img/plus-icon.png" width="14" height="14" alt=""/> 
                                  
                                  </a> -->
                                
                                <div class="clear"></div>
                                <?php if ($success) { ?>
                                  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    
                                  </div>
                                  <div class="clear"></div>
                                  <?php } ?>
                            </div>
                            <div id="collapse<?php echo $i; ?>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<?php echo $i; ?>">
                              <div class="panel-body">
                              	<div class="col-md-3 col-sm-3">
                    				<p><?php echo $text_num_of_position; ?> </p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p> <?php echo $num_of_position; ?></p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p><?php echo $text_type; ?> </p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p> <?php echo $type; ?></p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p><?php echo $text_contact_person; ?> </p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p> <?php echo $contact_person; ?></p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p><?php echo $text_address; ?> </p>
                                </div>
                                <div class="col-md-3 col-sm-3">
                    				<p> <?php echo $address; ?></p>
                                </div>



                                
                              	<div class="clear"></div>
                                <?php if($summery) { ?>
                                <h3> Summary </h3>
                                <?php 
								echo htmlspecialchars_decode($summery);
								//$val = ; ?>	
                                <?php } ?>
                                <?php if($description) { ?>
                                <h3> Job Description </h3>
                                <?php echo htmlspecialchars_decode($description); ?>	
                                <?php } ?>
                              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-<?php echo $i; ?>">
                                                    <?php if(isset($career_id) and $career_id == $career_id) { ?>
													<?php if ($error_name) { ?>
                                                      <div class="text-danger"><?php echo $error_name; ?></div>
                                                      <?php } ?> 
                                                    <input type="text" class="form-control check-field" placeholder="Name (required)" name="name" value="<?php if(isset($name)){ echo $name;} ?>" required="required" />
                                                    <?php if ($error_email) { ?>
                                                      <div class="text-danger"><?php echo $error_email; ?></div>
                                                      <?php } ?> 
                                                    <input type="email" class="form-control check-field" placeholder="Email (required)" name="email" value="<?php if(isset($email)){ echo $email;} ?>" required="required" />
                                                    <?php if ($error_phone) { ?>
                                                      <div class="text-danger"><?php echo $error_phone; ?></div>
                                                      <?php } ?> 
                                                    <input type="text" class="form-control check-field" placeholder="Phone (required)" name="phone" value="<?php if(isset($phone)){ echo $phone;} ?>" required="required" />
                                                    <?php if ($error_upload_resume) { ?>
                                                      <div class="text-danger"><?php echo $error_upload_resume; ?></div>
                                                      <?php } ?> 
                                                    <?php }else{ ?>
                                                    
                                                    <input type="text" class="form-control check-field" placeholder="Name (required)" name="name" value="<?php if(isset($name)){ echo $name;} ?>" required="required" />
                                                     
                                                    <input type="email" class="form-control check-field" placeholder="Email (required)" name="email" value="<?php if(isset($email)){ echo $email;} ?>" required="required" />
                                                    
                                                    <input type="number" class="form-control check-field" placeholder="Phone (required)" name="phone" value="<?php if(isset($phone)){ echo $phone;} ?>" required="required" />
                                                    
                                                     <?php } ?>  
                                                    <input type="file" class="form-control check-field bordernone paddingnone her-tag" name="upload_resume" value="" />
                                                    
                                                    <input class="send-btn pull-left" type="submit" value="Send" />
                                                    
                                                    <div class="clear"></div>
                                                    
                                                </form>
                              </div>
                            </div>
                          </div>
                           
                          
                         
  
 
					</div>
                   
                </div><!--our story-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section>
</section>


<?php echo $footer; ?>







