jQuery(document).ready(function($) {

	$('.menu-icon').click( function() {
		$('.menu-holder').toggleClass('opened');
    $('header').toggleClass('menu-opened');
    $('.introtop, .page-container ').toggleClass('menu-opened-item');
		$(this).toggleClass('cliked');
	});
	$('.tabs').on('toggled', function (event, tab) {
	  $('.tabs-thumb').addClass('animated fadeIn');
	  $('.tabs-text h2,.tabs-text p').addClass('animated bounceInRight');
	});

	


	// portfolio fixes

	// var portheight = $('.ff-items').height();
	// $('.ff-items').css('height', portheight);
	$('.ff-items li').hover(function() {
		$(this).parent().find('.more-plus').toggleClass('animated hinge');
	})

	// team tricks

	$('.team-item').click(function(){
			var team_id = $(this).attr('data-team');

			$('.team-item').removeClass('current');
			$('.team-content').removeClass('current');

			$(this).addClass('current');
			$("#team"+team_id).addClass('current');
		})

	$('#view-map').click(function() {
		$('.contact-info').addClass('makesmall');
		return false;
	});

	// smooth scrolling
    
    $(function() {
      $('a[href*=#]:not([href=#])').click(function() {
      
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        	var sectiontitle = $(this).attr("href").replace("#", "");
          var target = $('*[data-name="'+ sectiontitle + '"]');
          // target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top -100
            }, 1000);
            return false;
           
          }
        }
      });
    });

    // go to services for mobile

    $(function() {
      $('.touch .tabs dd a').click(function() {
          var target = $('.tabs-content');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
           
          }       
      });
    });

    // go to team item for mobile

    $(function() {
      $('.touch .team-item').click(function() {
          var target = $('.team-item-holder');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
           
          }       
      });
    });

    $(window).scroll(function() {
    	var height = $(window).scrollTop();
    	
        var firstsectiona = $('.menu li a').first().attr('href').replace("#", "");
        var firstsection = $('*[data-name="'+ firstsectiona + '"]').offset().top;
        if(height  > firstsection) {
            $('.menu-icon').addClass('scrolled');
            $('.menu-icon').click( function() {
            	$(this).toggleClass('scrolled');
            });
        }
        else {
        	$('.menu-icon').removeClass('scrolled');
        }
    });

    


	
});