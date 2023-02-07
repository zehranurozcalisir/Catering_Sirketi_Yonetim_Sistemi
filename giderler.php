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
               <span> Aylara Göre Yüzdesel Giderler</span>
<table>
<tr>
 <td>
 <form action="" method="POST" class="form1">
  <select name="aylar" class="sirketler"   id="aylar">
   
   <option value="Haziran">HAZİRAN</option>
   <option value="Temmuz">TEMMUZ</option>
   <option value="Ağustos">AĞUSTOS</option>
   <option value="Eylül">EYLÜL</option>
   <option value="Ekim">EKİM</option>
   <option value="Kasım">KASIM</option>
   <option value="Aralık">ARALIK</option>
  </select>
  

<button type="submit" value="Göster" class="sirketGelir"> GÖSTER</button></form></td>
</tr> 
</table>
        </div>
           <div class="gelirKapAltGraf" id="gelirKapAltGraf">
        
       <div class="giderMyChartt"> <canvas id="giderMyChart"></div>
       <div class="giderMyChartt2"> <canvas id="giderMyChart2"> </canvas> </div>
       <div class="giderEkle">
        


       </div>
         </div>
         <?php 
        $aylikGider=[];
        $sql="SELECT aylar.ay , SUM(gider.gider_ucret) as giderTutari 
        FROM aylar , gider
        WHERE aylar.ay_id=gider.ay_id
        GROUP BY aylar.ay_id";
        $result = $baglan->query($sql);
        
        
            
            while($row = $result->fetch_assoc()) {
                $aylikGider[$row["ay"]] += $row["giderTutari"];
            }
            $turGider=[];
            $sqll="SELECT gider_tur.gider_tur, ((SUM(gider.gider_ucret))/ (SELECT  SUM(gider.gider_ucret)  as giderTutari 
            FROM aylar , gider,gider_tur
            WHERE aylar.ay_id=gider.ay_id and gider_tur.gider_tur_id=gider.gider_tur_id AND aylar.ay='{$_POST['aylar']}'))*100  as giderTutari 
            FROM aylar , gider,gider_tur 
            WHERE aylar.ay_id=gider.ay_id and gider_tur.gider_tur_id=gider.gider_tur_id and aylar.ay='{$_POST['aylar']}'
            GROUP BY gider_tur.gider_tur_id";
            $resultt = $baglan->query($sqll);
            
            
                
                while($roww = $resultt->fetch_assoc()) {
                    $turGider[$roww["gider_tur"]] += $roww["giderTutari"];
                }
        
       $baglan->close();
        ?>
         <script>
           const data2 = {
  labels: [
    <?php 
                        foreach ($turGider as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [<?php
                      foreach ($turGider as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      '#D64453',
      '#8CC152',
      '#F6BB42',
      '#967ADC',
      '#D770AD',
      '#AAB2DB'
    ],
    hoverOffset: 4
  }]
};
const config2 = {
  
  type: 'pie',
  data: data2,
  
  
};
           const data = {
  labels: [
    <?php 
                        foreach ($aylikGider as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [<?php
                      foreach ($aylikGider as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    hoverOffset: 4
  }]
};
const config = {
  type: 'line',
  data: data,
};
const ctx = document.getElementById('giderMyChart2');
            const myChart = new Chart(ctx, config);
const ctx2 = document.getElementById('giderMyChart');
const myChart2 = new Chart(ctx2, config2);
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
