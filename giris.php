<?php session_start(); ?>
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
           
            <form action="kontrol.php" method="post">
                <div class="girisText">  
                    <div > <input type="email" placeholder="E-posta" name="eposta" id="eposta" class="e_posta"> </div>
               
               <div ><input type="password" placeholder="Şifre" name="sifre" id="sifre" class="sifre"></div> 
               <div class="unuttumSifre"> 
               <div class="sifremiUnuttum"> <span> <a href="yeniSifreİsteyin.php"> Şifremi Unuttum</a></span>
               <button type="submit" name="girisButton" id="girisButton" class="girisButton"  >Giriş Yap</button></div></div>
                  
                </div>
               
             

            </form>
       </div> </div>



    </body>
</html>