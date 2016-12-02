<?php
class ControllerModuleAttributesFilters extends Controller {
    const DEBUG = false;

    public function index($setting) {
        if (self::DEBUG) {
            echo '<pre>';
            var_dump($setting);
            echo '</pre>';
        }

        static $module = 0;
        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string) $this->request->get['path']);
        } else {
            $parts = array();
        }

        $category_id = end($parts);
        $language_id = $this->config->get('config_language_id');
        $heading_title = $setting['attributes_filters_lang'][0][$language_id]['text'];
        $data['heading_title'] = $heading_title;

        $display_in_all = (isset($setting['attributes_filters_display_in_all']) && $setting['attributes_filters_display_in_all'] == '1') ? true : false;

        if ($display_in_all || (isset($setting['attributes_filters_categories']) && in_array($category_id, $setting['attributes_filters_categories']))) {

            $this->load->model('catalog/category');
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info && isset($setting['attributes_filters_attributes'])) {
                $data['module'] = $module++;

                $data['button_name'] = $setting['attributes_filters_lang'][1][$language_id]['text'];
                $data['attributes_filters_attributes'] = $setting['attributes_filters_attributes'];
                $data['display_header'] = (isset($setting['attributes_filters_other_settings_display_header'])) ? true : false;
                $data['use_checkbox'] = (isset($setting['attributes_filters_other_settings_use_checkbox'])) ? true : false;
                $data['show_search_button'] = (isset($setting['attributes_filters_other_settings_show_search_button'])) ? true : false;
                $data['display_product_count'] = (isset($setting['attributes_filters_other_settings_display_product_count'])) ? true : false;
                $data['display_number_as_slider'] = (isset($setting['attributes_filters_other_settings_display_number_as_slider'])) ? true : false;
                $data['style_max_height'] = (isset($setting['attributes_filters_style_max_height']) && (int) $setting['attributes_filters_style_max_height'] > 0) ? (int) $setting['attributes_filters_style_max_height'] : 0;
                $data['style_module_css'] = isset($setting['attributes_filters_style_module_css']) ? htmlspecialchars_decode($setting['attributes_filters_style_module_css']) : "";
                $data['attributes_filters_selected'] = $this->getSelectedAttributes();

                $url = '';
                if (isset($this->request->get['option_filter'])) {
                    $url .= '&option_filter=' . $this->request->get['option_filter'];
                }
                
                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));


                $this->load->model('catalog/product');
                $data['attributes_filters_groups'] = array();

                $this->load->model('module/attributes_filters');
                $data['attributes'] = $this->model_module_attributes_filters->getAttributesFilter($category_id, $data['display_product_count']);

                if ($data['attributes']) {
                    if ($this->isDisplayForAttributes($data['attributes'], $data['attributes_filters_attributes'])){
                        return $this->loadTpl($data);
                    }
                }
            }
        }
    }

    private function isDisplayForAttributes($attributes, $attributes_filters_attributes) {
        $all_attributes_ids = array();
        foreach ($attributes as $attribute) {
            $all_attributes_ids = array_merge($all_attributes_ids, array_keys($attribute['attribute']));
        }
        if (array_intersect($all_attributes_ids, $attributes_filters_attributes)) {
            return true;
        } else {
            return false;
        }
    }

    private function loadTpl($data) {
        if (version_compare(VERSION, '2.2', '>=')) {
            return $this->load->view('module/attributes_filters', $data);
        }else{
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/attributes_filters.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/attributes_filters.tpl', $data);
            } else {
                return $this->load->view('default/template/module/attributes_filters.tpl', $data);
            }
        }
    }

    private function getSelectedAttributes() {
        $attributes_filters_selected = array();
        if (isset($this->request->get['attributes_filters']) && is_array($this->request->get['attributes_filters']) && count($this->request->get['attributes_filters']) != count($this->request->get['attributes_filters'], COUNT_RECURSIVE)) {
            foreach ($this->request->get['attributes_filters'] as $k => $v) {
                $attributes_filters_selected[$k] = $v;
            }
        }
        return $attributes_filters_selected;
    }

}
