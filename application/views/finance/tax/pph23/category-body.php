<div class="panel-body col-lg-12">
    <form action = "<?php echo base_url();?>finance/tax/pph23/detail" method = "POST">
        <div class="row">
            <div class = "col-lg-5">
                <div class = "form-group">
                    <h5>MONTH</h5>
                    <select class = "form-control" name = "bulan_pajak">
                        <?php foreach($bulan as $key=>$value): ?>
                        <option value = "<?php echo $key;?>"><?PHP echo $value;?></option>
                        <?php endforeach;?>
                    </select>
                </div>
            </div>
            <div class = "col-lg-5">
                <div class = "form-group">
                    <h5>YEAR</h5>
                    <select class = "form-control" name = "tahun_pajak">
                        <?php for($a = 0; $a<count($tahun);$a++):?>
                        <option value = "<?php echo $tahun[$a];?>"><?php echo $tahun[$a];?></option>
                        <?php endfor;?>
                    </select>
                </div>
            </div>
            <div class  = "col-lg-2">
                <div class = "form-group">
                    <h5>Go</h5>
                    <button type = "submit" class = "btn btn-primary btn-outline">CHECK PPH STATS</button>
                </div>
            </div>
        </div>
    </form>
</div>