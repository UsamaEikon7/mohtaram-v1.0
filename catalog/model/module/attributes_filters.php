<?php

class ModelModuleAttributesFilters extends Model {

    public function getAttributesFilter($category_id, $count_product = false) {

        $data = array(
            'category_id' => $category_id,
            'count_product' => $count_product
        );

        return $this->getAttributes($data);
    }

    public function getAttributes($data) {
        $sql = "SELECT DISTINCT pa.text, a.attribute_id, ad.name, ag.attribute_group_id, agd.name as attribute_group_name FROM `" . DB_PREFIX . "product_attribute` pa" .
                " LEFT JOIN `" . DB_PREFIX . "attribute` a ON(pa.attribute_id=a.attribute_id) " .
                " LEFT JOIN `" . DB_PREFIX . "attribute_description` ad ON(a.attribute_id=ad.attribute_id) " .
                " LEFT JOIN `" . DB_PREFIX . "attribute_group` ag ON(ag.attribute_group_id=a.attribute_group_id) " .
                " LEFT JOIN `" . DB_PREFIX . "attribute_group_description` agd ON(agd.attribute_group_id=ag.attribute_group_id) " .
                " LEFT JOIN `" . DB_PREFIX . "product` p ON(p.product_id=pa.product_id) ";

        if ($data['category_id']) {
            $sql .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON(p.product_id=p2c.product_id) ";
        }

        $sql .= " LEFT JOIN `" . DB_PREFIX . "product_to_store` p2s ON(p.product_id=p2s.product_id) ";
        $sql .= " WHERE  p.status = '1' AND p.date_available <= NOW() AND p2s.store_id =" . (int) $this->config->get('config_store_id');

        if ($data['category_id']) {
            $sql .= " AND p2c.category_id = '" . (int) $data['category_id'] . "'";
        }

        $sql .= " AND pa.language_id = '" . (int) $this->config->get('config_language_id') . "'" .
                " AND ad.language_id = '" . (int) $this->config->get('config_language_id') . "'" .
                " AND agd.language_id = '" . (int) $this->config->get('config_language_id') . "'" .
                " ORDER BY ag.sort_order, agd.name, a.sort_order, ad.name, pa.text";

        $query = $this->db->query($sql);

        $attributes = array();
        foreach ($query->rows as $row) {
            if (!isset($attributes[$row['attribute_group_id']])) {
                $attributes[$row['attribute_group_id']] = array(
                    'name' => $row['attribute_group_name'],
                    'attribute_id' => $row['attribute_group_id'],
                    'attribute' => array()
                );
            }

            if (!isset($attributes[$row['attribute_group_id']]['attribute'][$row['attribute_id']])) {
                $attributes[$row['attribute_group_id']]['attribute'][$row['attribute_id']] = array(
                    'name' => $row['name'],
                    'attribute_id' => $row['attribute_id'],
                    'attributes' => array()
                );
            }
            $text = htmlspecialchars($row['text'], ENT_COMPAT);
            $attributes[$row['attribute_group_id']]['attribute'][$row['attribute_id']]['attributes'][] = array(
                'text' => $text, 
                'total' => ($data['count_product']) ? $this->getTotalAttributes($row['attribute_id'], $data, $text) : 0
            );
        }

        foreach ($attributes as $attribute_group_id => $attribute_group) {
            foreach ($attribute_group['attribute'] as $attribute_id => $attribute) {
                sort($attributes[$attribute_group_id]['attribute'][$attribute_id]['attributes']);
            }
        }
        return $attributes;
    }

    public function getTotalAttributes($attribute_id, $data, $text) {
        $sql = "SELECT count(*) as total, attribute_id, text  FROM " .
                "(SELECT DISTINCT p.product_id, p2aO.attribute_id, p2aO.text FROM `" . DB_PREFIX . "product` p " .
                " LEFT JOIN `" . DB_PREFIX . "product_to_store` p2s ON (p2s.product_id=p.product_id)" .
                " LEFT JOIN `" . DB_PREFIX . "product_attribute` p2aO ON (p2aO.product_id=p.product_id)";

        if ($data['category_id']) {
            $sql .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON(p.product_id=p2c.product_id) ";
        }
        
        $sql .= " WHERE attribute_id='" . $attribute_id . "' and text='".$text."'";

        $sql .= " AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = " . (int) $this->config->get('config_store_id');

        if ($data['category_id']) {
            $sql .= " AND p2c.category_id = '" . (int) $data['category_id'] . "'";
        }

        $sql .= ") as temptable WHERE 1 ";
        $sql .= " GROUP BY attribute_id, text";
        $query = $this->db->query($sql);

        if (count($query->rows) > 0){
            return $query->rows[0]['total'];
	}
	return 0;
    }

}

?>
