-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Sep 2024 pada 14.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp_pweb2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `study_programs_id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signature` varchar(50) NOT NULL,
  `number_phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `study_programs_id`, `nim`, `name`, `address`, `signature`, `number_phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 1000, 'Probo', 'Adipala', 'pdw', '081234', '2023-09-12 00:29:37', '2023-12-11 06:02:56', '0000-00-00 00:00:00'),
(3, 2, 1001, 'Jamal', 'Karangbenda', 'jml', '081235', '2024-06-19 04:12:54', '2024-10-31 09:17:54', '0000-00-00 00:00:00'),
(4, 4, 1002, 'Dimas', 'Binangun', 'dimz', '081236', '2024-02-07 01:27:42', '2024-05-22 14:47:05', '0000-00-00 00:00:00'),
(5, 9, 1003, 'Fahmi', 'Sokaraja', 'fhm', '081237', '2024-07-15 05:32:04', '2024-08-28 03:38:51', '0000-00-00 00:00:00'),
(6, 1, 1004, 'Alva', 'Cilacap', 'alv', '081238', '2024-03-19 06:33:30', '2024-08-28 05:13:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `study_programs`
--

CREATE TABLE `study_programs` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `study_programs`
--

INSERT INTO `study_programs` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'D3 Teknik Informatika', '2024-01-07 21:35:31', '2024-05-07 16:37:57', '0000-00-00 00:00:00'),
(2, 'D3 Teknik Mesin', '2024-02-21 07:19:35', '2024-05-17 07:00:49', '0000-00-00 00:00:00'),
(3, 'D3 Teknik Listrik', '2023-03-20 06:15:58', '2023-11-10 05:28:58', '0000-00-00 00:00:00'),
(4, 'D3 Teknik Elektronika', '2023-04-12 00:39:21', '2024-06-19 08:31:21', '0000-00-00 00:00:00'),
(5, 'D4 Teknik Pengendalian Pencemaran Linfkungan', '2023-08-15 23:32:59', '2023-11-04 14:32:59', '0000-00-00 00:00:00'),
(6, 'D4 Pengembangan Produk Agro Industri', '2023-05-18 07:22:31', '2023-10-19 02:37:16', '0000-00-00 00:00:00'),
(7, 'D4 Akuntansi Lembaga Keuangan Syariah', '2023-02-23 00:38:50', '2023-10-18 08:15:59', '0000-00-00 00:00:00'),
(8, 'D4 Rekayasa Keamanan Syber', '2023-09-12 05:39:53', '2023-12-18 00:25:30', '0000-00-00 00:00:00'),
(9, 'D4 Rekayasa Multimedia', '2023-11-10 04:24:33', '2024-01-15 04:30:42', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_programs_id` (`study_programs_id`);

--
-- Indeks untuk tabel `study_programs`
--
ALTER TABLE `study_programs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `study_programs`
--
ALTER TABLE `study_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`study_programs_id`) REFERENCES `study_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
