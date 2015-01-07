<?php
$kuler = Kuler::getInstance();
$theme = $kuler->getTheme();

$kuler->addStyle(array(
	"catalog/view/theme/$theme/stylesheet/bootstrap.min.css",
	"catalog/view/theme/$theme/stylesheet/_grid.css",
	"catalog/view/theme/$theme/stylesheet/stylesheet.css",
	"catalog/view/javascript/font-awesome/css/font-awesome.min.css",
));

if ($kuler->getRootSkin() == 'skin2') {
	$kuler->addStyle("catalog/view/theme/$theme/stylesheet/skin02.css");
} elseif ($kuler->getRootSkin() == 'skin3') {
	$kuler->addStyle("catalog/view/theme/$theme/stylesheet/skin03.css");
} else {
	$kuler->addStyle("catalog/view/theme/$theme/stylesheet/skin01.css");
}

$kuler->addScript(array(
	'catalog/view/javascript/jquery/jquery-2.1.1.min.js',
	'catalog/view/javascript/bootstrap/js/bootstrap.min.js',
	'catalog/view/javascript/common.js',
	"catalog/view/theme/$theme/js/lib/jquery.magnific-popup.min.js",
	"catalog/view/theme/$theme/js/lib/owl.carousel.min.js",
	"catalog/view/theme/$theme/js/lib/headroom.min.js",
	"catalog/view/theme/$theme/js/lib/jQuery.headroom.min.js",
	"catalog/view/theme/$theme/js/lib/main.js",
	"catalog/view/theme/$theme/js/utils.js"
));

?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- {STYLES} -->
<!-- {SCRIPTS} -->
<?php echo $google_analytics; ?>
<?php if($direction == "rtl") { ?>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $kuler->getTheme() ?>/stylesheet/rtl.css" media="screen">
<?php } ?>
</head>
<body class="<?php echo $class; ?> <?php echo $kuler->getBodyClass(); ?>">
<?php
$modules = Kuler::getInstance()->getModules('header_top');
if ($modules) {
  echo '<div class="header-top"><div class="container">'.implode('', $modules).'</div></div>';
}
?>
<div id="notification"></div>
<div class="topbar">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-4 ship">
        <?php
        $modules = Kuler::getInstance()->getModules('header_extra');
        if ($modules) {
          echo implode('', $modules);
        }
        ?>
      </div>
      <div class="col-lg-5 col-md-5">
        <div id="top-links" class="nav topbar__my-accounts">
          <ul class="list-inline">
            <li class="dropdown">
              <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-user"></i>
                <span><?php echo $text_account; ?></span>
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <?php if ($logged) { ?>
                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                  <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                  <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                <?php } ?>
              </ul>
            </li>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
            <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-3">
        <?php echo $language; ?>
        <?php echo $currency; ?>
      </div>
    </div>
  </div>
</div><!-- /.topbar -->
<header class="header">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div id="logo" class="site-logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>">
            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
          </a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-lg-5">
        <?php if ($kuler->getSkinOption('live_search_status')) { ?>
          <?php include(DIR_TEMPLATE . Kuler::getInstance()->getTheme() . '/template/common/_live_search.tpl'); ?>
        <?php } else { ?>
          <?php echo $search; ?>
        <?php } ?>
      </div>
      <div class="col-lg-3">
        <?php echo $cart; ?>
      </div>
    </div>
  </div>
	<?php
	$modules = Kuler::getInstance()->getModules('kuler_menu');
	if ($modules) {
		echo implode('', $modules);
	}else{
		?>
		<?php if ($categories) { ?>
			<nav id="menu" class="navigation">
				<div class="container">
					<span id="btn-mobile-toggle">
					  <?php echo $kuler->translate($kuler->getSkinOption('mobile_menu_title')); ?>
					</span>
					<ul class="main-nav">
						<li class="main-nav__item">
							<a href="<?php echo $base; ?>" <?php if ($kuler->getSkinOption('home_icon_type') == 'icon') { ?> class="home-icon" <?php } ?>>
								<?php echo $kuler->language->get('text_home') ?>
							</a>
						</li>
						<?php foreach ($categories as $category) { ?>
							<li class="main-nav__item">
								<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
								<?php if (!empty($category['children'])) { ?>
									<span class="btn-expand-menu"></span>
								<?php } ?>
								<?php if ($category['children']) { ?>
									<div class="main-nav__secondary-nav">
										<div class="container">
											<?php for ($i = 0; $i < count($category['children']);) { ?>
												<ul>
													<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
													<?php for (; $i < $j; $i++) { ?>
														<?php if (isset($category['children'][$i])) { ?>
															<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
																<?php if (!empty($category['children'][$i]['children'])) { ?>
																	<?php echo renderSubMenuRecursive($category['children'][$i]['children']); ?>
																<?php } ?>
															</li>
														<?php } ?>
													<?php } ?>
												</ul>
											<?php } ?>
										</div>
									</div>
								<?php } ?>
							</li>
						<?php } ?>
					</ul>
				</div>
			</nav><!-- /.navbar -->
		<?php } ?>
	<?php } ?>
</header><!-- /.header -->

<?php
function renderSubMenuRecursive($categories) {
  $html = '<ul class="sublevel">';

  foreach ($categories as $category)
  {
    $parent = !empty($category['children']) ? ' parent' : '';
    $active = !empty($category['active']) ? ' active' : '';
    $html .= sprintf("<li class=\"item$parent $active\"><a href=\"%s\">%s</a>", $category['href'], $category['name']);

    if (!empty($category['children']))
    {
      $html .= '<span class="btn-expand-menu"></span>';
      $html .= renderSubMenuRecursive($category['children']);
    }

    $html .= '</li>';
  }

  $html .= '</ul>';

  return $html;
}
?>
<div class="kl-main-content">
  <?php
  $modules = Kuler::getInstance()->getModules('promotion');
  if ($modules) {
    echo implode('', $modules);
  }
  ?>