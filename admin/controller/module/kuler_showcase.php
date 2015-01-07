<?php
class ControllerModuleKulerShowcase extends Controller
{
	/* @var ModelKulerCommon $common */
	protected $common;

	public function __construct($registry)
	{
		parent::__construct($registry);

		$this->load->model('kuler/common');
		$this->common = $this->model_kuler_common;

		ModelKulerCommon::loadTexts($this->language->load('module/kuler_showcase'));
	}

	public function index()
	{
		$this->load->model('setting/setting');

		$data['store_id']             = isset($this->request->get['store_id']) ? $this->request->get['store_id']: 0;
		$data['token']                = $this->session->data['token'];
		$data['extension_code']       = 'kuler_showcase';
		$data['default_module']       = $this->getDefaultModule();
		$data['config_language']      = $this->config->get('config_language');

		$data['stores']               = $this->common->getStores();
		$data['languages']            = $this->common->getLanguages();
		$data['layouts']              = $this->common->getLayoutOptions();
		$data['positions']            = $this->common->getPositions();

		$data['front_base'] = $this->common->getFrontBase();

		$data['category_options'] = $this->common->getCategoryOptions(array(
			'all' => true,
			'store_id' => $data['store_id']
		));

		$module_data = $this->model_setting_setting->getSetting('kuler_showcase', $data['store_id']);

		if (!is_array($module_data))
		{
			$module_data = array();
		}

		$data['status']       = isset($module_data['kuler_showcase_status']) ? $module_data['kuler_showcase_status'] : '1';
		$data['modules']      = isset($module_data['kuler_showcase_module']) ? $module_data['kuler_showcase_module'] : array();

		// Prepare modules
		foreach ($data['modules'] as &$module)
		{
			if (!empty($module['showcases']))
			{
				foreach ($module['showcases'] as &$showcase)
				{
					if (!empty($showcase['items']))
					{
						foreach ($showcase['items'] as &$item)
						{
							if ($item['type'] == 'html')
							{
								$item['html_content'] = $this->common->decodeMultilingualText($item['html_content']);
							}
						}
					}
				}
			}
		}

		$data['messages']     = ModelKulerCommon::getTexts();

		$data['action_url']   = $this->common->createLink('module/kuler_showcase/save');
		$data['cancel_url']   = $this->common->createLink('extension/module');
		$data['store_url']    = $this->common->createLink('module/kuler_showcase');

		// Breadcrumbs
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => _t('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => _t('text_modules'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text'      => _t('heading_module'),
			'href'      => $this->url->link('module/kuler_showcase', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

        $this->document->setTitle(_t('heading_module'));

		$this->common->insertCommonResources();

		$this->document->addScript($this->common->createLink('module/kuler_showcase/jsMessages'));
		$this->document->addScript('view/kuler/js/showcase.js');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/kuler_showcase.tpl', $data));
	}

	public function save()
	{
		try
		{
			if ($this->request->server['REQUEST_METHOD'] != 'POST')
			{
				throw new Exception(_t('error_permission'));
			}

			$this->validate();

			$data = array(
				'kuler_showcase_status' => $this->request->post['status'],
				'kuler_showcase_module' => isset($this->request->post['modules']) ? $this->request->post['modules']: array()
			);

			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('kuler_showcase', $data, $this->request->post['store_id']);

			$result = array(
				'status' => 1,
				'message' => _t('text_success')
			);
		}
		catch (Exception $e)
		{
			$result = array(
				'status' => 0,
				'message' => $e->getMessage()
			);
		}

		$this->response->setOutput(json_encode($result));
	}

	public function jsMessages()
	{
		$js = 'var _tMessages = ' . json_encode(ModelKulerCommon::getTexts());

		$this->response->setOutput($js);
	}

	protected function getDefaultModule()
	{
		return array(
			'layout_id'               => '1',
			'position'                => 'content_top',
			'sort_order'              => '3',
			'show_title'              => '1',
			'status'                  => '1'
		);
	}

	protected function getDefaultShowcase() {
		return array(
			'display_order' => 1
		);
	}

	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/kuler_showcase'))
		{
			throw new Exception(_t('error_permission'));
		}
	}
}