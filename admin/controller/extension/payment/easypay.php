<?php
class ControllerExtensionPaymentEasypay extends Controller {
  private $error = array();
 
  public function index() {
    $this->language->load('extension/payment/easypay');
    $this->document->setTitle('Easypay Payment Method Configuration');
    $this->load->model('setting/setting');
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      $this->model_setting_setting->editSetting('easypay', $this->request->post);
      $this->session->data['success'] = 'Easypay configurations saved successfully';
      $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
    }
	// Config Panel Fields
    $data['heading_title'] = $this->language->get('heading_title');
	$data['entry_status'] = $this->language->get('entry_status');
    $data['entry_storeId'] = $this->language->get('entry_storeId');
    $data['entry_expiry'] = $this->language->get('entry_expiry');
    $data['entry_hashKey'] = $this->language->get('entry_hashKey');
    $data['entry_pay_methods'] = $this->language->get('entry_payment_methods');
    $data['entry_autoRedirect'] = $this->language->get('entry_autoRedirect');
    $data['entry_env_live'] = $this->language->get('entry_live');
	
	$data['edit_settings'] = $this->language->get('text_edit');
	
	// Config Panel Btns
    $data['button_save'] = $this->language->get('save_btn');
    $data['button_cancel'] = $this->language->get('cancl_btn');

    $data['enabled'] = $this->language->get('enabled');
    $data['disabled'] = $this->language->get('disabled');
	
	$data['text_enabled'] = $this->language->get('text_enabled');
	$data['text_disabled'] = $this->language->get('text_disabled');
 
	//Actions for Config Panel Btns
    $data['action'] = $this->url->link('extension/payment/easypay', 'token=' . $this->session->data['token'], true);
    $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);
	
	//Breadcrumbs
	$data['breadcrumbs'] = array();

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_home'),
		'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
	);

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_extension'),
		'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
	);

	$data['breadcrumbs'][] = array(
		'text' => $this->language->get('heading_title'),
		'href' => $this->url->link('extension/payment/easypay', 'token=' . $this->session->data['token'], true)
	);
		
	if (isset($this->request->post['easypay_status'])) {
		$data['easypay_status'] = $this->request->post['easypay_status'];
	} else {
		$data['easypay_status'] = $this->config->get('easypay_status');
	}
	
    if (isset($this->request->post['easypay_storeId'])) {
      $data['easypay_storeId'] = $this->request->post['easypay_storeId'];
    } else {
      $data['easypay_storeId'] = $this->config->get('easypay_storeId');
    }
        
    if (isset($this->request->post['easypay_expiry'])) {
      $data['easypay_expiry'] = $this->request->post['easypay_expiry'];
    } else {
      $data['easypay_expiry'] = $this->config->get('easypay_expiry');
    }
	
    if (isset($this->request->post['easypay_hashKey'])) {
      $data['easypay_hashKey'] = $this->request->post['easypay_hashKey'];
    } else {
      $data['easypay_hashKey'] = $this->config->get('easypay_hashKey');
    }

    if (isset($this->request->post['easypay_payment_method'])) {
      $data['easypay_payment_method'] = $this->request->post['easypay_payment_method'];
    } else {
      $data['easypay_payment_method'] = $this->config->get('easypay_payment_method');
    }

    if (isset($this->request->post['easypay_live'])) {
      $data['easypay_live'] = $this->request->post['easypay_live'];
    } else {
      $data['easypay_live'] = $this->config->get('easypay_live');
    }

    if (isset($this->request->post['easypay_auto_redirection'])) {
      $data['easypay_auto_redirection'] = $this->request->post['easypay_auto_redirection'];
    } else {
      $data['easypay_auto_redirection'] = $this->config->get('easypay_auto_redirection');
    }
 
    $this->load->model('localisation/order_status');
    $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

	$data['payment_methods'] = array();
    $data['payment_methods'] = $this->getPaymentMethods();

    //$this->template = 'extension/payment/easypay.tpl';
	
	$data['header'] = $this->load->controller('common/header');
	$data['column_left'] = $this->load->controller('common/column_left');
	$data['footer'] = $this->load->controller('common/footer');

	$this->response->setOutput($this->load->view('extension/payment/easypay', $data));
	
	/*$this->children = array(
	  'common/header',
	  'common/footer'
	);
 
	$this->response->setOutput($this->render());*/

  }

  public function getPaymentMethods() {

        return array(
            array('value'=>'', 'label'=>'All'),
            array('value'=>'CC_PAYMENT_METHOD', 'label'=>'Credit Card'),
            array('value'=>'MA_PAYMENT_METHOD', 'label'=>'Mobile Account'),            
            array('value'=>'OTC_PAYMENT_METHOD', 'label'=>'Over the counter'),                       
        );       
    }
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/easypay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}