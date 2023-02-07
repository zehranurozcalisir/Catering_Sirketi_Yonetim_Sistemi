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
    <div class="menuSolUst"><span> Veri Ambarı</span></div>
    <div class="menuSolAlt">
        <div class="menu">
            <img src="analiz.png" id="icon" class="icon">
            <span class="menuu"><a href="yoneticiPaneli.php">Yönetim Paneli</a></span></div>
            <div class="menu">
                <img src="table.png" id="icon" class="icon">
                <span class="menuu" ><a href="tablolar.php"> Tablolar</span></a></div>
                <div class="menu">
                    <img src="veri.png" id="icon" class="icon">
                    <span class="menuu"><a href="veriAmbari.php">Veri Ambarı</a></span></div>
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
  
<div class="ortaAltKapsayici">
    <div class="ortaAltSolGrafik">
       
        <div class="grafik1" id="grafik1"> 
            <span class="grafikAciklama"> Menülerin Aylık Satış Sayıları </span>
       <div class="myChartGrafik"> <canvas id="myChart"></canvas> </div>
        </div>
        <?php 
        $menuler=[];
        $sql="SELECT menu.menu,COUNT(siparisler.menu_no) as menuSayisi
        FROM menu 
        LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no
        GROUP BY menu.menu";
        $result = $baglan->query($sql);
        
        if ($result->num_rows > 0) {
            
            while($row = $result->fetch_assoc()) {
                $menuler[$row["menu"]] += $row["menuSayisi"];
            }
        } else {
            echo "0 results";
        }
      
        $menuler2=[];
        $sql2="SELECT menu.menu, degerlendirme.puan
        FROM menu LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no 
        LEFT JOIN degerlendirme on degerlendirme.siparis_no=siparisler.siparis_id 
        WHERE degerlendirme.puan IN (SELECT MAX(degerlendirme.puan) FROM menu LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no 
        LEFT JOIN degerlendirme on degerlendirme.siparis_no=siparisler.siparis_id  GROUP BY menu.menu_no)
        GROUP BY menu.menu_no;";
        $result2 = $baglan->query($sql2);
        
        if ($result2->num_rows > 0) {
            
            while($row2 = $result2->fetch_assoc()) {
                $menuler2[$row2["menu"]] += $row2["puan"];
            }
        } else {
            echo "yok";
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
    label: 'My First Dataset',
    data: [<?php
                      foreach ($menuler as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)',
      'rgb(201, 203, 0)',
      'rgb(201, 0, 207)',
      'rgb(0, 203, 207)',
      'rgb(201, 100, 207)',
      'rgb(201, 203, 100)',
      'rgb(100, 203, 207)',
      'rgb(150, 100, 207)'
      

    ],
    hoverOffset: 4
  }]
};
const config = {
  type: 'pie',
  data: data,
};
const ctx = document.getElementById('myChart');
            const myChart = new Chart(ctx, config);
         </script>
         <div class="grafik2" id="grafik2">
         <span class="grafikAciklama"> Her menünün en yüksek puan değerleri </span>
         <div class="myChartGrafik2"> <canvas id="myChart2"></canvas> </div>
        </div>
        
       
        <script>  
         const data2 = {
                  labels: [
                      <?php 
                        foreach ($menuler2 as $key2 => $value2) {
                          echo "'". $key2 ."',";
                        }
                      ?>
                  ],
  datasets: [{
    label: 'My First Dataset',
    data: [<?php
                      foreach ($menuler2 as $key2 => $value2) {
                        echo $value2 .",";
                      }
                      ?>],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)',
      'rgb(201, 203, 0)',
      'rgb(201, 0, 207)',
      'rgb(0, 203, 207)',
      'rgb(201, 100, 207)',
      'rgb(201, 203, 100)',
      'rgb(100, 203, 207)',
      'rgb(150, 100, 207)'
      

    ],
    hoverOffset: 4
  }]
};
const config2 = {
  type: 'pie',
  data: data2,
};
const ctx2 = document.getElementById('myChart2');
            const myChart2 = new Chart(ctx2, config2);
         </script>
        
    </div>
    <div class="ortaAltSagGrafik">
        <div class="grafik3" id="grafik3">
        <div class="myChartGrafik3"> <canvas id="myChart3"></canvas> </div>
        </div>
       <script> 
       const labels3 = ["h","j","j"]
const data3 = {
  labels: labels3,
  datasets: [{
    label: 'My First Dataset',
    data: [65, 59, 80],
    backgroundColor: [
      'rgba(255, 99, 132, 0.2)',
      'rgba(255, 159, 64, 0.2)',
      'rgba(255, 205, 86, 0.2)',
      'rgba(75, 192, 192, 0.2)',
      'rgba(54, 162, 235, 0.2)',
      'rgba(153, 102, 255, 0.2)',
      'rgba(201, 203, 207, 0.2)'
    ],
    borderColor: [
      'rgb(255, 99, 132)',
      'rgb(255, 159, 64)',
      'rgb(255, 205, 86)',
      'rgb(75, 192, 192)',
      'rgb(54, 162, 235)',
      'rgb(153, 102, 255)',
      'rgb(201, 203, 207)'
    ],
    borderWidth: 1
  }]
};
const config3 = {
  type: 'bar',
  data: data3,
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  },
};
const ctx3 = document.getElementById('myChart3');
            const myChart3 = new Chart(ctx3, config3);
 </script>

      
    </div>
</div> 
</div>
</div> </div> 

    </body>
</html>
