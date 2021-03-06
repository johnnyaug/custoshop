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
				<?php $class = 'col-md-6 col-lg-6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
				<?php $class = 'col-md-9 col-lg-9'; ?>
			<?php } else { ?>
				<?php $class = 'col-md-12 col-lg-12'; ?>
			<?php } ?>
			<div id="content" class="<?php echo $class; ?>">
				<?php echo $content_top; ?>
				<h2>
					<?php echo $heading_title; ?>
					<?php if ($feed) { ?>
						<a href="<?php echo $feed_url; ?>"><img src="catalog/view/kulercore/images/kbm_feed.png" /></a>
					<?php } ?>
				</h2>
				<div class="box">
					<?php if ($blog_description) { ?>
						<p class="blog-description"> <?php echo $blog_description; ?> </p>
					<?php } ?>
					<?php if ($articles) { ?>
						<div class="article-list clearafter">
							<?php foreach ($articles as $article) { ?>
								<?php if ($column==2) { ?>
									<?php $class = 'col-md-6'; ?>
								<?php } elseif ($column==3) { ?>
									<?php $class = 'col-md-4'; ?>
								<?php } elseif ($column==4) { ?>
									<?php $class = 'col-md-3'; ?>
								<?php } else { ?>
									<?php $class = 'col-md-12'; ?>
								<?php } ?>
								<div class="article <?php echo $class; ?>">
									<div class="article__header">
										<h2><a href="<?php echo $article['link']; ?>"><?php echo $article['name']; ?></a></h2>
										<div class="article-extra-info">
											<?php if ($article['display_author']) { ?>
												<?php echo '<span class="author vcard">'; echo _t('text_by_x', '<a rel="author">'. $article['author_name'] .'</a></span>'); ?>
											<?php } ?>

											<?php if ($article['display_category'] && $article['categories']) { ?>
												<?php echo '<span class="category">'; ?>
												<?php echo _t('text_in'); ?>
												<?php $article_links = array(); ?>
												<?php foreach ($article['categories'] as $article_category) {
													$article_links[] = sprintf('<a href="%s">%s</a>', $article_category['link'], $article_category['name']);
												} ?>
												<?php echo implode(', ', $article_links); ?>
												<?php echo '</span>'; ?>
											<?php } ?>

											<?php if ($article['display_date']) { ?>
												<?php echo '<span class="entry-date">' ; echo _t('text_on'); echo '<time>'; ?>  <?php echo $article['date_added_formatted']; echo '</time></span>'; ?>.
											<?php } ?>
										</div>
									</div>
									<div class="article__content">
										<div class="article__image">
											<a href="<?php echo $article['link']; ?>" class="article-image">
												<img src="<?php echo $article['featured_image_thumb']; ?>" />
											</a>
										</div>
										<div class="article__description">
											<?php echo $article['description']; ?>
										</div>
										<div class="article__read-more">
											<?php if ($article['comment_total']) { ?>
												<a class="read-more"  href="<?php echo $article['link']; ?>#comments"><?php echo _t('text_x_comments', $article['comment_total']); ?></a>
											<?php } ?>
											<a class="read-more btn btn-primary" href="<?php echo $article['link']; ?>">
												<?php echo _t('text_read_more'); ?>
											</a>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
						<div class="pagination"> <?php echo $pagination; ?> </div>
					<?php } else { ?>
						<p><?php echo _t('text_no_articles'); ?></p>
					<?php } ?>
				</div>
			</div>
			<?php echo $column_right; ?>
			<?php echo $content_bottom; ?>
		</div>
	</div>
<?php echo $footer; ?>