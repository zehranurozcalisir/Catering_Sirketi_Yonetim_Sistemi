<?php session_start();
include ("baglanti.php");
error_reporting(0);
?>
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
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,300" rel="stylesheet">
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
  
       
    
  
<div class="ortaAltKapsayici">
    <div class="ortaAltSolGrafik">
       
        <div class="gelirKapsayici" id="gelirKapsayici"> 
           <div class="giderKapUstGraf">
               <span> Menülere Göre Ay Bazında Değerlendirme Puanları</span>
<table>
<tr>
 <td>
 <form action="" method="POST" class="form1">
  <select name="menuAdlari" class="sirketler"   id="aylar">
   
   <option value="Menü 1">Menü 1</option>
   <option value="Menü 2">Menü 2</option>
   <option value="Menü 3">Menü 3</option>
   <option value="Menü 4">Menü 4</option>
   <option value="Menü 5">Menü 5</option>
   <option value="Menü 6">Menü 6</option>
   <option value="Menü 7">Menü 7</option>
   <option value="Menü 8">Menü 8</option>
   <option value="Menü 9">Menü 9</option>
   <option value="Menü 10">Menü 10</option>
  </select>
  

<button type="submit" value="Göster" class="sirketGelir"> GÖSTER</button></form></td>
</tr> 
</table>
        </div>
           <div class="gelirKapAltGraf" id="gelirKapAltGraf">
        
       <div class="giderMyChartt"> <canvas id="hizMyChart"></canvas></div>
       <div class="giderMyChartt"> <canvas id="lezzetMyChart"></canvas></div>
       <div class="giderMyChartt"> <canvas id="servisMyChart"></canvas></div>
      
      
         </div> <div class="giderEkle">
      <div class="menuPuanKararKapsayici">   <div class="menuPuanKarar"><span>
<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuAdSorgu=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($menuAdSorgu)>0)
    {
        $row=$menuAdSorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['menu_ad']=$row['menu_ad'];
    }
}
    echo '<b>'.$_SESSION['menu_ad'].'</b>';
?>
    </span>  Ortalama Hız Puanı:   <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$ortalamaHizPuanii=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($ortalamaHizPuanii)>0)
    {
        $row=$ortalamaHizPuanii->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ortalamaHiz']=$row['ortalamaHiz'];
    }
}
if ($_SESSION['ortalamaHiz']<5){
echo '<b>'.$_SESSION['ortalamaHiz'].'</b>'."ortalama hız puanınız 5 puanın altındadır paketleme işlemlerinizi veya kuryelerenizi  kontrol edebilirsiniz";
} else {
  echo '<b>'.$_SESSION['ortalamaHiz'].'</b>'."ortalama hız puanınız 5 puanın üstündedir.";


}
?>
    </span><div class="menuPuanKarar"><span>
<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuAdSorgu=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($menuAdSorgu)>0)
    {
        $row=$menuAdSorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['menu_ad']=$row['menu_ad'];
    }
}
    echo '<b>'.$_SESSION['menu_ad'].'</b>';
?>
    </span>  Ortalama Lezzet Puanı:   <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$ortalamaLezzetPuanii=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($ortalamaLezzetPuanii)>0)
    {
        $row=$ortalamaLezzetPuanii->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ortalamaLezzet']=$row['ortalamaLezzet'];
    }
}
if ($_SESSION['ortalamaLezzet']<7){
echo '<b>'.$_SESSION['ortalamaLezzet'].'</b>'."ortalama lezzet puanınız 7 puanın altındadır kullandığınız malzemeleri veya pişirme yöntemlerinizi değiştiriniz";
} else {
  echo '<b>'.$_SESSION['ortalamaLezzet'].'</b>'."ortalama lezzet puanınız 7 puanın üstündedir.";


}
?>
    </span> <div class="menuPuanKarar"><span>
<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$menuAdSorgu=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($menuAdSorgu)>0)
    {
        $row=$menuAdSorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['menu_ad']=$row['menu_ad'];
    }
}
    echo '<b>'.$_SESSION['menu_ad'].'</b>';
?>
    </span>  Ortalama Servis Puanı:   <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$ortalamaServisPuanii=mysqli_query($baglan, "SELECT menu.menu_ad, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
FROM degerlendirme , siparisler , menu , sirketler ,aylar
WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($ortalamaServisPuanii)>0)
    {
        $row=$ortalamaServisPuanii->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ortalamaServis']=$row['ortalamaServis'];
    }
}
if ($_SESSION['ortalamaServis']<6){
echo '<b>'.$_SESSION['ortalamaServis'].'</b>'."ortalama servis puanınız 6 puanın altındadır paketleme işlemi yaparken içeriği düzenleyebilirsiniz.";
} else {
  echo '<b>'.$_SESSION['ortalamaServis'].'</b>'."ortalama servis puanınız 6 puanın üstündedir.";


}
?>
    </span> <span > 
      
    </span> </span></div></div>


       </div>
         <?php 
        $hiz=[];
        $sql="SELECT aylar.ay, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
        FROM degerlendirme , siparisler , menu , sirketler ,aylar
        WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']}'
        GROUP BY aylar.ay_id";
        $result = $baglan->query($sql);
        
        
            
            while($row = $result->fetch_assoc()) {
                $hiz[$row["ay"]] += $row["ortalamaHiz"];
            }
            $lezzet=[];
            $sqll="SELECT aylar.ay, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
            FROM degerlendirme , siparisler , menu , sirketler ,aylar
            WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']}'
            GROUP BY aylar.ay_id";
            $resultt = $baglan->query($sqll);
            
            
                
                while($roww = $resultt->fetch_assoc()) {
                    $lezzet[$roww["ay"]] += $roww["ortalamaLezzet"];
                }
            $servis=[];
            $sqlll="SELECT aylar.ay, round((SUM(degerlendirme.hız)/ COUNT(degerlendirme.hız)),2) as ortalamaHiz , round((SUM(degerlendirme.lezzet)/ COUNT(degerlendirme.lezzet)),2) as ortalamaLezzet , round((SUM(degerlendirme.servis)/ COUNT(degerlendirme.servis)),2) as ortalamaServis
            FROM degerlendirme , siparisler , menu , sirketler ,aylar
            WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id and aylar.ay_id=siparisler.ay_id and menu.menu_ad='{$_POST['menuAdlari']}'
             GROUP BY aylar.ay_id";
            $resulttt = $baglan->query($sqlll);
                
                
                    
                 while($rowww = $resulttt->fetch_assoc()) {
                       $servis[$rowww["ay"]] += $rowww["ortalamaServis"];
                }
        
       $baglan->close();
        ?>
         <script>
           const data = {
  labels: [
    <?php 
                        foreach ($hiz as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
                      
  ],
  datasets: [{
    label: 'HIZ',
    data: [<?php
                      foreach ($hiz as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      '#D64453',
      '#8CC152',
      '#F6BB42',
      '#967ADC',
      '#D770AD',
      '#AAB2BD'
    ],
    hoverOffset: 4
  }]
};
const config = {
  
  type: 'bar',
  data: data,
  
  
};
const data2 = {
  labels: [
    <?php 
                        foreach ($lezzet as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
                      
  ],
  datasets: [{
    label: 'LEZZET',
    data: [<?php
                      foreach ($lezzet as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      '#D64453',
      '#8CC152',
      '#F6BB42',
      '#967ADC',
      '#D770AD',
      '#AAB2BD'
    ],
    hoverOffset: 4
  }]
};
const config2 = {
  
  type: 'bar',
  data: data2,
  
  
};
const data3 = {
  labels: [
    <?php 
                        foreach ($servis as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
                      
  ],
  datasets: [{
    label: 'SERVİS',
    data: [<?php
                      foreach ($servis as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      '#D64453',
      '#8CC152',
      '#F6BB42',
      '#967ADC',
      '#D770AD',
      '#AAB2BD'
    ],
    hoverOffset: 4
  }]
};
const config3 = {
  
  type: 'bar',
  data: data3,
  
  
};


          

const ctx = document.getElementById('hizMyChart');
const myChart = new Chart(ctx, config);
const ctx2 = document.getElementById('lezzetMyChart');
const myChart2 = new Chart(ctx2, config2);
const ctx3 = document.getElementById('servisMyChart');
const myChart3 = new Chart(ctx3, config3);

           </script>
         
    

       </div>
        </div>
       
       
       
        
      
        
    </div>
    

    </div>
</div> 
</div>
</div> </div> 

    </body>
</html>
