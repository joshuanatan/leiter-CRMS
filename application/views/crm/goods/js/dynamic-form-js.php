<script>
function add() {
    var num = document.getElementById("DataPesanan").rows.length;
    console.log(num);
    
    $("#t1").append("<tr class='gradeA'><td><input type='text' class='form-control' name='touchSpinVertical'/></td><td><input type='text' class='form-control' name='touchSpinVertical' data-plugin='TouchSpin' data-verticalbuttons='true' value='0' /></td><td><button class = 'btn btn-sm btn-danger col-lg-12' onclick='deleteRow(this)'>Remove</button></td></tr>");
    $("#items").select2({});
}

function deleteRow(e,v) {
  var tr = e.parentElement.parentElement;
  var tbl = e.parentElement.parentElement.parentElement;
  tbl.removeChild(tr);

}
</script>