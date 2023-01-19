<?php 
include 'config.php';
$nim=$_POST['nim'];
$nama=$_POST['nama'];
$jurusan=$_POST['jurusan'];
$semester=$_POST['semester'];
$angkatan=$_POST['angkatan'];
$waktu=$_POST['waktu'];
$namadosen=$_POST['namadosen'];
$catatan=$_POST['catatan'];
mysqli_query($conn, "update tb_mahasiswa set nama='$nama',jurusan='$jurusan',
semester='$semester',angkatan='$angkatan',waktu='$waktu',namadosen='$namadosen',
catatan='$catatan' WHERE nim=$nim");
header("location:mahasiswa.php");

?>