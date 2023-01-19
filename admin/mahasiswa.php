<?php 
require_once 'header.php';
require_once 'config.php';


?>
<div style="left: 0px;" class="col-md-5">

<?php 
	if(isset($_GET['pesan'])){
		if($_GET['pesan']){
			echo "<script type='text/javascript'>alert(",$_GET['pesan'],");</script>";
		}
	}
?>
</div>

<h3><span class="glyphicon glyphicon-briefcase"></span>  Jadwal Konsultasi</h3>
<button style="margin-bottom:20px" data-toggle="modal" data-target="#myModal" class="btn btn-info col-md-2"><span class="glyphicon glyphicon-plus"></span>Atur Jadwal</button>
<br/>
<br/>

<?php 
if
(!function_exists('mysqli_result')) {
	function mysqli_result($source, $row, $column=0){

		$source ->data_seek($row);
		$datarow = $source->fetch_array();
		return $datarow[$column];
	}
}
$per_hal=5;
$jumlah_record=mysqli_query($conn,"SELECT COUNT(*) from tb_mahasiswa");
$jum=mysqli_result ($jumlah_record,0);
$halaman=ceil($jum / $per_hal);
$page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
$start = ($page - 1) * $per_hal;
?>
<div class="col-md-12">
	<table class="col-md-2">
		<tr>
			<td>Jumlah Record</td>		
			<td><?php echo $jum; ?></td>
		</tr>
		<tr>
			<td>Jumlah Halaman</td>	
			<td><?php echo $halaman; ?></td>
		</tr>
	</table>
</div>

<br/>

<table class="table table-hover">
	<tr>
		<th class="col-md-1">Nim</th>
		<th class="col-md-1">Nama</th>
		<th class="col-md-1">jurusan</th>
		<th class="col-md-1">Semester</th>
		<!-- <th class="col-md-1">Sisa</th>		 -->
		<th class="col-md-1">Angkatan</th>
		<th class="col-md-1">Waktu</th>
		<th class="col-md-1">Nama Dosen</th>
		<th class="col-md-1">Catatan</th>
		<th class="col-md-1">Opsi</th>
	</tr>
	<?php 

	if(@$_GET['cari']!= ""){
		$cari=mysqli_real_escape_string($conn,$_GET['cari']);
		$brg=mysqli_query($conn,"select * from tb_mahasiswa where nim like '$cari' or nama like '$cari'");
	}
	else{
		$brg=mysqli_query($conn,"select * from tb_mahasiswa limit $start, $per_hal");
	}
	$no=1;
	while($b=mysqli_fetch_array($brg)){

		?>
		<tr>
			
			<td><?php echo $b['nim'] ?></td>
			<td><?php echo $b['nama'] ?></td>
			<td><?php echo $b['jurusan'] ?></td>
			<td><?php echo $b['semester'] ?></td>
			<td><?php echo $b['angkatan'] ?></td>
			<td><?php echo $b['namadosen'] ?></td>
			<td><?php echo $b['waktu'] ?></td>
			<td><?php echo $b['catatan'] ?></td>

			
			<td>
				<a href="mahasiswa_detail.php?nim=<?php echo $b['nim']; ?>" class="btn btn-info">Detail</a>
				<a href="mahasiswa_edit.php?nim=<?php echo $b['nim']; ?>" class="btn btn-warning">Edit</a>
				<a onclick="if(confirm('Apakah anda yakin ingin menghapus data ini ??')){ location.href='mahasiswa_hapus.php?nim=<?php echo $b['nim']; ?>' }" class="btn btn-danger">Hapus</a>
			</td>
		</tr>		
		<?php 
	}
	?>
	
</table>
<ul class="pagination">			
			<?php
			if($halaman>1){ 
			for($x=1;$x<=$halaman;$x++){
				?>
				<li class="<?= ($x ==$page) ? 'active':''; ?>"><a  href="?page=<?php echo $x ?>"><?php echo $x ?></a></li>
				<?php
			}
			}else{
				echo "";
			}
			?>						
		</ul>
<!-- modal input -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Atur Jadwal</h4>
			</div>
			<div class="modal-body">
				<form action="aturjadwal.php" method="post">
					<div class="form-group">
						<label>Nim</label>
						<input name="nim" required type="text" class="form-control" placeholder="Nim ..">
					</div>										
                    <div class="form-group">
						<label>Nama</label>
						<input name="nama" required type="text" class="form-control" placeholder="Nama ..">
					</div>		
                    <div class="form-group">
						<label>Jurusan</label>
						<input name="jurusan" required type="text" class="form-control" placeholder="Jurusan ..">
					</div>
                    <div class="form-group">
						<label>Semester</label>
						<input name="semester" required type="text" class="form-control" placeholder="Semester ..">
					</div>				
                    <div class="form-group">
						<label>Angkatan</label>
						<input name="angkatan" required type="text" class="form-control" placeholder="Angkatan ..">
					</div>
                    <div class="form-group">
						<label>Tanggal</label>
						<input name="tanggal" required type="datetime-local" class="form-control" placeholder="tanggal ..">
					</div>
                    <div class="form-group">
						<label>Nama Dosen</label>
						<input name="namadosen" required type="text" class="form-control" placeholder="NamaDosen ..">
					</div>
                    <div class="form-group">
						<label>Catatan</label>
						<input name="catatan" required type="text" class="form-control" placeholder="Catatan ..">
					</div>		
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
					<input type="submit" class="btn btn-primary" value="Simpan">
				</div>
			</form>
		</div>
	</div>
</div>



<?php 
require_once 'footer.php';
?>