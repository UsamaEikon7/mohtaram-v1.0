<?php
class ControllerCatalogCareer extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('catalog/career');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/career');
		
		$this->getList();
	} 

	public function add() {
		$this->load->language('catalog/career');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/career');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_career->addCareer($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			//$this->redirect($this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			$this->response->redirect($this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		
		$this->load->language('catalog/career');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/career');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_career->editCareer($this->request->get['career_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			
			$this->response->redirect($this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		}

		$this->getForm();
	}

	public function delete() { 
		$this->load->language('catalog/career');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/career');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $career_id) {
				$this->model_catalog_career->deleteCareer($career_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			//$this->redirect($this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			$this->response->redirect($this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'sort_order';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
							
		$data['add'] = $this->url->link('catalog/career/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/career/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$data['careers'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * 25,
			'limit' => 25
		);
		
		$career_total = $this->model_catalog_career->getTotalCareers($filter_data);
	
		$results = $this->model_catalog_career->getCareers($filter_data);

		
    	foreach ($results as $result) {
			//$action = array();
						
			/*$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/career/edit', 'token=' . $this->session->data['token'] . '&career_id=' . $result['career_id'] . $url, 'SSL'),
			);*/
						
			$data['careers'][] = array(
				'career_id'			=> $result['career_id'],
				'title'				=> $result['title'],
				'num_of_position'	=> $result['num_of_position'],
				'walkin_timing'		=> $result['walkin_timing'],
				'contact_person'	=> $result['contact_person'],
				'applicant'			=> ($result['applicant'])?$result['applicant']:0,
				'applicant_href'	=> $this->url->link('catalog/career/applicant', 'career_id='.$result['career_id'].'&token=' . $this->session->data['token'] . $url, 'SSL'),
				'sort_order'		=> $result['sort_order'],
				'status'			=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added'		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'			=> isset($this->request->post['selected']) && in_array($result['career_id'], $this->request->post['selected']),
				//'action'			=> $action
				'edit'				=> $this->url->link('catalog/career/edit', 'token=' . $this->session->data['token'] . '&career_id=' . $result['career_id'] . $url, 'SSL')
			);
		}	
	
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_applicant'] = $this->language->get('text_applicant');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['column_title'] = $this->language->get('column_title');
		$data['column_num_of_position'] = $this->language->get('column_num_of_position');
		$data['column_walkin_timing'] = $this->language->get('column_walkin_timing');
		$data['column_contact_person'] = $this->language->get('column_contact_person');
		$data['column_applied']			= $this->language->get('column_applied');
		$data['column_sort_order']	= $this->language->get('column_sort_order');
		$data['column_status']			= $this->language->get('column_status');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');		
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');
 
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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
		
		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=' .  'DESC';
		} else {
			$url .= '&order=' .  'ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		/*$data['sort_author'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] .'&sort=author' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');*/
		
		//added
		$data['sort_title'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=title' . $url, 'SSL');

		$data['sort_num_of_position'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=num_of_position' . $url, 'SSL');
		$data['sort_walkin_timing'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=walkin_timing' . $url, 'SSL');
		$data['sort_contact_person'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=contact_person' . $url, 'SSL');
		$data['sort_applied'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=r.date_added' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $career_total;
		$pagination->page = $page;
		$pagination->limit = 25; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . '&page={page}' . $url, 'SSL');
			
		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($career_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($career_total - $this->config->get('config_limit_admin'))) ? $career_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $career_total, ceil($career_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/career_list.tpl', $data));

	}

	private function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_website'] = $this->language->get('text_website');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_full_time'] = $this->language->get('text_full_time');
		$data['text_part_time'] = $this->language->get('text_part_time');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_form'] = $this->language->get('text_form');
				
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_summery'] = $this->language->get('entry_summery');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_num_of_position'] = $this->language->get('entry_num_of_position');
		$data['entry_min_requirement'] = $this->language->get('entry_min_requirement');
		$data['entry_walkin_timing'] = $this->language->get('entry_walkin_timing');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_publish_date'] = $this->language->get('entry_publish_date');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_store'] = $this->language->get('entry_store');
				
		$data['entry_contact_person'] = $this->language->get('entry_contact_person');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

     	$data['tab_general'] = $this->language->get('tab_general');
    	$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		
 		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		if (isset($this->error['summery'])) {
			$data['error_summery'] = $this->error['summery'];
		} else {
			$data['error_summery'] = '';
		}
		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
		}
		
 		if (isset($this->error['num_of_position'])) {
			$data['error_num_of_position'] = $this->error['num_of_position'];
		} else {
			$data['error_num_of_position'] = '';
		}

		if (isset($this->error['min_requirement'])) {
			$data['error_min_requirement'] = $this->error['min_requirement'];
		} else {
			$data['error_min_requirement'] = '';
		}

		if (isset($this->error['walkin_timing'])) {
			$data['error_walkin_timing'] = $this->error['walkin_timing'];
		} else {
			$data['error_walkin_timing'] = '';
		}
		
 		if (isset($this->error['contact_person'])) {
			$data['error_contact_person'] = $this->error['contact_person'];
		} else {
			$data['error_contact_person'] = '';
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}

		if (isset($this->error['phone'])) {
			$data['error_phone'] = $this->error['phone'];
		} else {
			$data['error_phone'] = '';
		}

		if (isset($this->error['sort_order'])) {
			$data['error_sort_order'] = $this->error['sort_order'];
		} else {
			$data['error_sort_order'] = '';
		}


   		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/career', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
										
		if (!isset($this->request->get['career_id'])) {
			$data['action'] = $this->url->link('catalog/career/add', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/career/edit', 'token=' . $this->session->data['token'] . '&career_id=' . $this->request->get['career_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('catalog/career', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['career_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$career_info = $this->model_catalog_career->getCareer($this->request->get['career_id']);
    	}		
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['career_description'])) {
			$data['career_description'] = $this->request->post['career_description'];
		} elseif (isset($career_info)) {
			$data['career_description'] = $this->model_catalog_career->getCareerDescriptions($this->request->get['career_id']);
		} else {
			$data['career_description'] = array();
		}
		
		if (isset($this->request->post['publish_date'])) {
			$data['publish_date'] = $this->request->post['publish_date'];
		} elseif (isset($career_info)) {
			$data['publish_date'] = $career_info['publish_date'];
		} else {
			$data['publish_date'] = '';
		}

		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (isset($career_info)) {
			$data['type'] = $career_info['type'];
		} else {
			$data['type'] = '';
		}
		
		if (isset($this->request->post['num_of_position'])) {
			$data['num_of_position'] = $this->request->post['num_of_position'];
		} elseif (isset($career_info)) {
			$data['num_of_position'] = $career_info['num_of_position'];
		} else {
			$data['num_of_position'] = '';
		}
		
		if (isset($this->request->post['contact_person'])) {
			$data['contact_person'] = $this->request->post['contact_person'];
		} elseif (isset($career_info)) {
			$data['contact_person'] = $career_info['contact_person'];
		} else {
			$data['contact_person'] = '';
		}

		if (isset($this->request->post['address'])) {
			$data['address'] = $this->request->post['address'];
		} elseif (isset($career_info)) {
			$data['address'] = $career_info['address'];
		} else {
			$data['address'] = '';
		}
		
		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($career_info)) {
			$data['country_id'] = $career_info['country_id'];
		} else {
			$data['country_id'] = '';
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = $this->request->post['zone_id'];
		} elseif (isset($career_info)) {
			$data['zone_id'] = $career_info['zone_id'];
		} else {
			$data['zone_id'] = '';
		}		
		
		$this->load->model('localisation/country');
		$data['countries'] = $this->model_localisation_country->getCountries();
				
		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} elseif (isset($career_info)) {
			$data['phone'] = $career_info['phone'];
		} else {
			$data['phone'] = '';
		}


		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($career_info)) {
			$data['sort_order'] = $career_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($career_info)) {
			$data['status'] = $career_info['status'];
		} else {
			$data['status'] = '';
		}

		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['career_store'])) {
			$data['career_store'] = $this->request->post['career_store'];
		} elseif (isset($career_info)) {
			$data['career_store'] = $this->model_catalog_career->getCareerStores($this->request->get['career_id']);
		} else {
			$data['career_store'] = array(0);
		}			
		
		if (isset($this->request->post['career_layout'])) {
			$data['career_layout'] = $this->request->post['career_layout'];
		} elseif (isset($career_info)) {
			$data['career_layout'] = $this->model_catalog_career->getCareerLayouts($this->request->get['career_id']);
		} else {
			$data['career_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/career_form.tpl', $data));
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/career')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		foreach ($this->request->post['career_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['title'])) < 2) || (strlen(utf8_decode($value['title'])) > 255)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
			if ((strlen(utf8_decode($value['walkin_timing'])) < 2) || (strlen(utf8_decode($value['walkin_timing'])) > 255)) {
				$this->error['walkin_timing'][$language_id] = $this->language->get('error_walkin_timing');
			}			
			if ((strlen(utf8_decode($value['summery'])) < 2) || (strlen(utf8_decode($value['summery'])) > 2000)) {
				$this->error['summery'][$language_id] = $this->language->get('error_summery');
			}
			if ((strlen(utf8_decode($value['description'])) < 2) || (strlen(utf8_decode($value['description'])) > 10000)) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		if ((strlen(utf8_decode($this->request->post['num_of_position'])) == 0)) {
			$this->error['num_of_position'] = $this->language->get('error_num_of_position');
		}
		
		if ((strlen(utf8_decode($this->request->post['contact_person'])) < 3) || (strlen(utf8_decode($this->request->post['contact_person'])) > 64)) {
			$this->error['contact_person'] = $this->language->get('error_contact_person');
		}

		
		if ((strlen(utf8_decode($this->request->post['sort_order'])) == 0)) {
			$this->error['sort_order'] = $this->language->get('error_sort_order');
		}

		if ((strlen(utf8_decode($this->request->post['address'])) < 3) || (strlen(utf8_decode($this->request->post['address'])) >512)) {
			$this->error['address'] = $this->language->get('error_address');
		}
			

		if (!preg_match('/^1?[0-9]{10,15}$/', preg_replace('/[()\-+]/', '', $this->request->post['phone']))) {
      		$this->error['phone'] = $this->language->get('error_phone');
    	}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/career')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}	

	public function delete_applicant() { 
		$this->load->language('catalog/career');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/career');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $applicant_id) {
				$this->model_catalog_career->deleteCareerApplicant($applicant_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['career_id'])) {
				$url .= '&career_id=' . $this->request->get['career_id'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			//$this->redirect($this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . $url, 'SSL'));

			$this->response->redirect($this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->applicant();
	}


	public function applicant() {
		
		$this->load->language('catalog/career');
		$this->load->model('catalog/career');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['career_id'])) {
			$url .= '&career_id=' . $this->request->get['career_id'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/career', 'token=' . $this->session->data['token'] . $url, 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . $url, 'SSL'),
       		'text'      => $this->language->get('heading_title_applicant'),
      		'separator' => ' :: '
   		);
							
		$data['delete'] = $this->url->link('catalog/career/delete_applicant', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$data['careers'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * 25,
			'limit' => 25
		);
		
		$applicant_total = $this->model_catalog_career->getTotalCareerApplicants($this->request->get['career_id']);
	
		$results = $this->model_catalog_career->getCareerApplicants($this->request->get['career_id'], $filter_data);

		
    	foreach ($results as $result) {
			$action = array();
										
			if(file_exists(DIR_DOWNLOAD . 'resumes/' . $result['upload_resume'])){
				$upload_resume = $result['upload_resume'];
			}else{
				$upload_resume = "";
			}
			$data['careers'][] = array(
				'applicant_id'		=> $result['applicant_id'],
				'name'				=> $result['name'],
				'email'				=> $result['email'],
				'phone'				=> $result['phone'],
				'upload_resume'		=> $upload_resume,
				'resume_href'		=> $this->url->link('catalog/career/download', 'token=' . $this->session->data['token'] . '&file=' . $result['upload_resume'], 'SSL'),
				'ip'				=> $result['ip'],
				'status'			=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added'		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'			=> isset($this->request->post['selected']) && in_array($result['applicant_id'], $this->request->post['selected'])
			);
		}	
	
		$data['heading_title'] = $this->language->get('heading_title_applicant');

		$data['text_applicant'] = $this->language->get('text_applicant');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_list_applicant'] = $this->language->get('text_list_applicant');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_phone'] = $this->language->get('column_phone');
		$data['column_upload_resume'] = $this->language->get('column_upload_resume');
		$data['column_status']			= $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_ip'] = $this->language->get('column_ip');
		
		$data['button_delete'] = $this->language->get('button_delete');
 
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


		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=' .  'DESC';
		} else {
			$url .= '&order=' .  'ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_author'] = $this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] .'&sort=author' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $applicant_total;
		$pagination->page = $page;
		$pagination->limit = 25; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/career/applicant', 'token=' . $this->session->data['token'] . '&page={page}' . $url, 'SSL');
			
		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($applicant_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($applicant_total - $this->config->get('config_limit_admin'))) ? $applicant_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $applicant_total, ceil($applicant_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/career_applicant_list.tpl', $data));
	}

	public function download() {

		$file = $this->request->get['file'];
		//echo DIR_DOWNLOAD . 'resumes/' . $file; exit;
		if(file_exists(DIR_DOWNLOAD . 'resumes/' . $file)){
			$this->response->addheader('Pragma: public');
			$this->response->addheader('Expires: 0');
			$this->response->addheader('Content-Description: File Transfer');
			$this->response->addheader('Content-Type: application/octet-stream');
			$this->response->addheader('Content-Disposition: attachment; filename='.$this->request->get['file']);
			$this->response->addheader('Content-Transfer-Encoding: binary');
			
			$this->response->setOutput(file_get_contents(DIR_DOWNLOAD . 'resumes/' . $file));
		} else {
			return $this->forward('error/permission');
		}
	}
	
	public function zone() {
		$output = '<option value="">' . $this->language->get('text_select') . '</option>'; 
		
		$this->load->model('localisation/zone');
		
		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);
		
		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		if (!$results) {
			$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
		}

		$this->response->setOutput($output);
	}	

}
