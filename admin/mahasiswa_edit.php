<?php 
include 'header.php';
?>
<h3><span class="glyphicon glyphicon-briefcase"></span>  
Edit Konsultasi</h3>
<a class="btn" href="mahasiswa.php"><span class="glyphicon glyphicon-arrow-left"></span>  Kembali</a>
<?php
$nim= $_GET['nim'];
$det=mysqli_query($conn,"select * from tb_mahasiswa where nim='$nim'")or die(mysqli_error($conn));
while($d=mysqli_fetch_array($det)){
?>					
	<form action="mahasiswa_update.php" method="POST">
		<table class="table">
			<tr>
				<td></td>
				<td><input type="hidden" name="nim" value="<?php echo $d['nim'] ?>"></td>
			</tr>
			<tr>
				<td>nama</td>
				<td><input type="text" class="form-control" name="nama" value="<?php echo $d['nama'] ?>"></td>
			</tr>
			<tr>
				<td>jurusan</td>
				<td><input type="text" class="form-control" name="jurusan" value="<?php echo $d['jurusan'] ?>"></td>
			</tr>
			<tr>
				<td>semester</td>
				<td><input type="text" class="form-control" name="semester" value="<?php echo $d['semester'] ?>"></td>
			</tr>
			<tr>
				<td>angkatan</td>
				<td><input type="text" class="form-control" name="angkatan" value="<?php echo $d['angkatan'] ?>"></td>
			</tr>
			<tr>
				<td>waktu</td>
				<td><input type="datetime-local" class="form-control" name="waktu" value="<?php echo $d['waktu'] ?>"></td>
			</tr>
			<tr>
				<td>Namadosen</td>
				<td><input type="text" class="form-control" name="namadosen" value="<?php echo $d['namadosen'] ?>"></td>
			</tr>
			<tr>
				<td>Catatan</td>
				<td><input type="text" class="form-control" name="catatan" value="<?php echo $d['catatan'] ?>"></td>
			</tr>
			<tr>
				
				<td><input type="submit" class="btn btn-info" value="Edit"></td>
			</tr>
		</table>
	</form>
	<?php 
}
?>
<?php include 'footer.php'; ?>