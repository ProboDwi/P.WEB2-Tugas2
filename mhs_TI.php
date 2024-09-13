<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <title>Mahasiswa TI</title>
</head>

<body>
    <center>
        <h2 class="p-3">Mahasiswa Teknik Informatika</h2>
    </center><br>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>DATA MAHASISWA</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered" id="myTable">
                            <thead>

                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Nim</th>
                                    <th scope="col">Nama</th>
                                    <th scope="col">Program Studi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                include 'library.php';

                                $TI = new Mhs_TI();
                                $data_TI = $TI->ShowData_Mhs();

                                $no = 1;
                                foreach ($data_TI as $row) {
                                ?>
                                    <tr>
                                        <td><?php echo $no++; ?></td>
                                        <td><?php echo $row['nim']; ?></td>
                                        <td><?php echo $row['name']; ?></td>
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