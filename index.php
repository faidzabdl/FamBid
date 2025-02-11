<?php 
    include('services/database.php');
    session_start();

    if($_SESSION['isLoginUser'] == false){
      header("location: login.php");
    }
    
    $statusBarang = "";


      $select_barang_query = "select * from tb_barang";

      $select_barang = $db->query($select_barang_query);
  

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>
    <title>HOME</title>
</head>
<body>
<?php include("layouts/header.php") ?>
<br>
    
<div class="container">
          
          <?php
              foreach ($select_barang as $barang) {
                $id_barang = $barang['id_barang'];

                $query_select_status = "select * from tb_lelang WHERE id_barang = '$id_barang' ";
                $select_status = $db->query($query_select_status);

            foreach($select_status as $status){
                    $statusBarang = $status['status'];
            }
          ?>
    <div class="card" onclick="goToMeja('<?= $barang['id_barang'] ?>', '<?= $barang['nama_barang'] ?>', <?= $barang['harga_awal'] ?>, '<?= $statusBarang ?>')">
          <b> <?= $barang['nama_barang']?> </b>
          <p>
              <?= $barang['deskripsi_barang']; ?> <br> 
             <?= $barang['harga_awal']; ?><br>
             <?= $statusBarang ?>  
            
          </p>
    </div>  
          <?php } ?>
  
</div>



<script>
      function goToMeja(id_barang, nama_barang,harga_awal, status){
        if(status == "dibuka"){

            const params = `?id_barang=${id_barang}&nama_barang=${nama_barang}&harga_awal=${harga_awal}`
            const url = `lelang.php`
            
             window.location.replace(url + params)
        }else{
            alert("pelelangan sudah di tutup")
        }
      }
    </script>
</body>
</html>