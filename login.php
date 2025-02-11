<?php 

require_once "services/database.php";
    SESSION_START();

    if(isset($_SESSION['isLoginUser']) && $_SESSION['isLoginUser']){
        header("location: index.php");
      }elseif(isset($_SESSION['isLoginAdmin']) && $_SESSION['isLoginAdmin']){
        header("location: pageAdmin.php");
      }elseif(isset($_SESSION['isLoginWorker']) && $_SESSION['isLoginWorker']){
        header("location: pageWorker.php");
      }

    $login_notification = "";
    $level = "";

    

    if(isset($_POST['login'])){
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        $select_admin_query = "select * from tb_petugas WHERE username = '$username' AND password = '$password' ";
        $select_user_query = "select * from tb_masyarakat WHERE username = '$username' AND password = '$password' ";
        $select_allAdmin_query = "select * from tb_petugas WHERE username = '$username' AND password = '$password' ";

        $select_alladmin = $db->query($select_allAdmin_query);
        $select_admin = $db->query($select_admin_query);
        $select_user = $db->query($select_user_query);

        while($allAdmin = mysqli_fetch_assoc($select_alladmin)){
                $level =  $allAdmin['id_level'];
            }

        if($select_admin->num_rows >0){
            $login_notification =  "login berhasil";

            if($level == 1){
                $admin = $select_admin->fetch_assoc();
                $_SESSION['isLoginAdmin'] = true;
                $_SESSION['username'] = $admin['username'];
                $_SESSION['id_petugas'] = $admin['id_petugas'];
                header("location: pageAdmin.php");
            }else if($level == 2){
                $admin = $select_admin->fetch_assoc();
                $_SESSION['isLoginWorker'] = true;
                $_SESSION['username'] = $admin['username'];
                $_SESSION['id_petugas'] = $admin['id_petugas'];
                header("location: pageWorker.php");
            }
        }else if($select_user->num_rows >0){
            $user = $select_user->fetch_assoc();
                $_SESSION['isLoginUser'] = true;
                $_SESSION['username'] = $user['username'];
                $_SESSION['id_user'] = $user['id_user'];
                header("location: index.php");
            
        }else{
            $login_notification = "user tidak di temukan";
        }
     }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
  <head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>
    <title>Login</title>
  </head>
  <body>
 
    <div class="super-center" >
    <h1>LOGIN</h1>
          <form action="<?php $_SERVER['PHP_SELF']   ?>" method="POST">
              <label>username</label>
            <input name="username" required />
              <label>password</label>
            <input type="password" name="password" required />
            <button type="submit" name="login">login</button>
          </form>
          <i> <?=  $login_notification ?></i>
    </div>
  </body>
</html>
</body>
</html>