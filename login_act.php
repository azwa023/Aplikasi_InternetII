<?php 
session_start();
include 'admin/config.php';
$uname=$_POST['uname'];
$pass=$_POST['pass'];
$pas=sha1($pass);
$query=mysqli_query($conn,"select * from user where username='$uname' and password='$pas'")or die(mysqli_error($conn));
if(mysqli_num_rows($query)==1){
	$_SESSION['uname']=$uname;
	header("location:admin/index.php");
}else{
	header("location:index.php?pesan=gagal")or die(mysqli_error($conn));
	// mysql_error();
}
// echo $pas;
?>