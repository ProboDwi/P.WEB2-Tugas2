<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<title>Data Mahasiswa</title>
</head>

<body>
	<center>
		<h2 class="p-3">Mahasiswa Politeknik Negeri Cilacap</h2>
	</center><br>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h5>DATA MAHASISWA PNC</h5>
					</div>
					<div class="card-body">
						<table class="table table-bordered" id="myTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">Nim</th>
									<th scope="col">Nama</th>
									<th scope="col">Alamat</th>
									<th scope="col">Signature</th>
									<th scope="col">No. HP</th>
									<th scope="col">Program Studi</th>
								</tr>
							</thead>
							<tbody>
								<?php
								include 'library.php';

								$mhs = new Students();
								$data_mhs = $mhs->ShowData();

								$no = 1;
								foreach ($data_mhs as $row) {
								?>
									<tr>
										<td><?php echo $no++; ?></td>
										<td><?php echo $row['nim']; ?></td>
										<td><?php echo $row['name']; ?></td>
										<td><?php echo $row['address']; ?></td>
										<td><?php echo $row['signature']; ?></td>
										<td><?php echo $row['number_phone']; ?></td>
										<td><?php echo $row['study_programs_id']; ?></td>
									</tr>
								<?php
								}
								?>
							</tbody>
						</table>
						<a href="index.php" class="btn btn-md btn-primary" style="margin-bottom: 10px">Kembali</a>
					</div>
				</div>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
</body>

</html>