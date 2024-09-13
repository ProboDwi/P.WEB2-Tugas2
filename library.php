<?php
class database {
	// atribut untuk koneksi ke database
	private $host = "localhost";
	private $username = "root";
	private $password = "";
	private $db_name = "erp_pweb2";
	public $link;
	public $error;

	function __construct() {
		$this->link = mysqli_connect($this->host, $this->username, $this->password, $this->db_name);
		if (!$this->link) {
			$this->error = "Database Connection Failed";
			return false;
		}
	}
}

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
?>