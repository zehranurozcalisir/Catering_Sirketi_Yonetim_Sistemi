<?php session_start();
include ("baglanti.php");
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
    </head>
    <body> 
       <div class="yoneticiPaneliKapsayici">
        <div class="bannerKapsayici">  
            <div class="bannerUst">
            <div class="bannerLogoo"> <img src="logo.png" class="bannerLogo" id="bannerLogo" style="margin-left:40px" > </div>
            <div class="cikisYap">
                <div><img src="<?php echo $_SESSION['resim'] ?>" class="profil" id="profil"></div>
                <div><span class="cikisYapAd"> <?php echo $_SESSION['ad']  ?> </span></div>
                <div ><span class="cikisYapSoyad"> <?php echo $_SESSION['soyad']  ?> </span></div>
            </div>
</div></div>
 <div class="bannerAlt"></div>

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
<div class="ortaKapsayiciTablolar">
  <div class="ortaAltKapsayici">
    <div class="ortaAltSolTablo">
       
        <div class="tablo1" id="tablo1"> 
            <div class="tablo1ust">
            <span> <h1> Menü Yorumları</h1></span> </div>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Menü Adı Giriniz...">
    <div class="tablo1alt">
    <table id="personel">
        <thead>
<tr>
<th>ID</th>
<th>Şirket Adı</th>
<th>Menü</th>
<th>Hız  </th>
<th>Lezzet</th>
<th> Servis </th>
<th> Yorum </th>
</tr>
</thead>

<tbody>
                              <?php
                                $sqll = "SELECT degerlendirme.degerlendirme_id, menu.menu_ad,sirketler.sirket_ad,degerlendirme.hız,degerlendirme.lezzet,degerlendirme.servis,degerlendirme.yorum
                                FROM degerlendirme , siparisler , menu , sirketler 
                                WHERE degerlendirme.siparis_no=siparisler.siparis_id and menu.menu_no=siparisler.menu_no and sirketler.sirket_id=siparisler.sirket_id";
                                $result = $baglan->query($sqll);

                                if ($result->num_rows > 0) {
                                    // output data of each row
                                    while($row = $result->fetch_assoc()) {

                                        echo "<tr>";
                                        echo "<td>" . $row["degerlendirme_id"] . "</td>";
                                        echo "<td>" . $row["sirket_ad"] . "</td>";
                                        echo "<td>" . $row["menu_ad"] . "</td>";
                                        echo "<td>" . $row["hız"] . "</td>";
                                        echo "<td>" . $row["lezzet"] . "</td>";
                                        echo "<td>" . $row["servis"] . "</td>";
                                        echo "<td>" . $row["yorum"] . "</td>";
                                        echo `<td class="td-team">
                                                
                                                </tr>`;
                                //        echo "İsim: : " . $row["ad"]. " Soyad: ". $row["soyad"]. " - ID: " . $row["id"]. "Cinsiyet: " . $row["cinsiyet_id"]. " <br>";
                                    }
                                } else {
                                    echo "0 results";
                                }
                                $baglan->close();
                            ?>
                   
  

                        
                    </tbody>

</table>
<script>
function myFunction() {
  // Değişkenleri bildirin
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("personel");
  tr = table.getElementsByTagName("tr");
  // Tüm tablo satırlarını dolaştırın ve arama sorgusuyla eşleşmeyenleri gizleyin
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>

         </div>
</div>
        
        </div>
       
     
    </div>
   

    </div>
</div> 
</div>
</div>  

    </body>
</html>
