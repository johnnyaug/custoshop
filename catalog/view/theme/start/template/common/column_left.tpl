<?php if ($modules) { ?>
<column id="column-left" class="col-lg-3 col-sm-3 hidden-xs sidebar">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>