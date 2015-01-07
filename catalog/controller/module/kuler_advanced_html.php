<?php

/*--------------------------------------------------------------------------/
* @Author		KulerThemes.com http://www.kulerthemes.com
* @Copyright	Copyright (C) 2012 - 2013 KulerThemes.com. All rights reserved.
* @License		KulerThemes.com Proprietary License
/---------------------------------------------------------------------------*/

class ControllerModuleKulerAdvancedHtml extends Controller
{
	protected $common;

	protected $data = array();

	public function __construct($registry)
	{
		parent::__construct($registry);

		$this->load->model('kuler/common');
		$this->common = $this->model_kuler_common;
	}

	public function index($setting)
    {
	    if (!$this->common->isKulerTheme($this->config->get('config_template')))
	    {
		    return false;
	    }

        static $module = 0;

        $setting['title'] = $this->translate($setting['title'], $this->config->get('config_language_id'));

        if (empty($setting['description_text']))
        {
            $setting['description_text'] = 100;
        }

        $this->data['heading_title'] = $this->translate($setting['title'], $this->config->get('config_language_id'));
    	$this->data['show_title'] = isset($setting['showtitle']) ? $setting['showtitle'] : 1;
	    $message = $this->translate($setting['description'], $this->config->get('config_language_id'));
	    $message =  html_entity_decode($message, ENT_QUOTES, 'UTF-8');

	    $this->data['message'] = $this->helperProcessShortCodes($message);

        $this->data['module'] = ++$module;
        $this->data['setting'] = $setting;

	    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/kuler_advanced_html.tpl')) {
		    return $this->load->view($this->config->get('config_template') . '/template/module/kuler_advanced_html.tpl', $this->data);
	    } else {
		    return $this->load->view('default/template/module/kuler_advanced_html.tpl', $this->data);
	    }
	}

	private function helperProcessShortCodes($message)
	{
    	if (preg_match_all('#\[(kuler|kbm).+?\]#', $message, $matches))
    	{
    		$this->data['modules'] = array();

    		// Get short codes
    		foreach ($matches[0] as $rawCode)
    		{
	    		$shortcodeParts = $this->helperParseShortcode($rawCode);

	    		$extensionCode = $shortcodeParts[0];
	    		$moduleCode = $shortcodeParts[1];

	    		// Parse extra parameters
	    		$params = array(
	    			'show_title' => true
	    		);
	    		if (isset($shortcodeParts[2]))
	    		{
	    			$shortcodeParts[2] = str_replace(' ', '', $shortcodeParts[2]);
	    			list($showTitle, $value) = explode('=', $shortcodeParts[2]);

				    $params[$showTitle] = $value;
	    		}

			    if ($params['show_title'] === 'hide')
			    {
				    $params['show_title'] = false;
			    }

	    		// Load module
			    if ($extensionCode != 'kuler_layer_slider')
			    {
				    $modules = $this->config->get($extensionCode . '_module');
			    }
			    else
			    {
				    $modules = array(
					    array(
						    'shortcode' => "[kuler_layer_slider _ group_id={$params['group_id']}"
					    )
				    );
			    }

	    		if ($modules)
	    		{
	    			foreach ($modules as $module)
	    			{
                        if (isset($module['shortcode']))
                        {
                            list($dbExtensionCode, $dbModuleCode) = $this->helperParseShortcode($module['shortcode']);

                            if ($extensionCode == $dbExtensionCode && $moduleCode == $dbModuleCode)
                            {
                                $module = array_merge($module, $params);
                                $moduleHtml = $this->load->controller('module/' . $extensionCode, $module);

                                if ($moduleHtml)
                                {
                                    // Remove the margin of module
                                    if (preg_match('#<div(.+)?>#', $moduleHtml, $matches) && strpos($matches[0], 'kuler-module') !== false)
                                    {
                                        $matches[1] .= ' style="margin:0;"';
                                        $div = '<div'. $matches[1] .'>';

                                        $moduleHtml = str_replace($matches[0], $div, $moduleHtml);
                                    }

                                    $message = str_replace($rawCode, $moduleHtml, $message);
                                }
                            }
                        }
	    			}
	    		}
    		}
    	}

    	return $message;
	}

	private function helperParseShortcode($shortcode)
	{
		$shortcode = str_replace('&nbsp;', ' ', $shortcode);
		return explode(' ', trim($shortcode, '[]'));
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
?>