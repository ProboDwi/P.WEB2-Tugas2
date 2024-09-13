# P.WEB2-Tugas2
# Tentang Saya 👋
![Static Badge](https://img.shields.io/badge/Nama-Probo_Dwi_Wahyudi-bottlegreen)<br/>
![Static Badge](https://img.shields.io/badge/NIM-230202041-bottlegreen)<br/>
![Static Badge](https://img.shields.io/badge/Kelas-TI2B-bottlegreen) 
## Tujuan
Repository ini dibuat untuk memenuhi tugas ke-2 matakuliah Pemrograman Web 2 yang diampu oleh Pak Prih Diantono Abda'U, S.Kom., M.Kom.

## Dokumentasi dan Penjelasan
### Dokumentasi
- Code library.php
![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/code.png)
### Penjelasan
- Code diatas adalah hasil akhir dari tugas yang telah saya kerjakan mengenai Sistem ERP JKB dengan study kasus "Students dan Study_Programs" yang disimpan di file "library.php", didalam code tersebut mencakup poin poin diantaranya: 
  1. Membuat View berbasis OOP, dengan mengambil data dari database MySQL.
  2. Menggunakan _construct sebagai link ke database.
  3. Menerapkan enkapsulasi sesuai logika studi kasus.
  4. Membuat kelas turunan menggunakan konsep pewarisan.
  5. Menerapkan polimorphism untuk minimal 2 peran sesuai studi kasus.

- OOP merupakan paradigma pemrograman yang berorientasi objek, yang didalamnya terdapat class dan objek yang digunakan untuk memodelkan masalah di dunia nyata kedalam kode program.
- Class merupakan rancangan atau blueprint yang mendefinisikan struktur dan perilaku dari objek, yang dimana struktur tersebut mencakup properti(atribut) dan metode(method).
- Objek merupakan instansiasi dari objek yang mewarisi semua atribut dan method yang terdapat didalam class yang digunakan untuk memanipulasi data.
- Dari gambar diatas terdapat beberapa class dengan kegunaan yang berbeda-beda.
- Class database
  ```php
  class database {
	// atribut untuk keperluan koneksi ke database
	private $host = "localhost"; // Menyimpan nama host database
	private $username = "root"; // Menyimpan username untuk masuk ke dalam database
	private $password = ""; // Menyimpan password untuk akses masuk ke dalam database
	private $db_name = "erp_pweb2"; // Menyimpan nama database yang akan digunakan atau di panggil
	public $link; // Menyimpan element ketika koneksi berhasil dibuat
	public $error; // Menyimpan notice atau pesan error ketika gagal melakukan koneksi

	function __construct() {
		$this->link = mysqli_connect($this->host, $this->username, $this->password, $this->db_name);
		if (!$this->link) {
			$this->error = "Database Connection Failed";
			return false;
  		}
  	}
  }
  ```
  Penjelasan:
  class database digunakan untuk melakukan koneksi ke database MYSQL. didalam class database terdapat beberapa atribut dan method.
    1. atribut host, username, password dan db_name bersifat private karena untuk keamanan.
    2. atribut link dan error dibuat public karena nantinya atribut tersebut akan terus digunakan di class lain.
    3. pemilihin jenis atribut ini merupakan visibilitas, fitur dari konsep encapsulation.
    4. method __construct akan secara otomatis dijalankan saat class di instansiasi oleh objek. method ini berfungsi untuk koneksi ke database dengan fungsi mysqli_connect          yang kemudian di simpan didalam $this->link yang artinya merujuk ke properti $link yang ada didalam class, setelah itu akan dilakukan pengecekan jika gagal melakukan         koneksi maka akan disimpan di properti $error dan mengembalikan nilai false atau error.
       
- Class Students (Turunan dari class database)
  ```php
  class Students extends database {
	// Mengambil data dari tabel student
	public function ShowData_Mhs() {
		$result = mysqli_query(
			$this->link,
			"SELECT a.nim, a.name, a.address, a.signature, a.number_phone, b.name AS study_programs_id 
             FROM students a 
             JOIN study_programs b ON a.study_programs_id = b.id"
		);
		$array = array();
		while ($row = mysqli_fetch_array($result)) {
			$array[] = $row;
		}
		return $array;
  	}
  }
  ```
  Penjelasan:
  Class Students bertanggung jawab untuk mengambil data dari tabel Students, class ini merupakan implementasi dari konsep inheritance karena class ini mewarisi semua atribut   dan method dari class databasse, sehingga tidak perlu membuat kode untuk koneksi ke database lagi.
    1. Method ShowData_Mhs: method ini bertugas untuk mengambil data dari tabel "students" yang kemudian digabungkan datanya dengan tabel "study_programs" dengan perintah JOIN.
       ```php
       "SELECT a.nim, a.name, a.address, a.signature, a.number_phone, b.name AS study_programs_id 
       FROM students a 
       JOIN study_programs b ON a.study_programs_id = b.id"
       ```
       Select berarti memilih kolom yang akan ditampilkan, "a" dan "b" adalah nama alias untuk menyederhanakan nama tabel. kemudian kolom "name" pada tabel "b" atau                 "study_programs" diberi nama alias(AS) study_programs_id yang ada di tabel "students". kemudian FROM (dari tabel mana kolom tersebut diambil), dan JOIN (berarti tabel        "study_programs" gabung ke tabel "students"). "a.study_programs_id = b.id", yang berarti mencocokan baris yang memiliki nilai yang sama di kolom "study_programs_id"          pada tabel "students" dan kolom "id" pada tabel "study_programs". Setelah query dijalankan menggunakan mysqli_query(), data tersebut akan disimpan ke dalam array             $array yang kemudian nilai array tersebut dikembalikan sebagai hasil  dari method ShowData().

- Class Study_programs (Turunan dari class database)
  ```php
  class Study_programs extends database {
	// Mengambil semua data dari tabel study_programs
	public function ShowData_Prodi() {
		$query = "SELECT * FROM study_programs";
		$result = mysqli_query($this->link, $query);
		$array = array();
		while ($row = mysqli_fetch_array($result)) {
			$array[] = $row;
		}
		return $array;
  	}
  }
  ```
  Penjelasan:
  class study_programs bertugas untuk menampilkan data yang ada didalam tabel "study_programs". method ShowData_Prodi didalamnya terdapat query "SELECT * FROM study_programs" yang digunakan untuk mengambil semua data yang ada didalam tabel study_programs. setelah query dijalankan data tersebut disimapn didalam array $array. fungsi "mysqli_fetch_array" berfungsi untuk mengambil data perbaris dan mengembalikan data kedalam bentuk array kemudian disimpan dalam variabel $row proses ini diulangi dengan while.
  
-  class Mhs_TI (Turunan dari class students)
  ```php
	class Mhs_TI extends Students {
		public function ShowData_Mhs() {
		$result = mysqli_query($this->link, "SELECT a.nim, a.name, b.name AS study_programs_id 
	             FROM students a 
	             JOIN study_programs b ON a.study_programs_id = b.id WHERE b.name = 'D3 Teknik Informatika'");
			$array = array();
			while ($row = mysqli_fetch_array($result)) {
				$array[] = $row;
			}
			return $array;
		}
	}
```

 Penjelasan:
class Mhs_TI berfungsi untuk mengambil atribut dari class induk untuk menampilkan data yang lebih spesifik. method ShowData_Mhs merupakan method yang sama dengan class induknya tetapi pada class ini menerapkan implementasi yang berbeda, konsep ini disebut dengan "Polymorphism". di dalam method ini fungsinya hampir sama seperti pada class "Students", hanya saja pada class ini ada sedikit query tambahan yaitu "WHERE b.name = 'D3 Teknik Informatika'", yang artinya query tersebut akan mengeksekusi dan menampilkan data yang nilainya "D3 Teknik Informatika".

- class Mhs_Mesin (Turunan dari class students)
  ```php
	class Mhs_Mesin extends Students {
		public function ShowData_Mhs() {
			$result = mysqli_query($this->link, "SELECT a.nim, a.name, b.name AS study_programs_id 
	             FROM students a 
	             JOIN study_programs b ON a.study_programs_id = b.id WHERE b.name = 'D3 Teknik Mesin'");
			$array = array();
			while ($row = mysqli_fetch_array($result)) {
				$array[] = $row;
			}
			return $array;
		}
	}
  ```

Penjelasan:
class Mhs_Mesin berfungsi untuk mengambil atribut dari class induk untuk menampilkan data yang lebih spesifik. method ShowData_Mhs merupakan method yang sama dengan class Students dan juga class Mhs_mesin tetapi pada class ini menerapkan implementasi yang berbeda, konsep ini disebut dengan "Polymorphism". di dalam method ini fungsinya sama persis seperti pada class "Mhs_TI", hanya saja pada class ini query yang digunakan yaitu "WHERE b.name = 'D3 Teknik Informatika'", yang artinya query tersebut akan mengeksekusi dan menampilkan data yang nilainya "D3 Teknik Mesin".

- Instansiasi Objek
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/show.png)
  
  Penjelasan:
  1. include 'library.php' berfungsi untuk membawa semua perintah baik itu class, method, ataupun atribut agar bisa digunakan di file ataupun folder yang lain.
  2. $prodi = new Study_programs() merupakan instansiasi objek dari class study_program yang kemudian disimpan didalam variabel $prodi.
  3. $data_prodi = $prodi->ShowData_Prodi(); mengambil method ShowData_Prodi() oleh objek $prodi untuk mengambil semua data dari tabel study_programs, kemudian disimpan didalam variabel $data_prodi.
  4. foreach ($data_prodi as $row), untuk melakukan perulangan setiap elemen dari array prodi, yang kemudian setiap data yang diambil per baris dari ShowData_Prodi() akan ditampung di variabel $row.
  5. <td><?php echo $row['name']; ?></td> , untuk mencetak nilai yang telah dieksekusi pada perulangan, yang dimana nilai 'name' didapat dari hasil query method ShowData_Prodi() yang mengambil dari kolom 'name' pada tabel 'study_programs'.

- Code index.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/index.png)

- Output index.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/output_index.png)

- Code prodi.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/prodi.png)

- Output prodi.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/output_prodi.png)

- Code mahasiswa.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/mhs.png)

- Output mahasiswa.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/output_mhs.png)

- Code mhs_TI.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/mhs_ti.png)

- Output mhs_TI.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/output_ti.png)

- Code mhs_mesin.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/mhs_msn.png)

- Output mhs_mesin.php
  ![alt text](https://github.com/ProboDwi/P.WEB2-Tugas2/blob/main/img_tugas2/output_msn.png)


## Authors 🚀
- [@ProboDwiWahyudi](https://github.com/ProboDwi)
