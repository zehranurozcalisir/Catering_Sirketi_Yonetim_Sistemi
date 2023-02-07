<?php 
    require("baglanti.php");
    if($baglan){
        if($_POST["yeniSifre"]){
        $yenisifre=strip_tags(trim($_POST["yeniSifre"]));

         }else{
            echo "sifre gelmedi";
         }
         if($_POST["sifreTekrar"]){
            $sifreTekrar=strip_tags(trim($_POST["sifreTekrar"]));
    
             }else{
                echo "sifre gelmedi";
             }
        
    if($_POST["e_posta"]){
       $e_posta=strip_tags(trim($_POST["e_posta"]));

    }else{
        echo "sifretekrar gelmedi";
    }
}
if($yenisifre==$sifreTekrar){
    $sifreTekrarSorgu=mysqli_query($baglan, "UPDATE yoneticiler SET sifre='".$yenisifre."' WHERE eposta='".$e_posta."'");
    
    if($sifreTekrarSorgu==True){
       
        header("Location:giris.php");
    } else{
        echo "hata".$sifreTekrarSorgu."</br>".$baglan->error;
    }
}

?>