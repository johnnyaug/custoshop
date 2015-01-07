<div id="cart" class="btn-group btn-block mini-cart">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle">
    <i class="fa fa-shopping-cart"></i>
	  <span class="cart-product-total-number"><?php echo Kuler::getInstance()->cart->countProducts(); ?></span>
    <span id="cart-total" class="hidden-lg"><?php echo $text_items; ?></span>
  </button>
  <?php if ($products || $vouchers) { ?>
    <ul class="dropdown-menu pull-right">
      <li>
        <table class="table table-striped">
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-center"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?></td>
            <td class="text-right">x <?php echo $product['quantity']; ?></td>
            <td class="text-right"><?php echo $product['total']; ?></td>
            <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="text-center"></td>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-right">x&nbsp;1</td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
            <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
        </table>
      </li>
      <li>
        <div>
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
          <p>
            <a class="mini-cart__view-cart" href="<?php echo $cart; ?>">
              <?php echo $text_cart; ?> <i class="fa fa-shopping-cart"></i>
            </a>
            <a class="mini-cart__checkout" href="<?php echo $checkout; ?>">
              <?php echo $text_checkout; ?> <i class="fa fa-share"></i>
            </a>
          </p>
        </div>
      </li>
    </ul>
  <?php } else { ?>
  <ul class="dropdown-menu pull-right mini-cart__no-product">
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
  </ul>
  <?php } ?>
</div>
