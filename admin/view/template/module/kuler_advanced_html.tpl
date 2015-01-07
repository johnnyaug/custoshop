<?php echo $header; ?><?php echo $column_left; ?>

<?php if (isset($ksb_building_mode)) { ?>
	<style type="text/css">
		#header, .breadcrumb, .box > .heading .buttons,.vtabs, #footer {
			display: none !important;
		}

		#content {
			padding: 0 !important;
		}

		.box > .content {
			background: none !important;
		}

		.vtabs-content {
			padding-left: 15px !important;
		}
	</style>
<?php } ?>
<?php if (isset($ksb_updated_module)) { ?>
<script type="text/javascript">
	var ksb_updated_module = <?php echo $ksb_updated_module; ?>;
</script>
<?php } ?>

<div id="content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<input type="hidden" name="vtab" id="vtab" value="<?php echo $vtab ?>" />
		<input type="hidden" name="htab" id="htab" value="<?php echo $htab ?>" />
		<input type="hidden" name="op" id="op" />
		<section id="kuler-module-content" class="kuler-module kuler-module-content-v1">
			<section class="wrapper">
				<?php if ($error_warning) { ?>
					<div class="alert alert-danger"><?php echo $error_warning; ?></div>
				<?php } ?>

				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb">
							<?php $breadcrumb_index = 0; ?>
							<?php foreach ($breadcrumbs as $breadcrumb) { ?>
								<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
									<?php $breadcrumb_index++; ?>
								</li>
							<?php } ?>
						</ul>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel" id="kuler-panel-action">
							<div class="panel-body">
								<div class="row">
									<div id="store-selector-container">
										<label><?php echo _t('text_current_store', 'Current Store'); ?></label>
										<select class="form-control" id="store-selector" name="store_id">
											<?php foreach ($stores as $store_id => $store_name) { ?>
												<option value="<?php echo $store_id; ?>"<?php if ($store_id == $selected_store_id) echo ' selected="selected"'; ?>><?php echo $store_name; ?></option>
											<?php } ?>
										</select>
									</div>
									<div style="float: left;">
										<label class="kuler-module-status-label"><?php echo _t('text_status', 'Status'); ?></label>
										<div style="margin: 0 15px; display: inline-block;">
											<div class="kuler-switch-btn">
												<input type="hidden" name="status" value="0" />
												<input type="checkbox" name="status" value="1"<?php if (!empty($status)) echo ' checked="checked"'; ?> />
												<span class="kuler-switch-btn-holder"></span>
											</div>
										</div>
										<button type="button" class="btn-kuler btn btn-success" id="module-adder" onclick="addModule()"><i class="fa fa-plus-circle"></i> <?php echo _t('button_add_module', 'Add Module'); ?></button>
									</div>

									<div class="pull-right main-actions">
										<a onclick="$('#form').submit();" class="btn-kuler btn btn-success"><?php echo $button_save; ?></a>
										<a href="<?php echo $cancel; ?>" class="btn-kuler btn btn-danger"><?php echo $button_cancel; ?></a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-12">
						<section class="panel" id="kuler-panel-navigation">
							<nav class="navbar" role="navigation" id="kuler-navbar-container">
								<div class="kuler-navigation-left">
									<div class="navbar-header">
										<h2><img src="view/kuler/image/icon/kuler_logo.png" /> <?php echo _t('heading_module'); ?></h2>
									</div>
								</div>
								<div class="kuler-navigation-right" id="kuler-navigation-space"></div>
							</nav>
						</section>

						<section class="panel" id="kuler-panel-section">
							<div class="panel-body">
								<div id="kuler-module-container" class="clearfix">
									<ul class="nav nav-pills nav-stacked vtabs">
										<?php $module_row = 1; ?>
										<?php foreach ($modules as $module) { ?>
											<li id="ModuleTabItem_{{tab.row}}" class="ModuleTabItem">
												<a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>">
													<?php echo $module['main_title']; ?>
													<span class="remove-element module-remover" onclick="$('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); $('.vtabs a:first').trigger('click'); return false;"><i class="fa fa-minus-circle"></i></span>
												</a>
											</li>
											<?php $module_row++; ?>
										<?php } ?>
									</ul>
									<div class="tab-content">
									<?php $module_row = 1; ?>
									<?php foreach ($modules as $module) { ?>
										<div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
										<div class="form-horizontal">
											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
												<div class="col-sm-10">
													<div class="input-group" style="margin-top: 5px;">
														<?php foreach ($languages as $language) { ?>
															<input type="text" class="form-control" name="kuler_advanced_html_module[<?php echo $module_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $module['title'][$language['language_id']]; ?>" />
															<span class="input-group-addon btn-white"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>
														<?php } ?>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_showtitle; ?></label>
												<div class="col-sm-10">
													<div class="kuler-switch-btn">
														<input type='hidden' name='kuler_advanced_html_module[<?php echo $module_row; ?>][showtitle]' value='0' />
														<input type="checkbox" name="kuler_advanced_html_module[<?php echo $module_row; ?>][showtitle]"<?php echo $module['showtitle'] ? ' checked="checked"' : '' ?>  value="1">
														<span class="kuler-switch-btn-holder"></span>
													</div>
												</div>
											</div>
											<div class="form-group" style="display: none;">
												<label class="col-sm-2 control-label"><?php echo $__['entry_module_type']; ?></label>
												<div class="col-sm-10">
													<select name="kuler_advanced_html_module[<?php echo $module_row; ?>][module_type]" class="form-control Selector ModuleTypeSelector" data-widget-type-selector="#WidgetTypeSelector_<?php echo $module_row; ?>" data-editor-panel="#EditorPanel_<?php echo $module_row; ?>" data-product-panel="#ProductPanel_<?php echo $module_row; ?>" data-related-standard=".StandardRelatedRow_<?php echo $module_row; ?>" data-related-widget=".WidgetRelatedRow_<?php echo $module_row; ?>" style="width: 150px;">
														<option value="standard"<?php if (isset($module['module_type']) && $module['module_type'] == 'standard') echo ' selected="selected"'; ?>><?php echo $__['text_standard']; ?></option>
														<option value="widget"<?php if (isset($module['module_type']) && $module['module_type'] == 'widget') echo ' selected="selected"'; ?>><?php echo $__['text_widget']; ?></option>
													</select>
												</div>
											</div>

											<div class="HtmlRelatedRow_<?php echo $module_row; ?>" id="EditorPanel_<?php echo $module_row; ?>">
												<ul class="nav nav-tabs" id="language-<?php echo $module_row; ?>">
													<?php foreach ($languages as $language) { ?>
														<li>
															<a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">
																<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>">
																<?php echo $language['name']; ?>
															</a>
														</li>
													<?php } ?>
												</ul>

												<?php foreach ($languages as $language) { ?>
													<div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
														<div class="col-sm-10">
															<textarea name="kuler_advanced_html_module[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea>
														</div>
													</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<?php $module_row++; ?>
									<?php } ?>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</section>
		</section>
	</form>
</div>

<script type="text/javascript">
    <?php $module_row = 1; ?>
    <?php foreach ($modules as $module) { ?>
    <?php foreach ($languages as $language) { ?>
    $('#description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>').summernote({
	    height: 300
    });
    <?php } ?>
    <?php $module_row++; ?>
    <?php } ?>
</script>
<script type="text/javascript">
var saveUrl = '<?php echo $action; ?>';
saveUrl = saveUrl.replace(new RegExp('&amp;', 'g'), '&');
$('#StoreSelector').on('change', function () {
    window.location = saveUrl + '&store_id=' + $(this).val();
});

var StoreId = <?php echo $selected_store_id; ?>;

var g_token = '<?php echo $token; ?>';

$.fn.tabs = function() {
	var selector = this;

	this.each(function() {
		var obj = $(this);

		$(obj.attr('href')).hide();

		$(obj).click(function() {
			$(selector).removeClass('selected')
				.parent()
				.removeClass('active');;

			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});

			$(this).addClass('selected').parent().addClass('active');

			$($(this).attr('href')).show();

			return false;
		});
	});

	$(this).show();

	$(this).first().click();
};

var Selector = (function ($) {
    return {
        init: function (selector) {
            $('body').on('change', selector, function () {
                var $selector = $(this),
                    data = $selector.data(),
                    values = $.map($selector.find('option'), function (option) {
                        return option.value;
                    });

                $.each(values, function (index, value) {
                    var prop = $.camelCase('related-' + value);

                    if (prop in data) {
                        if (value == $selector.val()) {
                            $(data[prop]).show();
                        } else {
                            $(data[prop]).hide();
                        }
                    }
                });
            });

            $(selector).trigger('change');
        }
    };
})(jQuery);

Selector.init('.Selector');

var ProductAutocomplete = (function () {
    var that;

    return {
        init: function (selector, context) {
            that = this;
            var $selector = $(selector, context || document);

            $selector.each(function () {
                var $products = $($(this).data('products')),
                    $list = $($(this).data('list'));

                that.renderItems($list, $products, that.fetchItems($products[0]));
            });

            $selector.autocomplete({
                delay: 200,
                source: function(request, response) {
                    $.ajax({
                        url: 'index.php?route=module/kuler_advanced_html/autocomplete&token='+ g_token +'&filter_name=' +  encodeURIComponent(request.term) + '&store_id=' + StoreId,
                        dataType: 'json',
                        success: function(json) {
                            response($.map(json, function(item) {
                                return {
                                    label: item.name,
                                    value: item.product_id
                                }
                            }));
                        }
                    });
                },
                select: function(event, ui) {
                    var $this = $(this),
                        $list = $($this.data('list')),
                        $products = $($this.data('products')),
                        products = that.fetchItems($products[0]);

                    for (var i = 0; i < products; i++) {
                        if (ui.item.value == products[i].id) {
                            return false;
                        }
                    }

                    products.push({
                        id: ui.item.value,
                        title: ui.item.label
                    });
                    that.renderItems($list, $products, products);

                    $products.val(JSON.stringify(products));

                    $selector.val('');

                    return false;
                },
                focus: function(event, ui) {
                    return false;
                }
            });
        },
        fetchItems: function(el) {
            return el.value ? JSON.parse(el.value) : [];
        },
        renderItems: function($list, $products, products) {
            var itemPrefix = $list.data('item-prefix'),
                i = 0,
                itemHtml = '';

            $list.empty();

            for (; i < products.length; i++) {
                itemHtml += '<div id="'+ itemPrefix + products[i].id + '" class="'+ (i % 2 ? 'odd' :'even') +'">'+ products[i].title +'<img src="view/kulercore/images/icons/icon-delete.png" data-product-id="'+ products[i].id +'"/></div>';
            }

            $list.append(itemHtml);

            $list.find('img').on('click', function () {
                var $remover = $(this),
                    oldProducts = that.fetchItems($products[0]),
                    newProducts = [];

                for (var i = 0; i < oldProducts.length; i++) {
                    if ($remover.data('productId') != oldProducts[i].id) {
                        newProducts.push(oldProducts[i]);
                    }
                }

                that.renderItems($list, $products, newProducts);

                $products.val(JSON.stringify(newProducts));
            });
        }
    };
})();

ProductAutocomplete.init('.ProductAutocomplete');

var ModuleTypeSelector = (function () {
    return {
        init: function (selector, context) {
            $(selector, context || document).on('change', function () {
                var $this = $(this);

                if ($this.val() == 'standard') {
                    $($this.data('editorPanel')).show();
                    $($this.data('productPanel')).hide();
                } else {
                    $($this.data('widgetTypeSelector')).trigger('change');
                }
            });
        }
    };
})();

ModuleTypeSelector.init('.ModuleTypeSelector')

var base = '<?php echo $base; ?>';
var ImageManager = (function () {
    return {
	    init: function (selector, context) {
		    var self = this;
		    self.$el = $(selector, context || document);

		    self.$el.bind('click', function (evt) {
			    evt.preventDefault();

			    self.showDialog($(this).data('field'), $(this).data('image'));
		    });

		    self.$el.each(function () {
			    var $this = $(this);

			    $($this.data('clear')).bind('click', function (evt) {
				    evt.preventDefault();

				    $('#' + $this.data('field')).val('');
				    $($this.data('image')).html('');
			    });
		    });
	    },
	    showDialog: function (field, image) {
		    $('#dialog').remove();

		    $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

		    var val1 = $('#' + field).val();

		    $('#dialog').dialog({
			    title: 'Image Manager',
			    close: function (event, ui) {
				    var val2 = $('#' + field).val();

				    if (val1 != val2) {
					    $('#' + field).val('image/' + val2).trigger('change');

					    if (image !== undefined) {
						    $(image).html($('<img />', {src: '<?php echo $base; ?>image/' + val2}));
					    }
				    }
			    },
			    bgiframe: false,
			    width: 700,
			    height: 400,
			    resizable: false,
			    modal: false
		    });
	    }
    };
})();

ImageManager.init('.ImageManager');

var ColorPicker = (function () {
    return {
        init: function (selector, context) {
            var CP = this;
            CP.$el = $(selector, context || document);

            CP.$el.each(function () {
                var $cpElement = $(this);
                $(this).ColorPicker({
                    color: CP.$el.data('defaultColor'),
                    onShow: function (colpkr) {
                        // recalculate position of the color picker
                        var pos = $(this).offset();

                        $(colpkr)
                            .css({
                                left: pos.left + 20,
                                top: pos.top + 20
                            })
                            .fadeIn(500);

                        return false;
                    },
                    onHide: function (colpkr) {
                        $(colpkr).fadeOut(500);
                        return false;
                    },
                    onChange: function (hsb, hex, rgb) {
                        $cpElement.find('div').css('backgroundColor', '#' + hex);
                        $($cpElement.data('backgroundColor')).val('#' + hex).trigger('change');
                    }
                });
            });
        }
    };
})();

ColorPicker.init('.ColorPicker');

var module_row = <?php echo $module_row; ?>;

function addModule() {
	var html = '';

    html  = '<div id="tab-module-' + module_row + '" class="vtabs-content"><div class="form-horizontal">';

	html += '<div class="form-group">';
	html += '	<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>';
	html += '	<div class="col-sm-10">';
	html += '		<div class="input-group" style="margin-top: 5px;">';
	html += '			<?php foreach ($languages as $language) { ?>';
	html += '				<input type="text" class="form-control" name="kuler_advanced_html_module['+ module_row +'][title][<?php echo $language['language_id']; ?>]" />';
	html += '				<span class="input-group-addon btn-white"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>';
	html += '			<?php } ?>';
	html += '		</div>';
	html += '	</div>';
	html += '</div>';

	html += '<div class="form-group">';
	html += '	<label class="col-sm-2 control-label"><?php echo $entry_showtitle; ?></label>';
	html += '	<div class="col-sm-10">';
	html += '      <div class="kuler-switch-btn">';
	html += '        <input type="hidden" name="kuler_advanced_html_module[' + module_row + '][showtitle]" value="0" />';
	html += '        <input type="checkbox" name="kuler_advanced_html_module[' + module_row + '][showtitle]" value="1" checked="checked" />';
	html += '        <span class="kuler-switch-btn-holder"></span></div>';
	html += '	</div>';
	html += '</div>';

	html += '<div class="form-group">';
	html += '	<label class="col-sm-2 control-label"></label>';
	html += '	<div class="col-sm-10">';

	html += '	</div>';
	html += '</div>';

    html += '<div class="HtmlRelatedRow_'+ module_row +'">';

	html += '<ul class="nav nav-tabs" id="language-'+ module_row +'">';
	html += '	<?php foreach ($languages as $language) { ?>';
	html += '		<li>';
	html += '			<a href="#tab-language-'+ module_row +'-<?php echo $language['language_id']; ?>">';
	html += '				<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>">';
	html += '				&nbsp;<?php echo $language['name']; ?>';
	html += '			</a>';
	html += '		</li>';
	html += '	<?php } ?>';
	html += '</ul>';

	html += '<?php foreach ($languages as $language) { ?>';
	html += '	<div id="tab-language-'+ module_row +'-<?php echo $language['language_id']; ?>" class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<textarea name="kuler_advanced_html_module['+ module_row +'][description][<?php echo $language['language_id']; ?>]" id="description-'+ module_row +'-<?php echo $language['language_id']; ?>"></textarea>';
	html += '		</div>';
	html += '	</div>';
	html += '<?php } ?>';

    html += '</div>';

    html += '</div></div>';

    $('.tab-content').append(html);

    <?php foreach ($languages as $language) { ?>
	$('#description-' + module_row + '-<?php echo $language['language_id']; ?>').summernote({
		height: 300
	});
    <?php } ?>

    $('#language-' + module_row + ' a').click(function() {
        $('#htab').val($(this).attr('href'));
    }).tabs();

	var tabHtml = '';
	tabHtml += '<li id="ModuleTabItem_{{tab.row}}" class="ModuleTabItem">';
	tabHtml += '	<a href="#tab-module-'+ module_row +'" id="module-'+ module_row +'">';
	tabHtml += '		<?php echo $tab_module; ?>';
	tabHtml += '		<span class="remove-element module-remover" onclick="$(\'#module-'+ module_row +'\').remove(); $(\'#tab-module-'+ module_row +'\').remove(); $(\'.vtabs a:first\').trigger(\'click\'); return false;"><i class="fa fa-minus-circle"></i></span>';
	tabHtml += '	</a>';
	tabHtml += '</li>';

    $('.vtabs').append(tabHtml);

    $('.vtabs a').click(function() {
        $('#vtab').val($(this).attr('href'));
    }).tabs();

    $('.Selector').trigger('change');

    $('#module-' + module_row).trigger('click');


    var $module = $('#tab-module-' + module_row);

	// Image Manager
	$module.find('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

	$module.delegate('button[data-toggle=\'image\']', 'click', function() {
		$('#modal-image').remove();

		$.ajax({
			url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
			dataType: 'html',
			beforeSend: function() {
				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
				$('#button-image').prop('disabled', true);
			},
			complete: function() {
				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
				$('#button-image').prop('disabled', false);
			},
			success: function(html) {
				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

				$('#modal-image').modal('show');
			}
		});
	});

	// Image Manager
	$module.delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();

		var element = this;

		$(element).popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});

		$(element).popover('toggle');

		$('#button-image').on('click', function() {
			$('#modal-image').remove();

			$.ajax({
				url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

					$('#modal-image').modal('show');
				}
			});

			$(element).popover('hide');
		});

		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

			$(element).parent().find('input').attr('value', '');

			$(element).popover('hide');
		});
	});

	module_row++;
}
</script>
<script type="text/javascript">
    $('.vtabs a').click(function() {
        $('#vtab').val($(this).attr('href'));
    }).tabs();
</script>
<script type="text/javascript">
    <?php $module_row = 1; ?>
    <?php foreach ($modules as $module) { ?>
    $('#language-<?php echo $module_row; ?> a').click(function() {
        $('#htab').val($(this).attr('href'));
    }).tabs();
    <?php $module_row++; ?>
    <?php } ?>

    <?php if ($vtab) { ?>
    $('.vtabs a[href="<?php echo $vtab ?>"]').click();
    <?php } ?>

    <?php if ($htab) { ?>
    $('.htabs a[href="<?php echo $htab ?>"]').click();
    <?php } ?>

    /* Kuler Site Builder */
    <?php if (isset($ksb_trigger_creation) && $ksb_trigger_creation) { ?>
    (function () {
        $('.add-element').trigger('click');
    })();
    <?php } ?>
</script>
<?php echo $footer; ?>