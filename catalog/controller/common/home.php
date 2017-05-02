<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		// ID for home page banner is fixed in admin panel
		// This will only get the banner of home page
		$data['results'] = $this->model_design_banner->getBanner(9);
		//print_r($data['results']); exit;
		// ID 10,11, 12 are the section 2 banners
		$data['results'] 		= 	$this->model_design_banner->getBanner(9);
		$data['v_section_2_a'] 	= 	$this->model_design_banner->getBanner(10);
		$data['v_section_2_b'] 	= 	$this->model_design_banner->getBanner(11);
		$data['v_section_2_c'] 	= 	$this->model_design_banner->getBanner(12);
		$data['v_gallery'] 		= 	$this->model_design_banner->getBanner(13);
		//  print_r($data['v_gallery']); exit;
		// all those data passes into this variable will only be sent to blog html
		
		$blogdata['banner1']	=	$this->model_design_banner->getBanner(15);
		$blogdata['banner2']	=	$this->model_design_banner->getBanner(16);
		$blogdata['banner3']	=	$this->model_design_banner->getBanner(17);
		$blogdata['banner4']	=	$this->model_design_banner->getBanner(18);
		
		// all those data passes into this variable will only goes to Campaign HTMl
		
		$campaign['banners']	=	$this->model_design_banner->getBanner(19);
				
		//print_r($data['results']); exit;
		$data['homebanner']		=	 $this->load->view('common/home/homebanner', $data);
		$data['section2']		=	 $this->load->view('common/home/section2', $data);
		$data['gallery']		=	 $this->load->view('common/home/gallery', $data);
		//print_r($data['gallery']); exit;
		$data['blog']			=	 $this->load->view('common/home/blog', $blogdata);
		$data['campaign']		=	 $this->load->view('common/home/campaign', $campaign);
		$data['about']			=	 $this->load->view('common/home/about', $data);
		$data['popup']			=	 $this->load->view('common/home/popup', $data);
		//print_r($data['footer']); exit;
		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
