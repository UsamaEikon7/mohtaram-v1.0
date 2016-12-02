<?php
class ModelGeneralGeneral extends Model {
	public function addquery($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "contact` SET c_name = '" . $this->db->escape($data['name']) . "', c_email = '" . $this->db->escape($data['email']) . "', c_subject = '" . $this->db->escape($data['subject']) . "', c_message = '" . $this->db->escape($data['enquiry']) . "', c_date = NOW()");

	}

}