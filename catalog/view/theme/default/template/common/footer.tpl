<div class="footer-bg">
    	
        <div class="container-fluid">
        	
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel border-right">
                    	
                        <h5>Come visit us</h5>
                        
                        <p>Office # 10, 2nd Floor, <br />
16-A Royal Inn Plaza, F-8 Markaz</p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->
                
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel border-right">
                    	
                        <h5>Email us</h5>
                        
                        <p><a href="mailto:info@mohtaram.co">info@mohtaram.co</a><br />
<a href="mailto:appointment@mohtaram.co">appointment@mohtaram.com</a></p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->
                
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel">
                    	
                        <h5>Customer care</h5>
                        
                        <p> <a href="<?php echo HTTP_SERVER ?>index.php?route=information/sizeguide">Sizing guide</a> <br />
							<a href="<?php echo HTTP_SERVER ?>index.php?route=information/contact">Give us feedback</a>
                            </p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->        
        	
            <div class="clearfix"></div>
        </div><!--container-->
        
        <div class="copyrights">
        	
            <ul class="pull-left">
            	<li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/contact">Customer Care</a></li>            
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=4">Corporate</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=3">Privacy</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/information&information_id=5">Terms and Condition</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/sitemap">Sitemap</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>index.php?route=information/career">Careers</a></li>
                <li><a href="<?php echo HTTP_SERVER ?>appointments" onclick="window.open('<?php echo HTTP_SERVER ?>appointments', 'newwindow', 'width=300, height=250'); return false;">Appointment</a></li>
                </ul>
                
                
            	
                
                <div id="gotoTop" class="pull-right"><a href="#" class="animated hvr-bob"><img src="catalog/view/theme/default/img/top-icon.png" alt=""/></a></div>
                <ul class="pull-right social-networkf social-circlef">
                        <li><a href="https://www.instagram.com/mohtaramco/" class="icoInstagram" title="Follow us on Instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="https://www.facebook.com/mohtaramco" class="icoFacebook" title="Follow us on Facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/mohtaramco" class="icoTwitter" title="Follow us on Twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.pinterest.com/mohtaramco/" class="icoPinterest" title="Follow us on Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                        <!--<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li> -->
                    </ul>
                <div class="clear"></div>
        </div><!--copyrights-->
    	
            
    </div><!--footer bg-->
    
<?php if (!empty($modules)) { ?>

  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
<?php } ?>
</body>

<!-- External JavaScripts
	============================================= -->
    <script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
   <!--	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/plugins.js"></script>-->

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/functions.js"></script>
	
	<script>
	$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        $('html, body').animate({
          scrollTop: target.offset().top;
          return false;
      }
    }
  });
});
	</script>
<script src="catalog/view/theme/default/js/grayscale.js"></script>

</html>
