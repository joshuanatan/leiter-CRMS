<div class="panel-body col-lg-12">
    <div class="row">
        <div class="col-md-6">
            <div class="mb-15">
                <button data-toggle = "modal" data-target = "#createOc" class="btn btn-outline btn-primary btn-sm">
                    <i class="icon wb-plus" aria-hidden="true"></i> Create Order Confirmation
                </button>
                <a href = "<?php echo base_url();?>crm/oc/openDataEntry" class="btn btn-outline btn-primary btn-sm">
                    <i class="icon wb-plus" aria-hidden="true"></i> Data Entry
                </a>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped w-full" cellspacing="0" data-plugin = "dataTable">
        <thead>
            <tr>
                <th style = "width:10%">Order Confirmation No</th>
                <th style = "width:15%">Quotation No</th> <!-- nanti ini keisi waktu nambahin OC-->
                <th style = "width:15%">Customer Firm</th>
                <th style = "width:15%">Customer Contact Person</th>
                <th style = "width:10%">Customer PO Number</th>
                <th style = "width:10%">Customer PO Date</th>
                <th style = "width:10%">PO Price</th>
                <th style = "width:10%">OC Detail</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php for($a = 0 ; $a<count($oc); $a++): ?>
            <tr>
                <td><?php echo $oc[$a]["no_oc"];?></td>
                <td><?php echo $oc[$a]["no_quotation"];?></td>
                <td><?php echo $oc[$a]["nama_perusahaan"];?></td>
                <td><?php echo $oc[$a]["nama_cp"];?></td>
                <td><?php echo $oc[$a]["no_po_customer"];?></td> 
                <td><?php $date = date_create($oc[$a]["tgl_po_customer"]);echo date_format($date,"d-m-Y") ?></td> 
                <td><?php echo number_format($oc[$a]["total_oc_price"],2,".",",");?></td>
                <td>
                    <button class = "btn btn-primary btn-sm btn-outline col-lg-12" data-toggle = "modal" data-target = "#detailItem<?php echo $a;?>">DETAIL ITEM</button>
                    <button class = "btn btn-primary btn-sm btn-outline col-lg-12" data-toggle = "modal" data-target = "#detailpayment<?php echo $a;?>">DETAIL PAYMENT</button>
                    
                </td>
                <td class="actions">
                    <a href = "<?php echo base_url();?>crm/oc/ocPdf/<?php echo $oc[$a]["id_submit_oc"];?>" class="btn btn-outline btn-sm btn-primary col-lg-12" target="_blank">CETAK</a>

                    <a href = "<?php echo base_url();?>crm/oc/edit/<?php echo $oc[$a]["id_submit_oc"];?>" class = "btn btn-outline btn-sm btn-primary col-lg-12">EDIT</a>

                    <a href = "<?php echo base_url();?>crm/oc/delete/<?php echo $oc[$a]["id_submit_oc"];?>" class="btn btn-outline btn-danger btn-sm col-lg-12" data-content="Delete OC" data-trigger="hover" data-toggle="popover">DELETE</a> 
                    
                </td>
            </tr>     
            <?php
            endfor;
            ?>
        </tbody>
    </table>
</div>


<?php for($a = 0 ; $a<count($oc); $a++): ?>
<div class = "modal fade" id = "detailItem<?php echo $a;?>">
    <div class = "modal-dialog modal-lg">
        <div class = "modal-content">
            <div class = "modal-header">
                <h4 class = "modal-title">DETAIL OC ITEMS No <?php echo $oc[$a]["no_oc"];?></h4>
            </div>
            <div class = "modal-body">
                <table class = "table table-bordered table-stripped col-lg-12" style = "width:100%" data-plugin = "dataTable">
                    <thead>
                        <tr>
                            <th>ID Item OC</th>
                            <th>Nama Item OC</th>
                            <th>Final Amount</th>
                            <th>Final Selling Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php for($item = 0; $item<count($oc[$a]["oc_item"]); $item++):?>
                        <tr>
                            <td><?php echo $oc[$a]["oc_item"][$item]["id_oc_item"];?></td>
                            <td><?php echo nl2br($oc[$a]["oc_item"][$item]["nama_oc_item"]);?></td>
                            <td><?php echo $oc[$a]["oc_item"][$item]["final_amount_oc"];?> <?php echo $oc[$a]["oc_item"][$item]["satuan_produk_oc"];?></td>
                            <td><?php echo number_format($oc[$a]["oc_item"][$item]["final_selling_price_oc"]);?></td>
                        </tr>
                        <?php endfor;?>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>
</div>
<?php endfor;?>
<?php for($a = 0 ; $a<count($oc); $a++): ?>
<div class = "modal fade" id = "detailpayment<?php echo $a;?>">
    <div class = "modal-dialog modal-lg">
        <div class = "modal-content">
            <div class = "modal-header">
                <h4 class = "modal-title">DETAIL OC PAYMENT No <?php echo $oc[$a]["no_oc"];?></h4>
            </div>
            <div class = "modal-body">
                <table class = "table table-stripped table-bordered">
                    <?php if($oc[$a]["metode_pembayaran"][0]["is_ada_transaksi"] == 0):?>
                    <div class = "row">
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">DP</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo $oc[$a]["metode_pembayaran"][0]["persentase_pembayaran"];?>%">
                        </div>
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">DP Amount</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo number_format($oc[$a]["metode_pembayaran"][0]["nominal_pembayaran"]);?>">
                        </div>
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">DP Trigger</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo $oc[$a]["metode_pembayaran"][0]["trigger_pembayaran"];?>">
                        </div>
                    </div>
                    <?php endif;?>
                    <?php if($oc[$a]["metode_pembayaran"][0]["is_ada_transaksi2"] == 0):?>
                    <div class = "row">
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">Pelunasan (%)</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo $oc[$a]["metode_pembayaran"][0]["persentase_pembayaran2"];?>%">
                        </div>
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">Pelunasan Amount</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo number_format($oc[$a]["metode_pembayaran"][0]["nominal_pembayaran2"]);?>">
                        </div>
                        <div class = "form-group col-lg-4 col-sm-12">
                            <h5 style = "opacity:0.5">Pelunasan Trigger</h5>
                            <input type = "text" class = "form-control" readonly value = "<?php echo $oc[$a]["metode_pembayaran"][0]["trigger_pembayaran2"];?>">
                        </div>
                    </div>
                    <?php endif;?>
                    <div class = "row">
                        <div class = "form-group col-lg-12">
                            <h5 style = "opacity:0.5">Currency</h5>
                            <input type = "text" value = "<?php echo $oc[$a]["metode_pembayaran"][0]["kurs"];?>" readonly class = "form-control">
                        </div>
                    </div>
                </table>
            </div>
        </div>
    </div>
</div>
<?php endfor;?>

<div class = "modal fade" id = "createOc">
	<div class = "modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header">
				<h4 class = "modal-title">Create Order Confirmation</h4>
			</div>
			<div class = "modal-body">
				<div class = "form-group">
					<form action = "<?php echo base_url();?>crm/oc/create" method = "POST">
						<div class = "form-group">
							<h5>Choose Quotation</h5>
							<select class = "form-control" name = "id_submit_quotation" data-plugin = "select2">
								<option disabled selected>Pilih No Quotation</option>
								<?php for($a = 0; $a<count($quotation);$a++):?>
								<option value = "<?php echo $quotation[$a]["id_submit_quotation"];?>"><?php echo $quotation[$a]["no_quotation"];?> - <?php echo $quotation[$a]["nama_perusahaan"];?> - <?php echo $quotation[$a]["nama_cp"];?></option>
								<?php endfor;?>
							</select>
						</div>
						<div class = "form-group">
							<button type = "submit" class = "btn btn-sm btn-primary">CREATE QUOTATION</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>