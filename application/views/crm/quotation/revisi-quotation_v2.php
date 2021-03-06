<div class="panel-body col-lg-12">
    <div class="row row-lg">
        <div class="col-xl-12">
            <!-- Example Tabs Left -->
            <div class="example-wrap">
                <div class="nav-tabs-vertical" data-plugin="tabs">
                    <ul class="nav nav-tabs mr-25" role="tablist">
                        <li class="nav-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#primaryData" aria-controls="primaryData" role="tab">Primary Data</a></li>

                        <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#items" aria-controls="pengiriman" role="tab">Items</a></li>

                        <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#payment" aria-controls="produksi" role="tab">Pembayaran</a></li>
                        
                        <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#detail" aria-controls="produksi2" role="tab">Detail Quotation</a></li>
                        
                        <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#tambahan" aria-controls="pengiriman" role="tab">S&K Quotation</a></li>

                    </ul>
                    <form action = "<?php echo base_url();?>crm/quotation/insertrevision_v2" method = "post" enctype = "multipart/form-data">    
                        <div class="tab-content">
                            <div class="tab-pane active" id="primaryData" role="tabpanel">
                                <input 
                                    type = "hidden"  
                                    value = "<?php echo $quotation[0]["id_submit_quotation"];?>" 
                                    id = "id_submit_quotation"
                                    name = "id_submit_quotation" 
                                    required 
                                />
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">RFQ</h5>
                                    <input  
                                        type = "text" 
                                        value = "<?php echo $quotation[0]["no_request"];?>" 
                                        class = "form-control" 
                                        required 
                                        readonly
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Quotation No</h5> <!-- nanti ganti jadi select -->
                                    <input 
                                        type ="text" 
                                        value = "LI-<?php echo sprintf("%03d",$quotation[0]["id_quotation"]);?>/QUO/<?php echo bulanRomawi(date("m"));?>/<?php echo date("Y");?>/RV<?php echo $last_version-1;?>"
                                        id = "no_quotation" 
                                        class = "form-control"
                                        name = "no_quotation"  
                                        required 
                                        readonly  
                                    />
                                    <input 
                                        type ="hidden" 
                                        value = "<?php echo $quotation[0]["id_quotation"];?>" 
                                        id = "id_quotation"
                                        name = "id_quotation"  
                                    />
                                    <input 
                                        type ="hidden" 
                                        value = "<?php echo $quotation[0]["id_submit_request"];?>" 
                                        id = "id_request"
                                        name = "id_request"  
                                    />
                                </div>
                                <div class = "form-group">
                                    <input 
                                        type ="hidden" 
                                        value = "<?php echo $last_version;?>" 
                                        id = "versi_quotation" 
                                        class = "form-control"
                                        name = "versi_quotation"
                                        readonly 
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Perusahaan Customer</h5>
                                    <input 
                                        type ="text" 
                                        value = "<?php echo $quotation[0]["nama_perusahaan"];?>" 
                                        class = "form-control perusahaanCust" 
                                        readonly
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Nama Customer</h5>
                                    <input 
                                        type ="text" 
                                        value = "<?php echo $quotation[0]["nama_cp"];?>" 
                                        class = "form-control namaCust" 
                                        name = "" 
                                        readonly
                                    >
                                </div>
                            </div>
                            <!-- fungsi -->
                            <div class="tab-pane" id="items" role="tabpanel">
                                <div class = "form-group col-lg-12">
                                    <table class = "table table-stripped col-lg-12" style = "width:100%">
                                        <thead>
                                            <th>Add</th>
                                            <th>Vendor Price</th>
                                            <th style = "width:15%">Quotation Product Name</th>
                                            <th style = "width:15%">Modal</th>
                                            <th style = "width:15%">Selling Price</th>
                                            <th style = "width:15%">Amount (Jumlah Satuan)</th>
                                            <th style = "width:15%">Total</th>
                                            <th style = "width:15%">Margin</th>
                                            <th style = "width:5%">Gambar</th>
                                        </thead>
                                        <tbody id ="quotation_item_table">
                                            <?php for($a = 0;$a<count($items); $a++):?>
                                            <tr>
                                                <td>
                                                    <div class = "checkbox-custom checkbox-primary">
                                                        <input 
                                                            type = "checkbox" 
                                                            value = "<?php echo $items[$a]["id_request_item"];?>"
                                                            id = "checks<?php echo $a;?>" 
                                                            name = "checks[]" 
                                                            <?php if($items[$a]["id_quotation_item"] != ""): //belom ada di quotation item?>
                                                            checked
                                                            <?php endif;?>
                                                        >
                                                        <label></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <button type = "button" class = "btn btn-primary btn-sm" data-toggle = "modal" data-target = "#estimation<?php echo $a;?>">ESTIMATION</button>
                                                </td>
                                                <td>
                                                    <textarea 
                                                        name = "nama_produk_leiter<?php echo $items[$a]["id_request_item"];?>" 
                                                        class = "form-control"
                                                        ><?php 
                                                        if($items[$a]["nama_produk_leiter"] == ""): 
                                                            echo $items[$a]["nama_produk_request"]; 
                                                        else: 
                                                            echo $items[$a]["nama_produk_leiter"];
                                                        endif;
                                                        ?></textarea>
                                                </td>
                                                <td>
                                                    <input 
                                                        type = "text" 
                                                        id = "modal_vendor<?php echo $a;?>"
                                                        class = "form-control" 
                                                        readonly 
                                                        onclick="countTotalVendorPrice(<?php echo $a;?>)"
                                                        value = ""
                                                    />
                                                </td>
                                                <td>
                                                    <input 
                                                        type = "text" 
                                                        id = "selling_price<?php echo $a;?>" 
                                                        class = "form-control" 
                                                        name = "selling_price<?php echo $items[$a]["id_request_item"];?>"
                                                        required 
                                                        oninput = "commas('selling_price<?php echo $a;?>')" 
                                                        value = "<?php 
                                                        if($items[$a]["selling_price_quotation"] == ""): 
                                                            echo "0"; 
                                                        else: 
                                                            echo number_format($items[$a]["selling_price_quotation"],2); 
                                                        endif;?>"
                                                    />
                                                </td>
                                                <td>
                                                    <input 
                                                        type = "text" 
                                                        id = "item_amount<?php echo $a;?>" 
                                                        class = "form-control" 
                                                        name = "item_amount<?php echo $items[$a]["id_request_item"];?>" 
                                                        value = "<?php 
                                                        if($items[$a]["item_amount_quotation"] == ""): 
                                                            echo $items[$a]["jumlah_produk_request"];?> <?php echo $items[$a]["satuan_produk_request"]; 
                                                        else: 
                                                            echo $items[$a]["item_amount_quotation"];?> <?php echo $items[$a]["satuan_produk_quotation"]; 
                                                        endif;?>"
                                                    />
                                                </td>
                                                <td>
                                                    <input 
                                                        type = "text" 
                                                        id = "harga_jual<?php echo $a;?>" 
                                                        class = "form-control" 
                                                        readonly 
                                                        onclick = "totalJualBarang(<?php echo $a;?>)"
                                                        value = "<?php 
                                                        if($items[$a]["selling_price_quotation"] == ""):
                                                            echo "0";
                                                        else:
                                                            echo number_format($items[$a]["selling_price_quotation"]*$items[$a]["item_amount_quotation"],2);
                                                        endif;
                                                        ?>"
                                                    />
                                                </td>
                                                <td>
                                                    <input 
                                                        type = "text" 
                                                        id = "margin_price<?php echo $a;?>" 
                                                        class = "form-control"
                                                        name = "margin_price<?php echo $items[$a]["id_request_item"];?>" 
                                                        required 
                                                        readonly 
                                                        onclick = "getMarginItem(<?php echo $a;?>)" 
                                                        value = "<?php 
                                                        if($items[$a]["margin_price_quotation"] == ""):
                                                            echo "0";
                                                        else:
                                                            echo number_format($items[$a]["margin_price_quotation"],2);
                                                        endif;
                                                        ?>"
                                                    />
                                                </td>
                                                <td>
                                                    <button type = "button" class = "btn btn-primary btn-sm" data-target = "#uploadGambar<?php echo $a;?>" data-toggle = "modal">UPLOAD GAMBAR</button>    
                                                </td>
                                                
                                            </tr>
                                            <?php endfor;?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="payment" role="tabpanel">
                                <div class = "form-group">
                                    <h5 style = "opacity:0.5">Total Quotation Amount</h5>
                                    <input 
                                        type = "text" 
                                        id = "totalQuotation" 
                                        class = "form-control" 
                                        name = "total_quotation_price" 
                                        required 
                                        readonly 
                                        onclick = "getQuotationPrice()"
                                        value = "<?php echo number_format($quotation[0]["total_quotation_price"],2);?>"
                                    />
                                </div>
                                <div class = "row">
                                    <div class = "form-group col-lg-4 containerDp" style = ""> <!-- textarea klo DP % -->
                                        <h5 style = "opacity:0.5">DP (%)</h5>
                                        <input 
                                            type ="text"
                                            id = "persenDp" 
                                            class = "form-control"
                                            name = "persentase_pembayaran" 
                                            required 
                                            oninput = "paymentWithDP()" 
                                            value = "<?php echo $metode_pembayaran[0]["persentase_pembayaran"];?>"
                                        />
                                    </div>
                                    <div class = "form-group col-lg-4">
                                        <h5 style = "opacity:0.5">Payment Method</h5>
                                        <select class = "form-control" id = "paymentMethod" name = "trigger_pembayaran">
                                            <option value = "1">BEFORE DELIVERY</option>
                                        </select>
                                    </div>
                                    <div class = "form-group col-lg-4 containerDp" style = ""> <!-- Nominal DP -->
                                        <h5 style = "opacity:0.5">Jumlah DP</h5>
                                        <input 
                                            type ="text"
                                            id = "jumlahDp" 
                                            class = "form-control"
                                            name = "nominal_pembayaran" 
                                            required 
                                            value = "<?php echo number_format($metode_pembayaran[0]["nominal_pembayaran"],2);?>"
                                        />
                                    </div>
                                </div>
                                <div class = "row">
                                    <div class = "form-group col-lg-4 containerSisa" style = ""> <!-- textarea klo DP% -->
                                        <h5 style = "opacity:0.5">Pelunasan (%)</h5>
                                        <input 
                                            type ="text" 
                                            id = "persenSisa" 
                                            class = "form-control"
                                            name = "persentase_pembayaran2" 
                                            required 
                                            value = "<?php echo $metode_pembayaran[0]["persentase_pembayaran2"];?>"
                                        />
                                    </div>
                                    <div class = "form-group col-lg-4">
                                        <h5 style = "opacity:0.5">Payment Method</h5>
                                        <select class = "form-control" id = "paymentMethod" name = "trigger_pembayaran2">
                                            <option value = "1">BEFORE DELIVERY</option>
                                            <option value = "2" <?php if($metode_pembayaran[0]["trigger_pembayaran2"] == 2) echo "selected"; ?>>AFTER DELIVERY</option>
                                        </select>
                                    </div>  
                                    <div class = "form-group col-lg-4 containerSisa" style = ""> <!-- Nominal DP -->
                                        <h5 style = "opacity:0.5">Jumlah Pelunasan</h5>
                                        <input 
                                            type ="text"
                                            id = "jumlahSisa" 
                                            class = "form-control"
                                            name = "nominal_pembayaran2" 
                                            required 
                                            value = "<?php echo number_format($metode_pembayaran[0]["nominal_pembayaran2"],2);?>"
                                        />
                                    </div>
                                </div>
                                <div class = "form-group">
                                    <h5 style = "opacity:0.5">Durasi Pembayaran (... minggu setelah invoice diterima)</h5>
                                    <input 
                                        type ="text" 
                                        class = "form-control"
                                        name = "durasi_pembayaran" 
                                        required 
                                        value = "<?php echo $quotation[0]["durasi_pembayaran_quotation"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "opacity:0.5">Mata Uang Pembayaran</h5>
                                    <input 
                                        type ="text" 
                                        value ="IDR" 
                                        class = "form-control"
                                        name = "mata_uang_pembayaran" 
                                        required 
                                        value = "<?php echo $metode_pembayaran[0]["kurs"];?>"
                                    />
                                </div>
                                <!-- (1) invoice keluar triggernya abis keluarin OC -->
                                <!-- (2) invoice keluar triggernya abis keluarin OD -->
                                <!-- (3) 
                                keluar textarea buat isi persen, keluar invoice setelah OC untuk dp
                                selebihnya keluar setelah bkin OD
                                -->
                                <!-- (4) 
                                keluar textarea buat isi persen, keluar invoice setelah OC untuk dp
                                selebihnya keluar setelah bkin OD
                                -->
                            </div>
                            <!-- dokumen -->
                            <div class="tab-pane" id="detail" role="tabpanel">
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">No Quotation</h5>
                                    <input 
                                        type ="text" 
                                        value = "<?php echo $quotation[0]["no_quotation"];?>"
                                        class = "form-control" 
                                        required 
                                        readonly
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Quotation Perihal</h5>
                                    <input 
                                        type ="text" 
                                        class = "form-control"
                                        name = "hal_quotation" 
                                        required 
                                        value = "<?php echo $quotation[0]["hal_quotation"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Perusahaan Customer</h5>
                                    <input 
                                        type ="text" 
                                        value = "<?php echo $quotation[0]["nama_perusahaan"];?>" 
                                        class = "form-control perusahaanCust" 
                                        required
                                        readonly
                                        value = "<?php echo $quotation[0]["nama_perusahaan"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Nama Customer</h5>
                                    <input 
                                        type ="text" 
                                        value = "<?php echo $quotation[0]["nama_cp"];?>" 
                                        class = "form-control namaCust" 
                                        name = "" 
                                        readonly
                                        value = "<?php echo $quotation[0]["nama_cp"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Alamat Customer</h5>
                                    <textarea 
                                        name = "alamat_perusahaan" 
                                        class = "form-control" 
                                        id ="alamatCust"
                                        ><?php echo $quotation[0]["alamat_perusahaan"];?></textarea>
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Up Nama Customer</h5>
                                    <input 
                                        type ="text" 
                                        class = "form-control"
                                        name = "up_cp" 
                                        required 
                                        value = "<?php echo $quotation[0]["up_cp_quotation"];?>"
                                    />
                                </div>
                            </div>
                            <div class="tab-pane" id="tambahan" role="tabpanel">
                                
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Durasi Pengiriman (... Minggu setelah PO di konfirmasi)</h5>
                                    <input 
                                        type ="text" 
                                        class = "form-control"
                                        name = "durasi_pengiriman" 
                                        required 
                                        value = "<?php echo $quotation[0]["durasi_pengiriman_quotation"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Masa Berlaku Quotation</h5>
                                    <input 
                                        type ="date" 
                                        class = "form-control"
                                        name = "dateline_quotation" 
                                        required 
                                        value = "<?php echo $quotation[0]["dateline_quotation"];?>"
                                    />
                                </div>
                                <div class = "form-group">
                                    <h5 style = "color:darkgrey; opacity:0.8">Franco</h5>
                                    <input 
                                        type ="text" 
                                        id = "franco" 
                                        class = "form-control"
                                        name = "franco" 
                                        required 
                                        value = "<?php echo $quotation[0]["franco_quotation"];?>"
                                    /> 
                                </div>
                                
                                <button class = "btn btn-primary btn-outline btn-sm">SUBMIT</button>
                            </div>
                        </div>
                        <div class = "form-group">
                            <a href = "<?php echo base_url();?>crm/quotation" class = "btn btn-outline btn-primary btn-sm">BACK</a>
                        </div>
                        <?php for($a = 0; $a<count($items); $a++):?>
                        <div class = "modal fade" id = "uploadGambar<?php echo $a;?>">
                            <div class = "modal-dialog modal-lg">
                                <div class = "modal-content">
                                    <div class = "modal-header"></div>
                                    <div class = "modal-body">
                                        <div class = "form-group">
                                            <h5>Upload Gambar Produk Quotation</h5>
                                            <input 
                                                type = "file" 
                                                name = "attachment<?php echo $items[$a]["id_request_item"];?>"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class = "modal fade" id = "estimation<?php echo $a;?>">
                            <div class = "modal-dialog modal-lg">
                                <div class = "modal-content">
                                    <div class = "modal-header"></div>
                                    <div class = "modal-body">
                                        <table class = "table table-striped table-hover table-bordered">
                                            <thead>
                                                <th style = "width:10%">#</th>
                                                <th style = "width:15%">Nama Vendor</th>
                                                <th style = "width:15%">Nama Produk Vendor</th>
                                                <th style = "width:15%">Harga Satuan</th>
                                                <th style = "width:15%">Rate</th>
                                                <th style = "width:15%">Currency</th>
                                                <th style = "width:15%">Notes</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Harga Vendor</td>
                                                    <input
                                                        type = "hidden"
                                                        name = "id_harga_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                        value = "<?php echo $items[$a]["id_harga_vendor"];?>"
                                                    />
                                                    <td>
                                                        <select 
                                                            data-plugin = "select2" 
                                                            class = "form-control" 
                                                            name = "vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            >
                                                            <?php for($i =0; $i<count($vendor); $i++):?>
                                                            <option 
                                                                <?php if($vendor[$i]["id_perusahaan"] == $items[$a]["id_vendor"]) echo "selected";?>
                                                                value = "<?php echo $vendor[$i]["id_perusahaan"];?>">
                                                                <?php echo $vendor[$i]["nama_perusahaan"];?>
                                                            </option>
                                                            <?php endfor;?>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <textarea
                                                            name = "nama_produk_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            class = "form-control"
                                                            ><?php echo $items[$a]["nama_produk_vendor"];?></textarea>
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "harga_produk_vendor<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "harga_produk_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            oninput = "commas('harga_produk_vendor<?php echo $a;?>')" 
                                                            value = "<?php echo number_format($items[$a]["harga_produk_vendor"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "rate_vendor<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "rate_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            oninput = "commas('rate_vendor<?php echo $a;?>')" 
                                                            value = "<?php echo number_format($items[$a]["vendor_price_rate_vendor"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            class = "form-control" 
                                                            name = "mata_uang_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            value = "<?php echo $items[$a]["mata_uang_vendor"];?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <textarea
                                                            name = "notes_vendor<?php echo $items[$a]["id_request_item"];?>"
                                                            class = "form-control"
                                                            
                                                            ><?php echo $items[$a]["notes_vendor"];?></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Harga Shipper</td>
                                                    <input
                                                        type = "hidden"
                                                        name = "id_harga_shipping<?php echo $items[$a]["id_request_item"];?>"
                                                        value = "<?php echo $items[$a]["id_harga_shipping"];?>"
                                                    />
                                                    <td>
                                                        <select 
                                                            data-plugin = "select2" 
                                                            class = "form-control" 
                                                            name = "shipper<?php echo $items[$a]["id_request_item"];?>">
                                                            <?php for($i =0; $i<count($shipper); $i++):?>
                                                            <option 
                                                                <?php if($shipper[$i]["id_perusahaan"] == $items[$a]["id_shipping"]) echo "selected";?> 
                                                                value = "<?php echo $shipper[$i]["id_perusahaan"];?>"><?php echo $shipper[$i]["nama_perusahaan"];?>
                                                            </option>
                                                            <?php endfor;?>
                                                        </select>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "harga_produk_shipper<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "harga_produk_shipper<?php echo $items[$a]["id_request_item"];?>"
                                                            oninput = "commas('harga_produk_shipper<?php echo $a;?>')" 
                                                            value = "<?php echo number_format($items[$a]["harga_produk_shipping"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "rate_shipper<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "rate_shipper<?php echo $items[$a]["id_request_item"];?>"
                                                            oninput = "commas('rate_shipper<?php echo $a;?>')" 
                                                            value = "<?php echo number_format($items[$a]["vendor_price_rate_shipping"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            class = "form-control" 
                                                            name = "mata_uang_shipper<?php echo $items[$a]["id_request_item"];?>"
                                                            value = "<?php echo $items[$a]["mata_uang_shipping"];?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <textarea
                                                            name = "notes_shipper<?php echo $items[$a]["id_request_item"];?>"
                                                            class = "form-control"
                                                            
                                                            ><?php echo $items[$a]["notes_shipping"];?></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Harga Kurir</td>
                                                    <input
                                                        type = "hidden"
                                                        name = "id_harga_courier<?php echo $items[$a]["id_request_item"];?>"
                                                        value = "<?php echo $items[$a]["id_harga_courier"];?>"
                                                    />
                                                    <td>
                                                        <select data-plugin = "select2" class = "form-control" name = "kurir<?php echo $items[$a]["id_request_item"];?>">
                                                            <?php for($i =0; $i<count($shipper); $i++):?>
                                                            <option
                                                                <?php if($shipper[$i]["id_perusahaan"] == $items[$a]["id_courier"]) echo "selected";?> 
                                                                value = "<?php echo $shipper[$i]["id_perusahaan"];?>"><?php echo $shipper[$i]["nama_perusahaan"];?></option>
                                                            <?php endfor;?>
                                                        </select>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "harga_produk_kurir<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "harga_produk_kurir<?php echo $items[$a]["id_request_item"];?>"    
                                                            oninput = "commas('harga_produk_kurir<?php echo $a;?>')" 
                                                            value = "<?php echo number_format($items[$a]["harga_produk_courier"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            id = "rate_kurir<?php echo $a;?>" 
                                                            class = "form-control" 
                                                            name = "rate_kurir<?php echo $items[$a]["id_request_item"];?>"
                                                            oninput = "commas('rate_kurir<?php echo $a;?>')"
                                                            value = "<?php echo number_format($items[$a]["vendor_price_rate_courier"],2);?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <input 
                                                            type = "text" 
                                                            class = "form-control" 
                                                            name = "mata_uang_kurir<?php echo $items[$a]["id_request_item"];?>"
                                                            value = "<?php echo $items[$a]["mata_uang_courier"];?>"
                                                        />
                                                    </td>
                                                    <td>
                                                        <textarea
                                                            name = "notes_kurir<?php echo $items[$a]["id_request_item"];?>"
                                                            class = "form-control"
                                                            
                                                            ><?php echo $items[$a]["notes_courier"];?></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php endfor;?>
                    </form>
                </div>
            </div>
            <!-- End Example Tabs Left -->
        </div>
    </div>
</div>
