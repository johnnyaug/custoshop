<div id="carousel<?php echo $module; ?>" class="owl-carousel" >
  <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
      <div>
        <a href="<?php echo $banner['link']; ?>">
          <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        </a>
      </div>
    <?php } else { ?>
      <div>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
      </div>
    <?php } ?>
  <?php } ?>
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