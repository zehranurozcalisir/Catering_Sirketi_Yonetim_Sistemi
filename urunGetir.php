<?php 
header("Content-Type:application/json");
include("baglanti.php");
$sonuc=mysqli_query($baglan,"SELECT menu,fiyat FROM menu");
$data=array();
foreach($sonuc as $row){
    $data[]=$row;
}
mysqli_close($baglan);
echo json_encode($data);


?>