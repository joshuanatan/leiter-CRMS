<?php
class Mdod_item extends CI_Model{
    public function select($where){
        return $this->db->get_where("od_item", $where);
    }
    public function insert($data){
        $this->db->insert("od_item",$data);
    }
}

?>