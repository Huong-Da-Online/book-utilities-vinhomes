-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 14, 2023 at 04:04 PM
-- Server version: 10.5.17-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookutilitiesvinhomes_dev`
--
CREATE DATABASE IF NOT EXISTS `bookutilitiesvinhomes_dev` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookutilitiesvinhomes_dev`;

-- --------------------------------------------------------

--
-- Table structure for table `booking_utility`
--

CREATE TABLE `booking_utility` (
  `vin3s_utilities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin3s_utilities_place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin3s_utilities_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_utility`
--

INSERT INTO `booking_utility` (`vin3s_utilities`, `vin3s_utilities_place`, `vin3s_utilities_time`) VALUES
('117', '846', '8057'),
('117', '846', '8067');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_12_24_041606_create_vin3s_account_table', 1),
(5, '2022_12_24_083228_create_vin3s_utilities_table', 2),
(9, '2022_12_25_052647_create_vin3s_utilities_time_table', 5),
(11, '2022_12_25_051848_create_vin3s_utilities_place_table', 6),
(12, '2022_12_25_041718_create_booking_utility_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vin3s_account`
--

CREATE TABLE `vin3s_account` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `other_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `apartment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vin3s_account`
--

INSERT INTO `vin3s_account` (`id`, `username`, `password`, `token`, `login_at`, `status`, `other_data`, `created_at`, `updated_at`, `apartment`, `account_id`) VALUES
(1, '0886868377', 'Dung@11122', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlCZlhhUkZfdXk4QkRZOU82U3FwQSJ9.eyJodHRwczovL3Zpbmdyb3VwLm5ldC9lbWFpbCI6IjA4ODY4NjgzNzdAdmluM3Mudm4iLCJodHRwczovL3Zpbmdyb3VwLm5ldC9sYW5nIjoidmkiLCJpc3MiOiJodHRwczovL3ZpbjNzLmF1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw2MTYwN2M1ZTY1MjQ3MTAwNjlkYWZlNGYiLCJhdWQiOlsiaHR0cHM6Ly92aW4zcy5hdS5hdXRoMC5jb20vYXBpL3YyLyIsImh0dHBzOi8vdmluM3MuYXUuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY3Mjg4MDM2MiwiZXhwIjoxNjcyODgzOTYyLCJhenAiOiJWNHh2VWJvcVdrcHMxZncxYjhnamxLbDVjY0szNnhuNCIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgdXBkYXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBkZWxldGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgY3JlYXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgZGVsZXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgdXBkYXRlOmN1cnJlbnRfdXNlcl9pZGVudGl0aWVzIG9mZmxpbmVfYWNjZXNzIiwiZ3R5IjoicGFzc3dvcmQifQ.RDU4tB03vR4yVfcdwgTiW48Z6_tleYg59c4koxdbvjfw9kh6-Aah8SrpbffJtqyDAnhkahkPF-x947U161O2C6--aZahrkYcfFEZeccyZwL7rMwJR5mlSML-Pn5pEOcBIY3m3kwGj5omi_DnIE5EChO6XgNUtQF7EfpvTXDqZ9wj-ETotRiSGe1xSIz3vnYyt_OpYhe83PcYSpPZw3wushYk-l6VHikWOEUinJDVsrEfrQYzI5OpaiAAyrJszut1GV2IaQixQhdTC4I-5MvvUhppldTGwk-jW3YjaLLQbuoFVWyIk942BLZX6otehXG9k2LZ538tXpJ-0Uj9YkSHdw', '2023-01-05 07:59:21', 1, '{\"Response\":{\"ResponseCode\":\"\",\"ResponseMessage\":\"Th\\u00e0nh c\\u00f4ng\",\"System\":\"\",\"IsSuccess\":true},\"ResUserToken\":{\"Access_token\":\"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InlCZlhhUkZfdXk4QkRZOU82U3FwQSJ9.eyJodHRwczovL3Zpbmdyb3VwLm5ldC9lbWFpbCI6IjA4ODY4NjgzNzdAdmluM3Mudm4iLCJodHRwczovL3Zpbmdyb3VwLm5ldC9sYW5nIjoidmkiLCJpc3MiOiJodHRwczovL3ZpbjNzLmF1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw2MTYwN2M1ZTY1MjQ3MTAwNjlkYWZlNGYiLCJhdWQiOlsiaHR0cHM6Ly92aW4zcy5hdS5hdXRoMC5jb20vYXBpL3YyLyIsImh0dHBzOi8vdmluM3MuYXUuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY3Mjg4MDM2MiwiZXhwIjoxNjcyODgzOTYyLCJhenAiOiJWNHh2VWJvcVdrcHMxZncxYjhnamxLbDVjY0szNnhuNCIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgdXBkYXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBkZWxldGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgY3JlYXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgZGVsZXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgdXBkYXRlOmN1cnJlbnRfdXNlcl9pZGVudGl0aWVzIG9mZmxpbmVfYWNjZXNzIiwiZ3R5IjoicGFzc3dvcmQifQ.RDU4tB03vR4yVfcdwgTiW48Z6_tleYg59c4koxdbvjfw9kh6-Aah8SrpbffJtqyDAnhkahkPF-x947U161O2C6--aZahrkYcfFEZeccyZwL7rMwJR5mlSML-Pn5pEOcBIY3m3kwGj5omi_DnIE5EChO6XgNUtQF7EfpvTXDqZ9wj-ETotRiSGe1xSIz3vnYyt_OpYhe83PcYSpPZw3wushYk-l6VHikWOEUinJDVsrEfrQYzI5OpaiAAyrJszut1GV2IaQixQhdTC4I-5MvvUhppldTGwk-jW3YjaLLQbuoFVWyIk942BLZX6otehXG9k2LZ538tXpJ-0Uj9YkSHdw\",\"Id_token\":\"\",\"Scope\":\"\",\"Expires_in\":\"3600\",\"Token_type\":\"\",\"Error\":\"\",\"Error_description\":\"\",\"Refresh_token\":\"-1vbeNKdfdcR5DxWCLEJBlpScbAQtJa5A6lUnFdpZGb45\"},\"ResAuth0UserInfo\":{\"Sub\":\"auth0|61607c5e6524710069dafe4f\",\"Nickname\":\"\",\"Name\":\"CH\\u00c2U TI\\u1ebeN D\\u0168NG\",\"Picture\":\"\",\"Updated_at\":\"1900-01-01T00:00:00\",\"Email\":\"0886868377@vin3s.vn\",\"Email_verified\":false},\"ResMasterUserInfo\":{\"Id\":\"0\",\"AccountingCode\":\"\",\"FullName\":\"\",\"Email\":\"\",\"Mobile\":\"\",\"Address\":\"\",\"Gender\":\"\",\"BirthDate\":\"\",\"IsMaster\":\"\",\"ContractName\":\"\",\"ContractStatusId\":\"\",\"ContractId\":\"\",\"ProfileId\":\"\",\"PopulationFOStatusId\":\"\",\"Status\":\"\",\"UserLoginVin3sId\":\"0\",\"ApartmentCode\":\"\",\"AreaName\":\"\",\"CreatedDate\":\"1900-01-01T00:00:00\",\"UpdatedDate\":\"1900-01-01T00:00:00\",\"tokenVST\":\"\",\"LastNotiSyncDate\":\"1900-01-01\"},\"ResApartments\":{\"List\":[{\"CustomerVinhome\":{\"Id\":\"0\",\"AccountingCode\":\"\",\"FullName\":\"\",\"Email\":\"\",\"Mobile\":\"\",\"Address\":\"\",\"Gender\":\"\",\"BirthDate\":\"\",\"IsMaster\":\"\",\"ContractName\":\"\",\"ContractStatusId\":\"\",\"ContractId\":\"\",\"ProfileId\":\"\",\"PopulationFOStatusId\":\"\",\"Status\":\"\",\"UserLoginVin3sId\":\"0\",\"ApartmentCode\":\"\",\"AreaName\":\"\",\"CreatedDate\":\"1900-01-01T00:00:00\",\"UpdatedDate\":\"1900-01-01T00:00:00\",\"tokenVST\":\"\",\"LastNotiSyncDate\":\"1900-01-01\"},\"Apartment\":{\"Id\":\"0\",\"ApartmentId\":\"0\",\"AreaId\":0,\"BlockId\":0,\"FloorId\":0,\"ApartmentCode\":\"\",\"ApartmentName\":\"\",\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01T00:00:00\",\"ApartmentStatus\":\"\",\"DumpStatus\":\"\",\"Type\":\"\"},\"Area\":{\"Id\":\"0\",\"AreaId\":\"0\",\"AreaName\":\"\",\"PlantId\":0,\"City\":\"\",\"CityCode\":0,\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01\",\"IsDeleted\":false},\"BlockId\":\"\",\"LastApartmentDefaultName\":\"\",\"ApartmentCount\":0,\"AuthEmail\":\"\",\"MasterName\":\"\",\"RoleName\":\"\"},{\"CustomerVinhome\":{\"Id\":\"0\",\"AccountingCode\":\"\",\"FullName\":\"\",\"Email\":\"\",\"Mobile\":\"\",\"Address\":\"\",\"Gender\":\"\",\"BirthDate\":\"\",\"IsMaster\":\"\",\"ContractName\":\"\",\"ContractStatusId\":\"\",\"ContractId\":\"\",\"ProfileId\":\"\",\"PopulationFOStatusId\":\"\",\"Status\":\"\",\"UserLoginVin3sId\":\"0\",\"ApartmentCode\":\"\",\"AreaName\":\"\",\"CreatedDate\":\"1900-01-01T00:00:00\",\"UpdatedDate\":\"1900-01-01T00:00:00\",\"tokenVST\":\"\",\"LastNotiSyncDate\":\"1900-01-01\"},\"Apartment\":{\"Id\":\"0\",\"ApartmentId\":\"0\",\"AreaId\":0,\"BlockId\":0,\"FloorId\":0,\"ApartmentCode\":\"\",\"ApartmentName\":\"\",\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01T00:00:00\",\"ApartmentStatus\":\"\",\"DumpStatus\":\"\",\"Type\":\"\"},\"Area\":{\"Id\":\"0\",\"AreaId\":\"0\",\"AreaName\":\"\",\"PlantId\":0,\"City\":\"\",\"CityCode\":0,\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01\",\"IsDeleted\":false},\"BlockId\":\"\",\"LastApartmentDefaultName\":\"\",\"ApartmentCount\":0,\"AuthEmail\":\"\",\"MasterName\":\"\",\"RoleName\":\"\"},{\"CustomerVinhome\":{\"Id\":\"0\",\"AccountingCode\":\"\",\"FullName\":\"\",\"Email\":\"\",\"Mobile\":\"\",\"Address\":\"\",\"Gender\":\"\",\"BirthDate\":\"\",\"IsMaster\":\"\",\"ContractName\":\"\",\"ContractStatusId\":\"\",\"ContractId\":\"\",\"ProfileId\":\"\",\"PopulationFOStatusId\":\"\",\"Status\":\"\",\"UserLoginVin3sId\":\"0\",\"ApartmentCode\":\"\",\"AreaName\":\"\",\"CreatedDate\":\"1900-01-01T00:00:00\",\"UpdatedDate\":\"1900-01-01T00:00:00\",\"tokenVST\":\"\",\"LastNotiSyncDate\":\"1900-01-01\"},\"Apartment\":{\"Id\":\"0\",\"ApartmentId\":\"0\",\"AreaId\":0,\"BlockId\":0,\"FloorId\":0,\"ApartmentCode\":\"\",\"ApartmentName\":\"\",\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01T00:00:00\",\"ApartmentStatus\":\"\",\"DumpStatus\":\"\",\"Type\":\"\"},\"Area\":{\"Id\":\"0\",\"AreaId\":\"0\",\"AreaName\":\"\",\"PlantId\":0,\"City\":\"\",\"CityCode\":0,\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01\",\"IsDeleted\":false},\"BlockId\":\"\",\"LastApartmentDefaultName\":\"\",\"ApartmentCount\":0,\"AuthEmail\":\"\",\"MasterName\":\"\",\"RoleName\":\"\"},{\"CustomerVinhome\":{\"Id\":\"0\",\"AccountingCode\":\"\",\"FullName\":\"\",\"Email\":\"\",\"Mobile\":\"\",\"Address\":\"\",\"Gender\":\"\",\"BirthDate\":\"\",\"IsMaster\":\"\",\"ContractName\":\"\",\"ContractStatusId\":\"\",\"ContractId\":\"\",\"ProfileId\":\"\",\"PopulationFOStatusId\":\"\",\"Status\":\"\",\"UserLoginVin3sId\":\"0\",\"ApartmentCode\":\"\",\"AreaName\":\"\",\"CreatedDate\":\"1900-01-01T00:00:00\",\"UpdatedDate\":\"1900-01-01T00:00:00\",\"tokenVST\":\"\",\"LastNotiSyncDate\":\"1900-01-01\"},\"Apartment\":{\"Id\":\"0\",\"ApartmentId\":\"0\",\"AreaId\":0,\"BlockId\":0,\"FloorId\":0,\"ApartmentCode\":\"\",\"ApartmentName\":\"\",\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01T00:00:00\",\"ApartmentStatus\":\"\",\"DumpStatus\":\"\",\"Type\":\"\"},\"Area\":{\"Id\":\"0\",\"AreaId\":\"0\",\"AreaName\":\"\",\"PlantId\":0,\"City\":\"\",\"CityCode\":0,\"Status\":\"\",\"CreateDate\":\"1900-01-01\",\"UpdateDate\":\"1900-01-01\",\"IsDeleted\":false},\"BlockId\":\"\",\"LastApartmentDefaultName\":\"\",\"ApartmentCount\":0,\"AuthEmail\":\"\",\"MasterName\":\"\",\"RoleName\":\"\"}]},\"VGCustomerId\":\"\",\"DateResignDelete\":\"1900-01-01\",\"IsDisabled\":false,\"IsDeleted\":false}', NULL, '2023-01-05 00:59:21', '30823', '145927');

-- --------------------------------------------------------

--
-- Table structure for table `vin3s_utilities`
--

CREATE TABLE `vin3s_utilities` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vin3s_utilities`
--

INSERT INTO `vin3s_utilities` (`id`, `img`, `name`) VALUES
('113', 'https://storage.googleapis.com/stg-resident-app-outsystem-sedks234/50bb93ab-3d1b-4ef0-af43-6851628357d3.png', 'Nướng BBQ'),
('114', 'https://storage.googleapis.com/stg-resident-app-outsystem-sedks234/324dc2fb-7a51-47f2-9885-04c48e886a16.png', 'Nhà Golf'),
('115', 'https://storage.googleapis.com/stg-resident-app-outsystem-sedks234/8e37e2e9-7ee1-42db-93dd-2ab25f7b22f8.png', 'Sân bóng rổ'),
('116', 'https://storage.googleapis.com/stg-resident-app-outsystem-sedks234/9fd0bcf6-2ad6-48ce-ac1d-018a3c092b70.png', 'Sân cầu lông'),
('117', 'https://storage.googleapis.com/stg-resident-app-outsystem-sedks234/4e327278-35f9-47bb-80c0-db14ede72d4d.png', 'Sân Tennis'),
('163', '', 'Công Viên Sóng Royal Wave Park');

-- --------------------------------------------------------

--
-- Table structure for table `vin3s_utilities_place`
--

CREATE TABLE `vin3s_utilities_place` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin3s_utilities_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_utility_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vin3s_utilities_place`
--

INSERT INTO `vin3s_utilities_place` (`id`, `vin3s_utilities_id`, `name`, `place_utility_id`) VALUES
('1140', '163', 'CÔNG VIÊN SÓNG - QUẦY BÁN VÉ', '1792'),
('844', '117', 'Sân Tennis Vinschool số 02', '970'),
('845', '117', 'Sân Tennis Vinschool số 01', '969'),
('846', '117', 'Sân Tennis Công Viên số 02', '968'),
('847', '117', 'Sân Tennis Công Viên số 01', '967'),
('852', '116', 'Sân Cầu Lông', '962'),
('853', '115', 'Sân Đa Năng', '961'),
('854', '113', 'Chòi Nướng BBQ số 10', '957'),
('855', '113', 'Chòi Nướng BBQ số 09', '956'),
('856', '113', 'Chòi Nướng BBQ số 08', '955'),
('857', '113', 'Chòi Nướng BBQ số 07', '954'),
('858', '113', 'Chòi Nướng BBQ số 06', '953'),
('859', '113', 'Chòi Nướng BBQ số 05', '952'),
('860', '113', 'Chòi Nướng BBQ số 04', '951'),
('861', '113', 'Chòi Nướng BBQ số 03', '950'),
('862', '113', 'Chòi Nướng BBQ số 02', '949'),
('863', '113', 'Chòi Nướng BBQ số 01', '948'),
('864', '114', 'Phòng tập Golf số 03', '960'),
('865', '114', 'Phòng tập Golf số 02', '959'),
('866', '114', 'Phòng tập Golf số 01', '958');

-- --------------------------------------------------------

--
-- Table structure for table `vin3s_utilities_time`
--

CREATE TABLE `vin3s_utilities_time` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin3s_utilities_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vin3s_utilities_time`
--

INSERT INTO `vin3s_utilities_time` (`id`, `vin3s_utilities_id`, `name`) VALUES
('8006', '113', '06:30:00 - 11:30:00'),
('8007', '113', '11:30:00 - 16:30:00'),
('8008', '113', '16:30:00 - 21:30:00'),
('8010', '114', '08:00:00 - 09:00:00'),
('8011', '114', '09:00:00 - 10:00:00'),
('8012', '114', '10:00:00 - 11:00:00'),
('8013', '114', '11:00:00 - 12:00:00'),
('8014', '114', '12:00:00 - 13:00:00'),
('8015', '114', '13:00:00 - 14:00:00'),
('8016', '114', '14:00:00 - 15:00:00'),
('8017', '114', '15:00:00 - 16:00:00'),
('8018', '114', '16:00:00 - 17:00:00'),
('8019', '114', '17:00:00 - 18:00:00'),
('8021', '115', '06:00:00 - 07:00:00'),
('8022', '115', '07:00:00 - 08:00:00'),
('8023', '115', '08:00:00 - 09:00:00'),
('8024', '115', '09:00:00 - 10:00:00'),
('8025', '115', '10:00:00 - 11:00:00'),
('8026', '115', '11:00:00 - 12:00:00'),
('8029', '115', '14:00:00 - 15:00:00'),
('8030', '115', '15:00:00 - 16:00:00'),
('8031', '115', '16:00:00 - 17:00:00'),
('8032', '115', '17:00:00 - 18:00:00'),
('8033', '115', '18:00:00 - 19:00:00'),
('8034', '115', '19:00:00 - 20:00:00'),
('8035', '115', '20:00:00 - 21:00:00'),
('8036', '115', '21:00:00 - 22:00:00'),
('8038', '116', '06:00:00 - 07:00:00'),
('8039', '116', '07:00:00 - 08:00:00'),
('8040', '116', '08:00:00 - 09:00:00'),
('8041', '116', '09:00:00 - 10:00:00'),
('8042', '116', '10:00:00 - 11:00:00'),
('8043', '116', '11:00:00 - 12:00:00'),
('8046', '116', '14:00:00 - 15:00:00'),
('8047', '116', '15:00:00 - 16:00:00'),
('8048', '116', '16:00:00 - 17:00:00'),
('8049', '116', '17:00:00 - 18:00:00'),
('8050', '116', '18:00:00 - 19:00:00'),
('8051', '116', '19:00:00 - 20:00:00'),
('8052', '116', '20:00:00 - 21:00:00'),
('8053', '116', '21:00:00 - 22:00:00'),
('8055', '117', '06:00:00 - 07:00:00'),
('8056', '117', '07:00:00 - 08:00:00'),
('8057', '117', '08:00:00 - 09:00:00'),
('8058', '117', '09:00:00 - 10:00:00'),
('8059', '117', '10:00:00 - 11:00:00'),
('8060', '117', '11:00:00 - 12:00:00'),
('8063', '117', '14:00:00 - 15:00:00'),
('8064', '117', '15:00:00 - 16:00:00'),
('8065', '117', '16:00:00 - 17:00:00'),
('8066', '117', '17:00:00 - 18:00:00'),
('8067', '117', '18:00:00 - 19:00:00'),
('8068', '117', '19:00:00 - 20:00:00'),
('8069', '117', '20:00:00 - 21:00:00'),
('8070', '117', '21:00:00 - 22:00:00'),
('8846', '163', '09:00:00 - 12:00:00'),
('8847', '163', '14:00:00 - 18:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_utility`
--
ALTER TABLE `booking_utility`
  ADD PRIMARY KEY (`vin3s_utilities`,`vin3s_utilities_place`,`vin3s_utilities_time`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `vin3s_account`
--
ALTER TABLE `vin3s_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vin3s_utilities`
--
ALTER TABLE `vin3s_utilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vin3s_utilities_place`
--
ALTER TABLE `vin3s_utilities_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vin3s_utilities_time`
--
ALTER TABLE `vin3s_utilities_time`
  ADD PRIMARY KEY (`id`,`vin3s_utilities_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vin3s_account`
--
ALTER TABLE `vin3s_account`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
