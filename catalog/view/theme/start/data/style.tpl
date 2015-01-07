/*general*/
body {
	background-image: url({{body_bg_image.path}});
	{{#if body_bg_image.repeat}}
		background-repeat: {{body_bg_image.repeat}};
	{{/if}}
	{{#if body_bg_image.position}}
		background-position: {{body_bg_image.position}};
	{{/if}}
	{{#if body_bg_image.attachment}}
		background-attachment: {{body_bg_image.attachment}};
	{{/if}}
}
body {
	{{#if body_font.font_family}}
		font-family: {{_fontFamily body_font.font_family}};
	{{/if}}
	{{#if body_font.font_size}}
		font-size: {{body_font.font_size}};
	{{/if}}
	{{#if body_font.font_weight}}
		font-weight: {{body_font.font_weight}};
	{{/if}}
	{{#if body_bg_color}}
		background-color: {{body_bg_color}};
	{{/if}}
	{{#if body_pattern}}
		background-image: url({{body_pattern}});
	{{/if}}
	{{#if body_text_color}}
		color: {{body_text_color}};
	{{/if}}
}
/*background color settings*/
.topbar{
	background-color: {{topbar_bg_color}};
}
.header{
	background-color: {{header_bg_color}};
}
.navigation{
	background-color: {{menu_bg_color}};
}
.footer{
	background-color: {{footer_bg_color}};
}
.social-newsletter{
	background-color: {{footer_bg_color}};
}
#powered{
	background-color: {{powered_bg_color}};
}

/*color settings*/
.topbar{
	color: {{topbar_color}};
}
.header{
	color: {{header_color}};
}
.main-nav__item > a{
	color: {{menu_color}};
}
.footer{
	color: {{footer_color}};
}
.social-newsletter{
	color: {{footer_color}};
}
#powered{
	color: {{powered_color}};
}