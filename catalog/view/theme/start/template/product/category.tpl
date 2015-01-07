<?php $kuler = Kuler::getInstance(); ?>
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
	  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-lg-6 col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-lg-9 col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-lg-12 col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
      <div class="category-info">
        <?php if ($thumb && !$kuler->getSkinOption('hide_category_image')) { ?>
          <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="category-info__description">
	        <?php echo $description; ?>
        </div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
        <div class="refine-search">
          <h3><?php echo $text_refine; ?></h3>
          <div class="owl-carousel">
	          <?php foreach ($kuler->getSubCategories($kuler->request->get['path'], $categories) as $sub_category) { ?>
            <div>
	            <?php if ($kuler->getSkinOption('sub_category_image') && $sub_category['thumb']) { ?>
		            <img src="<?php echo $sub_category['thumb']; ?>" alt="<?php echo $sub_category['name']; ?>" />
	            <?php } ?>
              <a href="<?php echo $sub_category['href']; ?>"><?php echo $sub_category['name']; ?>
              </a>
            </div>
            <?php } ?>
          </div>
        </div>
        <script type="text/javascript">
          $('.owl-carousel').owlCarousel({
            loop:true,
            margin:10,
            responsive:{
              0:{
                items:2
              },
              600:{
                items:4
              },
              1000:{
                items:6
              }
            }
          })
        </script>
      <?php } //end refine search ?>
      <?php if ($products) { ?>
      <div class="categories-filter">
        <div class="row">
          <div class="col-lg-2 col-md-2">
            <div class="btn-group">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-lg-3 col-md-3">
            <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-lg-1 col-md-1 text-right">
            <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-lg-12 col-xs-12">
          <div class="product-wrapper">
	          <?php if ($product['thumb']) { ?>
		          <div class="product-thumb">
			          <div class="product-thumb__primary">
				          <a href="<?php echo $product['href']; ?>">
					          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
				          </a>
			          </div>
			          <?php if ($images = $kuler->getProductImages($product['product_id'])) { ?>
				          <?php if(!$kuler->mobile->isMobile() && $kuler->getSkinOption('enable_swap_image')){ ?>
					          <?php $size = $kuler->getImageSizeByPath($product['thumb']); ?>
					          <div class="product-thumb__secondary hidden-xs hidden-sm hidden-md">
						          <img src="<?php echo $kuler->resizeImage($images[0], $size['width'], $size['height']); ?>" alt="<?php echo $product['name']; ?>"/>
					          </div>
				          <?php } ?>
			          <?php } //end swap image ?>
			          <div class="product-detail button-group hidden-xs hidden-sm hidden-md">
				          <div class="product-detail__group-buttons">
					          <button class="product-detail-button product-detail-button--cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
						          <i class="fa fa-shopping-cart"></i>
					          </button>
					          <button class="product-detail-button product-detail-button--wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
						          <i class="fa fa-heart"></i>
					          </button>
					          <button class="product-detail-button product-detail-button--compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
						          <i class="fa fa-exchange"></i>
					          </button>
				          </div>
				          <?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
					          <button class="product-detail-button--quick-view quick-view">
						          <a href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>"><?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?></a>
					          </button>
				          <?php } //end show quick-view button ?>
			          </div><!--./product-detail-->
		          </div><!--/.produc-thumb-->
	          <?php } else { ?>
		          <div class="product-thumb product-thumb--no-image">
			          <img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" />
		          </div><!--/.product-thumb--no-image-->
	          <?php } //end product thumb ?>
	          <?php if ($product['special']) { ?>
		          <div class="product-sale">
			          -<?php echo $kuler->calculateSalePercent($product['special'], $product['price']); ?>%
		          </div><!--/.product-sale-->
	          <?php } //end special ?>
	          <h4 class="product-name">
		          <a href="<?php echo $product['href']; ?>">
			          <?php echo $product['name']; ?>
		          </a>
	          </h4>
	          <p class="product-price">
		          <?php if (!$product['special']) { ?>
			          <?php echo $product['price']; ?>
		          <?php } else { ?>
			          <span class="product-price--new"><?php echo $product['special']; ?></span>
			          <span class="product-price--old"><?php echo $product['price']; ?></span>
		          <?php } ?>
	          </p>
	          <div class="product-description hidden">
		          <?php echo $product['description']; ?>
	          </div>
	          <div class="product-detail product-detail--list button-group hidden-xs hidden-sm hidden-md">
		          <button class="product-detail-button product-detail-button--cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
			          <i class="fa fa-shopping-cart"></i>
			          <?php echo $button_cart; ?>
		          </button>
		          <button class="product-detail-button product-detail-button--wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
			          <?php echo $button_wishlist; ?>
		          </button>
		          <button class="product-detail-button product-detail-button--compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
			          <?php echo $button_compare; ?>
		          </button>
		          <?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
			          <button class="product-detail-button product-detail-button--quick-view quick-view">
				          <a href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>">
					          <?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?>
				          </a>
			          </button>
		          <?php } //end show quick-view button ?>
	          </div><!--./product-detail-->
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-lg-6 col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-lg-6 col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>