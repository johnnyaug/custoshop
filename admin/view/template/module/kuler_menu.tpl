<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
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
										<button class="btn-kuler btn btn-success" id="ModuleAdder" ng-click="addModule()"><i class="fa fa-plus-circle"></i> <?php echo $button_add_menu_item; ?></button>
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
								<div vertical="true" main-tab="true" type="pills" id="kuler-module-container" class="clearfix ng-isolate-scope">
									<ul class="nav nav-pills nav-stacked" id="ModuleTabItems"></ul>
									<div class="tab-content" id="ModuleContainer">

									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</section>
			<div id="kuler-loader" ng-if="loading"></div>
		</section>
	</form>
</div>

	<script id="ModuleTabTemplate" type="text/x-handlebars-template">
		<li id="ModuleTabItem_{{tab.row}}" class="ModuleTabItem">
			<a href="#Module_{{tab.row}}" id="ModuleTab_{{tab.row}}" data-tab="{{tab.row}}" data-row="{{tab.row}}">
				<b id="ModuleTabTitle_{{tab.row}}">{{languageText tab.title <?php echo $language_id; ?>}}</b>
				<span class="remove-element module-remover ModuleRemover" data-module="{{tab.row}}"><i class="fa fa-minus-circle"></i></span>
			</a>
		</li>
	</script>
	<script id="ModuleTemplate" type="text/x-handlebars-template">
		<div id="Module_{{menu.row}}" class="vtabs-content">
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_status') ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][status]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][status]" value="1"{{#compare menu.status 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_title'); ?></label>
					<div class="col-sm-10">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group" style="margin-top: 5px;">
								<input type="text" class="form-control" <?php if ($language['language_id'] == $language_id) { ?>class="ModuleTitle" data-module-row="{{menu.row}}" <?php } ?>name="menus[{{menu.row}}][title][<?php echo $language['language_id']; ?>]" value="{{languageText menu.title <?php echo $language['language_id']; ?>}}" />
								<span class="input-group-addon btn-white"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_sort_order'); ?></label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="menus[{{menu.row}}][sort_order]" value="{{menu.sort_order}}" size="5" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_module_type'); ?></label>
					<div class="col-sm-10">
						<select name="menus[{{menu.row}}][type]" class="MenuTypeSelector form-control" data-row="{{menu.row}}" style="width: 150px;">
							<option value="category"{{#compare menu.type 'category' operator='=='}} selected="selected"{{/compare}}>Category</option>
							<option value="product"{{#compare menu.type 'product' operator='=='}} selected="selected"{{/compare}}>Product</option>
							<option value="custom"{{#compare menu.type 'custom' operator='=='}} selected="selected"{{/compare}}>Custom</option>
							<option value="html"{{#compare menu.type 'html' operator='=='}} selected="selected"{{/compare}}>HTML</option>
						</select>
					</div>
				</div>
			</div>

			<div id="OptionTypeContainer_{{menu.row}}">
				{{menuType menu}}
			</div>
		</div>
	</script>
	<script id="OptionCategoryTemplate" type="text/x-handlebars-template">
		<div class="form-horizontal">
			<fieldset>
				<legend>
					<?php echo _t('text_menu_item_setting'); ?>
				</legend>
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo _t('entry_enable_hyperlink'); ?></label>
						<div class="col-sm-10">
							<div class="kuler-switch-btn">
								<input type="hidden" name="menus[{{menu.row}}][enable_hyperlink]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][enable_hyperlink]" value="1"{{#compare menu.enable_hyperlink 1}} checked="checked"{{/compare}} class="OptionToggle" data-option=".RowRelatedHyperLink_{{menu.row}}" />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
					</div>
					<div class="form-group RowRelatedHyperLink_{{menu.row}}">
						<label class="col-sm-2 control-label"><?php echo _t('entry_url'); ?></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menus[{{menu.row}}][link]" value="{{menu.link}}" />
						</div>
					</div>
					<div class="form-group RowRelatedHyperLink_{{menu.row}}">
						<label class="col-sm-2 control-label"><?php echo _t('entry_open_in_new_tab'); ?></label>
						<div class="col-sm-10">
							<div class="kuler-switch-btn">
								<input type="hidden" name="menus[{{menu.row}}][new_tab]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][new_tab]" value="1"{{#compare menu.new_tab 1}} checked="checked"{{/compare}} />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend><?php echo $text_category_display_setting; ?></legend>
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_category_image; ?></label>
						<div class="col-sm-2">
							<div class="kuler-switch-btn" style="display: inline-block; top: 5px;">
								<input type="hidden" name="menus[{{menu.row}}][image]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][image]" value="1"{{#compare menu.image 1}} checked="checked"{{/compare}} />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
						<div class="col-sm-3">
							<select name="menus[{{menu.row}}][image_position]" class="form-control">
								<option value="float-left"{{#compare menu.image_position 'float-left'}} selected="selected"{{/compare}}><?php echo _t('text_float_left'); ?></option>
								<option value="float-right"{{#compare menu.image_position 'float-right'}} selected="selected"{{/compare}}><?php echo _t('text_float_right'); ?></option>
								<option value="no-float"{{#compare menu.image_position 'no-float'}} selected="selected"{{/compare}}><?php echo _t('text_no_float'); ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_category_description; ?></label>
						<div class="col-sm-10">
							<div class="kuler-switch-btn" style="display: inline-block; top: 5px;">
								<input type="hidden" name="menus[{{menu.row}}][description]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][description]" value="1"{{#compare menu.description 1}} checked="checked"{{/compare}} />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo _t('entry_show_sub_categories'); ?></label>
						<div class="col-sm-10">
							<div class="kuler-switch-btn">
								<input type="hidden" name="menus[{{menu.row}}][show_sub_categories]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][show_sub_categories]" value="1"{{#compare menu.show_sub_categories 1}} checked="checked"{{/compare}} />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo _t('entry_description_text'); ?></label>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="menus[{{menu.row}}][description_text]" value="{{menu.description_text}}" size="5" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo _t('entry_category_dimension'); ?></label>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="menus[{{menu.row}}][category_image_width]" value="{{menu.category_image_width}}" size="5" />
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="menus[{{menu.row}}][category_image_height]" value="{{menu.category_image_height}}" size="5" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_max_subcategory_items; ?></label>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="menus[{{menu.row}}][max_subcategory_items]" size="5" value="{{menu.max_subcategory_items}}" />
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend><?php echo $text_categories; ?></legend>
				<table class="table table-striped">
					<tbody id="CategoryRows_{{menu.row}}">
					</tbody>
					<tfoot>
					<tr>
						<td width="500"></td>
						<td class="left"><a href="#add-category" class="btn btn-kuler btn-success CategoryAdder" data-module="{{menu.row}}"><?php echo $button_add_category; ?></a></td>
					</tr>
					</tfoot>
				</table>
			</fieldset>
		</div>
	</script>

	<script id="OptionProductTemplate" type="text/x-handlebars-template">
		<div class="form-horizontal">
			<fieldset>
				<legend><?php echo _t('text_menu_item_setting'); ?></legend>
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo _t('entry_enable_hyperlink'); ?></label>
						<div class="col-sm-10">
							<div class="kuler-switch-btn">
								<input type="hidden" name="menus[{{menu.row}}][enable_hyperlink]" value="0" />
								<input type="checkbox" name="menus[{{menu.row}}][enable_hyperlink]" value="1"{{#compare menu.enable_hyperlink 1}} checked="checked"{{/compare}} class="OptionToggle" data-option=".RowRelatedHyperLink_{{menu.row}}" />
								<span class="kuler-switch-btn-holder"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_url'); ?></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="menus[{{menu.row}}][link]" value="{{menu.link}}" />
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_open_in_new_tab'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][new_tab]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][new_tab]" value="1"{{#compare menu.new_tab 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend><?php echo $text_product_display_setting; ?></legend>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_dimension; ?></label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="menus[{{menu.row}}][image_width]" value="{{menu.image_width}}" size="5" placeholder="<?php echo $text_width; ?>" />
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="menus[{{menu.row}}][image_height]" value="{{menu.image_height}}" size="5" placeholder="<?php echo $text_height; ?>" />
					</div>
					{{#isTrue 'g_errorProductImages' menu.row}}
					<p class="error">{{prop 'g_errorProductImages' menu.row}}</p>
					{{/isTrue}}
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_name; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][name]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][name]" value="1"{{#compare menu.name 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_price; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][price]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][price]" value="1"{{#compare menu.price 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_rating; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][rating]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][rating]" value="1"{{#compare menu.rating 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_description; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][description]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][description]" value="1"{{#compare menu.description 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_add_to_cart; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][add]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][add]" value="1"{{#compare menu.add 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_wish_list; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][wishlist]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][wishlist]" value="1"{{#compare menu.wishlist 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_product_compare; ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][compare]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][compare]" value="1"{{#compare menu.compare 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend><?php echo $text_products; ?></legend>
				<table class="table table-striped">
					<tbody id="ProductRows_{{menu.row}}">
					</tbody>
					<tfoot>
					<tr>
						<td width="500"></td>
						<td class="left">
							<a href="#add-product" class="btn btn-kuler btn-success ProductAdder" data-module="{{menu.row}}"><?php echo $button_add_product; ?></a>
						</td>
					</tr>
					</tfoot>
				</table>
			</fieldset>
		</div>
	</script>

	<script id="OptionCustomTemplate" type="text/x-handlebars-template">
		<div class="form-horizontal">
			<fieldset>
				<legend><?php echo _t('text_menu_item_setting'); ?></legend>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_enable_hyperlink'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][enable_hyperlink]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][enable_hyperlink]" value="1"{{#compare menu.enable_hyperlink 1}} checked="checked"{{/compare}} class="OptionToggle" data-option=".RowRelatedHyperLink_{{menu.row}}" />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_url'); ?></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="menus[{{menu.row}}][link]" value="{{menu.link}}" />
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_open_in_new_tab'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][new_tab]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][new_tab]" value="1"{{#compare menu.new_tab 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend><?php echo $text_links; ?></legend>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_open_in_new_tab'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][sub_new_tab]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][sub_new_tab]" value="1"{{#compare menu.sub_new_tab 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<table class="table table-striped">
					<thead>
					<tr>
						<td><?php echo $entry_sub_menu_item; ?></td>
						<td><?php echo _t('entry_url'); ?></td>
						<td></td>
					</tr>
					</thead>
					<tbody id="CustomRows_{{menu.row}}">

					</tbody>
					<tfoot>
					<tr>
						<td colspan="2"></td>
						<td width="150">
							<a href="#add-custom" class="btn btn-kuler btn-success CustomAdder" data-module="{{menu.row}}"><?php echo $button_add_link; ?></a>
						</td>
					</tr>
					</tfoot>
				</table>
			</fieldset>
		</div>
	</script>

	<script id="OptionHtmlTemplate" type="text/x-handlebars-template">
		<div class="form-horizontal">
			<fieldset>
				<legend><?php echo _t('text_menu_item_setting'); ?></legend>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo _t('entry_enable_hyperlink'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][enable_hyperlink]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][enable_hyperlink]" value="1"{{#compare menu.enable_hyperlink 1}} checked="checked"{{/compare}} class="OptionToggle" data-option=".RowRelatedHyperLink_{{menu.row}}" />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_url'); ?></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="menus[{{menu.row}}][link]" value="{{menu.link}}" />
					</div>
				</div>
				<div class="form-group RowRelatedHyperLink_{{menu.row}}">
					<label class="col-sm-2 control-label"><?php echo _t('entry_open_in_new_tab'); ?></label>
					<div class="col-sm-10">
						<div class="kuler-switch-btn">
							<input type="hidden" name="menus[{{menu.row}}][new_tab]" value="0" />
							<input type="checkbox" name="menus[{{menu.row}}][new_tab]" value="1"{{#compare menu.new_tab 1}} checked="checked"{{/compare}} />
							<span class="kuler-switch-btn-holder"></span>
						</div>
					</div>
				</div>

				<div class="HtmlLanguageTab">
					<ul class="nav nav-tabs" role="tablist">
						<?php foreach ($languages as $language) { ?>
							<li>
								<a id="HtmlTab_{{menu.row}}_<?php echo $language['language_id']; ?>" href="#PanelHtml_{{menu.row}}_<?php echo $language['language_id']; ?>" data-tab="{{menu.row}}_<?php echo $language['language_id']; ?>">
									<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
									<?php echo $language['name']; ?>
								</a>
							</li>
						<?php } ?>
					</ul>

				</div>
				<?php foreach ($languages as $language) { ?>
					<div id="PanelHtml_{{menu.row}}_<?php echo $language['language_id']; ?>">
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo _t('entry_custom_html'); ?></label>
							<div class="col-sm-10">
								<textarea name="menus[{{menu.row}}][htmls][<?php echo $language['language_id']; ?>]" class="Editor">{{languageText menu.htmls <?php echo $language['language_id']; ?>}}</textarea>
							</div>
						</div>
					</div>
				<?php } ?>
			</fieldset>
		</div>
	</script>

	<script id="ProductRowTemplate" type="text/x-handlebars-template">
		<tr id="ProductRow_{{menu.row}}_{{product.row}}">
			<td class="left">
				<input type="hidden" class="ProductId" name="menus[{{menu.row}}][products][{{product.row}}][product_id]" value="{{product.product_id}}" />
				<input type="text" class="ProductName form-control" name="menus[{{menu.row}}][products][{{product.row}}][name]" value="{{itemName product.name}}" size="40" />
			</td>
			<td class="left">
				<a href="#remove-product" class="btn btn-kuler btn-danger ProductRemover" data-related-row="#ProductRow_{{menu.row}}_{{product.row}}"><?php echo $button_remove_product; ?></a>
			</td>
		</tr>
	</script>

	<script id="CategoryRowTemplate" type="text/x-handlebars-template">
		<tr id="CategoryRow_{{menu.row}}_{{category.row}}">
			<td>
				<input type="hidden" class="CategoryId" name="menus[{{menu.row}}][categories][{{category.row}}][category_id]" value="{{category.category_id}}" />
				<input type="text" class="CategoryName form-control" name="menus[{{menu.row}}][categories][{{category.row}}][name]" value="{{itemName category.name}}" size="40" />
			</td>
			<td>
				<a class="btn btn-kuler btn-danger CategoryRemover" href="#remove-category" data-related-row="#CategoryRow_{{menu.row}}_{{category.row}}"><?php echo $button_remove_category; ?></a>
			</td>
		</tr>
	</script>

	<script id="CustomRowTemplate" type="text/x-handlebars-template">
		<tr id="CustomRow_{{menu.row}}_{{link.row}}">
			<td style="width: 30%;">
				<div class="input-group" style="margin-top: 5px;">
					<?php foreach ($languages as $language) { ?>
						<input type="text" class="form-control" name="menus[{{menu.row}}][links][{{link.row}}][titles][<?php echo $language['language_id']; ?>]" value="{{languageText link.titles <?php echo $language['language_id']; ?>}}" />
						<span class="input-group-addon btn-white"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>
					<?php } ?>
				</div>
			</td>
			<td style="width: 50%;">
				<input type="text" class="form-control" name="menus[{{menu.row}}][links][{{link.row}}][link]" value="{{itemName link.link}}" />
			</td>
			<td>
				<a class="btn btn-kuler btn-danger CustomRemover" data-related-row="#CustomRow_{{menu.row}}_{{link.row}}" href="#remove-link"><?php echo $button_remove_link; ?></a>
			</td>
		</tr>
	</script>

	<script id="module1-template" type="text/x-handlebars-template">
		<tr id="module-row-{{module.row}}">
			<td class="left">
				<select name="module[{{module.row}}][layout_id]">
					<?php foreach ($layouts as $layout) { ?>
						<option value="<?php echo $layout['layout_id']; ?>"{{#compare module.layout_id '<?php echo $layout['layout_id']; ?>' operator='=='}} selected="selected"{{/compare}}><?php echo $layout['name']; ?></option>
					<?php } ?>
				</select>
			</td>
			<td class="left">
				<select name="module[{{module.row}}][position]">
					<?php foreach ($positions as $position => $name) { ?>
						<option value="<?php echo $position; ?>"{{#compare module.position '<?php echo $position; ?>' operator='=='}} selected="selected"{{/compare}}><?php echo $name; ?></option>
					<?php } ?>
				</select>
			</td>
			<td class="left">
				<input type="text" size="5" name="module[{{module.row}}][sort_order]" value="{{module.sort_order}}" />
			</td>
			<td class="left">
				<div class="kuler-switch-btn">
					<input type="hidden" name="module[{{module.row}}][status]" value="0" />
					<input type="checkbox" name="module[{{module.row}}][status]" value="1"{{#compare module.status 1}} checked="checked"{{/compare}} />
					<span class="kuler-switch-btn-holder"></span>
				</div>
			</td>
			<td class="right">
				<button class="btn btn-kuler btn-success module-remover" type="button" data-related-row="#module-row-{{module.row}}"><?php echo _t('button_remove'); ?></button>
			</td>
		</tr>
	</script>

<script type="text/javascript">
    var g_token = '<?php echo $token; ?>',
        g_language_id = <?php echo $language_id; ?>,
	    StoreId = <?php echo $selected_store_id ?>,

        g_defaultMenu = <?php echo json_encode($default_menu); ?>,
        g_defaultProductRow = <?php echo json_encode($default_product_row); ?>,
        g_defaultCategoryRow = <?php echo json_encode($default_category_row); ?>,
        g_defaultCustomRow = <?php echo json_encode($default_custom_row); ?>,
        g_menus = <?php echo json_encode($menus); ?>,
	    g_default_module = <?php echo json_encode($default_module); ?>,
	    g_modules = <?php echo json_encode($modules); ?>,

        g_errorProductImages = <?php echo json_encode($error_product_image); ?>,
	    CategoryAutocompleteUrl = '<?php echo $category_autocomplete_url; ?>',
	    ProductAutocompleteUrl = '<?php echo $product_autocomplete_url; ?>';

    var TemplateEngine = (function (Handlebars, configLanguageId) {
        return {
            init: function () {
                Handlebars.registerHelper('compare', function(lvalue, rvalue, options) {

                    if (arguments.length < 3)
                        throw new Error("Handlerbars Helper 'compare' needs 2 parameters");

                    operator = options.hash.operator || "==";

                    var operators = {
                        '==':       function(l,r) { return l == r; },
                        '===':      function(l,r) { return l === r; },
                        '!=':       function(l,r) { return l != r; },
                        '<':        function(l,r) { return l < r; },
                        '>':        function(l,r) { return l > r; },
                        '<=':       function(l,r) { return l <= r; },
                        '>=':       function(l,r) { return l >= r; },
                        'typeof':   function(l,r) { return typeof l == r; }
                    }

                    if (!operators[operator])
                        throw new Error("Handlerbars Helper 'compare' doesn't know the operator "+operator);

                    var result = operators[operator](lvalue,rvalue);

                    if( result ) {
                        return options.fn(this);
                    } else {
                        return options.inverse(this);
                    }
                });

                Handlebars.registerHelper('languageText', function (texts, index) {
                    if (typeof texts == 'object') {
                        return index in texts ? new Handlebars.SafeString(texts[index]) : configLanguageId in texts ? new Handlebars.SafeString(texts[configLanguageId]) : '';
                    } else {
                        return '';
                    }
                });

                Handlebars.registerHelper('isTrue', function (obj, prop, options) {
                    if (prop in window[obj] && window[obj][prop]) {
                        return options.fn(this);
                    } else {
                        return '';
                    }
                });

                Handlebars.registerHelper('prop', function (obj, prop) {
                    return window[obj][prop];
                });
            }
        }
    })(Handlebars, g_language_id);

    var OptionToggle = (function () {
	    return {
		    init: function (selector, context) {
			    var self = this;

			    $(selector, context || document)
				    .each(function () {
					    self.toggle(this);
				    })
				    .bind('click change fakeclick', function () {
					    self.toggle(this);
				    });
		    },
		    toggle: function (toggle) {
			    var $this = $(toggle),
				    checked = $this.is(':checked'),
				    $option = $($this.data('option'));

			    if ($this.data('inverse')) {
				    checked = !checked;
			    }

			    if (checked) {
				    $option.hide().fadeIn('fast');
			    } else {
				    $option.fadeOut('fast');
			    }
		    }
	    };
    })();

    var Tab = (function () {
        $.fn.tabs = function (options) {
            var defaults = {
                    prefix: '',
                    key: ''
                },
                selector = this.selector,
                activeKey;

            options = $.extend(defaults, options);

            activeKey = options.prefix + options.key;

            var matches = document.cookie.match(new RegExp(activeKey + '=([^;]+);')), activeValue = 0;

            if (matches) {
                activeValue = matches[1];
            }

            $('body').on('click', selector, function (evt) {
                evt.preventDefault();

                $(selector)
                    .removeClass('selected')
                    .each(function () {
                        $($(this).attr('href')).hide();
                    })
	                .parent()
	                .removeClass('active');

                var $this = $(this);
                $this.addClass('selected').parent().addClass('active');
                $($this.attr('href')).show();

                document.cookie = activeKey + '=' + $this.data('tab');
            });

            this.show();

            if (!$('#' + options.key + '_' + activeValue).trigger('click').length) {
                $(selector).eq(0).trigger('click');
            }
        };

        return {
            init: function (selector, tabPrefix, tabKey) {
                var context = $.isPlainObject(selector) ? selector.context : document,
                    selector = $.isPlainObject(selector) ? selector.selector : selector;

                $(selector, context).tabs({
                    prefix: tabPrefix,
                    key: tabKey
                });
            }
        };
    })();

    var Editor = (function (token) {
        return {
            init: function (selector, context) {
                $(selector, context || document).each(function () {
	                $(this).summernote({
		                height: 300
	                });
                });
            }
        };
    })(g_token);

    var ModuleTab = (function (Tab) {
        var that;
        return {
            row: -1,
            init: function () {
                that = this;

                that.$tabList = $('#ModuleTabItems');

                that.initTemplate();

                for (var i in g_menus) {
                    that.addTab(g_menus[i]);

                    g_menus[i].row = that.row;
                    Module.addModule(g_menus[i]);
                }

                that.initTab();

                $('#ModuleAdder').on('click', function (evt) {
                    evt.preventDefault();

                    var title = {};
                    title[g_language_id] = 'Item ' + (that.row + 2);

                    that.addTab({
                        title: title
                    });

                    var menu = g_defaultMenu;
                    menu.row = that.row;
                    menu.title = title;

                    Module.addModule(menu);

                    that.$tabList.find('.ModuleTabItem a').trigger('click');
                });
            },
            initTab: function () {
                Tab.init('#ModuleTabItems a', 'km_', 'ModuleTab');
            },
            initRemoverButton: function (context) {
                $('.ModuleRemover', context || document).on('click', function (evt) {
                    evt.preventDefault();
                    var moduleRow = $(this).data('module');

                    $('#ModuleTabItem_' + moduleRow + ', #Module_' + moduleRow).remove();
                    that.$tabList.find('a:first').trigger('click');
                });
            },
            addTab: function (tab) {
                that.row++;
                tab.row = that.row;

                var tabHtml = that.tabTemplate({
                    tab: tab
                });

                tabHtml = $(tabHtml);
                that.$tabList.append(tabHtml);

                that.initRemoverButton(tabHtml[0]);
            },
            initTemplate: function () {
                that.tabTemplate = Handlebars.compile($('#ModuleTabTemplate').html())
            }
        };
    })(Tab);

    var Module = (function (Tab, Editor, OptionToggle) {
        var that;

        return {
            productRows: {},
            categoryRows: {},
            customRows: {},
            init: function () {
                that = this;

                that.initTemplate();

                $('#ModuleContainer').on('change', '.MenuTypeSelector', function () {
                    var $selector = $(this),
                        type = $selector.val(),
                        row = $selector.data('row'),
                        menu = g_defaultMenu;

                    menu.row = row;
                    menu.type = type;

                    $('#OptionTypeContainer_' + row)
                        .html(that.getTypeOptionTemplate(menu));

                    // Reset index row
                    that.productRows[row] = 0;
                    that.categoryRows[row] = 0;
                    that.customRows[row] = 0;

                    that.postAddModule(menu);
                });

                $('#ModuleContainer').on('keyup', '.ModuleTitle', function () {
                    $('#ModuleTabTitle_' + $(this).data('moduleRow')).html($(this).val());
                });

                // Product init
                $('#ModuleContainer').on('click', '.ProductAdder', function (evt) {
                    evt.preventDefault();

                    that.addProduct($(this).data('module'), g_defaultProductRow);
                });

                $('#ModuleContainer').on('click', '.ProductRemover', function (evt) {
                    evt.preventDefault();

                    $($(this).data('relatedRow')).remove();
                });

                // Category init
                $('#ModuleContainer').on('click', '.CategoryAdder', function (evt) {
                    evt.preventDefault();

                    var moduleRow = $(this).data('module');

                    that.addCategory($(this).data('module'), g_defaultCategoryRow);
                });

                $('#ModuleContainer').on('click', '.CategoryRemover', function (evt) {
                    evt.preventDefault();

                    $($(this).data('relatedRow')).remove();
                });
                
                // Custom init
                $('#ModuleContainer').on('click', '.CustomAdder', function (evt) {
                    evt.preventDefault();

                    that.addCustom($(this).data('module'), g_defaultCustomRow);
                });

                $('#ModuleContainer').on('click', '.CustomRemover', function (evt) {
                    evt.preventDefault();

                    $($(this).data('relatedRow')).remove();
                });
            },
            initTemplate: function () {
                that.template = Handlebars.compile($('#ModuleTemplate').html());

                that.categoryTemplate = Handlebars.compile($('#OptionCategoryTemplate').html());
                that.productTemplate = Handlebars.compile($('#OptionProductTemplate').html());
                that.customTemplate = Handlebars.compile($('#OptionCustomTemplate').html());
                that.htmlTemplate = Handlebars.compile($('#OptionHtmlTemplate').html());

                that.productRowTemplate = Handlebars.compile($('#ProductRowTemplate').html());
                that.categoryRowTemplate = Handlebars.compile($('#CategoryRowTemplate').html());
                that.customRowTemplate = Handlebars.compile($('#CustomRowTemplate').html());

                Handlebars.registerHelper('menuType', function (menu) {
                    return new Handlebars.SafeString(that.getTypeOptionTemplate(menu));
                });

                Handlebars.registerHelper('itemName', function (name) {
                    return new Handlebars.SafeString(name);
                });
            },
            getTypeOptionTemplate: function (menu) {
                var html = '',
                    params = {
                        menu: menu
                    };

                switch (menu.type) {
                    case 'category':
                        html = that.categoryTemplate(params);
                        break;
                    case 'product':
                        html = that.productTemplate(params);
                        break;
                    case 'custom':
                        html = that.customTemplate(params);
                        break;
                    case 'html':
                        html = that.htmlTemplate(params);
                        break;
                }

                return html;
            },
            addModule: function (module) {
                var menu = module,
                    html = that.template({menu: module});

                $('#ModuleContainer').append(html);

                // Render items
                var items, fn;

                switch (menu.type) {
                    case 'category':
                        items = menu.categories;
                        fn = that.addCategory;
                        break;
                    case 'product':
                        items = menu.products;
                        fn = that.addProduct;
                        break;
                    case 'custom':
                        items = menu.links;
                        fn = that.addCustom;
                        break;
                }

                for (var i in items) {
                    fn(menu.row, items[i]);
                }

                that.postAddModule(menu);
            },
            addProduct: function (moduleRow, product) {
                // Prepare data
                that.productRows[moduleRow] = that.productRows[moduleRow] || 0;
                product.row = that.productRows[moduleRow];

                // Render template
                var  html = that.productRowTemplate({
                    menu: {row: moduleRow},
                    product: product
                });

                $('#ProductRows_' + moduleRow).append(html);

                // Init auto complete for product
                var $productRow = $('#ProductRow_' + moduleRow + '_' + product.row),
                    $productNameInput = $productRow.find('.ProductName'),
                    $productId = $productRow.find('.ProductId');

	            $productNameInput.autocomplete({
		            delay: 500,
		            source: function(request, response) {
			            $.ajax({
				            url: ProductAutocompleteUrl,
				            dataType: 'json',
				            data: {
					            filter_name: encodeURIComponent(request.term),
					            store_id: StoreId
				            },
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
			            $productNameInput.val(ui.item.label);
			            $productId.val(ui.item.value);

			            return false;
		            },
		            focus: function(event, ui) {
			            return false;
		            }
	            });

                that.productRows[moduleRow]++;
            },
            addCategory: function (moduleRow, category) {
                // Prepare data
                that.categoryRows[moduleRow] = that.categoryRows[moduleRow] || 0;
                category.row = that.categoryRows[moduleRow];

                // Render template
                var html = that.categoryRowTemplate({
                    menu: {row: moduleRow},
                    category: category
                });

                $('#CategoryRows_' + moduleRow).append(html);

                // Init category autocomplete
                var $categoryRow = $('#CategoryRow_' + moduleRow + '_' + category.row),
                    $categoryId = $categoryRow.find('.CategoryId'),
                    $categoryName = $categoryRow.find('.CategoryName');

	            $categoryName.autocomplete({
		            delay: 500,
		            source: function(request, response) {
			            $.ajax({
				            url: CategoryAutocompleteUrl,
				            dataType: 'json',
				            data: {
					            filter_name: encodeURIComponent(request.term),
					            store_id: StoreId
				            },
				            success: function(json) {
					            response($.map(json, function(item) {
						            return {
							            label: item.name,
							            value: item.category_id
						            }
					            }));
				            }
			            });
		            },
		            select: function(event, ui) {
			            $categoryId.val(ui.item.value);
			            $categoryName.val(ui.item.label);

			            return false;
		            },
		            focus: function(event, ui) {
			            return false;
		            }
	            });

                //
                that.categoryRows[moduleRow]++;
            },
            addCustom: function (moduleRow, custom) {
                // Prepare data
                that.customRows[moduleRow] = that.customRows[moduleRow] || 0;
                custom.row = that.customRows[moduleRow];

                // Render template
                var html = that.customRowTemplate({
                    menu: {row: moduleRow},
                    link: custom
                });

                $('#CustomRows_' + moduleRow).append(html);

                that.customRows[moduleRow]++;
            },
            postAddModule: function (module) {
                var $module = $('#Module_' + module.row);

	            OptionToggle.init('#Module_' + module.row + ' .OptionToggle');

	            if (module.type == 'html') {
                    Tab.init($module.find('.HtmlLanguageTab a'), 'km_', 'HtmlTab');
                    Editor.init('.Editor', $module);
                }
            }
        };
    })(Tab, Editor, OptionToggle);

    var Module1 = (function () {
	    return {
		    row: 0,
			init: function () {
				var self = this;

				this.template = Handlebars.compile($('#module1-template').html());

				for (var i in g_modules) {
					g_modules[i].row = this.row;
					this.addModule(g_modules[i]);
				}

				$('#module-adder').on('click', function () {
					g_default_module.row = self.row;

					self.addModule(g_default_module);
				});

				$('#module-container').on('click', '.module-remover', function () {
					$($(this).data('relatedRow')).remove();
				});
			},
		    addModule: function (module) {
				var html = this.template({module: module});

			    $('#module-container').append(html);

			    this.row++;
		    }
	    };
    })();

    var StoreSelector = (function () {
	    return {
		    init: function () {
			    var saveUrl = '<?php echo $action; ?>';
			    saveUrl = saveUrl.replace(new RegExp('&amp;', 'g'), '&');

			    $('#StoreSelector').on('change', function () {
				    window.location = saveUrl + '&store_id=' + $(this).val();
			    });
		    }
	    };
    })();

    Tab.init('#kuler-main-tab-list a', 'km_tab_', 'MainTab');
    StoreSelector.init();
    TemplateEngine.init();
    Module.init();
    ModuleTab.init();
	Module1.init();
</script>
<?php echo $footer; ?>