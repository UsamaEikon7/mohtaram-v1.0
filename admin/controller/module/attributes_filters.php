<?php
class ControllerModuleAttributesFilters extends Controller {
        const DEBUG = false;
	
	private $version = '1.1.2';
	private $info_url = 'http://infomodule.btechunit.eu/opencart/';
        private $info_url_debug = 'http://infomodule.btechunit.eu/opencart/';
        private $module_info_url = "";
	private $error = array();
	private $frontend_language = array('title', 'button_name');
        private $global_setting = array('attributes_filters_select_condition_1', 'attributes_filters_select_condition_2');        
	private $classic_module = true;
	private $classic_module_config = null;

        private $localisation_languages;

        function __construct($registry) {
                parent::__construct($registry);
                $this->initLocalisationLanguages();
        }
    
	public function index() {
		$this->load->language('module/attributes_filters');
		$this->document->setTitle($this->language->get('title'));
                $this->document->addScript('//cdnjs.cloudflare.com/ajax/libs/ace/1.2.2/ace.js');
                $this->document->addScript('view/javascript/attributes_filters/main.js');

		$this->load->model('extension/module');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                        $this->saveGlobalSettings($this->request->post);
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('attributes_filters', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

                        if (!isset($this->request->post['save_and_continue']) || $this->request->post['save_and_continue'] != '1'){
                            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
                        }
		}

                if (self::DEBUG){
                    $data['module_info_url'] = $this->module_info_url = $this->info_url_debug . 'attributes_filters.php?v=fake'; 
                }else{
                    $data['module_info_url'] = $this->module_info_url = $this->info_url . 'attributes_filters.php?v=' . $this->version;  
                }
		
		$data['title'] = $this->language->get('title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_style_max_height_note'] = $this->language->get('text_style_max_height_note');

		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_language'] = $this->language->get('tab_language');
		$data['tab_style'] = $this->language->get('tab_style');
		$data['tab_about'] = $this->language->get('tab_about');

		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_name_note'] = $this->language->get('entry_name_note');

		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_attributes'] = $this->language->get('entry_attributes');
		$data['entry_other_settings'] = $this->language->get('entry_other_settings');
		$data['entry_other_settings_display_header'] = $this->language->get('entry_other_settings_display_header');
		$data['entry_other_settings_use_checkbox'] = $this->language->get('entry_other_settings_use_checkbox');
		$data['entry_other_settings_show_search_button'] = $this->language->get('entry_other_settings_show_search_button');
		$data['entry_other_settings_display_product_count'] = $this->language->get('entry_other_settings_display_product_count');
		$data['entry_other_settings_display_number_as_slider'] = $this->language->get('entry_other_settings_display_number_as_slider');
		$data['entry_other_settings'] = $this->language->get('entry_other_settings');
		$data['entry_display_in_all'] = $this->language->get('entry_display_in_all');
		$data['entry_select_condition_1'] = $this->language->get('entry_select_condition_1');
		$data['entry_select_condition_2'] = $this->language->get('entry_select_condition_2');
		$data['entry_max_height'] = $this->language->get('entry_max_height');
		$data['entry_module_css'] = $this->language->get('entry_module_css');
		$data['entry_'] = $this->language->get('entry_');
		$data[''] = $this->language->get('');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_save_continue'] = $this->language->get('button_save_continue');
		$data['button_save_loading'] = $this->language->get('button_save_loading');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['frontend_language'] = $this->generateFrontendLang();

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

                if (isset($this->session->data['success'])) {
                    $data['success'] = $this->session->data['success'];
                    unset($this->session->data['success']);
                } else {
                    $data['success'] = '';
                }

		$languages = $this->localisation_languages;

		/** errors **************** BEGIN */
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		/** errors **************** END */

		/** breadcrumbs **************** BEGIN */
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);


		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('title'),
				'href' => $this->url->link('module/attributes_filters', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('title'),
				'href' => $this->url->link('module/attributes_filters', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}


		/** breadcrumbs **************** END */
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/attributes_filters', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/attributes_filters', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->classic_module_config = $this->model_extension_module->getModule($this->request->get['module_id']);
		} else if ($this->request->server['REQUEST_METHOD'] == "POST") {
                        $this->classic_module_config = $this->request->post;
                }
                
                $data['is_module'] = isset($this->request->get['module_id']) ? true : false;
                
		/** if module */
		$this->loadData('name', $data, '');
		$this->loadData('status', $data, 1);
		$this->loadData('attributes_filters_categories', $data, array());
		$this->loadData('attributes_filters_attributes', $data, array());
		$this->loadData('attributes_filters_display_in_all', $data, 0, 1);
		$this->loadData('attributes_filters_other_settings_display_header', $data, 0, 1);
		$this->loadData('attributes_filters_other_settings_use_checkbox', $data, 0);
		$this->loadData('attributes_filters_other_settings_show_search_button', $data, 0);
		$this->loadData('attributes_filters_other_settings_display_product_count', $data, 0);
		$this->loadData('attributes_filters_other_settings_display_number_as_slider', $data, 0);
		$this->loadData('attributes_filters_select_condition_1', $data, 1);
		$this->loadData('attributes_filters_select_condition_2', $data, 2);
                
		$this->loadData('attributes_filters_style_max_height', $data, 300);
		$this->loadData('attributes_filters_style_module_css', $data, self::MODULE_DEFAULT_CSS);

		foreach ($languages as $language) {
			foreach ($data['frontend_language'] as $id_lang => $defaults) {
				if (isset($this->request->post['attributes_filters_lang'][$id_lang][$language['language_id']]['text'])) {
					$data['attributes_filters_lang'][$id_lang][$language['language_id']]['text'] = $this->request->post['attributes_filters_lang'][$id_lang][$language['language_id']]['text'];
				} else {
					$temp = $this->getConfig('attributes_filters_lang');
					$data['attributes_filters_lang'][$id_lang][$language['language_id']]['text'] = isset($temp[$id_lang][$language['language_id']]['text']) ? $temp[$id_lang][$language['language_id']]['text'] : $defaults['default'];
				}
			}
		}

		$data['languages'] = $languages;

                $this->load->model('tool/attributes_filters');
                $data['attributes'] =  $this->model_tool_attributes_filters->getAttributes();

		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

                $data['module_info'] = $this->getModuleInfo();
                
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/attributes_filters.tpl', $data));
	}

	private function loadData($field, &$data, $default_value, $init_value = null) {
                if ($init_value !== null && empty($this->classic_module_config['attributes_filters_first_save'])){
                    $default_value = $init_value;
                }
		if (isset($this->request->post[$field])) {
			$data[$field] = $this->request->post[$field];
		} elseif (!empty($this->classic_module_config[$field])) {
			$data[$field] = $this->getConfig($field);
		} else {
			$data[$field] = $default_value;
		}
	}

	private function getConfig($name) {
		if ($this->classic_module && $this->classic_module_config && isset($this->classic_module_config[$name])) {
			return $this->classic_module_config[$name];
		} else {
			return $this->config->get($name);
		}
	}

	private function generateFrontendLang() {
		$counter = 0;
		$lang_entry = array();
		foreach ($this->frontend_language as $lang_item) {
			$lang_entry[$counter] = array('entry' => $this->language->get('entry_lang_' . $lang_item), 'default' => $this->language->get('entry_lang_' . $lang_item . '_desc'), 'help' => 'help_' . $lang_item . '.png');
			$counter++;
		}
		return $lang_entry;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/attributes_filters')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
        
        private function saveGlobalSettings($postData){
            $this->load->model('setting/setting');
            $this->model_setting_setting->editSetting(
                    'attributes_filters',
                    array_intersect_key($postData, array_flip( $this->global_setting))
            );
        }

        private function getModuleInfo($timeout = 5) {
            if (function_exists('curl_version')) {
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $this->module_info_url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
                $data = curl_exec($ch);
                curl_close($ch);
                $ch = null;

                return self::_xss_clean($data);
            }else{
                return false;
            }
        }

        private static function _xss_clean($data) {
            /** http://stackoverflow.com/a/1741568 */
            /** Fix &entity\n; */
            $data = str_replace(array('&amp;', '&lt;', '&gt;'), array('&amp;amp;', '&amp;lt;', '&amp;gt;'), $data);
            $data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
            $data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
            $data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');

            /** Remove any attribute starting with "on" or xmlns*/
            $data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);

            /** Remove javascript: and vbscript: protocols*/
            $data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
            $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
            $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);

            /** Only works in IE: <span style="width: expression(alert('Ping!'));"></span>*/
            $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
            $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
            $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);

            /** Remove namespaced elements (we do not need them)*/
            $data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);

            do {
                /** Remove really unwanted tags*/
                $old_data = $data;
                $data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|i(?:frame|layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
            } while ($old_data !== $data);

            /**  we are done...*/
            return $data;
        }

    private function initLocalisationLanguages() {
        $this->load->model('localisation/language');
        $languages = $this->model_localisation_language->getLanguages();
        foreach ($languages as &$language) {
            if (version_compare(VERSION, '2.2', '>=')) {
                $language['image_url'] = 'language/'.$language['code'].'/'.$language['code'].'.png';
            }else{
                $language['image_url'] = 'view/image/flags/' . $language['image'];
            }
        }
        $this->localisation_languages = $languages;
    }

    const MODULE_DEFAULT_CSS = "
ul.box-attributes-filters, ul.box-attributes-filters ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
ul.box-attributes-filters span {
    font-weight: bold;
    border-bottom: 1px solid #EEEEEE;
    display: block;
    padding-left: 10px;
}
ul.box-attributes-filters > li ul {
    padding-left: 12px;
}
ul.box-attributes-filters .checkbox {
    padding-left: 12px;
}
.box-attributes-filters .list-group-item.selected {
    font-weight: bold;
}";
}