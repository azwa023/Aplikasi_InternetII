<?php 
include 'config.php';
$nim=$_POST['nim'];
$nama=$_POST['nama'];
$jurusan=$_POST['jurusan'];
$semester=$_POST['semester'];
$angkatan=$_POST['angkatan'];
$tanggal=$_POST['tanggal'];
$namadosen=$_POST['namadosen'];
$catatan=$_POST['catatan'];


$check = mysqli_num_rows(mysqli_query($conn,"select * from tb_mahasiswa where nim='$nim'"));
if ($check){
    echo "<script type='text/javascript'>alert('id telah ada');</script>";
    header("location:mahasiswa.php?pesan='gagal nim $nim telah ada sebelumnya'");
}else{
    mysqli_query($conn,"INSERT INTO `tb_mahasiswa` (`nim`, `nama`, `jurusan`, `semester`,`angkatan`,
    `waktu`,`namadosen`,`catatan`)VALUES ('$nim','$nama','$jurusan','$semester','$angkatan','$tanggal','$namadosen','$catatan')");
    header("location:mahasiswa.php");
}
?>