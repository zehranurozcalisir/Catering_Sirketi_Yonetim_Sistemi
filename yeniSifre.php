<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
        <title>ÖZÇAL CATERİNG</title>
        <link href="style.css" type="text/css" rel="stylesheet">
    </head>
    <style>
        body {
         background-image: url("arka.jpg ");
        } 
    </style>
    <body >  
        <div class="girisDiv">
            <div class="girisDivUst"><img src="logo.png" id="girisDivLogo" name="girisDivLogo" class="girisDivLogo"></div>
           
            <form action="sifreDegistir.php" method="post">
                <div class="girisText">  
                <input type="hidden" name="e_posta" id="e_posta" value=" <?php echo $_POST['e_posta']; ?>">
                    <div > <input type="password" placeholder="Şifre" name="yeniSifre" id="yeniSifre" class="sifre"> </div>
               
               <div ><input type="password" placeholder="Şifre Tekrar" name="sifreTekrar" id="sifreTekrar" class="sifreTekrar"></div> 
               <div class="unuttumSifre"> 
               <div class="sifremiUnuttum">
               <button type="submit" name="girisButton1" id="girisButton1" class="girisButton1"  >Şifre Değiştir</button></div></div>
                  
                </div>
               
             

            </form>
       </div> </div>



    </body>
</html>