$(document).ready(function() {

	// smooth scroll
	// $('a[href*=#]:not([href=#])').click(function() {
	// 	if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
	// 		var target = $(this.hash);
	// 		target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
	// 		if (target.length) {
	// 			$('html,body').animate({
	// 			  scrollTop: target.offset().top
	// 			}, 1200);
	// 			return false;
	// 		}
	// 	}
	// });
	// nav-bar 
    $(document).scroll(function() {
        if ($(this).scrollTop() > 45) {
            $('.header').addClass('fixed');
            $('.app').css('margin-top', '55px');
            $('.arrow-up').addClass('show');
        } 
        else {
            $('.header').removeClass('fixed');
            $('.app').css('margin-top', '0');
            $('.arrow-up').removeClass('show');
        }
    });
    jQuery('.btn-city').click(function() {
        jQuery('.btn-city').each(function() {
           jQuery(this).attr("disabled", false);
        });
        jQuery(this).attr("disabled", true);
        jQuery('.city-list li.city').each(function() {
            jQuery(this).removeClass('active');
        });
        jQuery(this).parents('li.city').addClass('active');
        jQuery('.online-block').fadeOut(300);
        jQuery('#online-block-' + jQuery(this).attr('city')).fadeIn(300);
    });
});

// var isNumb = false;
// $(window).scroll(function() {
// 	if (!isNumb && $(window).scrollTop() > ($('.wr_workstep').offset().top) - 200) {
			
// 		isNumb = true;
//         $('.work-step>.icons-pen').addClass('animation-icon-pen');
//         $('.work-step>.icons-list').addClass('animation-icon-list');
//         $('.work-step>.icons-brush').addClass('animation-icon-brush');
//         $('.work-step>.icons-mech').addClass('animation-icon-mech');
//         $('.work-step>.icons-play').addClass('animation-icon-play');
//         return false;
// 	};
//  });

// var isHeigth = false;
// $(window).scroll(function() {
// 	if (!isHeigth && $(window).scrollTop() > ($('.wr_portfolio').offset().top) - 200) {
			
// 		isHeigth = true;
// 		$('.portfolio-job>.icons-pen').removeClass('icons-pen_grey');
// 		setInterval(function() {
// 		     $('.portfolio-job>.icons-list').removeClass('icons-list_grey');
// 		}, 200);
//        	setInterval(function() {
// 		     $('.portfolio-job>.icons-brush').removeClass('icons-brush_grey');
// 		}, 400);
//         setInterval(function() {
// 		     $('.portfolio-job>.icons-mech').removeClass('icons-mech_grey');
// 		}, 600);
// 		return false;
// 	};
// });

// var isBusy = false, idHolder = -1, formHolder = $();
// function sendAjax(id, form, customData) {
// 	if (!isBusy && id != '') {
// 		isBusy = true;
// 		setTimeout(function() {
// 			isBusy = false;
// 		}, 1000);

// 		idHolder = id;
// 		formHolder = form;
		
// 		var dataStr = 'q=assets/snippets/ajaxHandler/ajaxHandler.php&id=' + id + customData;
// 		if (form.length != '') {
// 			dataStr += ('&' + form.serialize());
// 		}		
// 		$.ajax({
// 			type: 'post',
// 			url: ajaxUrl,
// 			data: dataStr,
// 			cache: false,
// 			success: function(result) {
// 				if (result != -1) {
// 					if (idHolder == 1 && formHolder.length > 0) {
// 						formHolder.find('input:not(input[type="hidden"]), textarea, select').val('');
// 						var thank = formHolder.data('thank');
// 						var curparent = formHolder.parent();
// 						formHolder.remove();
// 						curparent.append('<div class="success">' + thank + '</div>');
// 					}
// 				} else {
// 					alert('ajax error');
// 				}
// 			}
// 		});
// 	}	
// }