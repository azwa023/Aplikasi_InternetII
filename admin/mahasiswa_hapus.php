<?php 
include 'config.php';
$nim=$_GET['nim'];
mysqli_query($conn,"delete from tb_mahasiswa where nim='$nim'");
header("location:mahasiswa.php");

?>