<?php
class ModelCatalogCareer extends Model {	

	public function getJobDetail($career_id) {
		$query = $this->db->query("SELECT c.*, cd.*, ct.name as country, z.name zone FROM " . DB_PREFIX ."career c LEFT JOIN " . DB_PREFIX . "career_description cd ON (c.career_id = cd.career_id) LEFT JOIN " . DB_PREFIX . "career_to_store c2s ON (c.career_id = c2s.career_id) LEFT JOIN " . DB_PREFIX ."country ct ON(c.country_id=ct.country_id) LEFT JOIN " . DB_PREFIX ."zone z ON(c.zone_id=z.zone_id) where cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' AND c.career_id='".(int)$career_id."'");
		return $query->row;	
	}

	public function getJobs($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "career c LEFT JOIN " . DB_PREFIX . "career_description cd ON (c.career_id = cd.career_id) LEFT JOIN " . DB_PREFIX . "career_to_store c2s ON (c.career_id = c2s.career_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' ORDER BY c.date_added  DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		$query = $this->db->query($sql);		
		return $query->rows;	
	}

	public function getTotalJobs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "career WHERE status = '1'");		
		return $query->row['total'];
	}

	public function addApplicantApplyDetail($career_id, $data) {
			
		$ip = $_SERVER["REMOTE_ADDR"]; 
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "career_applicant SET career_id = '". (int)$career_id ."',name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', ip='$ip', date_added = NOW(), status='1'");
		
		$applicant_id = $this->db->getLastId();

		if (isset($data['upload_resume'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "career_applicant SET upload_resume = '" . $this->db->escape($data['upload_resume']) . "' WHERE applicant_id = '" . (int)$applicant_id . "'");
      	}

		$this->cache->delete('career_applicant');
	}
}
