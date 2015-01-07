Kuler.waitHtml = '<i class="fa fa-circle-o-notch fa-spin wait"></i>';

(function () {
	var $notification = $('#notification'),
		timer;

	if (Kuler.show_custom_notification) {
		Kuler.notification_show_time = parseInt(Kuler.notification_show_time) || 2500;
	}

	function kulerAlert(type, message) {
		if (!$notification.length) {
			$notification = $('#notification');
		}

		clearTimeout(timer);

		$notification
			.html('<div class="'+ type +'">' + message + '</div>');

		if (Kuler.show_custom_notification) {
			$notification
				.addClass('active')
				.children()
					.css('display', 'none')
					.fadeIn('slow', function () {
						timer = setTimeout(function () {
							$notification.removeClass('active');
						}, Kuler.notification_show_time);
					});
		} else {
			$('html, body').animate({ scrollTop: 0 }, 'slow');
		}
	}

	window.kulerAlert = kulerAlert;
})();

cart.add = function(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		beforeSend: function() {
			$('#cart > button').button('loading');
		},
		success: function(json) {
			$('#cart > button').button('reset');

			if (json['redirect']) {
				location = json['redirect'];
			}

			if (json['success']) {
				kulerAlert('success', json['success']);
				Kuler.cart_product_total += quantity;

				$('#cart-total').html(json['total']);
				$('.cart-product-total-number').text(Kuler.cart_product_total);

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
};

wishlist.add = function(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				kulerAlert('success', json['success']);
			}

			if (json['info']) {
				kulerAlert('info', json['info']);
			}

			$('#wishlist-total').html(json['total']);
		}
	});
};

compare.add = function(product_id) {
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['success']) {
				kulerAlert('success', json['success']);

				$('#compare-total').html(json['total']);
			}
		}
	});
};

if (Kuler.show_quick_view) {
    function initQuickView(selector) {
	    $(selector).on('click', function (evt) {
		    evt.preventDefault();

		    var $el = $(this);

		    $.magnificPopup.open({
			    items: {
				    src: this.href || $el.data('href')
			    },
			    type: 'iframe',
			    mainClass: 'mfp-fade'
		    });
        });
    };
}

jQuery(document).ready(function ($) {
	var $window = $(window);

	// Fixed Header
	if (Kuler.fixed_header) {
        $(".header").headroom({
            "offset": 41,
            classes : {
                // when element is initialised
                initial : "headerfix",
                // when scrolling up
                pinned : "headerfix--pinned",
                // when scrolling down
                unpinned : "headerfix--unpinned",
                // when above offset
                top : "headerfix--top",
                // when below offset
                notTop : "headerfix--not-top"
            }
        });
	}

    // Currency
    $('#currency a').on('click', function(e) {
        e.preventDefault();

        $('#currency input[name=\'currency_code\']').attr('value', $(this).attr('href'));

        $('#currency').submit();
    });

    // Language
    $('#language a').on('click', function(e) {
        e.preventDefault();

        $('#language input[name=\'language_code\']').attr('value', $(this).attr('href'));

        $('#language').submit();
    });

    var $dropdownContainer = $('.dropdown-container');

    $dropdownContainer.find('.dropdown-toggle').on('click', function () {
        $(this).next().toggleClass('open');
    });

    $('body').on('click', function (evt) {
        if (!$(evt.target).parents('.dropdown-container').length) {
            $('#language, #currency, .links').find('.open').removeClass('open');
        }
    });

	// Quick View
	if (Kuler.show_quick_view) {
        initQuickView('.quick-view a');

        setTimeout(function () {
            initQuickView('.quick-view a');
        }, 1000);
	}

	// Newsletter
	if (Kuler.show_newsletter) {
		$('#newsletter-form').on('submit', function () {
			var $mail = $('#newsletter-mail'),
				$button = $('#newsletter-submit'),
				mail = $mail.val();

			if (!mail) {
				return false;
			}

			$mail.prop('disabled', true);
			$button.prop('disabled', true);
			$button.after(Kuler.waitHtml);

			$.post(Kuler.newsletter_subscribe_link, {
				mail: mail
			}, function (data) {
				var type = data.status ? 'success' : 'error';

				kulerAlert(type, data.message);

				$mail.prop('disabled', false);
				$button.prop('disabled', false);

				$button.next().remove();
			}, 'json');

			return false;
		});
	}

	//Smooth scroll to on page element
    $(".review a").click(function(event){
        event.preventDefault();
        //calculate destination place
        var dest=0;
        if($(this.hash).offset().top > $(document).height()-$(window).height()){
            dest=$(document).height()-$(window).height();
        } else {
            dest=$(this.hash).offset().top;
        }
        //go to destination
        $('html,body').animate({scrollTop:dest}, 500,'swing');
     });

	// Login Popup
	if (Kuler.login_popup) {
		$('a').each(function () {
			if (this.href == Kuler.login_url) {
				$(this).on('click', function (evt) {
					evt.preventDefault();

					$.magnificPopup.open({
						items: [
							{
								src: '#login-popup'
							}
						],
						type: 'inline',
						mainClass: 'mfp-fade'
					});
				});
			}
		});
	}

	var $popupLoginForm = $('#popup-login-form');
	$popupLoginForm.on('submit', function (evt) {
		evt.preventDefault();

		$.ajax({
			url: Kuler.popup_login_url,
			type: 'POST',
			dataType: 'json',
			data: $popupLoginForm.serialize(),
			beforeSend: function () {
				$popupLoginForm.find('[type="submit"]').after(Kuler.waitHtml);
				$popupLoginForm.find('.warning').remove();
			},
			complete: function () {
				$popupLoginForm.find('.wait').remove();
			},
			success: function (data) {
				if (data.status) {
					location.reload();
				} else {
					$popupLoginForm.prepend('<div class="warning">'+ data.message +'</div>');
				}
			}
		})
	});

	// Scroll up
	if (Kuler.enable_scroll_up) {
		var $scrollup = $('.scrollup');

		$window.scroll(function() {
			if ($window.scrollTop() > 100) {
				$scrollup.addClass('show');
			} else {
				$scrollup.removeClass('show');
			}
		});

		$scrollup.on('click', function(evt) {
			$("html, body").animate({ scrollTop: 0 }, 600);
			evt.preventDefault();
		});
	}

	if (Kuler.category_menu_type === 'accordion') {
		var $boxCategory = $('.box-category');

		$('.box-category .toggle').on('click', function () {
			var $this = $(this);

			$boxCategory
				.find('li.active')
					.removeClass('active')
					.find('ul')
						.slideUp();
			$this.next().slideDown();
			$this.parent().addClass('active');
		});
	}

	// Setup mobile main menu
    $('#btn-mobile-toggle').on('click', function () {
        var $btn = $(this);

        if ($btn.hasClass('expand')) {
            $btn.removeClass('expand')
                .next().slideUp();
        } else {
            $btn.addClass('expand')
                .next()
                .slideDown();
        }
    });

    $('.btn-expand-menu').on('click', function () {
        var $btn = $(this);

        if ($btn.parent().hasClass('expand')) {
            $btn.next().slideUp().parent().removeClass('expand');
        } else {
            $btn.next().slideDown().parent().addClass('expand');
        }
    });

    $('.product-layout').mouseover(function(){
        $(this).addClass('over').removeClass('out');
    });

    $('.product-layout').mouseleave(function(){
        $(this).removeClass('over').addClass('out');
    });
});
