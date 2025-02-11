<?php 
    require_once("services/database.php");

    session_start();
    if($_SESSION['isLoginWorker'] == false){
      header("location: login.php");
  }

  
  $update_notification = ""; 
    $id_lelang = "";
    
    $id_petugas = $_SESSION['id_petugas'];
    $username = $_SESSION['username'];

    

    $nama_barang = "";
    $harga_awal = "";
    $harga = "";
    $id_barang = "";

    if(isset($_GET['nama_barang']) && $_GET['nama_barang'] !== "") {
        $nama_barang =  $_GET['nama_barang'];
    }
    if(isset($_GET['harga_awal']) && $_GET['harga_awal'] !== "") {
        $harga_awal =  $_GET['harga_awal'];
    }
    if(isset($_GET['id_barang']) && $_GET['id_barang'] !== "") {
        $id_barang =  $_GET['id_barang'];
    }
    
    
    
    $select_all_lelang_query = "SELECT * FROM tb_lelang WHERE id_barang = '$id_barang' ";
    $select_all_lelang = $db->query($select_all_lelang_query);
    foreach($select_all_lelang as $lelang){
        $id_lelang =  $lelang['id_lelang'];
        $harga = $lelang['harga_akhir'];
        $status = $lelang['status'];
        $id_pemenang = $lelang['id_user'];
    }


    
    // if(isset($_POST['update'])) {
    //     $penawaran_harga = $_POST['penawaran_harga'];
    //     if($penawaran_harga <= $harga_awal){
    //         echo "<script>alert('harga penawaran harus lebih besar dari harga awal!!!')</script>";
    //     }else{

    //         $update_lelang_query = "UPDATE tb_lelang SET id_user='$id_user', harga_akhir='$penawaran_harga' WHERE id_barang='$id_barang' ";
    //         $update_historyPenawaran_query = "INSERT INTO tb_history_lelang (`id_lelang`, `id_barang`, `id_user`, `penawaran_harga`) VALUES ('$id_lelang', '$id_barang', '$id_user', '$penawaran_harga')"  ;
    
    //         $update_lelang = $db->query($update_lelang_query);
    //         $update_historyPenawaran = $db->query($update_historyPenawaran_query);
    
    //         if($update_historyPenawaran && $update_lelang) {
    //             $update_notification = "";
    //         }else{
    //             $update_notification = "gagal update";
    //         }
    //     }


    // }

        // if($status == "dibuka"){

        //     $_SESSION['id_pemenang'] = $id_pemenang;
        // }

        if(isset($_POST['tutup'])) {
            
            $tutup_lelang_query = "UPDATE tb_lelang SET status='ditutup' WHERE id_barang='$id_barang' ";
            $tutup_lelang = $db->query($tutup_lelang_query);
            if($tutup_lelang == true){
                echo "<script>alert('pelelangan berhasil di tutup')</script>";
                header("location: pageWorker.php");
            }else{
                echo "gagal ditutup";
            }
        
        }
    


    $db->close();

?>  


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>
    <title>LELANG</title>
</head>
<body>
    <?php include("layouts/headerWorker.php") ?>
    
    <div class="super-center">    
<h1>welcome to lelang <?php echo $username ?></h1>
<p>Nama Barang : <?= $nama_barang ?></p>
<p>Harga awal : <?= $harga_awal ?></p>
<p>Harga : <?= $harga ?></p>
<form action="<?php $_SERVER['PHP_SELF']   ?>" method="POST">
                <button type="submit" name="tutup">tutup lelang</button>
</div>


</body>
</html>