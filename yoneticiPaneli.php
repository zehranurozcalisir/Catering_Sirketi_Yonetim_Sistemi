<?php session_start(); 
error_reporting(0);?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
        
        <title>ÖZÇAL CATERİNG</title>
        <link href="style.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.2/chart.min.js" integrity="sha512-tMabqarPtykgDtdtSqCL3uLVM0gS1ZkUAVhRFu1vSEFgvB73niFQWJuvviDyBGBH22Lcau4rHB5p2K2T0Xvr6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@300;400;500&display=swap" rel="stylesheet">
    </head>
    <body > 

       <div class="yoneticiPaneliKapsayici">
        <div class="bannerKapsayici">  
            <div class="bannerUst">
            <div class="bannerLogoo"> <img src="logo.png" class="bannerLogo" id="bannerLogo" style="margin-left:40px" > </div>
            <div class="cikisYap">
                <div><img src="<?php echo $_SESSION['resim'] ?>" class="profil" id="profil"></div>
                <div><span class="cikisYapAd"> <?php echo $_SESSION['ad']  ?> </span></div>
                <div ><span class="cikisYapSoyad"> <?php echo $_SESSION['soyad']  ?> </span></div>
            </div>
</div>

</div> <div class="bannerAlt"></div>
<div class="altKisim">
<div class="menuSol">
    <div class="menuSolUst"><span> Giderler</span></div>
    <div class="menuSolAlt">
        <div class="menu">
            <img src="analiz.png" id="icon" class="icon">
            <span class="menuu"><a href="yoneticiPaneli.php">Yönetim Paneli</a></span></div>
            <div class="menu">
            <img src="analiz.png" id="icon" class="icon">
            <span class="menuu"><a href="gelirler.php">Gelirler</a></span></div>
            <div class="menu">
            <img src="analiz.png" id="icon" class="icon">
            <span class="menuu"><a href="giderler.php">Giderler</a></span></div>
            
            <div class="menu">
                <img src="table.png" id="icon" class="icon">
                <span class="menuu" ><a href="tablolar.php"> Menü  Yorumları</span></a></div>
                <div class="menu">
                <img src="table.png" id="icon" class="icon">
                <span class="menuu" ><a href="degerlendirmeGrafik.php">Yorum Grafik</span></a></div>
                <div class="menu">
                <img src="table.png" id="icon" class="icon">
                <span class="menuu" ><a href="veriEkleme.php"> Veri Ekleme</span></a></div>
                
                    <div class="menu">
                        <img src="cikis.png" id="icon" class="icon">
                        <span class="cikis"> <a href="giris.php" > Çıkış Yap</a></span></div>
                        
    </div>
        </div>
        <div class="ortaKapsayiciVeriAmbari">
    <div class="ortaUst"> 
        <div class="ustKutu1">
        <div class="ustKutuSol"> 
            <div class="ustKutuSolSpan"> <span class="sayi"> 
                <?php include("baglanti.php");
                $siparisSorgu=mysqli_query($baglan,"SELECT COUNT(siparis_id) as adet FROM siparisler"); 
                $row = mysqli_fetch_row($siparisSorgu);  ?>
                <b><?php echo $row[0] ?></b>
            </span> </div>
       <div class="ustKutuSolSpan"> <span class="aciklama"> SİPARİŞ </span></div> </div> 
       <div class="ustKutuSag">
         <img src="siparis.png"  >
    </div>
    </div>  
    <div class="ustKutu2">
        <div class="ustKutuSol"> 
            <div class="ustKutuSolSpan"> <span class="sayi"> <?php include("baglanti.php");
                $siparisSorgu=mysqli_query($baglan,"SELECT COUNT(menu_no) as adet FROM menu"); 
                $row = mysqli_fetch_row($siparisSorgu);  ?>
                <b><?php echo $row[0] ?></b></span> </div>
       <div class="ustKutuSolSpan"> <span class="aciklama"> MENÜ </span></div> </div> 
       <div class="ustKutuSag">
         <img src="menu.png"  >
    </div>
    </div>  
    <div class="ustKutu3">
        <div class="ustKutuSol"> 
            <div class="ustKutuSolSpan"> <span class="sayi"><?php include("baglanti.php");
                $siparisSorgu=mysqli_query($baglan,"SELECT COUNT(yemek_no) as adet FROM yemekler"); 
                $row = mysqli_fetch_row($siparisSorgu);  ?>
                <b><?php echo $row[0] ?></b> </div>
       <div class="ustKutuSolSpan"> <span class="aciklama"> YEMEK </span></div> </div> 
       <div class="ustKutuSag">
         <img src="yemek.png"  >
    </div>
    </div>  
    <div class="ustKutu4">
        <div class="ustKutuSol"> 
            <div class="ustKutuSolSpan"> <span class="sayi"> <?php include("baglanti.php");
                $siparisSorgu=mysqli_query($baglan,"SELECT COUNT(sifre) as adet FROM yoneticiler"); 
                $row = mysqli_fetch_row($siparisSorgu);  ?>
                <b><?php echo $row[0] ?></b></span> </div>
       <div class="ustKutuSolSpan"> <span class="aciklama">YÖNETİCİ </span></div> </div> 
       <div class="ustKutuSag">
         <img src="yonetici.png"  >
    </div>
    </div>  </div> 
    <div class="gelirKapUstGraf"> <div>
               <span> Aylara Göre Menü Satış Sayıları</span>
<table>
<tr>
 <td>
  <form action="" method="POST" class="form1">
            <select name="yil" class="gelirYil" >
          
   <option value="Haziran">HAZİRAN</option>
   <option value="Temmuz">TEMMUZ</option>
   <option value="Ağustos">AĞUSTOS</option>
   <option value="Eylül">EYLÜL</option>
   <option value="Ekim">EKİM</option>
   <option value="Kasım">KASIM</option>
   <option value="Aralık">ARALIK</option>
            </select>
            <button type="submit" class="gelirButton">Göster</button>
          </form>

<td></td>
</tr>
</table> </form></div>
        </div>
           <div class="gelirKapAltGraf" id="gelirKapAltGraf">
        
           <div class="grafik1" id="grafik1"> 
            
       <div class="myChartGrafik"> <canvas id="myChart"></canvas> 
       </div><div class="grafik1Aciklamaa"> <div class="grafik1AciklamaaKarar"><span> <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$aySorgu=mysqli_query($baglan, "SELECT aylar.ay as ay
FROM menu 
LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no
LEFT JOIN aylar on aylar.ay_id=siparisler.ay_id
WHERE aylar.ay='{$_POST['yil']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($aySorgu)>0)
    {
        $row=$aySorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ay']=$row['ay'];
    }
}
    echo $_SESSION['ay'];
?>
    </span> Ayı En Çok Satılan Menü:<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuSayi1Sorgu=mysqli_query($baglan, "SELECT menu.menu_ad , COUNT(siparisler.menu_no) AS menuSayi
FROM menu , siparisler ,aylar
WHERE menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id AND aylar.ay='{$_POST['yil']} '
GROUP BY menu.menu_no
HAVING COUNT(siparisler.menu_no)=(SELECT MAX(sayi) FROM(SELECT COUNT(siparisler.menu_no) AS sayi FROM siparisler , menu , aylar WHERE siparisler.menu_no=menu.menu_no and aylar.ay_id=siparisler.ay_id AND aylar.ay='{$_POST['yil']} ' GROUP BY menu.menu_no)as sonuc)");
    if(mysqli_num_rows($menuSayi1Sorgu)>0)
    {
        while($row=$menuSayi1Sorgu->fetch_array(MYSQLI_ASSOC)){

            $_SESSION['menu_ad']=$row['menu_ad'];
            echo $_SESSION['menu_ad'].' ';
       }
      
    }
}
   
?>
    </span> </span></div>
    <div class="grafik1AciklamaaKarar"><span> <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$aySorgu=mysqli_query($baglan, "SELECT aylar.ay as ay
FROM menu 
LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no
LEFT JOIN aylar on aylar.ay_id=siparisler.ay_id
WHERE aylar.ay='{$_POST['yil']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($aySorgu)>0)
    {
        $row=$aySorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ay']=$row['ay'];
    }
}
    echo $_SESSION['ay'];
?>
    </span> Ayı En Az Satılan Menü:<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuSayi1Sorgu=mysqli_query($baglan, "SELECT menu.menu_ad , COUNT(siparisler.menu_no) AS menuSayi
FROM menu , siparisler ,aylar
WHERE menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id AND aylar.ay='{$_POST['yil']} '
GROUP BY menu.menu_no
HAVING COUNT(siparisler.menu_no)=(SELECT MIN(sayi) FROM(SELECT COUNT(siparisler.menu_no) AS sayi FROM siparisler , menu , aylar WHERE siparisler.menu_no=menu.menu_no and aylar.ay_id=siparisler.ay_id AND aylar.ay='{$_POST['yil']} ' GROUP BY menu.menu_no)as sonuc)");
    if(mysqli_num_rows($menuSayi1Sorgu)>0)
    {
        while($row=$menuSayi1Sorgu->fetch_array(MYSQLI_ASSOC)){

            $_SESSION['menu_ad']=$row['menu_ad'];
            echo $_SESSION['menu_ad'].' ';
       }
      

    }
}
   
?>
    </span> </span></div>
    <div class="grafik1AciklamaaKarar"><span> Mevcut Aylardaki En Çok Satılan Menü:<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuSayi1Sorgu=mysqli_query($baglan, "SELECT menu.menu_ad , COUNT(siparisler.menu_no) AS menuSayi
FROM menu , siparisler ,aylar
WHERE menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id 
GROUP BY menu.menu_no
HAVING COUNT(siparisler.menu_no)=(SELECT MAX(sayi) FROM(SELECT COUNT(siparisler.menu_no) AS sayi FROM siparisler , menu , aylar WHERE siparisler.menu_no=menu.menu_no and aylar.ay_id=siparisler.ay_id  GROUP BY menu.menu_no)as sonuc)");
    if(mysqli_num_rows($menuSayi1Sorgu)>0)
    {
        while($row=$menuSayi1Sorgu->fetch_array(MYSQLI_ASSOC)){

            $_SESSION['menu_ad']=$row['menu_ad'];
            echo $_SESSION['menu_ad'].' ';
       }
      

    }
}
    
?>
    </span> </span></div>
    <div class="grafik1AciklamaaKarar"><span>
        Mevcut Aylardaki En Az Satılan Menü:<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuSayi1Sorgu=mysqli_query($baglan, "SELECT menu.menu_ad , COUNT(siparisler.menu_no) AS menuSayi
FROM menu , siparisler ,aylar
WHERE menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id 
GROUP BY menu.menu_no
HAVING COUNT(siparisler.menu_no)=(SELECT MIN(sayi) FROM(SELECT COUNT(siparisler.menu_no) AS sayi FROM siparisler , menu , aylar WHERE siparisler.menu_no=menu.menu_no and aylar.ay_id=siparisler.ay_id  GROUP BY menu.menu_no)as sonuc)");
    if(mysqli_num_rows($menuSayi1Sorgu)>0)
    {
        while($row=$menuSayi1Sorgu->fetch_array(MYSQLI_ASSOC)){

             $_SESSION['menu_ad']=$row['menu_ad'];
             echo $_SESSION['menu_ad'].' ';
        }
       


        
    }
}
    
?>
    </span> </span></div>
    
    
      </div>
        </div>
        <?php 
        $menuler=[];
        $sql="SELECT menu.menu_ad,COUNT(siparisler.menu_no) as menuSayisi ,aylar.ay as ay
        FROM menu 
        LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no
        LEFT JOIN aylar on aylar.ay_id=siparisler.ay_id
        WHERE aylar.ay='{$_POST['yil']} '
        GROUP BY menu.menu_ad";
        $result = $baglan->query($sql);
        
        if ($result->num_rows > 0) {
            
            while($row = $result->fetch_assoc()) {
                $menuler[$row["menu_ad"]] += $row["menuSayisi"];
            }
        }
    
        $baglan->close();
        ?>
        <script>  
         const data = {
                  labels: [
                      <?php 
                        foreach ($menuler as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
                  ],
  datasets: [{
    label: 'Menü Sayıları',
    data: [<?php
                      foreach ($menuler as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      '#ce4b42',
      
    ],
    hoverOffset: 4
  }]
};
const config = {
  type: 'bar',
  data: data,
};
const ctx = document.getElementById('myChart');
            const myChart = new Chart(ctx, config);
         </script>

    </div>
   
</div> 
</div>
</div> </div> 

    </body>
</html>
