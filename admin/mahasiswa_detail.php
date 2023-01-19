<?php 
include 'header.php';
?>

<h3><span class="glyphicon glyphicon-briefcase"></span>  Info Konsultasi</h3>
<a class="btn" href="mahasiswa.php"><span class="glyphicon glyphicon-arrow-left"></span>  Kembali</a>

<?php
$nim= $_GET['nim'];


$det=mysqli_query($conn,"select * from tb_mahasiswa where nim='$nim'")or die(mysqli_error($conn));
while($d=mysqli_fetch_array($det)){
	?>

<table class="table">
    <tr>
        <td style="font-weight:bolder;">Nim</td>
        <td><?php echo $d['nim'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Nama</td>
        <td><?php echo $d['nama'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Jurusan</td>
        <td><?php echo $d['jurusan'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Semester</td>
        <td><?php echo $d['semester'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Angkatan</td>
        <td><?php echo $d['angkatan'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Waktu</td>
        <td><?php echo $d['waktu'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Nama Dosen</td>
        <td><?php echo $d['namadosen'] ?></td>
    </tr>
    <tr>
        <td style="font-weight:bolder;">Catatan</td>
        <td><?php echo $d['catatan'] ?></td>
    </tr>


</table>





</main>
	<?php 
}
?>
<?php include 'footer.php'; ?>