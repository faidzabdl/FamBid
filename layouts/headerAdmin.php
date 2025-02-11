<header>
        <div>
            <a href="pageAdmin.php">FAMBID</a>
        </div>
        <div>
            <?php 
                if(isset($_SESSION['isLoginAdmin'])){
                    echo "<div class='right' >";
                    echo "<a href='logout.php'>logout</a>";
                    echo "</div>";
                }else{
                    echo "<a href='login.php'>login</a>";
                }
            ?>
        </div>

</header>