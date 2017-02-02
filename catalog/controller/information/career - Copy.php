<?php 
class ControllerInformationCareer extends Controller {
	private $error = array(); 
     
  	public function index() {

		$this->load->language('information/career');

		$this->document->setTitle($this->language->get('heading_title'));  
		
		$this->load->model('catalog/career');
		$this->load->model('design/banner');
		
		
		$this->getList();
  	}
  
	private function getList() {				
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/career')
		);
		


		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}


    	$data['careers'] = array();

		$filter_data = array(
			'start'					=> ($page - 1) * $this->config->get('config_product_limit'),
			'limit'					=> $this->config->get('config_product_limit')
		);

		$this->load->model('catalog/career');
		
		$career_total = $this->model_catalog_career->getTotalJobs($filter_data);
		$results = $this->model_catalog_career->getJobs($filter_data);
		//print_r($results); exit;			
		
					    	
		foreach ($results as $result) {
			
			$data['careers'][] = array(
				'career_id'				=> $result['career_id'],
				'title'					=> $result['title'],
				'description'			=> html_entity_decode($result['summery'], ENT_QUOTES, 'UTF-8'),
				'num_of_position'		=> $result['num_of_position'],
				'walkin_timing'			=> $result['walkin_timing'],
				'contact_person'		=> $result['contact_person'],
				'phone'					=> $result['phone'],
				'apply_now'				=> $this->url->link('information/career/view','career_id='. $result['career_id'])
			);
    	}

		$data['heading_title']		  		= $this->language->get('heading_title');
		$data['text_no_results']		  	= $this->language->get('text_no_results');
		$data['text_apply_now']		  		= sprintf($this->language->get('text_apply_now'), $this->config->get('config_name'));
		$data['text_apply_email']		  	= sprintf($this->language->get('text_apply_email'), $this->config->get('config_email'));
		

		$data['text_description']		  	= $this->language->get('text_description');

		$data['text_title']					= $this->language->get('text_title');
		$data['text_description']			= $this->language->get('text_description');
		$data['text_num_of_position']		= $this->language->get('text_num_of_position');
		$data['text_min_requirement']		= $this->language->get('text_min_requirement');
		$data['text_walkin_timing']			= $this->language->get('text_walkin_timing');
		$data['text_contact_person']		= $this->language->get('text_contact_person');
		$data['text_address']				= $this->language->get('text_address');
		$data['text_phone']					= $this->language->get('text_phone');	
		$data['text_more']					= $this->language->get('text_more');

		$data['button_apply_now']			= $this->language->get('button_apply_now');	
		
		$pagination = new Pagination();
		$pagination->total = $career_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_product_limit'); 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('information/career', 'page={page}');
		//$pagination->url = $this->url->link('information/career', 'career_id=' . $career_id . $url . '&page={page}');
			
		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($career_total) ? (($page - 1) * $this->config->get('config_product_limit')) + 1 : 0, ((($page - 1) * $this->config->get('config_product_limit')) > ($career_total - $this->config->get('config_product_limit'))) ? $career_total : ((($page - 1) * $this->config->get('config_product_limit')) + $this->config->get('config_product_limit')), $career_total, ceil($career_total / $this->config->get('config_product_limit')));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/career_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/career_list.tpl';
		} else {
			$this->template = 'information/career_list.tpl';
		}

			$data['results'] = $this->model_design_banner->getBanner(14);
			$data['banner']		=	 $this->load->view('information/career/banner', $data);
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
				
 		//$this->response->setOutput($this->render());
 		
 		$this->response->setOutput($this->load->view('information/career.tpl', $data));	
  	}
	
	public function view() {

		$this->load->language('information/career');
		$this->load->model('catalog/career');
						 
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();
			
			if (is_uploaded_file($this->request->files['upload_resume']['tmp_name'])) {
				$filename = $this->request->files['upload_resume']['name'];
				//print_r($filename); exit;
				$file_ext 	= explode('.', $filename);
				$file_ext	=  end($file_ext);
				//print_r($file_ext);
				$filename	=	$this->request->get['career_id'].$this->generateRandomString(10).'.'.$file_ext;
				//echo $filename; exit;
				//$this->request->post['name']
				//print_r($_FILES); 
				//print_r($this->request->post); exit;
				move_uploaded_file($this->request->files['upload_resume']['tmp_name'], DIR_DOWNLOAD . 'resumes/'. $filename);
				if (file_exists(DIR_DOWNLOAD . 'resumes/'. $filename)) {
					$data['upload_resume'] = $filename;
				}
			}

			$this->model_catalog_career->addApplicantApplyDetail($this->request->get['career_id'], array_merge($this->request->post, $data));

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->request->post['email']);
			$mail->setSender($this->request->post['name']);
			$mail->setSubject(sprintf($this->language->get('email_subject'), $this->request->post['name']));
			$mail->setText(strip_tags(html_entity_decode($this->request->post['name']. ' has mailed his/her resume', ENT_QUOTES, 'UTF-8')));
			if(isset($filename)){
				$mail->addAttachment(DIR_DOWNLOAD . '/resumes/'. $filename);
			}
			$mail->send();
			
			$this->session->data['success'] = $this->language->get('text_success');	

			//$json['success']= $this->language->get('text_success');	
			$this->response->redirect($this->url->link('information/career/view', 'career_id='.$this->request->get['career_id']));


		}
	
    	$this->getForm();
  	}


	private function getForm() {

		$data['text_title']				= $this->language->get('text_title');
		$data['text_description']		= $this->language->get('text_description');
		$data['text_num_of_position']	= $this->language->get('text_num_of_position');
		$data['text_min_requirement']	= $this->language->get('text_min_requirement');
		$data['text_walkin_timing']		= $this->language->get('text_walkin_timing');
		$data['text_contact_person']	= $this->language->get('text_contact_person');
		$data['text_address']			= $this->language->get('text_address');
		$data['text_type']				= $this->language->get('text_type');
		$data['text_publish_date']		= $this->language->get('text_publish_date');
		$data['text_country']			= $this->language->get('text_country');
		$data['text_zone']				= $this->language->get('text_zone');
		$data['text_phone']				= $this->language->get('text_phone');			

		
		$result = $this->model_catalog_career->getJobDetail($this->request->get['career_id']);
		//print_r($result); exit;
		$data['career_id']		= $result['career_id'];
		$data['title']			= $result['title'];
		$data['description']		= html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
		$data['num_of_position']	= $result['num_of_position'];
		$data['min_requirement']	= $result['min_requirement'];
		$data['walkin_timing']	= $result['walkin_timing'];
		$data['contact_person']	= $result['contact_person'];
		$data['address']			= $result['address'];
		$data['type']				= ($result['type'])?"Full Time":"Part Time";
		$data['publish_date']		= $result['publish_date'];
		$data['country']			= $result['country'];
		$data['zone']				= $result['zone'];
		$data['phone_no']			= $result['phone'];
		$data['summery']			= $result['summery'];
		

		$this->document->setTitle($this->language->get('heading_title').' : '. $result['title']); 		
		$data['heading_title'] = $result['title'];
		
		$data['sub_heading_apply'] = $this->language->get('sub_heading_apply');
    	$data['entry_name']	 = $this->language->get('entry_name');
    	$data['entry_email']	 = $this->language->get('entry_email');
    	$data['entry_phone']	= $this->language->get('entry_phone');
		$data['entry_upload_resume']	= $this->language->get('entry_upload_resume');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		

		$data['button_save'] = $this->language->get('button_save');
    	$data['button_cancel'] = $this->language->get('button_cancel');


       if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['phone'])) {
			$data['error_phone'] = $this->error['phone'];
		} else {
			$data['error_phone'] = '';
		}

		
  		if (isset($this->error['upload_resume'])) {
			$data['error_upload_resume'] = $this->error['upload_resume'];
		} else {
			$data['error_upload_resume'] = '';
		}
		
		$url = '';

		if (isset($this->request->get['career_id'])) {
			$url = "career_id=".$this->request->get['career_id'];
		} else {
			$url = "career_id=".$this->request->post['career_id'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
   			'text'      => $this->language->get('text_home'),
       		'href'      => $this->url->link('common/home'),       		
       		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
        	'href'      => $this->url->link('information/career')       	
          	);

		$data['breadcrumbs'][] = array(
			'text'      => $data['heading_title'],
        	'href'      => $this->url->link('information/career/view', 'career_id='.$this->request->get['career_id'])        	
           	);
		
		if (isset($this->request->post['name'])) {
      		$data['name'] = $this->request->post['name'];
    	} else {
      		$data['name'] = '';
    	}

		if (isset($this->request->post['email'])) {
      		$data['email'] = $this->request->post['email'];
    	} else {
      		$data['email'] = '';
    	}

		if (isset($this->request->post['phone'])) {
      		$data['phone'] = $this->request->post['phone'];
    	} else {
      		$data['phone'] = '';
    	}


		$data['cancel'] = $this->url->link('information/career', $url);
		
		$data['action'] =	$this->url->link('information/career/view', $url);


		

		

		$data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
				
 		//$this->response->setOutput($this->render());	

 		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/information/career_apply.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/information/career_apply.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('information/career_apply.tpl', $data));
		}
 		     	
	}

		
  	private function validateForm() { 
	
		if ((strlen(utf8_decode($this->request->post['name'])) < 3) || (strlen(utf8_decode($this->request->post['name'])) > 32)) {
      		$this->error['name'] = $this->language->get('error_name');
		}
		

		$pattern = '/^[A-Z0-9._%-]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';
	


    	if (!preg_match($pattern, $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
		}

		if (!preg_match('/^1?[0-9]{10,15}$/', preg_replace('/[()\-+]/', '', $this->request->post['phone']))) {
      		$this->error['phone'] = $this->language->get('error_phone');
    	}

		if ($this->request->files['upload_resume']['name']) {
			if ((strlen(utf8_decode($this->request->files['upload_resume']['name'])) < 3) || (strlen(utf8_decode($this->request->files['upload_resume']['name'])) > 128)) {
        		$this->error['upload_resume'] = $this->language->get('error_filename');
	  		}	  	
			
			if (substr(strrchr($this->request->files['upload_resume']['name'], '.'), 1) == 'php') {
       	   		$this->error['upload_resume'] = $this->language->get('error_filetype');
       		}	
						
			if ($this->request->files['upload_resume']['error'] != UPLOAD_ERR_OK) {
				$this->error['warning'] = $this->language->get('error_upload_' . $this->request->files['upload_resume']['error']);
			}
		}else{
			$this->error['upload_resume'] = $this->language->get('error_upload_resume');
		}
				
		if (!$this->error) {
      		return TRUE;
    	} else {
      		return FALSE;
    	}
  	}
	function generateRandomString($length = 10) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
}
	
	
}

