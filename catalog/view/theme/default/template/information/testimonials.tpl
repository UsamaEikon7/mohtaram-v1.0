<?php echo $header; ?>
<script src="catalog/view/theme/default/js/jssor.slider-22.1.8.min.js"></script>
<script type="text/javascript">
        jssor_1_slider_init = function() {

            var jssor_1_SlideshowTransitions = [
              {$Duration:1200,x:0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$JssorEasing$.$EaseInCubic,$Opacity:$JssorEasing$.$EaseLinear},$Opacity:2}
			  /*{$Duration:1200,$Zoom:1,$Easing:{$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad},$Opacity:2},
              {$Duration:1000,$Zoom:11,$SlideOut:true,$Easing:{$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Zoom:1,$Rotate:1,$During:{$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Easing:{$Zoom:$Jease$.$Swing,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$Swing},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InExpo},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:0.5,$Cols:2,$Zoom:1,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:4,$Cols:2,$Zoom:11,$SlideOut:true,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.6,$Zoom:1,$Rotate:1,$During:{$Left:[0.2,0.8],$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Easing:{$Left:$Jease$.$Swing,$Zoom:$Jease$.$Swing,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$Swing},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,x:-4,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Left:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InExpo},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:-0.6,$Zoom:1,$Rotate:1,$During:{$Left:[0.2,0.8],$Zoom:[0.2,0.8],$Rotate:[0.2,0.8]},$Easing:{$Left:$Jease$.$Swing,$Zoom:$Jease$.$Swing,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$Swing},$Opacity:2,$Round:{$Rotate:0.5}},
              {$Duration:1000,x:4,$Zoom:11,$Rotate:1,$SlideOut:true,$Easing:{$Left:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InExpo},$Opacity:2,$Round:{$Rotate:0.8}},
              {$Duration:1200,x:0.5,y:0.3,$Cols:2,$Zoom:1,$Rotate:1,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1000,x:0.5,y:0.3,$Cols:2,$Zoom:1,$Rotate:1,$SlideOut:true,$Assembly:2049,$ChessMode:{$Column:15},$Easing:{$Left:$Jease$.$InExpo,$Top:$Jease$.$InExpo,$Zoom:$Jease$.$InExpo,$Opacity:$Jease$.$Linear,$Rotate:$Jease$.$InExpo},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1200,x:-4,y:2,$Rows:2,$Zoom:11,$Rotate:1,$Assembly:2049,$ChessMode:{$Row:28},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.7}},
              {$Duration:1200,x:1,y:2,$Cols:2,$Zoom:11,$Rotate:1,$Assembly:2049,$ChessMode:{$Column:19},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Zoom:$Jease$.$InCubic,$Opacity:$Jease$.$OutQuad,$Rotate:$Jease$.$InCubic},$Opacity:2,$Round:{$Rotate:0.8}}*/
            ];

            var jssor_1_options = {
              $AutoPlay: true,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Rows: 2,
                $Cols: 6,
                $SpacingX: 14,
                $SpacingY: 12,
                $Orientation: 2,
                $Align: 156
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*responsive code begin*/
            /*you can remove responsive code if you don't want the slider scales while window resizing*/
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 960);
                    refSize = Math.max(refSize, 300);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*responsive code end*/
        };
    </script>
    <style>
        /* jssor slider arrow navigator skin 05 css */
        /*
        .jssora05l                  (normal)
        .jssora05r                  (normal)
        .jssora05l:hover            (normal mouseover)
        .jssora05r:hover            (normal mouseover)
        .jssora05l.jssora05ldn      (mousedown)
        .jssora05r.jssora05rdn      (mousedown)
        .jssora05l.jssora05lds      (disabled)
        .jssora05r.jssora05rds      (disabled)
        */
        .jssora05l, .jssora05r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 40px;
            height: 40px;
            cursor: pointer;
            background: url('img/a17.png') no-repeat;
            overflow: hidden;
        }
        .jssora05l { background-position: -10px -40px; }
        .jssora05r { background-position: -70px -40px; }
        .jssora05l:hover { background-position: -130px -40px; }
        .jssora05r:hover { background-position: -190px -40px; }
        .jssora05l.jssora05ldn { background-position: -250px -40px; }
        .jssora05r.jssora05rdn { background-position: -310px -40px; }
        .jssora05l.jssora05lds { background-position: -10px -40px; opacity: .3; pointer-events: none; }
        .jssora05r.jssora05rds { background-position: -70px -40px; opacity: .3; pointer-events: none; }
        /* jssor slider thumbnail navigator skin 01 css *//*.jssort01-99-66 .p            (normal).jssort01-99-66 .p:hover      (normal mouseover).jssort01-99-66 .p.pav        (active).jssort01-99-66 .p.pdn        (mousedown)*/.jssort01-99-66 .p {    position: absolute;    top: 0;    left: 0;    width: 99px;    height: 66px;}.jssort01-99-66 .t {    position: absolute;    top: 0;    left: 0;    width: 100%;    height: 100%;    border: none;}.jssort01-99-66 .w {    position: absolute;    top: 0px;    left: 0px;    width: 100%;    height: 100%;}.jssort01-99-66 .c {    position: absolute;    top: 0px;    left: 0px;    width: 95px;    height: 62px;    border: #000 2px solid;    box-sizing: content-box;    background: url('img/t01.png') -800px -800px no-repeat;    _background: none;}.jssort01-99-66 .pav .c {    top: 2px;    _top: 0px;    left: 2px;    _left: 0px;    width: 95px;    height: 62px;    border: #000 0px solid;    _border: #fff 2px solid;    background-position: 50% 50%;}.jssort01-99-66 .p:hover .c {    top: 0px;    left: 0px;    width: 97px;    height: 64px;    border: #fff 1px solid;    background-position: 50% 50%;}.jssort01-99-66 .p.pdn .c {    background-position: 50% 50%;    width: 95px;    height: 62px;    border: #000 2px solid;}* html .jssort01-99-66 .c, * html .jssort01-99-66 .pdn .c, * html .jssort01-99-66 .pav .c {    /* ie quirks mode adjust */    width /**/: 99px;    height /**/: 66px;}
    </style>
    

<link rel="stylesheet" href="catalog/view/theme/default/custom/testimonials/css/main.css" />
<!--<ol class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  <?php } ?>
</ol> -->
<section class="about-section">
    	
        <div class="container">
        	
            <div class="row">
            	
                <div class="col-md-6 col-sm-6 pull-left">
                
                	<h2>THE GENTLEMEN’S CLUB</h2>
                    <div class="spece"></div>
                    <p class="testimonials_p">Our clients aren’t just customers: they form part of a community of the finest gentlemen, a society that is spread far and wide yet is always connected, and functions as a coherent unit, bigger and greater than the sum of its individual units. It’s a society whose members live by the Pakistani Dream and take pride in following the Mohtaram way. Each of our valued clients thus gets entitled to the worthy title of “Mohtaram”.</p>

<!-- <a href="#" class="readmore-btn hvr-bounce-to-left">VIEW HER STORY</a> -->
<!-- <div class="text-center">
	<img src="catalog/view/theme/default/img/blocklogo.png" width="100%" alt=""/> 
     </div>     -->      
                </div><!--our story-->
                
                <div class="col-md-5 col-sm-5 pull-right">
                	
                	<img src="image/testimonials/featured/2.jpg" width="100%" alt=""/> 
                
                </div><!--col md sm 6-->
                
              <div class="clear"></div>
            </div><!--row-->
        
        </div><!--container-->
        
    </section>
<section >
  
  
  
  
  <div class="footer-top">
<div class="container-fluid">
        	<div class="col-md-12 col-sm-12 logo-block">
          
             <img src="catalog/view/theme/default/img/blocklogo.png">
            
            </div>
            </div>

</div>
  <div class="row">
    	<!-- <div id="main">
						<article class="thumb">
							<a href="image/testimonials/1.png" class="image"><img src="image/testimonials/1.png" alt="" /></a>
							<!--<h2>Magna feugiat lorem</h2>-->
							<!--<p>Nunc blandit nisi ligula magna sodales lectus elementum non. Integer id venenatis velit.</p>
						</article>
						
                     
					</div>-->
	   <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:960px;height:480px;overflow:hidden;visibility:hidden;background-color:#24262e;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:240px;width:720px;height:480px;overflow:hidden;">
            <a data-u="any" href="http://www.jssor.com" style="display:none">Image Gallery with Vertical Thumbnail</a>
            <div>
                <img data-u="image" src="image/testimonials/1.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/1.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/2.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/2.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/3.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/3.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/4.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/4.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/5.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/5.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/6.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/6.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/7.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/7.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/8.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/8.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/9.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/9.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/10.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/10.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/11.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/11.png" style="width:100px;"/>
            </div>
            <div>
                <img data-u="image" src="image/testimonials/12.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/12.png" style="width:100px;"/>
            </div>
            <div>
                <img data-u="image" src="image/testimonials/13.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/13.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/14.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/14.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/15.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/15.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/16.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/16.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/17.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/17.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/18.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/18.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/19.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/19.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/20.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/20.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/21.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/21.png" style="width:100px;"/>
            </div>
            
            <div>
                <img data-u="image" src="image/testimonials/22.jpg" />
                <img data-u="thumb" src="image/testimonials/thumb/22.png" style="width:100px;"/>
            </div>
            
     
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort01-99-66" style="position:absolute;left:0px;top:0px;width:240px;height:480px;" data-autocenter="2">
            <!-- Thumbnail Item Skin Begin -->
            <div data-u="slides" style="cursor: default;">
                <div data-u="prototype" class="p">
                    <div class="w">
                        <div data-u="thumbnailtemplate" class="t"></div>
                    </div>
                    <div class="c"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora05l" style="top:0px;left:248px;width:40px;height:40px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora05r" style="top:0px;right:8px;width:40px;height:40px;" data-autocenter="2"></span>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
    
  </div>
  
</section>
<!--bredcrumbs section--> 

<?php echo $footer; ?>

			<script src="catalog/view/theme/default/custom/testimonials/js/jquery.poptrox.min.js"></script>
            <script src="catalog/view/theme/default/custom/testimonials/js/skel.min.js"></script>
			<script src="catalog/view/theme/default/custom/testimonials/js/util.js"></script>
			<script src="catalog/view/theme/default/custom/testimonials/js/main.js"></script>