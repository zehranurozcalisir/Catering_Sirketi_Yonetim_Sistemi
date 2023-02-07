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
    <div class="menuSolUst"><span> Gelirler</span></div>
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
           <div class="gelirKapUstGraf">
              <div class="indirimHizala"> 
         <div> <span> Şirketlerin Aylık Gelirleri</span> </div>
       
        </div> <div> <table>
<tr>
 <td>
 <form action="" method="POST" class="form1">
  <select name="sirketler" class="sirketler"   id="sirketler">
   <option value="KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ">KORSİNİ-SAF AMBALAJ SANAYİ VE TİCARET A.Ş. EGE SERBEST BÖLGE ŞUBESİ</option>
   <option value="LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ">LAZERİZMİR METAL KESİM VE İŞLEME TEKNOLOJİLERİ MAKİNA İMALAT SAN. VE TİC. LTD. ŞTİ. ESB ŞUBESİ</option>
   <option value="MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.">MECALAC İŞ MAKİNALARI SANAYİ VE TİCARET LTD. ŞTİ.</option>
   <option value="ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ">ORTOPRO TIBBİ ALETLER SANAYİ VE TİCARET A.Ş. E.S.B. ŞUBESİ</option>
   <option value="OZ OPTICS A.Ş.">OZ OPTICS A.Ş.</option>
  </select>
  

<button type="submit" value="Göster" class="sirketGelir"> GÖSTER</button></form></td>
</tr> 
</table> </div> </div>
           <div class="gelirKapAltGraf" id="gelirKapAltGraf">
        
       <div class="gelirMyChartt"> <canvas id="gelirMyChart"> </canvas>
      <div class="grafikAciklamaaa"> 
       <div class="indirimSirket"> <span > Aylara Göre İndirim Yapılan Şirketler </span> </div>
<table>
<tr>
 <td>
 <form action="" method="POST" class="form1">
  <select name="aylar" class="gelirAylar"   id="gelirAylar">
   <option value="Haziran">Haziran</option>
   <option value="Temmuz">Temmuz</option>
   <option value="Ağustos">Ağustos</option>
   <option value="Eylül">Eylül</option>
   <option value="Ekim">Ekim</option>
   <option value="Kasım">Kasım</option>
  </select>
  

<button type="submit" value="Göster" class="gelirAylarButton"> GÖSTER</button></form></td>
</tr> 
</table><div class="gelirAciklamaKararr"><span>
<span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$aySorgu=mysqli_query($baglan, "SELECT aylar.ay as ay
FROM menu 
LEFT JOIN siparisler on siparisler.menu_no=menu.menu_no
LEFT JOIN aylar on aylar.ay_id=siparisler.ay_id
WHERE aylar.ay='{$_POST['aylar']} '
GROUP BY menu.menu_ad");
    if(mysqli_num_rows($aySorgu)>0)
    {
        $row=$aySorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['ay']=$row['ay'];
    }
}
    echo '<b>'.$_SESSION['ay'].'</b>';
?>
    </span>  AYI EN YÜKSEK GELİRİ GETİREN ŞİRKET:   <span > 
       <?php 
include("baglanti.php");
session_start();
if($baglan){

$sirketSorgu=mysqli_query($baglan, "SELECT  sirketler.sirket_ad ,SUM(siparisler.adet*menu.fiyat) as gelir ,aylar.ay
FROM siparisler,sirketler,menu,aylar
WHERE siparisler.sirket_id=sirketler.sirket_id and menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id and aylar.ay='{$_POST['aylar']} '
 GROUP BY sirketler.sirket_id
HAVING gelir=(SELECT MAX(gelirr) FROM (SELECT SUM(siparisler.adet*menu.fiyat) as gelirr FROM siparisler , sirketler ,menu ,aylar WHERE siparisler.sirket_id=sirketler.sirket_id and menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id  and aylar.ay='{$_POST['aylar']} '
      GROUP BY sirketler.sirket_id                                )as sonuc)");
    if(mysqli_num_rows($aySorgu)>0)
    {
        $row=$sirketSorgu->fetch_array(MYSQLI_ASSOC);
        $_SESSION['sirket_ad']=$row['sirket_ad'];
    }
}
    echo $_SESSION['sirket_ad'];
?>
    </span> <span > 
      
    </span> </span></div> </div> </div>
       <div class="gelirFatura"> <table id="fatura">
         <thead>
<tr>


<th>ÜCRET</th>
<th>ÖDEME TÜRÜ</th>
<th>FATURA TARİHİ</th>
 </thead>
<tbody> 
<?php
                                $sqll = "SELECT fatura.ücret , fatura.odeme_turu , fatura.fatura_tarihi
                                FROM fatura
                                WHERE fatura.sirket_ad='{$_POST['sirketler']}'
                                ORDER BY fatura_tarihi ASC
                                LIMIT 16";
                                $result = $baglan->query($sqll);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) {

                                        echo "<tr>";
                                       
                                        echo "<td>" . $row["ücret"] . "</td>";
                                        echo "<td>" . $row["odeme_turu"] . "</td>";
                                        echo "<td>" . $row["fatura_tarihi"] . "</td>";
                                        
                                        echo `<td class="td-team">
                                                
                                                </tr>`;
                                //        echo "İsim: : " . $row["ad"]. " Soyad: ". $row["soyad"]. " - ID: " . $row["id"]. "Cinsiyet: " . $row["cinsiyet_id"]. " <br>";
                                    }
                                } 
                                
                            ?>
                   
  
</tbody>
</tr>

</table> <table id="fatura">
         <thead>
<tr>


<th>ÜCRET</th>
<th>ÖDEME TÜRÜ</th>
<th>FATURA TARİHİ</th>
 </thead>
<tbody> 
<?php
                                $sqll = "SELECT fatura.ücret , fatura.odeme_turu , fatura.fatura_tarihi
                                FROM fatura
                                WHERE fatura.sirket_ad='{$_POST['sirketler']}'
                                ORDER BY fatura_tarihi DESC
                                LIMIT 16";
                                $result = $baglan->query($sqll);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) {

                                        echo "<tr>";
                                       
                                        echo "<td>" . $row["ücret"] . "</td>";
                                        echo "<td>" . $row["odeme_turu"] . "</td>";
                                        echo "<td>" . $row["fatura_tarihi"] . "</td>";
                                        
                                        echo `<td class="td-team">
                                                
                                                </tr>`;
                                //        echo "İsim: : " . $row["ad"]. " Soyad: ". $row["soyad"]. " - ID: " . $row["id"]. "Cinsiyet: " . $row["cinsiyet_id"]. " <br>";
                                    }
                                } 
                                
                            ?>
                   
  
</tbody>
</tr>

</table></div>
         </div>
         <?php 
        $gelirler=[];
        $sql="SELECT  sirketler.sirket_ad ,SUM(siparisler.adet*menu.fiyat) as gelir ,aylar.ay
        FROM siparisler,sirketler,menu,aylar
        WHERE siparisler.sirket_id=sirketler.sirket_id and menu.menu_no=siparisler.menu_no and aylar.ay_id=siparisler.ay_id  
        and sirketler.sirket_ad='{$_POST['sirketler']}'
        GROUP BY aylar.ay_id";
        $result = $baglan->query($sql);
        
        
            
            while($row = $result->fetch_assoc()) {
                $gelirler[$row["ay"]] += $row["gelir"];
            }
        
       $baglan->close();
        ?>
        <script>
const labels = [ <?php 
                        foreach ($gelirler as $key => $value) {
                          echo "'". $key ."',";
                        }
                      ?>]
const data = {
  labels: labels,
  datasets: [{
    label: 'My First Dataset',
    data: [<?php
                      foreach ($gelirler as $key => $value) {
                        echo $value .",";
                      }
                      ?>],
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
const config = {
  type: 'line',
  data: data,
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  },
};
const ctx = document.getElementById('gelirMyChart');
            const myChart = new Chart(ctx, config);

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
