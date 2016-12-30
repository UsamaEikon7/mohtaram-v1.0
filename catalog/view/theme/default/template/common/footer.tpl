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
                        
                        <p><a href="#">info@mohtaram.co</a><br />
<a href="#">appointment@mohtaram.com</a></p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->
                
            <div class="col-md-4 col-sm-4 padding0 text-center">
                	
                    <div class="footer-panel">
                    	
                        <h5>Customer care</h5>
                        
                        <p><a href="#">Sizing guide</a> <br />
<a href="#">Give us feedback</a></p>
                    
                    </div><!--content-->
                    
                </div><!--col md sm 4-->        
        	
            <div class="clearfix"></div>
        </div><!--container-->
        
        <div class="copyrights">
        	
            <ul class="pull-left">
            	<li><a href="#">Customer Care</a></li>            
                <li><a href="#">Corporate</a></li>
                <li><a href="#">Follow us on</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Store Locator</a></li>
                <li><a href="#">Careers</a></li>
                </ul>
            	
                
                <div id="gotoTop" class="pull-right"><a href="#" class="animated hvr-bob"><img src="catalog/view/theme/default/img/top-icon.png" alt=""/></a></div>
                
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
      alert('Blah blah');
	  if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 'slow');
        return false;
      }
    }
  });
});
	</script>
<script src="catalog/view/theme/default/js/grayscale.js"></script>

</html>
