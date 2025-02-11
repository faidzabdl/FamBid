<?php  
require_once('services/database.php');
session_start();
if($_SESSION['isLoginUser'] == false && $_SESSION['isLoginWorker'] == false && $_SESSION['isLoginAdmin'] == false){
    header("location: login.php");
}

$id_pemenang = isset($_SESSION['id_pemenang']) ? $_SESSION['id_pemenang'] : null;


    // unset($_SESSION["lelang_pemenang"]);
    // unset($_SESSION["lelang_hargaAkhir"]);
    



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>
    <title>Pemberitahuan</title>
</head>
<body>
<?php include("layouts/header.php") ?>
<br>
            <h1>selamat <?= $id_pemenang ?> anda mendapatkan lalala dengan harga Rp.</h1>
        
</body>
</html>