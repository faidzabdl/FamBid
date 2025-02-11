<header>
        <div>
            <a href="pageWorker.php">FAMBID</a>
        </div>
        <div>
            <?php 
                if(isset($_SESSION['isLoginWorker'])){
                    echo "<div class='right' >";
                    echo "<a href='logout.php'>logout</a>";
                    echo "<a href='tambah_barang.php'>tambah barang</a>";
                    echo "</div>";
                }else{
                    echo "<a href='login.php'>login</a>";
                }
            ?>
        </div>

</header>