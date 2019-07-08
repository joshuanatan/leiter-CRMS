<?php
class Od extends CI_Controller{
    public function __construct(){
        parent::__construct();  
        $this->load->model("Mdorder_confirmation");
        $this->load->model("Mdperusahaan");
        $this->load->model("Mdod_core");
        $this->load->model("Mdod_item");

        $this->load->library('Pdf_noHead');
    }
    private function req(){
        $this->load->view("req/head");
        $this->load->view("plugin/datatable/datatable-css");
        $this->load->view("plugin/breadcrumb/breadcrumb-css");
        $this->load->view("plugin/modal/modal-css");
        $this->load->view("plugin/form/form-css");
        $this->load->view("req/head-close");
        $this->load->view("crm/crm-open");
        $this->load->view("req/top-navbar");
        $this->load->view("req/navbar");
    }
    public function index(){
        $where = array(
            "od" => array(
                "status_od" => 0
            ),
            "oc" => array(
                "status_aktif_oc" => 0
            )
        );
        $field["od"] = array(
            "no_od", "id_od","id_submit_oc","id_courier","delivery_method","date_od_add"
        );
        $print["od"] = array(
            "no_od", "id_od","id_submit_oc","id_courier","delivery_method","date_od_add"
        );
        $field["od_item"] = array(
            "id_quotation_item","id_od_item","item_qty"
        );
        $print["od_item"] = array(
            "id_quotation_item","id_od_item","item_qty"
        );
        $result["od"] = $this->Mdorder_confirmation->getListOcForOd($where["oc"]);
        $data["od"] = foreachMultipleResult($result["od"],$field["od"],$print["od"]);

        for($a = 0; $a<count($data["od"]);$a++){
            $data["od"][$a]["nama_courier"] = get1Value("perusahaan","nama_perusahaan",array("id_perusahaan" => $data["od"][$a]["id_courier"]));
            $data["od"][$a]["no_quotation"] = get1Value("order_confirmation","no_quotation",array("no_oc" => $data["od"][$a]["no_oc"]));
            $data["od"][$a]["id_perusahaan"] = get1Value("quotation","id_perusahaan",array("no_quo" => $data["od"][$a]["no_quotation"])); 
            $data["od"][$a]["nama_perusahaan"] = get1Value("perusahaan","nama_perusahaan",array("id_perusahaan" => $data["od"][$a]["id_perusahaan"]));
            $data["od"][$a]["no_po_customer"] = get1Value("order_confirmation","no_po_customer",array("no_oc" => $data["od"][$a]["no_oc"]));

            $data["od"][$a]["franco"] = get1Value("quotation","franco",array("no_quo" => $data["od"][$a]["no_quotation"])); 
            $data["od"][$a]["items"] = array();
            $result["od_item"] = selectRow("od_item",array("no_od" => $data["od"][$a]["no_od"]));
            $data["od"][$a]["items"] = foreachMultipleResult($result["od_item"],$field["od_item"],$print["od_item"]);
            for($b = 0; $b<count($data["od"][$a]["items"]); $b++){
                $data["od"][$a]["items"][$b]["id_request_item"] = get1Value("quotation_item","id_request_item",array("id_quotation_item" => $data["od"][$a]["items"][$b]["id_quotation_item"]));

                $data["od"][$a]["items"][$b]["nama_produk"] = get1Value("price_request_item","nama_produk",array("id_request_item" => $data["od"][$a]["items"][$b]["id_request_item"]));
            }
        }

        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/od/category-header");
        $this->load->view("crm/od/category-body",$data);
        $this->load->view("crm/content-close");
        $this->close();
    }
    public function close(){
        $this->load->view("req/script");
        $this->load->view("plugin/form/form-js");
        $this->load->view("plugin/datatable/page-datatable-js");
        $this->load->view("plugin/tabs/tabs-js");
        $this->load->view("crm/od/js/request-ajax");
        $this->load->view("crm/crm-close");
        $this->load->view("req/html-close");
    }
    public function create(){
        $where = array(
            "oc" => array(
                "status_aktif_oc" => 0
            ),
            "courier" => array(
                "status_perusahaan" => 0,
                "peran_perusahaan" => "SHIPPING"
            )
        );
        $result["oc"] = $this->Mdorder_confirmation->getListOcForOd($where["oc"]);
        $field["oc"] = array(
            "id_submit_oc", "no_po_customer","id_submit_quotation"
        );
        $data["oc"] = foreachMultipleResult($result["oc"],$field["oc"],$field["oc"]);
        for($a = 0; $a<count($data["oc"]); $a++){
            $id_submit_request = get1Value("quotation","id_request",array("id_submit_quotation" => $data["oc"][$a]["id_submit_quotation"]));
            $id_perusahaan = get1Value("price_request", "id_perusahaan",array("id_submit_request" => $id_submit_request));
            $data["oc"][$a]["nama_perusahaan"] = get1Value("perusahaan","nama_perusahaan",array("id_perusahaan" => $id_perusahaan));
            $data["oc"][$a]["id_perusahaan"] = $id_perusahaan;
        }

        $result["courier"] = $this->Mdperusahaan->getListPerusahaan($where["courier"]);
        $field["courier"] = array(
            "nama_perusahaan","id_perusahaan"
        );
        $data["courier"] = foreachMultipleResult($result["courier"],$field["courier"],$field["courier"]); 
        $data["maxId"] = getMaxId("od_core","id_od",array("bulan_od" => date("m"),"tahun_od" => date("Y"),"status_aktif_od" => 0));
        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/od/category-header");
        $this->load->view("crm/od/add-od",$data);
        $this->load->view("crm/content-close");
        $this->close();
    }
    public function remove($id_od){
        $where = array(
            "id_od" => $id_od
        );
        $this->Mdod_core->delete($where);
        $this->Mdod_item->delete($where);
        redirect("crm/od");
    }
    public function createod(){
        $input = array(
            "id_oc_item" => $this->input->post("id_oc_item"), 
            "jumlah_kirim" => $this->input->post("jumlah_kirim"), 
        );
        $array = array(
            "id_oc_item" => array(),
            "jumlah_kirim" => array()
        );
        $counter = 0 ;
        foreach($input["id_oc_item"] as $a){
            $array["id_oc_item"][$counter] = $a;
            $counter++;
        }
        $counter = 0 ;
        foreach($input["jumlah_kirim"] as $a){
            $array["jumlah_kirim"][$counter] = $a;
            $counter++;
        }
        /*end insert od item*/
        /*begin insert od core */
        $data = array(
            "id_submit_oc" => $this->input->post("id_submit_oc"),
            "id_od" => $this->input->post("id_od"),
            "bulan_od" => date("m"),
            "tahun_od" => date("Y"),
            "no_od" => $this->input->post("no_od"),
            "id_courier" => $this->input->post("courier"),
            "delivery_method" => $this->input->post("method"),
            "alamat_pengiriman" => $this->input->post("alamat_pengiriman"),
            "up_cp" => $this->input->post("up_cp"),
            "id_user_add" => $this->session->id_user
        );
        $id_submit_od = insertRow("od_core",$data);
        
        for($a = 0; $a<count($array["jumlah_kirim"]); $a++){
            $data = array(
                "id_submit_od" => $id_submit_od,
                "id_oc_item" => $array["id_oc_item"][$a],
                "item_qty" => $array["jumlah_kirim"][$a]
            );
            insertRow("od_item",$data);
        }
        redirect("crm/od");
    }
    public function print(){
        $this->load->view("crm/print/od");
    }
    public function getOD(){
        
    }
    public function getOdItemPayment(){
        $where = array(
            "id_od" => $this->input->post("id_od")
        );
        //echo $this->input->post("id_od");
        $result = $this->Mdod_item->select($where);
        $count = 0;
        $data = array();
        $total = 0;
        foreach($result->result() as $a){
            $sellingPrice = get1Value("quotation_item","final_selling_price",array("id_quotation_item" => $a->id_quotation_item));
            $finalAmount = get1Value("quotation_item","final_amount",array("id_quotation_item" => $a->id_quotation_item));
            $id_produk = get1Value("price_request_item","id_produk",array("id_request_item" => get1Value("quotation_item","id_request_item",array("id_quotation_item" => $a->id_quotation_item))));
            
            $dp = get1Value("metode_pembayaran","nominal_pembayaran", array("id_oc" => get1Value("od_core","id_oc",array("id_od" => $this->input->post("id_od"))),"urutan_pembayaran" => 1));
            $amount = ($a->item_qty*($sellingPrice-$dp))/$finalAmount;
            $total += $amount;
            $data[$count] = array(
                "nama_produk" => get1Value("produk","nama_produk",array("id_produk" => $id_produk)),
                "item_qty" => $a->item_qty."/".$finalAmount." ITEMS SENT",
                "selling_price" => number_format($sellingPrice-$dp),
                "paymentAmount" => number_format($amount),
                "clean_nominal" => $total
            );
            $count++;
        }
        echo json_encode($data);
    }
    function odPdf(){
        $this->load->view('crm/od/pdf_od');
    }
}
?>