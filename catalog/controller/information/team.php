<?php
class ControllerInformationteam extends Controller {
	public function index() {
		

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);



		$this->document->setTitle("Our Team");
		$this->document->setDescription("Our Team ");
		$this->document->setKeywords("Mohtaram, Team");

		$data['breadcrumbs'][] = array(
			'text' => "Our Team",
			'href' => $this->url->link('information/team')
		);

		$data['heading_title'] = "Our Team";

		$data['button_continue'] = $this->language->get('button_continue');

		//$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('information/team', $data));
		
				
				
		
	}

}