<?php
    $pdf = new Pdf_oc('P', 'mm', 'A4', true, 'UTF-8', false);
    $pdf->SetTitle('PURCHASE ORDER');
    $pdf->SetTopMargin(30);
    $pdf->setFooterMargin(20);
    $pdf->SetAutoPageBreak(true,22);
    $pdf->SetAuthor('Author');
    $pdf->SetDisplayMode('real', 'default');
    $pdf->setPrintHeader(true);
      $pdf->setPrintFooter(true);
    $pdf->AddPage('P','A4');

    $fontname = TCPDF_FONTS::addTTFfont('../../../libraries/tcpdf/fonts/tahoma.ttf', 'TrueTypeUnicode', '', 96);
    $pdf->SetFont('Tahoma','', 9);

    $content='
    <html>
        <head>
        
        </head>
        <body style="font-family: Tahoma, Verdana, Segoe, sans-serif">
        <br>
        <br>
        <table>
            <tr>
                <th colspan="4" style="text-align:center; font-size:16px; font-weight:bold">PURCHASE ORDER</th>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width:30px; font-weight:bold; font-size:10pt">Date.</td>
                <td style="font-weight:bold; font-size:9pt">: June 10<sup>th</sup>, 2019</td>
            </tr>
            <tr>
                <td style="width:30px; font-weight:bold; font-size:10pt">Ref</td>
                <td style="font-weight:bold; font-size:9pt">: LI-337/PO/VI/2019/182</td>
            </tr>
        </table>
        <br><br>
        <table>
            <tr>
                <td style="font-weight:bold; font-size:10pt; width:165px">PT Leiter Indonesia</td>
                <td style="font-size:9pt; width:45px">VENDOR:</td>
                <td style="font-weight:bold; font-size:10pt; width:150px">SEFAR SINGAPORE PTE LTD</td>
                <td style="font-size:9pt; width:40px">SHIP TO:</td>
                <td style="font-weight:bold; font-size:10pt; width:165px">Trinity Worldwide Services</td>
            </tr>
            <tr>
                <td style="font-size:9pt; width:165px">Ruko Prominence Alam Sutera F38/53-55
                <br>Jln. Jalur Sutera Prominence
                <br>Alam Sutera, Tangerang 15143 Banten
                <br>INDONESIA
                <br>Phone : +6221 2958 6786
                <br>Fax : +6221 2949 0663
                <br>Email : info@leiter.co.id
                </td>

                <td></td>

                <td style="font-size:9pt; width:150px">8 Kallang Avenue
                <br>#04-03 Aperia Tower 1
                <br>SINGAPORE 339509
                <br>Attn : Mrs. Celine Kow
                <br>Phone : +65 6299 9092
                <br>Fax : +65 6299 6359
                </td>

                <td style="font-size:9pt"></td>

                <td style="font-size:9pt;width:165px">C/O G.S Intl Forwarders Pte Ltd
                <br>7 Airline Road #03-13
                <br>Singapore 819834
                <br>Tel: +65 67474431
                <br>Attn: Irene Tjan
                                      <br>&nbsp;&nbsp;&nbsp;&nbsp;Notify Party:
                <br>Trinity Worldwide Services
                <br>54 Chai Chee Street #04-851
                <br>Tel: +65 65466484

                </td>
            </tr>
        </table>
<br><br>
        <table border="1" align="center">
            <tr>
                <th style="font-size:10pt; text-align:center; font-weight:bold; background-color:#dcdcdc">SHIPPING METHOD</th>
                <th style="font-size:10pt; text-align:center; font-weight:bold; background-color:#dcdcdc">SHIPPING TERMS</th>
                <th style="font-size:10pt; text-align:center; font-weight:bold; background-color:#dcdcdc">REQUIREMENT DATE</th>
            </tr>
            <tr>
                <td style="font-size:9pt">By AIR</td>
                <td></td>
                <td style="font-size:9pt; height:18px;"><span style="background-color:yellow;">June 28<sup>th</sup>, 2019 in Singapore</span></td>
            </tr>
        </table>
        <br><br>
        <table  border="1" style="border-collapse:collapse">
            <tr>
            <th style="text-align:center; font-weight:bold; width:26px;background-color:#dcdcdc; font-size:10pt">No.</th>
            <th style="text-align:center; font-weight:bold; width:240px;background-color:#dcdcdc; font-size:10pt">Description</th>
            <th style="text-align:center; font-weight:bold; width:70px;background-color:#dcdcdc">Qty</th>
            <th style="text-align:center; font-weight:bold; width:100px;background-color:#dcdcdc; font-size:10pt">Price (EUR)</th>
            <th style="text-align:center; font-weight:bold; width:100px;background-color:#dcdcdc; font-size:10pt">Amount (EUR)</th>
            </tr>';

            $baris="Filter Belt made of Tetex DLW 05-8000-K030
            Size: 2200mm x 9750mm";

                $split = explode("\n",$baris);
                $jumlah_baris = count($split);
                $line_height = round($jumlah_baris * 12);

            $content = $content .'<tr>
                <td style="text-align:center; font-size:9pt;line-height:'.$line_height.'px;">1</td>
                <td style="font-size:9pt">'.nl2br($baris).'</td>
                <td style="text-align:center; font-size:9pt;line-height:'.$line_height.'px;">3 pcs</td>
                <td style="text-align:center; font-size:9pt;line-height:'.$line_height.'px;">1,090.00</td>
                <td style="text-align:center; font-size:9pt;line-height:'.$line_height.'px;">3,270.00</td>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td style="text-align:center;background-color:#dcdcdc; font-size:9pt">Total</td>
                <td style="text-align:center;background-color:#dcdcdc; font-size:9pt">3,270.00</td>
            </tr>
        </table>
        <br>
        <br>
        <hr>
        <br>
        <table style="font-size:10pt">
            <tr>
                <td>TERM & CONDITION:</td>
            </tr>
            <tr>
                <td style="width:15px">1. </td>
                <td>Requirement Date: <span style="background-color:yellow">June 28<sup>th</sup>, 2019 in Singapore</span></td>
            </tr>
            <tr>
                <td style="width:15px">2. </td>
                <td>Please notify us immediately if you are unable to ship as specified. </td>
            </tr>
            <tr>
                <td style="width:15px">3. </td>
                <td>Payment T/T with AR 60 days after goods received in good condition.</td>
            </tr>
            <tr>
                <td style="width:15px">4. </td>
                <td>Delivery Condition: Vendor will be apply penalty for any lateness of shipment. Penalty 2% for lateness within 1 week or penalty 5% for lateness after 1 week onward.</td>
            </tr>
            <tr>
                <td style="width:15px; background-color:#00ffff">5. </td>
                <td style="background-color:#00ffff">Please inform PT. LEITER INDONESIA packing list details before delivery (delivery destination might change)</td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" style="width:400px">We look forward to our good partnership.</td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        Best regards,
                <br><br><br>
        </body>
        </html>
';
$pdf->writeHTML($content);

$pdf->SetFont('MonotypeCorsivai','', 24);
$content = 'Robert Cau';
$pdf->writeHTML($content); //yang keluarin html nya. Setfont nya harus diatas kontennya

$pdf->SetFont('Tahoma','', 10.5);
$content ='Managing Director<br>PT LEITER INDONESIA';
$pdf->writeHTML($content);
    //$obj_pdf->SetFont(Courier','', 8); //untuk font, liat dokumentasui
    //$pdf->writeHTML($content); //yang keluarin html nya. Setfont nya harus diatas kontennya
    //$pdf->Write(5, 'Contoh Laporan PDF dengan CodeIgniter + tcpdf');
    $pdf->Output('contoh1.pdf', 'I');
?>