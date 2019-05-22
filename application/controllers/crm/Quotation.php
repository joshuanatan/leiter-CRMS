<?php
class Quotation extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model("Mdquotation");
        $this->load->model("Mdprice_request");
        $this->load->model("Mdquotation_item");
    }
    private function req(){
        $this->load->view("req/head");
        $this->load->view("crm/quotation/css/datatable-css");
        $this->load->view("crm/quotation/css/breadcrumb-css");
        $this->load->view("crm/quotation/css/modal-css");
        $this->load->view("crm/quotation/css/form-css");
        $this->load->view("req/head-close");
        $this->load->view("crm/crm-open");
        $this->load->view("req/top-navbar");
        $this->load->view("req/navbar");
    }
    public function index(){
        $this->req();
        $where = array(
            "quotation" => array(
                "status_quo" => 0  
            ),
            "price_request" => array(
                "price_request.status_request" => 3
            )
        );
        $data = array(
            "quotation_id" => $this->Mdquotation->maxId(),
            "quotation" => $this->Mdquotation->select($where["quotation"]),
            "request" => $this->Mdprice_request->select($where["price_request"])
        );
        $this->load->view("crm/content-open");
        $this->load->view("crm/quotation/category-header");
        $this->load->view("crm/quotation/category-body",$data);
        $this->load->view("crm/content-close");
        $this->close();
    }
    public function close(){
        $this->load->view("req/script");
        $this->load->view("crm/quotation/js/jqtabledit-js");
        $this->load->view("crm/quotation/js/page-datatable-js");
        $this->load->view("crm/quotation/js/form-js");
        $this->load->view("crm/quotation/js/dynamic-form-js");
        $this->load->view("crm/quotation/js/request-ajax");
        $this->load->view("crm/quotation/js/tabs-js");
        $this->load->view("crm/crm-close");
        $this->load->view("req/html-close");
    }
    public function detail(){
        $this->load->view("req/head");
        $this->load->view("detail/css/detail-css");
        $this->load->view("req/head-close");
        $this->load->view("detail/detail-open");
        $this->load->view("req/top-navbar");
        $this->load->view("req/navbar");
        /*--------------------------------------------------------*/
        $this->load->view("detail/content-open");
        $this->load->view("detail/quotation/profile");
        $this->load->view("detail/tab-open");
        $this->load->view("detail/quotation/tab-item");
        $this->load->view("detail/quotation/tab-content");
        $this->load->view("detail/tab-close");
        $this->load->view("detail/content-close");
        /*--------------------------------------------------------*/
        $this->load->view("req/script");
        $this->load->view("detail/js/detail-js");
        $this->load->view("detail/detail-close");
        $this->load->view("req/html-close");
    }
    public function addItemToQuotation(){
        $name = array("id_quotation","quo_version","id_request_item","item_amount","selling_price","margin_price");
        $data = array(
            $name[0] => $this->input->post($name[0]),
            $name[1] => $this->input->post($name[1]),
            $name[2] => $this->input->post($name[2]),
            $name[3] => $this->input->post($name[3]),
            $name[4] => $this->input->post($name[4]),
            $name[5] => $this->input->post($name[5]),
        );
        $this->Mdquotation_item->insert($data);
    }
    public function getQuotationItem(){
        $name = array("id_quotation","quo_version","id_request_item","item_amount","selling_price","margin_price");
        $where = array(
            $name[0] => $this->input->post($name[0]),
            $name[1] => $this->input->post($name[1]),
        );  
        $result = $this->Mdquotation_item->select($where);
        $html = "";
        foreach($result->result() as $a){
            $html .= "<tr><td>".$a->id_request_item."</td><td>".$a->nama_produk."</td><td>".$a->item_amount."</td><td>".$a->selling_price."</td><td>".$a->margin_price."</td><td><a href = '#'>REMOVE</a></td></tr>";
        }
        echo json_encode($html);
    }
    public function insertquotation(){
        $name = array("id_quo","no_quo","id_request","hal_quo","id_cp","up_cp","durasi_pengiriman","trigger_pengiriman","tambahan_pengiriman","franco","jadwal_produksi","jadwal_pengiriman","durasi_pembayaran","trigger_pembayaran","tambahan_pembayaran","mata_uang_pembayaran","dateline_quo","versi_quo","id_user_add");
        $data = array();
        for($a=0; $a<count($name)-1; $a++){
            $data += [$name[$a] => $this->input->post($name[$a])];
        }
        $data += ["id_user_add" => $this->session->id_user];
        $this->Mdquotation->insert($data);
        redirect("crm/quotation");
    }
    public function edit($i){
        $this->req();
        $where = array(
            "quotation" => array(
                "quotation.id_quo" => $i 
            ),
            "price_request" => array(
                "price_request.status_request" => 0
            ),
            "last_version" => array(
                "quotation.id_quo" => $i
            ),
        );
        $data = array(
            "quotation_id" => $this->Mdquotation->maxId(),
            "last_version" => $this->Mdquotation->maxVersion($where["last_version"]),
            "quotation" => $this->Mdquotation->select($where["quotation"]),
            "request" => $this->Mdprice_request->select($where["price_request"])
        );
        $this->load->view("crm/content-open");
        $this->load->view("crm/quotation/category-header");
        $this->load->view("crm/quotation/edit-quotation",$data);
        $this->load->view("crm/content-close");
        $this->close();
    }
    public function loss($i){

    }
    public function accepted($i){
        $where = array(
            "quo_version" => $this->input->post("quo_version"),
            "id_quo" => $i
        );
        
    }
}
?>