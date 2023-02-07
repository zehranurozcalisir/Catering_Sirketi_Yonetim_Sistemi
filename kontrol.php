<?php 
include("baglanti.php");
session_start();
if($baglan){
if($_POST["eposta"]){
    $eposta=strip_tags(trim($_POST["eposta"]));
}else{
    echo "Eposta Gelmedi";
}
if($_POST["sifre"]){
    $sifre=strip_tags(trim($_POST["sifre"]));
}else{
    echo "Şifre gelmedi";
}
$yoneticiSorgu=mysqli_query($baglan, "SELECT * FROM yoneticiler WHERE eposta='".$eposta."' AND sifre='".$sifre."'");
    if(mysqli_num_rows($yoneticiSorgu)>0)
    {
        $row=$yoneticiSorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['eposta']=$row['eposta'];
        $_SESSION['sifre']=$row['sifre'];
        $_SESSION['ad']=$row['ad'];
        $_SESSION['soyad']=$row['soyad'];
        $_SESSION['resim']=$row['resim'];
        header("Location:yoneticiPaneli.php");
    }else{
        die( "kullanıcı adı ve sifre hatalı");
    }
}


else{
    die("baglanti saglanmadı");
}
?>