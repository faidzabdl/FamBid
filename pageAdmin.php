<?php 
    require_once("services/database.php");

    session_start();
    if($_SESSION['isLoginAdmin'] == false){
      header("location: login.php");
  }

    $admin = $_SESSION['username'];
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
<?php include("layouts/headerAdmin.php") ?>
    <h1><?= $admin  ?></h1>
</body>
</html>