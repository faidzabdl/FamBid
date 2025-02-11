<?php 
    require_once("services/database.php");

    session_start();
    if($_SESSION['isLoginWorker'] == false){
      header("location: login.php");
  }
  $id_petugas = $_SESSION['id_petugas'];

  $hari_sekarang = date('Y-m-d');

  if(isset($_POST['tambah'])){
    $nama_barang = $_POST['nama_barang'];
    $harga_awal = $_POST['harga_awal'];
    $deskripsi_barang = $_POST['deskripsi_barang'];

    $tambah_barang_query = "insert into tb_barang (`nama_barang`, `tgl`, `harga_awal`, `deskripsi_barang`) values ('$nama_barang', '$hari_sekarang', '$harga_awal', '$deskripsi_barang') ";

    $tambah_barang = $db->query($tambah_barang_query);

    if($tambah_barang == true){

        $id_barang = $db->insert_id;

        $inset_lelang_query = "insert into tb_lelang (`id_barang`, `tgl_lelang`, `id_petugas`, `status`) values ('$id_barang', '$hari_sekarang', '$id_petugas', 'dibuka')";
        $lelang_query = $db->query($inset_lelang_query);
        if($lelang_query === true){
            echo "<script>alert('barang berhasil di tambahkan')</script>";
        }else{
            echo "error";
        }
    }else{
        echo "error";
    }

  }




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
    <div class="super-center" >
    <h1>TAMBAH BARANG</h1>
          <form action="<?php $_SERVER['PHP_SELF']   ?>" method="POST">
              <label>nama barang</label>
            <input name="nama_barang" required />
              <label>harga barang</label>
            <input  type="number" name="harga_awal" required />
            <label>deskripsi barang</label>
            <input name="deskripsi_barang" required />
            <button type="submit" name="tambah">tambah</button>
          </form>
          
    </div>
</body>
</html>