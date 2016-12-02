<?php
class ModelExtensionShippingTcs extends Model {
	
	function getTcsSetting(){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tcsshipment` ts WHERE ts.id = '1' ");

		return $query->row;
	}
	function CheckShipmentExist($order_id){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tcsshipmentdata` tsd WHERE tsd.order_id = '".$order_id."' ");
		if ($query->num_rows > 0){
			return $query->row;
		}else{
			return false;
			}
	}
			
	function AddShipmentData($dataArray){
		$this->db->query("INSERT INTO " . DB_PREFIX . "tcsshipmentdata SET order_id = '". $dataArray['order_id'] ."', consignment_number = '" . $dataArray['consignment_number'] . "', creation_date = '" . $dataArray['creation_date'] . "', status = '" . $dataArray['status'] . "' ");
			
	}
	
	/*
	@input parameters
	Username
	Password
	CustomerRef#
	*/
	function TraceShipment(){
		}
	
	
}
