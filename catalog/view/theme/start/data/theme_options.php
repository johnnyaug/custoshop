<?php
return array(
	'id' => 'start',
	'name' => 'start',
	'version' => '2.0.0',
	'default_skin_id' => 'skin1',
	'styles' => array(
		'general_settings' => array(
			'label' => _t('text_style_general_settings', 'General Settings'),
			'items' => array(
				'heading_font' => array(
					'label' => _t('text_style_heading_font', 'Heading Font'),
					'type' => 'style_font',
					'font_family' => 1,
					'font_size' => 1,
					'font_weight' => 1,
					'font_style' => 0,
					'text_transform' => 0
				),
				'body_font' => array(
					'label' => _t('text_style_font', 'Body Font'),
					'type' => 'style_font',
					'font_family' => 1,
					'font_size' => 1,
					'font_weight' => 1,
					'font_style' => 0,
					'text_transform' => 0
				),
				'body_background_color' => array(
					'label' => _t('text_style_body_background_color', 'Body Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'body_pattern' => array(
					'label' => _t('text_style_pattern', 'Body Background Pattern'),
					'type' => 'style_pattern'
				)
			)
		),
		'bg_color_settings' => array(
			'label' => _t('text_style_bg_color_settings', 'Background Color Settings'),
			'items' => array(
				'color_01' => array(
					'label' => _t('text_style_color_01', 'Color 01'),
					'type' => 'color',
					'format' => 'hex'
				),
				'color_02' => array(
					'label' => _t('text_style_color_02', 'Color 02'),
					'type' => 'color',
					'format' => 'hex'
				),
				'color_03' => array(
					'label' => _t('text_style_color_03', 'Color 03'),
					'type' => 'color',
					'format' => 'hex'
				),
				'color_04' => array(
					'label' => _t('text_style_color_04', 'Color 04'),
					'type' => 'color',
					'format' => 'hex'
				),
				'topbar_bg_color' => array(
					'label' => _t('text_style_topbar_bg_color', 'Top bar Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'header_bg_color' => array(
					'label' => _t('text_style_header_bg_color', 'Header Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'menu_bg_color' => array(
					'label' => _t('text_style_menu_bg_color', 'Menu Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'footer_bg_color' => array(
					'label' => _t('text_style_footer_bg_color', 'Footer Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'social_newsletter_bg_color' => array(
					'label' => _t('text_style_social_newsletter_bg_color', 'Social Newsletter Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'powered_bg_color' => array(
					'label' => _t('text_style_powered_bg_color', 'Powered Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
			)
		),
		'color_settings' => array(
			'label' => _t('text_style_color_settings', 'Color Settings'),
			'items' => array(
				'topbar_color' => array(
					'label' => _t('text_style_topbar_color', 'Top bar Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'header_color' => array(
					'label' => _t('text_style_header_color', 'Header Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'menu_color' => array(
					'label' => _t('text_style_menu_color', 'Menu Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'footer_color' => array(
					'label' => _t('text_style_footer_color', 'Footer Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'social_newsletter_color' => array(
					'label' => _t('text_style_social_newsletter_color', 'Social Newsletter Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
				'powered_color' => array(
					'label' => _t('text_style_powered_color', 'Powered Background Color'),
					'type' => 'color',
					'format' => 'hex'
				),
			)
		),
	),
	'positions' => array(
		'promotion' => _t('text_position_promotion', 'Promotion'),
		'kuler_menu' => _t('text_position_kuler_menu', 'Menu'),
		'header_top' => _t('text_position_header_top', 'Header Top'),
		'header_extra' => _t('text_position_header_extra', 'Header Extra Info'),
		'footer_extra' => _t('text_position_footer_extra', 'Footer Extra Info'),
		'footer_address' => _t('text_position_footer_address', 'Footer Address')
	)
);