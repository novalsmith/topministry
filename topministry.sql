-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2020 at 11:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topministry`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminsetting`
--

CREATE TABLE `adminsetting` (
  `id_set` int(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `letakMenu` varchar(20) NOT NULL,
  `nama_web` varchar(100) NOT NULL,
  `nama_instansi` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `facebookLik` varchar(150) NOT NULL,
  `googleLink` varchar(150) NOT NULL,
  `tlp` text NOT NULL,
  `Deskripsi` text NOT NULL,
  `Api1` text NOT NULL,
  `Api2` text NOT NULL,
  `Api3` text NOT NULL,
  `Api4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminsetting`
--

INSERT INTO `adminsetting` (`id_set`, `logo`, `letakMenu`, `nama_web`, `nama_instansi`, `email`, `facebookLik`, `googleLink`, `tlp`, `Deskripsi`, `Api1`, `Api2`, `Api3`, `Api4`) VALUES
(1, 'file_1510157019.png', 'left', 'Kabarmapegaa.com', 'Kabar Mapegaa', 'alexander@kabarmapegaa.com', 'facebook.com/kabarmapegaa', 'google.com/kabarmapegaa', '081344571308', 'Kabarmapega adalah instansi yang menangani penyuaraan Hak Rakyat Papua Secara digital', '<div xss=removed> <div xss=removed> <div xss=removed></div></div><p xss=removed><a href=\"https://www.instagram.com/p/BUQ0h5slIq_/\" target=\"_blank\">A post shared by Sorong Developer (@sorongdeveloper)</a> on <time xss=removed datetime=\"2017-05-19T05:50:59+00:00\">May 18, 2017 at 10:50pm PDT</time>\r\n  </p>\r\n  </div>', 'src=\"https://www.facebook.com/plugins/page.php?href=https://www.facebook.com/forkomams/&tabs=timeline&width=500&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1656028094693352\" width=\"500\" height=\"500\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\"', 'Kosong', 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(10) NOT NULL,
  `nama_agenda` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `status_tampil` int(1) NOT NULL,
  `fotoagenda` varchar(100) NOT NULL,
  `tgl_posting` varchar(20) NOT NULL,
  `tempat_pelaksanaan` varchar(100) NOT NULL,
  `slugAgenda` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `nama_agenda`, `keterangan`, `status_tampil`, `fotoagenda`, `tgl_posting`, `tempat_pelaksanaan`, `slugAgenda`, `createdate`) VALUES
(83, 'gfff', 'ffffffffffffff', 1, '', '08/23/2020', '', '', '0000-00-00 00:00:00'),
(84, 'sdifusfd ', 'good good mantab\n', 0, 'nytimes3_top20200823043156.png', '08/23/2020', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `albumfoto`
--

CREATE TABLE `albumfoto` (
  `id_album` int(11) NOT NULL,
  `id_foto` int(10) NOT NULL,
  `tgl_post` date NOT NULL,
  `oleh` int(10) NOT NULL,
  `foto` text NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albumfoto`
--

INSERT INTO `albumfoto` (`id_album`, `id_foto`, `tgl_post`, `oleh`, `foto`, `keterangan`) VALUES
(52, 9, '2018-04-29', 4, '19c0a75bbd90c5c1dd6019893e857210.jpg', 'fadfadfadfadfadfa'),
(47, 9, '2018-04-29', 4, 'file_1524995925.jpg', 'profils'),
(49, 9, '2018-04-29', 4, '1daad08c526c1e66d8f89f216a5dd4f9.jpg', 'asfadfadf'),
(50, 9, '2018-04-29', 4, 'ce42cde4246d8616873c40a1ed222e90.jpg', 'adfafafafa'),
(51, 9, '2018-04-29', 4, '755ba6f3693b9cb30f2175407888546c.jpg', 'fadfafadfda'),
(53, 9, '2018-04-29', 4, 'ae72b70a03e7b07a292c4993240ca719.jpg', 'zxczxc'),
(54, 9, '2018-04-29', 4, '558ca1785324d24c182c4eeaf65d8067.jpeg', 'czxczxczczxczxc');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_article` int(10) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `slug` text NOT NULL,
  `content` text NOT NULL,
  `poster` varchar(100) NOT NULL,
  `id_menu` int(10) NOT NULL,
  `poster_info` text DEFAULT NULL,
  `id_categori` int(10) NOT NULL,
  `tags` text DEFAULT NULL,
  `status` int(1) NOT NULL,
  `createdate` datetime NOT NULL,
  `createby` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_article`, `judul`, `slug`, `content`, `poster`, `id_menu`, `poster_info`, `id_categori`, `tags`, `status`, `createdate`, `createby`) VALUES
(2057, 'Israel, Bahrain agree to establish full diplomatic ties', '', '<p>Bahrain and Israel have agreed to establish full diplomatic relations, US President Donald Trump announced on Friday, hailing the deal as &quot;a historic breakthrough&quot;.</p>\n\n<p>In a joint statement, the United States, Bahrain and Israel said the agreement was reached after Trump spoke with Israeli Prime Minister Benjamin Netanyahu and Bahrain&#39;s King Hamad bin Isa Al Khalifa on Friday.</p>\n\n<p>&quot;This is a historic breakthrough to further peace in the Middle East,&quot; the statement read.</p>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"\" class=\"col-md-12\" src=\"https://www.aljazeera.com/mritems/imagecache/mbdxxlarge/mritems/Images/2020/9/11/a7e7f213198841a08674a4ec5245a025_18.jpg\" /></p>\n\n<p>The deal comes after Israel and the United Arab Emirates announced&nbsp;<a href=\"https://www.aljazeera.com/news/2020/08/israel-uae-announce-normalisation-relations-200813145645861.html\">a similar agreement</a>&nbsp;last month.</p>\n\n<p>Bahrain will join Israel and the UAE for a signing ceremony at the White House on September 15, Trump told reporters on Friday.</p>\n\n<p>&quot;It&#39;s unthinkable that this could happen and so fast,&quot; he said about the Israel-Bahrain deal.</p>\n\n<p>&nbsp;</p>\n\n<p>Trump&#39;s son-in-law and senior White House adviser, Jared Kushner, hailed the agreements as &quot;the culmination of four years of great work&quot; by the Trump administration.</p>\n\n<p>&quot;We&#39;re seeing the beginning of a new Middle East, and the president has really secured alliances and partners in trying to pursue that,&quot; Kushner said.</p>\n\n<p><iframe frameborder=\"0\" src=\"https://players.brightcove.net/665003303001/BkeSH5BDb_default/index.html?videoId=6184096684001&amp;usrPersonaAds=0\"></iframe></p>\n\n<table border=\"0\">\n	<tbody>\n		<tr>\n			<td>\n			<p>A history of Arab-Israeli normalisation</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>In a Hebrew-language statement, Netanyahu said he was &quot;moved&quot; to announce the agreement with Bahrain, which he said &quot;adds to the historic peace with the United Arab Emirates&quot;.&nbsp;</p>\n\n<p>For its part, Bahrain said on Friday it supports a &quot;fair and comprehensive&quot; peace in the Middle East, the country&#39;s BNA state news agency reported.</p>\n\n<p>That peace should be based on a two-state solution to resolve the Israeli-Palestinian conflict,&nbsp;King Hamad said.</p>\n\n<p>&nbsp;</p>\n\n<h2>US election looms</h2>\n\n<p>Since coming into office, the Trump administration has pursued staunchly pro-Israel policies, from moving the US embassy from Tel Aviv to Jerusalem to ordering the PLO to shutter its Washington, DC, office and recognising Israel&#39;s occupation on the Syrian Golan Heights.</p>\n\n<p>The US president and his advisers have championed a so-called &quot;deal of the century&quot; proposal to resolve the Israeli-Palestinian conflict - and they have courted Arab Gulf states to try to drum up support for that initiative.</p>\n\n<p>Bahrain, for example, hosted&nbsp;<a href=\"https://www.aljazeera.com/news/2019/06/led-bahrain-workshop-palestine-latest-updates-190624092422392.html\">a US-led conference</a>&nbsp;in June 2019 to unveil the economic side of the proposal, and Emirati and Saudi leaders voiced support at the time for any economic agreement that would benefit Palestinians.</p>\n\n<p>Palestinian leaders boycotted that summit, however, saying the Trump administration was not an honest broker in any future negotiations with Israel.</p>\n\n<p><img alt=\"\" src=\"https://www.aljazeera.com/mritems/Images/2020/9/9/503a49ab1ef24d57b64954f0a0e54d8f_18.jpg\" style=\"height:562px; width:999px\" /></p>\n\n<p>&nbsp;</p>\n', 'nytimes2_top20200909113942.png', 0, NULL, 105, 'Codeigniter,Api,NodeJs,Azure', 1, '0000-00-00 00:00:00', 0),
(2079, 'percobaan ke 1', '', '<p>zzzzzzzzzzzzzzzzzzzzzzzzzzzz zzzzzz</p>\n', 'antoine-griezmann_top20200913063658.jpg', 0, NULL, 103, 'Codeigniter', 0, '0000-00-00 00:00:00', 0),
(2080, 'percobaan ke 2', '', '<p>zzzzzzzzzzzzzzzzzzzzzzzzzzzz zzzzzz</p>\n', 'antoine-griezmann_top20200913063726.jpg', 0, NULL, 105, 'Codeigniter,Api,NodeJs,Azure', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blokmenu_berita`
--

CREATE TABLE `blokmenu_berita` (
  `id_blokmenu_berita` int(10) NOT NULL,
  `viewmax` int(5) NOT NULL,
  `status_blok` varchar(10) NOT NULL,
  `id_menu` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blokmenu_berita`
--

INSERT INTO `blokmenu_berita` (`id_blokmenu_berita`, `viewmax`, `status_blok`, `id_menu`) VALUES
(218, 5, 'Tidak', 89),
(217, 5, 'Tidak', 88),
(216, 5, 'Tidak', 87),
(215, 10, 'Aktif', 71),
(214, 6, 'Aktif', 51),
(213, 6, 'Aktif', 54),
(212, 5, 'Tidak', 57),
(211, 6, 'Aktif', 64);

-- --------------------------------------------------------

--
-- Table structure for table `categori`
--

CREATE TABLE `categori` (
  `id_categori` int(10) NOT NULL,
  `nama_categori` varchar(50) NOT NULL,
  `status_categori` int(1) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categori`
--

INSERT INTO `categori` (`id_categori`, `nama_categori`, `status_categori`, `createdate`) VALUES
(103, 'php', 1, '0000-00-00 00:00:00'),
(104, 'java', 0, '0000-00-00 00:00:00'),
(105, 'C Sharp (C#)', 1, '0000-00-00 00:00:00'),
(106, 'Node Js', 0, '0000-00-00 00:00:00'),
(107, 'Vue', 0, '0000-00-00 00:00:00'),
(108, 'Kategori Ke - 1', 0, '0000-00-00 00:00:00'),
(109, 'Kategori Ke - 2', 0, '0000-00-00 00:00:00'),
(110, 'Kategori Ke - 3', 0, '0000-00-00 00:00:00'),
(111, 'Kategori Ke - 4', 0, '0000-00-00 00:00:00'),
(112, 'Kategori Ke - 5', 0, '0000-00-00 00:00:00'),
(113, 'Kategori Ke - 6', 0, '0000-00-00 00:00:00'),
(114, 'Kategori Ke - 7', 0, '0000-00-00 00:00:00'),
(115, 'Kategori Ke - 8', 0, '0000-00-00 00:00:00'),
(116, 'Kategori Ke - 9', 0, '0000-00-00 00:00:00'),
(117, 'Kategori Ke - 10', 0, '0000-00-00 00:00:00'),
(118, 'Kategori Ke - 11', 0, '0000-00-00 00:00:00'),
(119, 'Kategori Ke - 12', 0, '0000-00-00 00:00:00'),
(120, 'Kategori Ke - 13', 0, '0000-00-00 00:00:00'),
(121, 'Kategori Ke - 14', 0, '0000-00-00 00:00:00'),
(122, 'Kategori Ke - 15', 0, '0000-00-00 00:00:00'),
(123, 'Kategori Ke - 16', 0, '0000-00-00 00:00:00'),
(124, 'Kategori Ke - 17', 0, '0000-00-00 00:00:00'),
(125, 'Kategori Ke - 18', 0, '0000-00-00 00:00:00'),
(126, 'Kategori Ke - 19', 0, '0000-00-00 00:00:00'),
(127, 'Kategori Ke - 20', 0, '0000-00-00 00:00:00'),
(128, 'Kategori Ke - 21', 0, '0000-00-00 00:00:00'),
(129, 'Kategori Ke - 22', 0, '0000-00-00 00:00:00'),
(130, 'Kategori Ke - 23', 0, '0000-00-00 00:00:00'),
(131, 'Kategori Ke - 24', 0, '0000-00-00 00:00:00'),
(132, 'Kategori Ke - 25', 0, '0000-00-00 00:00:00'),
(133, 'Kategori Ke - 26', 0, '0000-00-00 00:00:00'),
(134, 'Kategori Ke - 27', 0, '0000-00-00 00:00:00'),
(135, 'Kategori Ke - 28', 0, '0000-00-00 00:00:00'),
(136, 'Kategori Ke - 29', 0, '0000-00-00 00:00:00'),
(137, 'Kategori Ke - 30', 0, '0000-00-00 00:00:00'),
(138, 'Kategori Ke - 31', 0, '0000-00-00 00:00:00'),
(139, 'Kategori Ke - 32', 0, '0000-00-00 00:00:00'),
(140, 'Kategori Ke - 33', 0, '0000-00-00 00:00:00'),
(141, 'Kategori Ke - 34', 0, '0000-00-00 00:00:00'),
(142, 'Kategori Ke - 35', 0, '0000-00-00 00:00:00'),
(143, 'Kategori Ke - 36', 0, '0000-00-00 00:00:00'),
(144, 'Kategori Ke - 37', 0, '0000-00-00 00:00:00'),
(145, 'Kategori Ke - 38', 0, '0000-00-00 00:00:00'),
(146, 'Kategori Ke - 39', 0, '0000-00-00 00:00:00'),
(147, 'Kategori Ke - 40', 0, '0000-00-00 00:00:00'),
(148, 'Kategori Ke - 41', 0, '0000-00-00 00:00:00'),
(149, 'Kategori Ke - 42', 0, '0000-00-00 00:00:00'),
(150, 'Kategori Ke - 43', 0, '0000-00-00 00:00:00'),
(151, 'Kategori Ke - 44', 0, '0000-00-00 00:00:00'),
(152, 'Kategori Ke - 45', 0, '0000-00-00 00:00:00'),
(153, 'Kategori Ke - 46', 0, '0000-00-00 00:00:00'),
(154, 'Kategori Ke - 47', 0, '0000-00-00 00:00:00'),
(155, 'Kategori Ke - 48', 0, '0000-00-00 00:00:00'),
(156, 'Kategori Ke - 49', 0, '0000-00-00 00:00:00'),
(157, 'Kategori Ke - 50', 0, '0000-00-00 00:00:00'),
(158, 'Kategori Ke - 51', 0, '0000-00-00 00:00:00'),
(159, 'Kategori Ke - 52', 0, '0000-00-00 00:00:00'),
(160, 'Kategori Ke - 53', 0, '0000-00-00 00:00:00'),
(161, 'Kategori Ke - 54', 0, '0000-00-00 00:00:00'),
(162, 'Kategori Ke - 55', 0, '0000-00-00 00:00:00'),
(163, 'Kategori Ke - 56', 0, '0000-00-00 00:00:00'),
(164, 'Kategori Ke - 57', 0, '0000-00-00 00:00:00'),
(165, 'Kategori Ke - 58', 0, '0000-00-00 00:00:00'),
(166, 'Kategori Ke - 59', 0, '0000-00-00 00:00:00'),
(167, 'Kategori Ke - 60', 0, '0000-00-00 00:00:00'),
(168, 'Kategori Ke - 61', 0, '0000-00-00 00:00:00'),
(169, 'Kategori Ke - 62', 0, '0000-00-00 00:00:00'),
(170, 'Kategori Ke - 63', 0, '0000-00-00 00:00:00'),
(171, 'Kategori Ke - 64', 0, '0000-00-00 00:00:00'),
(172, 'Kategori Ke - 65', 0, '0000-00-00 00:00:00'),
(173, 'Kategori Ke - 66', 0, '0000-00-00 00:00:00'),
(174, 'Kategori Ke - 67', 0, '0000-00-00 00:00:00'),
(175, 'Kategori Ke - 68', 0, '0000-00-00 00:00:00'),
(176, 'Kategori Ke - 69', 0, '0000-00-00 00:00:00'),
(177, 'Kategori Ke - 70', 0, '0000-00-00 00:00:00'),
(178, 'Kategori Ke - 71', 0, '0000-00-00 00:00:00'),
(179, 'Kategori Ke - 72', 0, '0000-00-00 00:00:00'),
(180, 'Kategori Ke - 73', 0, '0000-00-00 00:00:00'),
(181, 'Kategori Ke - 74', 0, '0000-00-00 00:00:00'),
(182, 'Kategori Ke - 75', 0, '0000-00-00 00:00:00'),
(183, 'Kategori Ke - 76', 0, '0000-00-00 00:00:00'),
(184, 'Kategori Ke - 77', 0, '0000-00-00 00:00:00'),
(185, 'Kategori Ke - 78', 0, '0000-00-00 00:00:00'),
(186, 'Kategori Ke - 79', 0, '0000-00-00 00:00:00'),
(187, 'Kategori Ke - 80', 0, '0000-00-00 00:00:00'),
(188, 'Kategori Ke - 81', 0, '0000-00-00 00:00:00'),
(189, 'Kategori Ke - 82', 0, '0000-00-00 00:00:00'),
(190, 'Kategori Ke - 83', 0, '0000-00-00 00:00:00'),
(191, 'Kategori Ke - 84', 0, '0000-00-00 00:00:00'),
(192, 'Kategori Ke - 85', 0, '0000-00-00 00:00:00'),
(193, 'Kategori Ke - 86', 0, '0000-00-00 00:00:00'),
(194, 'Kategori Ke - 87', 0, '0000-00-00 00:00:00'),
(195, 'Kategori Ke - 88', 0, '0000-00-00 00:00:00'),
(196, 'Kategori Ke - 89', 0, '0000-00-00 00:00:00'),
(197, 'Kategori Ke - 90', 0, '0000-00-00 00:00:00'),
(198, 'Kategori Ke - 91', 0, '0000-00-00 00:00:00'),
(199, 'Kategori Ke - 92', 0, '0000-00-00 00:00:00'),
(200, 'Kategori Ke - 93', 0, '0000-00-00 00:00:00'),
(201, 'Kategori Ke - 94', 0, '0000-00-00 00:00:00'),
(202, 'Kategori Ke - 95', 0, '0000-00-00 00:00:00'),
(203, 'Kategori Ke - 96', 0, '0000-00-00 00:00:00'),
(204, 'Kategori Ke - 97', 0, '0000-00-00 00:00:00'),
(205, 'Kategori Ke - 98', 0, '0000-00-00 00:00:00'),
(206, 'Kategori Ke - 99', 0, '0000-00-00 00:00:00'),
(207, 'Kategori Ke - 100', 0, '0000-00-00 00:00:00'),
(208, 'Kategori Ke - 101', 0, '0000-00-00 00:00:00'),
(209, 'Kategori Ke - 102', 0, '0000-00-00 00:00:00'),
(210, 'Kategori Ke - 103', 0, '0000-00-00 00:00:00'),
(211, 'Kategori Ke - 104', 0, '0000-00-00 00:00:00'),
(212, 'Kategori Ke - 105', 0, '0000-00-00 00:00:00'),
(213, 'Kategori Ke - 106', 0, '0000-00-00 00:00:00'),
(214, 'Kategori Ke - 107', 0, '0000-00-00 00:00:00'),
(215, 'Kategori Ke - 108', 0, '0000-00-00 00:00:00'),
(216, 'Kategori Ke - 109', 0, '0000-00-00 00:00:00'),
(217, 'Kategori Ke - 110', 0, '0000-00-00 00:00:00'),
(218, 'Kategori Ke - 111', 0, '0000-00-00 00:00:00'),
(219, 'Kategori Ke - 112', 0, '0000-00-00 00:00:00'),
(220, 'Kategori Ke - 113', 0, '0000-00-00 00:00:00'),
(221, 'Kategori Ke - 114', 0, '0000-00-00 00:00:00'),
(222, 'Kategori Ke - 115', 0, '0000-00-00 00:00:00'),
(223, 'Kategori Ke - 116', 0, '0000-00-00 00:00:00'),
(224, 'Kategori Ke - 117', 0, '0000-00-00 00:00:00'),
(225, 'Kategori Ke - 118', 0, '0000-00-00 00:00:00'),
(226, 'Kategori Ke - 119', 0, '0000-00-00 00:00:00'),
(227, 'Kategori Ke - 120', 0, '0000-00-00 00:00:00'),
(228, 'Kategori Ke - 121', 0, '0000-00-00 00:00:00'),
(229, 'Kategori Ke - 122', 0, '0000-00-00 00:00:00'),
(230, 'Kategori Ke - 123', 0, '0000-00-00 00:00:00'),
(231, 'Kategori Ke - 124', 0, '0000-00-00 00:00:00'),
(232, 'Kategori Ke - 125', 0, '0000-00-00 00:00:00'),
(233, 'Kategori Ke - 126', 0, '0000-00-00 00:00:00'),
(234, 'Kategori Ke - 127', 0, '0000-00-00 00:00:00'),
(235, 'Kategori Ke - 128', 0, '0000-00-00 00:00:00'),
(236, 'Kategori Ke - 129', 0, '0000-00-00 00:00:00'),
(237, 'Kategori Ke - 130', 0, '0000-00-00 00:00:00'),
(238, 'Kategori Ke - 131', 0, '0000-00-00 00:00:00'),
(239, 'Kategori Ke - 132', 0, '0000-00-00 00:00:00'),
(240, 'Kategori Ke - 133', 0, '0000-00-00 00:00:00'),
(241, 'Kategori Ke - 134', 0, '0000-00-00 00:00:00'),
(242, 'Kategori Ke - 135', 0, '0000-00-00 00:00:00'),
(243, 'Kategori Ke - 136', 0, '0000-00-00 00:00:00'),
(244, 'Kategori Ke - 137', 0, '0000-00-00 00:00:00'),
(245, 'Kategori Ke - 138', 0, '0000-00-00 00:00:00'),
(246, 'Kategori Ke - 139', 0, '0000-00-00 00:00:00'),
(247, 'Kategori Ke - 140', 0, '0000-00-00 00:00:00'),
(248, 'Kategori Ke - 141', 0, '0000-00-00 00:00:00'),
(249, 'Kategori Ke - 142', 0, '0000-00-00 00:00:00'),
(250, 'Kategori Ke - 143', 0, '0000-00-00 00:00:00'),
(251, 'Kategori Ke - 144', 0, '0000-00-00 00:00:00'),
(252, 'Kategori Ke - 145', 0, '0000-00-00 00:00:00'),
(253, 'Kategori Ke - 146', 0, '0000-00-00 00:00:00'),
(254, 'Kategori Ke - 147', 0, '0000-00-00 00:00:00'),
(255, 'Kategori Ke - 148', 0, '0000-00-00 00:00:00'),
(256, 'Kategori Ke - 149', 0, '0000-00-00 00:00:00'),
(257, 'Kategori Ke - 150', 0, '0000-00-00 00:00:00'),
(258, 'Kategori Ke - 151', 0, '0000-00-00 00:00:00'),
(259, 'Kategori Ke - 152', 0, '0000-00-00 00:00:00'),
(260, 'Kategori Ke - 153', 0, '0000-00-00 00:00:00'),
(261, 'Kategori Ke - 154', 0, '0000-00-00 00:00:00'),
(262, 'Kategori Ke - 155', 0, '0000-00-00 00:00:00'),
(263, 'Kategori Ke - 156', 0, '0000-00-00 00:00:00'),
(264, 'Kategori Ke - 157', 0, '0000-00-00 00:00:00'),
(265, 'Kategori Ke - 158', 0, '0000-00-00 00:00:00'),
(266, 'Kategori Ke - 159', 0, '0000-00-00 00:00:00'),
(267, 'Kategori Ke - 160', 0, '0000-00-00 00:00:00'),
(268, 'Kategori Ke - 161', 0, '0000-00-00 00:00:00'),
(269, 'Kategori Ke - 162', 0, '0000-00-00 00:00:00'),
(270, 'Kategori Ke - 163', 0, '0000-00-00 00:00:00'),
(271, 'Kategori Ke - 164', 0, '0000-00-00 00:00:00'),
(272, 'Kategori Ke - 165', 0, '0000-00-00 00:00:00'),
(273, 'Kategori Ke - 166', 0, '0000-00-00 00:00:00'),
(274, 'Kategori Ke - 167', 0, '0000-00-00 00:00:00'),
(275, 'Kategori Ke - 168', 0, '0000-00-00 00:00:00'),
(276, 'Kategori Ke - 169', 0, '0000-00-00 00:00:00'),
(277, 'Kategori Ke - 170', 0, '0000-00-00 00:00:00'),
(278, 'Kategori Ke - 171', 0, '0000-00-00 00:00:00'),
(279, 'Kategori Ke - 172', 0, '0000-00-00 00:00:00'),
(280, 'Kategori Ke - 173', 0, '0000-00-00 00:00:00'),
(281, 'Kategori Ke - 174', 0, '0000-00-00 00:00:00'),
(282, 'Kategori Ke - 175', 0, '0000-00-00 00:00:00'),
(283, 'Kategori Ke - 176', 0, '0000-00-00 00:00:00'),
(284, 'Kategori Ke - 177', 0, '0000-00-00 00:00:00'),
(285, 'Kategori Ke - 178', 0, '0000-00-00 00:00:00'),
(286, 'Kategori Ke - 179', 0, '0000-00-00 00:00:00'),
(287, 'Kategori Ke - 180', 0, '0000-00-00 00:00:00'),
(288, 'Kategori Ke - 181', 0, '0000-00-00 00:00:00'),
(289, 'Kategori Ke - 182', 0, '0000-00-00 00:00:00'),
(290, 'Kategori Ke - 183', 0, '0000-00-00 00:00:00'),
(291, 'Kategori Ke - 184', 0, '0000-00-00 00:00:00'),
(292, 'Kategori Ke - 185', 0, '0000-00-00 00:00:00'),
(293, 'Kategori Ke - 186', 0, '0000-00-00 00:00:00'),
(294, 'Kategori Ke - 187', 0, '0000-00-00 00:00:00'),
(295, 'Kategori Ke - 188', 0, '0000-00-00 00:00:00'),
(296, 'Kategori Ke - 189', 0, '0000-00-00 00:00:00'),
(297, 'Kategori Ke - 190', 0, '0000-00-00 00:00:00'),
(298, 'Kategori Ke - 191', 0, '0000-00-00 00:00:00'),
(299, 'Kategori Ke - 192', 0, '0000-00-00 00:00:00'),
(300, 'Kategori Ke - 193', 0, '0000-00-00 00:00:00'),
(301, 'Kategori Ke - 194', 0, '0000-00-00 00:00:00'),
(302, 'Kategori Ke - 195', 0, '0000-00-00 00:00:00'),
(303, 'Kategori Ke - 196', 0, '0000-00-00 00:00:00'),
(304, 'Kategori Ke - 197', 0, '0000-00-00 00:00:00'),
(305, 'Kategori Ke - 198', 0, '0000-00-00 00:00:00'),
(306, 'Kategori Ke - 199', 0, '0000-00-00 00:00:00'),
(307, 'Kategori Ke - 200', 0, '0000-00-00 00:00:00'),
(308, 'Kategori Ke - 201', 0, '0000-00-00 00:00:00'),
(309, 'Kategori Ke - 202', 0, '0000-00-00 00:00:00'),
(310, 'Kategori Ke - 203', 0, '0000-00-00 00:00:00'),
(311, 'Kategori Ke - 204', 0, '0000-00-00 00:00:00'),
(312, 'Kategori Ke - 205', 0, '0000-00-00 00:00:00'),
(313, 'Kategori Ke - 206', 0, '0000-00-00 00:00:00'),
(314, 'Kategori Ke - 207', 0, '0000-00-00 00:00:00'),
(315, 'Kategori Ke - 208', 0, '0000-00-00 00:00:00'),
(316, 'Kategori Ke - 209', 0, '0000-00-00 00:00:00'),
(317, 'Kategori Ke - 210', 0, '0000-00-00 00:00:00'),
(318, 'Kategori Ke - 211', 0, '0000-00-00 00:00:00'),
(319, 'Kategori Ke - 212', 0, '0000-00-00 00:00:00'),
(320, 'Kategori Ke - 213', 0, '0000-00-00 00:00:00'),
(321, 'Kategori Ke - 214', 0, '0000-00-00 00:00:00'),
(322, 'Kategori Ke - 215', 0, '0000-00-00 00:00:00'),
(323, 'Kategori Ke - 216', 0, '0000-00-00 00:00:00'),
(324, 'Kategori Ke - 217', 0, '0000-00-00 00:00:00'),
(325, 'Kategori Ke - 218', 0, '0000-00-00 00:00:00'),
(326, 'Kategori Ke - 219', 0, '0000-00-00 00:00:00'),
(327, 'Kategori Ke - 220', 0, '0000-00-00 00:00:00'),
(328, 'Kategori Ke - 221', 0, '0000-00-00 00:00:00'),
(329, 'Kategori Ke - 222', 0, '0000-00-00 00:00:00'),
(330, 'Kategori Ke - 223', 0, '0000-00-00 00:00:00'),
(331, 'Kategori Ke - 224', 0, '0000-00-00 00:00:00'),
(332, 'Kategori Ke - 225', 0, '0000-00-00 00:00:00'),
(333, 'Kategori Ke - 226', 0, '0000-00-00 00:00:00'),
(334, 'Kategori Ke - 227', 0, '0000-00-00 00:00:00'),
(335, 'Kategori Ke - 228', 0, '0000-00-00 00:00:00'),
(336, 'Kategori Ke - 229', 0, '0000-00-00 00:00:00'),
(337, 'Kategori Ke - 230', 0, '0000-00-00 00:00:00'),
(338, 'Kategori Ke - 231', 0, '0000-00-00 00:00:00'),
(339, 'Kategori Ke - 232', 0, '0000-00-00 00:00:00'),
(340, 'Kategori Ke - 233', 0, '0000-00-00 00:00:00'),
(341, 'Kategori Ke - 234', 0, '0000-00-00 00:00:00'),
(342, 'Kategori Ke - 235', 0, '0000-00-00 00:00:00'),
(343, 'Kategori Ke - 236', 0, '0000-00-00 00:00:00'),
(344, 'Kategori Ke - 237', 0, '0000-00-00 00:00:00'),
(345, 'Kategori Ke - 238', 0, '0000-00-00 00:00:00'),
(346, 'Kategori Ke - 239', 0, '0000-00-00 00:00:00'),
(347, 'Kategori Ke - 240', 0, '0000-00-00 00:00:00'),
(348, 'Kategori Ke - 241', 0, '0000-00-00 00:00:00'),
(349, 'Kategori Ke - 242', 0, '0000-00-00 00:00:00'),
(350, 'Kategori Ke - 243', 0, '0000-00-00 00:00:00'),
(351, 'Kategori Ke - 244', 0, '0000-00-00 00:00:00'),
(352, 'Kategori Ke - 245', 0, '0000-00-00 00:00:00'),
(353, 'Kategori Ke - 246', 0, '0000-00-00 00:00:00'),
(354, 'Kategori Ke - 247', 0, '0000-00-00 00:00:00'),
(355, 'Kategori Ke - 248', 0, '0000-00-00 00:00:00'),
(356, 'Kategori Ke - 249', 0, '0000-00-00 00:00:00'),
(357, 'Kategori Ke - 250', 0, '0000-00-00 00:00:00'),
(358, 'Kategori Ke - 251', 0, '0000-00-00 00:00:00'),
(359, 'Kategori Ke - 252', 0, '0000-00-00 00:00:00'),
(360, 'Kategori Ke - 253', 0, '0000-00-00 00:00:00'),
(361, 'Kategori Ke - 254', 0, '0000-00-00 00:00:00'),
(362, 'Kategori Ke - 255', 0, '0000-00-00 00:00:00'),
(363, 'Kategori Ke - 256', 0, '0000-00-00 00:00:00'),
(364, 'Kategori Ke - 257', 0, '0000-00-00 00:00:00'),
(365, 'Kategori Ke - 258', 0, '0000-00-00 00:00:00'),
(366, 'Kategori Ke - 259', 0, '0000-00-00 00:00:00'),
(367, 'Kategori Ke - 260', 0, '0000-00-00 00:00:00'),
(368, 'Kategori Ke - 261', 0, '0000-00-00 00:00:00'),
(369, 'Kategori Ke - 262', 0, '0000-00-00 00:00:00'),
(370, 'Kategori Ke - 263', 0, '0000-00-00 00:00:00'),
(371, 'Kategori Ke - 264', 0, '0000-00-00 00:00:00'),
(372, 'Kategori Ke - 265', 0, '0000-00-00 00:00:00'),
(373, 'Kategori Ke - 266', 0, '0000-00-00 00:00:00'),
(374, 'Kategori Ke - 267', 0, '0000-00-00 00:00:00'),
(375, 'Kategori Ke - 268', 0, '0000-00-00 00:00:00'),
(376, 'Kategori Ke - 269', 0, '0000-00-00 00:00:00'),
(377, 'Kategori Ke - 270', 0, '0000-00-00 00:00:00'),
(378, 'Kategori Ke - 271', 0, '0000-00-00 00:00:00'),
(379, 'Kategori Ke - 272', 0, '0000-00-00 00:00:00'),
(380, 'Kategori Ke - 273', 0, '0000-00-00 00:00:00'),
(381, 'Kategori Ke - 274', 0, '0000-00-00 00:00:00'),
(382, 'Kategori Ke - 275', 0, '0000-00-00 00:00:00'),
(383, 'Kategori Ke - 276', 0, '0000-00-00 00:00:00'),
(384, 'Kategori Ke - 277', 0, '0000-00-00 00:00:00'),
(385, 'Kategori Ke - 278', 0, '0000-00-00 00:00:00'),
(386, 'Kategori Ke - 279', 0, '0000-00-00 00:00:00'),
(387, 'Kategori Ke - 280', 0, '0000-00-00 00:00:00'),
(388, 'Kategori Ke - 281', 0, '0000-00-00 00:00:00'),
(389, 'Kategori Ke - 282', 0, '0000-00-00 00:00:00'),
(390, 'Kategori Ke - 283', 0, '0000-00-00 00:00:00'),
(391, 'Kategori Ke - 284', 0, '0000-00-00 00:00:00'),
(392, 'Kategori Ke - 285', 0, '0000-00-00 00:00:00'),
(393, 'Kategori Ke - 286', 0, '0000-00-00 00:00:00'),
(394, 'Kategori Ke - 287', 0, '0000-00-00 00:00:00'),
(395, 'Kategori Ke - 288', 0, '0000-00-00 00:00:00'),
(396, 'Kategori Ke - 289', 0, '0000-00-00 00:00:00'),
(397, 'Kategori Ke - 290', 0, '0000-00-00 00:00:00'),
(398, 'Kategori Ke - 291', 0, '0000-00-00 00:00:00'),
(399, 'Kategori Ke - 292', 0, '0000-00-00 00:00:00'),
(400, 'Kategori Ke - 293', 0, '0000-00-00 00:00:00'),
(401, 'Kategori Ke - 294', 0, '0000-00-00 00:00:00'),
(402, 'Kategori Ke - 295', 0, '0000-00-00 00:00:00'),
(403, 'Kategori Ke - 296', 0, '0000-00-00 00:00:00'),
(404, 'Kategori Ke - 297', 0, '0000-00-00 00:00:00'),
(405, 'Kategori Ke - 298', 0, '0000-00-00 00:00:00'),
(406, 'Kategori Ke - 299', 0, '0000-00-00 00:00:00'),
(407, 'Kategori Ke - 300', 0, '0000-00-00 00:00:00'),
(408, 'Kategori Ke - 301', 0, '0000-00-00 00:00:00'),
(409, 'Kategori Ke - 302', 0, '0000-00-00 00:00:00'),
(410, 'Kategori Ke - 303', 0, '0000-00-00 00:00:00'),
(411, 'Kategori Ke - 304', 0, '0000-00-00 00:00:00'),
(412, 'Kategori Ke - 305', 0, '0000-00-00 00:00:00'),
(413, 'Kategori Ke - 306', 0, '0000-00-00 00:00:00'),
(414, 'Kategori Ke - 307', 0, '0000-00-00 00:00:00'),
(415, 'Kategori Ke - 308', 0, '0000-00-00 00:00:00'),
(416, 'Kategori Ke - 309', 0, '0000-00-00 00:00:00'),
(417, 'Kategori Ke - 310', 0, '0000-00-00 00:00:00'),
(418, 'Kategori Ke - 311', 0, '0000-00-00 00:00:00'),
(419, 'Kategori Ke - 312', 0, '0000-00-00 00:00:00'),
(420, 'Kategori Ke - 313', 0, '0000-00-00 00:00:00'),
(421, 'Kategori Ke - 314', 0, '0000-00-00 00:00:00'),
(422, 'Kategori Ke - 315', 0, '0000-00-00 00:00:00'),
(423, 'Kategori Ke - 316', 0, '0000-00-00 00:00:00'),
(424, 'Kategori Ke - 317', 0, '0000-00-00 00:00:00'),
(425, 'Kategori Ke - 318', 0, '0000-00-00 00:00:00'),
(426, 'Kategori Ke - 319', 0, '0000-00-00 00:00:00'),
(427, 'Kategori Ke - 320', 0, '0000-00-00 00:00:00'),
(428, 'Kategori Ke - 321', 0, '0000-00-00 00:00:00'),
(429, 'Kategori Ke - 322', 0, '0000-00-00 00:00:00'),
(430, 'Kategori Ke - 323', 0, '0000-00-00 00:00:00'),
(431, 'Kategori Ke - 324', 0, '0000-00-00 00:00:00'),
(432, 'Kategori Ke - 325', 0, '0000-00-00 00:00:00'),
(433, 'Kategori Ke - 326', 0, '0000-00-00 00:00:00'),
(434, 'Kategori Ke - 327', 0, '0000-00-00 00:00:00'),
(435, 'Kategori Ke - 328', 0, '0000-00-00 00:00:00'),
(436, 'Kategori Ke - 329', 0, '0000-00-00 00:00:00'),
(437, 'Kategori Ke - 330', 0, '0000-00-00 00:00:00'),
(438, 'Kategori Ke - 331', 0, '0000-00-00 00:00:00'),
(439, 'Kategori Ke - 332', 0, '0000-00-00 00:00:00'),
(440, 'Kategori Ke - 333', 0, '0000-00-00 00:00:00'),
(441, 'Kategori Ke - 334', 0, '0000-00-00 00:00:00'),
(442, 'Kategori Ke - 335', 0, '0000-00-00 00:00:00'),
(443, 'Kategori Ke - 336', 0, '0000-00-00 00:00:00'),
(444, 'Kategori Ke - 337', 0, '0000-00-00 00:00:00'),
(445, 'Kategori Ke - 338', 0, '0000-00-00 00:00:00'),
(446, 'Kategori Ke - 339', 0, '0000-00-00 00:00:00'),
(447, 'Kategori Ke - 340', 0, '0000-00-00 00:00:00'),
(448, 'Kategori Ke - 341', 0, '0000-00-00 00:00:00'),
(449, 'Kategori Ke - 342', 0, '0000-00-00 00:00:00'),
(450, 'Kategori Ke - 343', 0, '0000-00-00 00:00:00'),
(451, 'Kategori Ke - 344', 0, '0000-00-00 00:00:00'),
(452, 'Kategori Ke - 345', 0, '0000-00-00 00:00:00'),
(453, 'Kategori Ke - 346', 0, '0000-00-00 00:00:00'),
(454, 'Kategori Ke - 347', 0, '0000-00-00 00:00:00'),
(455, 'Kategori Ke - 348', 0, '0000-00-00 00:00:00'),
(456, 'Kategori Ke - 349', 0, '0000-00-00 00:00:00'),
(457, 'Kategori Ke - 350', 0, '0000-00-00 00:00:00'),
(458, 'Kategori Ke - 351', 0, '0000-00-00 00:00:00'),
(459, 'Kategori Ke - 352', 0, '0000-00-00 00:00:00'),
(460, 'Kategori Ke - 353', 0, '0000-00-00 00:00:00'),
(461, 'Kategori Ke - 354', 0, '0000-00-00 00:00:00'),
(462, 'Kategori Ke - 355', 0, '0000-00-00 00:00:00'),
(463, 'Kategori Ke - 356', 0, '0000-00-00 00:00:00'),
(464, 'Kategori Ke - 357', 0, '0000-00-00 00:00:00'),
(465, 'Kategori Ke - 358', 0, '0000-00-00 00:00:00'),
(466, 'Kategori Ke - 359', 0, '0000-00-00 00:00:00'),
(467, 'Kategori Ke - 360', 0, '0000-00-00 00:00:00'),
(468, 'Kategori Ke - 361', 0, '0000-00-00 00:00:00'),
(469, 'Kategori Ke - 362', 0, '0000-00-00 00:00:00'),
(470, 'Kategori Ke - 363', 0, '0000-00-00 00:00:00'),
(471, 'Kategori Ke - 364', 0, '0000-00-00 00:00:00'),
(472, 'Kategori Ke - 365', 0, '0000-00-00 00:00:00'),
(473, 'Kategori Ke - 366', 0, '0000-00-00 00:00:00'),
(474, 'Kategori Ke - 367', 0, '0000-00-00 00:00:00'),
(475, 'Kategori Ke - 368', 0, '0000-00-00 00:00:00'),
(476, 'Kategori Ke - 369', 0, '0000-00-00 00:00:00'),
(477, 'Kategori Ke - 370', 0, '0000-00-00 00:00:00'),
(478, 'Kategori Ke - 371', 0, '0000-00-00 00:00:00'),
(479, 'Kategori Ke - 372', 0, '0000-00-00 00:00:00'),
(480, 'Kategori Ke - 373', 0, '0000-00-00 00:00:00'),
(481, 'Kategori Ke - 374', 0, '0000-00-00 00:00:00'),
(482, 'Kategori Ke - 375', 0, '0000-00-00 00:00:00'),
(483, 'Kategori Ke - 376', 0, '0000-00-00 00:00:00'),
(484, 'Kategori Ke - 377', 0, '0000-00-00 00:00:00'),
(485, 'Kategori Ke - 378', 0, '0000-00-00 00:00:00'),
(486, 'Kategori Ke - 379', 0, '0000-00-00 00:00:00'),
(487, 'Kategori Ke - 380', 0, '0000-00-00 00:00:00'),
(488, 'Kategori Ke - 381', 0, '0000-00-00 00:00:00'),
(489, 'Kategori Ke - 382', 0, '0000-00-00 00:00:00'),
(490, 'Kategori Ke - 383', 0, '0000-00-00 00:00:00'),
(491, 'Kategori Ke - 384', 0, '0000-00-00 00:00:00'),
(492, 'Kategori Ke - 385', 0, '0000-00-00 00:00:00'),
(493, 'Kategori Ke - 386', 0, '0000-00-00 00:00:00'),
(494, 'Kategori Ke - 387', 0, '0000-00-00 00:00:00'),
(495, 'Kategori Ke - 388', 0, '0000-00-00 00:00:00'),
(496, 'Kategori Ke - 389', 0, '0000-00-00 00:00:00'),
(497, 'Kategori Ke - 390', 0, '0000-00-00 00:00:00'),
(498, 'Kategori Ke - 391', 0, '0000-00-00 00:00:00'),
(499, 'Kategori Ke - 392', 0, '0000-00-00 00:00:00'),
(500, 'Kategori Ke - 393', 0, '0000-00-00 00:00:00'),
(501, 'Kategori Ke - 394', 0, '0000-00-00 00:00:00'),
(502, 'Kategori Ke - 395', 0, '0000-00-00 00:00:00'),
(503, 'Kategori Ke - 396', 0, '0000-00-00 00:00:00'),
(504, 'Kategori Ke - 397', 0, '0000-00-00 00:00:00'),
(505, 'Kategori Ke - 398', 0, '0000-00-00 00:00:00'),
(506, 'Kategori Ke - 399', 0, '0000-00-00 00:00:00'),
(507, 'Kategori Ke - 400', 0, '0000-00-00 00:00:00'),
(508, 'Kategori Ke - 401', 0, '0000-00-00 00:00:00'),
(509, 'Kategori Ke - 402', 0, '0000-00-00 00:00:00'),
(510, 'Kategori Ke - 403', 0, '0000-00-00 00:00:00'),
(511, 'Kategori Ke - 404', 0, '0000-00-00 00:00:00'),
(512, 'Kategori Ke - 405', 0, '0000-00-00 00:00:00'),
(513, 'Kategori Ke - 406', 0, '0000-00-00 00:00:00'),
(514, 'Kategori Ke - 407', 0, '0000-00-00 00:00:00'),
(515, 'Kategori Ke - 408', 0, '0000-00-00 00:00:00'),
(516, 'Kategori Ke - 409', 0, '0000-00-00 00:00:00'),
(517, 'Kategori Ke - 410', 0, '0000-00-00 00:00:00'),
(518, 'Kategori Ke - 411', 0, '0000-00-00 00:00:00'),
(519, 'Kategori Ke - 412', 0, '0000-00-00 00:00:00'),
(520, 'Kategori Ke - 413', 0, '0000-00-00 00:00:00'),
(521, 'Kategori Ke - 414', 0, '0000-00-00 00:00:00'),
(522, 'Kategori Ke - 415', 0, '0000-00-00 00:00:00'),
(523, 'Kategori Ke - 416', 0, '0000-00-00 00:00:00'),
(524, 'Kategori Ke - 417', 0, '0000-00-00 00:00:00'),
(525, 'Kategori Ke - 418', 0, '0000-00-00 00:00:00'),
(526, 'Kategori Ke - 419', 0, '0000-00-00 00:00:00'),
(527, 'Kategori Ke - 420', 0, '0000-00-00 00:00:00'),
(528, 'Kategori Ke - 421', 0, '0000-00-00 00:00:00'),
(529, 'Kategori Ke - 422', 0, '0000-00-00 00:00:00'),
(530, 'Kategori Ke - 423', 0, '0000-00-00 00:00:00'),
(531, 'Kategori Ke - 424', 0, '0000-00-00 00:00:00'),
(532, 'Kategori Ke - 425', 0, '0000-00-00 00:00:00'),
(533, 'Kategori Ke - 426', 0, '0000-00-00 00:00:00'),
(534, 'Kategori Ke - 427', 0, '0000-00-00 00:00:00'),
(535, 'Kategori Ke - 428', 0, '0000-00-00 00:00:00'),
(536, 'Kategori Ke - 429', 0, '0000-00-00 00:00:00'),
(537, 'Kategori Ke - 430', 0, '0000-00-00 00:00:00'),
(538, 'Kategori Ke - 431', 0, '0000-00-00 00:00:00'),
(539, 'Kategori Ke - 432', 0, '0000-00-00 00:00:00'),
(540, 'Kategori Ke - 433', 0, '0000-00-00 00:00:00'),
(541, 'Kategori Ke - 434', 0, '0000-00-00 00:00:00'),
(542, 'Kategori Ke - 435', 0, '0000-00-00 00:00:00'),
(543, 'Kategori Ke - 436', 0, '0000-00-00 00:00:00'),
(544, 'Kategori Ke - 437', 0, '0000-00-00 00:00:00'),
(545, 'Kategori Ke - 438', 0, '0000-00-00 00:00:00'),
(546, 'Kategori Ke - 439', 0, '0000-00-00 00:00:00'),
(547, 'Kategori Ke - 440', 0, '0000-00-00 00:00:00'),
(548, 'Kategori Ke - 441', 0, '0000-00-00 00:00:00'),
(549, 'Kategori Ke - 442', 0, '0000-00-00 00:00:00'),
(550, 'Kategori Ke - 443', 0, '0000-00-00 00:00:00'),
(551, 'Kategori Ke - 444', 0, '0000-00-00 00:00:00'),
(552, 'Kategori Ke - 445', 0, '0000-00-00 00:00:00'),
(553, 'Kategori Ke - 446', 0, '0000-00-00 00:00:00'),
(554, 'Kategori Ke - 447', 0, '0000-00-00 00:00:00'),
(555, 'Kategori Ke - 448', 0, '0000-00-00 00:00:00'),
(556, 'Kategori Ke - 449', 0, '0000-00-00 00:00:00'),
(557, 'Kategori Ke - 450', 0, '0000-00-00 00:00:00'),
(558, 'Kategori Ke - 451', 0, '0000-00-00 00:00:00'),
(559, 'Kategori Ke - 452', 0, '0000-00-00 00:00:00'),
(560, 'Kategori Ke - 453', 0, '0000-00-00 00:00:00'),
(561, 'Kategori Ke - 454', 0, '0000-00-00 00:00:00'),
(562, 'Kategori Ke - 455', 0, '0000-00-00 00:00:00'),
(563, 'Kategori Ke - 456', 0, '0000-00-00 00:00:00'),
(564, 'Kategori Ke - 457', 0, '0000-00-00 00:00:00'),
(565, 'Kategori Ke - 458', 0, '0000-00-00 00:00:00'),
(566, 'Kategori Ke - 459', 0, '0000-00-00 00:00:00'),
(567, 'Kategori Ke - 460', 0, '0000-00-00 00:00:00'),
(568, 'Kategori Ke - 461', 0, '0000-00-00 00:00:00'),
(569, 'Kategori Ke - 462', 0, '0000-00-00 00:00:00'),
(570, 'Kategori Ke - 463', 0, '0000-00-00 00:00:00'),
(571, 'Kategori Ke - 464', 0, '0000-00-00 00:00:00'),
(572, 'Kategori Ke - 465', 0, '0000-00-00 00:00:00'),
(573, 'Kategori Ke - 466', 0, '0000-00-00 00:00:00'),
(574, 'Kategori Ke - 467', 0, '0000-00-00 00:00:00'),
(575, 'Kategori Ke - 468', 0, '0000-00-00 00:00:00'),
(576, 'Kategori Ke - 469', 0, '0000-00-00 00:00:00'),
(577, 'Kategori Ke - 470', 0, '0000-00-00 00:00:00'),
(578, 'Kategori Ke - 471', 0, '0000-00-00 00:00:00'),
(579, 'Kategori Ke - 472', 0, '0000-00-00 00:00:00'),
(580, 'Kategori Ke - 473', 0, '0000-00-00 00:00:00'),
(581, 'Kategori Ke - 474', 0, '0000-00-00 00:00:00'),
(582, 'Kategori Ke - 475', 0, '0000-00-00 00:00:00'),
(583, 'Kategori Ke - 476', 0, '0000-00-00 00:00:00'),
(584, 'Kategori Ke - 477', 0, '0000-00-00 00:00:00'),
(585, 'Kategori Ke - 478', 0, '0000-00-00 00:00:00'),
(586, 'Kategori Ke - 479', 0, '0000-00-00 00:00:00'),
(587, 'Kategori Ke - 480', 0, '0000-00-00 00:00:00'),
(588, 'Kategori Ke - 481', 0, '0000-00-00 00:00:00'),
(589, 'Kategori Ke - 482', 0, '0000-00-00 00:00:00'),
(590, 'Kategori Ke - 483', 0, '0000-00-00 00:00:00'),
(591, 'Kategori Ke - 484', 0, '0000-00-00 00:00:00'),
(592, 'Kategori Ke - 485', 0, '0000-00-00 00:00:00'),
(593, 'Kategori Ke - 486', 0, '0000-00-00 00:00:00'),
(594, 'Kategori Ke - 487', 0, '0000-00-00 00:00:00'),
(595, 'Kategori Ke - 488', 0, '0000-00-00 00:00:00'),
(596, 'Kategori Ke - 489', 0, '0000-00-00 00:00:00'),
(597, 'Kategori Ke - 490', 0, '0000-00-00 00:00:00'),
(598, 'Kategori Ke - 491', 0, '0000-00-00 00:00:00'),
(599, 'Kategori Ke - 492', 0, '0000-00-00 00:00:00'),
(600, 'Kategori Ke - 493', 0, '0000-00-00 00:00:00'),
(601, 'Kategori Ke - 494', 0, '0000-00-00 00:00:00'),
(602, 'Kategori Ke - 495', 0, '0000-00-00 00:00:00'),
(603, 'Kategori Ke - 496', 0, '0000-00-00 00:00:00'),
(604, 'Kategori Ke - 497', 0, '0000-00-00 00:00:00'),
(605, 'Kategori Ke - 498', 0, '0000-00-00 00:00:00'),
(606, 'Kategori Ke - 499', 0, '0000-00-00 00:00:00'),
(607, 'Kategori Ke - 500', 0, '0000-00-00 00:00:00'),
(608, 'Kategori Ke - 501', 0, '0000-00-00 00:00:00'),
(609, 'Kategori Ke - 502', 0, '0000-00-00 00:00:00'),
(610, 'Kategori Ke - 503', 0, '0000-00-00 00:00:00'),
(611, 'Kategori Ke - 504', 0, '0000-00-00 00:00:00'),
(612, 'Kategori Ke - 505', 0, '0000-00-00 00:00:00'),
(613, 'Kategori Ke - 506', 0, '0000-00-00 00:00:00'),
(614, 'Kategori Ke - 507', 0, '0000-00-00 00:00:00'),
(615, 'Kategori Ke - 508', 0, '0000-00-00 00:00:00'),
(616, 'Kategori Ke - 509', 0, '0000-00-00 00:00:00'),
(617, 'Kategori Ke - 510', 0, '0000-00-00 00:00:00'),
(618, 'Kategori Ke - 511', 0, '0000-00-00 00:00:00'),
(619, 'Kategori Ke - 512', 0, '0000-00-00 00:00:00'),
(620, 'Kategori Ke - 513', 0, '0000-00-00 00:00:00'),
(621, 'Kategori Ke - 514', 0, '0000-00-00 00:00:00'),
(622, 'Kategori Ke - 515', 0, '0000-00-00 00:00:00'),
(623, 'Kategori Ke - 516', 0, '0000-00-00 00:00:00'),
(624, 'Kategori Ke - 517', 0, '0000-00-00 00:00:00'),
(625, 'Kategori Ke - 518', 0, '0000-00-00 00:00:00'),
(626, 'Kategori Ke - 519', 0, '0000-00-00 00:00:00'),
(627, 'Kategori Ke - 520', 0, '0000-00-00 00:00:00'),
(628, 'Kategori Ke - 521', 0, '0000-00-00 00:00:00'),
(629, 'Kategori Ke - 522', 0, '0000-00-00 00:00:00'),
(630, 'Kategori Ke - 523', 0, '0000-00-00 00:00:00'),
(631, 'Kategori Ke - 524', 0, '0000-00-00 00:00:00'),
(632, 'Kategori Ke - 525', 0, '0000-00-00 00:00:00'),
(633, 'Kategori Ke - 526', 0, '0000-00-00 00:00:00'),
(634, 'Kategori Ke - 527', 0, '0000-00-00 00:00:00'),
(635, 'Kategori Ke - 528', 0, '0000-00-00 00:00:00'),
(636, 'Kategori Ke - 529', 0, '0000-00-00 00:00:00'),
(637, 'Kategori Ke - 530', 0, '0000-00-00 00:00:00'),
(638, 'Kategori Ke - 531', 0, '0000-00-00 00:00:00'),
(639, 'Kategori Ke - 532', 0, '0000-00-00 00:00:00'),
(640, 'Kategori Ke - 533', 0, '0000-00-00 00:00:00'),
(641, 'Kategori Ke - 534', 0, '0000-00-00 00:00:00'),
(642, 'Kategori Ke - 535', 0, '0000-00-00 00:00:00'),
(643, 'Kategori Ke - 536', 0, '0000-00-00 00:00:00'),
(644, 'Kategori Ke - 537', 0, '0000-00-00 00:00:00'),
(645, 'Kategori Ke - 538', 0, '0000-00-00 00:00:00'),
(646, 'Kategori Ke - 539', 0, '0000-00-00 00:00:00'),
(647, 'Kategori Ke - 540', 0, '0000-00-00 00:00:00'),
(648, 'Kategori Ke - 541', 0, '0000-00-00 00:00:00'),
(649, 'Kategori Ke - 542', 0, '0000-00-00 00:00:00'),
(650, 'Kategori Ke - 543', 0, '0000-00-00 00:00:00'),
(651, 'Kategori Ke - 544', 0, '0000-00-00 00:00:00'),
(652, 'Kategori Ke - 545', 0, '0000-00-00 00:00:00'),
(653, 'Kategori Ke - 546', 0, '0000-00-00 00:00:00'),
(654, 'Kategori Ke - 547', 0, '0000-00-00 00:00:00'),
(655, 'Kategori Ke - 548', 0, '0000-00-00 00:00:00'),
(656, 'Kategori Ke - 549', 0, '0000-00-00 00:00:00'),
(657, 'Kategori Ke - 550', 0, '0000-00-00 00:00:00'),
(658, 'Kategori Ke - 551', 0, '0000-00-00 00:00:00'),
(659, 'Kategori Ke - 552', 0, '0000-00-00 00:00:00'),
(660, 'Kategori Ke - 553', 0, '0000-00-00 00:00:00'),
(661, 'Kategori Ke - 554', 0, '0000-00-00 00:00:00'),
(662, 'Kategori Ke - 555', 0, '0000-00-00 00:00:00'),
(663, 'Kategori Ke - 556', 0, '0000-00-00 00:00:00'),
(664, 'Kategori Ke - 557', 0, '0000-00-00 00:00:00'),
(665, 'Kategori Ke - 558', 0, '0000-00-00 00:00:00'),
(666, 'Kategori Ke - 559', 0, '0000-00-00 00:00:00'),
(667, 'Kategori Ke - 560', 0, '0000-00-00 00:00:00'),
(668, 'Kategori Ke - 561', 0, '0000-00-00 00:00:00'),
(669, 'Kategori Ke - 562', 0, '0000-00-00 00:00:00'),
(670, 'Kategori Ke - 563', 0, '0000-00-00 00:00:00'),
(671, 'Kategori Ke - 564', 0, '0000-00-00 00:00:00'),
(672, 'Kategori Ke - 565', 0, '0000-00-00 00:00:00'),
(673, 'Kategori Ke - 566', 0, '0000-00-00 00:00:00'),
(674, 'Kategori Ke - 567', 0, '0000-00-00 00:00:00'),
(675, 'Kategori Ke - 568', 0, '0000-00-00 00:00:00'),
(676, 'Kategori Ke - 569', 0, '0000-00-00 00:00:00'),
(677, 'Kategori Ke - 570', 0, '0000-00-00 00:00:00'),
(678, 'Kategori Ke - 571', 0, '0000-00-00 00:00:00'),
(679, 'Kategori Ke - 572', 0, '0000-00-00 00:00:00'),
(680, 'Kategori Ke - 573', 0, '0000-00-00 00:00:00'),
(681, 'Kategori Ke - 574', 0, '0000-00-00 00:00:00'),
(682, 'Kategori Ke - 575', 0, '0000-00-00 00:00:00'),
(683, 'Kategori Ke - 576', 0, '0000-00-00 00:00:00'),
(684, 'Kategori Ke - 577', 0, '0000-00-00 00:00:00'),
(685, 'Kategori Ke - 578', 0, '0000-00-00 00:00:00'),
(686, 'Kategori Ke - 579', 0, '0000-00-00 00:00:00'),
(687, 'Kategori Ke - 580', 0, '0000-00-00 00:00:00'),
(688, 'Kategori Ke - 581', 0, '0000-00-00 00:00:00'),
(689, 'Kategori Ke - 582', 0, '0000-00-00 00:00:00'),
(690, 'Kategori Ke - 583', 0, '0000-00-00 00:00:00'),
(691, 'Kategori Ke - 584', 0, '0000-00-00 00:00:00'),
(692, 'Kategori Ke - 585', 0, '0000-00-00 00:00:00'),
(693, 'Kategori Ke - 586', 0, '0000-00-00 00:00:00'),
(694, 'Kategori Ke - 587', 0, '0000-00-00 00:00:00'),
(695, 'Kategori Ke - 588', 0, '0000-00-00 00:00:00'),
(696, 'Kategori Ke - 589', 0, '0000-00-00 00:00:00'),
(697, 'Kategori Ke - 590', 0, '0000-00-00 00:00:00'),
(698, 'Kategori Ke - 591', 0, '0000-00-00 00:00:00'),
(699, 'Kategori Ke - 592', 0, '0000-00-00 00:00:00'),
(700, 'Kategori Ke - 593', 0, '0000-00-00 00:00:00'),
(701, 'Kategori Ke - 594', 0, '0000-00-00 00:00:00'),
(702, 'Kategori Ke - 595', 0, '0000-00-00 00:00:00'),
(703, 'Kategori Ke - 596', 0, '0000-00-00 00:00:00'),
(704, 'Kategori Ke - 597', 0, '0000-00-00 00:00:00'),
(705, 'Kategori Ke - 598', 0, '0000-00-00 00:00:00'),
(706, 'Kategori Ke - 599', 0, '0000-00-00 00:00:00'),
(707, 'Kategori Ke - 600', 0, '0000-00-00 00:00:00'),
(708, 'Kategori Ke - 601', 0, '0000-00-00 00:00:00'),
(709, 'Kategori Ke - 602', 0, '0000-00-00 00:00:00'),
(710, 'Kategori Ke - 603', 0, '0000-00-00 00:00:00'),
(711, 'Kategori Ke - 604', 0, '0000-00-00 00:00:00'),
(712, 'Kategori Ke - 605', 0, '0000-00-00 00:00:00'),
(713, 'Kategori Ke - 606', 0, '0000-00-00 00:00:00'),
(714, 'Kategori Ke - 607', 0, '0000-00-00 00:00:00'),
(715, 'Kategori Ke - 608', 0, '0000-00-00 00:00:00'),
(716, 'Kategori Ke - 609', 0, '0000-00-00 00:00:00'),
(717, 'Kategori Ke - 610', 0, '0000-00-00 00:00:00'),
(718, 'Kategori Ke - 611', 0, '0000-00-00 00:00:00'),
(719, 'Kategori Ke - 612', 0, '0000-00-00 00:00:00'),
(720, 'Kategori Ke - 613', 0, '0000-00-00 00:00:00'),
(721, 'Kategori Ke - 614', 0, '0000-00-00 00:00:00'),
(722, 'Kategori Ke - 615', 0, '0000-00-00 00:00:00'),
(723, 'Kategori Ke - 616', 0, '0000-00-00 00:00:00'),
(724, 'Kategori Ke - 617', 0, '0000-00-00 00:00:00'),
(725, 'Kategori Ke - 618', 0, '0000-00-00 00:00:00'),
(726, 'Kategori Ke - 619', 0, '0000-00-00 00:00:00'),
(727, 'Kategori Ke - 620', 0, '0000-00-00 00:00:00'),
(728, 'Kategori Ke - 621', 0, '0000-00-00 00:00:00'),
(729, 'Kategori Ke - 622', 0, '0000-00-00 00:00:00'),
(730, 'Kategori Ke - 623', 0, '0000-00-00 00:00:00'),
(731, 'Kategori Ke - 624', 0, '0000-00-00 00:00:00'),
(732, 'Kategori Ke - 625', 0, '0000-00-00 00:00:00'),
(733, 'Kategori Ke - 626', 0, '0000-00-00 00:00:00'),
(734, 'Kategori Ke - 627', 0, '0000-00-00 00:00:00'),
(735, 'Kategori Ke - 628', 0, '0000-00-00 00:00:00'),
(736, 'Kategori Ke - 629', 0, '0000-00-00 00:00:00'),
(737, 'Kategori Ke - 630', 0, '0000-00-00 00:00:00'),
(738, 'Kategori Ke - 631', 0, '0000-00-00 00:00:00'),
(739, 'Kategori Ke - 632', 0, '0000-00-00 00:00:00'),
(740, 'Kategori Ke - 633', 0, '0000-00-00 00:00:00'),
(741, 'Kategori Ke - 634', 0, '0000-00-00 00:00:00'),
(742, 'Kategori Ke - 635', 0, '0000-00-00 00:00:00'),
(743, 'Kategori Ke - 636', 0, '0000-00-00 00:00:00'),
(744, 'Kategori Ke - 637', 0, '0000-00-00 00:00:00'),
(745, 'Kategori Ke - 638', 0, '0000-00-00 00:00:00'),
(746, 'Kategori Ke - 639', 0, '0000-00-00 00:00:00'),
(747, 'Kategori Ke - 640', 0, '0000-00-00 00:00:00'),
(748, 'Kategori Ke - 641', 0, '0000-00-00 00:00:00'),
(749, 'Kategori Ke - 642', 0, '0000-00-00 00:00:00'),
(750, 'Kategori Ke - 643', 0, '0000-00-00 00:00:00'),
(751, 'Kategori Ke - 644', 0, '0000-00-00 00:00:00'),
(752, 'Kategori Ke - 645', 0, '0000-00-00 00:00:00'),
(753, 'Kategori Ke - 646', 0, '0000-00-00 00:00:00'),
(754, 'Kategori Ke - 647', 0, '0000-00-00 00:00:00'),
(755, 'Kategori Ke - 648', 0, '0000-00-00 00:00:00'),
(756, 'Kategori Ke - 649', 0, '0000-00-00 00:00:00'),
(757, 'Kategori Ke - 650', 0, '0000-00-00 00:00:00'),
(758, 'Kategori Ke - 651', 0, '0000-00-00 00:00:00'),
(759, 'Kategori Ke - 652', 0, '0000-00-00 00:00:00'),
(760, 'Kategori Ke - 653', 0, '0000-00-00 00:00:00'),
(761, 'Kategori Ke - 654', 0, '0000-00-00 00:00:00'),
(762, 'Kategori Ke - 655', 0, '0000-00-00 00:00:00'),
(763, 'Kategori Ke - 656', 0, '0000-00-00 00:00:00'),
(764, 'Kategori Ke - 657', 0, '0000-00-00 00:00:00'),
(765, 'Kategori Ke - 658', 0, '0000-00-00 00:00:00'),
(766, 'Kategori Ke - 659', 0, '0000-00-00 00:00:00'),
(767, 'Kategori Ke - 660', 0, '0000-00-00 00:00:00'),
(768, 'Kategori Ke - 661', 0, '0000-00-00 00:00:00'),
(769, 'Kategori Ke - 662', 0, '0000-00-00 00:00:00'),
(770, 'Kategori Ke - 663', 0, '0000-00-00 00:00:00'),
(771, 'Kategori Ke - 664', 0, '0000-00-00 00:00:00'),
(772, 'Kategori Ke - 665', 0, '0000-00-00 00:00:00'),
(773, 'Kategori Ke - 666', 0, '0000-00-00 00:00:00'),
(774, 'Kategori Ke - 667', 0, '0000-00-00 00:00:00'),
(775, 'Kategori Ke - 668', 0, '0000-00-00 00:00:00'),
(776, 'Kategori Ke - 669', 0, '0000-00-00 00:00:00'),
(777, 'Kategori Ke - 670', 0, '0000-00-00 00:00:00'),
(778, 'Kategori Ke - 671', 0, '0000-00-00 00:00:00'),
(779, 'Kategori Ke - 672', 0, '0000-00-00 00:00:00'),
(780, 'Kategori Ke - 673', 0, '0000-00-00 00:00:00'),
(781, 'Kategori Ke - 674', 0, '0000-00-00 00:00:00'),
(782, 'Kategori Ke - 675', 0, '0000-00-00 00:00:00'),
(783, 'Kategori Ke - 676', 0, '0000-00-00 00:00:00'),
(784, 'Kategori Ke - 677', 0, '0000-00-00 00:00:00'),
(785, 'Kategori Ke - 678', 0, '0000-00-00 00:00:00'),
(786, 'Kategori Ke - 679', 0, '0000-00-00 00:00:00'),
(787, 'Kategori Ke - 680', 0, '0000-00-00 00:00:00'),
(788, 'Kategori Ke - 681', 0, '0000-00-00 00:00:00'),
(789, 'Kategori Ke - 682', 0, '0000-00-00 00:00:00'),
(790, 'Kategori Ke - 683', 0, '0000-00-00 00:00:00'),
(791, 'Kategori Ke - 684', 0, '0000-00-00 00:00:00'),
(792, 'Kategori Ke - 685', 0, '0000-00-00 00:00:00'),
(793, 'Kategori Ke - 686', 0, '0000-00-00 00:00:00'),
(794, 'Kategori Ke - 687', 0, '0000-00-00 00:00:00'),
(795, 'Kategori Ke - 688', 0, '0000-00-00 00:00:00'),
(796, 'Kategori Ke - 689', 0, '0000-00-00 00:00:00'),
(797, 'Kategori Ke - 690', 0, '0000-00-00 00:00:00'),
(798, 'Kategori Ke - 691', 0, '0000-00-00 00:00:00'),
(799, 'Kategori Ke - 692', 0, '0000-00-00 00:00:00'),
(800, 'Kategori Ke - 693', 0, '0000-00-00 00:00:00'),
(801, 'Kategori Ke - 694', 0, '0000-00-00 00:00:00'),
(802, 'Kategori Ke - 695', 0, '0000-00-00 00:00:00'),
(803, 'Kategori Ke - 696', 0, '0000-00-00 00:00:00'),
(804, 'Kategori Ke - 697', 0, '0000-00-00 00:00:00'),
(805, 'Kategori Ke - 698', 0, '0000-00-00 00:00:00'),
(806, 'Kategori Ke - 699', 0, '0000-00-00 00:00:00'),
(807, 'Kategori Ke - 700', 0, '0000-00-00 00:00:00'),
(808, 'Kategori Ke - 701', 0, '0000-00-00 00:00:00'),
(809, 'Kategori Ke - 702', 0, '0000-00-00 00:00:00'),
(810, 'Kategori Ke - 703', 0, '0000-00-00 00:00:00'),
(811, 'Kategori Ke - 704', 0, '0000-00-00 00:00:00'),
(812, 'Kategori Ke - 705', 0, '0000-00-00 00:00:00'),
(813, 'Kategori Ke - 706', 0, '0000-00-00 00:00:00'),
(814, 'Kategori Ke - 707', 0, '0000-00-00 00:00:00'),
(815, 'Kategori Ke - 708', 0, '0000-00-00 00:00:00'),
(816, 'Kategori Ke - 709', 0, '0000-00-00 00:00:00'),
(817, 'Kategori Ke - 710', 0, '0000-00-00 00:00:00'),
(818, 'Kategori Ke - 711', 0, '0000-00-00 00:00:00'),
(819, 'Kategori Ke - 712', 0, '0000-00-00 00:00:00'),
(820, 'Kategori Ke - 713', 0, '0000-00-00 00:00:00'),
(821, 'Kategori Ke - 714', 0, '0000-00-00 00:00:00'),
(822, 'Kategori Ke - 715', 0, '0000-00-00 00:00:00'),
(823, 'Kategori Ke - 716', 0, '0000-00-00 00:00:00'),
(824, 'Kategori Ke - 717', 0, '0000-00-00 00:00:00'),
(825, 'Kategori Ke - 718', 0, '0000-00-00 00:00:00'),
(826, 'Kategori Ke - 719', 0, '0000-00-00 00:00:00'),
(827, 'Kategori Ke - 720', 0, '0000-00-00 00:00:00'),
(828, 'Kategori Ke - 721', 0, '0000-00-00 00:00:00'),
(829, 'Kategori Ke - 722', 0, '0000-00-00 00:00:00'),
(830, 'Kategori Ke - 723', 0, '0000-00-00 00:00:00'),
(831, 'Kategori Ke - 724', 0, '0000-00-00 00:00:00'),
(832, 'Kategori Ke - 725', 0, '0000-00-00 00:00:00'),
(833, 'Kategori Ke - 726', 0, '0000-00-00 00:00:00'),
(834, 'Kategori Ke - 727', 0, '0000-00-00 00:00:00'),
(835, 'Kategori Ke - 728', 0, '0000-00-00 00:00:00'),
(836, 'Kategori Ke - 729', 0, '0000-00-00 00:00:00'),
(837, 'Kategori Ke - 730', 0, '0000-00-00 00:00:00'),
(838, 'Kategori Ke - 731', 0, '0000-00-00 00:00:00'),
(839, 'Kategori Ke - 732', 0, '0000-00-00 00:00:00'),
(840, 'Kategori Ke - 733', 0, '0000-00-00 00:00:00'),
(841, 'Kategori Ke - 734', 0, '0000-00-00 00:00:00'),
(842, 'Kategori Ke - 735', 0, '0000-00-00 00:00:00'),
(843, 'Kategori Ke - 736', 0, '0000-00-00 00:00:00'),
(844, 'Kategori Ke - 737', 0, '0000-00-00 00:00:00'),
(845, 'Kategori Ke - 738', 0, '0000-00-00 00:00:00'),
(846, 'Kategori Ke - 739', 0, '0000-00-00 00:00:00'),
(847, 'Kategori Ke - 740', 0, '0000-00-00 00:00:00'),
(848, 'Kategori Ke - 741', 0, '0000-00-00 00:00:00'),
(849, 'Kategori Ke - 742', 0, '0000-00-00 00:00:00'),
(850, 'Kategori Ke - 743', 0, '0000-00-00 00:00:00'),
(851, 'Kategori Ke - 744', 0, '0000-00-00 00:00:00'),
(852, 'Kategori Ke - 745', 0, '0000-00-00 00:00:00'),
(853, 'Kategori Ke - 746', 0, '0000-00-00 00:00:00'),
(854, 'Kategori Ke - 747', 0, '0000-00-00 00:00:00'),
(855, 'Kategori Ke - 748', 0, '0000-00-00 00:00:00'),
(856, 'Kategori Ke - 749', 0, '0000-00-00 00:00:00'),
(857, 'Kategori Ke - 750', 0, '0000-00-00 00:00:00'),
(858, 'Kategori Ke - 751', 0, '0000-00-00 00:00:00'),
(859, 'Kategori Ke - 752', 0, '0000-00-00 00:00:00'),
(860, 'Kategori Ke - 753', 0, '0000-00-00 00:00:00'),
(861, 'Kategori Ke - 754', 0, '0000-00-00 00:00:00'),
(862, 'Kategori Ke - 755', 0, '0000-00-00 00:00:00'),
(863, 'Kategori Ke - 756', 0, '0000-00-00 00:00:00'),
(864, 'Kategori Ke - 757', 0, '0000-00-00 00:00:00'),
(865, 'Kategori Ke - 758', 0, '0000-00-00 00:00:00'),
(866, 'Kategori Ke - 759', 0, '0000-00-00 00:00:00'),
(867, 'Kategori Ke - 760', 0, '0000-00-00 00:00:00'),
(868, 'Kategori Ke - 761', 0, '0000-00-00 00:00:00'),
(869, 'Kategori Ke - 762', 0, '0000-00-00 00:00:00'),
(870, 'Kategori Ke - 763', 0, '0000-00-00 00:00:00'),
(871, 'Kategori Ke - 764', 0, '0000-00-00 00:00:00'),
(872, 'Kategori Ke - 765', 0, '0000-00-00 00:00:00'),
(873, 'Kategori Ke - 766', 0, '0000-00-00 00:00:00'),
(874, 'Kategori Ke - 767', 0, '0000-00-00 00:00:00'),
(875, 'Kategori Ke - 768', 0, '0000-00-00 00:00:00'),
(876, 'Kategori Ke - 769', 0, '0000-00-00 00:00:00'),
(877, 'Kategori Ke - 770', 0, '0000-00-00 00:00:00'),
(878, 'Kategori Ke - 771', 0, '0000-00-00 00:00:00'),
(879, 'Kategori Ke - 772', 0, '0000-00-00 00:00:00'),
(880, 'Kategori Ke - 773', 0, '0000-00-00 00:00:00'),
(881, 'Kategori Ke - 774', 0, '0000-00-00 00:00:00'),
(882, 'Kategori Ke - 775', 0, '0000-00-00 00:00:00'),
(883, 'Kategori Ke - 776', 0, '0000-00-00 00:00:00'),
(884, 'Kategori Ke - 777', 0, '0000-00-00 00:00:00'),
(885, 'Kategori Ke - 778', 0, '0000-00-00 00:00:00'),
(886, 'Kategori Ke - 779', 0, '0000-00-00 00:00:00'),
(887, 'Kategori Ke - 780', 0, '0000-00-00 00:00:00'),
(888, 'Kategori Ke - 781', 0, '0000-00-00 00:00:00'),
(889, 'Kategori Ke - 782', 0, '0000-00-00 00:00:00'),
(890, 'Kategori Ke - 783', 0, '0000-00-00 00:00:00'),
(891, 'Kategori Ke - 784', 0, '0000-00-00 00:00:00'),
(892, 'Kategori Ke - 785', 0, '0000-00-00 00:00:00'),
(893, 'Kategori Ke - 786', 0, '0000-00-00 00:00:00'),
(894, 'Kategori Ke - 787', 0, '0000-00-00 00:00:00'),
(895, 'Kategori Ke - 788', 0, '0000-00-00 00:00:00'),
(896, 'Kategori Ke - 789', 0, '0000-00-00 00:00:00'),
(897, 'Kategori Ke - 790', 0, '0000-00-00 00:00:00'),
(898, 'Kategori Ke - 791', 0, '0000-00-00 00:00:00'),
(899, 'Kategori Ke - 792', 0, '0000-00-00 00:00:00'),
(900, 'Kategori Ke - 793', 0, '0000-00-00 00:00:00'),
(901, 'Kategori Ke - 794', 0, '0000-00-00 00:00:00'),
(902, 'Kategori Ke - 795', 0, '0000-00-00 00:00:00'),
(903, 'Kategori Ke - 796', 0, '0000-00-00 00:00:00'),
(904, 'Kategori Ke - 797', 0, '0000-00-00 00:00:00'),
(905, 'Kategori Ke - 798', 0, '0000-00-00 00:00:00'),
(906, 'Kategori Ke - 799', 0, '0000-00-00 00:00:00'),
(907, 'Kategori Ke - 800', 0, '0000-00-00 00:00:00'),
(908, 'Kategori Ke - 801', 0, '0000-00-00 00:00:00'),
(909, 'Kategori Ke - 802', 0, '0000-00-00 00:00:00'),
(910, 'Kategori Ke - 803', 0, '0000-00-00 00:00:00'),
(911, 'Kategori Ke - 804', 0, '0000-00-00 00:00:00'),
(912, 'Kategori Ke - 805', 0, '0000-00-00 00:00:00'),
(913, 'Kategori Ke - 806', 0, '0000-00-00 00:00:00'),
(914, 'Kategori Ke - 807', 0, '0000-00-00 00:00:00'),
(915, 'Kategori Ke - 808', 0, '0000-00-00 00:00:00'),
(916, 'Kategori Ke - 809', 0, '0000-00-00 00:00:00'),
(917, 'Kategori Ke - 810', 0, '0000-00-00 00:00:00'),
(918, 'Kategori Ke - 811', 0, '0000-00-00 00:00:00'),
(919, 'Kategori Ke - 812', 0, '0000-00-00 00:00:00'),
(920, 'Kategori Ke - 813', 0, '0000-00-00 00:00:00'),
(921, 'Kategori Ke - 814', 0, '0000-00-00 00:00:00'),
(922, 'Kategori Ke - 815', 0, '0000-00-00 00:00:00'),
(923, 'Kategori Ke - 816', 0, '0000-00-00 00:00:00'),
(924, 'Kategori Ke - 817', 0, '0000-00-00 00:00:00'),
(925, 'Kategori Ke - 818', 0, '0000-00-00 00:00:00'),
(926, 'Kategori Ke - 819', 0, '0000-00-00 00:00:00'),
(927, 'Kategori Ke - 820', 0, '0000-00-00 00:00:00'),
(928, 'Kategori Ke - 821', 0, '0000-00-00 00:00:00'),
(929, 'Kategori Ke - 822', 0, '0000-00-00 00:00:00'),
(930, 'Kategori Ke - 823', 0, '0000-00-00 00:00:00'),
(931, 'Kategori Ke - 824', 0, '0000-00-00 00:00:00'),
(932, 'Kategori Ke - 825', 0, '0000-00-00 00:00:00'),
(933, 'Kategori Ke - 826', 0, '0000-00-00 00:00:00'),
(934, 'Kategori Ke - 827', 0, '0000-00-00 00:00:00'),
(935, 'Kategori Ke - 828', 0, '0000-00-00 00:00:00'),
(936, 'Kategori Ke - 829', 0, '0000-00-00 00:00:00'),
(937, 'Kategori Ke - 830', 0, '0000-00-00 00:00:00'),
(938, 'Kategori Ke - 831', 0, '0000-00-00 00:00:00'),
(939, 'Kategori Ke - 832', 0, '0000-00-00 00:00:00'),
(940, 'Kategori Ke - 833', 0, '0000-00-00 00:00:00'),
(941, 'Kategori Ke - 834', 0, '0000-00-00 00:00:00'),
(942, 'Kategori Ke - 835', 0, '0000-00-00 00:00:00'),
(943, 'Kategori Ke - 836', 0, '0000-00-00 00:00:00'),
(944, 'Kategori Ke - 837', 0, '0000-00-00 00:00:00'),
(945, 'Kategori Ke - 838', 0, '0000-00-00 00:00:00'),
(946, 'Kategori Ke - 839', 0, '0000-00-00 00:00:00'),
(947, 'Kategori Ke - 840', 0, '0000-00-00 00:00:00'),
(948, 'Kategori Ke - 841', 0, '0000-00-00 00:00:00'),
(949, 'Kategori Ke - 842', 0, '0000-00-00 00:00:00'),
(950, 'Kategori Ke - 843', 0, '0000-00-00 00:00:00'),
(951, 'Kategori Ke - 844', 0, '0000-00-00 00:00:00'),
(952, 'Kategori Ke - 845', 0, '0000-00-00 00:00:00'),
(953, 'Kategori Ke - 846', 0, '0000-00-00 00:00:00'),
(954, 'Kategori Ke - 847', 0, '0000-00-00 00:00:00'),
(955, 'Kategori Ke - 848', 0, '0000-00-00 00:00:00'),
(956, 'Kategori Ke - 849', 0, '0000-00-00 00:00:00'),
(957, 'Kategori Ke - 850', 0, '0000-00-00 00:00:00'),
(958, 'Kategori Ke - 851', 0, '0000-00-00 00:00:00'),
(959, 'Kategori Ke - 852', 0, '0000-00-00 00:00:00'),
(960, 'Kategori Ke - 853', 0, '0000-00-00 00:00:00'),
(961, 'Kategori Ke - 854', 0, '0000-00-00 00:00:00'),
(962, 'Kategori Ke - 855', 0, '0000-00-00 00:00:00'),
(963, 'Kategori Ke - 856', 0, '0000-00-00 00:00:00'),
(964, 'Kategori Ke - 857', 0, '0000-00-00 00:00:00'),
(965, 'Kategori Ke - 858', 0, '0000-00-00 00:00:00'),
(966, 'Kategori Ke - 859', 0, '0000-00-00 00:00:00'),
(967, 'Kategori Ke - 860', 0, '0000-00-00 00:00:00'),
(968, 'Kategori Ke - 861', 0, '0000-00-00 00:00:00'),
(969, 'Kategori Ke - 862', 0, '0000-00-00 00:00:00'),
(970, 'Kategori Ke - 863', 0, '0000-00-00 00:00:00'),
(971, 'Kategori Ke - 864', 0, '0000-00-00 00:00:00'),
(972, 'Kategori Ke - 865', 0, '0000-00-00 00:00:00'),
(973, 'Kategori Ke - 866', 0, '0000-00-00 00:00:00'),
(974, 'Kategori Ke - 867', 0, '0000-00-00 00:00:00'),
(975, 'Kategori Ke - 868', 0, '0000-00-00 00:00:00'),
(976, 'Kategori Ke - 869', 0, '0000-00-00 00:00:00'),
(977, 'Kategori Ke - 870', 0, '0000-00-00 00:00:00'),
(978, 'Kategori Ke - 871', 0, '0000-00-00 00:00:00'),
(979, 'Kategori Ke - 872', 0, '0000-00-00 00:00:00'),
(980, 'Kategori Ke - 873', 0, '0000-00-00 00:00:00'),
(981, 'Kategori Ke - 874', 0, '0000-00-00 00:00:00'),
(982, 'Kategori Ke - 875', 0, '0000-00-00 00:00:00'),
(983, 'Kategori Ke - 876', 0, '0000-00-00 00:00:00'),
(984, 'Kategori Ke - 877', 0, '0000-00-00 00:00:00'),
(985, 'Kategori Ke - 878', 0, '0000-00-00 00:00:00'),
(986, 'Kategori Ke - 879', 0, '0000-00-00 00:00:00'),
(987, 'Kategori Ke - 880', 0, '0000-00-00 00:00:00'),
(988, 'Kategori Ke - 881', 0, '0000-00-00 00:00:00'),
(989, 'Kategori Ke - 882', 0, '0000-00-00 00:00:00'),
(990, 'Kategori Ke - 883', 0, '0000-00-00 00:00:00'),
(991, 'Kategori Ke - 884', 0, '0000-00-00 00:00:00'),
(992, 'Kategori Ke - 885', 0, '0000-00-00 00:00:00'),
(993, 'Kategori Ke - 886', 0, '0000-00-00 00:00:00'),
(994, 'Kategori Ke - 887', 0, '0000-00-00 00:00:00'),
(995, 'Kategori Ke - 888', 0, '0000-00-00 00:00:00'),
(996, 'Kategori Ke - 889', 0, '0000-00-00 00:00:00'),
(997, 'Kategori Ke - 890', 0, '0000-00-00 00:00:00'),
(998, 'Kategori Ke - 891', 0, '0000-00-00 00:00:00'),
(999, 'Kategori Ke - 892', 0, '0000-00-00 00:00:00'),
(1000, 'Kategori Ke - 893', 0, '0000-00-00 00:00:00'),
(1001, 'Kategori Ke - 894', 0, '0000-00-00 00:00:00'),
(1002, 'Kategori Ke - 895', 0, '0000-00-00 00:00:00'),
(1003, 'Kategori Ke - 896', 0, '0000-00-00 00:00:00'),
(1004, 'Kategori Ke - 897', 0, '0000-00-00 00:00:00'),
(1005, 'Kategori Ke - 898', 0, '0000-00-00 00:00:00'),
(1006, 'Kategori Ke - 899', 0, '0000-00-00 00:00:00'),
(1007, 'Kategori Ke - 900', 0, '0000-00-00 00:00:00'),
(1008, 'Kategori Ke - 901', 0, '0000-00-00 00:00:00'),
(1009, 'Kategori Ke - 902', 0, '0000-00-00 00:00:00'),
(1010, 'Kategori Ke - 903', 0, '0000-00-00 00:00:00'),
(1011, 'Kategori Ke - 904', 0, '0000-00-00 00:00:00'),
(1012, 'Kategori Ke - 905', 0, '0000-00-00 00:00:00'),
(1013, 'Kategori Ke - 906', 0, '0000-00-00 00:00:00'),
(1014, 'Kategori Ke - 907', 0, '0000-00-00 00:00:00'),
(1015, 'Kategori Ke - 908', 0, '0000-00-00 00:00:00'),
(1016, 'Kategori Ke - 909', 0, '0000-00-00 00:00:00'),
(1017, 'Kategori Ke - 910', 0, '0000-00-00 00:00:00'),
(1018, 'Kategori Ke - 911', 0, '0000-00-00 00:00:00'),
(1019, 'Kategori Ke - 912', 0, '0000-00-00 00:00:00'),
(1020, 'Kategori Ke - 913', 0, '0000-00-00 00:00:00'),
(1021, 'Kategori Ke - 914', 0, '0000-00-00 00:00:00'),
(1022, 'Kategori Ke - 915', 0, '0000-00-00 00:00:00'),
(1023, 'Kategori Ke - 916', 0, '0000-00-00 00:00:00'),
(1024, 'Kategori Ke - 917', 0, '0000-00-00 00:00:00'),
(1025, 'Kategori Ke - 918', 0, '0000-00-00 00:00:00'),
(1026, 'Kategori Ke - 919', 0, '0000-00-00 00:00:00'),
(1027, 'Kategori Ke - 920', 0, '0000-00-00 00:00:00'),
(1028, 'Kategori Ke - 921', 0, '0000-00-00 00:00:00'),
(1029, 'Kategori Ke - 922', 0, '0000-00-00 00:00:00'),
(1030, 'Kategori Ke - 923', 0, '0000-00-00 00:00:00'),
(1031, 'Kategori Ke - 924', 0, '0000-00-00 00:00:00'),
(1032, 'Kategori Ke - 925', 0, '0000-00-00 00:00:00'),
(1033, 'Kategori Ke - 926', 0, '0000-00-00 00:00:00'),
(1034, 'Kategori Ke - 927', 0, '0000-00-00 00:00:00'),
(1035, 'Kategori Ke - 928', 0, '0000-00-00 00:00:00'),
(1036, 'Kategori Ke - 929', 0, '0000-00-00 00:00:00'),
(1037, 'Kategori Ke - 930', 0, '0000-00-00 00:00:00'),
(1038, 'Kategori Ke - 931', 0, '0000-00-00 00:00:00'),
(1039, 'Kategori Ke - 932', 0, '0000-00-00 00:00:00'),
(1040, 'Kategori Ke - 933', 0, '0000-00-00 00:00:00'),
(1041, 'Kategori Ke - 934', 0, '0000-00-00 00:00:00'),
(1042, 'Kategori Ke - 935', 0, '0000-00-00 00:00:00'),
(1043, 'Kategori Ke - 936', 0, '0000-00-00 00:00:00'),
(1044, 'Kategori Ke - 937', 0, '0000-00-00 00:00:00'),
(1045, 'Kategori Ke - 938', 0, '0000-00-00 00:00:00'),
(1046, 'Kategori Ke - 939', 0, '0000-00-00 00:00:00'),
(1047, 'Kategori Ke - 940', 0, '0000-00-00 00:00:00'),
(1048, 'Kategori Ke - 941', 0, '0000-00-00 00:00:00'),
(1049, 'Kategori Ke - 942', 0, '0000-00-00 00:00:00'),
(1050, 'Kategori Ke - 943', 0, '0000-00-00 00:00:00'),
(1051, 'Kategori Ke - 944', 0, '0000-00-00 00:00:00'),
(1052, 'Kategori Ke - 945', 0, '0000-00-00 00:00:00'),
(1053, 'Kategori Ke - 946', 0, '0000-00-00 00:00:00'),
(1054, 'Kategori Ke - 947', 0, '0000-00-00 00:00:00'),
(1055, 'Kategori Ke - 948', 0, '0000-00-00 00:00:00'),
(1056, 'Kategori Ke - 949', 0, '0000-00-00 00:00:00'),
(1057, 'Kategori Ke - 950', 0, '0000-00-00 00:00:00'),
(1058, 'Kategori Ke - 951', 0, '0000-00-00 00:00:00'),
(1059, 'Kategori Ke - 952', 0, '0000-00-00 00:00:00'),
(1060, 'Kategori Ke - 953', 0, '0000-00-00 00:00:00'),
(1061, 'Kategori Ke - 954', 0, '0000-00-00 00:00:00'),
(1062, 'Kategori Ke - 955', 0, '0000-00-00 00:00:00'),
(1063, 'Kategori Ke - 956', 0, '0000-00-00 00:00:00');
INSERT INTO `categori` (`id_categori`, `nama_categori`, `status_categori`, `createdate`) VALUES
(1064, 'Kategori Ke - 957', 0, '0000-00-00 00:00:00'),
(1065, 'Kategori Ke - 958', 0, '0000-00-00 00:00:00'),
(1066, 'Kategori Ke - 959', 0, '0000-00-00 00:00:00'),
(1067, 'Kategori Ke - 960', 0, '0000-00-00 00:00:00'),
(1068, 'Kategori Ke - 961', 0, '0000-00-00 00:00:00'),
(1069, 'Kategori Ke - 962', 0, '0000-00-00 00:00:00'),
(1070, 'Kategori Ke - 963', 0, '0000-00-00 00:00:00'),
(1071, 'Kategori Ke - 964', 0, '0000-00-00 00:00:00'),
(1072, 'Kategori Ke - 965', 0, '0000-00-00 00:00:00'),
(1073, 'Kategori Ke - 966', 0, '0000-00-00 00:00:00'),
(1074, 'Kategori Ke - 967', 0, '0000-00-00 00:00:00'),
(1075, 'Kategori Ke - 968', 0, '0000-00-00 00:00:00'),
(1076, 'Kategori Ke - 969', 0, '0000-00-00 00:00:00'),
(1077, 'Kategori Ke - 970', 0, '0000-00-00 00:00:00'),
(1078, 'Kategori Ke - 971', 0, '0000-00-00 00:00:00'),
(1079, 'Kategori Ke - 972', 0, '0000-00-00 00:00:00'),
(1080, 'Kategori Ke - 973', 0, '0000-00-00 00:00:00'),
(1081, 'Kategori Ke - 974', 0, '0000-00-00 00:00:00'),
(1082, 'Kategori Ke - 975', 0, '0000-00-00 00:00:00'),
(1083, 'Kategori Ke - 976', 0, '0000-00-00 00:00:00'),
(1084, 'Kategori Ke - 977', 0, '0000-00-00 00:00:00'),
(1085, 'Kategori Ke - 978', 0, '0000-00-00 00:00:00'),
(1086, 'Kategori Ke - 979', 0, '0000-00-00 00:00:00'),
(1087, 'Kategori Ke - 980', 0, '0000-00-00 00:00:00'),
(1088, 'Kategori Ke - 981', 0, '0000-00-00 00:00:00'),
(1089, 'Kategori Ke - 982', 0, '0000-00-00 00:00:00'),
(1090, 'Kategori Ke - 983', 0, '0000-00-00 00:00:00'),
(1091, 'Kategori Ke - 984', 0, '0000-00-00 00:00:00'),
(1092, 'Kategori Ke - 985', 0, '0000-00-00 00:00:00'),
(1093, 'Kategori Ke - 986', 0, '0000-00-00 00:00:00'),
(1094, 'Kategori Ke - 987', 0, '0000-00-00 00:00:00'),
(1095, 'Kategori Ke - 988', 0, '0000-00-00 00:00:00'),
(1096, 'Kategori Ke - 989', 0, '0000-00-00 00:00:00'),
(1097, 'Kategori Ke - 990', 0, '0000-00-00 00:00:00'),
(1098, 'Kategori Ke - 991', 0, '0000-00-00 00:00:00'),
(1099, 'Kategori Ke - 992', 0, '0000-00-00 00:00:00'),
(1100, 'Kategori Ke - 993', 0, '0000-00-00 00:00:00'),
(1101, 'Kategori Ke - 994', 0, '0000-00-00 00:00:00'),
(1102, 'Kategori Ke - 995', 0, '0000-00-00 00:00:00'),
(1103, 'Kategori Ke - 996', 0, '0000-00-00 00:00:00'),
(1104, 'Kategori Ke - 997', 0, '0000-00-00 00:00:00'),
(1105, 'Kategori Ke - 998', 0, '0000-00-00 00:00:00'),
(1106, 'Kategori Ke - 999', 0, '0000-00-00 00:00:00'),
(1107, 'Praise and Worship', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ewarta`
--

CREATE TABLE `ewarta` (
  `idewarta` int(5) NOT NULL,
  `id_categori` int(5) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  `timepublish` datetime DEFAULT NULL,
  `filewarta` varchar(100) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `poster` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ewarta`
--

INSERT INTO `ewarta` (`idewarta`, `id_categori`, `title`, `timepublish`, `filewarta`, `createdate`, `status`, `description`, `poster`) VALUES
(1, 104, 'Kasih yang sempurna', '2020-09-13 21:24:14', 'kasih.pdf', '2020-09-13 21:24:24', 1, NULL, NULL),
(2, 105, 'Pengharapan ', '2020-09-13 21:44:02', 'pengharapan', '2020-09-13 21:44:17', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fotokabarperistiwa`
--

CREATE TABLE `fotokabarperistiwa` (
  `id_foto` int(10) NOT NULL,
  `judulFoto` varchar(100) NOT NULL,
  `id_categori` int(5) NOT NULL,
  `foto` blob NOT NULL,
  `keterangan` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `id_menu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fotokabarperistiwa`
--

INSERT INTO `fotokabarperistiwa` (`id_foto`, `judulFoto`, `id_categori`, `foto`, `keterangan`, `status`, `id_menu`) VALUES
(5, 'Foto Demonstrasi 2017 di Jakarta', 2, 0x66696c655f313530353138363739362e6a7067, 'Foto Demonstrasi 2017 di JakartaFoto Demonstrasi 2017 di JakartaFoto Demonstrasi 2017 di JakartaFoto Demonstrasi 2017 di Jakarta', 'aktif', 90),
(6, 'Foto Demonstrasi 2017 di Jakartar', 4, 0x66696c655f313530353138363831372e6a7067, 'Foto Demonstrasi 2017 di Jakartar', 'aktif', 0),
(7, 'Augmented Reality', 5, 0x66696c655f313530353138363833342e6a7067, 'Augmented RealityAugmented Reality', 'aktif', 0),
(8, 'Laravel Api Lumen', 5, 0x66696c655f313530353134303235362e6a7067, 'Laravel Api Lumen', 'aktif', 90),
(9, 'Publik Ingin Usut Tuntas Kasus Paniai, Bukan Infrastruktur dan Investasi ', 8, 0x66696c655f313531323738383136342e6a7067, 'Publik Ingin Usut Tuntas Kasus Paniai, Bukan Infrastruktur dan Investasi ', 'aktif', 90),
(10, '3 Tahun Kasus Paniai Berdarah, Dimana Janji Jokowi', 9, 0x66696c655f313531323738383333362e6a7067, '3 Tahun Kasus Paniai Berdarah, Dimana Janji Jokowi', 'aktif', 90),
(11, 'Budaya Suku Mee', 8, 0x66696c655f313531323536363539382e4a5047, 'Cerita dari foto ini menggambar sosok suami istri dalam menjalankan aktivitas pulang habis berkebun,  yang mana diantaranya seorang istri membawah \"nota\" (Ubi)  dalam noken,  dan sosok suami membawa kayu saat pulang dari kebun. Modelis dalam photo ini ialah mahasiswa asal Paniai, Kuliah di Antropologi, Universitas Cenderawasih.\r\n\r\nKet photo:\r\n\r\nData : 27/04/2017\r\nLokasi: Campwolker, Jayapura,  Papua. \r\nPhotographer: Marchelino Kudiai\r\nTallent: Ribka Degei,  dan Horison Tebai\r\n\r\n#Redaktur_Photography_KM\r\n#Marchelino Kudiai', 'aktif', 90),
(12, 'Walikota Jayapura Buka Pelatihan Jurnalistik', 5, 0x66696c655f313531323536393537302e4a5047, 'Walikota Jayapura, Dr. Drs. Benhur Tomi Mano dengan resmi membuka kegiatan Pelatihan Jurnalistik Media Online Anti Hoax, Senin, (04/12/17) di Hotel Grand Abepura, Jayapura, Papua.', 'aktif', 90),
(13, 'MRP Sikapi Serangan Bom Bunuh Diri di Jawa', 11, 0x66696c655f313532363333333233372e4a5047, '<p><strong><em>JAYAPURA, KABARMAPEGAA.com – Ketua Majelis Rakyat Papua (MRP) dan Anggota MRP sebagai lembaga kultur yang membela hak-hak Orang Asli Papua (OAP) menyikapi serangan bom bunuh diri pada beberapa tempat di Jawa.</em></strong></p>\r\n\r\n<p> </p>\r\n\r\n<p>Ketua MRP, Tomotius Murib menyatakan, sesuai dangan tugas dan kewajiban Majelis Rakyat Papua untuk manjaga intergritas nasional dalam rangka pengamalan Pancasila dan UUD 1945 serta mamelihara kerukunan hidup umat beragama di Tanah Papua. Maka, untuk mengantisipasi imbas intoleransi dari kasus bom bunuh diri di Jawa Timur, MRP mengingatkan kambali betapa kejihnya aksi terorisme di Indonesia.</p>\r\n\r\n<p> </p>\r\n\r\n<p>“Dengan itu, kami MRP menyatakan sikap dan seruan, pertama, mengutuk aksi kebiadaban teroris dalam pengeboman tiga gereja minggu pagi 13 Mei 2018 di Surabaya,” Kata Murib Kepada Wartawan Dalam Jumpa Pers di Ruang Kerjanya bersama seluruh anggota MRP, Senin (14/5).</p>', 'aktif', 0),
(14, 'Meki Nawipa Turlap di Salah Distrik Kabupaten Paniai', 16, 0x66696c655f313532363436343839332e6a7067, '<p> </p>\r\n\r\n<p><strong><em>JAYAPURA, KABARMAPEGAA.com – Calon Bupati Kabupaten Paniai, Meki Frit Meki Nawipa yang juga adalah pilot suku Mee mendaratkan pesawat terbang di salah distrik Kabupaten Paniai. Mendaratkan pesawat itu bertujuan untuk melakukan sebuah terobosan baru, meningkatkan kemajuan dalam pembangunan dan melayani masyarakat yang jauh dari perkotaan.</em></strong></p>\r\n\r\n<p> </p>\r\n\r\n<p>Dia sudah siap melayani masyarakat dengan hati yang tulus. Memberikan pelayanan yang langsung menyentuh kepada rakyat. Dan ingin merubah Kabupaten Paniai menjadi kabupaten percontohan di Kabupaten lain di Provinsi Papua.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Visinya, “Paniai Untuk Semua” adalah upaya untuk membangkitkan pembangunan dari yang sudah ada. Sementara pembangunan yang belum dilakukan dari pemerintahan sebelumnya akan dkerjakan bersama jajaranya.  Tugas masyarakat dan semua rakyat Kabupaten Paniai, tentunya memberikan dukungan dan doa kepada paslon nomor urut tiga. Semoga, kedepan, Kabupaten Paniai dikerjakan sesuai dengan harapan rakyat Kabupaten Paniai.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Redaksi</strong></p>\r\n', 'aktif', 0);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `hakakses`
--

CREATE TABLE `hakakses` (
  `id_hakakses` int(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_tlp` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `tgl_register` date NOT NULL,
  `tgl_update` date NOT NULL,
  `register_by` varchar(50) NOT NULL,
  `update_by` varchar(50) NOT NULL,
  `akses` varchar(20) NOT NULL,
  `fotouser` varchar(100) NOT NULL,
  `aboutme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hakakses`
--

INSERT INTO `hakakses` (`id_hakakses`, `nama_lengkap`, `email`, `no_tlp`, `username`, `password`, `status`, `tgl_register`, `tgl_update`, `register_by`, `update_by`, `akses`, `fotouser`, `aboutme`) VALUES
(4, 'Alexander Gobai', 'alexandergobai@gmail.com', '082231161874', 'alexander', 'gobai', 'AKTIF', '2017-12-17', '2011-05-18', 'Admin', 'Admin', 'SUPERADMIN', 'file_1525970731.jpg', 'Pemimpin Umum dan Redakur Media Online Kabar Mapegaa (KM)      '),
(24, 'Kabar Mapegaa', 'redaksikabarmapegaa@gmail.com', '081344571308', 'Member', 'kabarmapegaa', 'AKTIF', '2019-04-18', '2024-04-20', 'Admin', 'Admin', 'SUPERADMIN', 'file_1543854015.jpg', '                                                                                              '),
(25, 'Frans Pigai', 'franspigai1@gmail.com', '081228465935', 'MUYEPIMO', 'MUYEPIMOPIGAI', 'AKTIF', '2011-05-18', '2003-10-19', 'Admin', 'Admin', 'MEMBER', 'file_1570114950.jpg', '                                                        Redaktur Artikel Media Online Kabar Mapegaa (KM)                                                                                                                                     '),
(26, 'A. Ogobai', 'andy.ogobai@gmail.com', '081354027214', 'ANDY OGOBAI', '12111987', 'AKTIF', '2011-05-18', '2009-07-20', 'Admin', 'Admin', 'MEMBER', 'file_1541399279.jpg', '                             Tinggalkan Jejak Dengan Tulisan...!                                                                                                              '),
(27, 'Yosafat Muyapa', 'cobacobamenulis@gmail.com', '082122226038', 'wjq5r', '9eORqx2', 'TIDAK', '2011-05-18', '2012-05-18', 'Admin', 'Admin', 'MEMBER', '', ''),
(28, 'Anton Gobai', 'enakidagobai@gmail.com', '085363325321', '6iccH', 'WBzGwF4', 'TIDAK', '2011-05-18', '2012-05-18', 'Admin', 'Admin', 'MEMBER', '', ''),
(30, 'Steven Degei', 'stev10degei@gmail.com', '082328416401', 'Uh3Hl', 'lLkv4hm', 'AKTIF', '2011-05-18', '0000-00-00', 'Admin', '', 'MEMBER', '', ''),
(31, 'Marinus Gobai', 'marinusgobai@gmail.com', '081210731773', 'VwQw5', 'ZtDyO1Q', 'AKTIF', '2011-05-18', '2018-05-18', 'Admin', 'Admin', 'MEMBER', 'file_1526644948.jpg', '                                                                                                                                                            '),
(32, 'Yunus Eki Gobai', 'yunusegobai@gmail.com', '082260724372', 'yF9IF', 'ufGPopw', 'AKTIF', '2012-05-18', '0000-00-00', 'Admin', '', 'MEMBER', '', ''),
(33, 'Melki Yogi', 'melky_paniai@yahoo.com', '082199233031', 'do787', 'pGKayvf', 'TIDAK', '2012-05-18', '2012-05-18', 'Admin', 'Admin', 'MEMBER', '', ''),
(34, 'Ancelmus Gobai', 'ancelmusgobai@gmail.com', '085354227072', 'ancelmus', 'gobai', 'AKTIF', '2012-05-18', '2012-11-19', 'Admin', 'Admin', 'MEMBER', 'file_1539000529.JPG', '                                                                                                                                                                                                                       \"Melayani dengan hati\"                                                                                                                                                                               '),
(35, 'Noval Smith', 'novalsmith69@gmail.com', '082231161874', 'novalsmith', '1412novalsmith', 'AKTIF', '2012-05-18', '2002-06-18', 'Admin', 'Admin', 'SUPERADMIN', 'file_1526126406.jpg', '              IT - Head Of System Aplication on Kabarmapegaa.com                           '),
(36, 'Manfred Kudiai', 'kudiaimanfred@gmail.com', '082198449953', 'RubekaYogi', '2u1264ku', 'AKTIF', '2013-05-18', '2013-05-18', 'Admin', 'Admin', 'SUPERADMIN', 'file_1526181396.jpg', 'Pemred Kabar Mapegaa (KM)            '),
(37, 'Aprila Wayar', 'aprila.wayar@hotmail.com', '081393652921', 'APRO', 'wishaal21', 'AKTIF', '2002-03-20', '2014-05-20', 'Admin', 'Admin', 'MEMBER', 'file_1584565421.jpg', '                                                                                                  Freelance Journalist                                                                                        '),
(38, 'Eman B Youw', 'obaiye085@gmail.com', '082298680471', 'ed9TN', 'tgcTnkE', 'AKTIF', '2009-04-20', '2009-04-20', 'Admin', 'Admin', 'MEMBER', 'file_1586435772.jpg', '                          '),
(39, 'Hagimuni Dann', 'danimbaugau@gmail.com', '081247635999', 'mepagenoo', '123intanjaya', 'AKTIF', '2013-05-20', '2013-05-20', 'Admin', 'Admin', 'MEMBER', 'file_1589348693.jpg', ' Koresponden KM Kab Intan Jaya'),
(40, 'Redaksi KM', 'Yunusgobai3@gmail.com', '081248711109', 'Ekmxe', 'ugw8FwR', 'AKTIF', '2016-06-20', '2012-07-20', 'Admin', 'Admin', 'SUPERADMIN', 'file_1594566174.jpg', '                                                                                                                                                                                                                                                                                                           '),
(41, 'Martinus Pigome', 'Martinus.pigome@gmail.com', '081330231111', 'YtPBT', 'lzYDQYu', 'AKTIF', '2027-06-20', '2027-06-20', 'Admin', 'Admin', 'MEMBER', 'file_1593221579.jpg', '                          ');

-- --------------------------------------------------------

--
-- Table structure for table `kerja_sama`
--

CREATE TABLE `kerja_sama` (
  `id_kerja_sama` int(10) NOT NULL,
  `nama_kerja_sama` varchar(50) NOT NULL,
  `url_kerja_sama` varchar(100) NOT NULL,
  `foto_kerja_sama` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kerja_sama`
--

INSERT INTO `kerja_sama` (`id_kerja_sama`, `nama_kerja_sama`, `url_kerja_sama`, `foto_kerja_sama`) VALUES
(1, 'Majalah Online Tabloid Jubi', 'http://olahraga.tabloidjubi.com', 0x66696c655f313439363930353839342e706e67),
(2, 'Kabarmapegaa', 'http://kabarmapegaa.com', 0x66696c655f313439363930343537362e706e67),
(4, 'Suara Papua', 'http://suarapapua.com', 0x66696c655f313531313934353430372e706e67);

-- --------------------------------------------------------

--
-- Table structure for table `kontak_kami`
--

CREATE TABLE `kontak_kami` (
  `id_kontak` int(11) NOT NULL,
  `nama_kontak` varchar(50) NOT NULL,
  `email_kontak` varchar(50) NOT NULL,
  `pesan_kontak` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lookup`
--

CREATE TABLE `lookup` (
  `idLookup` int(5) NOT NULL,
  `idLookupCategory` int(5) NOT NULL,
  `loockupName` varchar(50) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lookupcategory`
--

CREATE TABLE `lookupcategory` (
  `idLookupCategory` int(3) NOT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(3) UNSIGNED NOT NULL,
  `parent_id` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `menu` varchar(200) NOT NULL DEFAULT '',
  `slugMenu` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `parent_id`, `menu`, `slugMenu`, `status`) VALUES
(69, 64, 'mamta', 'mamta', 'aktif'),
(67, 64, 'saireri', 'saireri', 'aktif'),
(68, 64, 'domberai', 'domberai', 'aktif'),
(66, 64, 'bomberai', 'bomberai', 'aktif'),
(60, 51, 'politik dan pemerintah', 'politik-dan-pemerintah', 'aktif'),
(61, 57, 'Kabar Papua', 'kabar-papua', 'aktif'),
(62, 57, 'kabar papua barat', 'kabar-papua-barat', 'aktif'),
(63, 51, 'hukum dan ham', 'hukum-dan-ham', 'aktif'),
(59, 51, 'pendidikan', 'pendidikan', 'aktif'),
(65, 64, 'haanim', 'haanim', 'aktif'),
(64, 0, 'Tanah Papua', 'tanah-papua', 'aktif'),
(58, 51, 'kesehatan', 'kesehatan', 'aktif'),
(57, 0, 'Kabar', 'kabar', 'aktif'),
(54, 0, 'Nasional & Dunia', 'nasional-dunia', 'aktif'),
(52, 54, 'nasional', 'nasional', 'aktif'),
(53, 51, 'ekonomi dan bisnis', 'ekonomi-dan-bisnis', 'aktif'),
(51, 0, 'informasi', 'informasi', 'aktif'),
(71, 0, 'Tulisan', 'tulisan', 'aktif'),
(72, 71, 'artikel', 'artikel', 'aktif'),
(73, 64, 'lapago', 'lapago', 'aktif'),
(74, 64, 'meepago', 'meepago', 'aktif'),
(75, 54, 'Internasional', 'internasional', 'aktif'),
(76, 51, 'sosial dan budaya', 'sosial-dan-budaya', 'aktif'),
(77, 51, 'lingkungan', 'lingkungan', 'aktif'),
(78, 51, 'rohani', 'rohani', 'aktif'),
(79, 51, 'teknologi', 'teknologi', 'aktif'),
(80, 71, 'opini', 'opini', 'aktif'),
(81, 71, 'cerpen', 'cerpen', 'aktif'),
(82, 71, 'renungan', 'renungan', 'aktif'),
(83, 71, 'puisi', 'puisi', 'aktif'),
(87, 0, 'coba', 'coba', 'tidak'),
(88, 0, 'Wisata', 'wisata', 'tidak'),
(89, 0, 'mop', 'mop', 'tidak'),
(90, 91, 'Foto', 'foto', 'aktif'),
(91, 0, 'Lainnya', 'lainnya', 'aktif'),
(92, 64, 'Pendidikan', 'pendidikan', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pengaturanweb`
--

CREATE TABLE `pengaturanweb` (
  `id_pengaturan` int(10) NOT NULL,
  `id_categori` int(10) NOT NULL,
  `id_menu` int(10) NOT NULL,
  `logo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaturanweb`
--

INSERT INTO `pengaturanweb` (`id_pengaturan`, `id_categori`, `id_menu`, `logo`) VALUES
(3, 2, 64, 0x646174612e6a7067),
(4, 4, 57, 0x646174612e6a7067),
(5, 5, 54, 0x646174612e6a7067),
(6, 6, 51, 0x646174612e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `posisitampilan`
--

CREATE TABLE `posisitampilan` (
  `id_posisiTampilan` int(10) NOT NULL,
  `rekomendasi` int(10) NOT NULL,
  `terbaru` int(10) NOT NULL,
  `populer` int(10) NOT NULL,
  `agenda` int(10) NOT NULL,
  `kerjasama` int(10) NOT NULL,
  `medsosFB` text NOT NULL,
  `medsosApi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile_web`
--

CREATE TABLE `profile_web` (
  `judulredaksi` varchar(100) NOT NULL,
  `id_profile_web` int(11) NOT NULL,
  `isiProfil` text NOT NULL,
  `posisi` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `slugProfil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_web`
--

INSERT INTO `profile_web` (`judulredaksi`, `id_profile_web`, `isiProfil`, `posisi`, `status`, `slugProfil`) VALUES
('Kontak Kami', 3, '<p><strong>Alamat Redaksi :</strong></p>\r\n\r\n<p>Jln. Banteng Asrama Haji, Kelurahan VIM Distrik Abepura, Jayapura-Papua.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Informasi :</strong></p>\r\n\r\n<p><strong>Telp</strong>            : +2681344571308</p>\r\n\r\n<p>                   : +2682198449953</p>\r\n\r\n<p>                   : +085254227072</p>\r\n\r\n<p><strong>Email</strong>          :<strong> <a href=\"mailto:redaksikabarmapegaa@gmail.com\">redaksikabarmapegaa@gmail.com</a></strong></p>\r\n\r\n<p>                   : <strong>wegeyoka@gmail.com</strong></p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Website      : <a href=\"https://draft.blogger.com/goog_607794050\">www.kabarmapega</a><a href=\"https://draft.blogger.com/goog_607794050\">a</a><a href=\"http://.com/\">.com</a></strong><br>\r\n<strong>Blogspot    : wwww.kabarmapegaa.blogspot.co.id</strong></p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Dibutuhkan :</strong></p>\r\n\r\n<p>Saran, Kritikan, Kesan, Pesan, dan Masukan untuk Media Kabar Mapega agar mempermuda dan membantu Redaksi wartawan KM, yang kemudian dapat memperbaharui tiap tulisan yang salah dari Redaksi KM, agar dirakit kembali berdasarkan keinginan dan kebutuhan publik.<br>\r\n<br>\r\n </p>\r\n\r\n<p><strong>Pemberitahuan:</strong></p>\r\n\r\n<p>Khusus untuk  Artikel atau Opini yang dibuat, tanggungjawab sepenuhnya ditangan penulis dan media sebagai alat untuk menyaluarkan ide dan pemikiran penulis.</p>', 'atas', 'aktif', 'Kontak_Kami'),
('Tentang Kami', 4, '<p>Media Online Kabar Mapega adalah salah situs media online yang mengkaji berita-berita seputar tanah Papua dan Papua Barat secara beragam dan berimbang.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media Kabar Mapega ini, sendiri dikelola oleh generasi-generasi muda Papua, yang saat ini masih menempu pendidikan di tahap atau tingkatan pelajar dan mahasiswa. Media ini, berupa website yang didirikan tepat pada tanggal 22 Maret 2013, berupa situs website www.kabarmapegaa.com, menbidik dan membina tanah Papua demi perubahan baru melalui berbagai tulisan, seperti: Pendidikan, Kesehatan, Ekonomi, Budaya, Iptek, Lingkungan, Hukum, HAM, Politik. Pemerintahan, Wisata, dan Olahraga.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Dikaji juga tiap generasi yang disiapkan sebagai wartawan muda Papua yang berdiri secara independen yang akan berperan dan memegang kode etik jurnalis berdasarkan UUD Pers No. 40 Tahun 1999 tentang Pers.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media www.kabarmapegaa.com, memunyai sistem yang sedang digunakan di KM, yaitu “Sistem Permberdayaan”. Maksud dari sistem ini ialah mengkaderkan generasi berikut agar mereka terlibat aktif di Media KM.</p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', 'atas', 'aktif', 'Tentang_Kami'),
('Akta Notaris', 5, '<p>Akta Pendirian Perseroan Komanditer CV. Media Kabar mapegaa. <strong>Nomor:30</strong></p>\r\n\r\n<p>Telah didaftarkan kepaniteraan pengadilan negeri kota timika <strong>Nomor: W30-010/387/CV.HK.00/IX/2015.</strong></p>', 'footer', 'aktif', 'Akta_Notaris'),
('Redaksional  kabarmapegaa.com', 6, '<p><strong>Dewan Pengawas/Penasehat</strong></p>\r\n\r\n<p>Emanuel Gobai, S.H (Ketua)</p>\r\n\r\n<p>Laurenzus Kadepa (Anggota)</p>\r\n\r\n<p>Pastor Stefanus Yogi, Pr. (Anggota)</p>\r\n\r\n<p>Menase Ugedy Degei (Anggota)</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Pendiri Media KM Online</strong></p>\r\n\r\n<p>Alexander Gobai, Andi Ogobai dan Marcelino Yogi</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Penanggungjawab Umum</strong></p>\r\n\r\n<p>Alexander  Gobai</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Pemimpin Redaksi</strong></p>\r\n\r\n<p>Manfred Kudiai</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Wakil Redaksi</strong></p>\r\n\r\n<p>Frans Yube Pigai</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Sekretaris Redaksi</strong></p>\r\n\r\n<p>Anselmus Gobai</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Bendahara</strong></p>\r\n\r\n<p>Ribka Degei</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Redaktur Pelaksana</strong></p>\r\n\r\n<p>Martinus Pigome</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Redaktur Fotografer</strong></p>\r\n\r\n<p>-</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Editor</strong></p>\r\n\r\n<p>Manfred Kudiai</p>\r\n\r\n<p>Ancelmus Gobai</p>\r\n\r\n<p>Frans Yube Pigai</p>\r\n\r\n<p>Martinus Pigome</p>\r\n\r\n<p>Alexander Gobai</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Staf Redaksi</strong></p>\r\n\r\n<p>Yustus Muyapa, Petrus Douw, Agustinus Keiya, Daniel Hagimuni, Marten Kadepa,  Marinus Gobai, Yudas Nawipa, Yulianus Nawipa, dan Theresia Tekege</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Koresponden</strong></p>\r\n\r\n<p>Melvin Yogi dan Emanuel Muyapa (Timika), Yosafat Muyapa, Malvin Yobe dan Simon Tebai (Jayapura), Petrus Yatipai (Manokwari), Yohanes Agapa (Paniai),  Herman Mote (Deiyai), Aprila Wayar  dan Yubal Awega Nawipa (Yogyakarta dan Solo), Frans Yube Pigai (Surabaya),  Anton Gobai (Manado) dan Pius Tenouye (Luar Negeri), Eman B Youw (Nabire).</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Kontributor</strong></p>\r\n\r\n<p>Misel Gobai, Sem Yeimo, Nomensen Douw, Yosep Bunai, Orgenes Bunai, Freedrik Todopi, Yunus Ekii Gobai, Stevanus Degei .</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>Layout</strong></p>\r\n\r\n<p>Noval</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>DITERBITKAN:</strong></p>\r\n\r\n<p>Situs berita online www.kabarmapegaa.com berdiri berdasar pada Akta Pendirian Perseroan Komanditer  CV. MEDIA KABAR MAPEGAA, Nomor: W30-U10/387/CV. HK.00/IX/2015 Tanggal: 13 September 2015.</p>', 'atas', 'aktif', 'Redaksional_kabarmapegaacom'),
('Formulir Pegaduan Ke Dewan Pers', 8, '<p>Pegaduan Ke Dewan Pers <a href=\"http://dewanpers.or.id/form_pengaduan\" target=\"_blank\">Klik disini</a> Untuk melihat formulir pengaduan dewan pers</p>', 'footer', 'aktif', 'Formulir_Pegaduan_Ke_Dewan_Pers'),
('Pedoman Siber', 9, '<h2><em>Pedoman Pemberitaan Media Siber</em></h2>\r\n\r\n<p> </p>\r\n\r\n<p>Kemerdekaan berpendapat, kemerdekaan berekspresi, dan kemerdekaan pers adalah hak asasi manusia yang dilindungi Pancasila, Undang-Undang Dasar 1945, dan Deklarasi Universal Hak Asasi Manusia PBB. Keberadaan media siber di Indonesia juga merupakan bagian dari kemerdekaan berpendapat, kemerdekaan berekspresi, dan kemerdekaan pers.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber memiliki karakter khusus sehingga memerlukan pedoman agar pengelolaannya dapat dilaksanakan secara profesional, memenuhi fungsi, hak, dan kewajibannya sesuai Undang-Undang Nomor 40 Tahun 1999 tentang Pers dan Kode Etik Jurnalistik.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Untuk itu Dewan Pers bersama organisasi pers, pengelola media siber, dan masyarakat menyusun Pedoman Pemberitaan Media Siber sebagai berikut:</p>\r\n\r\n<p> </p>\r\n\r\n<ol>\r\n <li><strong>Ruang Lingkup</strong><br>\r\n  </li>\r\n</ol>\r\n\r\n<ol>\r\n <li>Media Siber adalah segala bentuk media yang menggunakan wahana internet dan melaksanakan kegiatan jurnalistik, serta memenuhi persyaratan Undang-Undang Pers dan Standar Perusahaan Pers yang ditetapkan Dewan Pers.</li>\r\n</ol>\r\n\r\n<ol>\r\n <li>Isi Buatan Pengguna (User Generated Content) adalah segala isi yang dibuat dan atau dipublikasikan oleh pengguna media siber, antara lain, artikel, gambar, komentar, suara, video dan berbagai bentuk unggahan yang melekat pada media siber, seperti blog, forum, komentar pembaca atau pemirsa, dan bentuk lain.<br>\r\n  </li>\r\n</ol>\r\n\r\n<ol>\r\n <li><strong>Verifikasi dan keberimbangan berita</strong><br>\r\n  </li>\r\n</ol>\r\n\r\n<p>Pada prinsipnya setiap berita harus melalui verifikasi. Berita yang dapat merugikan pihak lain memerlukan verifikasi pada berita yang sama untuk memenuhi prinsip akurasi dan keberimbangan.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Ketentuan dalam butir (a) di atas dikecualikan, dengan syarat:</p>\r\n\r\n<p> </p>\r\n\r\n<p>Berita benar-benar mengandung kepentingan publik yang bersifat mendesak; Sumber berita yang pertama adalah sumber yang jelas disebutkan identitasnya, kredibel dan kompeten; Subyek berita yang harus dikonfirmasi tidak diketahui keberadaannya dan atau tidak dapat diwawancarai; Media memberikan penjelasan kepada pembaca bahwa berita tersebut masih memerlukan verifikasi lebih lanjut yang diupayakan dalam waktu secepatnya. Penjelasan dimuat pada bagian akhir dari berita yang sama, di dalam kurung dan menggunakan huruf miring.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Setelah memuat berita sesuai dengan butir (c), media wajib meneruskan upaya verifikasi, dan setelah verifikasi didapatkan, hasil verifikasi dicantumkan pada berita pemutakhiran (update) dengan tautan pada berita yang belum terverifikasi.</p>\r\n\r\n<p> </p>\r\n\r\n<ol>\r\n <li><strong>Isi Buatan Pengguna (User Generated Content)</strong></li>\r\n</ol>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber wajib mencantumkan syarat dan ketentuan mengenai Isi Buatan Pengguna yang tidak bertentangan dengan Undang-Undang No. 40 tahun 1999 tentang Pers dan Kode Etik Jurnalistik, yang ditempatkan secara terang dan jelas.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber mewajibkan setiap pengguna untuk melakukan registrasi keanggotaan dan melakukan proses log-in terlebih dahulu untuk dapat mempublikasikan semua bentuk Isi Buatan Pengguna. Ketentuan mengenai log-in akan diatur lebih lanjut. Dalam registrasi tersebut, media siber mewajibkan pengguna memberi persetujuan tertulis bahwa Isi Buatan Pengguna yang dipublikasikan:</p>\r\n\r\n<p> </p>\r\n\r\n<p>Tidak memuat isi bohong, fitnah, sadis dan cabul; Tidak memuat isi yang mengandung prasangka dan kebencian terkait dengan suku, agama, ras, dan antargolongan (SARA), serta menganjurkan tindakan kekerasan; Tidak memuat isi diskriminatif atas dasar perbedaan jenis kelamin dan bahasa, serta tidak merendahkan martabat orang lemah, miskin, sakit, cacat jiwa, atau cacat jasmani. Media siber memiliki kewenangan mutlak untuk mengedit atau menghapus Isi Buatan Pengguna yang bertentangan dengan butir (c).</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber wajib menyediakan mekanisme pengaduan Isi Buatan Pengguna yang dinilai melanggar ketentuan pada butir (c). Mekanisme tersebut harus disediakan di tempat yang dengan mudah dapat diakses pengguna. Media siber wajib menyunting, menghapus, dan melakukan tindakan koreksi setiap Isi Buatan Pengguna yang dilaporkan dan melanggar ketentuan butir (c), sesegera mungkin secara proporsional selambat-lambatnya 2 x 24 jam setelah pengaduan diterima.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber yang telah memenuhi ketentuan pada butir (a), (b), (c), dan (f) tidak dibebani tanggung jawab atas masalah yang ditimbulkan akibat pemuatan isi yang melanggar ketentuan pada butir (c).</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber bertanggung jawab atas Isi Buatan Pengguna yang dilaporkan bila tidak mengambil tindakan koreksi setelah batas waktu sebagaimana tersebut pada butir (f).</p>\r\n\r\n<p> </p>\r\n\r\n<ol>\r\n <li><strong>Ralat, Koreksi, dan Hak Jawab</strong></li>\r\n</ol>\r\n\r\n<p> </p>\r\n\r\n<p>Ralat, koreksi, dan hak jawab mengacu pada Undang-Undang Pers, Kode Etik Jurnalistik, dan Pedoman Hak Jawab yang ditetapkan Dewan Pers. Ralat, koreksi dan atau hak jawab wajib ditautkan pada berita yang diralat, dikoreksi atau yang diberi hak jawab. Di setiap berita ralat, koreksi, dan hak jawab wajib dicantumkan waktu pemuatan ralat, koreksi, dan atau hak jawab tersebut.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Bila suatu berita media siber tertentu disebarluaskan media siber lain, maka: Tanggung jawab media siber pembuat berita terbatas pada berita yang dipublikasikan di media siber tersebut atau media siber yang berada di bawah otoritas teknisnya; Koreksi berita yang dilakukan oleh sebuah media siber, juga harus dilakukan oleh media siber lain yang mengutip berita dari media siber yang dikoreksi itu;</p>\r\n\r\n<p> </p>\r\n\r\n<p>Media yang menyebarluaskan berita dari sebuah media siber dan tidak melakukan koreksi atas berita sesuai yang dilakukan oleh media siber pemilik dan atau pembuat berita tersebut, bertanggung jawab penuh atas semua akibat hukum dari berita yang tidak dikoreksinya itu. Sesuai dengan Undang-Undang Pers, media siber yang tidak melayani hak jawab dapat dijatuhi sanksi hukum pidana denda paling banyak Rp500.000.000 (Lima ratus juta rupiah).</p>\r\n\r\n<p> </p>\r\n\r\n<ol>\r\n <li><strong>Pencabutan Berita</strong></li>\r\n</ol>\r\n\r\n<p> </p>\r\n\r\n<p>Berita yang sudah dipublikasikan tidak dapat dicabut karena alasan penyensoran dari pihak luar redaksi, kecuali terkait masalah SARA, kesusilaan, masa depan anak, pengalaman traumatik korban atau berdasarkan pertimbangan khusus lain yang ditetapkan Dewan Pers. Media siber lain wajib mengikuti pencabutan kutipan berita dari media asal yang telah dicabut. Pencabutan berita wajib disertai dengan alasan pencabutan dan diumumkan kepada publik.</p>\r\n\r\n<p> </p>\r\n\r\n<ol>\r\n <li><strong>Iklan</strong></li>\r\n</ol>\r\n\r\n<p> </p>\r\n\r\n<p>Media siber wajib membedakan dengan tegas antara produk berita dan iklan. Setiap berita/artikel/isi yang merupakan iklan dan atau isi berbayar wajib mencantumkan keterangan .advertorial., .iklan., .ads., .sponsored., atau kata lain yang menjelaskan bahwa berita/artikel/isi tersebut adalah iklan.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>1. Hak Cipta</strong></p>\r\n\r\n<p><br>\r\nMedia siber wajib menghormati hak cipta sebagaimana diatur dalam peraturan perundang-undangan yang berlaku.</p>\r\n\r\n<p><br>\r\n<strong>2. Pencantuman Pedoman </strong></p>\r\n\r\n<p><br>\r\nMedia siber wajib mencantumkan Pedoman Pemberitaan Media Siber ini di medianya secara terang dan jelas.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>3. Sengketa </strong></p>\r\n\r\n<p><br>\r\nPenilaian akhir atas sengketa mengenai pelaksanaan Pedoman Pemberitaan Media Siber ini diselesaikan oleh Dewan Pers.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong><em>Jakarta, 3 Februari 2012 (Pedoman ini ditandatangani oleh Dewan Pers dan komunitas pers di Jakarta, 3 Februari 2012).</em></strong></p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', 'footer', 'aktif', 'Pedoman_Siber'),
('Kerja Sama', 10, '<p>Redaksi <em>KABAR MAPEGAA </em> menerima kerja sama pemberitaan dari berbagai pihak, selama kerja sama tersebut tidak bertentangan dengan asas, nurani, serta falsafah pendirian media ini.</p>', 'footer', 'aktif', 'Kerja_Sama'),
('Pasang Iklan', 12, '<p><strong>TARIF IKLAN</strong></p>\r\n\r\n<p> </p>\r\n\r\n<p>Kepada siapa saja yang Ingin memasang iklan di media <strong><em>kabarmapegaa.com, </em></strong>Maka, Berikut ini, Redaksi KABAR MAPEGAA.COM menawarkan biaya iklan sebagai berikut:</p>\r\n\r\n<p> </p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" xss=removed>\r\n <tbody>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>NO</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>NAMA (POSISI)</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>UKURAN</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>BIAYA</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>KET.</p>\r\n   </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>1</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Home Center Small</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>290 x 120 Pixels</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Rp. 5.000.000/Bulan</p>\r\n   </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>2</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Home Center</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>770 x 200 Pixels</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Rp. 15.000.000/Bulan</p>\r\n   </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>3</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Top Right Sidebar 2</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>320 x 280 Pixels</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Rp. 10.000.000/Bulan</p>\r\n   </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>4</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Top Right Sidebar</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>320 x 265 Pixels</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Rp. 12.000.000/Bulan</p>\r\n   </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed>\r\n   <p>5</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Top Header</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>650 x 100 Pixels</p>\r\n   </td>\r\n   <td xss=removed>\r\n   <p>Rp. 20.000.000/Bulan</p>\r\n   </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n  <tr>\r\n   <td xss=removed> </td>\r\n   <td xss=removed> </td>\r\n   <td xss=removed> </td>\r\n   <td xss=removed> </td>\r\n   <td xss=removed> </td>\r\n  </tr>\r\n </tbody>\r\n</table>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', 'atas', 'aktif', 'Pasang_Iklan'),
('DISCLAIMER', 13, '<p>Media Portal Online KABARMAPEGAA.COM dengan senang hati menyediakan informasi terkini seputar tanah Papua dan Papua Barat secara beragam dan berimbang juga memberikan apresiasi kepada para pembaca terhadap media ini yang setiap saat mengikuti dan membaca  tiap informasi yang dipubliskan oleh Jurnalis KABARMAPEGAA.COM. Para pembawa yang budiman, dalam pemberitaan musti harus ada beberapa poin yang diketahui dan dikuit oleh para pembaca, sebagai berikut:</p>\r\n\r\n<p> </p>\r\n\r\n<ul>\r\n <li>KABARMAPEGAA.COM melarang copy/paste isi konten (tulisan, foto dll) tanpa ijin/informasi dari KABARMAPEGAA.COM. Jika diambil, harap untuk mencantumkan sumber/link dan tinggalkan komentar.</li>\r\n <li>Iklan, sumbangan berita dan konten lainnya yang dikirim untuk dipublikasikan akan diperiksa terlebih dahulu. Misalnya yang mengandung unsur SARA, Pornografi, Perjudian atau tindakan negatif lainnya tidak diterima oleh redaksi KABARMAPEGAA.COM</li>\r\n <li>Jika terdapat perselisihan, KABARMAPEGAA.COM bersedia untuk menyelesaikan sesuai aturan Pers.</li>\r\n</ul>', 'footer', 'aktif', 'DISCLAIMER');

-- --------------------------------------------------------

--
-- Table structure for table `promosiiklan`
--

CREATE TABLE `promosiiklan` (
  `id_promosi` int(5) NOT NULL,
  `namaIklan` varchar(100) NOT NULL,
  `linkIklan` varchar(100) NOT NULL,
  `gambarIklan` blob NOT NULL,
  `status` varchar(10) NOT NULL,
  `posisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promosiiklan`
--

INSERT INTO `promosiiklan` (`id_promosi`, `namaIklan`, `linkIklan`, `gambarIklan`, `status`, `posisi`) VALUES
(7, 'Pasang Iklan Anda DIsini', 'kabarmapegaa.com', 0x66696c655f313536373937323738322e6a7067, 'aktif', 'bawah'),
(8, 'Calon DPR Papua Periode 2019-2024', 'kabarmapegaa.com', 0x66696c655f313536373937323733302e6a7067, 'aktif', 'tengah'),
(9, 'Pasang Iklan Anda Disini', 'kabarmapegaa.com', 0x66696c655f313536373937323730342e6a7067, 'aktif', 'bawah'),
(10, 'Pasang Iklan Anda Di sini', 'kabarmapegaa.com', 0x66696c655f313536373937323638332e6a7067, 'aktif', 'atas'),
(11, 'Pasan Iklan Anda Disini', 'kabarmapegaa.com', 0x66696c655f313536373937323635332e6a7067, 'aktif', 'atas');

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `id_share` int(10) NOT NULL,
  `nama_share` varchar(100) NOT NULL,
  `url_share` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id_tags` int(11) NOT NULL,
  `tags_name` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id_tags`, `tags_name`, `createdate`, `id_article`) VALUES
(1, 'Codeigniter', NULL, 2057),
(2, 'Api', NULL, 2057),
(3, 'NodeJs', NULL, 2057),
(4, 'Azure', NULL, 2057);

-- --------------------------------------------------------

--
-- Table structure for table `tampilkategori`
--

CREATE TABLE `tampilkategori` (
  `id_tampilkategori` int(10) NOT NULL,
  `id_categori` int(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tampilkategori`
--

INSERT INTO `tampilkategori` (`id_tampilkategori`, `id_categori`, `status`) VALUES
(2, 5, 'aktif'),
(3, 4, 'aktif'),
(4, 7, 'aktif'),
(5, 8, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tampilmenu`
--

CREATE TABLE `tampilmenu` (
  `id_tampilmenu` int(10) NOT NULL,
  `id_menu` int(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tampilmenu`
--

INSERT INTO `tampilmenu` (`id_tampilmenu`, `id_menu`, `status`) VALUES
(28, 51, 'aktif'),
(29, 64, 'aktif'),
(30, 54, 'aktif'),
(31, 57, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'gMPzWZNKthJfdvD.51pUE.', 1268889823, 1525881990, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int(10) NOT NULL,
  `id_categori` int(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `poster` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `keterangan` text NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id_video`, `id_categori`, `judul`, `link`, `poster`, `status`, `keterangan`, `createdate`) VALUES
(17, 1107, 'Ibadah Perayaan Natal 25 Desember 2020', 'http://youtube.com/topministry/ibadahnatal', 'N_top20200824033711.jpg', 1, 'Keterangan Ibadah Perayaan Natal 25 Desember 2020', '0000-00-00 00:00:00'),
(18, 1107, 'Metronic', 'https://www.youtube.com/embed/hNAti01dDWM', 'metronic_top20200824035928.png', 1, 'metronic theme', '0000-00-00 00:00:00'),
(19, 1107, 'Hilsong All for love song', 'https://www.youtube.com/embed/hNAti01dDWM', 'setaudio3_top20200828044935.png', 1, 'Hilsong All for love song', '0000-00-00 00:00:00'),
(12, 0, 'yyyyyyyyyyyy', '', 'nytimes1_top20200824004335.png', 0, 'yyyyyyyyyyyyyyyyyyyyyy', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminsetting`
--
ALTER TABLE `adminsetting`
  ADD PRIMARY KEY (`id_set`);

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indexes for table `albumfoto`
--
ALTER TABLE `albumfoto`
  ADD PRIMARY KEY (`id_album`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_article`) USING BTREE,
  ADD KEY `id_categori` (`id_categori`);
ALTER TABLE `berita` ADD FULLTEXT KEY `judul_berita` (`judul`,`content`);
ALTER TABLE `berita` ADD FULLTEXT KEY `index_name` (`judul`);

--
-- Indexes for table `blokmenu_berita`
--
ALTER TABLE `blokmenu_berita`
  ADD PRIMARY KEY (`id_blokmenu_berita`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `categori`
--
ALTER TABLE `categori`
  ADD PRIMARY KEY (`id_categori`);

--
-- Indexes for table `ewarta`
--
ALTER TABLE `ewarta`
  ADD PRIMARY KEY (`idewarta`),
  ADD KEY `FK__categori` (`id_categori`) USING BTREE;

--
-- Indexes for table `fotokabarperistiwa`
--
ALTER TABLE `fotokabarperistiwa`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `hakakses`
--
ALTER TABLE `hakakses`
  ADD PRIMARY KEY (`id_hakakses`);

--
-- Indexes for table `kerja_sama`
--
ALTER TABLE `kerja_sama`
  ADD PRIMARY KEY (`id_kerja_sama`);

--
-- Indexes for table `kontak_kami`
--
ALTER TABLE `kontak_kami`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indexes for table `lookup`
--
ALTER TABLE `lookup`
  ADD PRIMARY KEY (`idLookup`),
  ADD KEY `FK_lookup_lookupcategory` (`idLookupCategory`);

--
-- Indexes for table `lookupcategory`
--
ALTER TABLE `lookupcategory`
  ADD PRIMARY KEY (`idLookupCategory`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pengaturanweb`
--
ALTER TABLE `pengaturanweb`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indexes for table `profile_web`
--
ALTER TABLE `profile_web`
  ADD PRIMARY KEY (`id_profile_web`);

--
-- Indexes for table `promosiiklan`
--
ALTER TABLE `promosiiklan`
  ADD PRIMARY KEY (`id_promosi`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`id_share`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tags`),
  ADD KEY `FK_tags_berita` (`id_article`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `id_categori` (`id_categori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `albumfoto`
--
ALTER TABLE `albumfoto`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_article` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2081;

--
-- AUTO_INCREMENT for table `blokmenu_berita`
--
ALTER TABLE `blokmenu_berita`
  MODIFY `id_blokmenu_berita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `categori`
--
ALTER TABLE `categori`
  MODIFY `id_categori` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1108;

--
-- AUTO_INCREMENT for table `ewarta`
--
ALTER TABLE `ewarta`
  MODIFY `idewarta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fotokabarperistiwa`
--
ALTER TABLE `fotokabarperistiwa`
  MODIFY `id_foto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hakakses`
--
ALTER TABLE `hakakses`
  MODIFY `id_hakakses` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `kerja_sama`
--
ALTER TABLE `kerja_sama`
  MODIFY `id_kerja_sama` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kontak_kami`
--
ALTER TABLE `kontak_kami`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lookup`
--
ALTER TABLE `lookup`
  MODIFY `idLookup` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lookupcategory`
--
ALTER TABLE `lookupcategory`
  MODIFY `idLookupCategory` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `pengaturanweb`
--
ALTER TABLE `pengaturanweb`
  MODIFY `id_pengaturan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profile_web`
--
ALTER TABLE `profile_web`
  MODIFY `id_profile_web` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `promosiiklan`
--
ALTER TABLE `promosiiklan`
  MODIFY `id_promosi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `share`
--
ALTER TABLE `share`
  MODIFY `id_share` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tags` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `category` FOREIGN KEY (`id_categori`) REFERENCES `categori` (`id_categori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ewarta`
--
ALTER TABLE `ewarta`
  ADD CONSTRAINT `FK_ewarta_categori` FOREIGN KEY (`id_categori`) REFERENCES `categori` (`id_categori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lookup`
--
ALTER TABLE `lookup`
  ADD CONSTRAINT `FK_lookup_lookupcategory` FOREIGN KEY (`idLookupCategory`) REFERENCES `lookupcategory` (`idLookupCategory`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `FK_tags_berita` FOREIGN KEY (`id_article`) REFERENCES `berita` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
