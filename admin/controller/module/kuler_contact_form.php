<?php
class ControllerModuleKulerContactForm extends Controller
{
	/* @var ModelKulerCommon $common */
	protected $common;
	protected $data = array();

	public function __construct($registry)
	{
		parent::__construct($registry);

		$this->load->model('kuler/common');
		$this->common = $this->model_kuler_common;

		ModelKulerCommon::loadTexts($this->language->load('module/kuler_contact_form'));
	}

	public function index()
	{
		$this->load->model('setting/setting');

		$this->data['store_id']         = isset($this->request->get['store_id']) ? $this->request->get['store_id']: 0;
		$this->data['token']            = $this->session->data['token'];
		$this->data['extension_code']   = 'kuler_contact_form';
		$this->data['default_module']   = $this->getDefaultModule();
		$this->data['config_language']  = $this->config->get('config_language');

		$this->data['stores']       = $this->common->getStores();
		$this->data['languages']    = $this->common->getLanguages();
		$this->data['layouts']      = $this->common->getLayoutOptions();
		$this->data['positions']    = $this->common->getPositions();

		$module_data = $this->model_setting_setting->getSetting('kuler_contact_form', $this->data['store_id']);

		if (!is_array($module_data))
		{
			$module_data = array();
		}
		$this->data['status']       = isset($module_data['kuler_contact_form_status']) ? $module_data['kuler_contact_form_status'] : '1';
		$this->data['modules']      = isset($module_data['kuler_contact_form_module']) ? $module_data['kuler_contact_form_module'] : array();

		// Prepare modules
		foreach ($this->data['modules'] as &$module)
		{
			if (!empty($module['custom_information']))
			{
				foreach ($this->data['languages'] as $language)
				{
					if (!empty($module['custom_information'][$language['code']]))
					{
						$module['custom_information'][$language['code']] = html_entity_decode($module['custom_information'][$language['code']], ENT_QUOTES, 'UTF-8');
					}
				}
			}
		}

		$this->data['messages']     = ModelKulerCommon::getTexts();

		$this->data['action_url']   = $this->common->createLink('module/kuler_contact_form/save');
		$this->data['cancel_url']   = $this->common->createLink('extension/module');
		$this->data['store_url']    = $this->common->createLink('module/kuler_contact_form');

		// Breadcrumbs
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => _t('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => _t('text_modules'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => _t('heading_module'),
			'href'      => $this->url->link('module/kuler_contact_form', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->document->setTitle(_t('heading_module'));

		$this->common->insertCommonResources();

		$this->document->addScript('view/kuler/js/contact_form.js');

		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/kuler_contact_form.tpl', $this->data));
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
				'kuler_contact_form_status' => $this->request->post['status'],
				'kuler_contact_form_module' => isset($this->request->post['modules']) ? $this->request->post['modules']: array()
			);

			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('kuler_contact_form', $data, $this->request->post['store_id']);

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

	protected function getDefaultModule()
	{
		return array(
			'sort_order'    => '10',
			'status'        => '1'
		);
	}

	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/kuler_contact_form'))
		{
			throw new Exception(_t('error_permission'));
		}
	}
}