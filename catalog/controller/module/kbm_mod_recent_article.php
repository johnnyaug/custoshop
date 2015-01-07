<?php
/**
 * Class ControllerModuleKBMModRecentArticle
 * @property ModelModuleKBMModRecentArticle $model
 * @property ModelKulerBlogManager $kbm_model
 */
class ControllerModuleKBMModRecentArticle extends Controller
{
    protected $model;
	protected $kbm_model;
	protected $common;
	protected $data = array();

    public function __construct($registry)
    {
        parent::__construct($registry);

	    $this->load->model('kuler/common');
	    $this->common = $this->model_kuler_common;

        $this->load->model('module/kbm_mod_recent_article');
        $this->model = $this->model_module_kbm_mod_recent_article;

	    $this->load->model('module/kbm');
	    $this->kbm_model = $this->model_module_kbm;
    }

    public function index($setting)
    {
	    if (!$this->common->isKulerTheme($this->config->get('config_template')))
	    {
		    return false;
	    }

        static $module = 0;

	    $setting['product_featured_image']  = isset($setting['product_featured_image']) ? $setting['product_featured_image'] : 1;
	    $setting['product_description']     = isset($setting['product_description']) ? $setting['product_description'] : 1;
	    $setting['description_limit']       = intval($setting['description_limit']) ? intval($setting['description_limit']) : 100;

	    // Prepare conditions
	    $conditions = array();

	    if (!empty($setting['specific_categories']))
	    {
		    $conditions['category_id'] = $setting['specific_categories'];
	    }

	    if (!empty($setting['exclude_categories']))
	    {
		    $conditions['exclude_category'] = $setting['exclude_categories'];
	    }

	    // Prepare fetch options
	    $fetch_options = array(
		    'page'      => 1,
		    'per_page'  => intval($setting['article_limit']) ? intval($setting['article_limit']) : 5,

		    'sort'              => 'date_added',
		    'sort_direction'    => 'DESC'
	    );

	    // Articles
	    $this->data['product_featured_image']   = $setting['product_featured_image'];
	    $this->data['product_description']      = $setting['product_description'];

	    $articles = $this->kbm_model->getArticles($conditions, $fetch_options);
	    $articles = $this->kbm_model->prepareArticles($articles);

	    foreach ($articles as &$article)
	    {
		    $article['featured_image_thumb']    = $this->kbm_model->prepareImage($article['featured_image'], $setting['featured_image_width'], $setting['featured_image_height']);
		    $article['description']             = $this->kbm_model->cutText($article['description'], $setting['description_limit']);
	    }

	    $this->data['articles'] = $articles;
	    $this->data['module']   = $module;

	    $module++;

	    // Module title
	    $this->data['show_title']   = $setting['show_title'];
	    $this->data['title']        = $this->translate($setting['title'], $this->config->get('config_language_id'));

	    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/kbm_mod_recent_article.tpl')) {
		    return $this->load->view($this->config->get('config_template') . '/template/module/kbm_mod_recent_article.tpl', $this->data);
	    } else {
		    return $this->load->view('default/template/module/kbm_mod_recent_article.tpl', $this->data);
	    }
    }

	private function translate($texts, $language_id)
	{
		if (is_array($texts))
		{
			$first = current($texts);

			if (is_string($first))
			{
				$texts = empty($texts[$language_id]) ? $first : $texts[$language_id];
			}
			else if (is_array($texts))
			{
				if (!isset($texts[$language_id]))
				{
					$texts[$language_id] = array();
				}

				foreach ($first as $key => $value)
				{
					if (empty($texts[$language_id][$key]))
					{
						$texts[$language_id][$key] = $value;
					}
				}
			}
		}

		return $texts;
	}
}