<header>
        <div>
            <a href="index.php">FAMBID</a>
        </div>
        <div>
            <?php 
                if(isset($_SESSION['isLoginUser'])){
                    echo "<div class='right' >";
                    echo "<a href='logout.php'>logout</a>";
                    echo "<a href='pemberitahuan.php'>pemberitahuan</a>";
                    echo "</div>";
                }else{
                    echo "<a href='login.php'>login</a>";
                }
            ?>
        </div>

</header>