<?php
$kuler = Kuler::getInstance();
$setting['products_per_row'] = !empty($setting['products_per_row']) ? intval($setting['products_per_row']) : 4;

$lg_col = 4;
if (12 % $setting['products_per_row']) {
	if ($setting['products_per_row'] == 5) {
		$lg_col = 20;
	}
} else {
	$lg_col = 12 / $setting['products_per_row'];
}
?>
<div class="product-layout product-grid col-md-3 col-sm-6 col-xs-12 col-lg-<?php echo $lg_col; ?><?php if (isset($product['date_end']) && $product['date_end']) echo ' has-deal'; ?>">
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
			<?php if((isset($setting['add']) && $setting['add']) ||(isset($setting['wishlist']) && $setting['wishlist']) || (isset($setting['compare']) && $setting['compare'])) { ?>
				<div class="product-detail button-group hidden-xs hidden-sm hidden-md">
					<div class="product-detail__group-buttons">
						<?php if(isset($setting['add']) && $setting['add']) { ?>
							<button class="product-detail-button product-detail-button--cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-shopping-cart"></i>
							</button>
						<?php } ?>
						<?php if(isset($setting['wishlist']) && $setting['wishlist']) { ?>
							<button class="product-detail-button product-detail-button--wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-heart"></i>
							</button>
						<?php } ?>
						<?php if(isset($setting['compare']) && $setting['compare']) { ?>
							<button class="product-detail-button product-detail-button--compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-exchange"></i>
							</button>
						<?php } ?>
					</div>
					<?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
						<button class="product-detail-button--quick-view quick-view">
							<a href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>"><?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?></a>
						</button>
					<?php } ?>
				</div>
			<?php } //end product buttons ?>
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
	<?php if(isset($setting['deal_date']) && $setting['deal_date']) { ?>
		<?php if(isset($product['date_end'])) { ?>
			<?php
			$parts = array('0000', '00', '00');

			if ($product['date_end']) {
				$parts = explode('-', $product['date_end']);
			}
			?>
			<div class="product-deal-countdown" data-is-deal="<?php echo $product['date_end'] ? 'true' : 'false' ?>" data-product-id="<?php echo $product['product_id'] ?>" data-date-end="<?php echo $product['date_end'] ?>" data-year="<?php echo $parts[0] ?>" data-month="<?php echo $parts[1] ?>" data-day="<?php echo $parts[2] ?>"></div>
		<?php }  ?>
	<?php } //end deal date ?>
	<?php if(isset($setting['name']) && $setting['name']) { ?>
		<h4 class="product-name">
			<a href="<?php echo $product['href']; ?>">
				<?php echo $product['name']; ?>
			</a>
		</h4>
	<?php } //end product name ?>
	<?php if(isset($setting['price']) && $setting['price']) { ?>
		<p class="product-price">
			<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
			<?php } else { ?>
				<span class="product-price--new"><?php echo $product['special']; ?></span>
				<span class="product-price--old"><?php echo $product['price']; ?></span>
			<?php } ?>
		</p>
	<?php } //end product price ?>
	<?php if(isset($setting['rating']) && $setting['rating']) { ?>
		<div class="product-rating">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($setting['rating'] < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
			<?php } ?>
		</div>
	<?php } //end product rating ?>
	<?php if (isset($setting['description']) && $setting['description']) { ?>
		<div class="product-description hidden">
			<?php echo $product['description']; ?>
		</div>
	<?php } //end product description ?>
</div>