<?php
class ControllerExtensionModuleTcs extends Controller {

	function index($data){
		$this->load->model('extension/shipping/tcs');
		$checkshipmentexist		=	$this->CheckShipmentExist($data['order_id']);
		$notice					=	array();
		if($checkshipmentexist){
			// shipment sent to tcs already
			$notice		['error']	=	1;
			$notice		['message']	=	"Shipment sent to Tcs Already";
			}
		else{
			// send data to tcs
			$this->load->model('checkout/order');
			$order_info = $this->model_checkout_order->getOrder($data['order_id']);
			//print_r($order_info); exit;
			$tcssetting		=	$this->model_extension_shipping_tcs->getTcsSetting();
			$OrderQntities	=	$this->model_checkout_order->GetOrderQuantities($data['order_id']);	
			//print_r($OrderQntities); exit;
			$OrderWeight	=	$this->model_checkout_order->GetOrderWeight($data['order_id']);	
			$OrderItemDesc	=	$this->model_checkout_order->GetOrderItemDescription($data['order_id']);
			$orderdesc		=	'';
			if(!empty($OrderItemDesc)){
				foreach($OrderItemDesc as $item){
					$orderdesc	.=	$item['name']."<br />";
					}
				}	
			
			$dataArray		=	array (
				'userName'			=>	$tcssetting['userName'],
				'password'			=>	$tcssetting['password'],
				'costCenterCode'	=>	$tcssetting['costCenterCode'],
				'originCityName'	=>	$tcssetting['originCityName'],
				'fragile'			=>	$tcssetting['fragile'],
				'insuranceValue'	=>	$tcssetting['insuranceValue'],
				'services'			=>	$tcssetting['services'],
				'consigneeName'		=>	$order_info['firstname'].' '.$order_info['lastname'],
				'consigneeAddress'	=>	$order_info['shipping_address_1'].' '.$order_info['shipping_address_2'].', '.$order_info['shipping_city'].', '.$order_info['shipping_zone'].', '.$order_info['shipping_country'].'. '.$order_info['shipping_postcode'],
				'consigneeMobNo'	=>	$order_info['telephone'],
				'consigneeEmail'	=>	$order_info['email'],
				'destinationCityName'=>	$order_info['shipping_city'],
				'pieces'			=>	$OrderQntities['total'],
				'weight'			=>	$OrderWeight['total'],
				'codAmount'			=>	$order_info['total'],
				'productDetails'	=>	$orderdesc,
				'custRefNo'			=>	'RG01205',
				'remarks'			=>	$order_info['comment'],
				'weight'			=>	0.5
				
				
				);
			//print_r($dataArray); exit;
			$response		=	$this->SendTcsSoapRequest('InsertData',$dataArray);
			print_r($response); exit;
				
			if($response['status'] == 0){
				// there was an error
				$notice['error']	=	1;
				$notice['message']	=	$response['message'];
				//echo ; exit;
				}
			else{
				// everything went great
				//echo "I love you";exit;
				//echo $response['message']->InsertDataResult; exit;
				
				// add an entry into the tcs shipment table along with the ref # returned.
				$tcsdataArray	=	array(
					'order_id'	=>	$data['order_id'],
					'consignment_number'	=>	$response['message']->InsertDataResult,
					'creation_date'	=>	date('Y-m-d h:i:s'),
					'status'	=>	1
					);
				$this->model_extension_shipping_tcs->AddShipmentData($tcsdataArray);
					
				$notice['error']	=	0;
				$notice['message']	=	$tcsdataArray;
				
				}		
			}
			//print_r($notice); exit;
			return $notice;	
		}	
	
	
	public function check() {
		$this->load->language('common/cart');

		// Totals
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;

		// Because __call can not keep var references so we put them into an array.
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
			
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_remove'] = $this->language->get('button_remove');

		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();

		foreach ($this->cart->getProducts() as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
				
				$price = $this->currency->format($unit_price, $this->session->data['currency']);
				$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
			} else {
				$price = false;
				$total = false;
			}

			$data['products'][] = array(
				'cart_id'   => $product['cart_id'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
				'quantity'  => $product['quantity'],
				'price'     => $price,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($totals as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
			);
		}

		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);

		return $this->load->view('common/cart', $data);
	}
	
	private function CheckShipmentExist($order_id = 0){
		$this->load->model('extension/shipping/tcs');
		return $this->model_extension_shipping_tcs->CheckShipmentExist($order_id);		
		}
	
	private function SendTcsSoapRequest($method,$dataArray = 0){
		// Tcs  web services url
		$url	=	"http://webapp.tcscourier.com/codapi/Service1.asmx?WSDL";
		$client = 	new SoapClient($url);
		$client->__getTypes();      
		$client->__getFunctions();
		if($dataArray == 0){
			$result = 	$client->$method();
		}else{
			$result = 	$client->$method($dataArray);
			}
		if (is_soap_fault($result)) {
    		 $response['status']	=	0;
			 $response['message']	=	"SOAP Fault: (faultcode: {$result->faultcode}, faultstring: {$result->faultstring})";
		}else{
			$response['status']	=	1;
			$response['message'] =	$result;
//			return $result;
			}
		return $response;		  
		}	

}
