<!DOCTYPE html>

<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<!-- Geenral/Common CSS -->
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/hover.css"/>
<link rel="stylesheet" href="catalog/view/theme/default/css/font-icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/css/animate.css" type="text/css" />
<?php
if(isset($in_specimen)){
 ?>
<link rel="stylesheet" href="catalog/view/theme/default/specimen_files/specimen_stylesheet.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="catalog/view/theme/default/css/stylesheet.css" type="text/css" charset="utf-8" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/grayscale.css"/>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/custom.css"/>

<!-- <script type="text/javascript" src="catalog/view/theme/default/js/jquery.js"></script> -->
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>

<!-- <script src="catalog/view/theme/default/js/jquery.bxslider.min.js"></script> -->

<!-- SPecific CSS -->
<!-- Reserved for extensio and backend processed -->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php if(!empty($analytics)){
		foreach ($analytics as $analytic) { ?>
<?php 		echo $analytic; ?>
<?php }
}?>
<!-- end for reserved for extensio and backend processes -->

<script>
    $(document).ready(function() {  
		var stickyNavTop = $('.nav').offset().top;  
		//  alert('stickyNavTop = '+stickyNavTop);
		stickyNavTop	=	stickyNavTop * 1.5;  
		var stickyNav = function(){  
		//alert('stickyNav = '+stickyNav);
		  
		var scrollTop = $(window).scrollTop();  
		//alert('scrollTop = '+scrollTop);
		
		if (scrollTop > stickyNavTop) { 
			//alert('Blah Bah');  
			$('.header').addClass('sticky',{duration:1500});  
		} else {  
			$('.header').removeClass('sticky',{duration:1500});   
		}  
		};  
		  
		//stickyNav();  
		  
		//$(window).scroll(function() {  
			//alert('Blah');
			//stickyNav();
		//});  
		});  
</script>
<!-- This is the end of importing files into the template -->
</head>
<body class="stretched <?php echo $class; ?> <?php if(isset($body_class)){echo $body_class;} ?>">
<div class="topheader header">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3 col-sm-5 col-xs-12" id="search"> <?php echo $search; ?> </div>
      <!--col md sm 3-->
      <div class="col-md-6 col-sm-2 col-xs-4 text-center">
        <?php if ($logo) { ?>
        <a class="navbar-brand logo" href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>"/></a> <a class="navbar-brand sticky-logo" href="<?php echo $home; ?>"><img src="catalog/view/theme/default/img/sticky-logo.png" alt="<?php echo $name; ?>" title="<?php echo $name; ?>"/></a>
        <?php }else { ?>
        <a class="navbar-brand logo" href="<?php echo $home; ?>"><img src="catalog/view/theme/default/img/logo.png" alt="<?php echo $name; ?>" title="<?php echo $name; ?>"/></a> <a class="navbar-brand sticky-logo" href="<?php echo $home; ?>"><img src="catalog/view/theme/default/img/sticky-logo.png" alt="<?php echo $name; ?>" title="<?php echo $name; ?>"/></a>
        <?php } ?>
      </div>
      <div class="col-md-3 col-sm-5 col-xs-8 social-links"> <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>" id="cart"><span id="cart-total"><?php echo $cart; ?></span><i class="fa fa-shopping-cart"></i> </a> 
        <!--<a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">Wishlist <i class="fa fa-heart"></i></a> --> 
        <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">Checkout <i class="fa fa-share"></i> </a> <a href="<?php echo $account; ?>" class=" dropdown dropdown-toggle" data-toggle="dropdown" > Account <i class="fa fa-user"></i></a>
        <ul class="dropdown-menu dropdown-menu-right">
          <?php if ($logged) { ?>
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <!--<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                    <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li> -->
          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          <?php } else { ?>
          <?php if(isset($ishome) and $ishome == 1) { ?>
          <!--href=""-->
          <li><a  href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
          <!--href=""-->
          <li><a  href="<?php echo $login; ?>" ><?php echo $text_login; ?></a></li>
          <?php }else { ?>
          <!--href="<?php //echo $register; ?>"-->
          <li><a  href="#loginpopupt_form" class="loginpopupt"><?php echo $text_register; ?></a></li>
          <!--href="<?php //echo $login; ?>"-->
          <li><a  href="#loginpopupt_form" class="loginpopupt" ><?php echo $text_login; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <!--<a href="<?php echo $contact; ?>"> Help <i class="fa fa-comment"></i></a>--> 
        <!--<a href="#"> Blog <i class="fa fa-feed"></i></a> -->
        
        <div class="clear"></div>
      </div>
      <!--col md sm 3--> 
      
    </div>
    <!--row--> 
    
  </div>
  <!--conainer-->
  <div class="container-fluid">
    <div class="row">
      <nav class="navbar navbar-default">
        <div class="container">
          <div class="row">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav text-center">
                <?php if ($categories) { ?>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children']) { ?>
                
			<?php if ($logged) { ?>
			<li class="dropdown">
			<?php } else { ?>
			 <li class="dropdown style:display:none"><li id="welcome">
			<?php } ?>
			<a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                  <div class="dropdown-menu">
                    <div class="dropdown-inner">
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                      <ul class="list-unstyled">
                        <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                    </div>
                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                </li>
                <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
                <?php } ?>
                <!--  Here we can add other menu links-->
              </ul>
            </div>
            <!-- /.navbar-collapse --> 
            
          </div>
          <!--row--> 
        </div>
        <!--conainer--> 
      </nav>
    </div>
    <!--row--> 
    
  </div>
  <!--conainer-->
  
  <div class="clear"></div>
</div>
<!--topheader--> 

