<?php

class ControllerExtensionPaymentEasypay extends Controller {
	public function index() {
	  
		$this->language->load('extension/payment/easypay');
		$this->load->model('checkout/order');
		
		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$data['action'] = '';
		$live = trim($this->config->get('easypay_live'));
		if($live) {
			$data['action'] = 'https://easypay.easypaisa.com.pk/easypay/Index.jsf';
		} else {
			$data['action'] = 'https://easypaystg.easypaisa.com.pk/easypay/Index.jsf';
			//$data['action'] = 'http://localhost:9080/easypay/Index.jsf';
		}

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		if ($order_info) {
			$data['easypay_storeId'] = trim($this->config->get('easypay_storeId'));
			
			$expiryDays = trim($this->config->get('easypay_expiry'));
			$currentDate = new DateTime();
			$currentDate->modify('+'.$expiryDays.'day');
			$expiryDate = $currentDate->format('Ymd His');

			$data['easypay_expiry'] = $expiryDate;
			$data['easypay_orderId_prefix'] = trim($this->config->get('easypay_orderId_prefix'));
			$data['easypay_hashKey'] = trim($this->config->get('easypay_hashKey'));
			$data['easypay_payment_method'] = trim($this->config->get('easypay_payment_method'));
			$data['easypay_auto_redirection'] = trim($this->config->get('easypay_auto_redirection'));
			$data['orderid'] = $this->session->data['order_id'];
			$data['currency'] = $order_info['currency_code'];
			$data['orderamount'] = $this->currency->format($order_info['total'], $data['currency'] , false, false);
			$data['billemail'] = $order_info['email'];
			$data['billphone'] = html_entity_decode($order_info['telephone'], ENT_QUOTES, 'UTF-8');
			
			$data['return_url'] = $this->url->link('extension/payment/easypay/callback', '', true);
			return $this->load->view('extension/payment/easypay', $data);
		}
	}
  
	public function callBack() {
		
		$this->load->model('checkout/order');
		
		$live = trim($this->config->get('easypay_live'));
		if($live) {
			$data['action'] = 'https://easypay.easypaisa.com.pk/easypay/Confirm.jsf'; // Callback url for 2nd and final Redirection
		} else {
			//$data['action'] = 'http://localhost:9080/easypay/Confirm.jsf';
			$data['action'] = 'https://easypaystg.easypaisa.com.pk/easypay/Confirm.jsf';
		}
		
		$data['callbackurl'] = $this->url->link('extension/payment/easypay/confirm');
		
		if (isset($this->request->get['auth_token'])) {
			$data['authtoken'] = $this->request->get['auth_token'];
			header( 'Location: '.$data['action'].'?auth_token='.$data['authtoken'].'&postBackURL='.$data['callbackurl']);
		} else {
			$order_status_id = 10; // Order is failed.
			$this->load->model('checkout/order');
			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $order_status_id);
			$this->response->redirect($this->url->link('checkout/failure'));
		}
	}
	
	public function confirm() {
		
		if (isset($this->request->get['status'])) { // Checking status received in 2nd Redirection to update order status is oc_order. This executes after 2ndRedirection
			if (isset($this->request->get['orderRefNumber'])) {
				$order_id = $this->request->get['orderRefNumber'];
			}
			$this->load->model('checkout/order');
			$order_info = $this->model_checkout_order->getOrder($order_id);
			if ($order_info) {
				if ($this->request->get['status'] == '0000') {
					$order_status_id = 15; // Order is successfully placed.
					$this->load->model('checkout/order');
					$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);
				}
				if ($this->request->get['status'] == '0001') {
					$order_status_id = 10; // Order is failed.
					$this->load->model('checkout/order');
					$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);
				}
			}
		} 
		
		else {// Redirect to Opencart success page. This executes when final redirection occurs (from Thank you page)
			$this->load->model('checkout/order');
			$order = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			$order_status = $order['order_status_id'];
			if($order_status == 10) {
				$this->response->redirect($this->url->link('checkout/failure'));
			} else {
				$this->response->redirect($this->url->link('checkout/success'));
			}
		}
		
	}
	
	public function easypayIPN() {
		if (isset($this->request->get['url'])) {
			$url = $this->request->get['url'];
			$curl = curl_init();
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($curl, CURLOPT_URL, $url); 
			$output=curl_exec($curl);
			
			if($output != null) {
				$orderRefNumber = substr($url, strrpos($url, '/') + 1);
				$this->load->model('checkout/order');
				$order_info = $this->model_checkout_order->getOrder($orderRefNumber);
				if ($order_info) {
					//Parsing Response
					$jsonResponse = json_decode($output, true);
					if(isset($jsonResponse['transaction_status'])) {
						$transStatus = $jsonResponse['transaction_status'];
						
						if ($transStatus == 'DROPPED' || $transStatus == 'FAILED') {
							$order_status_id = 15;
							$this->load->model('checkout/order');
							$this->model_checkout_order->addOrderHistory($orderRefNumber, $order_status_id);
						}
						if ($transStatus == 'PAID') {
							$order_status_id = 5; //Complete
							$this->load->model('checkout/order');
							$this->model_checkout_order->addOrderHistory($orderRefNumber, $order_status_id);
						}
					} else {
						echo "Transaction status is not selected as IPN Param, hence order state is failed to set in order table";
					}
				}
			}
		}
	}
}
?>