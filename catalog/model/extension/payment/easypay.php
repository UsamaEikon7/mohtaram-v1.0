<?php
class ModelExtensionPaymentEasypay extends Model {
  public function getMethod($address, $total) {
    $this->load->language('extension/payment/easypay');
  
	if ($total > 0.00) {
		$status = true;
	} else {
		$status = false;
	}
	
	$method_data = array();
	
	if ($status) {
		$method_data = array(
		  'code'     => 'easypay',
		  'title'    => $this->language->get('text_title'),
		  'terms'      => '',
		  'sort_order' => ''
		);
	}
    return $method_data;
  }
}