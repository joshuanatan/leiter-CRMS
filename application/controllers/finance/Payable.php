<?php
class Payable extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function req(){
        $this->load->view("req/head");
        $this->load->view("plugin/datatable/datatable-css");
        $this->load->view("plugin/breadcrumb/breadcrumb-css");
        $this->load->view("plugin/modal/modal-css");
        $this->load->view("plugin/form/form-css");
        $this->load->view("req/head-close");
        $this->load->view("finance/finance-open");
        $this->load->view("req/top-navbar");
        $this->load->view("req/navbar");
    }
    public function close(){
        $this->load->view("req/script");
        $this->load->view("plugin/datatable/page-datatable-js");
        $this->load->view("plugin/form/form-js");
        $this->load->view("plugin/tabs/tabs-js");
        $this->load->view("finance/finance-close");
        $this->load->view("req/html-close"); 
    }
    public function index(){
        $this->req();
        $this->load->view("finance/content-open");
        $this->load->view("finance/payable/category-header");
        $this->load->view("finance/payable/category-body");
        $this->load->view("finance/content-close");
        $this->close();
    }
    public function insert(){
        $this->req();
        $this->load->view("finance/content-open");
        $this->load->view("finance/payable/category-header");
        $this->load->view("finance/payable/add-invoice");
        $this->load->view("finance/content-close");
        $this->close();
    }
    public function edit($i){
        $this->req();
        $this->load->view("finance/content-open");
        $this->load->view("finance/payable/category-header");
        $this->load->view("finance/payable/edit-invoice");
        $this->load->view("finance/content-close");
        $this->close();
    }
    public function insertinvoice(){
        /*masukin data primarynya*/
        /*masukin ke table tax kalau taxnya di centang*/
    }
    public function pay($i){

    }
    public function remove($i){

    }
    public function editinvoice(){

    }

}

?>