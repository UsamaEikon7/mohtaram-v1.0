<?php
 echo $header; ?>
             
    <?php
	echo $banner;
	 ?><!--slider-->
                  

      

    
    <!--  jobs stuff start here -->
    <section class="about-section">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-8 col-sm-8 col-md-offset-2">
                	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<?php 
					if(!empty($careers)) {
					$i = 1;
					 foreach ($careers as $career) {
						?>
                	
                          <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading<?php echo $i; ?>">
                              <h4 class="panel-title pull-left">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $i; ?>" aria-expanded="false" aria-controls="collapse<?php echo $i; ?>">
                                  <?php echo $career['title']; ?>
                                </a>
                              </h4>
                              
                              <a class="collapsed pull-right" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $i; ?>" aria-expanded="false" aria-controls="collapse<?php echo $i; ?>">
                                  <img src="catalog/view/theme/default/img/plus-icon.png" width="14" height="14" alt=""/> 
                                  
                                  </a>
                                
                                <div class="clear"></div>
                            </div>
                            <div id="collapse<?php echo $i; ?>" class="panel-collapse collapse<?php if(isset($career_id) and $career_id == $career['career_id']){echo " in";} ?>" role="tabpanel" aria-labelledby="heading<?php echo $i; ?>">
                              <div class="panel-body">
                                
                                <?php echo $career['description']; ?>	
                                <div class="clear"></div>
                                <a href="<?php echo $career['apply_now']; ?>" class="send-btn pull-left" > Apply Now </a>
                              	
                              </div>
                            </div>
                          </div>
                           <?php $i++; }
					 ?>
                     <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        			 <div class="col-sm-6 text-right"><?php // print_r($results); ?></div>
                     <?php 
					}else {?>
                    	
                    <div class="panel panel-default">
                    	<div class="panel-body">
                              <p> No listing found. </p>  
                        </div>         
                    </div>
                    <?php } ?>      
                         
  
 
					</div>
                   
                </div><!--our story-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section><!--story-section-->
    <?php echo $footer; ?>