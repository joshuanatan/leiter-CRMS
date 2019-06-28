<?php
class Vendor extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model("Mdprice_request");
        $this->load->model("Mdprice_request_item");
        $this->load->model("Mdproduk_vendor");
        $this->load->model("Mdharga_vendor");
        $this->load->model("Mdcontact_person");
        $this->load->model("Mdmetode_pengiriman_shipping");
        $this->load->model("Mdperusahaan");
        $this->load->model("Mdvariable_shipping_price");
        $this->load->model("Mdvariable_courier_price");
        $this->load->model("Mdmata_uang");
    }
    /*default function*/
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
    public function close(){
        $this->load->view("req/script");
        $this->load->view("plugin/jqtabledit/jqtabledit-js");
        $this->load->view("plugin/datatable/page-datatable-js");
        $this->load->view("plugin/form/form-js");
        $this->load->view("crm/vendor-deal/js/dynamic-form-js");
        $this->load->view("crm/crm-close");
        $this->load->view("req/html-close");
    }
    /*page*/
    public function index(){
        $where = array(
            "request" => array(
                "price_request.status_request" => 1
            )
        );
        $field = array(
            "request" => array(
                "no_request","id_perusahaan","id_cp","id_request","bulan_request","tahun_request","untuk_stock"
            )
        );
        $print = array(
            "request" => array(
                "no_request","id_perusahaan","id_cp","id_request","bulan_request","tahun_request","untuk_stock"
            )
        );    
        $result["request"] = selectROw("price_request",$where["request"]);
        $data["request"] = foreachMultipleResult($result["request"],$field["request"],$print["request"]);
        for($a = 0; $a<count($data["request"]);$a++){
            $data["request"][$a]["nama_perusahaan"] = get1Value("perusahaan","nama_perusahaan",array("id_perusahaan" => $data["request"][$a]["id_perusahaan"]));

            $data["request"][$a]["nama_cp"] = get1Value("contact_person","nama_cp",array("id_cp" => $data["request"][$a]["id_cp"]));
        }
        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/vendor-deal/category-header");
        $this->load->view("crm/vendor-deal/category-body",$data);
        $this->load->view("crm/content-close");
        $this->close();
    }
    public function produk($id_request,$bulan,$tahun){
        /*harusnya ini tampilin dulu semua barangnya apa aja*/
        //$this->session->id_request = $id_request;
        $this->session->link = $id_request."/".$bulan."/".$tahun;
        $where = array(
            "request_item" => array(
                "no_request"=>"LI-".sprintf("%03d",$id_request)."/RFQ/".bulanRomawi((int)$bulan)."/".$tahun,
                "status_request_item" => 0,
            ),
            "supplier" => array(
                "peran_perusahaan" => "PRODUK",
                "status_perusahaan" => 0
            ),
            "matauang" => array()
        );
        $field = array(
            "request_item" => array(
                "nama_produk","id_request_item","jumlah_produk","notes_produk","file"
            ),
            "mata_uang" => array(
                "mata_uang"
            ),
            "supplier" => array(
                "id_perusahaan","nama_perusahaan"
            )
        );
        $print = array(
            "request_item" => array(
                "nama_produk","id_request_item","jumlah","notes","file"
            ),
            "mata_uang" => array(
                "mata_uang"
            ),
            "supplier" => array(
                "id_perusahaan","nama_perusahaan"
            )
        );
        $result["request_item"] = selectRow("price_request_item",$where["request_item"]);
        $data["request_item"] = foreachMultipleResult($result["request_item"],$field["request_item"],$print["request_item"]);

        $result["mata_uang"] = selectRow("mata_uang",$where["matauang"]);
        $data["mata_uang"] = foreachMultipleResult($result["mata_uang"],$field["mata_uang"],$print["mata_uang"]);

        $result["supplier"] = selectRow("perusahaan",$where["supplier"]);
        $data["supplier"] = foreachMultipleResult($result["supplier"],$field["supplier"],$print["supplier"]);
        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/vendor-deal/category-header");
        $this->load->view("crm/vendor-deal/product-vendor-price",$data);
        $this->load->view("crm/content-close");
        $this->close();
        $this->load->view("crm/vendor-deal/js/request-ajax");
    }
    public function supplier($id_request,$bulan,$tahun){
        /*harusnya ini tampilin dulu semua barangnya apa aja*/
        //$this->session->id_request = $id_request;
        $this->session->link = $id_request."/".$bulan."/".$tahun;
        $where = array(
            "request_item" => array(
                "no_request"=>"LI-".sprintf("%03d",$id_request)."/RFQ/".bulanRomawi((int)$bulan)."/".$tahun,
                "status_request_item" => 0,
            ),
            "mata_uang" => array(),
        );
        $field = array(
            "request_item" => array(
                "id_request_item","nama_produk","jumlah_produk","notes_produk","file"
            ),
            "mata_uang" => array(
                "mata_uang"
            ),
            "supplier" => array(
                "id_perusahaan","nama_perusahaan","notelp_perusahaan","nama_cp","nohp_cp","email_cp"
            )
        );
        $print = array(
            "request_item" => array(
                "id_request_item","nama_produk","jumlah_produk","notes_produk","file"
            ),
            "mata_uang" => array(
                "mata_uang"
            ),
            "supplier" => array(
                "id_perusahaan","nama_perusahaan","notelp_perusahaan","nama_cp","nohp_cp","email_cp"
            )
        );
        $result["request_item"] = selectRow("price_request_item",$where["request_item"]);
        $data["request_item"] = foreachMultipleResult($result["request_item"],$field["request_item"],$print["request_item"]);
        
        $result["mata_uang"] = selectRow("mata_uang",$where["mata_uang"]);
        $data["mata_uang"] = foreachMultipleResult($result["mata_uang"],$field["mata_uang"],$print["mata_uang"]);

        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/vendor-deal/category-header");
        $this->load->view("crm/vendor-deal/product-vendor-price",$data);
        $this->load->view("crm/content-close");
        $this->close();
        $this->load->view("crm/vendor-deal/js/request-ajax");
    }
    public function suppliershipping($id_request_item,$id_perusahaan){
        $this->session->id_detail = $id_request_item;
        $this->session->id_supplier = $id_perusahaan;
        $where = array(
            "requestitem" => array(
                "price_request_item.id_request_item"=>$id_request_item,
            ),
            "shipper" => array(
                "perusahaan.peran_perusahaan" => "SHIPPING",
                "perusahaan.status_perusahaan" => 0
            ),
        );
        $result["requestitem"] = $this->Mdprice_request_item->select($where["requestitem"]);
        $array["request_item"] = array();
        foreach($result["requestitem"]->result() as $a){
            $array["request_item"] = array(
                "id_request_item" => $a->id_request_item,
                "bn_produk" => get1Value("produk","bn_produk",array("id_produk" => $a->id_produk)),
                "nama_produk" => get1Value("produk","nama_produk",array("id_produk" => $a->id_produk)),
                "jumlah_produk" => getTotal("price_request_item","jumlah_produk",array("id_request" => $a->id_request, "id_produk" => $a->id_produk, "status_request_item" => 0)),
                "satuan_produk" => get1Value("produk","satuan_produk",array("id_produk" => $a->id_produk)),
                "nama_perusahaan" => get1Value("perusahaan","nama_perusahaan", array("id_perusahaan" => $id_perusahaan)),
                "alamat_perusahaan" => get1Value("perusahaan","alamat_perusahaan", array("id_perusahaan" => $id_perusahaan)),
            );
        }


        $data = array(
            "requestitemid" => $i,
            "requestitem" => $array["request_item"],
            "shipper" => $this->Mdperusahaan->select($where["shipper"]),
        );
        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/vendor-deal/category-header");
        $this->load->view("crm/vendor-deal/shipping-vendor-price",$data);
        $this->load->view("crm/content-close");
        $this->close();
        $this->load->view("crm/vendor-deal/js/request-ajax");
    }
    public function courier($i){
        $this->session->id_detail = $i;
        $where = array(
            "requestitem" => array(
                "price_request_item.id_request"=>$i,
                "status_request_item" => 0
            ),
            "shipper" => array(
                "perusahaan.peran_perusahaan" => "SHIPPING",
                "perusahaan.status_perusahaan" => 0
            ),
            
        );
        $result["requestitem"] = $this->Mdprice_request_item->select($where["requestitem"]);
        $array["requestitem"] = array();
        $counter = 0 ;
        foreach($result["requestitem"]->result() as $a){
            $array["requestitem"][$counter] = array(
                "id_request_item" => $a->id_request_item,
                "nama_produk" => get1Value("produk","nama_produk", array("id_produk" => $a->id_produk))
            );
            $counter++;
        }
        $data = array(
            "requestitem" => $array["requestitem"],
            "franco" => get1Value("price_request","franco",array("id_request" => $i)),
            "shipper" => $this->Mdperusahaan->select($where["shipper"])
        );
        $this->req();
        $this->load->view("crm/content-open");
        $this->load->view("crm/vendor-deal/category-header");
        $this->load->view("crm/vendor-deal/courier-vendor-price",$data);
        $this->load->view("crm/content-close");
        $this->close();
        $this->load->view("crm/vendor-deal/js/request-ajax");
    }
    /*ajax*/
    public function getvendorprice(){
        
        $html = "";
        $where = array(
            "price_request_item.id_request_item" => $this->input->post("id_request_item"),
        );
        $perusahaan = $this->Mdperusahaan->itemsupplier($where); 
        /*untuk ambil semua perusahaan yang punya barang ini */
        $counterId = 0;
        foreach($perusahaan->result() as $b){
            /*load contact person tiap perusahaan*/
            $matauangfinal = "";
            $where_matauang = array();
            $list_mata_uang = $this->Mdmata_uang->select($where_matauang);
            foreach($list_mata_uang->result() as $matauang){
                $matauangfinal .= "<option value = '".$matauang->mata_uang."'>".ucwords($matauang->mata_uang)."</option>";
            }
            $where = array(
                "price_request_item.id_request_item" => $this->input->post("id_request_item"),
                "harga_vendor.id_perusahaan" => $b->id_perusahaan, /*butuh step ini untuk ngeload setiap cp nya */ /*ada bug disini kalau yang diinput itu bukan cp yang pertama*/
            );
            $result = $this->Mdharga_vendor->selectPenawaran($where); 
            $tracingError = "";
            $tracingError .= "perusahaannya = ".$b->id_perusahaan." id_request_item = ".$where["price_request_item.id_request_item"]." jumlah row = ".$result->num_rows();
            if($result->num_rows() > 0){/*nah kalau misalnya udah ada di produk vendor dan ada di harga vendor */
                $tracingError .= " Status:Masuk If ";
                foreach($result->result() as $a){   
                    $where2 = array(
                        "id_perusahaan" => $b->id_perusahaan,
                        "contact_person.status_cp" => 0
                    );
                    $resultCp = $this->Mdcontact_person->select($where2);
                    $cp = "";
                    foreach($resultCp->result() as $optionCp){
                        if($optionCp->id_cp == $a->id_cp){
                            $cp .= "<option value = '".$optionCp->id_cp."' selected>".ucwords($optionCp->nama_cp)."</option>";
                        }
                        else{
                            $cp .= "<option value = '".$optionCp->id_cp."'>".ucwords($optionCp->nama_cp)."</option>";
                        }
                    }
                    $matauangfinal = "";
                    $where_matauang = array();
                    $list_mata_uang = $this->Mdmata_uang->select($where_matauang);
                    foreach($list_mata_uang->result() as $matauang){
                        if($matauang->mata_uang == $a->mata_uang){
                            $matauangfinal .= "<option value = '".$matauang->mata_uang."' selected>".ucwords($matauang->mata_uang)."</option>";
                        }
                        else{
                            $matauangfinal .= "<option value = '".$matauang->mata_uang."'>".ucwords($matauang->mata_uang)."</option>";
                        }
                    }
                    $harga=0;
                    $satuan=0;
                    $rate=0;
                    if($a->harga_produk == ""){
                        $harga = 0;
                    }
                    else{
                        $harga = $a->harga_produk;
                    }
                    if($a->satuan_harga_produk == ""){
                        $satuan = 0;
                    }
                    else{
                        $satuan = $a->satuan_harga_produk;
                    }
                    if($a->vendor_price_rate == ""){
                        $rate = 0;
                    }
                    else{
                        $rate = $a->vendor_price_rate;
                    }
                    
                    $html .= "<tr><input type ='hidden' value = '".$this->input->post("id_request_item")."' id = 'id_request_item".$counterId."'><input type ='hidden' value = '".$b->id_perusahaan."' id = 'idperusahaan".$counterId."'><td>".$a->nama_perusahaan."</td><td><select class = 'form-control' id = 'cp".$counterId."'>".$cp."</select></td><td>".$a->bn_produk_vendor."</td><td>".$a->nama_produk_vendor."</td><td><input type ='text' id = 'price".$counterId."' class = 'form-control' oninput = 'commas(\"price".$counterId."\")' value = '".number_format($harga)."'></td><td><input type ='text' id = 'vendor_price_rate".$counterId."' class = 'form-control' oninput = 'commas(\"vendor_price_rate".$counterId."\")' value = '".number_format($rate)."'></td><td><input type ='text' id = 'satuan_harga_produk".$counterId."' class = 'form-control' value = '".$satuan."'></td><td><select class = 'form-control' id = 'matauang".$counterId."'>".$matauangfinal."</select></td><td><a href = '".base_url()."crm/vendor/suppliershipping/".$this->input->post("id_request_item")."/".$a->id_perusahaan."' class = 'btn btn-sm btn-outline btn-primary' >SHIPPING PRICE</a></td><td><button type = 'submit' class = 'btn btn-sm btn-primary btn-outline' onclick = 'submitData(".$counterId.")'>SAVE</button></td></tr>";
                }
            }
            else{/*nah kalau misalnya udah ada di produk vendor dan belum masukin harga vendor */
                $where2 = array(
                    "id_perusahaan" => $b->id_perusahaan,
                    "contact_person.status_cp" => 0
                );
                $resultCp = $this->Mdcontact_person->select($where2);
                $cp = "";
                foreach($resultCp->result() as $optionCp){
                    $cp .= "<option value = '".$optionCp->id_cp."'>".ucwords($optionCp->nama_cp)."</option>";
                   
                }
                $tracingError .= " Status:else ";
                $html .= "<tr><input type ='hidden' value = '".$this->input->post("id_request_item")."' id = 'id_request_item".$counterId."'><input type ='hidden' value = '".$b->id_perusahaan."' id = 'idperusahaan".$counterId."'><td>".$b->nama_perusahaan."</td><td><select class = 'form-control' id = 'cp".$counterId."'>".$cp."</select></td><td>".$b->bn_produk_vendor."</td><td>".$b->nama_produk_vendor."</td><td><input type ='text' oninput = 'commas(\"price".$counterId."\")' id = 'price".$counterId."' class = 'form-control' value = '0'></td><td><input type ='text' oninput = 'commas(\"vendor_price_rate".$counterId."\")' id = 'vendor_price_rate".$counterId."' class = 'form-control' value = '0'></td><td><input type ='text' id = 'satuan_harga_produk".$counterId."' class = 'form-control' value = '0'></td>><td><select class = 'form-control' id = 'matauang".$counterId."'>".$matauangfinal."</select></td><td><a href = '".base_url()."crm/vendor/suppliershipping/".$this->input->post("id_request_item")."/".$b->id_perusahaan."' class = 'btn btn-sm btn-outline btn-primary' >SHIPPING PRICE</a></td><td><button type = 'submit' class = 'btn btn-sm btn-primary btn-outline' onclick = 'submitData(".$counterId.")'>SAVE</button></td></tr>";
            }
            $counterId++;
            //echo $tracingError;
        }
        
        echo json_encode($html);
    }
    public function insertvendorprice(){
        $where = array(
            "id_request_item" =>$this->input->post("id_request_item"),
            "id_perusahaan" => $this->input->post("id_perusahaan"),
        );
        $this->Mdharga_vendor->delete($where);
        $data = array(
            "id_request_item" =>$this->input->post("id_request_item"),
            "id_perusahaan" =>$this->input->post("id_perusahaan"),
            "id_cp" => $this->input->post("idcp"),
            "harga_produk" => splitterMoney($this->input->post("price"),","),
            "satuan_harga_produk" => $this->input->post("uom"),
            "vendor_price_rate" => splitterMoney($this->input->post("rate"),","),  
            "mata_uang" => $this->input->post("mata_uang"),  
            "id_user_add" => $this->session->id_user
        );
        
        $this->Mdharga_vendor->insert($data);
    }
    public function Venshippingmethod(){
        $where = array(
            "id_perusahaan" => $this->input->post("id_perusahaan"),
            "status_metode_pengiriman" => 0
        );
        $result = $this->Mdmetode_pengiriman_shipping->select($where);
        $html = "<option selected disabled>Choose Shipping Method</option>";
        foreach($result->result() as $a){
            $html .= "<option value ='".$a->metode_pengiriman."'>".$a->metode_pengiriman."</option>";
        }
        echo json_encode($html);
    }
    public function getContactPerson(){
        $where = array(
            "id_perusahaan" => $this->input->post("id_perusahaan"),
            "status_cp" => 0
        );
        $result = $this->Mdcontact_person->select($where);
        $html = "<option selected disabled>Choose Shipping Vendor CP</option>";
        foreach($result->result() as $a){
            $html .= "<option value ='".$a->id_cp."'>".$a->nama_cp."</option>";
        }
        echo json_encode($html);
    }
    public function getShippingPrice(){
        $where = array(
            "id_perusahaan" => $this->input->post("id_perusahaan"),
            "metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "id_request_item" => $this->input->post("id_request_item"),
            "id_supplier" => $this->session->id_supplier,
            "shipping_purpose" => $this->input->post("purpose"),
            "status_variable" => 0
        );
        $result = $this->Mdvariable_shipping_price->select($where);
        $html = "";
        foreach($result->result() as $a){
            $html .= "<tr><td>".$a->nama_variable."</td><td>".number_format($a->biaya_variable)."</td><td>".number_format($a->kurs_variable)."</td><td>".number_format($a->biaya_variable*$a->kurs_variable)."</td><td>".$a->mata_uang."</td><td><a href = '".base_url()."crm/vendor/removevariable/".$a->id_variable_shipping."' class = 'btn btn-sm btn-primary btn-outline'>REMOVE</a></td></tr>";
        }
        echo json_encode($html);
    }
    public function getCourierPrice(){
        $where = array(
            "metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "id_request_item" => $this->input->post("id_request_item"),
            "id_perusahaan" => $this->input->post("id_perusahaan"),
            "shipping_purpose" => $this->input->post("purpose"),
            "status_variable" => 0
        );
        $result = $this->Mdvariable_courier_price->select($where);
        $html = "";
        foreach($result->result() as $a){
            $html .= "<tr><td>".$a->nama_variable."</td><td>".number_format($a->biaya_variable)."</td><td>".number_format($a->kurs_variable)."</td><td>".number_format($a->biaya_variable*$a->kurs_variable)."</td><td>".$a->mata_uang."</td><td><a href = '".base_url()."crm/vendor/removecouriervariable/".$a->id_variable_courier."' class = 'btn btn-sm btn-primary btn-outline'>REMOVE</a></td></tr>";
        }
        echo json_encode($html);
    }
    public function getitemdimension(){
        $where = array(
            "id_request_item" => $this->input->post("id_request_item")
        );
        $result = $this->Mdprice_request_item->select($where);
        foreach($result->result() as $a){
            echo json_encode(getTotal("price_request_item","jumlah_produk",array("id_request" => $a->id_request,"id_produk" => $a->id_produk))." ".get1Value("produk","satuan_produk",array("id_produk" => $a->id_produk)));
        }
    }
    public function getVendors(){
        $where = array(
            "harga_vendor.id_request_item" => $this->input->post("id_request_item"),
        );
        $result = $this->Mdharga_vendor->select($where);
        $data = array();
        $counter = 0;
        foreach($result->result() as $a){
            $data[$counter] = array(
                "id_perusahaan" => $a->id_perusahaan,
                "nama_perusahaan" => get1Value("perusahaan","nama_perusahaan",array("id_perusahaan" => $a->id_perusahaan))
            );
        }
        echo json_encode($data);
    }
    public function getVendorPrices(){
        $where = array(
            "harga_vendor.id_perusahaan" => $this->input->post("id_perusahaan"),
            "status_harga_vendor" => 0,
            "id_request_item" => $this->session->id_request_item,
        );
        $result = $this->Mdharga_vendor->select($where);

        foreach($result->result() as $a){
            $data["items"] = array(
                "harga_produk" => $a->harga_produk,
                "rate" => $a->vendor_price_rate,
                "mata_uang" => $a->mata_uang
            );
        }
        echo json_encode($data);
    }
    public function getShippers(){
        $this->session->id_request_item = $this->input->post("id_request_item");
        $where = array(
            "variable_shipping_price.id_request_item" => $this->input->post("id_request_item")
        );
        $result = $this->Mdvariable_shipping_price->selectVendorShipping($where);
        $html = "<option selected disabled>Choose Shippers</option>";
        foreach($result->result() as $a){
            $html .= "<option value = '".$a->id_cp."-".$a->metode_pengiriman."'>".$a->nama_perusahaan." - ".$a->metode_pengiriman."</option>";
        }
        echo json_encode($html);
    }
    public function getShipper(){ /*ajax response to get specific shippers based on chosen supplier and items */
        $where = array(
            "variable_shipping_price.id_supplier" => $this->input->post("id_perusahaan"),
            "variable_shipping_price.id_request_item" => $this->input->post("id_request_item")
        );
        $result = $this->Mdvariable_shipping_price->selectVendorShipping($where);
        $data = array();
        $counter = 0 ;
        foreach($result->result() as $a){
            $data[$counter] = array(
                "id_perusahaan" => $a->id_perusahaan,
                "nama_perusahaan" => get1Value("perusahaan","nama_perusahaan", array("id_perusahaan" => $a->id_perusahaan)),
                "metode_pengiriman" => $a->metode_pengiriman,
            );
            $counter++;
        }
        echo json_encode($data);
    }
    public function getShipperPrice(){ /*ini yang ajax di quotation*/
        $where = array(
            "variable_shipping_price.id_request_item" => $this->session->id_request_item,
            "variable_shipping_price.id_supplier" => $this->input->post("id_supplier"),
            "variable_shipping_price.id_perusahaan" => $this->input->post("id_perusahaan"),//harusnya id perusahaan si shippernya
            "variable_shipping_price.metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "status_variable" => 0
        );
        //echo $this->input->post("metode_pengiriman");
        //echo $this->input->post("id_cp");

        $result = $this->Mdvariable_shipping_price->countPrice($where);
        foreach($result->result() as $a){
            echo json_encode(number_format(ceil($a->total)),2);
        }
    }
    public function getCouriers(){
        $this->session->id_request_item = $this->input->post("id_request_item");
        $where = array(
            "variable_courier_price.id_request_item" => $this->input->post("id_request_item")
        );
        $result = $this->Mdvariable_courier_price->selectVendorShipping($where);
        $html = "<option selected disabled>Choose Courier</option>";
        foreach($result->result() as $a){
            $html .= "<option value = '".$a->id_cp."-".$a->metode_pengiriman."'>".$a->nama_perusahaan." - ".$a->metode_pengiriman."</option>";
        }
        echo json_encode($html);
    } 
    public function getCourierPrices(){ /*ini yang ajax di quotation*/
        $where = array(
            "variable_courier_price.id_request_item" => $this->session->id_request_item,
            "variable_courier_price.id_cp" => $this->input->post("id_cp"),
            "variable_courier_price.metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "status_variable" => 0
        );
        $result = $this->Mdvariable_courier_price->countPrice($where);
        foreach($result->result() as $a){
            echo json_encode(number_format(ceil($a->total)),2);
        }
    }
    public function getcurrency(){
        $where = array();
        $result = $this->Mdmata_uang->select($where);
        $echo = "";
        switch(strtolower($this->input->post("result"))){
            case "html":{
                $echo = "";
                foreach($result->result() as $a){
                    $echo .= "<option value = '".strtoupper($a->mata_uang)."'>".strtoupper($a->mata_uang)."</option>";
                }
            }
            break;
            case "array":{
                $echo = array();
                $counter = 0;
                foreach($result->result() as $a){
                    $echo[$counter] = $a->mata_uang;
                    $counter++;
                }
            }
        }
        echo json_encode($echo);
        
    }
    public function getSupplierPriceWithResult(){
        //echo $this->input->post("id_perusahaan");
        $where = array(
            "harga_vendor.id_request_item" => $this->input->post("id_request_item"),
            "harga_vendor.id_perusahaan" => $this->input->post("id_perusahaan"),
        );
        $result = $this->Mdharga_vendor->select($where);
        $final = array();
        switch(strtolower($this->input->post("result"))){
            case "html":
            break;
            case "array":
                foreach($result->result() as $a){
                    $final = array(
                        $a->harga_produk,
                        $a->vendor_price_rate,
                        $a->mata_uang,
                        $a->satuan_harga_produk,
                        $a->nama_perusahaan,
                        $a->alamat_perusahaan
                    );
                }
            break;
        }
        echo json_encode($final);
    }
    public function getShipperWithResult(){
        $where = array(
            "id_request_item" => $this->input->post("id_request_item"),
            "id_supplier" => $this->input->post("id_supplier"),
        );
        $result = $this->Mdvariable_shipping_price->selectVendorShipping($where);
        $final = array();
        $count = 0;
        switch(strtolower($this->input->post("result"))){
            case "html":
            break;
            case "array":
            foreach($result->result() as $a){
                $final[$count] = array(
                    "id_shipper" => $a->id_perusahaan,
                    "nama_shipper" => $a->nama_perusahaan,
                    "metode_pengiriman" => $a->metode_pengiriman
                );  
                $count++;
            }
            break;
        }
        echo json_encode($final);
    }
    public function getShipperPriceWithResult(){
        $where = array(
            "id_request_item" => $this->input->post("id_request_item"),
            "id_supplier" => $this->input->post("id_supplier"),
            "metode_pengiriman"=> $this->input->post("metode_pengiriman"),
            "id_perusahaan"=> $this->input->post("id_perusahaan")
        );
        $result = $this->Mdvariable_shipping_price->countPrice($where);
        $final = array();
        $final += convertResultToKeyValueArray($result);
        $final += ["currency" => "IDR"];
        echo json_encode($final);
        
    }
    /*function*/
    public function removecouriervariable($i){
        $where = array(
            "id_variable_courier" => $i
        );
        $data = array(
            "status_variable" => 1
        );
        $this->Mdvariable_courier_price->update($data,$where);
        redirect("crm/vendor/courier/".$this->session->id_detail);
    }
    public function insertshippingdata(){
        $nama = array();
        $cost = array();
        $rate = array();
        $mata_uang = array();

        $variablee = $this->input->post("variable");
        $biayae = $this->input->post("biaya");
        $kurse = $this->input->post("kurs");
        $mata_uange = $this->input->post("mata_uang");
        //echo var_dump($this->input->post("variable"));
        $count = 0;
        foreach($variablee as $a){
            $nama[$count] = $a;
            $count++;
        }
        //echo "countnya = ".$count;
        $count = 0;
        foreach($biayae as $a){
            $cost[$count] = splitterMoney($a,",");
            $count++;
        }
        $count = 0;
        foreach($kurse as $a){
            $rate[$count] = splitterMoney($a,",");
            $count++;
        }
        $count = 0;
        foreach($mata_uange as $a){
            $mata_uang[$count] = $a;
            $count++;
        }
        
        for($a = 0; $a<count($cost); $a++){
            $data = array(
                "id_perusahaan" => $this->input->post("id_perusahaan"),
                "shipping_purpose" => $this->input->post("shipping_purpose"),
                "id_supplier" => $this->session->id_supplier,
                "id_cp" => $this->input->post("id_cp"),
                "metode_pengiriman" => $this->input->post("metode_pengiriman"),
                "nama_variable" => $nama[$a],
                "biaya_variable" => $cost[$a],
                "kurs_variable" => $rate[$a],
                "mata_uang" => $mata_uang[$a],
                "id_request_item" => $this->input->post("items"),
                "id_user_add" => $this->session->id_user
            );
            $this->Mdvariable_shipping_price->insert($data);
        }
        redirect("crm/vendor/suppliershipping/".$this->session->id_detail."/".$this->session->id_supplier);

    }
    public function insertcouriershippingdata(){
        $nama = array();
        $cost = array();
        $rate = array();
        $mata_uang = array();

        $mata_uange = $this->input->post("mata_uang");
        $variablee = $this->input->post("variable");
        $biayae = $this->input->post("biaya");
        $kurse = $this->input->post("kurs");
        //echo var_dump($this->input->post("variable"));
        $count = 0;
        foreach($variablee as $a){
            $nama[$count] = $a;
            $count++;
        }
        //echo "countnya = ".$count;
        $count = 0;
        foreach($biayae as $a){
            $cost[$count] = $a;
            $count++;
        }
        $count = 0;
        foreach($kurse as $a){
            $rate[$count] = $a;
            $count++;
        }
        $count = 0;
        foreach($mata_uange as $a){
            $mata_uang[$count] = $a;
            $count++;
        }
        
        for($a = 0; $a<count($cost); $a++){
            $data = array(
                "shipping_purpose" => $this->input->post("shipping_purpose"),
                "id_perusahaan" => $this->input->post("id_perusahaan"),
                "id_cp" => $this->input->post("id_cp"),
                "metode_pengiriman" => $this->input->post("metode_pengiriman"),
                "nama_variable" => $nama[$a],
                "biaya_variable" => splitterMoney($cost[$a],","),
                "kurs_variable" => splitterMoney($rate[$a],","),
                "mata_uang" => $mata_uang[$a],
                "id_request_item" => $this->input->post("items"),
                "id_user_add" => $this->session->id_user
            );
            $this->Mdvariable_courier_price->insert($data);
        }
        redirect("crm/vendor/courier/".$this->session->id_detail);

    }
    public function removevariable($i){
        $where = array(
            "id_variable_shipping" => $i
        );
        $data = array(
            "status_variable" => 1
        );
        $this->Mdvariable_shipping_price->update($data,$where);
        redirect("crm/vendor/suppliershipping/".$this->session->id_detail."/".$this->session->id_supplier);
    }
    public function delete($i){
        $where = array(
            "price_request.id_request" => $i
        );
        $data = array(
            "price_request.status_request" => 1
        );
        $this->Mdprice_request->update($data,$where);
        redirect("crm/vendor");
    }
    public function submit($i){
        $where = array(
            "price_request.id_request" => $i
        );
        $data = array(
            "price_request.status_request" => 3
        );
        $this->Mdprice_request->update($data,$where);
        redirect("crm/vendor");
    }
    public function getShippingMethod(){
        $where = array(
            "id_perusahaan" => $this->input->post("id_perusahaan"),
            "Status_metode_pengiriman" => 0
        );
        $result = $this->Mdmetode_pengiriman_shipping->select($where);
        $html = "<option>Select Shipping Method</option>";
        foreach($result->result() as $a){
            $html .= "<option value = '".$a->metode_pengiriman."'>".$a->metode_pengiriman."</option>";
        }
        echo json_encode($html);
    }
    public function insertHargaSupplier(){
        $config = array(
            "upload_path" => "./assets/dokumen/hargasupplier/",
            "allowed_types" => "xls|xlsx|doc|docx|pdf|zip|jpg|jpeg|png|gif"
        );
        $this->load->library("upload",$config);
        if($this->upload->do_upload("attachment")){
            $fileData = $this->upload->data();
        }
        else{
            $fileData["file_name"] = "-";
        }
        $data = array(
            "id_request_item" =>  $this->session->id_request_item,
            "nama_perusahaan" =>  $this->input->post("nama_perusahaan"),
            "nama_cp" =>  $this->input->post("nama_cp"),
            "harga_produk" =>  splitterMoney($this->input->post("price"),","),
            "vendor_price_rate" => splitterMoney($this->input->post("rate"),","),
            "mata_uang" => $this->input->post("currency"),
            "notes" => $this->input->post("notes"),
            "attachment" =>  $fileData["file_name"],
        );
        insertRow("harga_vendor",$data);
        redirect("crm/vendor/supplier/".$this->session->link);
    }
    public function insertHargaCourier(){
        $config = array(
            "upload_path" => "./assets/dokumen/hargasupplier/",
            "allowed_types" => "xls|xlsx|doc|docx|pdf|zip|jpg|jpeg|png|gif"
        );
        $this->load->library("upload",$config);
        if($this->upload->do_upload("attachment")){
            $fileData = $this->upload->data();
        }
        else{
            $fileData["file_name"] = "-";
        }
        $data = array(
            "id_request_item" =>  $this->session->id_request_item,
            "nama_perusahaan" =>  $this->input->post("nama_perusahaan"),
            "nama_cp" =>  $this->input->post("nama_cp"),
            "harga_produk" =>  splitterMoney($this->input->post("price"),","),
            "vendor_price_rate" => splitterMoney($this->input->post("rate"),","),
            "metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "mata_uang" => $this->input->post("currency"),
            "notes" => $this->input->post("notes"),
            "attachment" =>  $fileData["file_name"],
        );
        insertRow("harga_courier",$data);
        redirect("crm/vendor/supplier/".$this->session->link);
    }
    public function insertHargaShipping(){
        $config = array(
            "upload_path" => "./assets/dokumen/hargasupplier/",
            "allowed_types" => "xls|xlsx|doc|docx|pdf|zip|jpg|jpeg|png|gif"
        );
        $this->load->library("upload",$config);
        if($this->upload->do_upload("attachment")){
            $fileData = $this->upload->data();
        }
        else{
            $fileData["file_name"] = "-";
        }
        $data = array(
            "id_harga_vendor" =>  $this->input->post("id_harga_vendor"),
            "nama_perusahaan" =>  $this->input->post("nama_perusahaan"),
            "nama_cp" =>  $this->input->post("nama_cp"),
            "harga_produk" =>  splitterMoney($this->input->post("price"),","),
            "vendor_price_rate" => splitterMoney($this->input->post("rate"),","),
            "metode_pengiriman" => $this->input->post("metode_pengiriman"),
            "mata_uang" => $this->input->post("currency"),
            "notes" => $this->input->post("notes"),
            "attachment" =>  $fileData["file_name"],
        );
        insertRow("harga_shipping",$data);
        redirect("crm/vendor/supplier/".$this->session->link);
    }
}
?>